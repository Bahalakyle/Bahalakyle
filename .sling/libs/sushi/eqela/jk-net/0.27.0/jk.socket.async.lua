jk = jk or {}

jk.socket = jk.socket or {}

jk.socket.async = jk.socket.async or {}

jk.socket.async.TCPClient = {}
jk.socket.async.TCPClient.__index = jk.socket.async.TCPClient
_vm:set_metatable(jk.socket.async.TCPClient, {})

function jk.socket.async.TCPClient._create()
	local v = _vm:set_metatable({}, jk.socket.async.TCPClient)
	return v
end

function jk.socket.async.TCPClient:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.async.TCPClient'
	self['_isType.jk.socket.async.TCPClient'] = true
end

function jk.socket.async.TCPClient:_construct0()
	jk.socket.async.TCPClient._init(self)
	return self
end

function jk.socket.async.TCPClient:instance()
	do return _g.jk.socket.async.TCPClientForIOManager:forCurrentIOManager() end
end

function jk.socket.async.TCPClient:connectSSL(address, port, callback)
end

function jk.socket.async.TCPClient:connect(address, port, callback)
end

function jk.socket.async.TCPClient:receive(callback)
end

function jk.socket.async.TCPClient:send(data, size, callback)
end

function jk.socket.async.TCPClient:disconnect(callback)
end

jk.socket.async.TCPClientForIOManager = _g.jk.socket.async.TCPClient._create()
jk.socket.async.TCPClientForIOManager.__index = jk.socket.async.TCPClientForIOManager
_vm:set_metatable(jk.socket.async.TCPClientForIOManager, {
	__index = _g.jk.socket.async.TCPClient
})

function jk.socket.async.TCPClientForIOManager._create()
	local v = _vm:set_metatable({}, jk.socket.async.TCPClientForIOManager)
	return v
end

function jk.socket.async.TCPClientForIOManager:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.async.TCPClientForIOManager'
	self['_isType.jk.socket.async.TCPClientForIOManager'] = true
	self.tcpsocket = nil
	self.sslsocket = nil
	self.rcvbuffer = nil
	self.iomanager = nil
	self.toWrite = _g.jk.lang.Queue._construct0(_g.jk.lang.Queue._create())
	self.writeScheduled = false
end

function jk.socket.async.TCPClientForIOManager:forCurrentIOManager()
	local mgr = _g.jk.socket.io.IOManager:getCurrent()
	if not (mgr ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.socket.async.TCPClientForIOManager._construct0(_g.jk.socket.async.TCPClientForIOManager._create())
		do v:setIomanager(mgr) end
		do return v end
	end
end

function jk.socket.async.TCPClientForIOManager:forIOManager(mgr)
	local v = _g.jk.socket.async.TCPClientForIOManager._construct0(_g.jk.socket.async.TCPClientForIOManager._create())
	do v:setIomanager(mgr) end
	do return v end
end

function jk.socket.async.TCPClientForIOManager:_construct0()
	jk.socket.async.TCPClientForIOManager._init(self)
	do _g.jk.socket.async.TCPClient._construct0(self) end
	self.rcvbuffer = _util:allocate_buffer(64 * 1024)
	return self
end

function jk.socket.async.TCPClientForIOManager:getSocket()
	if self.sslsocket ~= nil then
		do return self.sslsocket end
	end
	do return self.tcpsocket end
end

function jk.socket.async.TCPClientForIOManager:doConnectSocket(address, port)
	do return _g.jk.socket.TCPSocket:createAndConnect(address, port) end
end

function jk.socket.async.TCPClientForIOManager:connectSSL(address, port, callback)
	if not ((function()
		self.tcpsocket = self:doConnectSocket(address, port)
		do return self.tcpsocket end
	end)() ~= nil) then
		if callback ~= nil then
			do callback(_g.jk.lang.Error:forCode("failedToConnect", nil)) end
		end
		do return end
	end
	if not ((function()
		self.sslsocket = _g.jk.socket.ssl.SSLSocket:forClient(self.tcpsocket, address, nil, false, nil)
		do return self.sslsocket end
	end)() ~= nil) then
		if callback ~= nil then
			do callback(_g.jk.lang.Error:forCode("sslHandshakeFailed", nil)) end
		end
		do return end
	end
	if callback ~= nil then
		do callback(nil) end
	end
end

function jk.socket.async.TCPClientForIOManager:connect(address, port, callback)
	if not ((function()
		self.tcpsocket = self:doConnectSocket(address, port)
		do return self.tcpsocket end
	end)() ~= nil) then
		if callback ~= nil then
			do callback(_g.jk.lang.Error:forCode("failedToConnect", nil)) end
		end
		do return end
	end
	self.sslsocket = nil
	if callback ~= nil then
		do callback(nil) end
	end
end

function jk.socket.async.TCPClientForIOManager:receive(callback)
	if not (self.tcpsocket ~= nil) then
		if callback ~= nil then
			do callback(nil, 0) end
		end
		do return end
	end
	do
		local ee = self.iomanager:add(self.tcpsocket)
		local cc = callback
		do ee:setReadListener(function()
			do ee:setReadListener(nil) end
			do
				local ss = self:getSocket()
				local bb = self.rcvbuffer
				local v = 0
				if ss ~= nil then
					v = ss:read(bb)
				end
				if cc ~= nil then
					do cc(bb, v) end
				end
			end
		end) end
	end
end

jk.socket.async.TCPClientForIOManager.MyBuffer = {}
jk.socket.async.TCPClientForIOManager.MyBuffer.__index = jk.socket.async.TCPClientForIOManager.MyBuffer
_vm:set_metatable(jk.socket.async.TCPClientForIOManager.MyBuffer, {})

function jk.socket.async.TCPClientForIOManager.MyBuffer._create()
	local v = _vm:set_metatable({}, jk.socket.async.TCPClientForIOManager.MyBuffer)
	return v
end

function jk.socket.async.TCPClientForIOManager.MyBuffer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.async.TCPClientForIOManager.MyBuffer'
	self['_isType.jk.socket.async.TCPClientForIOManager.MyBuffer'] = true
	self.data = nil
	self.size = 0
	self.callback = nil
end

function jk.socket.async.TCPClientForIOManager.MyBuffer:_construct0()
	jk.socket.async.TCPClientForIOManager.MyBuffer._init(self)
	return self
end

function jk.socket.async.TCPClientForIOManager.MyBuffer:getData()
	do return self.data end
end

function jk.socket.async.TCPClientForIOManager.MyBuffer:setData(v)
	self.data = v
	do return self end
end

function jk.socket.async.TCPClientForIOManager.MyBuffer:getSize()
	do return self.size end
end

function jk.socket.async.TCPClientForIOManager.MyBuffer:setSize(v)
	self.size = v
	do return self end
end

function jk.socket.async.TCPClientForIOManager.MyBuffer:getCallback()
	do return self.callback end
end

function jk.socket.async.TCPClientForIOManager.MyBuffer:setCallback(v)
	self.callback = v
	do return self end
end

function jk.socket.async.TCPClientForIOManager:send(data, size, callback)
	if not (self.tcpsocket ~= nil) then
		if callback ~= nil then
			do callback(_g.jk.lang.Error:forCode("notConnected", nil)) end
		end
		do return end
	end
	do
		local mb = _g.jk.socket.async.TCPClientForIOManager.MyBuffer._construct0(_g.jk.socket.async.TCPClientForIOManager.MyBuffer._create())
		do mb:setData(data) end
		do mb:setSize(size) end
		do mb:setCallback(callback) end
		do self.toWrite:push(mb) end
		do self:scheduleWrite() end
	end
end

function jk.socket.async.TCPClientForIOManager:scheduleWrite()
	if self.writeScheduled then
		do return end
	end
	if self.toWrite:getSize() < 1 then
		do return end
	end
	do
		local ee = self.iomanager:add(self.tcpsocket)
		do ee:setWriteListener(function()
			do ee:setWriteListener(nil) end
			self.writeScheduled = false
			do
				local mb = self.toWrite:pop()
				if mb ~= nil then
					local data = mb:getData()
					local size = mb:getSize()
					local callback = mb:getCallback()
					local ss = self:getSocket()
					local n = 0
					if ss ~= nil then
						n = ss:write(data, size)
					end
					if callback ~= nil then
						if n < size then
							do callback(_g.jk.lang.Error:forCode("failedToWrite", nil)) end
						else
							do callback(nil) end
						end
					end
				end
				do self:scheduleWrite() end
			end
		end) end
		self.writeScheduled = true
	end
end

function jk.socket.async.TCPClientForIOManager:disconnect(callback)
	do self.toWrite:clear() end
	self.writeScheduled = false
	if self.sslsocket ~= nil then
		do self.sslsocket:close() end
		self.sslsocket = nil
	end
	if self.tcpsocket ~= nil then
		do self.tcpsocket:close() end
		self.tcpsocket = nil
	end
	if callback ~= nil then
		do callback(nil) end
	end
end

function jk.socket.async.TCPClientForIOManager:getIomanager()
	do return self.iomanager end
end

function jk.socket.async.TCPClientForIOManager:setIomanager(v)
	self.iomanager = v
	do return self end
end
