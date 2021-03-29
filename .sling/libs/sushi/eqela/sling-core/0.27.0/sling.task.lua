sling = sling or {}

sling.task = sling.task or {}

sling.task.SlingTask = {}
sling.task.SlingTask.__index = sling.task.SlingTask
_vm:set_metatable(sling.task.SlingTask, {})

function sling.task.SlingTask._create()
	local v = _vm:set_metatable({}, sling.task.SlingTask)
	return v
end

function sling.task.SlingTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.task.SlingTask'
	self['_isType.sling.task.SlingTask'] = true
	self._ctx = nil
	self._sources = nil
	self._output = nil
end

function sling.task.SlingTask:_construct0()
	sling.task.SlingTask._init(self)
	return self
end

function sling.task.SlingTask:addToSources(file)
	if not (file ~= nil) then
		do return end
	end
	if not (self:getSources() ~= nil) then
		do self:setSources({}) end
	end
	do _g.jk.lang.Vector:append(self:getSources(), file) end
end

function sling.task.SlingTask:configureValue(key, value)
	if key == "source" then
		do self:addToSources(_g.jk.fs.File:asFile(value)) end
		do return end
	end
	if key == "sources" then
		do self:setSources(nil) end
		do
			local dv = _g.jk.lang.DynamicVector:asDynamicVector(value)
			if dv ~= nil then
				local array = dv:toVector()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local file = _vm:to_table_with_key(array[n + 1], '_isType.jk.fs.File')
							if file ~= nil then
								do self:addToSources(file) end
							end
							do n = n + 1 end
						end
					end
				end
			end
			do return end
		end
	end
	if key == "output" then
		do self:setOutput(_g.jk.fs.File:asFile(value)) end
		do return end
	end
	do _g.jk.lang.Error:throw("unsupportedConfigurationValue", key) end
end

function sling.task.SlingTask:configure(data)
	if not _g.jk.lang.String:isNotEmpty(data) then
		do return end
	end
	do
		local config = _vm:to_table_with_key(_g.jk.slon.SLONParser:parseString(data), '_isType.jk.lang.DynamicMap')
		if not (config ~= nil) then
			do _g.jk.lang.Error:throw("invalidConfig", data) end
		end
		do
			local array = config:getKeys()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local key = array[n + 1]
						if key ~= nil then
							local value = config:get(key)
							do _g.jk.log.Log:debug(self:getCtx(), "Configuration: `" .. _g.jk.lang.String:safeString(key) .. "' = `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(value)) .. "'") end
							do self:configureValue(key, value) end
						end
						do n = n + 1 end
					end
				end
			end
		end
	end
end

function sling.task.SlingTask:getAllFiles()
	local v = {}
	local array = self:getSources()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local source = array[n + 1]
				if source ~= nil then
					if source:isFile() then
						do _g.jk.lang.Vector:append(v, source) end
						goto _continue1
					end
					if source:isDirectory() then
						local it = _g.jk.fs.FileFinder:forRoot(source)
						do it:addExcludePattern(".git") end
						do it:addExcludePattern(".svn") end
						if not (it ~= nil) then
							goto _continue1
						end
						while true do
							local f = it:next()
							if not (f ~= nil) then
								do break end
							end
							do _g.jk.lang.Vector:append(v, f) end
						end
						goto _continue1
					end
					do _g.jk.lang.Error:throw("notFileOrDirectory", source) end
				end
				::_continue1::
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function sling.task.SlingTask:iterateAllFiles()
	do return _g.jk.lang.Vector:iterate(self:getAllFiles()) end
end

function sling.task.SlingTask:writeOutputFile(name, data)
	if self:getOutput() ~= nil and name ~= nil then
		if not self:getOutput():exists() then
			do self:getOutput():createDirectoryRecursive() end
		end
		do
			local df = self:getOutput():entry(name)
			if not df:setContentsUTF8(data) then
				do _g.jk.lang.Error:throw("failedToWriteFile", df) end
			end
			do _g.jk.log.Log:info(self:getCtx(), "Wrote: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(df)) .. "'") end
		end
	else
		_io:write_to_stdout(data)
	end
end

function sling.task.SlingTask:execute()
end

function sling.task.SlingTask:getCtx()
	do return self._ctx end
end

function sling.task.SlingTask:doSetCtx(value)
	self._ctx = value
end

function sling.task.SlingTask:setCtx(v)
	do self:doSetCtx(v) end
	do return v end
end

function sling.task.SlingTask:getSources()
	do return self._sources end
end

function sling.task.SlingTask:doSetSources(value)
	self._sources = value
end

function sling.task.SlingTask:setSources(v)
	do self:doSetSources(v) end
	do return v end
end

function sling.task.SlingTask:getOutput()
	do return self._output end
end

function sling.task.SlingTask:doSetOutput(value)
	self._output = value
end

function sling.task.SlingTask:setOutput(v)
	do self:doSetOutput(v) end
	do return v end
end

sling.task.FileTask = _g.sling.task.SlingTask._create()
sling.task.FileTask.__index = sling.task.FileTask
_vm:set_metatable(sling.task.FileTask, {
	__index = _g.sling.task.SlingTask
})

function sling.task.FileTask._create()
	local v = _vm:set_metatable({}, sling.task.FileTask)
	return v
end

function sling.task.FileTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.task.FileTask'
	self['_isType.sling.task.FileTask'] = true
end

function sling.task.FileTask:_construct0()
	sling.task.FileTask._init(self)
	do _g.sling.task.SlingTask._construct0(self) end
	return self
end

function sling.task.FileTask:execute()
	do self:executeForAllFiles() end
end

function sling.task.FileTask:executeForAllFiles()
	local it = self:iterateAllFiles()
	while it ~= nil do
		local f = it:next()
		if not (f ~= nil) then
			do break end
		end
		do self:executeForFile(f) end
	end
end

function sling.task.FileTask:forEachFile(handler)
	local it = self:iterateAllFiles()
	while it ~= nil do
		local f = it:next()
		if not (f ~= nil) then
			do break end
		end
		do handler(f) end
	end
end

function sling.task.FileTask:executeForFile(file)
end

sling.task.TextFileEditorTask = _g.sling.task.FileTask._create()
sling.task.TextFileEditorTask.__index = sling.task.TextFileEditorTask
_vm:set_metatable(sling.task.TextFileEditorTask, {
	__index = _g.sling.task.FileTask
})

function sling.task.TextFileEditorTask._create()
	local v = _vm:set_metatable({}, sling.task.TextFileEditorTask)
	return v
end

function sling.task.TextFileEditorTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.task.TextFileEditorTask'
	self['_isType.sling.task.TextFileEditorTask'] = true
	self._action = "edit"
end

function sling.task.TextFileEditorTask:_construct0()
	sling.task.TextFileEditorTask._init(self)
	do _g.sling.task.FileTask._construct0(self) end
	return self
end

function sling.task.TextFileEditorTask:configureValue(key, value)
	if key == "action" then
		do self:setAction(_g.jk.lang.String:asString(value)) end
		do return end
	end
	do _g.sling.task.FileTask.configureValue(self, key, value) end
end

function sling.task.TextFileEditorTask:executeForFile(file)
	if not (file ~= nil) then
		do _g.jk.lang.Error:throw("nullFile", nil) end
	end
	do
		local cc = file:getContentsUTF8()
		if not (cc ~= nil) then
			do _g.jk.lang.Error:throw("failedToReadFile", file) end
		end
		do
			local nn = self:executeForFileContents(cc, file)
			if not (nn ~= nil) then
				do _g.jk.log.Log:debug(self:getCtx(), "Null reponse from executeForFileContents for `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. "'. Not taking any action.") end
				do return end
			end
			if self:getAction() == "edit" then
				local ff = file
				if self:getOutput() ~= nil then
					ff = self:getOutput():entry(file:getBasename())
				end
				if not _g.jk.lang.String:equals(nn, cc) then
					if not ff:setContentsUTF8(nn) then
						do _g.jk.lang.Error:throw("failedToWriteFile", ff) end
					end
					do _g.jk.log.Log:info(self:getCtx(), "Wrote: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(ff)) .. "'") end
				end
			elseif self:getAction() == "print" then
				_io:write_to_stdout(nn)
			elseif self:getAction() == "diff" then
				local diff = _g.jk.diff.UnifiedDiff:execute(file:getPath(), cc, nn)
				if diff ~= nil then
					_io:write_to_stdout(diff)
				end
			else
				do _g.jk.lang.Error:throw("unsupportedAction", self:getAction()) end
			end
		end
	end
end

function sling.task.TextFileEditorTask:executeForFileContents(data, file)
end

function sling.task.TextFileEditorTask:getAction()
	do return self._action end
end

function sling.task.TextFileEditorTask:doSetAction(value)
	self._action = value
end

function sling.task.TextFileEditorTask:setAction(v)
	do self:doSetAction(v) end
	do return v end
end

sling.task.CodeFileTask = _g.sling.task.FileTask._create()
sling.task.CodeFileTask.__index = sling.task.CodeFileTask
_vm:set_metatable(sling.task.CodeFileTask, {
	__index = _g.sling.task.FileTask
})

function sling.task.CodeFileTask._create()
	local v = _vm:set_metatable({}, sling.task.CodeFileTask)
	return v
end

function sling.task.CodeFileTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.task.CodeFileTask'
	self['_isType.sling.task.CodeFileTask'] = true
	self.providers = nil
end

function sling.task.CodeFileTask:_construct0()
	sling.task.CodeFileTask._init(self)
	do _g.sling.task.FileTask._construct0(self) end
	return self
end

function sling.task.CodeFileTask:addToProviders(provider)
	if not (provider ~= nil) then
		do return end
	end
	if not (self.providers ~= nil) then
		self.providers = {}
	end
	do _g.jk.lang.Vector:append(self.providers, provider) end
end

function sling.task.CodeFileTask:getImportProviderForFile(file)
	if not (file ~= nil) then
		do return nil end
	end
	if self.providers ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.providers)
		do
			n = 0
			while n < m do
				local provider = self.providers[n + 1]
				if provider ~= nil then
					local v = provider:getParserForFile(file)
					if v ~= nil then
						do return provider end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return nil end
end

function sling.task.CodeFileTask:isSupportedSourceFile(file)
	if self:getImportProviderForFile(file) ~= nil then
		do return true end
	end
	do _g.jk.log.Log:debug(self:getCtx(), "Not a supported source code file: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. "'") end
	do return false end
end

function sling.task.CodeFileTask:getParserForFile(file)
	if not (file ~= nil) then
		do return nil end
	end
	if self.providers ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.providers)
		do
			n = 0
			while n < m do
				local provider = self.providers[n + 1]
				if provider ~= nil then
					local v = provider:getParserForFile(file)
					if v ~= nil then
						do v:setCtx(self:getCtx()) end
						do return v end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return nil end
end

function sling.task.CodeFileTask:parseFileWithContext(nctx, file)
	if not (file ~= nil) then
		do return nil end
	end
	if not file:isFile() then
		do return nil end
	end
	do
		local parser = self:getParserForFile(file)
		if not (parser ~= nil) then
			do _g.jk.lang.Error:throw("fileNotSupported", file) end
		end
		if nctx ~= nil then
			do parser:setCtx(nctx) end
		end
		do _g.jk.log.Log:status(self:getCtx(), "[Reading] " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. " ..") end
		do
			local r = parser:parseFile(file)
			do _g.jk.log.Log:status(self:getCtx(), nil) end
			do return r end
		end
	end
end

function sling.task.CodeFileTask:parseFile(file)
	do return self:parseFileWithContext(nil, file) end
end

function sling.task.CodeFileTask:forEachSupportedFile(handler)
	do self:forEachFile(function(file)
		if self:isSupportedSourceFile(file) then
			do handler(file) end
		end
	end) end
end

function sling.task.CodeFileTask:forEachSupportedCodeFile(errors, handler)
	local nctx = _g.sling.common.RefLogCollectorContext._construct0(_g.sling.common.RefLogCollectorContext._create())
	do self:forEachSupportedFile(function(file)
		do
			local _status, _err = _vm:execute_protected_call(function()
				local tree = self:parseFileWithContext(nctx, file)
				if not (tree ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to parse file: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. "'", nil, nil))
				end
				do handler(nctx, tree) end
			end)
			if _err then
				if (_vm:to_table_with_key(_err, '_isType.sling.common.ReferenceError') ~= nil) then
					local e = _err
					do nctx:onMessage(e:getError()) end
				elseif (_vm:to_table_with_key(_err, '_isType.jk.lang.Error') ~= nil) then
					local e = _err
					do _g.sling.common.RefLog:error(nctx, e:toString(), nil, nil) end
				else
					_vm:throw_error(_err)
				end
			end
		end
	end) end
	if errors ~= nil then
		local array = nctx:getMessages()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local msg = array[n + 1]
					if msg ~= nil then
						do _g.jk.lang.Vector:append(errors, msg:toStringWithDebug(true)) end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

sling.task.SlingFileEditorTask = _g.sling.task.TextFileEditorTask._create()
sling.task.SlingFileEditorTask.__index = sling.task.SlingFileEditorTask
_vm:set_metatable(sling.task.SlingFileEditorTask, {
	__index = _g.sling.task.TextFileEditorTask
})

function sling.task.SlingFileEditorTask._create()
	local v = _vm:set_metatable({}, sling.task.SlingFileEditorTask)
	return v
end

function sling.task.SlingFileEditorTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.task.SlingFileEditorTask'
	self['_isType.sling.task.SlingFileEditorTask'] = true
end

function sling.task.SlingFileEditorTask:_construct0()
	sling.task.SlingFileEditorTask._init(self)
	do _g.sling.task.TextFileEditorTask._construct0(self) end
	return self
end

function sling.task.SlingFileEditorTask:executeForFileContents(data, file)
	if not file:hasExtension("sling") then
		do return nil end
	end
	do _g.sling.common.RefLog:status(self:getCtx(), "[sling:parse] " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. " .. ") end
	do
		local ff = _g.sling.parser.SlingParserUtil:parseString(self:getCtx(), data, _g.jk.lang.String:asString(file))
		do _g.sling.common.RefLog:status(self:getCtx(), "[sling:process] " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. " .. ") end
		do self:processSlingCodeTree(ff) end
		do _g.sling.common.RefLog:status(self:getCtx(), "[sling:generate] " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. " .. ") end
		do
			local v = _g.sling.generator.SlingGeneratorUtil:dumpToString(self:getCtx(), ff)
			do _g.sling.common.RefLog:status(self:getCtx(), nil) end
			do return v end
		end
	end
end

function sling.task.SlingFileEditorTask:processSlingCodeTree(tree)
end

sling.task.CollectionTask = _g.sling.task.SlingTask._create()
sling.task.CollectionTask.__index = sling.task.CollectionTask
_vm:set_metatable(sling.task.CollectionTask, {
	__index = _g.sling.task.SlingTask
})

function sling.task.CollectionTask._create()
	local v = _vm:set_metatable({}, sling.task.CollectionTask)
	return v
end

function sling.task.CollectionTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.task.CollectionTask'
	self['_isType.sling.task.CollectionTask'] = true
	self._tasks = nil
end

function sling.task.CollectionTask:_construct0()
	sling.task.CollectionTask._init(self)
	do _g.sling.task.SlingTask._construct0(self) end
	return self
end

function sling.task.CollectionTask:addToTasks(task)
	if not (task ~= nil) then
		do return end
	end
	if not (self:getTasks() ~= nil) then
		do self:setTasks({}) end
	end
	do _g.jk.lang.Vector:append(self:getTasks(), task) end
end

function sling.task.CollectionTask:execute()
	local array = self:getTasks()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local task = array[n + 1]
				if task ~= nil then
					do task:setCtx(self:getCtx()) end
					do task:setSources(self:getSources()) end
					do task:setOutput(self:getOutput()) end
					do task:execute() end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.task.CollectionTask:getTasks()
	do return self._tasks end
end

function sling.task.CollectionTask:doSetTasks(value)
	self._tasks = value
end

function sling.task.CollectionTask:setTasks(v)
	do self:doSetTasks(v) end
	do return v end
end
