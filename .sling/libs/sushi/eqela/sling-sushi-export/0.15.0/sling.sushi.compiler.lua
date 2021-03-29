sling = sling or {}

sling.sushi = sling.sushi or {}

sling.sushi.compiler = sling.sushi.compiler or {}

sling.sushi.compiler.SushiLibraryManager = _g.sling.compiler.LibraryManager._create()
sling.sushi.compiler.SushiLibraryManager.__index = sling.sushi.compiler.SushiLibraryManager
_vm:set_metatable(sling.sushi.compiler.SushiLibraryManager, {
	__index = _g.sling.compiler.LibraryManager
})

function sling.sushi.compiler.SushiLibraryManager._create()
	local v = _vm:set_metatable({}, sling.sushi.compiler.SushiLibraryManager)
	return v
end

function sling.sushi.compiler.SushiLibraryManager:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.sushi.compiler.SushiLibraryManager'
	self['_isType.sling.sushi.compiler.SushiLibraryManager'] = true
end

function sling.sushi.compiler.SushiLibraryManager:_construct0()
	sling.sushi.compiler.SushiLibraryManager._init(self)
	do _g.sling.compiler.LibraryManager._construct0(self) end
	return self
end

function sling.sushi.compiler.SushiLibraryManager:forDefaultDirectory()
	local dd = _g.jk.env.CommonPath:getHomeDirectory()
	if dd ~= nil then
		dd = dd:entry(".sling"):entry("libs")
	end
	do return _g.sling.sushi.compiler.SushiLibraryManager:forDirectory(dd) end
end

function sling.sushi.compiler.SushiLibraryManager:forDirectory(dir)
	local v = _g.sling.sushi.compiler.SushiLibraryManager._construct0(_g.sling.sushi.compiler.SushiLibraryManager._create())
	do v:setDirectory(dir) end
	do return v end
end

function sling.sushi.compiler.SushiLibraryManager:getDefaultRepositoryUrls(urls)
	do _g.sling.compiler.LibraryManager.getDefaultRepositoryUrls(self, urls) end
	do
		local url2 = _g.sling.compiler.LibraryManager.RepositoryUrl._construct0(_g.sling.compiler.LibraryManager.RepositoryUrl._create())
		do url2:setUrl("https://files.eqela.com/sling/libs/%s_%n_%v.slib") end
		do _g.jk.lang.Vector:append(urls, url2) end
	end
end

function sling.sushi.compiler.SushiLibraryManager:getPlatformName()
	do return "sushi" end
end

function sling.sushi.compiler.SushiLibraryManager:getLinkTargetFile(directory, moduleName)
	if not (directory ~= nil) then
		do return nil end
	end
	if not _g.jk.lang.String:isNotEmpty(moduleName) then
		do return nil end
	end
	do return directory:entry(_g.jk.lang.String:safeString(moduleName) .. ".lua") end
end

sling.sushi.compiler.SlingToSushiCompiler = _g.sling.compiler.SlingCompiler._create()
sling.sushi.compiler.SlingToSushiCompiler.__index = sling.sushi.compiler.SlingToSushiCompiler
_vm:set_metatable(sling.sushi.compiler.SlingToSushiCompiler, {
	__index = _g.sling.compiler.SlingCompiler
})

function sling.sushi.compiler.SlingToSushiCompiler._create()
	local v = _vm:set_metatable({}, sling.sushi.compiler.SlingToSushiCompiler)
	return v
end

function sling.sushi.compiler.SlingToSushiCompiler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.sushi.compiler.SlingToSushiCompiler'
	self['_isType.sling.sushi.compiler.SlingToSushiCompiler'] = true
end

function sling.sushi.compiler.SlingToSushiCompiler:_construct0()
	sling.sushi.compiler.SlingToSushiCompiler._init(self)
	do _g.sling.compiler.SlingCompiler._construct0(self) end
	return self
end

sling.sushi.compiler.SlingToSushiCompiler.BuildResult = {}
sling.sushi.compiler.SlingToSushiCompiler.BuildResult.__index = sling.sushi.compiler.SlingToSushiCompiler.BuildResult
_vm:set_metatable(sling.sushi.compiler.SlingToSushiCompiler.BuildResult, {})

function sling.sushi.compiler.SlingToSushiCompiler.BuildResult._create()
	local v = _vm:set_metatable({}, sling.sushi.compiler.SlingToSushiCompiler.BuildResult)
	return v
end

function sling.sushi.compiler.SlingToSushiCompiler.BuildResult:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.sushi.compiler.SlingToSushiCompiler.BuildResult'
	self['_isType.sling.sushi.compiler.SlingToSushiCompiler.BuildResult'] = true
	self._linkResult = nil
	self._installer = nil
end

function sling.sushi.compiler.SlingToSushiCompiler.BuildResult:_construct0()
	sling.sushi.compiler.SlingToSushiCompiler.BuildResult._init(self)
	return self
end

function sling.sushi.compiler.SlingToSushiCompiler.BuildResult:getLinkResult()
	do return self._linkResult end
end

function sling.sushi.compiler.SlingToSushiCompiler.BuildResult:doSetLinkResult(value)
	self._linkResult = value
end

function sling.sushi.compiler.SlingToSushiCompiler.BuildResult:setLinkResult(v)
	do self:doSetLinkResult(v) end
	do return v end
end

function sling.sushi.compiler.SlingToSushiCompiler.BuildResult:getInstaller()
	do return self._installer end
end

function sling.sushi.compiler.SlingToSushiCompiler.BuildResult:doSetInstaller(value)
	self._installer = value
end

function sling.sushi.compiler.SlingToSushiCompiler.BuildResult:setInstaller(v)
	do self:doSetInstaller(v) end
	do return v end
end

sling.sushi.compiler.SlingToSushiCompiler.SushiVM = {}
sling.sushi.compiler.SlingToSushiCompiler.SushiVM.__index = sling.sushi.compiler.SlingToSushiCompiler.SushiVM
_vm:set_metatable(sling.sushi.compiler.SlingToSushiCompiler.SushiVM, {})

function sling.sushi.compiler.SlingToSushiCompiler.SushiVM._create()
	local v = _vm:set_metatable({}, sling.sushi.compiler.SlingToSushiCompiler.SushiVM)
	return v
end

function sling.sushi.compiler.SlingToSushiCompiler.SushiVM:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.sushi.compiler.SlingToSushiCompiler.SushiVM'
	self['_isType.sling.sushi.compiler.SlingToSushiCompiler.SushiVM'] = true
end

function sling.sushi.compiler.SlingToSushiCompiler.SushiVM:_construct0()
	sling.sushi.compiler.SlingToSushiCompiler.SushiVM._init(self)
	return self
end

function sling.sushi.compiler.SlingToSushiCompiler.SushiVM:getCurrentVMFile()
	local vm = _g.jk.fs.File:forPath(_vm.get_sushi_executable_path())
	if vm:isFile() then
		do return vm end
	end
	do return nil end
end

function sling.sushi.compiler.SlingToSushiCompiler.SushiVM:getVMCodeSizeForFile(file)
	if not (file ~= nil) then
		do return 0 end
	end
	do
		local reader = file:read()
		if not (reader ~= nil) then
			do return 0 end
		end
		do
			local size = reader:getSize()
			if size < 8 then
				do reader:close() end
				do return 0 end
			end
			if not reader:setCurrentPosition(size - 8) then
				do reader:close() end
				do return 0 end
			end
			do
				local buffer = _util:allocate_buffer(4)
				if reader:read(buffer) ~= 4 then
					do reader:close() end
					do return 0 end
				end
				if buffer[0 + 1] ~= 83 or buffer[1 + 1] ~= 117 or buffer[2 + 1] ~= 112 or buffer[3 + 1] ~= 80 then
					do reader:close() end
					do return 0 end
				end
				if reader:read(buffer) ~= 4 then
					do reader:close() end
					do return 0 end
				end
				do reader:close() end
				do return _g.jk.lang.Buffer:getInt32BE(buffer, 0) end
			end
		end
	end
end

function sling.sushi.compiler.SlingToSushiCompiler.SushiVM:readSushiVMCodeFromFile(file)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local sz = _g.sling.sushi.compiler.SlingToSushiCompiler.SushiVM:getVMCodeSizeForFile(file)
		if sz < 1 then
			do return file:getContentsBuffer() end
		end
		do
			local reader = file:read()
			local v = _util:allocate_buffer(sz)
			local r = reader:read(v)
			do reader:close() end
			if r < sz then
				do return nil end
			end
			do return v end
		end
	end
end

function sling.sushi.compiler.SlingToSushiCompiler.SushiVM:compressIfNecessaryAndPossible(code)
	if not (code ~= nil) then
		do return nil end
	end
	if code[0 + 1] ~= 0 and code[1 + 1] ~= 100 and code[2 + 1] ~= 101 and code[3 + 1] ~= 102 then
		do return _util:deflate(code) end
	end
	do return nil end
end

function sling.sushi.compiler.SlingToSushiCompiler.SushiVM:wrapCodeFileToVMFile(ctx, vm, program, target)
	if not (vm ~= nil and program ~= nil and target ~= nil) then
		do _g.jk.log.Log:error(ctx, "Invalid arguments for SushiVM.wrapCodeFileToVMFile") end
		do return false end
	end
	do
		local code = program:getContentsBuffer()
		if not (code ~= nil) then
			do _g.jk.log.Log:error(ctx, "Failed to read program file: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(program:getPath())) .. "'") end
			do return false end
		end
		do
			local sushi = _g.sling.sushi.compiler.SlingToSushiCompiler.SushiVM:readSushiVMCodeFromFile(vm)
			if not (sushi ~= nil) then
				do _g.jk.log.Log:error(ctx, "Failed to read Sushi VM code from file: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(vm:getPath())) .. "'") end
				do return false end
			end
			do return self:wrapCodeBufferToVMBuffer(ctx, sushi, code, target) end
		end
	end
end

function sling.sushi.compiler.SlingToSushiCompiler.SushiVM:wrapCodeBufferToVMBuffer(ctx, sushi, code, target)
	if not (sushi ~= nil and code ~= nil and target ~= nil) then
		do _g.jk.log.Log:error(ctx, "Invalid arguments for SushiVM.wrapCodeBufferToVMBuffer") end
		do return false end
	end
	do
		local tdir = target:getParent()
		if not tdir:exists() then
			if not tdir:createDirectoryRecursive() then
				do _g.jk.log.Log:warning(ctx, "Failed to create directory: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(tdir:getPath())) .. "'") end
			end
		end
		do
			local writer = target:write()
			if not (writer ~= nil) then
				do _g.jk.log.Log:error(ctx, "Failed to open file for writing: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(target:getPath())) .. "'") end
				do return false end
			end
			if not (writer:write(sushi, -1) > 0) then
				do _g.jk.log.Log:error(ctx, "Failed while writing to file: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(target:getPath())) .. "'") end
				do writer:close() end
				do return false end
			end
			do
				local ccode = self:compressIfNecessaryAndPossible(code)
				if ccode ~= nil then
					local cmagic = _util:allocate_buffer(4)
					do _g.jk.lang.Buffer:setByte(cmagic, 0, 0) end
					do _g.jk.lang.Buffer:setByte(cmagic, 1, 100) end
					do _g.jk.lang.Buffer:setByte(cmagic, 2, 101) end
					do _g.jk.lang.Buffer:setByte(cmagic, 3, 102) end
					if not (writer:write(cmagic, 4) == 4) then
						do _g.jk.log.Log:error(ctx, "Failed while writing to file: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(target:getPath())) .. "'") end
						do writer:close() end
						do return false end
					end
					code = ccode
				end
				if not (writer:write(code, -1) > 0) then
					do _g.jk.log.Log:error(ctx, "Failed while writing to file: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(target:getPath())) .. "'") end
					do writer:close() end
					do return false end
				end
				do
					local magic = _util:allocate_buffer(4)
					do _g.jk.lang.Buffer:setByte(magic, 0, 83) end
					do _g.jk.lang.Buffer:setByte(magic, 1, 117) end
					do _g.jk.lang.Buffer:setByte(magic, 2, 112) end
					do _g.jk.lang.Buffer:setByte(magic, 3, 80) end
					if not (writer:write(magic, 4) == 4) then
						do _g.jk.log.Log:error(ctx, "Failed while writing to file: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(target:getPath())) .. "'") end
						do writer:close() end
						do return false end
					end
					if not (writer:write(_g.jk.lang.Buffer:forInt32BE(#sushi), -1) == 4) then
						do _g.jk.log.Log:error(ctx, "Failed while writing to file: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(target:getPath())) .. "'") end
						do writer:close() end
						do return false end
					end
					do writer:close() end
					do target:makeExecutable() end
					do return true end
				end
			end
		end
	end
end

function sling.sushi.compiler.SlingToSushiCompiler:_construct1(ctx)
	sling.sushi.compiler.SlingToSushiCompiler._init(self)
	do _g.sling.compiler.SlingCompiler._construct1(self, ctx) end
	return self
end

function sling.sushi.compiler.SlingToSushiCompiler:createLibraryManager()
	do return _g.sling.sushi.compiler.SushiLibraryManager:forDefaultDirectory() end
end

function sling.sushi.compiler.SlingToSushiCompiler:getTargetPlatformId()
	do return "sushi" end
end

function sling.sushi.compiler.SlingToSushiCompiler:getTargetPlatformName()
	do return "Sushi" end
end

function sling.sushi.compiler.SlingToSushiCompiler:getDefines(v)
	do v:setString("target_lua", "true") end
	do v:setString("target_sushi", "true") end
	do v:setString("target_sushi_lua", "true") end
	do v:setString("target_supports_destructor", "true") end
end

function sling.sushi.compiler.SlingToSushiCompiler:getLinkTargetFile(directory, moduleName)
	if not (directory ~= nil) then
		do return nil end
	end
	if not _g.jk.lang.String:isNotEmpty(moduleName) then
		do return nil end
	end
	do return directory:entry(_g.jk.lang.String:safeString(moduleName) .. ".lua") end
end

function sling.sushi.compiler.SlingToSushiCompiler:executePreprocessorFilters(mod)
	do _g.sling.compiler.SlingCompiler.executePreprocessorFilters(self, mod) end
	do _g.sling.compiler.JcoOps:convertTreeDeclarationsToJkDom(self.ctx, mod) end
end

function sling.sushi.compiler.SlingToSushiCompiler:transform(ctx, node, resolver)
	local ph = _g.sling.compiler.ProgressHelper:forSecondHalf(ctx, "Transforming", 30)
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:expandPropertyDeclarationsToMethods(ctx, node, resolver) end
	do ph:onUpdate() end
	do _g.sling.compiler.JkopOps:forceJkopVectorOperations(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:flattenOptionalDataTypes(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:flattenUnwrappingExpressions(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:convertSwitchToIf(ctx, node, {
	}) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:renameAmbiguousClassVariables(node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:wrapFunctionReferencesToFunctionDeclarationExpressions(ctx, node, resolver) end
	do ph:onUpdate() end
	do _g.sling.sushi.compiler.SlingToSushiOps:convertTryCatchToPcall(ctx, node, true) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:convertMultipleExpressionsToFunctionExpression(node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:expandConditionalExpressions(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:expandAssignmentExpressions(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:expandDynamicCastExpressions(ctx, node, true) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:surroundLocalVariablesInBlocks(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:changeContinueToGoto(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:expandForStatements(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:wrapAssignmentsInExpressions(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:createDefaultConstructors(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:addExplicitCurrentObjectExpressions(ctx, resolver, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:addBaseCallsToConstructors(ctx, resolver, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:setMemberAccessExpressionTypes(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:cleanReturnStatementsInFunctions(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:convertToOneBasedIndexing(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:sortEntitiesByDependencies(ctx, resolver, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:addDefaultParameterValuesToFunctionCalls(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:renameOverloadedMethods(ctx, resolver, node, false) end
	do ph:onUpdate() end
	do _g.sling.sushi.compiler.SlingToSushiOps:renameNodesWithReservedWords(ctx, node, false) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:removeIntegerToIntegerCasts(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.sushi.compiler.SlingToSushiOps:addStaticCastsAroundIntegerDivisions(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:unresolveSymbols(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.sushi.compiler.SlingToSushiOps:enableSushiBitOps(ctx, node) end
	do ph:_end() end
end

function sling.sushi.compiler.SlingToSushiCompiler:writeModuleSources(ctx, node, output)
	local root = _g.sling.common.CodeUnitNode._construct0(_g.sling.common.CodeUnitNode._create())
	do _g.sling.compiler.SlingOps:transformToOutputModuleCombined(root, node, nil) end
	do _g.sling.op.CommonOps:handleMainFunctionsForAllScripts(ctx, root, false, nil) end
	do
		local mgr = _g.sling.common.DirectoryOutputWriterManager:forDirectory(ctx, output, true)
		local gen = _g.sling.sushi.compiler.SushiLuaGenerator._construct2(_g.sling.sushi.compiler.SushiLuaGenerator._create(), ctx, mgr)
		do gen:dumpModule(root) end
		do _g.sling.util.ProjectUtil:copyTreeResourcesToDirectory(ctx, root, output:entry("resources")) end
	end
end

function sling.sushi.compiler.SlingToSushiCompiler:linkModules(modules, output, projectId, wrapVm, vm)
	local mods = self:toModuleInfos(modules)
	if output:isDirectory() == false then
		do output:createDirectoryRecursive() end
	end
	do
		local links = {}
		local mpid = nil
		if mods ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(mods)
			do
				n = 0
				while n < m do
					local mod = mods[n + 1]
					if mod ~= nil then
						do _g.jk.lang.Vector:append(links, mod:getLinkTarget()) end
						mpid = mod:getModuleId()
					end
					do n = n + 1 end
				end
			end
		end
		do
			local pid = projectId
			if _g.jk.lang.String:isEmpty(pid) then
				pid = mpid
			end
			do
				local modules = links
				local projectId = pid
				local dfn = projectId
				local isWindows = false
				if vm ~= nil and vm:hasExtension("exe") then
					isWindows = true
				elseif _g.jk.os.OS:isWindows() then
					isWindows = true
				end
				if isWindows then
					dfn = _g.jk.lang.String:safeString(dfn) .. ".exe"
				end
				do
					local dst = output:entry(dfn)
					local doLink = false
					local code = output:entry(_g.jk.lang.String:safeString(projectId) .. ".lua")
					local rv = code
					if wrapVm then
						rv = dst
					end
					do
						local codets = rv:getLastModifiedTimeStamp()
						local srcfiles = {}
						if modules ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(modules)
							do
								n2 = 0
								while n2 < m2 do
									local module = modules[n2 + 1]
									if module ~= nil then
										local luac = 0
										if module:isFile() and module:hasExtension("lua") then
											do _g.jk.lang.Vector:append(srcfiles, module) end
											if doLink == false and module:getLastModifiedTimeStamp() > codets then
												doLink = true
											end
											do luac = luac + 1 end
										else
											local it = module:entries()
											while it ~= nil do
												local ff = it:next()
												if not (ff ~= nil) then
													do break end
												end
												if ff:hasExtension("lua") then
													do _g.jk.lang.Vector:append(srcfiles, ff) end
													if doLink == false and ff:getLastModifiedTimeStamp() > codets then
														doLink = true
													end
													do luac = luac + 1 end
												end
											end
										end
										if luac < 1 then
											do _g.jk.log.Log:warning(self.ctx, "No Lua files found for module: `" .. _g.jk.lang.String:safeString(module:getPath()) .. "'") end
										end
									end
									do n2 = n2 + 1 end
								end
							end
						end
						if not doLink then
							do _g.jk.log.Log:info(self.ctx, "Already up to date: `" .. _g.jk.lang.String:safeString(rv:getPath()) .. "'") end
							do return rv end
						end
						if wrapVm then
							if not (vm ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Wrapped VM requested, but no VM supplied", nil, nil))
								do return nil end
							end
							do
								local vmcode = _g.sling.sushi.compiler.SlingToSushiCompiler.SushiVM:readSushiVMCodeFromFile(vm)
								if not (vmcode ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to read VM code from file: `" .. _g.jk.lang.String:safeString(vm:getPath()) .. "'", nil, nil))
									do return nil end
								end
								do _g.jk.log.Log:status(self.ctx, "[Writing] `" .. _g.jk.lang.String:safeString(dst:getPath()) .. "' ..") end
								do
									local databuf = nil
									if srcfiles ~= nil then
										local n3 = 0
										local m3 = _g.jk.lang.Vector:getSize(srcfiles)
										do
											n3 = 0
											while n3 < m3 do
												local file = srcfiles[n3 + 1]
												if file ~= nil then
													do _g.jk.log.Log:debug(self.ctx, "Linking file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "' ..") end
													do
														local data = file:getContentsBuffer()
														if not (data ~= nil) then
															_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to read file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'", nil, nil))
														end
														databuf = _g.jk.lang.Buffer:append(databuf, data, -1)
													end
												end
												do n3 = n3 + 1 end
											end
										end
									end
									do
										local v = _g.sling.sushi.compiler.SlingToSushiCompiler.SushiVM:wrapCodeBufferToVMBuffer(self.ctx, vmcode, databuf, dst)
										do _g.jk.log.Log:status(self.ctx, nil) end
										if not v then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to write output file: `" .. _g.jk.lang.String:safeString(dst:getPath()) .. "'", nil, nil))
											do return nil end
										end
										do dst:makeExecutable() end
										do _g.jk.log.Log:info(self.ctx, "Wrote: `" .. _g.jk.lang.String:safeString(dst:getPath()) .. "'") end
									end
								end
							end
						else
							do _g.jk.log.Log:status(self.ctx, "[Writing] `" .. _g.jk.lang.String:safeString(code:getPath()) .. "' ..") end
							do
								local writer = code:write()
								if not (writer ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to write file: `" .. _g.jk.lang.String:safeString(code:getPath()) .. "'", nil, nil))
								end
								if srcfiles ~= nil then
									local n4 = 0
									local m4 = _g.jk.lang.Vector:getSize(srcfiles)
									do
										n4 = 0
										while n4 < m4 do
											local file = srcfiles[n4 + 1]
											if file ~= nil then
												do _g.jk.log.Log:debug(self.ctx, "Linking file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "' ..") end
												do
													local data = file:getContentsBuffer()
													if not (data ~= nil) then
														do writer:close() end
														_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to read file: `" .. _g.jk.lang.String:safeString(file:getPath()) .. "'", nil, nil))
													end
													do
														local sz = #data
														local r = writer:write(data, sz)
														if r < sz then
															do writer:close() end
															_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to write data to file: `" .. _g.jk.lang.String:safeString(code:getPath()) .. "'", nil, nil))
														end
													end
												end
											end
											do n4 = n4 + 1 end
										end
									end
								end
								do writer:close() end
								do _g.jk.log.Log:status(self.ctx, nil) end
								do _g.jk.log.Log:info(self.ctx, "Wrote: `" .. _g.jk.lang.String:safeString(code:getPath()) .. "'") end
								if vm ~= nil then
									local sushicode = _g.sling.sushi.compiler.SlingToSushiCompiler.SushiVM:readSushiVMCodeFromFile(vm)
									if not (sushicode ~= nil) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to read Sushi VM code from file: `" .. _g.jk.lang.String:safeString(vm:getPath()) .. "'", nil, nil))
									end
									if not dst:setContentsBuffer(sushicode) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to write file: `" .. _g.jk.lang.String:safeString(dst:getPath()) .. "'", nil, nil))
									end
									do dst:makeExecutable() end
									do _g.jk.log.Log:info(self.ctx, "Wrote: `" .. _g.jk.lang.String:safeString(dst:getPath()) .. "'") end
								end
							end
						end
						do return rv end
					end
				end
			end
		end
	end
end

function sling.sushi.compiler.SlingToSushiCompiler:getSystemId()
	if _g.jk.os.OS:isWindows() then
		do return "windows" end
	end
	if _g.jk.os.OS:isLinux() then
		do return "linux" end
	end
	if _g.jk.os.OS:isMacOS() then
		do return "macos" end
	end
	do return "native" end
end

function sling.sushi.compiler.SlingToSushiCompiler:buildToNativeApplication(source, output, customName, customVersion)
	if not (output ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No output directory given for native application", nil, nil))
	end
	do
		local version = self:getFinalVersion(customVersion)
		do self:buildApplicationModules(source, customName, version) end
		do
			local sources = {}
			do _g.jk.lang.Vector:append(sources, source) end
			do
				local name = self:getFinalApplicationName(source, customName)
				local appid = _g.jk.lang.String:safeString(name) .. "-" .. _g.jk.lang.String:safeString(version)
				local sid = self:getSystemId()
				local destdir = self:getWorkDirFile(_g.jk.lang.String:safeString(appid) .. "_" .. _g.jk.lang.String:safeString(sid))
				local linked = self:linkModules(sources, destdir, name, true, _g.sling.sushi.compiler.SlingToSushiCompiler.SushiVM:getCurrentVMFile())
				local outputdir = output
				local outputfile = outputdir:entry(_g.jk.lang.String:safeString(appid) .. "_" .. _g.jk.lang.String:safeString(sid) .. ".zip")
				do outputfile:remove() end
				do outputdir:createDirectoryRecursive() end
				if not _g.jk.archive.ZipWriter:writeToZipRecursive(self.ctx, outputfile, destdir, true) then
					do _g.jk.lang.Error:throw("failedToWrite", outputfile:getPath()) end
				end
				do _g.jk.log.Log:info(self.ctx, "App: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(outputfile))) end
				do
					local v = _g.sling.sushi.compiler.SlingToSushiCompiler.BuildResult._construct0(_g.sling.sushi.compiler.SlingToSushiCompiler.BuildResult._create())
					do v:setLinkResult(linked) end
					do v:setInstaller(outputfile) end
					do return v end
				end
			end
		end
	end
end

function sling.sushi.compiler.SlingToSushiCompiler:buildToSushiApplication(source, output, customName, customVersion)
	if not (output ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No output directory given for Sushi application", nil, nil))
	end
	do
		local version = self:getFinalVersion(customVersion)
		do self:buildApplicationModules(source, customName, version) end
		do
			local sources = {}
			do _g.jk.lang.Vector:append(sources, source) end
			do
				local name = self:getFinalApplicationName(source, customName)
				local appid = _g.jk.lang.String:safeString(name) .. "-" .. _g.jk.lang.String:safeString(version)
				local destdir = self:getWorkDirFile(_g.jk.lang.String:safeString(appid) .. "_sushi")
				local linked = self:linkModules(sources, destdir, name, false, nil)
				local outputdir = output
				local outputfile = outputdir:entry(_g.jk.lang.String:safeString(appid) .. ".sapp")
				do outputfile:remove() end
				do outputdir:createDirectoryRecursive() end
				if not _g.jk.archive.ZipWriter:writeToZipRecursive(self.ctx, outputfile, destdir, true) then
					do _g.jk.lang.Error:throw("failedToWrite", outputfile:getPath()) end
				end
				do _g.jk.log.Log:info(self.ctx, "App: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(outputfile))) end
				do
					local v = _g.sling.sushi.compiler.SlingToSushiCompiler.BuildResult._construct0(_g.sling.sushi.compiler.SlingToSushiCompiler.BuildResult._create())
					do v:setLinkResult(linked) end
					do v:setInstaller(outputfile) end
					do return v end
				end
			end
		end
	end
end

sling.sushi.compiler.SlingToSushiOps = {}
sling.sushi.compiler.SlingToSushiOps.__index = sling.sushi.compiler.SlingToSushiOps
_vm:set_metatable(sling.sushi.compiler.SlingToSushiOps, {})

function sling.sushi.compiler.SlingToSushiOps._create()
	local v = _vm:set_metatable({}, sling.sushi.compiler.SlingToSushiOps)
	return v
end

function sling.sushi.compiler.SlingToSushiOps:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.sushi.compiler.SlingToSushiOps'
	self['_isType.sling.sushi.compiler.SlingToSushiOps'] = true
end

function sling.sushi.compiler.SlingToSushiOps:_construct0()
	sling.sushi.compiler.SlingToSushiOps._init(self)
	return self
end

function sling.sushi.compiler.SlingToSushiOps:renameNodesWithReservedWords(ctx, node, issueWarnings)
	local words = {
		"do",
		"end",
		"function",
		"if",
		"local",
		"then",
		"return",
		"while",
		"else",
		"elseif",
		"for",
		"or",
		"and",
		"goto",
		"repeat",
		"break",
		"not"
	}
	do _g.sling.op.RenamerForReservedWords:execute(ctx, node, words, issueWarnings) end
end

function sling.sushi.compiler.SlingToSushiOps:isDynamicExceptionVariableDeclaration(node)
	local vd = _vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode')
	if not (vd ~= nil) then
		do return false end
	end
	do
		local type = vd:getType()
		if not (type ~= nil) then
			do return true end
		end
		if (_vm:to_table_with_key(type, '_isType.sling.model.DynamicDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.ExceptionDataTypeNode') ~= nil) then
			do return true end
		end
		do return false end
	end
end

function sling.sushi.compiler.SlingToSushiOps:convertTryCatchToPcall(ctx, node, isSushi)
	local array = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.TryCatchExpressionNode", false, true, false)
	if array ~= nil then
		local n2 = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n2 = 0
			while n2 < m do
				local tcx = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.model.TryCatchExpressionNode')
				if tcx ~= nil then
					local fd = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
					local tcs = _g.sling.model.TryCatchStatementNode._construct0(_g.sling.model.TryCatchStatementNode._create())
					local xpr = tcx:exportExpression()
					local blk = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
					if xpr ~= nil then
						do blk:addNode(xpr) end
					end
					do tcs:setTryBlock(blk, false) end
					do
						local cb = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
						do cb:addNode(_g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.SymbolExpressionNode:forName("e"))) end
						do tcs:addToCatchBlocks(_g.sling.model.CatchBlockNode:instance(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), "e", nil), cb)) end
						do _g.sling.util.FunctionUtil:addStatement(fd, tcs) end
						do _g.sling.util.FunctionUtil:addStatement(fd, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()))) end
						do
							local fdx = _g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(fd)
							local fcx = _g.sling.model.FunctionCallExpressionNode:forExpression(fdx)
							do _g.sling.util.NodeUtil:replaceNode(tcx, fcx) end
						end
					end
				end
				do n2 = n2 + 1 end
			end
		end
	end
	do
		local array2 = _g.sling.util.NodeFinder:findNodesOfType(node, "class:sling.model.TryCatchStatementNode", false, true, false)
		if array2 ~= nil then
			local n3 = 0
			local m2 = _g.jk.lang.Vector:getSize(array2)
			do
				n3 = 0
				while n3 < m2 do
					local tc = _vm:to_table_with_key(array2[n3 + 1], '_isType.sling.model.TryCatchStatementNode')
					if tc ~= nil then
						local block = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
						local vd = _g.sling.model.MultipleVariableDeclarationNode:forArrayOfVariables(_g.sling.model.AutomaticDataTypeNode._construct0(_g.sling.model.AutomaticDataTypeNode._create()), {
							"_status",
							"_err"
						})
						local fdecl = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
						do fdecl:setReturnType(_g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create()), false) end
						do
							local tryblock = tc:exportTryBlock()
							if not (tryblock ~= nil) then
								tryblock = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
							end
							do fdecl:setBody(tryblock, false) end
							do
								local fdx = _g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(fdecl)
								local fcall = nil
								if isSushi then
									fcall = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("_vm"), "execute_protected_call", true)
								else
									fcall = _g.sling.model.FunctionCallExpressionNode:forName("pcall")
								end
								do fcall:addToParameters(fdx) end
								do vd:setInitializer(fcall, false) end
								do
									local hasRval = false
									local array3 = _g.sling.util.NodeFinder:findNodesOfType(tryblock, "class:sling.model.ReturnStatementNode", false, true, false)
									if array3 ~= nil then
										local n4 = 0
										local m3 = _g.jk.lang.Vector:getSize(array3)
										do
											n4 = 0
											while n4 < m3 do
												local rs = _vm:to_table_with_key(array3[n4 + 1], '_isType.sling.model.ReturnStatementNode')
												if rs ~= nil then
													local nf = _g.sling.util.FindUtil:findNearestFunctionBase(rs)
													if nf ~= fdecl then
														goto _continue1
													end
													do
														local xpr = rs:exportExpression()
														if not (xpr ~= nil) then
															xpr = _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create())
														end
														do
															local pp = _vm:to_table_with_key(rs:getParent(), '_isType.sling.common.ContainerNode')
															if not (pp ~= nil) then
																_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Return statement parent is not a container", rs, nil))
															end
															do pp:insertAboveNode(_g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forName("_rval"), _g.sling.model.CreateObjectExpressionNode:forType(_g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create()))), rs) end
															do pp:insertAboveNode(_g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forName("_rval"), _g.sling.model.SymbolExpressionNode:forName("value")), xpr), rs) end
															hasRval = true
														end
													end
												end
												::_continue1::
												do n4 = n4 + 1 end
											end
										end
									end
									if hasRval then
										local rvalDec = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), "_rval", nil)
										do rvalDec:setInitializer(_g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()), false) end
										do block:addNode(rvalDec) end
									end
									do block:addNode(vd) end
									do
										local rvalblock = _g.sling.model.BlockNode:forStatement(_g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.MemberAccessExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forName("_rval"), _g.sling.model.SymbolExpressionNode:forName("value"))))
										local cifb = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
										local pc = nil
										local fallbacks = nil
										local array4 = tc:exportCatchBlocks()
										if array4 ~= nil then
											local n5 = 0
											local m4 = _g.jk.lang.Vector:getSize(array4)
											do
												n5 = 0
												while n5 < m4 do
													local cb = _vm:to_table_with_key(array4[n5 + 1], '_isType.sling.model.CatchBlockNode')
													if cb ~= nil then
														local xprs = cb:getExceptions()
														local cbb = cb:exportBlock()
														if not (cbb ~= nil) then
															cbb = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
														end
														if _g.jk.lang.Vector:isEmpty(xprs) then
															if not (fallbacks ~= nil) then
																fallbacks = {}
															end
															do _g.jk.lang.Vector:append(fallbacks, cbb) end
														elseif _g.jk.lang.Vector:getSize(xprs) == 1 and _g.sling.sushi.compiler.SlingToSushiOps:isDynamicExceptionVariableDeclaration(_g.jk.lang.Vector:get(xprs, 0)) then
															local xpr = _vm:to_table_with_key(_g.jk.lang.Vector:get(xprs, 0), '_isType.sling.model.VariableDeclarationNode')
															local lvd = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), xpr:getName(), _g.sling.model.SymbolExpressionNode:forName("_err"))
															do cbb:insertNode(lvd, 0) end
															if not (fallbacks ~= nil) then
																fallbacks = {}
															end
															do _g.jk.lang.Vector:append(fallbacks, cbb) end
														else
															local n = 0
															local condition = nil
															if xprs ~= nil then
																local n6 = 0
																local m5 = _g.jk.lang.Vector:getSize(xprs)
																do
																	n6 = 0
																	while n6 < m5 do
																		local xpr = _vm:to_table_with_key(xprs[n6 + 1], '_isType.sling.model.VariableDeclarationNode')
																		if xpr ~= nil then
																			local xc = _g.sling.model.TypeCheckExpressionNode:instance(xpr:getType(), _g.sling.model.SymbolExpressionNode:forName("_err"), false)
																			if condition ~= nil then
																				condition = _g.sling.model.LogicalOrExpressionNode:instance(condition, xc)
																			else
																				condition = xc
																			end
																			do
																				local lvd = _g.sling.model.VariableDeclarationNode:instance(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), xpr:getName(), _g.sling.model.SymbolExpressionNode:forName("_err"))
																				do cbb:insertNode(lvd, (function() local v = n n = n + 1 return v end)()) end
																			end
																		end
																		do n6 = n6 + 1 end
																	end
																end
															end
															do
																local ifs = _g.sling.model.IfStatementNode:instance(condition, cbb, nil)
																if pc ~= nil then
																	do pc:setElseBlock(_g.sling.model.BlockNode:forStatement(ifs), false) end
																else
																	do cifb:addNode(ifs) end
																end
																pc = ifs
															end
														end
													end
													do n5 = n5 + 1 end
												end
											end
										end
										if _g.jk.lang.Vector:getSize(fallbacks) < 1 then
											fallbacks = {}
											do
												local bb = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
												local ts = _g.sling.model.ThrowStatementNode._construct0(_g.sling.model.ThrowStatementNode._create())
												do ts:setExpression(_g.sling.model.SymbolExpressionNode:forName("_err"), false) end
												do bb:addNode(ts) end
												do _g.jk.lang.Vector:append(fallbacks, bb) end
											end
										end
										if fallbacks ~= nil then
											local xb = nil
											if _g.jk.lang.Vector:getSize(fallbacks) == 1 then
												xb = _g.jk.lang.Vector:get(fallbacks, 0)
											else
												xb = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
												if fallbacks ~= nil then
													local n7 = 0
													local m6 = _g.jk.lang.Vector:getSize(fallbacks)
													do
														n7 = 0
														while n7 < m6 do
															local fallback = fallbacks[n7 + 1]
															if fallback ~= nil then
																do xb:addNode(fallback) end
															end
															do n7 = n7 + 1 end
														end
													end
												end
											end
											if pc ~= nil then
												do pc:setElseBlock(xb, false) end
											else
												cifb = xb
											end
										end
										do
											local catchif = _g.sling.model.IfStatementNode:instance(_g.sling.model.SymbolExpressionNode:forName("_err"), cifb, nil)
											do block:addNode(catchif) end
											do
												local finallyblock = tc:exportFinallyBlock()
												if finallyblock ~= nil then
													do block:addNode(finallyblock) end
												end
												if hasRval then
													do block:addNode(_g.sling.model.IfStatementNode:instance(_g.sling.model.SymbolExpressionNode:forName("_rval"), rvalblock, nil)) end
												end
												do _g.sling.util.NodeUtil:replaceNode(tc, block) end
											end
										end
									end
								end
							end
						end
					end
					do n3 = n3 + 1 end
				end
			end
		end
	end
end

function sling.sushi.compiler.SlingToSushiOps:enableSushiBitOps(ctx, node)
	local types = {
		"class:sling.model.BitwiseAndExpressionNode",
		"class:sling.model.BitwiseOrExpressionNode",
		"class:sling.model.BitwiseNotExpressionNode",
		"class:sling.model.BitwiseXorExpressionNode",
		"class:sling.model.ShiftLeftExpressionNode",
		"class:sling.model.ShiftRightExpressionNode"
	}
	local bitnodes = _g.sling.util.NodeFinder:findNodesOfTypes(node, types, false, true, false)
	if bitnodes ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(bitnodes)
		do
			n = 0
			while n < m do
				local node = bitnodes[n + 1]
				if node ~= nil then
					if (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseAndExpressionNode') ~= nil) then
						local left = node:exportLeft()
						local right = node:exportRight()
						local fc = _g.sling.model.FunctionCallExpressionNode:forNames({
							"_vm",
							"bitwise_and"
						})
						do fc:addToParameters(left) end
						do fc:addToParameters(right) end
						do node:replaceWith(fc, false) end
					elseif (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseOrExpressionNode') ~= nil) then
						local left = node:exportLeft()
						local right = node:exportRight()
						local fc = _g.sling.model.FunctionCallExpressionNode:forNames({
							"_vm",
							"bitwise_or"
						})
						do fc:addToParameters(left) end
						do fc:addToParameters(right) end
						do node:replaceWith(fc, false) end
					elseif (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseNotExpressionNode') ~= nil) then
						local xpr = node:exportExpression()
						local fc = _g.sling.model.FunctionCallExpressionNode:forNames({
							"_vm",
							"bitwise_not"
						})
						do fc:addToParameters(xpr) end
						do node:replaceWith(fc, false) end
					elseif (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseXorExpressionNode') ~= nil) then
						local left = node:exportLeft()
						local right = node:exportRight()
						local fc = _g.sling.model.FunctionCallExpressionNode:forNames({
							"_vm",
							"bitwise_xor"
						})
						do fc:addToParameters(left) end
						do fc:addToParameters(right) end
						do node:replaceWith(fc, false) end
					elseif (_vm:to_table_with_key(node, '_isType.sling.model.ShiftLeftExpressionNode') ~= nil) then
						local left = node:exportLeft()
						local right = node:exportRight()
						local fc = _g.sling.model.FunctionCallExpressionNode:forNames({
							"_vm",
							"bitwise_left_shift"
						})
						do fc:addToParameters(left) end
						do fc:addToParameters(right) end
						do node:replaceWith(fc, false) end
					elseif (_vm:to_table_with_key(node, '_isType.sling.model.ShiftRightExpressionNode') ~= nil) then
						local left = node:exportLeft()
						local right = node:exportRight()
						local fc = _g.sling.model.FunctionCallExpressionNode:forNames({
							"_vm",
							"bitwise_right_shift"
						})
						do fc:addToParameters(left) end
						do fc:addToParameters(right) end
						do node:replaceWith(fc, false) end
					else
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Incorrect node type", node, nil))
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.sushi.compiler.SlingToSushiOps:convertToSushiSubscripts(root)
	local array = _g.sling.util.NodeFinder:findCompatibleNodes(root, "class:sling.model.SubscriptExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.SubscriptExpressionNode')
				if node ~= nil then
					local xpr = node:exportChild()
					if not (xpr ~= nil) then
						goto _continue2
					end
					do
						local subscripts = node:exportSubscripts()
						if _g.jk.lang.Vector:getSize(subscripts) ~= 1 then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Only one-dimensional subscripts are supported", node, nil))
						end
						do
							local subscript = _vm:to_table_with_key(_g.jk.lang.Vector:get(subscripts, 0), '_isType.sling.model.ExpressionNode')
							if not (subscript ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null subscript", node, nil))
							end
							do
								local pp = _vm:to_table_with_key(node:getParent(), '_isType.sling.model.AssignmentExpressionNode')
								if pp ~= nil and pp:getLeft() == node then
									local value = pp:exportRight()
									local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("_vm"), "set_subscript_value", true)
									do fc:addToParameters(xpr) end
									do fc:addToParameters(subscript) end
									do fc:addToParameters(value) end
									do _g.sling.util.NodeUtil:replaceNode(pp, fc) end
								else
									local fc = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName("_vm"), "get_subscript_value", true)
									do fc:addToParameters(xpr) end
									do fc:addToParameters(subscript) end
									do _g.sling.util.NodeUtil:replaceNode(node, fc) end
								end
							end
						end
					end
				end
				::_continue2::
				do n = n + 1 end
			end
		end
	end
end

function sling.sushi.compiler.SlingToSushiOps:addStaticCastsAroundIntegerDivisions(ctx, node)
	local array = _g.sling.util.NodeFinder:findCompatibleNodesForTypes(node, {
		"class:sling.model.DivisionExpressionNode",
		"class:sling.model.ModuloExpressionNode"
	}, false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local div = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ArithmeticExpressionNode')
				if div ~= nil then
					local pp = _vm:to_table_with_key(div:getParent(), '_isType.sling.model.StaticCastExpressionNode')
					if pp ~= nil then
						local type = pp:getType()
						if type ~= nil and (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
							goto _continue3
						end
					end
					do
						local left = div:getLeft()
						local right = div:getRight()
						if left ~= nil and right ~= nil then
							local ldt = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(left, nil)
							local rdt = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(right, nil)
							if ldt ~= nil and rdt ~= nil and (_vm:to_table_with_key(ldt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and (_vm:to_table_with_key(rdt, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
								local nn = _g.sling.model.StaticCastExpressionNode._construct0(_g.sling.model.StaticCastExpressionNode._create())
								do nn:setType(_g.sling.model.IntegerDataTypeNode._construct0(_g.sling.model.IntegerDataTypeNode._create()), false) end
								do _g.sling.util.NodeUtil:replaceAndExport(div, nn) end
								do nn:setExpression(div, false) end
							end
						end
					end
				end
				::_continue3::
				do n = n + 1 end
			end
		end
	end
end

sling.sushi.compiler.SushiLuaGenerator = _g.sling.common.CodeGenerator._create()
sling.sushi.compiler.SushiLuaGenerator.__index = sling.sushi.compiler.SushiLuaGenerator
_vm:set_metatable(sling.sushi.compiler.SushiLuaGenerator, {
	__index = _g.sling.common.CodeGenerator
})

function sling.sushi.compiler.SushiLuaGenerator._create()
	local v = _vm:set_metatable({}, sling.sushi.compiler.SushiLuaGenerator)
	return v
end

function sling.sushi.compiler.SushiLuaGenerator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.sushi.compiler.SushiLuaGenerator'
	self['_isType.sling.sushi.compiler.SushiLuaGenerator'] = true
	self.excludeComments = false
	self.indent = 0
	self.wasNewline = false
	self.nameStack = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
end

function sling.sushi.compiler.SushiLuaGenerator:_construct0()
	sling.sushi.compiler.SushiLuaGenerator._init(self)
	do _g.sling.common.CodeGenerator._construct0(self) end
	return self
end

function sling.sushi.compiler.SushiLuaGenerator:_construct2(ctx, output)
	sling.sushi.compiler.SushiLuaGenerator._init(self)
	do _g.sling.common.CodeGenerator._construct2(self, ctx, output) end
	return self
end

function sling.sushi.compiler.SushiLuaGenerator:increaseIndent()
	do self.indent = self.indent + 1 end
end

function sling.sushi.compiler.SushiLuaGenerator:decreaseIndent()
	do self.indent = self.indent - 1 end
end

function sling.sushi.compiler.SushiLuaGenerator:output(str)
	if self.wasNewline then
		do
			local n = 0
			while n < self.indent do
				do self:outputDirect("\t") end
				do n = n + 1 end
			end
		end
		self.wasNewline = false
	end
	do self:outputDirect(str) end
	if _g.jk.lang.String:endsWith(str, "\n") then
		self.wasNewline = true
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpComment(node)
	if not (node ~= nil) then
		do return end
	end
	if not (self.excludeComments == false) then
		do return end
	end
	do
		local substantial = node:getSubstantial()
		local text = node:getText()
		if substantial == false and _g.jk.lang.String:getIndexOfCharacter(text, 10, 0) >= 0 then
			substantial = true
		end
		if substantial then
			do self:output("--\n") end
			do
				local array = _g.jk.lang.String:split(text, 10, 0)
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local line = array[n + 1]
							if line ~= nil then
								do self:output("-- " .. _g.jk.lang.String:safeString(line) .. "\n") end
							end
							do n = n + 1 end
						end
					end
				end
				do self:output("--\n") end
			end
		elseif _g.jk.lang.String:startsWith(text, " ", 0) == false then
			do self:output("-- " .. _g.jk.lang.String:safeString(text) .. "\n") end
		else
			do self:output("--" .. _g.jk.lang.String:safeString(text) .. "\n") end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpSymbol(symbol, isFunctionCall)
	local names = _g.sling.util.SymbolUtil:getSymbolComponents(symbol)
	local sz = _g.jk.lang.Vector:getSize(names)
	if sz < 1 then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty name for symbol", symbol, _g.jk.lang.StackTrace:generate()))
	end
	do
		local n = 0
		while n < sz do
			local o = names[n + 1]
			if n > 0 then
				if isFunctionCall and n == sz - 1 then
					do self:output(":") end
				else
					do self:output(".") end
				end
			end
			if (_vm:get_variable_type(o) == 'string') then
				if n == 0 and _g.sling.util.ModifierUtil:hasCommonModifier(symbol, _g.sling.model.Modifier.GLOBAL) then
					do self:output("_g.") end
				end
				do self:output(o) end
				goto _continue4
			end
			if (_vm:to_table_with_key(o, '_isType.sling.model.SymbolNameComponentNode') ~= nil) then
				if n == 0 and _g.sling.util.ModifierUtil:hasCommonModifier(symbol, _g.sling.model.Modifier.GLOBAL) then
					do self:output("_g.") end
				end
				do
					local c = o
					do self:output(c:getName()) end
					goto _continue4
				end
			end
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported symbol component", symbol, _g.jk.lang.StackTrace:generate()))
			::_continue4::
			do n = n + 1 end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpImportPackageStatement(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local package = node:getPackage()
		if not (package ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null package", nil, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("local ") end
		do
			local localname = node:getLocalName()
			if _g.jk.lang.String:isNotEmpty(localname) then
				do self:output(localname) end
			else
				do self:dumpSymbol(package, false) end
			end
			do self:output(" = require(\"") end
			do self:dumpSymbol(package, false) end
			do self:output("\")\n") end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpFunctionParameter(param)
	if (_vm:to_table_with_key(param, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
		do self:output(param:getName()) end
	elseif (_vm:to_table_with_key(param, '_isType.sling.model.VariableArgumentsDeclarationNode') ~= nil) then
		local vd = param:getVariableDeclaration()
		if vd ~= nil then
			do self:output(vd:getName()) end
			do self:output(", ...") end
		else
			do self:output("...") end
		end
	else
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. param:getNodeTypeName() .. "' in context `" .. "function parameter" .. "'", param, nil))
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpFunctionDeclaration(node, isExpression)
	if not (node ~= nil) then
		do return end
	end
	do self:output("function") end
	do
		local name = node:getName()
		if _g.jk.lang.String:isNotEmpty(name) then
			do self:output(" ") end
			do
				local pp = node:getParent()
				if pp ~= nil and (_vm:to_table_with_key(pp, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
					do self:output(self:getQualifiedName(name, 58)) end
				else
					do self:output(name) end
				end
			end
		end
		do self:output("(") end
		do
			local params = node:getParameters()
			local first = true
			if params ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(params)
				do
					n = 0
					while n < m do
						local param = _vm:to_table_with_key(params[n + 1], '_isType.sling.common.NodeObject')
						if param ~= nil then
							if not first then
								do self:output(", ") end
							end
							do self:dumpFunctionParameter(param) end
							first = false
						end
						do n = n + 1 end
					end
				end
			end
			do self:output(")\n") end
			do self:increaseIndent() end
			do
				local body = node:getBody()
				if body ~= nil then
					do self:dumpBlock(body) end
				end
				do self:decreaseIndent() end
				do self:output("end") end
				if not isExpression then
					do self:output("\n") end
				end
			end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpLocalVariableDeclaration(vd)
	if not (vd ~= nil) then
		do return end
	end
	do self:output("local ") end
	do self:output(vd:getName()) end
	do self:output(" = ") end
	do
		local init = vd:getInitializer()
		if init ~= nil then
			do self:dumpExpression(init, nil, false) end
		else
			do self:output("nil") end
		end
		do self:output("\n") end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpContainerNodes(nodes, context)
	local prev = nil
	if nodes ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(nodes)
		do
			n = 0
			while n < m do
				local child = _vm:to_table_with_key(nodes[n + 1], '_isType.sling.common.NodeObject')
				if child ~= nil then
					if (_vm:to_table_with_key(child, '_isType.sling.model.ResourceFileNode') ~= nil) then
						goto _continue5
					end
					do self:separateStatements(child, prev, context) end
					prev = child
					if (_vm:to_table_with_key(child, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
						do self:dumpLocalVariableDeclaration(child) end
						goto _continue5
					end
					do self:dumpStatement(child, context) end
				end
				::_continue5::
				do n = n + 1 end
			end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpBlock(block)
	do self:dumpContainerNodes(block:getNodes(), "block") end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpScript(script)
	do self:dumpContainerNodes(script:getNodes(), "script") end
end

function sling.sushi.compiler.SushiLuaGenerator:escapeStringLiteral(str)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local it = _g.jk.lang.String:iterate(str)
	while it ~= nil do
		local c = it:getNextChar()
		if _g.jk.lang.Character:isEOF(c) then
			do break end
		end
		if c == 7 then
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
		elseif c == 34 then
			do sb:appendString("\\\"") end
		else
			do sb:appendCharacter(c) end
		end
	end
	do return sb:toString() end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpExpressionOrTuple(node, parent, isRvalue)
	if (_vm:to_table_with_key(node, '_isType.sling.model.TupleExpressionNode') ~= nil) then
		local first = true
		local array = node:getExpressions()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local value = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ExpressionNode')
					if value ~= nil then
						if not first then
							do self:output(", ") end
						end
						do self:dumpExpression(value, parent, isRvalue) end
						first = false
					end
					do n = n + 1 end
				end
			end
		end
	else
		do self:dumpExpression(node, parent, isRvalue) end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpDataType(node)
	if not (node ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
		local sym = node:getSymbol()
		if not (sym ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null symbol", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpSymbol(sym, false) end
		do return end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "data type" .. "'", node, nil))
end

function sling.sushi.compiler.SushiLuaGenerator:getBaseClassType(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null node in getBaseClassType", nil, _g.jk.lang.StackTrace:generate()))
	end
	do
		local entity = _g.sling.util.FindUtil:findNearestEntity(node)
		if not (entity ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No enclosing entity", node, _g.jk.lang.StackTrace:generate()))
		end
		do
			local baseclass = _g.sling.util.EntityUtil:getBaseClassTypeForEntity(entity)
			if not (baseclass ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No base class for enclosing entity", node, _g.jk.lang.StackTrace:generate()))
			end
			do return baseclass end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:getIsTypeVariableName(names)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString("_isType") end
	if names ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(names)
		do
			n = 0
			while n < m do
				local name = names[n + 1]
				if name ~= nil then
					do sb:appendCharacter(46) end
					do sb:appendString(name) end
				end
				do n = n + 1 end
			end
		end
	end
	do return sb:toString() end
end

function sling.sushi.compiler.SushiLuaGenerator:getOperatorPrecedence(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.ExponentExpressionNode') ~= nil) then
		do return 1 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LogicalNotExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.NegativeNumberExpressionNode') ~= nil) then
		do return 2 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MultiplicationExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.DivisionExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.ModuloExpressionNode') ~= nil) then
		do return 3 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AdditionExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.SubtractionExpressionNode') ~= nil) then
		do return 4 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StringConcatenationExpressionNode') ~= nil) then
		do return 5 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ComparisonExpressionNode') ~= nil) then
		do return 6 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LogicalExpressionNode') ~= nil) then
		do return 7 end
	end
	do return 0 end
end

function sling.sushi.compiler.SushiLuaGenerator:isLowerPriority(node, parent, isRvalue)
	if not (parent ~= nil) then
		do return false end
	end
	if isRvalue then
		if self:getOperatorPrecedence(node) >= self:getOperatorPrecedence(parent) then
			do return true end
		end
	elseif self:getOperatorPrecedence(node) > self:getOperatorPrecedence(parent) then
		do return true end
	end
	do return false end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpExpression(node, parent, isRvalue)
	local lower = self:isLowerPriority(node, parent, isRvalue)
	if lower then
		do self:output("(") end
	end
	do self:doDumpExpression(node, parent) end
	if lower then
		do self:output(")") end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:doDumpExpression(node, parent)
	if (_vm:to_table_with_key(node, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
		local symbol = node:getSymbol()
		if not (symbol ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null symbol", node, _g.jk.lang.StackTrace:generate()))
		end
		do
			local isFunctionCall = false
			local pfc = _vm:to_table_with_key(node:getParent(), '_isType.sling.model.FunctionCallExpressionNode')
			if pfc ~= nil and pfc:getExpression() == node then
				isFunctionCall = true
			end
			do self:dumpSymbol(symbol, isFunctionCall) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) then
		local fc = node
		local params = fc:getParameters()
		local xpr = fc:getExpression()
		if not (xpr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", fc, _g.jk.lang.StackTrace:generate()))
		end
		do
			local first = true
			if (_vm:to_table_with_key(xpr, '_isType.sling.model.FunctionDeclarationExpressionNode') ~= nil) then
				do self:output("(") end
				do self:dumpExpression(xpr, fc, false) end
				do self:output(")(") end
			elseif (_vm:to_table_with_key(xpr, '_isType.sling.model.BaseClassAccessExpressionNode') ~= nil) then
				local baseclass = self:getBaseClassType(xpr)
				do self:dumpDataType(baseclass) end
				do self:output(".") end
				do self:output("_construct") end
				do self:output(_g.jk.lang.String:forInteger(_g.jk.lang.Vector:getSize(params))) end
				do self:output("(self") end
				first = false
			elseif (_vm:to_table_with_key(xpr, '_isType.sling.model.MemberAccessExpressionNode') ~= nil) and (_vm:to_table_with_key(xpr:getParentExpression(), '_isType.sling.model.BaseClassAccessExpressionNode') ~= nil) then
				local baseclass = self:getBaseClassType(xpr)
				do self:dumpDataType(baseclass) end
				do self:output(".") end
				do
					local child = xpr:getChildExpression()
					if not (child ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No child expression", xpr, _g.jk.lang.StackTrace:generate()))
					end
					do self:dumpExpression(child, fc, false) end
					do self:output("(self") end
					first = false
				end
			else
				do self:dumpExpression(xpr, fc, false) end
				do self:output("(") end
			end
			if params ~= nil then
				local n2 = 0
				local m = _g.jk.lang.Vector:getSize(params)
				do
					n2 = 0
					while n2 < m do
						local param = _vm:to_table_with_key(params[n2 + 1], '_isType.sling.model.ExpressionNode')
						if param ~= nil then
							if not first then
								do self:output(", ") end
							end
							first = false
							do self:dumpExpression(param, nil, false) end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			do self:output(")") end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MemberAccessExpressionNode') ~= nil) then
		local max = node
		local left = max:getParentExpression()
		if not (left ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left", node, _g.jk.lang.StackTrace:generate()))
		end
		do
			local right = max:getChildExpression()
			if not (right ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(left, node, false) end
			do
				local xnode = max
				while true do
					local np = _vm:to_table_with_key(xnode:getParent(), '_isType.sling.model.MemberAccessExpressionNode')
					if np ~= nil then
						xnode = np
					else
						do break end
					end
				end
				do
					local at = max:getAccessType()
					if at == _g.sling.model.MemberAccessExpressionNode.TYPE_INSTANCE_VARIABLE or at == _g.sling.model.MemberAccessExpressionNode.TYPE_STATIC_VARIABLE then
						do self:output(".") end
					elseif _g.sling.util.FunctionUtil:isFunctionCallExpressionChild(xnode) and right == xnode:getLastNode() then
						do self:output(":") end
					else
						do self:output(".") end
					end
					do self:dumpExpression(right, node, false) end
					do return end
				end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StringLiteralExpressionNode') ~= nil) then
		do self:output("\"") end
		do self:output(self:escapeStringLiteral(node:getValue())) end
		do self:output("\"") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CharacterLiteralExpressionNode') ~= nil) then
		do self:output(_g.jk.lang.String:forInteger(_util:convert_to_integer(node:getValue()))) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.IntegerLiteralExpressionNode') ~= nil) then
		do self:output(_g.jk.lang.String:forInteger(node:getValue())) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DoubleLiteralExpressionNode') ~= nil) then
		do self:output(_g.jk.lang.String:forDouble(node:getValue())) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FloatLiteralExpressionNode') ~= nil) then
		do self:output(_g.jk.lang.String:forFloat(node:getValue())) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MapLiteralExpressionNode') ~= nil) then
		local maplit = node
		local values = maplit:getValues()
		if _g.jk.lang.Vector:isEmpty(values) then
			do self:output("{}") end
			do return end
		end
		do self:output("{") end
		do self:increaseIndent() end
		do
			local first = true
			if values ~= nil then
				local n3 = 0
				local m2 = _g.jk.lang.Vector:getSize(values)
				do
					n3 = 0
					while n3 < m2 do
						local value = _vm:to_table_with_key(values[n3 + 1], '_isType.sling.model.KeyValueNode')
						if value ~= nil then
							if first then
								do self:output("\n") end
							else
								do self:output(",\n") end
							end
							do self:output("[") end
							do self:dumpExpression(value:getKey(), nil, false) end
							do self:output("] = ") end
							do self:dumpExpression(value:getValue(), nil, false) end
							first = false
						end
						do n3 = n3 + 1 end
					end
				end
			end
			do self:decreaseIndent() end
			do self:output("\n") end
			do self:output("}") end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SetLiteralExpressionNode') ~= nil) then
		local setlit = node
		local values = setlit:getValues()
		if _g.jk.lang.Vector:isEmpty(values) then
			do self:output("{}") end
			do return end
		end
		do self:output("{") end
		do self:increaseIndent() end
		do
			local first = true
			if values ~= nil then
				local n4 = 0
				local m3 = _g.jk.lang.Vector:getSize(values)
				do
					n4 = 0
					while n4 < m3 do
						local value = _vm:to_table_with_key(values[n4 + 1], '_isType.sling.model.ExpressionNode')
						if value ~= nil then
							if first then
								do self:output("\n") end
							else
								do self:output(",\n") end
							end
							do self:output("[") end
							do self:dumpExpression(value, nil, false) end
							do self:output("] = true") end
						end
						do n4 = n4 + 1 end
					end
				end
			end
			do self:decreaseIndent() end
			do self:output("\n") end
			do self:output("}") end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ArrayLiteralExpressionNode') ~= nil) then
		local alit = node
		do self:output("{") end
		do self:increaseIndent() end
		do
			local first = true
			local array = alit:getExpressions()
			if array ~= nil then
				local n5 = 0
				local m4 = _g.jk.lang.Vector:getSize(array)
				do
					n5 = 0
					while n5 < m4 do
						local value = _vm:to_table_with_key(array[n5 + 1], '_isType.sling.model.ExpressionNode')
						if value ~= nil then
							if first then
								do self:output("\n") end
							else
								do self:output(",\n") end
							end
							first = false
							do self:dumpExpression(value, nil, false) end
						end
						do n5 = n5 + 1 end
					end
				end
			end
			do self:decreaseIndent() end
			do self:output("\n") end
			do self:output("}") end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EqualsExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, "==") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.NotEqualsExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, "~=") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GreaterOrEqualExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, ">=") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GreaterThanExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, ">") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LessOrEqualExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, "<=") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LessThanExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, "<") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StringEqualsExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, "==") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SubscriptExpressionNode') ~= nil) then
		local se = node
		local xpr = se:getChild()
		if not (xpr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null child", se, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(xpr, se, false) end
		do
			local array2 = se:getSubscripts()
			if array2 ~= nil then
				local n6 = 0
				local m5 = _g.jk.lang.Vector:getSize(array2)
				do
					n6 = 0
					while n6 < m5 do
						local subscript = _vm:to_table_with_key(array2[n6 + 1], '_isType.sling.model.ExpressionNode')
						if subscript ~= nil then
							do self:output("[") end
							do self:dumpExpression(subscript, nil, false) end
							do self:output("]") end
						end
						do n6 = n6 + 1 end
					end
				end
			end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LogicalNotExpressionNode') ~= nil) then
		local ln = node
		local xpr = ln:getExpression()
		if not (xpr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", ln, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("not ") end
		do self:dumpExpression(xpr, ln, false) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LogicalAndExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, "and") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LogicalOrExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, "or") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StringConcatenationExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, "..") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationExpressionNode') ~= nil) then
		local fd = node:getDeclaration()
		if not (fd ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null declaration", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpFunctionDeclaration(fd, true) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AdditionExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, "+") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SubtractionExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, "-") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DivisionExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, "/") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MultiplicationExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, "*") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ModuloExpressionNode') ~= nil) then
		do self:dumpBinaryOperatorExpression(node, "%") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EmptyExpressionNode') ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CreateObjectExpressionNode') ~= nil) then
		local co = node
		local type = co:getType()
		if not (type ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null type", co, _g.jk.lang.StackTrace:generate()))
		end
		if (_vm:to_table_with_key(type, '_isType.sling.model.VectorDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.MapDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.ObjectDataTypeNode') ~= nil) then
			do self:output("{}") end
			do return end
		end
		do
			local params = co:getParameters()
			local nparams = _g.jk.lang.Vector:getSize(params)
			local ctorname = "_construct" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(nparams))
			do self:dumpDataType(type) end
			do self:output(".") end
			do self:output(ctorname) end
			do self:output("(") end
			do self:dumpDataType(type) end
			do self:output("._create()") end
			if params ~= nil then
				local n7 = 0
				local m6 = _g.jk.lang.Vector:getSize(params)
				do
					n7 = 0
					while n7 < m6 do
						local param = _vm:to_table_with_key(params[n7 + 1], '_isType.sling.model.ExpressionNode')
						if param ~= nil then
							do self:output(", ") end
							do self:dumpExpression(param, nil, false) end
						end
						do n7 = n7 + 1 end
					end
				end
			end
			do self:output(")") end
			if co:getInitializers() ~= nil then
				do _g.sling.common.RefLog:warning(self.ctx, "initializers are not supported in Lua", co) end
			end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.NullLiteralExpressionNode') ~= nil) then
		do self:output("nil") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.NegativeNumberExpressionNode') ~= nil) then
		do self:output("-") end
		do
			local xpr = node:getExpression()
			if not (xpr ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(xpr, node, false) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CurrentObjectExpressionNode') ~= nil) then
		do self:output("self") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AllocateBufferExpressionNode') ~= nil) then
		do self:output("_util:allocate_buffer(") end
		do
			local xpr = node:getExpression()
			if not (xpr ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(")") end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BooleanLiteralExpressionNode') ~= nil) then
		local val = node:getValue()
		if val then
			do self:output("true") end
		else
			do self:output("false") end
		end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TypeCheckExpressionNode') ~= nil) then
		local tcx = node
		local type = tcx:getType()
		if not (type ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null type", tcx, _g.jk.lang.StackTrace:generate()))
		end
		do
			local xpr = tcx:getExpression()
			if not (xpr ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", tcx, _g.jk.lang.StackTrace:generate()))
			end
			do
				local typeFunction = "_vm:get_variable_type"
				if (_vm:to_table_with_key(type, '_isType.sling.model.ObjectDataTypeNode') ~= nil) then
					do self:output("(function(x) return x ~= nil and " .. _g.jk.lang.String:safeString(typeFunction) .. "(x) == 'table' and x._isClassInstance == true end)(") end
					do self:dumpExpression(xpr, nil, false) end
					do self:output(")") end
				elseif (_vm:to_table_with_key(type, '_isType.sling.model.ExceptionDataTypeNode') ~= nil) then
					do _g.sling.common.RefLog:warning(self.ctx, "Type checking for exception data types cannot be done reliably. It is recommended to find a different way.", node) end
					do self:output("(function(x) return x ~= nil and " .. _g.jk.lang.String:safeString(typeFunction) .. "(x) == 'table' and x._isClassInstance == true end)(") end
					do self:dumpExpression(xpr, nil, false) end
					do self:output(")") end
				elseif (_vm:to_table_with_key(type, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
					do self:output("_util:is_buffer(") end
					do self:dumpExpression(xpr, nil, false) end
					do self:output(")") end
				elseif (_vm:to_table_with_key(type, '_isType.sling.model.VectorDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) then
					do _g.sling.common.RefLog:warning(self.ctx, "Type checking for vector and array data types cannot be done reliably. It is recommended to find a different way.", node) end
					do self:output("(function(x) return x ~= nil and " .. _g.jk.lang.String:safeString(typeFunction) .. "(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(") end
					do self:dumpExpression(xpr, nil, false) end
					do self:output(")") end
				elseif (_vm:to_table_with_key(type, '_isType.sling.model.MapDataTypeNode') ~= nil) then
					do _g.sling.common.RefLog:warning(self.ctx, "Type checking for map data types cannot be done reliably. It is recommended to find a different way.", node) end
					do self:output("(function(x) return x ~= nil and " .. _g.jk.lang.String:safeString(typeFunction) .. "(x) == 'table' and not x._isClassInstance == true and #x < 1 end)(") end
					do self:dumpExpression(xpr, nil, false) end
					do self:output(")") end
				elseif (_vm:to_table_with_key(type, '_isType.sling.model.StringDataTypeNode') ~= nil) then
					do self:output("(" .. _g.jk.lang.String:safeString(typeFunction) .. "(") end
					do self:dumpExpression(xpr, nil, false) end
					do self:output(") == 'string')") end
				elseif (_vm:to_table_with_key(type, '_isType.sling.model.FunctionDataTypeNode') ~= nil) then
					do self:output("(" .. _g.jk.lang.String:safeString(typeFunction) .. "(") end
					do self:dumpExpression(xpr, nil, false) end
					do self:output(") == 'function')") end
				elseif (_vm:to_table_with_key(type, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
					do self:output("(" .. _g.jk.lang.String:safeString(typeFunction) .. "(") end
					do self:dumpExpression(xpr, nil, false) end
					do self:output(") == 'boolean')") end
				elseif (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.FloatDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.DoubleDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.CharacterDataTypeNode') ~= nil) then
					do self:output("(" .. _g.jk.lang.String:safeString(typeFunction) .. "(") end
					do self:dumpExpression(xpr, nil, false) end
					do self:output(") == 'number')") end
				elseif (_vm:to_table_with_key(type, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
					do self:output("(_vm:to_table_with_key(") end
					do self:dumpExpression(xpr, nil, false) end
					do self:output(", '") end
					do
						local names = _g.sling.util.SymbolUtil:getSymbolNames(type:getSymbol())
						if not (names ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Data type symbol has no names", type, _g.jk.lang.StackTrace:generate()))
						end
						do self:output(self:getIsTypeVariableName(names)) end
						do self:output("') ~= nil)") end
					end
				elseif (_vm:to_table_with_key(type, '_isType.sling.model.DynamicDataTypeNode') ~= nil) then
					do self:output("true") end
				else
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. type:getNodeTypeName() .. "' in context `" .. "type check expression" .. "'", type, nil))
				end
				do return end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DynamicCastExpressionNode') ~= nil) then
		local xpr = node:getExpression()
		if not (xpr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do
			local type = _vm:to_table_with_key(node:getType(), '_isType.sling.model.ReferenceDataTypeNode')
			if not (type ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("only reference data types are supported in dynamic cast expressions", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:output("_vm:to_table_with_key(") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(", '") end
			do
				local names = _g.sling.util.SymbolUtil:getSymbolNames(type:getSymbol())
				if not (names ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Data type symbol has no names", type, _g.jk.lang.StackTrace:generate()))
				end
				do self:output(self:getIsTypeVariableName(names)) end
				do self:output("')") end
				do return end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StaticCastExpressionNode') ~= nil) then
		local xpr = node:getExpression()
		if not (xpr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do
			local type = node:getType()
			if type ~= nil and (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
				do self:output("_util:convert_to_integer(") end
				do self:dumpExpression(xpr, nil, false) end
				do self:output(")") end
			else
				do self:dumpExpression(xpr, parent, false) end
			end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GetExpressionTypeinfoExpressionNode') ~= nil) then
		local xpr = node:getExpression()
		if not (xpr ~= nil) then
			xpr = _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create())
		end
		do self:output("_vm:get_datatype_info(") end
		do self:dumpExpression(xpr, nil, false) end
		do self:output(")") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PostDecrementExpressionNode') ~= nil) then
		local xpr = node:getExpression()
		if (_vm:to_table_with_key(node:getParent(), '_isType.sling.model.BlockNode') ~= nil) then
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" = ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" - 1") end
		else
			do self:output("(function() local v = ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" = ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" - 1 return v end)()") end
		end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PostIncrementExpressionNode') ~= nil) then
		local xpr = node:getExpression()
		if (_vm:to_table_with_key(node:getParent(), '_isType.sling.model.BlockNode') ~= nil) then
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" = ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" + 1") end
		else
			do self:output("(function() local v = ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" = ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" + 1 return v end)()") end
		end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PreDecrementExpressionNode') ~= nil) then
		local xpr = node:getExpression()
		if (_vm:to_table_with_key(node:getParent(), '_isType.sling.model.BlockNode') ~= nil) then
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" = ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" - 1") end
		else
			do self:output("(function() ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" = ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" - 1 return ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" end)()") end
		end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PreIncrementExpressionNode') ~= nil) then
		local xpr = node:getExpression()
		if (_vm:to_table_with_key(node:getParent(), '_isType.sling.model.BlockNode') ~= nil) then
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" = ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" + 1") end
		else
			do self:output("(function() ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" = ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" + 1 return ") end
			do self:dumpExpression(xpr, nil, false) end
			do self:output(" end)()") end
		end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ArrayCreationExpressionNode') ~= nil) then
		local acx = node
		local lit = acx:getArrayLiteral()
		if lit ~= nil then
			do self:dumpExpression(lit, parent, false) end
		else
			local dims = acx:getDimensionCount()
			if dims < 1 then
				do self:output("{}") end
			elseif dims == 1 then
				local dim = _vm:to_table_with_key(_g.jk.lang.Vector:get(acx:getDimensions(), 0), '_isType.sling.model.ExpressionNode')
				if not (dim ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null dimension 0", acx, _g.jk.lang.StackTrace:generate()))
				end
				do self:output("_vm:allocate_array(") end
				do self:dumpExpression(dim, nil, false) end
				do self:output(")") end
			else
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Multiple dimensions in array creation expressions is not supported.", node, _g.jk.lang.StackTrace:generate()))
			end
		end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GetSizeExpressionNode') ~= nil) then
		local xpr = node:getExpression()
		if not (xpr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("#") end
		do self:dumpExpression(xpr, node, false) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EmbedBlockNode') ~= nil) then
		do self:dumpEmbedBlock(node, true) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AppendToVectorExpressionNode') ~= nil) then
		local avec = node
		local left = avec:getLeft()
		if not (left ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left", avec, _g.jk.lang.StackTrace:generate()))
		end
		do
			local right = avec:getRight()
			if not (right ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right", avec, _g.jk.lang.StackTrace:generate()))
			end
			if (_vm:to_table_with_key(not (left ~= nil), '_isType.sling.model.SymbolExpressionNode') ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("appending to non-symbol expression vector", avec, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(left, nil, false) end
			do self:output("[#") end
			do self:dumpExpression(left, nil, false) end
			do self:output(" + 1] = ") end
			do self:dumpExpression(right, nil, false) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BufferLiteralExpressionNode') ~= nil) then
		do self:output("_util:create_buffer({") end
		do
			local first = true
			local buf = node:getValue()
			if buf ~= nil then
				local sz = #buf
				do
					local n = 0
					while n < sz do
						if first then
							do self:output(" ") end
							first = false
						else
							do self:output(",") end
						end
						do self:output(_g.jk.lang.String:forInteger(buf[n + 1])) end
						do n = n + 1 end
					end
				end
			end
			if not first then
				do self:output(" ") end
			end
			do self:output("})") end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GetDatatypeTypeinfoExpressionNode') ~= nil) then
		do self:output("\"" .. _g.jk.lang.String:safeString(_g.sling.util.DataTypeUtil:getDataTypeName(node:getType())) .. "\"") end
		do return end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "expression" .. "'", node, nil))
end

function sling.sushi.compiler.SushiLuaGenerator:dumpEmbedBlock(node, isExpression)
	if not (node ~= nil) then
		do return end
	end
	do
		local nt = node:getType()
		if not (nt == nil or nt == "lua") then
			do return end
		end
		do
			local cc = node:getCode()
			if not _g.jk.lang.String:isNotEmpty(cc) then
				do return end
			end
			do
				local first = true
				local array = _g.jk.lang.String:split(cc, 10, 0)
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local line = array[n + 1]
							if line ~= nil then
								line = _g.jk.lang.String:strip(line)
								if _g.jk.lang.String:isEmpty(line) == false then
									if isExpression then
										if not first then
											do self:output(" ") end
										end
										do self:output(line) end
									else
										do self:output(_g.jk.lang.String:safeString(line) .. "\n") end
									end
								end
								first = false
							end
							do n = n + 1 end
						end
					end
				end
			end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpBinaryOperatorExpression(node, op)
	if not (node ~= nil) then
		do return end
	end
	do
		local left = node:getLeft()
		if not (left ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left", node, _g.jk.lang.StackTrace:generate()))
		end
		do
			local right = node:getRight()
			if not (right ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(left, node, false) end
			do self:output(" " .. _g.jk.lang.String:safeString(op) .. " ") end
			do self:dumpExpression(right, node, true) end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:separateStatements(node, prev, context)
	if context == "class" or context == "script" or context == "namespace" then
		if prev == nil then
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.EntityDeclarationNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationBaseNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
			do self:output("\n") end
		elseif _g.jk.lang.String:equals(prev:getNodeTypeName(), node:getNodeTypeName()) == false then
			do self:output("\n") end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:getQualifiedName(name, delim)
	if not (name ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local array = self.nameStack:getData()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local nn = array[n + 1]
					if nn ~= nil then
						if sb:count() > 0 then
							do sb:appendCharacter(46) end
						end
						do sb:appendString(nn) end
					end
					do n = n + 1 end
				end
			end
		end
		if sb:count() > 0 then
			do sb:appendCharacter(delim) end
		end
		do sb:appendString(name) end
		do return sb:toString() end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpNamespace(node)
	local nname = node:getName()
	if _g.jk.lang.String:isEmpty(nname) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("no name", node, _g.jk.lang.StackTrace:generate()))
	end
	do
		local name = self:getQualifiedName(nname, 46)
		do self:output(name) end
		do self:output(" = ") end
		do self:output(name) end
		do self:output(" or {}\n\n") end
		do self.nameStack:push(nname) end
		do self:dumpContainerNodes(node:getNodes(), "namespace") end
		do self.nameStack:pop() end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:getSetMetaTableCallString()
	do return "_vm:set_metatable" end
end

function sling.sushi.compiler.SushiLuaGenerator:hasDestructor(node)
	local array = node:getNodes()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local dd = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.DestructorDeclarationNode')
				if dd ~= nil then
					do return true end
				end
				do n = n + 1 end
			end
		end
	end
	do return false end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpClassDeclaration(node)
	local nname = node:getName()
	if _g.jk.lang.String:isEmpty(nname) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("no name", node, _g.jk.lang.StackTrace:generate()))
	end
	do
		local baseclass = _g.sling.util.EntityUtil:getBaseClassTypeForEntity(node)
		local name = self:getQualifiedName(nname, 46)
		do self:output(name) end
		do self:output(" = ") end
		if baseclass ~= nil then
			do self:dumpDataType(baseclass) end
			do self:output("._create()\n") end
		else
			do self:output("{}\n") end
		end
		do self:output(_g.jk.lang.String:safeString(name) .. ".__index = " .. _g.jk.lang.String:safeString(name) .. "\n") end
		if baseclass ~= nil then
			do self:output(_g.jk.lang.String:safeString(self:getSetMetaTableCallString()) .. "(" .. _g.jk.lang.String:safeString(name) .. ", {\n") end
			do self:increaseIndent() end
			do self:output("__index = ") end
			do self:dumpDataType(baseclass) end
			do self:output("\n") end
			do self:decreaseIndent() end
			do self:output("})\n") end
		else
			do self:output(_g.jk.lang.String:safeString(self:getSetMetaTableCallString()) .. "(" .. _g.jk.lang.String:safeString(name) .. ", {})\n") end
		end
		do self:output("\n") end
		do self.nameStack:push(nname) end
		do
			local statics = 0
			local array = node:getNodes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local child = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.VariableDeclarationNode')
						if child ~= nil then
							if _g.sling.util.ModifierUtil:hasCommonModifier(child, _g.sling.model.Modifier.STATIC) then
								local vd = child
								do self:output(self:getQualifiedName(vd:getName(), 46)) end
								do self:output(" = ") end
								do
									local init = vd:getInitializer()
									if init ~= nil then
										do self:dumpExpression(init, nil, false) end
									else
										do self:output("{}") end
									end
									do self:output("\n") end
									do statics = statics + 1 end
								end
							end
						end
						do n = n + 1 end
					end
				end
			end
			if statics > 0 then
				do self:output("\n") end
			end
			do self:output("function " .. _g.jk.lang.String:safeString(name) .. "._create()\n") end
			do self:increaseIndent() end
			do self:output("local v = " .. _g.jk.lang.String:safeString(self:getSetMetaTableCallString()) .. "({}, " .. _g.jk.lang.String:safeString(name) .. ")\n") end
			do self:output("return v\n") end
			do self:decreaseIndent() end
			do self:output("end\n") end
			do self:output("\n") end
			do self:output("function " .. _g.jk.lang.String:safeString(name) .. ":_init()\n") end
			do self:increaseIndent() end
			do self:output("self._isClassInstance = true\n") end
			do self:output("self._qualifiedClassName = self._qualifiedClassName or '" .. _g.jk.lang.String:safeString(name) .. "'\n") end
			do self:output("self['" .. _g.jk.lang.String:safeString(self:getIsTypeVariableName(self.nameStack:getData())) .. "'] = true\n") end
			do
				local array2 = node:getBaseTypes()
				if array2 ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(array2)
					do
						n2 = 0
						while n2 < m2 do
							local basetype = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.BaseTypeNode')
							if basetype ~= nil then
								local type = basetype:getInheritType()
								if type ~= _g.sling.model.BaseTypeNode.INHERIT_IMPLEMENT then
									goto _continue6
								end
								do
									local reftype = basetype:getReferenceType()
									if not (reftype ~= nil) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null reference type", basetype, _g.jk.lang.StackTrace:generate()))
									end
									do
										local names = _g.sling.util.SymbolUtil:getSymbolNames(reftype:getSymbol())
										if not (names ~= nil) then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Data type symbol has no names", reftype, _g.jk.lang.StackTrace:generate()))
										end
										do self:output("self['" .. _g.jk.lang.String:safeString(self:getIsTypeVariableName(names)) .. "'] = true\n") end
									end
								end
							end
							::_continue6::
							do n2 = n2 + 1 end
						end
					end
				end
				do
					local array3 = node:getNodes()
					if array3 ~= nil then
						local n3 = 0
						local m3 = _g.jk.lang.Vector:getSize(array3)
						do
							n3 = 0
							while n3 < m3 do
								local child = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.model.VariableDeclarationNode')
								if child ~= nil then
									if _g.sling.util.ModifierUtil:hasCommonModifier(child, _g.sling.model.Modifier.STATIC) == false then
										do self:output("self.") end
										do self:output(child:getName()) end
										do self:output(" = ") end
										do
											local init = child:getInitializer()
											if init ~= nil then
												do self:dumpExpression(init, nil, false) end
											else
												do self:output("{}") end
											end
											do self:output("\n") end
										end
									end
								end
								do n3 = n3 + 1 end
							end
						end
					end
					if self:hasDestructor(node) then
						do self:output("self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)\n") end
					end
					do self:decreaseIndent() end
					do self:output("end\n") end
					do
						local prev = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
						local array4 = node:getNodes()
						if array4 ~= nil then
							local n4 = 0
							local m4 = _g.jk.lang.Vector:getSize(array4)
							do
								n4 = 0
								while n4 < m4 do
									local child = _vm:to_table_with_key(array4[n4 + 1], '_isType.sling.common.NodeObject')
									if child ~= nil then
										if (_vm:to_table_with_key(child, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
											goto _continue7
										end
										do self:separateStatements(child, prev, "class") end
										prev = child
										do self:dumpStatement(child, "class") end
									end
									::_continue7::
									do n4 = n4 + 1 end
								end
							end
						end
						do self.nameStack:pop() end
					end
				end
			end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpIfStatement(node)
	local condition = node:getCondition()
	if not (condition ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null condition", node, _g.jk.lang.StackTrace:generate()))
	end
	do self:output("if ") end
	do self:dumpExpression(condition, nil, false) end
	do self:output(" then\n") end
	do self:increaseIndent() end
	do
		local ifblock = node:getIfBlock()
		if ifblock ~= nil then
			do self:dumpBlock(ifblock) end
		end
		do self:decreaseIndent() end
		do
			local elseblock = node:getElseBlock()
			if elseblock ~= nil then
				local elsenodes = elseblock:getNodes()
				local sz = _g.jk.lang.Vector:getSize(elsenodes)
				if sz < 1 then
					do self:output("end\n") end
				elseif sz == 1 and (_vm:to_table_with_key(_g.jk.lang.Vector:get(elsenodes, 0), '_isType.sling.model.IfStatementNode') ~= nil) then
					do self:output("else") end
					do self:dumpIfStatement(_vm:to_table_with_key(_g.jk.lang.Vector:get(elsenodes, 0), '_isType.sling.model.IfStatementNode')) end
				else
					do self:output("else\n") end
					do self:increaseIndent() end
					do self:dumpBlock(elseblock) end
					do self:decreaseIndent() end
					do self:output("end\n") end
				end
			else
				do self:output("end\n") end
			end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpWhileStatement(node)
	local condition = node:getCondition()
	if not (condition ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null condition", node, _g.jk.lang.StackTrace:generate()))
	end
	do self:output("while ") end
	do self:dumpExpression(condition, nil, false) end
	do self:output(" do\n") end
	do self:increaseIndent() end
	do
		local block = node:getBlock()
		if block ~= nil then
			do self:dumpBlock(block) end
		end
		do self:decreaseIndent() end
		do self:output("end\n") end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpDoWhileStatement(node)
	local condition = node:getCondition()
	if not (condition ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null condition", node, _g.jk.lang.StackTrace:generate()))
	end
	do self:output("repeat\n") end
	do self:increaseIndent() end
	do
		local block = node:getBlock()
		if block ~= nil then
			do self:dumpBlock(block) end
		end
		do self:decreaseIndent() end
		do self:output("until not ") end
		do self:dumpExpression(condition, _g.sling.model.LogicalNotExpressionNode._construct0(_g.sling.model.LogicalNotExpressionNode._create()), false) end
		do self:output("\n") end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpReturnStatement(node)
	do self:output("do return") end
	do
		local xpr = node:getExpression()
		if xpr ~= nil then
			do self:output(" ") end
			do self:dumpExpressionOrTuple(xpr, nil, false) end
		end
		do self:output(" end\n") end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpBreakStatement(node)
	do self:output("do break end\n") end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpForEachStatement(node)
	do self:output("for ") end
	do
		local lefts = node:getLefts()
		if _g.jk.lang.Vector:isEmpty(lefts) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("empty lefts", node, _g.jk.lang.StackTrace:generate()))
		end
		do
			local first = true
			if lefts ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(lefts)
				do
					n = 0
					while n < m do
						local lefto = lefts[n + 1]
						if lefto ~= nil then
							local left = _vm:to_table_with_key(lefto, '_isType.sling.model.VariableDeclarationNode')
							if not (left ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Foreach statement does not have a left variable declaration value", node, _g.jk.lang.StackTrace:generate()))
								do return end
							end
							if not first then
								do self:output(", ") end
							end
							first = false
							do self:output(left:getName()) end
						end
						do n = n + 1 end
					end
				end
			end
			do self:output(" in ") end
			do
				local right = node:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right", node, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(right, nil, false) end
				do self:output(" do\n") end
				do self:increaseIndent() end
				do
					local block = node:getBlock()
					if not (block ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null block", node, _g.jk.lang.StackTrace:generate()))
					end
					do self:dumpBlock(block) end
					do self:decreaseIndent() end
					do self:output("end\n") end
				end
			end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpAssertStatement(node)
	if node:getStyle() == _g.sling.model.AssertStatementNode.STYLE_RETURN then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("`Return' style assert statements are not supported in Lua", node, _g.jk.lang.StackTrace:generate()))
	end
	do
		local child = node:getChild()
		if not (child ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null child", node, _g.jk.lang.StackTrace:generate()))
		end
		do
			local xpr = _vm:to_table_with_key(child, '_isType.sling.model.ExpressionNode')
			if not (xpr ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("child is not an expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do
				local block = node:getErrorBlock()
				if block ~= nil then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Error block in assert is not supported in Lua", node, _g.jk.lang.StackTrace:generate()))
				end
				do self:output("assert(") end
				do self:dumpExpression(xpr, nil, false) end
				do
					local error = node:getErrorMessage()
					if error ~= nil then
						do self:output(", ") end
						do self:dumpExpression(error, nil, false) end
					end
					do self:output(")\n") end
				end
			end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpThrowStatement(node)
	local xpr = node:getExpression()
	if not (xpr ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
	end
	do self:output("_vm:throw_error(") end
	do self:dumpExpression(xpr, nil, false) end
	do self:output(")\n") end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpInterfaceDeclaration(node)
	local name = node:getName()
	if _g.jk.lang.String:isEmpty(name) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("empty name", node, _g.jk.lang.StackTrace:generate()))
	end
	do self:output(self:getQualifiedName(name, 46)) end
	do self:output(" = {}\n") end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpPrintLineStatement(node)
	do self:output("_io:write_to_stdout(") end
	do
		local xpr = node:getExpression()
		if xpr ~= nil then
			do self:dumpExpression(xpr, nil, false) end
		end
		do self:output(" .. \"\\n\"") end
		do self:output(")\n") end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpPrintStatementForSushi(node)
	do self:output("_io:write_to_stdout(") end
	do
		local xpr = node:getExpression()
		if xpr ~= nil then
			do self:dumpExpression(xpr, nil, false) end
		end
		do self:output(")\n") end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpConstructorDeclaration(node)
	local pp = _vm:to_table_with_key(node:getParent(), '_isType.sling.model.EntityDeclarationNode')
	if not (pp ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("constructor's parent is not an entity!", node, _g.jk.lang.StackTrace:generate()))
	end
	do
		local nparams = _g.jk.lang.Vector:getSize(node:getParameters())
		local shortname = "_construct" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(nparams))
		local name = self:getQualifiedName(shortname, 58)
		do self:output("function " .. _g.jk.lang.String:safeString(name) .. "(") end
		do
			local first = true
			local array = node:getParameters()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local param = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
						if param ~= nil then
							if not first then
								do self:output(", ") end
							end
							first = false
							do self:dumpFunctionParameter(param) end
						end
						do n = n + 1 end
					end
				end
			end
			do self:output(")\n") end
			do self:increaseIndent() end
			do self:output(self:getQualifiedName("_init", 46)) end
			do self:output("(self)\n") end
			do
				local next = node:getNext()
				if next ~= nil then
					do self:dumpStatement(next, "block") end
				end
				do
					local block = node:getBody()
					if block ~= nil then
						do self:dumpBlock(block) end
					end
					do self:output("return self\n") end
					do self:decreaseIndent() end
					do self:output("end\n") end
				end
			end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpDestructorDeclaration(node)
	local pp = _vm:to_table_with_key(node:getParent(), '_isType.sling.model.EntityDeclarationNode')
	if not (pp ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("destructor's parent is not an entity!", node, _g.jk.lang.StackTrace:generate()))
	end
	do
		local shortname = "_destruct"
		local name = self:getQualifiedName(shortname, 58)
		do self:output("function " .. _g.jk.lang.String:safeString(name) .. "()\n") end
		do self:increaseIndent() end
		do
			local block = node:getBody()
			if block ~= nil then
				do self:dumpBlock(block) end
			end
			do self:decreaseIndent() end
			do self:output("end\n") end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpGoToStatement(node)
	local target = node:getTarget()
	if not (target ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null target", node, _g.jk.lang.StackTrace:generate()))
	end
	do self:output("goto ") end
	do self:dumpExpression(target, nil, false) end
	do self:output("\n") end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpLabeledStatement(node, context)
	local name = node:getName()
	if _g.jk.lang.String:isNotEmpty(name) then
		do self:output("::") end
		do self:output(name) end
		do self:output("::\n") end
	end
	do
		local stmt = node:getStatement()
		if stmt ~= nil then
			do self:dumpStatement(stmt, context) end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpMultipleVariableDeclaration(node)
	local variables = node:getVariables()
	local sz = _g.jk.lang.Vector:getSize(variables)
	if sz < 1 then
		do return end
	end
	do
		local init = node:getInitializer()
		if not (init ~= nil) then
			if variables ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(variables)
				do
					n = 0
					while n < m do
						local variable = _vm:to_table_with_key(variables[n + 1], '_isType.sling.model.VariableDeclarationNode')
						if variable ~= nil then
							do self:dumpLocalVariableDeclaration(variable) end
						end
						do n = n + 1 end
					end
				end
			end
		else
			do self:output("local ") end
			do
				local first = true
				if variables ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(variables)
					do
						n2 = 0
						while n2 < m2 do
							local variable = _vm:to_table_with_key(variables[n2 + 1], '_isType.sling.model.VariableDeclarationNode')
							if variable ~= nil then
								if not first then
									do self:output(", ") end
								end
								first = false
								do self:output(variable:getName()) end
							end
							do n2 = n2 + 1 end
						end
					end
				end
				do self:output(" = ") end
				do self:dumpExpression(init, nil, false) end
				do self:output("\n") end
			end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpStatement(node, context)
	if (_vm:to_table_with_key(node, '_isType.sling.model.CommentNode') ~= nil) then
		do self:dumpComment(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ImportPackageStatementNode') ~= nil) then
		do self:dumpImportPackageStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
		do self:dumpFunctionDeclaration(node, false) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ConstructorDeclarationNode') ~= nil) then
		do self:dumpConstructorDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DestructorDeclarationNode') ~= nil) then
		do self:dumpDestructorDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AssignmentExpressionNode') ~= nil) then
		local assn = node
		local left = assn:getLeft()
		if not (left ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left", assn, _g.jk.lang.StackTrace:generate()))
		end
		do
			local right = assn:getRight()
			if not (right ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right", assn, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpressionOrTuple(left, nil, false) end
			do self:output(" = ") end
			do self:dumpExpressionOrTuple(right, nil, false) end
			do self:output("\n") end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ExpressionNode') ~= nil) then
		do self:output("do ") end
		do self:dumpExpression(node, nil, false) end
		do self:output(" end\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ClassDeclarationNode') ~= nil) then
		do self:dumpClassDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) then
		do self:dumpInterfaceDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.IfStatementNode') ~= nil) then
		do self:dumpIfStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.WhileStatementNode') ~= nil) then
		do self:dumpWhileStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DoWhileStatementNode') ~= nil) then
		do self:dumpDoWhileStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BlockNode') ~= nil) then
		do self:output("do\n") end
		do self:increaseIndent() end
		do self:dumpBlock(node) end
		do self:decreaseIndent() end
		do self:output("end\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ReturnStatementNode') ~= nil) then
		do self:dumpReturnStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BreakStatementNode') ~= nil) then
		do self:dumpBreakStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EmptyStatementNode') ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ForEachStatementNode') ~= nil) then
		do self:dumpForEachStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AssertStatementNode') ~= nil) then
		do self:dumpAssertStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ThrowStatementNode') ~= nil) then
		do self:dumpThrowStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PrintLineStatementNode') ~= nil) then
		do self:dumpPrintLineStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PrintStatementNode') ~= nil) then
		do self:dumpPrintStatementForSushi(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GoToLabelStatementNode') ~= nil) then
		do self:dumpGoToStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LabeledStatementNode') ~= nil) then
		do self:dumpLabeledStatement(node, context) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.NamespaceNode') ~= nil) then
		do self:dumpNamespace(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EmbedBlockNode') ~= nil) then
		do self:dumpEmbedBlock(node, false) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MultipleVariableDeclarationNode') ~= nil) then
		do self:dumpMultipleVariableDeclaration(node) end
		do return end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. context .. "'", node, nil))
end

function sling.sushi.compiler.SushiLuaGenerator:dumpModule(module)
	if not (module ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null module", nil, _g.jk.lang.StackTrace:generate()))
	end
	do
		local array = module:getNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local node = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
					if node ~= nil then
						if (_vm:to_table_with_key(node, '_isType.sling.common.CodeFileNode') ~= nil) then
							do self:dumpFile(node) end
						else
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "module" .. "'", node, nil))
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:dumpFile(file)
	if not (file ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null file", nil, _g.jk.lang.StackTrace:generate()))
	end
	do
		local name = file:getNodeName()
		if _g.jk.lang.String:isEmpty(name) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Code file node has no name!", file, _g.jk.lang.StackTrace:generate()))
		end
		do self:startFile(_g.jk.lang.String:safeString(name) .. ".lua") end
		do self:dumpScript(file) end
		do self:endFile() end
	end
end

function sling.sushi.compiler.SushiLuaGenerator:getExcludeComments()
	do return self.excludeComments end
end

function sling.sushi.compiler.SushiLuaGenerator:setExcludeComments(v)
	self.excludeComments = v
	do return self end
end
