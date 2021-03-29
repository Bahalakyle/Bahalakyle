jk = jk or {}

jk.server = jk.server or {}

jk.server.common = jk.server.common or {}

jk.server.common.ServerConfig = {}
jk.server.common.ServerConfig.__index = jk.server.common.ServerConfig
_vm:set_metatable(jk.server.common.ServerConfig, {})

function jk.server.common.ServerConfig._create()
	local v = _vm:set_metatable({}, jk.server.common.ServerConfig)
	return v
end

function jk.server.common.ServerConfig:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.common.ServerConfig'
	self['_isType.jk.server.common.ServerConfig'] = true
end

function jk.server.common.ServerConfig:_construct0()
	jk.server.common.ServerConfig._init(self)
	return self
end

function jk.server.common.ServerConfig:require(key)
	local v = _g.jk.env.EnvironmentVariable:get(key)
	if _g.jk.lang.String:isEmpty(v) then
		do _g.jk.lang.Error:throw("missingConfigurationVariable", key) end
	end
	do return v end
end

function jk.server.common.ServerConfig:accept(key)
	do return _g.jk.env.EnvironmentVariable:get(key) end
end

function jk.server.common.ServerConfig:get(key, defaultValue)
	local v = _g.jk.server.common.ServerConfig:accept(key)
	if not (v ~= nil) then
		v = defaultValue
	end
	do return v end
end

jk.server.common.ServerError = {}
jk.server.common.ServerError.__index = jk.server.common.ServerError
_vm:set_metatable(jk.server.common.ServerError, {})

function jk.server.common.ServerError._create()
	local v = _vm:set_metatable({}, jk.server.common.ServerError)
	return v
end

function jk.server.common.ServerError:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.common.ServerError'
	self['_isType.jk.server.common.ServerError'] = true
end

function jk.server.common.ServerError:_construct0()
	jk.server.common.ServerError._init(self)
	return self
end

function jk.server.common.ServerError:invalidRequest()
	do return _g.jk.lang.Error:forCode("invalidRequest", nil) end
end

function jk.server.common.ServerError:internalError()
	do return _g.jk.lang.Error:forCode("internalError", nil) end
end

function jk.server.common.ServerError:notAllowed()
	do return _g.jk.lang.Error:forCode("notAllowed", nil) end
end

function jk.server.common.ServerError:notFound()
	do return _g.jk.lang.Error:forCode("notFound", nil) end
end

function jk.server.common.ServerError:noData()
	do return _g.jk.lang.Error:forCode("noData", nil) end
end

function jk.server.common.ServerError:alreadyInUse()
	do return _g.jk.lang.Error:forCode("alreadyInUse", nil) end
end

function jk.server.common.ServerError:failedToSave()
	do return _g.jk.lang.Error:forCode("failedToSave", nil) end
end

function jk.server.common.ServerError:invalidSession()
	do return _g.jk.lang.Error:forCode("invalidSession", nil) end
end

function jk.server.common.ServerError:invalidData()
	do return _g.jk.lang.Error:forCode("invalidData", nil) end
end

function jk.server.common.ServerError:invalidCredentials()
	do return _g.jk.lang.Error:forCode("invalidCredentials", nil) end
end

function jk.server.common.ServerError:invalidInputFormat()
	do return _g.jk.lang.Error:forCode("invalidInputFormat", nil) end
end
