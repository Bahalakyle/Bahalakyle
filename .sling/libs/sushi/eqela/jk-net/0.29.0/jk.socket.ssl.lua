jk = jk or {}

jk.socket = jk.socket or {}

jk.socket.ssl = jk.socket.ssl or {}

jk.socket.ssl.SSLSocket = {}
jk.socket.ssl.SSLSocket.__index = jk.socket.ssl.SSLSocket
_vm:set_metatable(jk.socket.ssl.SSLSocket, {})

function jk.socket.ssl.SSLSocket._create()
	local v = _vm:set_metatable({}, jk.socket.ssl.SSLSocket)
	return v
end

function jk.socket.ssl.SSLSocket:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.ssl.SSLSocket'
	self['_isType.jk.socket.ssl.SSLSocket'] = true
	self['_isType.jk.socket.ConnectedSocket'] = true
end

function jk.socket.ssl.SSLSocket:_construct0()
	jk.socket.ssl.SSLSocket._init(self)
	return self
end

function jk.socket.ssl.SSLSocket:createInstance(cSocket, serverAddress, ctx, certFile, keyFile, isServer, acceptInvalidCertificate, passphrase)
	if not (cSocket ~= nil) then
		do return nil end
	end
	do
		local v = nil
		local ss = _g.jk.socket.ssl.SSLSocketForSushi._construct0(_g.jk.socket.ssl.SSLSocketForSushi._create())
		do ss:setAcceptInvalidCertificate(acceptInvalidCertificate) end
		do ss:setCtx(ctx) end
		do ss:setServerAddress(serverAddress) end
		if ss:open(cSocket, certFile, keyFile, isServer, passphrase) then
			v = ss
		end
		do return v end
	end
end

function jk.socket.ssl.SSLSocket:forClient(cSocket, hostAddress, ctx, acceptInvalidCertificate, passphrase)
	do return _g.jk.socket.ssl.SSLSocket:createInstance(cSocket, hostAddress, ctx, nil, nil, false, acceptInvalidCertificate, passphrase) end
end

function jk.socket.ssl.SSLSocket:forServer(cSocket, certFile, keyFile, ctx, acceptInvalidCertificate, passphrase)
	do return _g.jk.socket.ssl.SSLSocket:createInstance(cSocket, nil, ctx, certFile, keyFile, true, acceptInvalidCertificate, passphrase) end
end

function jk.socket.ssl.SSLSocket:setAcceptInvalidCertificate(accept)
end

function jk.socket.ssl.SSLSocket:setRequireClientCertificate(require)
end

function jk.socket.ssl.SSLSocket:close()
end

function jk.socket.ssl.SSLSocket:read(buffer)
end

function jk.socket.ssl.SSLSocket:readWithTimeout(buffer, timeout)
end

function jk.socket.ssl.SSLSocket:write(buffer, size)
end

function jk.socket.ssl.SSLSocket:getSocket()
end

jk.socket.ssl.SSLSocketForSushi = _g.jk.socket.ssl.SSLSocket._create()
jk.socket.ssl.SSLSocketForSushi.__index = jk.socket.ssl.SSLSocketForSushi
_vm:set_metatable(jk.socket.ssl.SSLSocketForSushi, {
	__index = _g.jk.socket.ssl.SSLSocket
})

function jk.socket.ssl.SSLSocketForSushi._create()
	local v = _vm:set_metatable({}, jk.socket.ssl.SSLSocketForSushi)
	return v
end

function jk.socket.ssl.SSLSocketForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.ssl.SSLSocketForSushi'
	self['_isType.jk.socket.ssl.SSLSocketForSushi'] = true
	self.ctx = nil
	self.socket = nil
	self.serverAddress = nil
	self.acceptInvalidCertificate = false
	self.requireClientCertificate = false
	self.ssl = nil
end

function jk.socket.ssl.SSLSocketForSushi:_construct0()
	jk.socket.ssl.SSLSocketForSushi._init(self)
	do _g.jk.socket.ssl.SSLSocket._construct0(self) end
	return self
end

function jk.socket.ssl.SSLSocketForSushi:setAcceptInvalidCertificate(v)
	self.acceptInvalidCertificate = v
end

function jk.socket.ssl.SSLSocketForSushi:setRequireClientCertificate(v)
	self.requireClientCertificate = v
end

function jk.socket.ssl.SSLSocketForSushi:open(cSocket, certFile, keyFile, isServer, passphrase)
	if not ((function()
		self.socket = _vm:to_table_with_key(cSocket, '_isType.jk.socket.TCPSocketForSushi')
		do return self.socket end
	end)() ~= nil) then
		do return false end
	end
	if isServer then
		do return false end
	end
	do
		local address = self.serverAddress
		if _g.jk.lang.String:isEmpty(address) then
			address = self.socket:getRemoteAddress()
		end
		if not _g.jk.lang.String:isNotEmpty(address) then
			do return false end
		end
		do
			local port = self.socket:getRemotePort()
			if port < 1 then
				port = 443
			end
			do
				local fd = self.socket:getFileDescriptor()
				local ssl = _crypto:ssl_connect(fd, address)
				if not (ssl ~= nil) then
					do return false end
				end
				self.ssl = ssl
				do return true end
			end
		end
	end
end

function jk.socket.ssl.SSLSocketForSushi:read(buffer)
	do return self:readWithTimeout(buffer, -1) end
end

function jk.socket.ssl.SSLSocketForSushi:close()
	if self.ssl ~= nil then
		local ssl = self.ssl
		self.ssl = nil
		do _crypto:ssl_close(ssl) end
	end
	if self.socket ~= nil then
		do self.socket:close() end
		self.socket = nil
	end
end

function jk.socket.ssl.SSLSocketForSushi:readWithTimeout(buffer, timeout)
	local ssl = self.ssl
	if not (ssl ~= nil) then
		do return 0 end
	end
	if not (buffer ~= nil) then
		do return -1 end
	end
	do
		local v = _crypto:ssl_read(ssl, buffer)
		if v < 1 then
			do self:close() end
			v = -1
		end
		do return v end
	end
end

function jk.socket.ssl.SSLSocketForSushi:write(buffer, size)
	local ssl = self.ssl
	if not (ssl ~= nil) then
		do return 0 end
	end
	if not (buffer ~= nil) then
		do return -1 end
	end
	do
		local v = _crypto:ssl_write(ssl, buffer, size)
		if v < 1 then
			do self:close() end
			v = -1
		end
		do return v end
	end
end

function jk.socket.ssl.SSLSocketForSushi:getSocket()
	do return self.socket end
end

function jk.socket.ssl.SSLSocketForSushi:getCtx()
	do return self.ctx end
end

function jk.socket.ssl.SSLSocketForSushi:setCtx(v)
	self.ctx = v
	do return self end
end

function jk.socket.ssl.SSLSocketForSushi:setSocket(v)
	self.socket = v
	do return self end
end

function jk.socket.ssl.SSLSocketForSushi:getServerAddress()
	do return self.serverAddress end
end

function jk.socket.ssl.SSLSocketForSushi:setServerAddress(v)
	self.serverAddress = v
	do return self end
end
