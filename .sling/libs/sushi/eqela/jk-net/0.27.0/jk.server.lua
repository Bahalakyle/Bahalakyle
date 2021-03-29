jk = jk or {}

jk.server = jk.server or {}

jk.server.NetworkConnection = {}
jk.server.NetworkConnection.__index = jk.server.NetworkConnection
_vm:set_metatable(jk.server.NetworkConnection, {})

jk.server.NetworkConnection.idcounter = 0

function jk.server.NetworkConnection._create()
	local v = _vm:set_metatable({}, jk.server.NetworkConnection)
	return v
end

function jk.server.NetworkConnection:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.NetworkConnection'
	self['_isType.jk.server.NetworkConnection'] = true
	self.storageIndex = 0
	self.ioEntry = nil
	self.id = 0
	self.logContext = nil
	self.socket = nil
	self.lastActivity = 0
	self.remoteAddress = nil
	self.currentListenMode = -1
	self.manager = nil
	self.defaultListenMode = 1
end

function jk.server.NetworkConnection:_construct0()
	jk.server.NetworkConnection._init(self)
	self.id = (function() local v = _g.jk.server.NetworkConnection.idcounter _g.jk.server.NetworkConnection.idcounter = _g.jk.server.NetworkConnection.idcounter + 1 return v end)()
	return self
end

function jk.server.NetworkConnection:getId()
	do return self.id end
end

function jk.server.NetworkConnection:exportSocket()
	local v = self.socket
	self.socket = nil
	do return v end
end

function jk.server.NetworkConnection:getSocket()
	do return self.socket end
end

function jk.server.NetworkConnection:getManager()
	do return self.manager end
end

function jk.server.NetworkConnection:getLastActivity()
	do return self.lastActivity end
end

function jk.server.NetworkConnection:getRemoteAddress()
	if self.remoteAddress == nil then
		local ts = _vm:to_table_with_key(self.socket, '_isType.jk.socket.TCPSocket')
		if ts ~= nil then
			self.remoteAddress = _g.jk.lang.String:safeString(ts:getRemoteAddress()) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(ts:getRemotePort()))
		end
	end
	do return self.remoteAddress end
end

function jk.server.NetworkConnection:logDebug(text)
	do _g.jk.log.Log:debug(self.logContext, "[Connection:" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self:getId())) .. "] " .. _g.jk.lang.String:safeString(text)) end
end

function jk.server.NetworkConnection:logInfo(text)
	do _g.jk.log.Log:info(self.logContext, "[Connection:" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self:getId())) .. "] " .. _g.jk.lang.String:safeString(text)) end
end

function jk.server.NetworkConnection:logWarning(text)
	do _g.jk.log.Log:warning(self.logContext, "[Connection:" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self:getId())) .. "] " .. _g.jk.lang.String:safeString(text)) end
end

function jk.server.NetworkConnection:logError(text)
	do _g.jk.log.Log:error(self.logContext, "[Connection:" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self:getId())) .. "] " .. _g.jk.lang.String:safeString(text)) end
end

function jk.server.NetworkConnection:onActivity()
	self.lastActivity = _g.jk.time.SystemClock:asSeconds()
end

function jk.server.NetworkConnection:initialize()
	do return true end
end

function jk.server.NetworkConnection:cleanup()
end

function jk.server.NetworkConnection:doInitialize(logContext, socket, manager)
	self.logContext = logContext
	self.socket = socket
	self.manager = manager
	if not self:initialize() then
		do return false end
	end
	do self:onActivity() end
	do return true end
end

function jk.server.NetworkConnection:getIoEntry()
	do return self.ioEntry end
end

function jk.server.NetworkConnection:setIoEntry(entry)
	local v = false
	self.ioEntry = entry
	self.currentListenMode = -1
	if entry ~= nil then
		v = self:setListenMode(self:getDefaultListenMode())
	end
	do return v end
end

function jk.server.NetworkConnection:sendData(data, size)
	if self.socket == nil then
		do return 0 end
	end
	do
		local v = self.socket:write(data, size)
		if v < 0 then
			do self:close() end
		end
		do self:onActivity() end
		do return v end
	end
end

function jk.server.NetworkConnection:close()
	local ss = self.socket
	self.socket = nil
	if self.ioEntry ~= nil then
		do self.ioEntry:remove() end
		self.ioEntry = nil
	end
	if ss ~= nil then
		do ss:close() end
	end
	if self.manager ~= nil then
		do self.manager:onConnectionClosed(self) end
	end
	do self:cleanup() end
	do self:onClosed() end
	self.socket = nil
	self.manager = nil
end

function jk.server.NetworkConnection:closeSocket()
	if self.socket ~= nil then
		do self.socket:close() end
	end
end

function jk.server.NetworkConnection:onReadReady()
	if not (self.socket ~= nil) then
		do return end
	end
	do
		local recvBuffer = nil
		if self.manager ~= nil then
			recvBuffer = self.manager:getReceiveBuffer()
		end
		if recvBuffer == nil then
			recvBuffer = _util:allocate_buffer(1024)
		end
		do
			local n = self.socket:read(recvBuffer)
			if n < 0 then
				do self:close() end
			else
				do self:onDataReceived(recvBuffer, n) end
			end
			do self:onActivity() end
		end
	end
end

function jk.server.NetworkConnection:onWriteReady()
end

function jk.server.NetworkConnection:enableIdleMode()
	do return self:setListenMode(0) end
end

function jk.server.NetworkConnection:enableReadMode()
	do return self:setListenMode(1) end
end

function jk.server.NetworkConnection:enableWriteMode()
	do return self:setListenMode(2) end
end

function jk.server.NetworkConnection:enableReadWriteMode()
	do return self:setListenMode(3) end
end

function jk.server.NetworkConnection:setListenMode(n)
	if self.ioEntry == nil then
		self.defaultListenMode = n
		do return true end
	end
	if n == self.currentListenMode then
		do return true end
	end
	self.currentListenMode = n
	do
		local v = false
		if n == 0 then
			v = self.ioEntry:setListeners(nil, nil)
		elseif n == 1 then
			v = self.ioEntry:setListeners(function()
				do self:onReadReady() end
			end, nil)
		elseif n == 2 then
			v = self.ioEntry:setListeners(nil, function()
				do self:onWriteReady() end
			end)
		elseif n == 3 then
			v = self.ioEntry:setListeners(function()
				do self:onReadReady() end
			end, function()
				do self:onWriteReady() end
			end)
		end
		if not v then
			do _g.jk.log.Log:error(self.logContext, "Failed to set socket listening mode to " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(n))) end
		end
		do return v end
	end
end

function jk.server.NetworkConnection:onOpened()
end

function jk.server.NetworkConnection:onDataReceived(data, size)
end

function jk.server.NetworkConnection:onClosed()
end

function jk.server.NetworkConnection:onError(message)
end

function jk.server.NetworkConnection:getStorageIndex()
	do return self.storageIndex end
end

function jk.server.NetworkConnection:setStorageIndex(v)
	self.storageIndex = v
	do return self end
end

function jk.server.NetworkConnection:getDefaultListenMode()
	do return self.defaultListenMode end
end

function jk.server.NetworkConnection:setDefaultListenMode(v)
	self.defaultListenMode = v
	do return self end
end

jk.server.NetworkConnectionManager = {}
jk.server.NetworkConnectionManager.__index = jk.server.NetworkConnectionManager
_vm:set_metatable(jk.server.NetworkConnectionManager, {})

function jk.server.NetworkConnectionManager._create()
	local v = _vm:set_metatable({}, jk.server.NetworkConnectionManager)
	return v
end

function jk.server.NetworkConnectionManager:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.NetworkConnectionManager'
	self['_isType.jk.server.NetworkConnectionManager'] = true
	self.logContext = nil
	self.ioManager = nil
	self.maxConnections = 100000
	self.recvBufferSize = 32768
	self.keyFile = nil
	self.certFile = nil
	self.acceptInvalidCertificate = false
	self.passphrase = nil
	self.connections = nil
	self.recvBuffer = nil
end

function jk.server.NetworkConnectionManager:_construct0()
	jk.server.NetworkConnectionManager._init(self)
	return self
end

jk.server.NetworkConnectionManager.ConnectionPool = {}
jk.server.NetworkConnectionManager.ConnectionPool.__index = jk.server.NetworkConnectionManager.ConnectionPool
_vm:set_metatable(jk.server.NetworkConnectionManager.ConnectionPool, {})

function jk.server.NetworkConnectionManager.ConnectionPool._create()
	local v = _vm:set_metatable({}, jk.server.NetworkConnectionManager.ConnectionPool)
	return v
end

function jk.server.NetworkConnectionManager.ConnectionPool:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.NetworkConnectionManager.ConnectionPool'
	self['_isType.jk.server.NetworkConnectionManager.ConnectionPool'] = true
	self.connections = nil
	self.nConnection = 0
end

function jk.server.NetworkConnectionManager.ConnectionPool:_construct0()
	jk.server.NetworkConnectionManager.ConnectionPool._init(self)
	return self
end

function jk.server.NetworkConnectionManager.ConnectionPool:initialize(logContext, maxConnections)
	self.connections = _vm:allocate_array(maxConnections)
	do return true end
end

function jk.server.NetworkConnectionManager.ConnectionPool:add(logContext, conn)
	if self.nConnection >= #self.connections then
		do _g.jk.log.Log:error(logContext, "Maximum number of connections exceeded.") end
		do return -1 end
	end
	self.connections[self.nConnection + 1] = conn
	do
		local v = self.nConnection
		do self.nConnection = self.nConnection + 1 end
		do _g.jk.log.Log:debug(logContext, "Added connection to connection pool: Now " .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.nConnection))) .. " connections") end
		do return v end
	end
end

function jk.server.NetworkConnectionManager.ConnectionPool:remove(logContext, index)
	if index < 0 or index >= self.nConnection then
		do return false end
	end
	if not (self.connections[index + 1] ~= nil) then
		do return false end
	end
	do
		local last = self.nConnection - 1
		if last == index then
			self.connections[index + 1] = nil
			do self.nConnection = self.nConnection - 1 end
		else
			self.connections[index + 1] = self.connections[last + 1]
			self.connections[last + 1] = nil
			do
				local ci = self.connections[index + 1]
				do ci:setStorageIndex(index) end
				do self.nConnection = self.nConnection - 1 end
			end
		end
		do _g.jk.log.Log:debug(logContext, "Removed connection from connection pool: Now " .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.nConnection))) .. " connections") end
		do return true end
	end
end

jk.server.NetworkConnectionManager.ConnectionIterator = {}
jk.server.NetworkConnectionManager.ConnectionIterator.__index = jk.server.NetworkConnectionManager.ConnectionIterator
_vm:set_metatable(jk.server.NetworkConnectionManager.ConnectionIterator, {})

function jk.server.NetworkConnectionManager.ConnectionIterator._create()
	local v = _vm:set_metatable({}, jk.server.NetworkConnectionManager.ConnectionIterator)
	return v
end

function jk.server.NetworkConnectionManager.ConnectionIterator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.NetworkConnectionManager.ConnectionIterator'
	self['_isType.jk.server.NetworkConnectionManager.ConnectionIterator'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.pool = nil
	self.current = -1
end

function jk.server.NetworkConnectionManager.ConnectionIterator:_construct0()
	jk.server.NetworkConnectionManager.ConnectionIterator._init(self)
	return self
end

function jk.server.NetworkConnectionManager.ConnectionIterator:next()
	if not (self.pool ~= nil) then
		do return nil end
	end
	do
		local nn = self.current + 1
		if nn >= self.pool.nConnection then
			do return nil end
		end
		do
			local connection = _vm:to_table_with_key(self.pool.connections[nn + 1], '_isType.jk.server.NetworkConnection')
			if not (connection ~= nil) then
				do return nil end
			end
			self.current = nn
			do return connection end
		end
	end
end

function jk.server.NetworkConnectionManager.ConnectionIterator:hasNext()
	if not (self.pool ~= nil) then
		do return false end
	end
	if not (self.current + 1 < self.pool.nConnection - 1) then
		do return false end
	end
	do return true end
end

function jk.server.NetworkConnectionManager.ConnectionIterator:getPool()
	do return self.pool end
end

function jk.server.NetworkConnectionManager.ConnectionIterator:setPool(v)
	self.pool = v
	do return self end
end

function jk.server.NetworkConnectionManager:createConnectionObject()
end

function jk.server.NetworkConnectionManager:setLogContext(ctx)
	self.logContext = ctx
	do return self end
end

function jk.server.NetworkConnectionManager:getLogContext()
	do return self.logContext end
end

function jk.server.NetworkConnectionManager:setIoManager(io)
	self.ioManager = io
	do return self end
end

function jk.server.NetworkConnectionManager:getIoManager()
	do return self.ioManager end
end

function jk.server.NetworkConnectionManager:iterateConnections()
	do return _g.jk.server.NetworkConnectionManager.ConnectionIterator._construct0(_g.jk.server.NetworkConnectionManager.ConnectionIterator._create()):setPool(self.connections) end
end

function jk.server.NetworkConnectionManager:forEachConnection(_function)
	local it = self:iterateConnections()
	if not (it ~= nil) then
		do return end
	end
	while true do
		local cc = it:next()
		if cc == nil then
			do break end
		end
		do _function(cc) end
	end
end

function jk.server.NetworkConnectionManager:isInitialized()
	do return self.connections ~= nil end
end

function jk.server.NetworkConnectionManager:initialize1(ioManager, logContext)
	if not (ioManager ~= nil) then
		do return false end
	end
	do self:setLogContext(logContext) end
	do self:setIoManager(ioManager) end
	do return self:initialize2() end
end

function jk.server.NetworkConnectionManager:initialize2()
	if self.connections ~= nil then
		do _g.jk.log.Log:error(self.logContext, "Already initialized") end
		do return false end
	end
	if not (self.ioManager ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "No IO manager configured for connection server") end
		do return false end
	end
	self.recvBuffer = _util:allocate_buffer(self.recvBufferSize)
	if not (self.recvBuffer ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "Failed to allocate recv buffer") end
		do return false end
	end
	self.connections = _g.jk.server.NetworkConnectionManager.ConnectionPool._construct0(_g.jk.server.NetworkConnectionManager.ConnectionPool._create())
	if not self.connections:initialize(self.logContext, self.maxConnections) then
		do _g.jk.log.Log:error(self.logContext, "Failed to initialize connection pool") end
		self.connections = nil
		self.recvBuffer = nil
		do return false end
	end
	do return true end
end

function jk.server.NetworkConnectionManager:cleanup()
	self.connections = nil
end

function jk.server.NetworkConnectionManager:onNewSocket(socket)
	local s = socket
	if not (s ~= nil) then
		do return end
	end
	if self.certFile ~= nil then
		local sslSocket = _g.jk.socket.ssl.SSLSocket:forServer(s, self.certFile, self.keyFile, self.logContext, self.acceptInvalidCertificate, self.passphrase)
		if not (sslSocket ~= nil) then
			do _g.jk.log.Log:error(self.logContext, "Failed to create SSL socket") end
			do s:close() end
			do return end
		end
		s = sslSocket
		do _g.jk.log.Log:debug(self.logContext, "SSL socket created successfully") end
	end
	do
		local connection = self:createConnectionObject()
		if not (connection ~= nil) then
			do _g.jk.log.Log:error(self.logContext, "Failed to create TCP server connection object instance for incoming connection") end
			do s:close() end
			do return end
		end
		if not connection:doInitialize(self.logContext, s, self) then
			do _g.jk.log.Log:error(self.logContext, "Failed to initialize the new connection instance. Closing connection.") end
			do s:close() end
			do return end
		end
		if not self:addConnection(connection) then
			do _g.jk.log.Log:error(self.logContext, "Failed to add a new connection instance. Closing connection.") end
			do connection:close() end
			do return end
		end
		do connection:onOpened() end
	end
end

function jk.server.NetworkConnectionManager:addConnection(connection)
	if not (connection ~= nil and self.ioManager ~= nil) then
		do return false end
	end
	do
		local es = self.ioManager:add(connection:getSocket())
		if not (es ~= nil) then
			do return false end
		end
		if not connection:setIoEntry(es) then
			do es:remove() end
			do return false end
		end
		do
			local idx = self.connections:add(self.logContext, connection)
			if idx < 0 then
				do return false end
			end
			do connection:setStorageIndex(idx) end
			do return true end
		end
	end
end

function jk.server.NetworkConnectionManager:onConnectionClosed(connection)
	if not (connection ~= nil) then
		do return end
	end
	do connection:closeSocket() end
	do
		local es = connection:getIoEntry()
		if es ~= nil then
			do es:remove() end
			do connection:setIoEntry(nil) end
		end
		do
			local si = connection:getStorageIndex()
			if si >= 0 then
				do self.connections:remove(self.logContext, si) end
				do connection:setStorageIndex(-1) end
			end
		end
	end
end

function jk.server.NetworkConnectionManager:getReceiveBuffer()
	do return self.recvBuffer end
end

function jk.server.NetworkConnectionManager:getMaxConnections()
	do return self.maxConnections end
end

function jk.server.NetworkConnectionManager:setMaxConnections(v)
	self.maxConnections = v
	do return self end
end

function jk.server.NetworkConnectionManager:getRecvBufferSize()
	do return self.recvBufferSize end
end

function jk.server.NetworkConnectionManager:setRecvBufferSize(v)
	self.recvBufferSize = v
	do return self end
end

function jk.server.NetworkConnectionManager:getKeyFile()
	do return self.keyFile end
end

function jk.server.NetworkConnectionManager:setKeyFile(v)
	self.keyFile = v
	do return self end
end

function jk.server.NetworkConnectionManager:getCertFile()
	do return self.certFile end
end

function jk.server.NetworkConnectionManager:setCertFile(v)
	self.certFile = v
	do return self end
end

function jk.server.NetworkConnectionManager:getAcceptInvalidCertificate()
	do return self.acceptInvalidCertificate end
end

function jk.server.NetworkConnectionManager:setAcceptInvalidCertificate(v)
	self.acceptInvalidCertificate = v
	do return self end
end

function jk.server.NetworkConnectionManager:getPassphrase()
	do return self.passphrase end
end

function jk.server.NetworkConnectionManager:setPassphrase(v)
	self.passphrase = v
	do return self end
end

jk.server.NetworkServer = _g.jk.server.NetworkConnectionManager._create()
jk.server.NetworkServer.__index = jk.server.NetworkServer
_vm:set_metatable(jk.server.NetworkServer, {
	__index = _g.jk.server.NetworkConnectionManager
})

function jk.server.NetworkServer._create()
	local v = _vm:set_metatable({}, jk.server.NetworkServer)
	return v
end

function jk.server.NetworkServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.NetworkServer'
	self['_isType.jk.server.NetworkServer'] = true
	self.port = 0
	self.socket = nil
	self.esocket = nil
	self.acceptBatchSize = 0
end

function jk.server.NetworkServer:_construct0()
	jk.server.NetworkServer._init(self)
	do _g.jk.server.NetworkConnectionManager._construct0(self) end
	return self
end

function jk.server.NetworkServer:initialize2()
	if not _g.jk.server.NetworkConnectionManager.initialize2(self) then
		do return false end
	end
	if not ((function()
		self.socket = _g.jk.socket.TCPSocket:createAndListen(self.port)
		do return self.socket end
	end)() ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "Failed to listen on TCP port " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.port))) end
		do self:cleanup() end
		do return false end
	end
	if self.socket:setBlocking(false) == true then
		self.acceptBatchSize = 1024
	else
		self.acceptBatchSize = 1
	end
	if not ((function()
		self.esocket = self.ioManager:addWithReadListener(self.socket, function()
			do self:onIncomingConnection() end
		end)
		do return self.esocket end
	end)() ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "Failed to register with event loop") end
		do self:cleanup() end
		do return false end
	end
	do _g.jk.log.Log:info(self.logContext, "TCP server initialized, listening on port " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.port))) end
	do return true end
end

function jk.server.NetworkServer:cleanup()
	if self.esocket ~= nil then
		do self.esocket:remove() end
		self.esocket = nil
	end
	if self.socket ~= nil then
		do self.socket:close() end
		self.socket = nil
	end
	do _g.jk.server.NetworkConnectionManager.cleanup(self) end
end

function jk.server.NetworkServer:onIncomingConnection()
	do
		local _status, _err = _vm:execute_protected_call(function()
			local n = 0
			while true do
				if n >= self.acceptBatchSize then
					do break end
				end
				do
					local nn = self.socket:accept()
					if not (nn ~= nil) then
						do break end
					end
					do self:onNewSocket(nn) end
					do n = n + 1 end
				end
			end
		end)
		if _err then
			local e = _err
			do _g.jk.log.Log:error(self.logContext, "onIncomingConnection: " .. _g.jk.lang.String:safeString(_g.jk.log.Log:asString(self.logContext, e))) end
		end
	end
end

function jk.server.NetworkServer:getPort()
	do return self.port end
end

function jk.server.NetworkServer:setPort(v)
	self.port = v
	do return self end
end

jk.server.SimpleConfigFile = {}
jk.server.SimpleConfigFile.__index = jk.server.SimpleConfigFile
_vm:set_metatable(jk.server.SimpleConfigFile, {})

function jk.server.SimpleConfigFile._create()
	local v = _vm:set_metatable({}, jk.server.SimpleConfigFile)
	return v
end

function jk.server.SimpleConfigFile:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.SimpleConfigFile'
	self['_isType.jk.server.SimpleConfigFile'] = true
	self.data = nil
	self.mapData = nil
	self.file = nil
end

function jk.server.SimpleConfigFile:forFile(file)
	local v = _g.jk.server.SimpleConfigFile._construct0(_g.jk.server.SimpleConfigFile._create())
	if not v:read(file) then
		do return nil end
	end
	do return v end
end

function jk.server.SimpleConfigFile:forMap(map)
	local v = _g.jk.server.SimpleConfigFile._construct0(_g.jk.server.SimpleConfigFile._create())
	do v:setDataAsMap(map) end
	do return v end
end

function jk.server.SimpleConfigFile:readFileAsMap(file)
	local cf = _g.jk.server.SimpleConfigFile:forFile(file)
	if not (cf ~= nil) then
		do return nil end
	end
	do return cf:getDataAsMap() end
end

function jk.server.SimpleConfigFile:_construct0()
	jk.server.SimpleConfigFile._init(self)
	self.data = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
	return self
end

function jk.server.SimpleConfigFile:getFile()
	do return self.file end
end

function jk.server.SimpleConfigFile:getRelativeFile(fileName)
	if not (self.file ~= nil) then
		do return nil end
	end
	if not (fileName ~= nil) then
		do return nil end
	end
	do
		local p = self.file:getParent()
		if not (p ~= nil) then
			do return nil end
		end
		do return p:entry(fileName) end
	end
end

function jk.server.SimpleConfigFile:clear()
	do self.data:clear() end
	self.mapData = nil
end

function jk.server.SimpleConfigFile:setDataAsMap(map)
	do self:clear() end
	do
		local keys = map:iterateKeys()
		while keys ~= nil do
			local key = keys:next()
			if not (key ~= nil) then
				do break end
			end
			do self.data:add(key, map:getString(key, nil)) end
		end
		do return self end
	end
end

function jk.server.SimpleConfigFile:getDataAsMap()
	if not (self.mapData ~= nil) then
		self.mapData = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do
			local it = self.data:iterate()
			while it ~= nil do
				local kvp = it:next()
				if not (kvp ~= nil) then
					do break end
				end
				do self.mapData:setString(kvp.key, kvp.value) end
			end
		end
	end
	do return self.mapData end
end

function jk.server.SimpleConfigFile:getDynamicMapValue(key, defval)
	local str = self:getStringValue(key, nil)
	if not (str ~= nil) then
		do return defval end
	end
	do
		local v = _vm:to_table_with_key(_g.jk.json.JSONParser:parseString(str), '_isType.jk.lang.DynamicMap')
		if not (v ~= nil) then
			do return defval end
		end
		do return v end
	end
end

function jk.server.SimpleConfigFile:getDynamicVectorValue(key, defval)
	local str = self:getStringValue(key, nil)
	if not (str ~= nil) then
		do return defval end
	end
	do
		local v = _vm:to_table_with_key(_g.jk.json.JSONParser:parseString(str), '_isType.jk.lang.DynamicVector')
		if not (v ~= nil) then
			do return defval end
		end
		do return v end
	end
end

function jk.server.SimpleConfigFile:getStringValue(key, defval)
	local map = self:getDataAsMap()
	if not (map ~= nil) then
		do return defval end
	end
	do
		local v = map:getString(key, nil)
		if not (v ~= nil) then
			do return defval end
		end
		if _g.jk.lang.String:startsWith(v, "\"\"\"\n", 0) and _g.jk.lang.String:endsWith(v, "\n\"\"\"") then
			v = _g.jk.lang.String:getSubString(v, 4, _g.jk.lang.String:getLength(v) - 8)
		end
		do return v end
	end
end

function jk.server.SimpleConfigFile:getIntegerValue(key, defval)
	local map = self:getDataAsMap()
	if not (map ~= nil) then
		do return defval end
	end
	do return map:getInteger(key, defval) end
end

function jk.server.SimpleConfigFile:getDoubleValue(key, defval)
	local map = self:getDataAsMap()
	if not (map ~= nil) then
		do return defval end
	end
	do return map:getDouble(key, defval) end
end

function jk.server.SimpleConfigFile:getBooleanValue(key, defval)
	local map = self:getDataAsMap()
	if not (map ~= nil) then
		do return defval end
	end
	do return map:getBoolean(key, defval) end
end

function jk.server.SimpleConfigFile:getFileValue(key, defval)
	local v = self:getRelativeFile(self:getStringValue(key, nil))
	if not (v ~= nil) then
		do return defval end
	end
	do return v end
end

function jk.server.SimpleConfigFile:iterate()
	if not (self.data ~= nil) then
		do return nil end
	end
	do return self.data:iterate() end
end

function jk.server.SimpleConfigFile:read(file)
	if not (file ~= nil) then
		do return false end
	end
	do
		local reader = file:read()
		if not (reader ~= nil) then
			do return false end
		end
		do
			local ins = _g.jk.io.PrintReader:forReader(reader)
			local line = nil
			local tag = nil
			local lineBuffer = nil
			local terminator = nil
			while (function()
				line = ins:readLine()
				do return line end
			end)() ~= nil do
				if lineBuffer ~= nil then
					do lineBuffer:appendString(line) end
					if line == terminator then
						line = lineBuffer:toString()
						lineBuffer = nil
						terminator = nil
					else
						do lineBuffer:appendCharacter(10) end
						goto _continue1
					end
				end
				line = _g.jk.lang.String:strip(line)
				if _g.jk.lang.String:isEmpty(line) or _g.jk.lang.String:startsWith(line, "#", 0) then
					goto _continue1
				end
				if _g.jk.lang.String:endsWith(line, "{") then
					if _g.jk.lang.String:getIndexOfCharacter(line, 58, 0) < 0 then
						if not (tag ~= nil) then
							tag = _g.jk.lang.String:strip(_g.jk.lang.String:getSubString(line, 0, _g.jk.lang.String:getLength(line) - 1))
						end
						goto _continue1
					else
						lineBuffer = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
						do lineBuffer:appendString(line) end
						do lineBuffer:appendCharacter(10) end
						terminator = "}"
						goto _continue1
					end
				end
				if _g.jk.lang.String:endsWith(line, "[") then
					lineBuffer = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do lineBuffer:appendString(line) end
					do lineBuffer:appendCharacter(10) end
					terminator = "]"
					goto _continue1
				end
				if _g.jk.lang.String:endsWith(line, "\"\"\"") then
					lineBuffer = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do lineBuffer:appendString(line) end
					do lineBuffer:appendCharacter(10) end
					terminator = "\"\"\""
					goto _continue1
				end
				if tag ~= nil and line == "}" then
					tag = nil
					goto _continue1
				end
				do
					local sp = _g.jk.lang.String:split(line, 58, 2)
					if not (sp ~= nil) then
						goto _continue1
					end
					do
						local key = _g.jk.lang.String:strip(_g.jk.lang.Vector:get(sp, 0))
						local val = _g.jk.lang.String:strip(_g.jk.lang.Vector:get(sp, 1))
						if _g.jk.lang.String:startsWith(val, "\"", 0) and _g.jk.lang.String:endsWith(val, "\"") then
							val = _g.jk.lang.String:getSubString(val, 1, _g.jk.lang.String:getLength(val) - 2)
						end
						if _g.jk.lang.String:isEmpty(key) then
							goto _continue1
						end
						if tag ~= nil then
							key = _g.jk.lang.String:safeString(key) .. "[" .. _g.jk.lang.String:safeString(tag) .. "]"
						end
						do self.data:add(key, val) end
					end
				end
				::_continue1::
			end
			self.file = file
			do reader:close() end
			do return true end
		end
	end
end

function jk.server.SimpleConfigFile:write(outfile)
	if not (outfile ~= nil) then
		do return false end
	end
	if not (self.data ~= nil) then
		do return false end
	end
	do
		local wr = outfile:write()
		if not (wr ~= nil) then
			do return false end
		end
		do
			local os = _g.jk.io.PrintWriterWrapper:forWriter(wr)
			if os ~= nil then
				local it = self.data:iterate()
				while it ~= nil do
					local kvp = it:next()
					if not (kvp ~= nil) then
						do break end
					end
					do os:println(_g.jk.lang.String:safeString(kvp.key) .. ": " .. _g.jk.lang.String:safeString(kvp.value)) end
				end
			end
			do wr:close() end
			do return true end
		end
	end
end

jk.server.CommonServer = {}
jk.server.CommonServer.__index = jk.server.CommonServer
_vm:set_metatable(jk.server.CommonServer, {})

function jk.server.CommonServer._create()
	local v = _vm:set_metatable({}, jk.server.CommonServer)
	return v
end

function jk.server.CommonServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.CommonServer'
	self['_isType.jk.server.CommonServer'] = true
	self.listenPort = 0
	self.loggingDirectory = nil
	self.configFile = nil
	self.enableDebugMessages = false
	self.duplicateLoggingOnConsole = false
	self.ctx = nil
	self.configuration = {}
end

function jk.server.CommonServer:_construct0()
	jk.server.CommonServer._init(self)
	self.ctx = _g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create())
	do self:initConfigValue("LISTEN_PORT", "8080") end
	do self:initConfigValue("LOGGING_DIRECTORY", nil) end
	do self:initConfigValue("ENABLE_DEBUG_MESSAGES", "false") end
	do self:initConfigValue("DUPLICATE_LOGGING_ON_CONSOLE", "false") end
	return self
end

function jk.server.CommonServer:getLoggingDirectory()
	do return self.loggingDirectory end
end

function jk.server.CommonServer:getListenPort()
	do return self.listenPort end
end

function jk.server.CommonServer:getConfigfromEnvironment(name)
	if not (name ~= nil) then
		do return nil end
	end
	do
		local depvar = "SYMPATHY_" .. _g.jk.lang.String:safeString(name)
		local v = _g.jk.env.EnvironmentVariable:get(depvar)
		if v ~= nil then
			do _g.jk.log.Log:warning(self.ctx, "Accepting deprecated configuration variable `" .. _g.jk.lang.String:safeString(depvar) .. "'. Use `" .. _g.jk.lang.String:safeString(name) .. "' instead.") end
			do return v end
		end
		do return _g.jk.env.EnvironmentVariable:get(name) end
	end
end

function jk.server.CommonServer:getConfigFileDirectory()
	if self.configFile == nil then
		do return nil end
	end
	do return self.configFile:getParent() end
end

function jk.server.CommonServer:onMaintenance()
end

function jk.server.CommonServer:initConfigValue(key, defaultValue)
	if not (key ~= nil) then
		do return end
	end
	do
		local vv = self:getConfigfromEnvironment(key)
		if not (vv ~= nil) then
			vv = defaultValue
		end
		do self:doConfigure(key, vv, nil) end
	end
end

function jk.server.CommonServer:setConfigValue(key, value)
	do self:doConfigure(key, value, nil) end
	do return self end
end

function jk.server.CommonServer:configure(key, value, relativeTo, error)
	if key == "LISTEN_PORT" or key == "listenPort" then
		self.listenPort = _g.jk.lang.Integer:asInteger(value)
		do return true end
	end
	if key == "LOGGING_DIRECTORY" or key == "loggingDirectory" then
		if _g.jk.lang.String:isNotEmpty(value) then
			self.loggingDirectory = _g.jk.fs.File:forRelativePath(value, relativeTo, false)
		else
			self.loggingDirectory = nil
		end
		do return true end
	end
	if key == "ENABLE_DEBUG_MESSAGES" or key == "enableDebugMessages" then
		self.enableDebugMessages = _g.jk.lang.Boolean:asBoolean(value, false)
		do return true end
	end
	if key == "DUPLICATE_LOGGING_ON_CONSOLE" or key == "duplicateLoggingOnConsole" then
		self.duplicateLoggingOnConsole = _g.jk.lang.Boolean:asBoolean(value, false)
		do return true end
	end
	do return false end
end

function jk.server.CommonServer:doConfigure(key, value, relativeTo)
	local error = _g.jk.lang.Error._construct0(_g.jk.lang.Error._create())
	local vv = value
	if not (vv ~= nil) then
		vv = ""
	end
	if self:configure(key, vv, relativeTo, error) == false then
		if _g.jk.lang.String:isEmpty(error:getCode()) then
			do error:setCode("unsupportedConfigurationOption") end
			do error:setDetail(key) end
		end
		do _g.jk.log.Log:error(self.ctx, _g.jk.log.Log:asString(self.ctx, error)) end
		do return false end
	end
	do _g.jk.lang.Map:set(self.configuration, key, vv) end
	do return true end
end

function jk.server.CommonServer:printUsage(stdout)
	local flags = {
		{
			"debug",
			"Enable debug messages in logging"
		},
		{
			"v|version|vv",
			"Display version information"
		},
		{
			"h|help",
			"Usage information"
		}
	}
	local options = {
		{
			"config",
			"Specify a configuration file to use"
		},
		{
			"listen",
			"Specify the TCP port to listen to"
		},
		{
			"O<option>",
			"Manually specify configuration parameters (key/value pairs)"
		}
	}
	do _g.jk.console.ConsoleApplicationUtil:printUsage(stdout, nil, nil, flags, options) end
end

function jk.server.CommonServer:printHeader(stdout)
end

function jk.server.CommonServer:printVersion(stdout, longFormat)
end

function jk.server.CommonServer:logServerConfiguration()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString("Server configuration:") end
	do
		local keys = _g.jk.lang.Map:getKeys(self.configuration)
		do _g.jk.lang.Vector:sortAsStrings(keys) end
		if keys ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(keys)
			do
				n = 0
				while n < m do
					local key = keys[n + 1]
					if key ~= nil then
						do sb:appendString("\n  ") end
						do sb:appendString(key) end
						do sb:appendString(": ") end
						do sb:appendString(_g.jk.lang.Map:get(self.configuration, key)) end
					end
					do n = n + 1 end
				end
			end
		end
		do _g.jk.log.Log:info(self.ctx, sb:toString()) end
	end
end

function jk.server.CommonServer:acceptCommandLineArgument(arg)
	do return false end
end

function jk.server.CommonServer:execute(args)
	local stdout = _g.jk.console.Stdout:instance()
	local arguments = _g.jk.console.ConsoleApplicationUtil:parseCommandLineArguments(args)
	if arguments ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(arguments)
		do
			n = 0
			while n < m do
				local arg = arguments[n + 1]
				if arg ~= nil then
					if arg:isFlag2("v") or arg:isFlag2("version") then
						do self:printVersion(stdout, false) end
						do return true end
					elseif arg:isFlag2("vv") then
						do self:printVersion(stdout, true) end
						do return true end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do self:printHeader(stdout) end
	do
		local showHelp = false
		local options = _g.jk.lang.KeyValueListForStrings._construct0(_g.jk.lang.KeyValueListForStrings._create())
		if arguments ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(arguments)
			do
				n2 = 0
				while n2 < m2 do
					local arg = arguments[n2 + 1]
					if arg ~= nil then
						if arg:isOption2("config") then
							if self.configFile ~= nil then
								do _g.jk.log.Log:error(self.ctx, "Duplicate config file parameter supplied: `" .. _g.jk.lang.String:safeString(arg:getComplete()) .. "'") end
								do return false end
							end
							self.configFile = _g.jk.fs.File:forPath(arg:getStringValue())
						elseif arg:isFlag2("help") or arg:isFlag2("h") then
							showHelp = true
						elseif arg:isFlag2("debug") then
							self.enableDebugMessages = true
						elseif arg:isOption2("listen") then
							self.listenPort = arg:getIntegerValue()
						elseif arg.key ~= nil and _g.jk.lang.String:startsWith(arg.key, "O", 0) then
							local key = _g.jk.lang.String:getEndOfString(arg.key, 1)
							if _g.jk.lang.String:isEmpty(key) then
								do _g.jk.log.Log:error(self.ctx, "Invalid option parameter: `" .. _g.jk.lang.String:safeString(arg:getComplete()) .. "'") end
								do return false end
							end
							do options:add(key, arg:getStringValue()) end
						elseif self:acceptCommandLineArgument(arg) then
						else
							do arg:reportAsUnsupported(self.ctx) end
							do return false end
						end
					end
					do n2 = n2 + 1 end
				end
			end
		end
		if showHelp then
			do self:printUsage(stdout) end
			do return true end
		end
		if self.configFile ~= nil then
			local config = _g.jk.server.SimpleConfigFile:forFile(self.configFile)
			if config == nil then
				do _g.jk.log.Log:error(self.ctx, "Failed to read configuration file: `" .. _g.jk.lang.String:safeString(self.configFile:getPath()) .. "'") end
				do return false end
			end
			do
				local it = config:iterate()
				while it ~= nil do
					local kvp = it:next()
					if kvp == nil then
						do break end
					end
					do
						local key = kvp.key
						local value = kvp.value
						if self:doConfigure(key, value, self.configFile:getParent()) == false then
							do return false end
						end
					end
				end
			end
		end
		do
			local oit = options:iterate()
			while oit ~= nil do
				local kvp = oit:next()
				if kvp == nil then
					do break end
				end
				do
					local key = kvp.key
					local value = kvp.value
					if self:doConfigure(key, value, nil) == false then
						do return false end
					end
				end
			end
			if self.loggingDirectory ~= nil then
				do _g.jk.log.Log:debug(self.ctx, "Configuring logging to directory: `" .. _g.jk.lang.String:safeString(self.loggingDirectory:getPath()) .. "'") end
				do
					local dlc = _g.jk.server.DirectoryLoggingContext:create(self.loggingDirectory, nil, true)
					if self.enableDebugMessages then
						do dlc:setEnableDebugMessages(true) end
					end
					do dlc:setAlsoPrintOnConsole(self.duplicateLoggingOnConsole) end
					self.ctx = dlc
				end
			else
				local cac = _vm:to_table_with_key(self.ctx, '_isType.jk.console.ConsoleApplicationContext')
				if cac ~= nil and self.enableDebugMessages then
					do cac:setEnableDebugMessages(true) end
				end
			end
			do return self:executeServer() end
		end
	end
end

function jk.server.CommonServer:executeMain(args)
	do return (function(a, b, c)
		if a then
			do return b() end
		end
		do return c() end
	end)(self:execute(args), function()
		do return 0 end
	end, function()
		do return 1 end
	end) end
end

function jk.server.CommonServer:initializeWithIOManager(ioManager, ctx)
	do return true end
end

function jk.server.CommonServer:initializeNetworkServer(server)
	do return true end
end

function jk.server.CommonServer:initializeApplication()
	do return true end
end

function jk.server.CommonServer:createServer()
end

function jk.server.CommonServer:executeServer()
	do self:logServerConfiguration() end
	if not self:initializeApplication() then
		do _g.jk.log.Log:error(self.ctx, "Failed to initialize application") end
		do return false end
	end
	do
		local server = self:createServer()
		if not (server ~= nil) then
			do _g.jk.log.Log:error(self.ctx, "Failed to create server object") end
			do return false end
		end
		if not self:initializeNetworkServer(server) then
			do _g.jk.log.Log:error(self.ctx, "Failed to configure HTTP server") end
			do return false end
		end
		do
			local ioManager = _g.jk.socket.io.IOManager:createDefault()
			if not (ioManager ~= nil) then
				do _g.jk.log.Log:error(self.ctx, "FAILED to create IO manager") end
				do return false end
			end
			do _g.jk.socket.io.IOManager:setCurrent(ioManager) end
			if not server:initialize1(ioManager, self.ctx) then
				do _g.jk.log.Log:error(self.ctx, "Failed to initialize HTTP server.") end
				do return false end
			end
			if not self:initializeWithIOManager(ioManager, self.ctx) then
				do _g.jk.log.Log:error(self.ctx, "Failed to initialize with IOManager") end
				do return false end
			end
			do _g.jk.log.Log:info(self.ctx, "Server initialized and ready for connections.") end
			if not ioManager:execute(self.ctx) then
				do _g.jk.log.Log:error(self.ctx, "Failed to execute IO manager") end
				do return false end
			end
			do _g.jk.log.Log:info(self.ctx, "Server exiting, cleaning up..") end
			do server:cleanup() end
			do _g.jk.log.Log:info(self.ctx, "Server terminated.") end
			do return true end
		end
	end
end

jk.server.DirectoryLoggingContext = {}
jk.server.DirectoryLoggingContext.__index = jk.server.DirectoryLoggingContext
_vm:set_metatable(jk.server.DirectoryLoggingContext, {})

function jk.server.DirectoryLoggingContext._create()
	local v = _vm:set_metatable({}, jk.server.DirectoryLoggingContext)
	return v
end

function jk.server.DirectoryLoggingContext:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.DirectoryLoggingContext'
	self['_isType.jk.server.DirectoryLoggingContext'] = true
	self['_isType.jk.log.LoggingContext'] = true
	self.logDir = nil
	self.logIdPrefix = "messages"
	self.currentLogIdName = nil
	self.os = nil
	self.ctx = nil
	self.enableDebugMessages = true
	self.alsoPrintOnConsole = false
	self.errorCount = 0
	self.warningCount = 0
	self.infoCount = 0
	self.debugCount = 0
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.server.DirectoryLoggingContext:_construct0()
	jk.server.DirectoryLoggingContext._init(self)
	return self
end

function jk.server.DirectoryLoggingContext:create(logDir, logIdPrefix, dbg)
	local v = _g.jk.server.DirectoryLoggingContext._construct0(_g.jk.server.DirectoryLoggingContext._create())
	do v:setLogDir(logDir) end
	do v:setEnableDebugMessages(dbg) end
	if _g.jk.lang.String:isNotEmpty(logIdPrefix) then
		do v:setLogIdPrefix(logIdPrefix) end
	end
	do return v end
end

function jk.server.DirectoryLoggingContext:setEnableDebugMessages(value)
	self.enableDebugMessages = value
	do
		local cac = _vm:to_table_with_key(self.ctx, '_isType.jk.console.ConsoleApplicationContext')
		if cac ~= nil then
			do cac:setEnableDebugMessages(self.enableDebugMessages) end
		end
	end
end

function jk.server.DirectoryLoggingContext:setAlsoPrintOnConsole(value)
	self.alsoPrintOnConsole = value
	if self.alsoPrintOnConsole then
		self.ctx = _g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create()):setEnableDebugMessages(self.enableDebugMessages)
		do return end
	end
	self.ctx = nil
end

function jk.server.DirectoryLoggingContext:logError(text)
	do self:message("ERROR", text) end
	do self.errorCount = self.errorCount + 1 end
end

function jk.server.DirectoryLoggingContext:logWarning(text)
	do self:message("WARNING", text) end
	do self.warningCount = self.warningCount + 1 end
end

function jk.server.DirectoryLoggingContext:logInfo(text)
	do self:message("INFO", text) end
	do self.infoCount = self.infoCount + 1 end
end

function jk.server.DirectoryLoggingContext:logDebug(text)
	do self:message("DEBUG", text) end
	do self.debugCount = self.debugCount + 1 end
end

function jk.server.DirectoryLoggingContext:logStatus(text)
	do self:message("STATUS", text) end
end

function jk.server.DirectoryLoggingContext:message(type, text)
	if not self.enableDebugMessages and _g.jk.lang.String:equalsIgnoreCase("debug", type) then
		do return end
	end
	do
		local dt = _g.jk.time.SystemClock:asDateTimeUTC()
		local logTime = nil
		if dt ~= nil then
			logTime = _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getYear())) .. "-" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerWithPadding(dt:getMonth(), 2, nil)) .. "-" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerWithPadding(dt:getDayOfMonth(), 2, nil)) .. " " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerWithPadding(dt:getHours(), 2, nil)) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerWithPadding(dt:getMinutes(), 2, nil)) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerWithPadding(dt:getSeconds(), 2, nil)) .. " UTC"
		else
			logTime = "DATE/TIME"
		end
		do
			local logLine = "[" .. _g.jk.lang.String:safeString(logTime) .. "]: " .. _g.jk.lang.String:safeString(text)
			if self.alsoPrintOnConsole then
				if "ERROR" == type then
					do _g.jk.log.Log:error(self.ctx, logLine) end
				elseif "WARNING" == type then
					do _g.jk.log.Log:warning(self.ctx, logLine) end
				elseif "INFO" == type then
					do _g.jk.log.Log:info(self.ctx, logLine) end
				elseif "DEBUG" == type then
					do _g.jk.log.Log:debug(self.ctx, logLine) end
				elseif "STATUS" == type then
					do _g.jk.log.Log:status(self.ctx, logLine) end
				end
			end
			logLine = "[" .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:padToLength(type, 7, -1, 32)) .. "] " .. _g.jk.lang.String:safeString(logLine)
			if self.logDir ~= nil then
				local logIdName = nil
				if dt ~= nil then
					logIdName = _g.jk.lang.String:safeString(self.logIdPrefix) .. "_" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getYear())) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerWithPadding(dt:getMonth(), 2, nil)) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerWithPadding(dt:getDayOfMonth(), 2, nil)) .. ".log"
				else
					logIdName = _g.jk.lang.String:safeString(self.logIdPrefix) .. ".log"
				end
				if not (self.os ~= nil) or not (self.currentLogIdName == logIdName) then
					self.currentLogIdName = logIdName
					self.os = _g.jk.io.PrintWriterWrapper:forWriter(self.logDir:entry(self.currentLogIdName):append())
					if not (self.os ~= nil) and not self.logDir:isDirectory() then
						do self.logDir:createDirectoryRecursive() end
						self.os = _g.jk.io.PrintWriterWrapper:forWriter(self.logDir:entry(self.currentLogIdName):append())
					end
				end
				if self.os ~= nil then
					if not self.os:println(logLine) then
						do return end
					end
					if (_vm:to_table_with_key(self.os, '_isType.jk.io.FlushableWriter') ~= nil) then
						do self.os:flush() end
					end
				end
			end
		end
	end
end

function jk.server.DirectoryLoggingContext:isInDebugMode()
	do return self.enableDebugMessages end
end

function jk.server.DirectoryLoggingContext:getErrorCount()
	do return self.errorCount end
end

function jk.server.DirectoryLoggingContext:getWarningCount()
	do return self.warningCount end
end

function jk.server.DirectoryLoggingContext:getInfoCount()
	do return self.infoCount end
end

function jk.server.DirectoryLoggingContext:getDebugCount()
	do return self.debugCount end
end

function jk.server.DirectoryLoggingContext:resetCounters()
	self.errorCount = 0
	self.warningCount = 0
	self.infoCount = 0
	self.debugCount = 0
end

function jk.server.DirectoryLoggingContext:_destruct()
	if self.os ~= nil then
		if (_vm:to_table_with_key(self.os, '_isType.jk.lang.Closable') ~= nil) then
			do self.os:close() end
		end
		self.os = nil
	end
end

function jk.server.DirectoryLoggingContext:getLogDir()
	do return self.logDir end
end

function jk.server.DirectoryLoggingContext:setLogDir(v)
	self.logDir = v
	do return self end
end

function jk.server.DirectoryLoggingContext:getLogIdPrefix()
	do return self.logIdPrefix end
end

function jk.server.DirectoryLoggingContext:setLogIdPrefix(v)
	self.logIdPrefix = v
	do return self end
end
