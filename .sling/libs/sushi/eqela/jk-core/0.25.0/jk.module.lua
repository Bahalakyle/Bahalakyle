jk = jk or {}

jk.module = jk.module or {}

jk.module.DynamicModule = {}
jk.module.DynamicModule.__index = jk.module.DynamicModule
_vm:set_metatable(jk.module.DynamicModule, {})

function jk.module.DynamicModule._create()
	local v = _vm:set_metatable({}, jk.module.DynamicModule)
	return v
end

function jk.module.DynamicModule:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.module.DynamicModule'
	self['_isType.jk.module.DynamicModule'] = true
end

function jk.module.DynamicModule:_construct0()
	jk.module.DynamicModule._init(self)
	return self
end

function jk.module.DynamicModule:forFile(ctx, file)
	local v = _g.jk.module.DynamicModule._construct0(_g.jk.module.DynamicModule._create())
	if v:loadFile(ctx, file) == false then
		v = nil
	end
	do return v end
end

function jk.module.DynamicModule:forObject(ctx, oo)
	if not (oo ~= nil) then
		do return nil end
	end
	_io:write_to_stdout("[jk.module.DynamicModule.forObject] (DynamicModule.sling:72:3): Not implemented." .. "\n")
	do return nil end
end

function jk.module.DynamicModule:isModuleFile(ctx, file)
	if not (file ~= nil) then
		do return false end
	end
	do return false end
end

function jk.module.DynamicModule:getModuleDescription()
	do return "builtin" end
end

function jk.module.DynamicModule:loadFile(ctx, file)
	if not (file ~= nil) then
		do ctx:logError("DynamicModule" .. ": Null file") end
		do return false end
	end
	if not file:isFile() then
		do ctx:logError("DynamicModule" .. ": Not a file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'") end
		do return false end
	end
	do ctx:logDebug("Loading dynamic module: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'") end
	_io:write_to_stdout("[jk.module.DynamicModule.loadFile] (DynamicModule.sling:163:3): Not implemented." .. "\n")
	do return false end
end

function jk.module.DynamicModule:executeStaticMethod(ctx, entityName, methodName, params)
	_io:write_to_stdout("[jk.module.DynamicModule.executeStaticMethod] (DynamicModule.sling:246:3): Not implemented." .. "\n")
	do return false end
end

function jk.module.DynamicModule:createObject(ctx, className)
	_io:write_to_stdout("[jk.module.DynamicModule.createObject] (DynamicModule.sling:319:3): Not implemented." .. "\n")
	do return nil end
end
