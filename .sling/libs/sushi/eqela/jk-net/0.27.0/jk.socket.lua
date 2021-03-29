jk = jk or {}

jk.socket = jk.socket or {}

jk.socket.ConnectedSocket = {}

jk.socket.TCPSocket = {}
jk.socket.TCPSocket.__index = jk.socket.TCPSocket
_vm:set_metatable(jk.socket.TCPSocket, {})

function jk.socket.TCPSocket._create()
	local v = _vm:set_metatable({}, jk.socket.TCPSocket)
	return v
end

function jk.socket.TCPSocket:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.TCPSocket'
	self['_isType.jk.socket.TCPSocket'] = true
	self['_isType.jk.socket.ConnectedSocket'] = true
	self.lastErrorDescription = nil
end

function jk.socket.TCPSocket:_construct0()
	jk.socket.TCPSocket._init(self)
	return self
end

function jk.socket.TCPSocket:create()
	do return _g.jk.socket.TCPSocketForSushi._construct0(_g.jk.socket.TCPSocketForSushi._create()) end
end

function jk.socket.TCPSocket:createAndConnect(address, port)
	local v = _g.jk.socket.TCPSocket:create()
	if not (v ~= nil) then
		do return nil end
	end
	if v:connect(address, port) == false then
		v = nil
	end
	do return v end
end

function jk.socket.TCPSocket:createAndListen(port)
	local v = _g.jk.socket.TCPSocket:create()
	if not (v ~= nil) then
		do return nil end
	end
	if v:listen(port) == false then
		v = nil
	end
	do return v end
end

function jk.socket.TCPSocket:getRemoteAddress()
end

function jk.socket.TCPSocket:getRemotePort()
end

function jk.socket.TCPSocket:getLocalAddress()
end

function jk.socket.TCPSocket:getLocalPort()
end

function jk.socket.TCPSocket:connect(address, port)
end

function jk.socket.TCPSocket:listen(port)
end

function jk.socket.TCPSocket:accept()
end

function jk.socket.TCPSocket:setBlocking(blocking)
end

function jk.socket.TCPSocket:getBlocking()
end

function jk.socket.TCPSocket:close()
end

function jk.socket.TCPSocket:read(buffer)
end

function jk.socket.TCPSocket:readWithTimeout(buffer, timeout)
	do return self:read(buffer) end
end

function jk.socket.TCPSocket:write(buffer, size)
end

function jk.socket.TCPSocket:getLastErrorDescription()
	do return self.lastErrorDescription end
end

function jk.socket.TCPSocket:setLastErrorDescription(v)
	self.lastErrorDescription = v
	do return self end
end

jk.socket.TCPSocketForSushi = _g.jk.socket.TCPSocket._create()
jk.socket.TCPSocketForSushi.__index = jk.socket.TCPSocketForSushi
_vm:set_metatable(jk.socket.TCPSocketForSushi, {
	__index = _g.jk.socket.TCPSocket
})

function jk.socket.TCPSocketForSushi._create()
	local v = _vm:set_metatable({}, jk.socket.TCPSocketForSushi)
	return v
end

function jk.socket.TCPSocketForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.TCPSocketForSushi'
	self['_isType.jk.socket.TCPSocketForSushi'] = true
	self['_isType.jk.io.FileDescriptor'] = true
	self.fd = -1
	self.isBlocking = true
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.socket.TCPSocketForSushi:_construct0()
	jk.socket.TCPSocketForSushi._init(self)
	do _g.jk.socket.TCPSocket._construct0(self) end
	return self
end

function jk.socket.TCPSocketForSushi:_destruct()
	do self:close() end
end

function jk.socket.TCPSocketForSushi:getFileDescriptor()
	do return self.fd end
end

function jk.socket.TCPSocketForSushi:createSocket()
	if self.fd >= 0 then
		do self:close() end
	end
	self.fd = _net:create_tcp_socket()
	if self.fd < 0 then
		do return false end
	end
	do return true end
end

function jk.socket.TCPSocketForSushi:close()
	local fd = self.fd
	if not (fd >= 0) then
		do return end
	end
	do _net:close_tcp_socket(fd) end
	self.fd = -1
end

function jk.socket.TCPSocketForSushi:getRemoteAddress()
	if not (self.fd >= 0) then
		do return nil end
	end
	do
		local fd = self.fd
		do return _net:get_tcp_socket_peer_address(fd) end
	end
end

function jk.socket.TCPSocketForSushi:getRemotePort()
	if not (self.fd >= 0) then
		do return 0 end
	end
	do
		local fd = self.fd
		do return _net:get_tcp_socket_peer_port(fd) end
	end
end

function jk.socket.TCPSocketForSushi:getLocalAddress()
	_io:write_to_stdout("[jk.socket.TCPSocketForSushi.getLocalAddress] (TCPSocketForSushi@target_sushi.sling:77:2): Not implemented" .. "\n")
	do return nil end
end

function jk.socket.TCPSocketForSushi:getLocalPort()
	_io:write_to_stdout("[jk.socket.TCPSocketForSushi.getLocalPort] (TCPSocketForSushi@target_sushi.sling:83:2): Not implemented" .. "\n")
	do return 0 end
end

function jk.socket.TCPSocketForSushi:connect(address, port)
	if not self:createSocket() then
		do return false end
	end
	do
		local fd = self.fd
		if _net:connect_tcp_socket(fd, address, port) ~= 0 then
			do self:close() end
			do return false end
		end
		do return true end
	end
end

function jk.socket.TCPSocketForSushi:listen(port)
	if not self:createSocket() then
		do return false end
	end
	do
		local fd = self.fd
		if _net:listen_tcp_socket(fd, port) ~= 0 then
			do self:close() end
			do return false end
		end
		do return true end
	end
end

function jk.socket.TCPSocketForSushi:accept()
	if not (self.fd >= 0) then
		do return nil end
	end
	do
		local r = 0
		local error = nil
		local fd = self.fd
		do r, error = _net:accept_tcp_socket(fd) end
		if error ~= nil then
			_vm:throw_error(_g.jk.lang.ExceptionWithError:forCode("failedToAcceptSocket", error))
		end
		if not (r >= 0) then
			do return nil end
		end
		do
			local v = _g.jk.socket.TCPSocketForSushi._construct0(_g.jk.socket.TCPSocketForSushi._create())
			do v:setFd(r) end
			do return v end
		end
	end
end

function jk.socket.TCPSocketForSushi:setBlocking(blocking)
	if not (self.fd >= 0) then
		do return false end
	end
	do
		local r = 0
		local fd = self.fd
		if blocking then
			do r = _net:set_socket_blocking(fd) end
		else
			do r = _net:set_socket_non_blocking(fd) end
		end
		if r ~= 0 then
			do return false end
		end
		self.isBlocking = blocking
		do return true end
	end
end

function jk.socket.TCPSocketForSushi:getBlocking()
	do return self.isBlocking end
end

function jk.socket.TCPSocketForSushi:read(buffer)
	do return self:readWithTimeout(buffer, -1) end
end

function jk.socket.TCPSocketForSushi:readWithTimeout(buffer, timeout)
	if self.fd < 0 then
		do return -1 end
	end
	if buffer == nil then
		do return -1 end
	end
	do
		local v = 0
		local fd = self.fd
		do v = _net:read_from_tcp_socket(fd, buffer, #buffer, timeout) end
		do return v end
	end
end

function jk.socket.TCPSocketForSushi:write(buffer, size)
	if self.fd < 0 then
		do return -1 end
	end
	if buffer == nil then
		do return -1 end
	end
	do
		local sz = size
		if sz < 0 then
			sz = #buffer
		end
		do
			local v = 0
			local fd = self.fd
			do v = _net:write_to_tcp_socket(fd, buffer, sz) end
			do return v end
		end
	end
end

function jk.socket.TCPSocketForSushi:getFd()
	do return self.fd end
end

function jk.socket.TCPSocketForSushi:setFd(v)
	self.fd = v
	do return self end
end

jk.socket.UDPSocket = {}
jk.socket.UDPSocket.__index = jk.socket.UDPSocket
_vm:set_metatable(jk.socket.UDPSocket, {})

function jk.socket.UDPSocket._create()
	local v = _vm:set_metatable({}, jk.socket.UDPSocket)
	return v
end

function jk.socket.UDPSocket:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.UDPSocket'
	self['_isType.jk.socket.UDPSocket'] = true
end

function jk.socket.UDPSocket:_construct0()
	jk.socket.UDPSocket._init(self)
	return self
end

function jk.socket.UDPSocket:create()
	_io:write_to_stdout("[jk.socket.UDPSocket.create] (UDPSocket.sling:40:3): Not implemented." .. "\n")
	do return nil end
end

function jk.socket.UDPSocket:send(message, address, port)
end

function jk.socket.UDPSocket:sendBroadcast(message, address, port)
end

function jk.socket.UDPSocket:receive(message, timeout)
end

function jk.socket.UDPSocket:bind(port)
end

function jk.socket.UDPSocket:close()
end

function jk.socket.UDPSocket:getLocalAddress()
end

function jk.socket.UDPSocket:getLocalPort()
end
