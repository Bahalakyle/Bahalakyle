sling = sling or {}

sling.tools = sling.tools or {}

sling.tools.common = sling.tools.common or {}

sling.tools.common.ClassReference = {}
sling.tools.common.ClassReference.__index = sling.tools.common.ClassReference
_vm:set_metatable(sling.tools.common.ClassReference, {})

function sling.tools.common.ClassReference._create()
	local v = _vm:set_metatable({}, sling.tools.common.ClassReference)
	return v
end

function sling.tools.common.ClassReference:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.tools.common.ClassReference'
	self['_isType.sling.tools.common.ClassReference'] = true
	self._libName = nil
	self._libVersion = nil
	self._moduleName = nil
	self._className = nil
	self._data = nil
end

function sling.tools.common.ClassReference:_construct0()
	sling.tools.common.ClassReference._init(self)
	return self
end

function sling.tools.common.ClassReference:parse(string)
	if not (string ~= nil) then
		do return nil end
	end
	do
		local c1 = _g.jk.lang.String:split(string, 47, 2)
		local p1 = _g.jk.lang.Vector:get(c1, 0)
		local p2 = _g.jk.lang.Vector:get(c1, 1)
		if _g.jk.lang.String:isEmpty(p1) or _g.jk.lang.String:isEmpty(p2) then
			do return nil end
		end
		do
			local c2 = _g.jk.lang.String:split(p1, 58, 2)
			local libName = _g.jk.lang.Vector:get(c2, 0)
			local libVersion = _g.jk.lang.Vector:get(c2, 1)
			if _g.jk.lang.String:isEmpty(libName) or _g.jk.lang.String:isEmpty(libVersion) then
				do return nil end
			end
			do
				local c3 = _g.jk.lang.String:split(p2, 58, 2)
				local p3 = _g.jk.lang.Vector:get(c3, 0)
				local data = _g.jk.lang.Vector:get(c3, 1)
				local lastdot = _g.jk.lang.String:getLastIndexOfCharacter(p3, 46, -1)
				if lastdot < 0 then
					do return nil end
				end
				do
					local moduleName = _g.jk.lang.String:getSubString(p3, 0, lastdot)
					local className = _g.jk.lang.String:getEndOfString(p3, lastdot + 1)
					if _g.jk.lang.String:isEmpty(moduleName) or _g.jk.lang.String:isEmpty(className) then
						do return nil end
					end
					do
						local v = _g.sling.tools.common.ClassReference._construct0(_g.sling.tools.common.ClassReference._create())
						do v:setLibName(libName) end
						do v:setLibVersion(libVersion) end
						do v:setModuleName(moduleName) end
						do v:setClassName(className) end
						do v:setData(data) end
						do return v end
					end
				end
			end
		end
	end
end

function sling.tools.common.ClassReference:getLibName()
	do return self._libName end
end

function sling.tools.common.ClassReference:doSetLibName(value)
	self._libName = value
end

function sling.tools.common.ClassReference:setLibName(v)
	do self:doSetLibName(v) end
	do return v end
end

function sling.tools.common.ClassReference:getLibVersion()
	do return self._libVersion end
end

function sling.tools.common.ClassReference:doSetLibVersion(value)
	self._libVersion = value
end

function sling.tools.common.ClassReference:setLibVersion(v)
	do self:doSetLibVersion(v) end
	do return v end
end

function sling.tools.common.ClassReference:getModuleName()
	do return self._moduleName end
end

function sling.tools.common.ClassReference:doSetModuleName(value)
	self._moduleName = value
end

function sling.tools.common.ClassReference:setModuleName(v)
	do self:doSetModuleName(v) end
	do return v end
end

function sling.tools.common.ClassReference:getClassName()
	do return self._className end
end

function sling.tools.common.ClassReference:doSetClassName(value)
	self._className = value
end

function sling.tools.common.ClassReference:setClassName(v)
	do self:doSetClassName(v) end
	do return v end
end

function sling.tools.common.ClassReference:getData()
	do return self._data end
end

function sling.tools.common.ClassReference:doSetData(value)
	self._data = value
end

function sling.tools.common.ClassReference:setData(v)
	do self:doSetData(v) end
	do return v end
end

sling.tools.common.SlingScriptCompiler = {}
sling.tools.common.SlingScriptCompiler.__index = sling.tools.common.SlingScriptCompiler
_vm:set_metatable(sling.tools.common.SlingScriptCompiler, {})

function sling.tools.common.SlingScriptCompiler._create()
	local v = _vm:set_metatable({}, sling.tools.common.SlingScriptCompiler)
	return v
end

function sling.tools.common.SlingScriptCompiler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.tools.common.SlingScriptCompiler'
	self['_isType.sling.tools.common.SlingScriptCompiler'] = true
	self.ctx = nil
	self._useCloudBuild = false
	self._vm = "sushi"
	self._interpreter = "ss-0.21"
end

function sling.tools.common.SlingScriptCompiler:_construct0()
	sling.tools.common.SlingScriptCompiler._init(self)
	return self
end

function sling.tools.common.SlingScriptCompiler:_construct1(ctx)
	sling.tools.common.SlingScriptCompiler._init(self)
	self.ctx = ctx
	return self
end

function sling.tools.common.SlingScriptCompiler:toSushiCodeInCloud(script)
	do _g.jk.lang.Error:throw("notImplemented", "cloudBuild") end
	do return nil end
end

function sling.tools.common.SlingScriptCompiler:fileToSushi(file)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local pl = nil
		pl = _g.jk.process.ProcessLauncher:forSelf()
		if not (pl ~= nil) then
			pl = _g.jk.process.ProcessLauncher:forCommand(self:getVm(), nil)
		end
		if not (pl ~= nil) then
			do _g.jk.lang.Error:throw("failedToFindSushiVm", nil) end
		end
		do
			local output = _g.jk.env.TemporaryFile:create(nil)
			do pl:addToParams(self:getInterpreter()) end
			do pl:addToParams("-c") end
			do pl:addToParams("-o") end
			do pl:addToParams(output:getPath()) end
			do pl:addToParams(file:getPath()) end
			do
				local r = pl:execute()
				if r ~= 0 then
					do _g.jk.log.Log:debug(self.ctx, "Failed to compile temporary file: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. "'") end
					do output:remove() end
					do return nil end
				end
				do
					local v = output:getContentsBuffer()
					do output:remove() end
					do return v end
				end
			end
		end
	end
end

function sling.tools.common.SlingScriptCompiler:toSushiCode(script)
	if self.ctx:isInDebugMode() then
		do _g.jk.log.Log:debug(self.ctx, script) end
	end
	do
		local v = nil
		if self:getUseCloudBuild() then
			v = self:toSushiCodeInCloud(script)
		else
			local codeFile = _g.jk.env.TemporaryFile:forString(script)
			if not (codeFile ~= nil) then
				do _g.jk.lang.Error:throw("failedToCreate", "temporaryFile") end
			end
			do
				local r = self:fileToSushi(codeFile)
				do codeFile:remove() end
				if not (r ~= nil) then
					do _g.jk.lang.Error:throw("failedToBuildScript", nil) end
				end
				v = r
			end
		end
		do return v end
	end
end

function sling.tools.common.SlingScriptCompiler:getUseCloudBuild()
	do return self._useCloudBuild end
end

function sling.tools.common.SlingScriptCompiler:doSetUseCloudBuild(value)
	self._useCloudBuild = value
end

function sling.tools.common.SlingScriptCompiler:setUseCloudBuild(v)
	do self:doSetUseCloudBuild(v) end
	do return v end
end

function sling.tools.common.SlingScriptCompiler:getVm()
	do return self._vm end
end

function sling.tools.common.SlingScriptCompiler:doSetVm(value)
	self._vm = value
end

function sling.tools.common.SlingScriptCompiler:setVm(v)
	do self:doSetVm(v) end
	do return v end
end

function sling.tools.common.SlingScriptCompiler:getInterpreter()
	do return self._interpreter end
end

function sling.tools.common.SlingScriptCompiler:doSetInterpreter(value)
	self._interpreter = value
end

function sling.tools.common.SlingScriptCompiler:setInterpreter(v)
	do self:doSetInterpreter(v) end
	do return v end
end
