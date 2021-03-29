jk = jk or {}

jk.stomp = jk.stomp or {}

jk.stomp.STOMPClient = {}
jk.stomp.STOMPClient.__index = jk.stomp.STOMPClient
_vm:set_metatable(jk.stomp.STOMPClient, {})

function jk.stomp.STOMPClient._create()
	local v = _vm:set_metatable({}, jk.stomp.STOMPClient)
	return v
end

function jk.stomp.STOMPClient:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.stomp.STOMPClient'
	self['_isType.jk.stomp.STOMPClient'] = true
end

function jk.stomp.STOMPClient:_construct0()
	jk.stomp.STOMPClient._init(self)
	return self
end
