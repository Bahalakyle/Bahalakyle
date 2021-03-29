jk = jk or {}

jk.log = jk.log or {}

jk.log.Log = {}
jk.log.Log.__index = jk.log.Log
_vm:set_metatable(jk.log.Log, {})

function jk.log.Log._create()
	local v = _vm:set_metatable({}, jk.log.Log)
	return v
end

function jk.log.Log:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.log.Log'
	self['_isType.jk.log.Log'] = true
end

function jk.log.Log:_construct0()
	jk.log.Log._init(self)
	return self
end

function jk.log.Log:asString(context, value)
	if context ~= nil and (_vm:to_table_with_key(value, '_isType.jk.lang.StringObjectWithDebug') ~= nil) then
		do return value:toStringWithDebug(context:isInDebugMode()) end
	end
	do return _g.jk.lang.String:asString(value) end
end

function jk.log.Log:error(context, message)
	if context ~= nil then
		do context:logError(message) end
	end
end

function jk.log.Log:warning(context, message)
	if context ~= nil then
		do context:logWarning(message) end
	end
end

function jk.log.Log:info(context, message)
	if context ~= nil then
		do context:logInfo(message) end
	end
end

function jk.log.Log:debug(context, message)
	if context ~= nil then
		do context:logDebug(message) end
	end
end

function jk.log.Log:status(context, message)
	if context ~= nil then
		do context:logStatus(message) end
	end
end

jk.log.LoggingContext = {}
