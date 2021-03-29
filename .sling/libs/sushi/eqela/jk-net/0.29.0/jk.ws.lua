jk = jk or {}

jk.ws = jk.ws or {}

jk.ws.WSProtocolSource = {}

jk.ws.WSProtocol = {}
jk.ws.WSProtocol.__index = jk.ws.WSProtocol
_vm:set_metatable(jk.ws.WSProtocol, {})

function jk.ws.WSProtocol._create()
	local v = _vm:set_metatable({}, jk.ws.WSProtocol)
	return v
end

function jk.ws.WSProtocol:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.WSProtocol'
	self['_isType.jk.ws.WSProtocol'] = true
	self.source = nil
end

function jk.ws.WSProtocol:_construct0()
	jk.ws.WSProtocol._init(self)
	return self
end

function jk.ws.WSProtocol:onConnectionOpened()
end

function jk.ws.WSProtocol:onConnectionClosed()
end

function jk.ws.WSProtocol:onConnectionError(error)
end

function jk.ws.WSProtocol:onStringMessage(message)
end

function jk.ws.WSProtocol:onBinaryMessage(message)
end

function jk.ws.WSProtocol:sendString(data)
	if self.source ~= nil then
		do self.source:sendString(data) end
	end
end

function jk.ws.WSProtocol:sendBuffer(data)
	if self.source ~= nil then
		do self.source:sendBuffer(data) end
	end
end

function jk.ws.WSProtocol:closeConnection()
	if self.source ~= nil then
		do self.source:closeConnection() end
	end
end

function jk.ws.WSProtocol:getSource()
	do return self.source end
end

function jk.ws.WSProtocol:setSource(v)
	self.source = v
	do return self end
end
