sling = sling or {}

sling.tools = sling.tools or {}

sling.tools.execute = sling.tools.execute or {}

sling.tools.execute.SlingExecuteTool = {}
sling.tools.execute.SlingExecuteTool.__index = sling.tools.execute.SlingExecuteTool
_vm:set_metatable(sling.tools.execute.SlingExecuteTool, {})

function sling.tools.execute.SlingExecuteTool._create()
	local v = _vm:set_metatable({}, sling.tools.execute.SlingExecuteTool)
	return v
end

function sling.tools.execute.SlingExecuteTool:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.tools.execute.SlingExecuteTool'
	self['_isType.sling.tools.execute.SlingExecuteTool'] = true
	self._ctx = nil
	self._sources = nil
	self._output = nil
	self._tasks = nil
	self._providers = nil
	self._libraries = nil
end

function sling.tools.execute.SlingExecuteTool:_construct0()
	sling.tools.execute.SlingExecuteTool._init(self)
	return self
end

function sling.tools.execute.SlingExecuteTool:getTaskClasses()
	local v = {}
	local array = self:getTasks()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local task = array[n + 1]
				if task ~= nil then
					local pi = _g.sling.tools.common.ClassReference:parse(task)
					if not (pi ~= nil) then
						do _g.jk.lang.Error:throw("invalidClassReference", task) end
					end
					do _g.jk.lang.Vector:append(v, pi) end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function sling.tools.execute.SlingExecuteTool:getProviderInfos()
	local v = {}
	local array = self:getProviders()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local provider = array[n + 1]
				if provider ~= nil then
					local pp = provider
					local pi = _g.sling.tools.common.ClassReference:parse(pp)
					if not (pi ~= nil) then
						do _g.jk.lang.Error:throw("invalidProvider", pp) end
					end
					do _g.jk.lang.Vector:append(v, pi) end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function sling.tools.execute.SlingExecuteTool:escapeStringLiteral(original)
	if not (original ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local it = _g.jk.lang.String:iterate(original)
		local c = 0
		while (function()
			c = it:getNextChar()
			do return c end
		end)() > 0 do
			if c == 34 then
				do sb:appendString("\\\"") end
			elseif c == 7 then
				do sb:appendString("\\a") end
			elseif c == 8 then
				do sb:appendString("\\b") end
			elseif c == 12 then
				do sb:appendString("\\f") end
			elseif c == 10 then
				do sb:appendString("\\n") end
			elseif c == 13 then
				do sb:appendString("\\r") end
			elseif c == 9 then
				do sb:appendString("\\t") end
			elseif c == 11 then
				do sb:appendString("\\v") end
			elseif c == 92 then
				do sb:appendString("\\\\") end
			else
				do sb:appendCharacter(c) end
			end
		end
		do return sb:toString() end
	end
end

function sling.tools.execute.SlingExecuteTool:execute()
	local tasks = self:getTaskClasses()
	if _g.jk.lang.Vector:isEmpty(tasks) then
		do _g.jk.lang.Error:throw("noTasks", nil) end
	end
	do
		local providers = self:getProviderInfos()
		local script = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do script:appendString("") end
		do
			local array = self:getLibraries()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local library = array[n + 1]
						if library ~= nil then
							do script:appendString("\n\t\tlib ") end
							do script:appendString(library) end
							do script:appendString("\n\t\t") end
						end
						do n = n + 1 end
					end
				end
			end
			do script:appendString("\nimport jk.fs\nimport jk.script\nimport sling.task\n") end
			if tasks ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(tasks)
				do
					n2 = 0
					while n2 < m2 do
						local task = tasks[n2 + 1]
						if task ~= nil then
							do script:appendString("\n\t\tlib ") end
							do script:appendString(task:getLibName()) end
							do script:appendString(":") end
							do script:appendString(task:getLibVersion()) end
							do script:appendString("\n\t\timport ") end
							do script:appendString(task:getModuleName()) end
							do script:appendString("\n\t\t") end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			do script:appendString("\n") end
			if providers ~= nil then
				local n3 = 0
				local m3 = _g.jk.lang.Vector:getSize(providers)
				do
					n3 = 0
					while n3 < m3 do
						local provider = providers[n3 + 1]
						if provider ~= nil then
							do script:appendString("\n\t\tlib ") end
							do script:appendString(provider:getLibName()) end
							do script:appendString(":") end
							do script:appendString(provider:getLibVersion()) end
							do script:appendString("\n\t\timport ") end
							do script:appendString(provider:getModuleName()) end
							do script:appendString("\n\t\t") end
						end
						do n3 = n3 + 1 end
					end
				end
			end
			do script:appendString("\nvar script = new Script()\nscript.executeFunction(func {\n\tvar collection = new CollectionTask()\n\tcollection.setCtx(script.ctx)\n\t") end
			do
				local array2 = self:getSources()
				if array2 ~= nil then
					local n4 = 0
					local m4 = _g.jk.lang.Vector:getSize(array2)
					do
						n4 = 0
						while n4 < m4 do
							local source = array2[n4 + 1]
							if source ~= nil then
								do script:appendString("\n\t\tcollection.addToSources(File.forPath(\"") end
								do script:appendString(self:escapeStringLiteral(source:getPath())) end
								do script:appendString("\"))\n\t") end
							end
							do n4 = n4 + 1 end
						end
					end
				end
				do script:appendString("\n\t") end
				if self:getOutput() ~= nil then
					do script:appendString("\n\t\tcollection.setOutput(File.forPath(\"") end
					do script:appendString(self:escapeStringLiteral(self:getOutput():getPath())) end
					do script:appendString("\"))\n\t") end
				end
				do script:appendString("\n\t") end
				if tasks ~= nil then
					local n5 = 0
					local m5 = _g.jk.lang.Vector:getSize(tasks)
					do
						n5 = 0
						while n5 < m5 do
							local task = tasks[n5 + 1]
							if task ~= nil then
								do script:appendString("\n\t\t{\n\t\t\tvar ee = new ") end
								do script:appendString(task:getModuleName()) end
								do script:appendString(".") end
								do script:appendString(task:getClassName()) end
								do script:appendString("()\n\t\t\t") end
								if task:getData() ~= nil then
									do script:appendString("\n\t\t\t\tee.configure(\"") end
									do script:appendString(self:escapeStringLiteral(task:getData())) end
									do script:appendString("\")\n\t\t\t") end
								end
								do script:appendString("\n\t\t\t") end
								if providers ~= nil then
									local n6 = 0
									local m6 = _g.jk.lang.Vector:getSize(providers)
									do
										n6 = 0
										while n6 < m6 do
											local provider = providers[n6 + 1]
											if provider ~= nil then
												do script:appendString("\n\t\t\t\tee.addToProviders(new ") end
												do script:appendString(provider:getModuleName()) end
												do script:appendString(".") end
												do script:appendString(provider:getClassName()) end
												do script:appendString("())\n\t\t\t") end
											end
											do n6 = n6 + 1 end
										end
									end
								end
								do script:appendString("\n\t\t\tcollection.addToTasks(ee)\n\t\t}\n\t") end
							end
							do n5 = n5 + 1 end
						end
					end
				end
				do script:appendString("\n\tcollection.execute()\n})\n") end
				do
					local x = script:toString()
					if self:getCtx() ~= nil and self:getCtx():isInDebugMode() then
						do _g.jk.log.Log:debug(self:getCtx(), x) end
					end
					do
						local code = _g.sling.tools.common.SlingScriptCompiler._construct1(_g.sling.tools.common.SlingScriptCompiler._create(), self:getCtx()):toSushiCode(x)
						local r = _g.jk.sushi.SushiKit._construct1(_g.jk.sushi.SushiKit._create(), self:getCtx()):executeBuffer(code, nil)
						if r ~= 0 then
							do _g.jk.lang.Error:throw("conversionFailed", nil) end
						end
					end
				end
			end
		end
	end
end

function sling.tools.execute.SlingExecuteTool:getCtx()
	do return self._ctx end
end

function sling.tools.execute.SlingExecuteTool:doSetCtx(value)
	self._ctx = value
end

function sling.tools.execute.SlingExecuteTool:setCtx(v)
	do self:doSetCtx(v) end
	do return v end
end

function sling.tools.execute.SlingExecuteTool:getSources()
	do return self._sources end
end

function sling.tools.execute.SlingExecuteTool:doSetSources(value)
	self._sources = value
end

function sling.tools.execute.SlingExecuteTool:setSources(v)
	do self:doSetSources(v) end
	do return v end
end

function sling.tools.execute.SlingExecuteTool:getOutput()
	do return self._output end
end

function sling.tools.execute.SlingExecuteTool:doSetOutput(value)
	self._output = value
end

function sling.tools.execute.SlingExecuteTool:setOutput(v)
	do self:doSetOutput(v) end
	do return v end
end

function sling.tools.execute.SlingExecuteTool:getTasks()
	do return self._tasks end
end

function sling.tools.execute.SlingExecuteTool:doSetTasks(value)
	self._tasks = value
end

function sling.tools.execute.SlingExecuteTool:setTasks(v)
	do self:doSetTasks(v) end
	do return v end
end

function sling.tools.execute.SlingExecuteTool:getProviders()
	do return self._providers end
end

function sling.tools.execute.SlingExecuteTool:doSetProviders(value)
	self._providers = value
end

function sling.tools.execute.SlingExecuteTool:setProviders(v)
	do self:doSetProviders(v) end
	do return v end
end

function sling.tools.execute.SlingExecuteTool:getLibraries()
	do return self._libraries end
end

function sling.tools.execute.SlingExecuteTool:doSetLibraries(value)
	self._libraries = value
end

function sling.tools.execute.SlingExecuteTool:setLibraries(v)
	do self:doSetLibraries(v) end
	do return v end
end
