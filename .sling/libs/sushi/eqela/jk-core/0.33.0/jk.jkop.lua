jk = jk or {}

jk.jkop = jk.jkop or {}

jk.jkop.Jkop = {}
jk.jkop.Jkop.__index = jk.jkop.Jkop
_vm:set_metatable(jk.jkop.Jkop, {})

function jk.jkop.Jkop._create()
	local v = _vm:set_metatable({}, jk.jkop.Jkop)
	return v
end

function jk.jkop.Jkop:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.jkop.Jkop'
	self['_isType.jk.jkop.Jkop'] = true
end

function jk.jkop.Jkop:_construct0()
	jk.jkop.Jkop._init(self)
	return self
end

function jk.jkop.Jkop:getVersion()
	do return "0.33.0" end
end
