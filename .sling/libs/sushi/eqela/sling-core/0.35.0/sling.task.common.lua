sling = sling or {}

sling.task = sling.task or {}

sling.task.common = sling.task.common or {}

sling.task.common.SlingCleanTask = _g.sling.task.SlingFileEditorTask._create()
sling.task.common.SlingCleanTask.__index = sling.task.common.SlingCleanTask
_vm:set_metatable(sling.task.common.SlingCleanTask, {
	__index = _g.sling.task.SlingFileEditorTask
})

function sling.task.common.SlingCleanTask._create()
	local v = _vm:set_metatable({}, sling.task.common.SlingCleanTask)
	return v
end

function sling.task.common.SlingCleanTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.task.common.SlingCleanTask'
	self['_isType.sling.task.common.SlingCleanTask'] = true
end

function sling.task.common.SlingCleanTask:_construct0()
	sling.task.common.SlingCleanTask._init(self)
	do _g.sling.task.SlingFileEditorTask._construct0(self) end
	return self
end

function sling.task.common.SlingCleanTask:getRealEntityChildPriority(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.TreeDeclarationNode') ~= nil) then
		do return 1 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StyleSheetDeclarationNode') ~= nil) then
		do return 2 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PropertyDeclarationNode') ~= nil) then
		do return 3 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
		do return 4 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ConstructorDeclarationNode') ~= nil) then
		do return 5 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DestructorDeclarationNode') ~= nil) then
		do return 6 end
	end
	do return 100 end
end

function sling.task.common.SlingCleanTask:getEntityChildPriority(node)
	local r = self:getRealEntityChildPriority(node)
	if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.STATIC) then
		do return r end
	end
	do return r + 100 end
end

function sling.task.common.SlingCleanTask:cleanEntities(tree)
	local array = _g.sling.util.FindUtil:findCompatibleNodes(tree, "class:sling.model.EntityDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local ee = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
				if ee ~= nil then
					do _g.jk.lang.Vector:sort(ee:getNodes(), function(aobj, bobj)
						local ap = self:getEntityChildPriority(_vm:to_table_with_key(aobj, '_isType.sling.common.NodeObject'))
						local bp = self:getEntityChildPriority(_vm:to_table_with_key(bobj, '_isType.sling.common.NodeObject'))
						if ap < bp then
							do return -1 end
						end
						if ap > bp then
							do return 1 end
						end
						if (_vm:to_table_with_key(aobj, '_isType.sling.common.NamedNode') ~= nil) and (_vm:to_table_with_key(bobj, '_isType.sling.common.NamedNode') ~= nil) then
							do return _g.jk.lang.String:compare(aobj:getNodeName(), bobj:getNodeName()) end
						end
						do return 0 end
					end) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.task.common.SlingCleanTask:processSlingCodeTree(tree)
	do self:cleanEntities(tree) end
end

sling.task.common.SlingLintTask = _g.sling.task.SlingFileEditorTask._create()
sling.task.common.SlingLintTask.__index = sling.task.common.SlingLintTask
_vm:set_metatable(sling.task.common.SlingLintTask, {
	__index = _g.sling.task.SlingFileEditorTask
})

function sling.task.common.SlingLintTask._create()
	local v = _vm:set_metatable({}, sling.task.common.SlingLintTask)
	return v
end

function sling.task.common.SlingLintTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.task.common.SlingLintTask'
	self['_isType.sling.task.common.SlingLintTask'] = true
end

function sling.task.common.SlingLintTask:_construct0()
	sling.task.common.SlingLintTask._init(self)
	do _g.sling.task.SlingFileEditorTask._construct0(self) end
	return self
end

function sling.task.common.SlingLintTask:processSlingCodeTree(tree)
end

sling.task.common.ImportCodeFilesTask = _g.sling.task.CodeFileTask._create()
sling.task.common.ImportCodeFilesTask.__index = sling.task.common.ImportCodeFilesTask
_vm:set_metatable(sling.task.common.ImportCodeFilesTask, {
	__index = _g.sling.task.CodeFileTask
})

function sling.task.common.ImportCodeFilesTask._create()
	local v = _vm:set_metatable({}, sling.task.common.ImportCodeFilesTask)
	return v
end

function sling.task.common.ImportCodeFilesTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.task.common.ImportCodeFilesTask'
	self['_isType.sling.task.common.ImportCodeFilesTask'] = true
	self._removeOriginal = false
	self._outputFiles = nil
end

function sling.task.common.ImportCodeFilesTask:_construct0()
	sling.task.common.ImportCodeFilesTask._init(self)
	do _g.sling.task.CodeFileTask._construct0(self) end
	return self
end

function sling.task.common.ImportCodeFilesTask:configureValue(key, value)
	if key == "removeOriginal" then
		do self:setRemoveOriginal(_g.jk.lang.Boolean:asBoolean(value, false)) end
		do return end
	end
	do _g.sling.task.CodeFileTask.configureValue(self, key, value) end
end

function sling.task.common.ImportCodeFilesTask:readAndTransform(file)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local provider = self:getImportProviderForFile(file)
		if not (provider ~= nil) then
			do _g.jk.lang.Error:throw("unsupportedFile", file) end
		end
		do
			local parser = provider:getParserForFile(file)
			if not (parser ~= nil) then
				do _g.jk.lang.Error:throw("noParserForFile", file) end
			end
			do parser:setCtx(self:getCtx()) end
			do _g.jk.log.Log:status(self:getCtx(), "[Reading] " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. " ..") end
			do
				local tree = parser:parseFile(file)
				do _g.jk.log.Log:status(self:getCtx(), nil) end
				if not (tree ~= nil) then
					do _g.jk.lang.Error:throw("failedToParseFile", file) end
				end
				do _g.jk.log.Log:status(self:getCtx(), "[Transforming] " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. " ..") end
				do provider:transformToSling(self:getCtx(), tree) end
				do _g.jk.log.Log:status(self:getCtx(), nil) end
				do return tree end
			end
		end
	end
end

function sling.task.common.ImportCodeFilesTask:importToFile(file, outputDir)
	local tree = self:readAndTransform(file)
	if not (tree ~= nil) then
		do _g.jk.lang.Error:throw("failedToImport", file) end
	end
	do
		local od = self:getOutput()
		if not (od ~= nil) then
			od = file:getParent()
		end
		do
			local owm = _g.sling.common.DirectoryOutputWriterManager:forDirectory(self:getCtx(), od, true)
			local generator = _g.sling.generator.SlingGenerator._construct2(_g.sling.generator.SlingGenerator._create(), self:getCtx(), owm)
			do _g.jk.log.Log:status(self:getCtx(), "[Generating] " .. _g.jk.lang.String:safeString(tree:getName()) .. " ..") end
			do generator:dumpFile(tree) end
			do _g.jk.log.Log:status(self:getCtx(), nil) end
			if self:getRemoveOriginal() then
				do file:remove() end
			end
			do return owm:getFiles() end
		end
	end
end

function sling.task.common.ImportCodeFilesTask:executeForFile(file)
	if self:isSupportedSourceFile(file) then
		local files = self:importToFile(file, self:getOutput())
		if files ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(files)
			do
				n = 0
				while n < m do
					local of = files[n + 1]
					if of ~= nil then
						if not (self:getOutputFiles() ~= nil) then
							do self:setOutputFiles({}) end
						end
						do _g.jk.lang.Vector:append(self:getOutputFiles(), of) end
						do _g.jk.log.Log:info(self:getCtx(), "Imported: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(of)) .. "'") end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.task.common.ImportCodeFilesTask:getRemoveOriginal()
	do return self._removeOriginal end
end

function sling.task.common.ImportCodeFilesTask:doSetRemoveOriginal(value)
	self._removeOriginal = value
end

function sling.task.common.ImportCodeFilesTask:setRemoveOriginal(v)
	do self:doSetRemoveOriginal(v) end
	do return v end
end

function sling.task.common.ImportCodeFilesTask:getOutputFiles()
	do return self._outputFiles end
end

function sling.task.common.ImportCodeFilesTask:doSetOutputFiles(value)
	self._outputFiles = value
end

function sling.task.common.ImportCodeFilesTask:setOutputFiles(v)
	do self:doSetOutputFiles(v) end
	do return v end
end

sling.task.common.SlingFindTask = _g.sling.task.FileTask._create()
sling.task.common.SlingFindTask.__index = sling.task.common.SlingFindTask
_vm:set_metatable(sling.task.common.SlingFindTask, {
	__index = _g.sling.task.FileTask
})

function sling.task.common.SlingFindTask._create()
	local v = _vm:set_metatable({}, sling.task.common.SlingFindTask)
	return v
end

function sling.task.common.SlingFindTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.task.common.SlingFindTask'
	self['_isType.sling.task.common.SlingFindTask'] = true
end

function sling.task.common.SlingFindTask:_construct0()
	sling.task.common.SlingFindTask._init(self)
	do _g.sling.task.FileTask._construct0(self) end
	return self
end

function sling.task.common.SlingFindTask:executeForFile(file)
	if file:hasExtension("sling") then
		do _g.jk.log.Log:info(self:getCtx(), _g.jk.lang.String:asString(file)) end
	end
end

sling.task.common.ParseCodeFilesTask = _g.sling.task.CodeFileTask._create()
sling.task.common.ParseCodeFilesTask.__index = sling.task.common.ParseCodeFilesTask
_vm:set_metatable(sling.task.common.ParseCodeFilesTask, {
	__index = _g.sling.task.CodeFileTask
})

function sling.task.common.ParseCodeFilesTask._create()
	local v = _vm:set_metatable({}, sling.task.common.ParseCodeFilesTask)
	return v
end

function sling.task.common.ParseCodeFilesTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.task.common.ParseCodeFilesTask'
	self['_isType.sling.task.common.ParseCodeFilesTask'] = true
end

function sling.task.common.ParseCodeFilesTask:_construct0()
	sling.task.common.ParseCodeFilesTask._init(self)
	do _g.sling.task.CodeFileTask._construct0(self) end
	return self
end

function sling.task.common.ParseCodeFilesTask:executeForFile(file)
	if self:isSupportedSourceFile(file) then
		do self:parseFile(file) end
		do _g.jk.log.Log:info(self:getCtx(), "Parsed: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. "'") end
	end
end

sling.task.common.ValidateCodeFilesTask = _g.sling.task.CodeFileTask._create()
sling.task.common.ValidateCodeFilesTask.__index = sling.task.common.ValidateCodeFilesTask
_vm:set_metatable(sling.task.common.ValidateCodeFilesTask, {
	__index = _g.sling.task.CodeFileTask
})

function sling.task.common.ValidateCodeFilesTask._create()
	local v = _vm:set_metatable({}, sling.task.common.ValidateCodeFilesTask)
	return v
end

function sling.task.common.ValidateCodeFilesTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.task.common.ValidateCodeFilesTask'
	self['_isType.sling.task.common.ValidateCodeFilesTask'] = true
end

function sling.task.common.ValidateCodeFilesTask:_construct0()
	sling.task.common.ValidateCodeFilesTask._init(self)
	do _g.sling.task.CodeFileTask._construct0(self) end
	return self
end

function sling.task.common.ValidateCodeFilesTask:validateParserGeneratorForFile(file)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local provider = self:getImportProviderForFile(file)
		if not (provider ~= nil) then
			do _g.jk.lang.Error:throw("unsupportedFile", file) end
		end
		do
			local parser = provider:getParserForFile(file)
			if not (parser ~= nil) then
				do _g.jk.lang.Error:throw("noParserForFile", file) end
			end
			do parser:setCtx(self:getCtx()) end
			do _g.jk.log.Log:status(self:getCtx(), "[Reading] " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. " ..") end
			do
				local tree = parser:parseFile(file)
				do _g.jk.log.Log:status(self:getCtx(), nil) end
				if not (tree ~= nil) then
					do _g.jk.lang.Error:throw("failedToParseFile", file) end
				end
				do
					local owm = _g.sling.common.StringOutputWriterManager._construct0(_g.sling.common.StringOutputWriterManager._create())
					local generator = provider:getGenerator(self:getCtx(), owm)
					if not (generator ~= nil) then
						do _g.jk.lang.Error:throw("noGenerator", file) end
					end
					do _g.jk.log.Log:status(self:getCtx(), "[Generating] " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. " ..") end
					do generator:dumpFile(tree) end
					do _g.jk.log.Log:status(self:getCtx(), nil) end
					do
						local str = owm:toString()
						if not (str ~= nil) then
							do _g.jk.lang.Error:throw("failedToGenerateCode", file) end
						end
						if self:getCtx():isInDebugMode() then
							do _g.jk.log.Log:debug(self:getCtx(), "Generated code: `" .. _g.jk.lang.String:safeString(str) .. "'") end
						end
						do _g.jk.log.Log:status(self:getCtx(), "[Reading, phase 2] " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. " ..") end
						tree = parser:parseString(str, "generated-" .. _g.jk.lang.String:safeString(file:getBasename()))
						do _g.jk.log.Log:status(self:getCtx(), nil) end
						if not (tree ~= nil) then
							do _g.jk.lang.Error:throw("failedToParseGeneratedFile", file) end
						end
						owm = _g.sling.common.StringOutputWriterManager._construct0(_g.sling.common.StringOutputWriterManager._create())
						generator = provider:getGenerator(self:getCtx(), owm)
						if not (generator ~= nil) then
							do _g.jk.lang.Error:throw("noGenerator2", file) end
						end
						do _g.jk.log.Log:status(self:getCtx(), "[Generating, phase 2] " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. " ..") end
						do generator:dumpFile(tree) end
						do _g.jk.log.Log:status(self:getCtx(), nil) end
						do
							local str2 = owm:toString()
							if _g.jk.lang.String:equals(str, str2) == false then
								if self:getCtx():isInDebugMode() then
									do _g.jk.log.Log:debug(self:getCtx(), "Program 1:\n" .. _g.jk.lang.String:safeString(str)) end
									do _g.jk.log.Log:debug(self:getCtx(), "Program 2:\n" .. _g.jk.lang.String:safeString(str2)) end
								end
								do _g.jk.log.Log:info(self:getCtx(), _g.jk.diff.UnifiedDiff:execute("program", str, str2)) end
								do _g.jk.lang.Error:throw("inconsistentParserGeneratorResults", file) end
							end
							do return provider:getId() end
						end
					end
				end
			end
		end
	end
end

function sling.task.common.ValidateCodeFilesTask:executeForFile(file)
	if self:isSupportedSourceFile(file) then
		local id = self:validateParserGeneratorForFile(file)
		do _g.jk.log.Log:info(self:getCtx(), "Parser-generator `" .. _g.jk.lang.String:safeString(id) .. "' validated for file: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(file)) .. "'") end
	end
end
