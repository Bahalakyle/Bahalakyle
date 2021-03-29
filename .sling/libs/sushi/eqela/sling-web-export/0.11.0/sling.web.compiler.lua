sling = sling or {}

sling.web = sling.web or {}

sling.web.compiler = sling.web.compiler or {}

sling.web.compiler.SlingToWeb5Compiler = _g.sling.compiler.SlingCompiler._create()
sling.web.compiler.SlingToWeb5Compiler.__index = sling.web.compiler.SlingToWeb5Compiler
_vm:set_metatable(sling.web.compiler.SlingToWeb5Compiler, {
	__index = _g.sling.compiler.SlingCompiler
})

function sling.web.compiler.SlingToWeb5Compiler._create()
	local v = _vm:set_metatable({}, sling.web.compiler.SlingToWeb5Compiler)
	return v
end

function sling.web.compiler.SlingToWeb5Compiler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.web.compiler.SlingToWeb5Compiler'
	self['_isType.sling.web.compiler.SlingToWeb5Compiler'] = true
end

function sling.web.compiler.SlingToWeb5Compiler:_construct0()
	sling.web.compiler.SlingToWeb5Compiler._init(self)
	do _g.sling.compiler.SlingCompiler._construct0(self) end
	return self
end

function sling.web.compiler.SlingToWeb5Compiler:_construct1(ctx)
	sling.web.compiler.SlingToWeb5Compiler._init(self)
	do _g.sling.compiler.SlingCompiler._construct1(self, ctx) end
	return self
end

function sling.web.compiler.SlingToWeb5Compiler:createLibraryManager()
	do return _g.sling.web.compiler.Web5LibraryManager:forDefaultDirectory() end
end

function sling.web.compiler.SlingToWeb5Compiler:getTargetPlatformId()
	do return "web5" end
end

function sling.web.compiler.SlingToWeb5Compiler:getTargetPlatformName()
	do return "Web5" end
end

function sling.web.compiler.SlingToWeb5Compiler:getDefines(v)
	do v:setString("target_js", "true") end
	do v:setString("target_es5", "true") end
	do v:setString("target_web", "true") end
	do v:setString("target_html", "true") end
	do v:setString("target_html_js", "true") end
	do v:setString("target_html5", "true") end
	do v:setString("target_html5_js", "true") end
	do v:setString("target_html5es5", "true") end
	do v:setString("target_browser", "true") end
end

function sling.web.compiler.SlingToWeb5Compiler:getLinkTargetFile(directory, moduleName)
	if not (directory ~= nil) then
		do return nil end
	end
	if not _g.jk.lang.String:isNotEmpty(moduleName) then
		do return nil end
	end
	do return directory:entry(_g.jk.lang.String:safeString(moduleName) .. ".js") end
end

function sling.web.compiler.SlingToWeb5Compiler:executePreprocessorFilters(root)
	do _g.sling.compiler.SlingCompiler.executePreprocessorFilters(self, root) end
	do _g.sling.web.compiler.SlingToWebOps:processHTMLScreensForMotion(root) end
	do _g.sling.web.compiler.SlingToWebOps:processHTMLScreensForWidgets(root) end
end

function sling.web.compiler.SlingToWeb5Compiler:transform(ctx, node, resolver)
	local ph = _g.sling.compiler.ProgressHelper:forSecondHalf(ctx, "Transforming", 33)
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:processDefaultDataTypeValues(ctx, node, true, _vm:to_table_with_key(resolver, '_isType.sling.compiler.SlingTypeResolver')) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:expandPropertyDeclarationsToMethods(ctx, node, resolver) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:transformMapLiterals(node, resolver) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertMainFunctionsToRegularFunctions(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:convertSwitchToIf(ctx, node, nil) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:renameAmbiguousClassVariables(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:moveClassVariableDefaultValuesToConstructors(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertFunctionSymbolReferencesToFunctionDeclarationExpressions(node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:addExplicitCurrentObjectExpressions(ctx, resolver, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:addDefaultParameterValuesToFunctionCalls(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:removeDefaultValuesFromFunctionDeclarations(node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:addBaseCallsToConstructors(ctx, resolver, node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:flattenDynamicCastsWithDynamicType(node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:expandDynamicCastExpressions(ctx, node, false) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertCharactersInComparisonAndArithmeticToStaticCast(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertPrimitiveStatiCastsToFunctionCalls(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:renameEntitiesAndSymbol(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:sortEntitiesByDependencies(ctx, resolver, node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertConstructorsToES5Style(ctx, node, _vm:to_table_with_key(resolver, '_isType.sling.compiler.SlingTypeResolver')) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:renameOverloadedMethods(ctx, resolver, node, true) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:renameNodesWithReservedWords(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertGetSizeExpressions(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:removeStaticCastExpressions(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertVariableDeclarationsToES5Style(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertGetExpressionTypeInfoToMemberAccesses(node, resolver) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:ensureUniqueVariableNames(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertBaseClassFunctionCalls(node, resolver) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertTypeCheckExpressions(node, resolver) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:bindFunctionDeclarationExpressions(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertMapSubscriptsToFunctionCalls(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertPromiseLiteralsToPromiseInstantiations(node) end
	do
		local btinfo = _g.sling.web.compiler.SlingToWebOps:collectAllBaseTypeInfo(node, resolver)
		do ph:onUpdate() end
		do _g.sling.op.CommonOps:unresolveSymbols(ctx, node) end
		do ph:onUpdate() end
		do _g.sling.web.compiler.SlingToWebOps:convertEntitiesToES5Style(node, btinfo, resolver) end
		do ph:_end() end
	end
end

function sling.web.compiler.SlingToWeb5Compiler:writeModuleSources(ctx, node, output, moduleId)
	local root = _g.sling.common.CodeUnitNode._construct0(_g.sling.common.CodeUnitNode._create())
	do _g.sling.compiler.SlingOps:transformToOutputModuleCombined(root, node, nil, "js") end
	do _g.sling.web.compiler.SlingToWebOps:convertSlingToHTMLSettings(root) end
	do
		local generator = _g.sling.js.generator.JSGenerator._construct2(_g.sling.js.generator.JSGenerator._create(), ctx, _g.sling.common.DirectoryOutputWriterManager:forDirectory(ctx, output, true))
		do generator:setSupportTypeScript(false) end
		do generator:writeModule(root) end
		do _g.sling.util.ProjectUtil:copyTreeResourcesToDirectory(ctx, root, output:entry("resources")) end
	end
end

function sling.web.compiler.SlingToWeb5Compiler:linkModules(modules, output, projectId, legacyLinkMode, generateIndex)
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
				local doLink = false
				local code = output:entry(_g.jk.lang.String:safeString(pid) .. ".js")
				local codets = code:getLastModifiedTimeStamp()
				local srcfiles = {}
				local rscfiles = {}
				if modules ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(modules)
					do
						n2 = 0
						while n2 < m2 do
							local module = modules[n2 + 1]
							if module ~= nil then
								local jsc = 0
								local mdir = nil
								if module:isFile() and module:hasExtension("js") then
									do _g.jk.lang.Vector:append(srcfiles, module) end
									if doLink == false and module:getLastModifiedTimeStamp() > codets then
										doLink = true
									end
									do jsc = jsc + 1 end
									mdir = module:getParent()
								else
									local it = module:entries()
									while it ~= nil do
										local ff = it:next()
										if not (ff ~= nil) then
											do break end
										end
										if ff:hasExtension("js") then
											do _g.jk.lang.Vector:append(srcfiles, ff) end
											if doLink == false and ff:getLastModifiedTimeStamp() > codets then
												doLink = true
											end
											do jsc = jsc + 1 end
										end
									end
									mdir = module
								end
								if jsc < 1 then
									do _g.jk.log.Log:warning(self.ctx, "No JS files found for module: `" .. _g.jk.lang.String:safeString(module:getPath()) .. "'") end
								end
								do
									local rdir = mdir:entry("resources")
									if rdir ~= nil then
										local it = rdir:entries()
										while it ~= nil do
											local ff = it:next()
											if not (ff ~= nil) then
												do break end
											end
											if ff:isFile() then
												do _g.jk.lang.Vector:append(rscfiles, ff) end
											end
										end
									end
								end
							end
							do n2 = n2 + 1 end
						end
					end
				end
				if not doLink then
					do _g.jk.log.Log:info(self.ctx, "Already up to date: `" .. _g.jk.lang.String:safeString(code:getPath()) .. "'") end
				else
					local block = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
					local parser = _g.sling.js.parser.JSParser._construct0(_g.sling.js.parser.JSParser._create())
					do parser:setCtx(self.ctx) end
					do
						local fcs = {}
						if srcfiles ~= nil then
							local n3 = 0
							local m3 = _g.jk.lang.Vector:getSize(srcfiles)
							do
								n3 = 0
								while n3 < m3 do
									local file = srcfiles[n3 + 1]
									if file ~= nil then
										do _g.jk.log.Log:status(self.ctx, "[Linking] `" .. _g.jk.lang.String:safeString(file:getPath()) .. "' ..") end
										do
											local ff = parser:parseFile(file)
											if ff ~= nil then
												local array = ff:exportNodes()
												if array ~= nil then
													local n4 = 0
													local m4 = _g.jk.lang.Vector:getSize(array)
													do
														n4 = 0
														while n4 < m4 do
															local node = _vm:to_table_with_key(array[n4 + 1], '_isType.sling.common.NodeObject')
															if node ~= nil then
																if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) then
																	do _g.jk.lang.Vector:append(fcs, node) end
																else
																	do block:addNode(node) end
																end
															end
															do n4 = n4 + 1 end
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
						do
							local doWrap = true
							if legacyLinkMode then
								doWrap = false
							end
							do
								local cf = _g.sling.common.CodeFileNode._construct0(_g.sling.common.CodeFileNode._create())
								do cf:renameNode(pid) end
								if doWrap then
									if fcs ~= nil then
										local n5 = 0
										local m5 = _g.jk.lang.Vector:getSize(fcs)
										do
											n5 = 0
											while n5 < m5 do
												local fc = fcs[n5 + 1]
												if fc ~= nil then
													do block:addNode(fc) end
												end
												do n5 = n5 + 1 end
											end
										end
									end
									do
										local fd = _g.sling.model.FunctionDeclarationNode:forName(pid, false)
										do fd:setBody(block, false) end
										do cf:addNode(fd) end
									end
								else
									if fcs ~= nil then
										local n6 = 0
										local m6 = _g.jk.lang.Vector:getSize(fcs)
										do
											n6 = 0
											while n6 < m6 do
												local fc = fcs[n6 + 1]
												if fc ~= nil then
													do cf:addNode(fc) end
												end
												do n6 = n6 + 1 end
											end
										end
									end
									do
										local array2 = block:exportNodes()
										if array2 ~= nil then
											local n7 = 0
											local m7 = _g.jk.lang.Vector:getSize(array2)
											do
												n7 = 0
												while n7 < m7 do
													local nn = _vm:to_table_with_key(array2[n7 + 1], '_isType.sling.common.NodeObject')
													if nn ~= nil then
														do cf:addNode(nn) end
													end
													do n7 = n7 + 1 end
												end
											end
										end
									end
								end
								do _g.jk.log.Log:status(self.ctx, "[Writing] `" .. _g.jk.lang.String:safeString(code:getPath()) .. "' ..") end
								do
									local writer = _g.sling.common.StringOutputWriterManager._construct0(_g.sling.common.StringOutputWriterManager._create())
									local generator = _g.sling.js.generator.JSGenerator._construct2(_g.sling.js.generator.JSGenerator._create(), self.ctx, writer)
									do generator:setSupportTypeScript(false) end
									do generator:dumpFile(cf) end
									do
										local data = writer:toString()
										if _g.jk.lang.String:isEmpty(data) then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to generate linked JS output", cf, nil))
										end
										if not code:setContentsUTF8(data) then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to write file: `" .. _g.jk.lang.String:safeString(code:getPath()) .. "'", cf, nil))
										end
										do _g.jk.log.Log:status(self.ctx, nil) end
										do _g.jk.log.Log:info(self.ctx, "Wrote: `" .. _g.jk.lang.String:safeString(code:getPath()) .. "'") end
										if generateIndex then
											local html = output:entry("index.html")
											do _g.jk.log.Log:status(self.ctx, "[Writing] `" .. _g.jk.lang.String:safeString(html:getPath()) .. "' ..") end
											do
												local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
												do sb:appendString("<html>\n") end
												do sb:appendString("\t<head>\n") end
												do sb:appendString("\t\t<meta charset=\"utf-8\" />\n") end
												do sb:appendString("\t\t<meta name=\"viewport\" content=\"initial-scale=1,maximum-scale=1\" />\n") end
												do sb:appendString("\t\t<script src=\"" .. _g.jk.lang.String:safeString(code:getBasename()) .. "\" type=\"application/javascript\"></script>\n") end
												do sb:appendString("\t</head>\n") end
												do sb:appendString("\t<body style=\"margin: 0px;\"") end
												if doWrap then
													do sb:appendString(" onload=\"" .. _g.jk.lang.String:safeString(pid) .. "()\"") end
												end
												do sb:appendString(">\n") end
												do sb:appendString("\t</body>\n") end
												do sb:appendString("</html>\n") end
												if not html:setContentsString(sb:toString(), "UTF8") then
													_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to write HTML file: `" .. _g.jk.lang.String:safeString(html:getPath()) .. "'", nil, nil))
												end
												do _g.jk.log.Log:info(self.ctx, "Wrote: `" .. _g.jk.lang.String:safeString(html:getPath()) .. "'") end
											end
										end
									end
								end
							end
						end
					end
				end
				if rscfiles ~= nil then
					local n8 = 0
					local m8 = _g.jk.lang.Vector:getSize(rscfiles)
					do
						n8 = 0
						while n8 < m8 do
							local rscfile = rscfiles[n8 + 1]
							if rscfile ~= nil then
								local dest = output:entry(rscfile:getBasename())
								if not rscfile:copyFileTo(dest) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to copy resource file: `" .. _g.jk.lang.String:safeString(rscfile:getPath()) .. "' to `" .. _g.jk.lang.String:safeString(dest:getPath()) .. "'", nil, nil))
								end
							end
							do n8 = n8 + 1 end
						end
					end
				end
			end
		end
	end
end

function sling.web.compiler.SlingToWeb5Compiler:buildToWebApplication(source, output, customName, customVersion, generateIndex)
	if not (output ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No output directory given for web application", nil, nil))
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
				local destdir = self:getWorkDirFile(_g.jk.lang.String:safeString(appid) .. "_web5")
				do self:linkModules(sources, destdir, name, false, generateIndex) end
				do
					local outputdir = output
					local outputfile = outputdir:entry(_g.jk.lang.String:safeString(appid) .. "_web5.zip")
					do outputfile:remove() end
					do outputdir:createDirectoryRecursive() end
					if not _g.jk.archive.ZipWriter:writeToZipRecursive(self.ctx, outputfile, destdir, true) then
						do _g.jk.lang.Error:throw("failedToWrite", outputfile:getPath()) end
					end
					do _g.jk.log.Log:info(self.ctx, "App: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(outputfile))) end
				end
			end
		end
	end
end

function sling.web.compiler.SlingToWeb5Compiler:buildToLegacyWebApplication(source, output, customName, customVersion, generateIndex)
	if not (output ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No output directory given for web application", nil, nil))
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
				local destdir = self:getWorkDirFile(_g.jk.lang.String:safeString(appid) .. "_web5")
				do self:linkModules(sources, destdir, name, true, generateIndex) end
				do
					local outputdir = output
					local outputfile = outputdir:entry(_g.jk.lang.String:safeString(appid) .. "_web5.zip")
					do outputfile:remove() end
					do outputdir:createDirectoryRecursive() end
					if not _g.jk.archive.ZipWriter:writeToZipRecursive(self.ctx, outputfile, destdir, true) then
						do _g.jk.lang.Error:throw("failedToWrite", outputfile:getPath()) end
					end
					do _g.jk.log.Log:info(self.ctx, "App: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(outputfile))) end
				end
			end
		end
	end
end

sling.web.compiler.SlingToWeb6Compiler = _g.sling.compiler.SlingCompiler._create()
sling.web.compiler.SlingToWeb6Compiler.__index = sling.web.compiler.SlingToWeb6Compiler
_vm:set_metatable(sling.web.compiler.SlingToWeb6Compiler, {
	__index = _g.sling.compiler.SlingCompiler
})

function sling.web.compiler.SlingToWeb6Compiler._create()
	local v = _vm:set_metatable({}, sling.web.compiler.SlingToWeb6Compiler)
	return v
end

function sling.web.compiler.SlingToWeb6Compiler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.web.compiler.SlingToWeb6Compiler'
	self['_isType.sling.web.compiler.SlingToWeb6Compiler'] = true
end

function sling.web.compiler.SlingToWeb6Compiler:_construct0()
	sling.web.compiler.SlingToWeb6Compiler._init(self)
	do _g.sling.compiler.SlingCompiler._construct0(self) end
	return self
end

function sling.web.compiler.SlingToWeb6Compiler:_construct1(ctx)
	sling.web.compiler.SlingToWeb6Compiler._init(self)
	do _g.sling.compiler.SlingCompiler._construct1(self, ctx) end
	return self
end

function sling.web.compiler.SlingToWeb6Compiler:createLibraryManager()
	do return _g.sling.web.compiler.Web6LibraryManager:forDefaultDirectory() end
end

function sling.web.compiler.SlingToWeb6Compiler:getTargetPlatformId()
	do return "web6" end
end

function sling.web.compiler.SlingToWeb6Compiler:getTargetPlatformName()
	do return "Web6" end
end

function sling.web.compiler.SlingToWeb6Compiler:getDefines(v)
	do v:setString("target_js", "true") end
	do v:setString("target_es6", "true") end
	do v:setString("target_web", "true") end
	do v:setString("target_html", "true") end
	do v:setString("target_html_js", "true") end
	do v:setString("target_html5", "true") end
	do v:setString("target_html5_js", "true") end
	do v:setString("target_html5es6", "true") end
	do v:setString("target_browser", "true") end
end

function sling.web.compiler.SlingToWeb6Compiler:getLinkTargetFile(directory, moduleName)
	if not (directory ~= nil) then
		do return nil end
	end
	if not _g.jk.lang.String:isNotEmpty(moduleName) then
		do return nil end
	end
	do return directory:entry(_g.jk.lang.String:safeString(moduleName) .. ".js") end
end

function sling.web.compiler.SlingToWeb6Compiler:executePreprocessorFilters(root)
	do _g.sling.compiler.SlingCompiler.executePreprocessorFilters(self, root) end
	do _g.sling.web.compiler.SlingToWebOps:processHTMLScreensForMotion(root) end
	do _g.sling.web.compiler.SlingToWebOps:processHTMLScreensForWidgets(root) end
end

function sling.web.compiler.SlingToWeb6Compiler:transform(ctx, node, resolver)
	local ph = _g.sling.compiler.ProgressHelper:forSecondHalf(ctx, "Transforming", 30)
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:processDefaultDataTypeValues(ctx, node, true, _vm:to_table_with_key(resolver, '_isType.sling.compiler.SlingTypeResolver')) end
	do ph:onUpdate() end
	do _g.sling.compiler.SlingOps:expandPropertyDeclarationsToMethods(ctx, node, resolver) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:transformMapLiterals(node, resolver) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertMainFunctionsToRegularFunctions(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:convertSwitchToIf(ctx, node, nil) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:renameAmbiguousClassVariables(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertFunctionSymbolReferencesToFunctionDeclarationExpressions(node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:addExplicitCurrentObjectExpressions(ctx, resolver, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:addDefaultParameterValuesToFunctionCalls(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:removeDefaultValuesFromFunctionDeclarations(node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:addBaseCallsToConstructors(ctx, resolver, node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:flattenDynamicCastsWithDynamicType(node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:expandDynamicCastExpressions(ctx, node, false) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertCharactersInComparisonAndArithmeticToStaticCast(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertPrimitiveStatiCastsToFunctionCalls(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:renameEntitiesAndSymbol(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:sortEntitiesByDependencies(ctx, resolver, node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertConstructorsToES5Style(ctx, node, _vm:to_table_with_key(resolver, '_isType.sling.compiler.SlingTypeResolver')) end
	do ph:onUpdate() end
	do _g.sling.op.CommonOps:renameOverloadedMethods(ctx, resolver, node, true) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:renameNodesWithReservedWords(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertGetSizeExpressions(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:removeStaticCastExpressions(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertGetExpressionTypeInfoToMemberAccesses(node, resolver) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:ensureUniqueVariableNames(ctx, node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertTypeCheckExpressions(node, resolver) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:bindFunctionDeclarationExpressions(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertMapSubscriptsToFunctionCalls(node) end
	do ph:onUpdate() end
	do _g.sling.web.compiler.SlingToWebOps:convertPromiseLiteralsToPromiseInstantiations(node) end
	do
		local btinfo = _g.sling.web.compiler.SlingToWebOps:collectAllBaseTypeInfo(node, resolver)
		do ph:onUpdate() end
		do _g.sling.op.CommonOps:unresolveSymbols(ctx, node) end
		do ph:onUpdate() end
		do _g.sling.web.compiler.SlingToWebOps:convertEntitiesToES6Style(ctx, node, btinfo, resolver) end
		do ph:_end() end
	end
end

function sling.web.compiler.SlingToWeb6Compiler:writeModuleSources(ctx, node, output, moduleId)
	local root = _g.sling.common.CodeUnitNode._construct0(_g.sling.common.CodeUnitNode._create())
	do _g.sling.compiler.SlingOps:transformToOutputModuleCombined(root, node, nil, "js") end
	do _g.sling.web.compiler.SlingToWebOps:convertSlingToHTMLSettings(root) end
	do
		local generator = _g.sling.js.generator.JSGenerator._construct2(_g.sling.js.generator.JSGenerator._create(), ctx, _g.sling.common.DirectoryOutputWriterManager:forDirectory(ctx, output, true))
		do generator:setSupportTypeScript(false) end
		do generator:setEnableClassEmbedBlock(true) end
		do generator:writeModule(root) end
		do _g.sling.util.ProjectUtil:copyTreeResourcesToDirectory(ctx, root, output:entry("resources")) end
	end
end

function sling.web.compiler.SlingToWeb6Compiler:linkModules(modules, output, projectId, generateMainFunctionCall, generateIndex)
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
				local doLink = false
				local code = output:entry(_g.jk.lang.String:safeString(pid) .. ".js")
				local codets = code:getLastModifiedTimeStamp()
				local srcfiles = {}
				local rscfiles = {}
				if modules ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(modules)
					do
						n2 = 0
						while n2 < m2 do
							local module = modules[n2 + 1]
							if module ~= nil then
								local jsc = 0
								local mdir = nil
								if module:isFile() and module:hasExtension("js") then
									do _g.jk.lang.Vector:append(srcfiles, module) end
									if doLink == false and module:getLastModifiedTimeStamp() > codets then
										doLink = true
									end
									do jsc = jsc + 1 end
									mdir = module:getParent()
								else
									local it = module:entries()
									while it ~= nil do
										local ff = it:next()
										if not (ff ~= nil) then
											do break end
										end
										if ff:hasExtension("js") then
											do _g.jk.lang.Vector:append(srcfiles, ff) end
											if doLink == false and ff:getLastModifiedTimeStamp() > codets then
												doLink = true
											end
											do jsc = jsc + 1 end
										end
									end
									mdir = module
								end
								if jsc < 1 then
									do _g.jk.log.Log:warning(self.ctx, "No JS files found for module: `" .. _g.jk.lang.String:safeString(module:getPath()) .. "'") end
								end
								do
									local rdir = mdir:entry("resources")
									if rdir ~= nil then
										local it = rdir:entries()
										while it ~= nil do
											local ff = it:next()
											if not (ff ~= nil) then
												do break end
											end
											if ff:isFile() then
												do _g.jk.lang.Vector:append(rscfiles, ff) end
											end
										end
									end
								end
							end
							do n2 = n2 + 1 end
						end
					end
				end
				if not doLink then
					do _g.jk.log.Log:info(self.ctx, "Already up to date: `" .. _g.jk.lang.String:safeString(code:getPath()) .. "'") end
				else
					local block = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
					local parser = _g.sling.js.parser.JSParser._construct0(_g.sling.js.parser.JSParser._create())
					do parser:setCtx(self.ctx) end
					do
						local fcs = {}
						if srcfiles ~= nil then
							local n3 = 0
							local m3 = _g.jk.lang.Vector:getSize(srcfiles)
							do
								n3 = 0
								while n3 < m3 do
									local file = srcfiles[n3 + 1]
									if file ~= nil then
										do _g.jk.log.Log:status(self.ctx, "[Linking] `" .. _g.jk.lang.String:safeString(file:getPath()) .. "' ..") end
										do
											local ff = parser:parseFile(file)
											if ff ~= nil then
												local array = ff:exportNodes()
												if array ~= nil then
													local n4 = 0
													local m4 = _g.jk.lang.Vector:getSize(array)
													do
														n4 = 0
														while n4 < m4 do
															local node = _vm:to_table_with_key(array[n4 + 1], '_isType.sling.common.NodeObject')
															if node ~= nil then
																if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) then
																	do _g.jk.lang.Vector:append(fcs, node) end
																else
																	do block:addNode(node) end
																end
															end
															do n4 = n4 + 1 end
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
						do
							local cf = _g.sling.common.CodeFileNode._construct0(_g.sling.common.CodeFileNode._create())
							do cf:renameNode(pid) end
							if fcs ~= nil then
								local n5 = 0
								local m5 = _g.jk.lang.Vector:getSize(fcs)
								do
									n5 = 0
									while n5 < m5 do
										local fc = fcs[n5 + 1]
										if fc ~= nil then
											do block:addNode(fc) end
										end
										do n5 = n5 + 1 end
									end
								end
							end
							do
								local fd = _g.sling.model.FunctionDeclarationNode:forName(pid, false)
								do fd:setBody(block, false) end
								do cf:addNode(fd) end
								if generateMainFunctionCall then
									do cf:addNode(_g.sling.model.FunctionCallExpressionNode:forName(pid)) end
								end
								do _g.jk.log.Log:status(self.ctx, "[Writing] `" .. _g.jk.lang.String:safeString(code:getPath()) .. "' ..") end
								do
									local writer = _g.sling.common.StringOutputWriterManager._construct0(_g.sling.common.StringOutputWriterManager._create())
									local generator = _g.sling.js.generator.JSGenerator._construct2(_g.sling.js.generator.JSGenerator._create(), self.ctx, writer)
									do generator:setSupportTypeScript(false) end
									do generator:dumpFile(cf) end
									do
										local data = writer:toString()
										if _g.jk.lang.String:isEmpty(data) then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to generate linked JS output", cf, nil))
										end
										if not code:setContentsUTF8(data) then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to write file: `" .. _g.jk.lang.String:safeString(code:getPath()) .. "'", cf, nil))
										end
										do _g.jk.log.Log:status(self.ctx, nil) end
										do _g.jk.log.Log:info(self.ctx, "Wrote: `" .. _g.jk.lang.String:safeString(code:getPath()) .. "'") end
										if generateIndex then
											local html = output:entry("index.html")
											do _g.jk.log.Log:status(self.ctx, "[Writing] `" .. _g.jk.lang.String:safeString(html:getPath()) .. "' ..") end
											do
												local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
												do sb:appendString("<html>\n") end
												do sb:appendString("\t<head>\n") end
												do sb:appendString("\t\t<meta charset=\"utf-8\" />\n") end
												do sb:appendString("\t\t<meta name=\"viewport\" content=\"initial-scale=1,maximum-scale=1\" />\n") end
												do sb:appendString("\t\t<script src=\"" .. _g.jk.lang.String:safeString(code:getBasename()) .. "\" type=\"application/javascript\"></script>\n") end
												do sb:appendString("\t</head>\n") end
												do sb:appendString("\t<body style=\"margin: 0px;\"") end
												do sb:appendString(" onload=\"" .. _g.jk.lang.String:safeString(pid) .. "()\"") end
												do sb:appendString(">\n") end
												do sb:appendString("\t</body>\n") end
												do sb:appendString("</html>\n") end
												if not html:setContentsString(sb:toString(), "UTF8") then
													_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to write HTML file: `" .. _g.jk.lang.String:safeString(html:getPath()) .. "'", nil, nil))
												end
												do _g.jk.log.Log:info(self.ctx, "Wrote: `" .. _g.jk.lang.String:safeString(html:getPath()) .. "'") end
											end
										end
									end
								end
							end
						end
					end
				end
				if rscfiles ~= nil then
					local n6 = 0
					local m6 = _g.jk.lang.Vector:getSize(rscfiles)
					do
						n6 = 0
						while n6 < m6 do
							local rscfile = rscfiles[n6 + 1]
							if rscfile ~= nil then
								local dest = output:entry(rscfile:getBasename())
								if not rscfile:copyFileTo(dest) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to copy resource file: `" .. _g.jk.lang.String:safeString(rscfile:getPath()) .. "' to `" .. _g.jk.lang.String:safeString(dest:getPath()) .. "'", nil, nil))
								end
							end
							do n6 = n6 + 1 end
						end
					end
				end
			end
		end
	end
end

function sling.web.compiler.SlingToWeb6Compiler:buildToWebApplication(source, output, customName, customVersion, generateIndex, generateMainFunctionCall)
	if not (output ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No output directory given for web application", nil, nil))
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
				local destdir = self:getWorkDirFile(_g.jk.lang.String:safeString(appid) .. "_web6")
				do self:linkModules(sources, destdir, name, generateMainFunctionCall, generateIndex) end
				do
					local outputdir = output
					local outputfile = outputdir:entry(_g.jk.lang.String:safeString(appid) .. "_web6.zip")
					do outputfile:remove() end
					do outputdir:createDirectoryRecursive() end
					if not _g.jk.archive.ZipWriter:writeToZipRecursive(self.ctx, outputfile, destdir, true) then
						do _g.jk.lang.Error:throw("failedToWrite", outputfile:getPath()) end
					end
					do _g.jk.log.Log:info(self.ctx, "App: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(outputfile))) end
				end
			end
		end
	end
end

sling.web.compiler.Web5LibraryManager = _g.sling.compiler.LibraryManager._create()
sling.web.compiler.Web5LibraryManager.__index = sling.web.compiler.Web5LibraryManager
_vm:set_metatable(sling.web.compiler.Web5LibraryManager, {
	__index = _g.sling.compiler.LibraryManager
})

function sling.web.compiler.Web5LibraryManager._create()
	local v = _vm:set_metatable({}, sling.web.compiler.Web5LibraryManager)
	return v
end

function sling.web.compiler.Web5LibraryManager:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.web.compiler.Web5LibraryManager'
	self['_isType.sling.web.compiler.Web5LibraryManager'] = true
end

function sling.web.compiler.Web5LibraryManager:_construct0()
	sling.web.compiler.Web5LibraryManager._init(self)
	do _g.sling.compiler.LibraryManager._construct0(self) end
	return self
end

function sling.web.compiler.Web5LibraryManager:forDefaultDirectory()
	local dd = _g.jk.env.CommonPath:getHomeDirectory()
	if dd ~= nil then
		dd = dd:entry(".sling"):entry("libs")
	end
	do return _g.sling.web.compiler.Web5LibraryManager:forDirectory(dd) end
end

function sling.web.compiler.Web5LibraryManager:forDirectory(dir)
	local v = _g.sling.web.compiler.Web5LibraryManager._construct0(_g.sling.web.compiler.Web5LibraryManager._create())
	do v:setDirectory(dir) end
	do return v end
end

function sling.web.compiler.Web5LibraryManager:getPlatformName()
	do return "web5" end
end

function sling.web.compiler.Web5LibraryManager:getLinkTargetFile(directory, moduleName)
	if not (directory ~= nil) then
		do return nil end
	end
	if not _g.jk.lang.String:isNotEmpty(moduleName) then
		do return nil end
	end
	do return directory:entry(_g.jk.lang.String:safeString(moduleName) .. ".js") end
end

sling.web.compiler.Web6LibraryManager = _g.sling.compiler.LibraryManager._create()
sling.web.compiler.Web6LibraryManager.__index = sling.web.compiler.Web6LibraryManager
_vm:set_metatable(sling.web.compiler.Web6LibraryManager, {
	__index = _g.sling.compiler.LibraryManager
})

function sling.web.compiler.Web6LibraryManager._create()
	local v = _vm:set_metatable({}, sling.web.compiler.Web6LibraryManager)
	return v
end

function sling.web.compiler.Web6LibraryManager:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.web.compiler.Web6LibraryManager'
	self['_isType.sling.web.compiler.Web6LibraryManager'] = true
end

function sling.web.compiler.Web6LibraryManager:_construct0()
	sling.web.compiler.Web6LibraryManager._init(self)
	do _g.sling.compiler.LibraryManager._construct0(self) end
	return self
end

function sling.web.compiler.Web6LibraryManager:forDefaultDirectory()
	local dd = _g.jk.env.CommonPath:getHomeDirectory()
	if dd ~= nil then
		dd = dd:entry(".sling"):entry("libs")
	end
	do return _g.sling.web.compiler.Web6LibraryManager:forDirectory(dd) end
end

function sling.web.compiler.Web6LibraryManager:forDirectory(dir)
	local v = _g.sling.web.compiler.Web6LibraryManager._construct0(_g.sling.web.compiler.Web6LibraryManager._create())
	do v:setDirectory(dir) end
	do return v end
end

function sling.web.compiler.Web6LibraryManager:getPlatformName()
	do return "web6" end
end

function sling.web.compiler.Web6LibraryManager:getLinkTargetFile(directory, moduleName)
	if not (directory ~= nil) then
		do return nil end
	end
	if not _g.jk.lang.String:isNotEmpty(moduleName) then
		do return nil end
	end
	do return directory:entry(_g.jk.lang.String:safeString(moduleName) .. ".js") end
end

sling.web.compiler.SlingToWebOps = {}
sling.web.compiler.SlingToWebOps.__index = sling.web.compiler.SlingToWebOps
_vm:set_metatable(sling.web.compiler.SlingToWebOps, {})

function sling.web.compiler.SlingToWebOps._create()
	local v = _vm:set_metatable({}, sling.web.compiler.SlingToWebOps)
	return v
end

function sling.web.compiler.SlingToWebOps:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.web.compiler.SlingToWebOps'
	self['_isType.sling.web.compiler.SlingToWebOps'] = true
end

function sling.web.compiler.SlingToWebOps:_construct0()
	sling.web.compiler.SlingToWebOps._init(self)
	return self
end

sling.web.compiler.SlingToWebOps.MyFinder = _g.sling.common.NodeVisitor._create()
sling.web.compiler.SlingToWebOps.MyFinder.__index = sling.web.compiler.SlingToWebOps.MyFinder
_vm:set_metatable(sling.web.compiler.SlingToWebOps.MyFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.web.compiler.SlingToWebOps.MyFinder._create()
	local v = _vm:set_metatable({}, sling.web.compiler.SlingToWebOps.MyFinder)
	return v
end

function sling.web.compiler.SlingToWebOps.MyFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.web.compiler.SlingToWebOps.MyFinder'
	self['_isType.sling.web.compiler.SlingToWebOps.MyFinder'] = true
	self.ctors = nil
	self.news = nil
end

function sling.web.compiler.SlingToWebOps.MyFinder:_construct0()
	sling.web.compiler.SlingToWebOps.MyFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	self.ctors = {}
	self.news = {}
	return self
end

function sling.web.compiler.SlingToWebOps.MyFinder:visit(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.ConstructorDeclarationNode') ~= nil) then
		do _g.jk.lang.Vector:append(self.ctors, node) end
		do self:setSkipChildren(true) end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CreateObjectExpressionNode') ~= nil) then
		do _g.jk.lang.Vector:append(self.news, node) end
	end
	do return true end
end

function sling.web.compiler.SlingToWebOps.MyFinder:addToNews(coxp)
	do _g.jk.lang.Vector:append(self.news, coxp) end
end

function sling.web.compiler.SlingToWebOps.MyFinder:getCtors()
	do return self.ctors end
end

function sling.web.compiler.SlingToWebOps.MyFinder:setCtors(v)
	self.ctors = v
	do return self end
end

function sling.web.compiler.SlingToWebOps.MyFinder:getNews()
	do return self.news end
end

function sling.web.compiler.SlingToWebOps.MyFinder:setNews(v)
	self.news = v
	do return self end
end

function sling.web.compiler.SlingToWebOps:convertSlingToHTMLSettings(node)
	local v = _g.sling.js.model.HTMLUnitSettingsNode._construct0(_g.sling.js.model.HTMLUnitSettingsNode._create())
	do _g.sling.compiler.SlingOps:consolidateSlingUnitSettings(node) end
	do
		local ss = _vm:to_table_with_key(node:getSettings(), '_isType.sling.model.ext.NSlingUnitSettings')
		if ss ~= nil then
			local pid = ss:getModuleId()
			if _g.jk.lang.String:isEmpty(pid) then
				pid = ss:getProjectId()
			end
			if _g.jk.lang.String:isEmpty(pid) then
				pid = "UnnamedProject"
			end
			do v:setProjectName(pid) end
			do
				local version = ss:getIosVersion()
				if _g.jk.lang.String:isEmpty(version) then
					version = ss:getProjectVersion()
				end
				do v:setProjectVersion(version) end
				do
					local desc = ss:getIosDisplayName()
					if _g.jk.lang.String:isEmpty(desc) then
						desc = ss:getModuleDescription()
					end
					if _g.jk.lang.String:isEmpty(desc) then
						desc = ss:getProjectDescription()
					end
					do v:setDisplayName(desc) end
				end
			end
		end
		do node:setSettings(v, false) end
	end
end

function sling.web.compiler.SlingToWebOps:isReferenceToCurrentClass(expr)
	if (_vm:to_table_with_key(expr, '_isType.sling.model.CurrentObjectExpressionNode') ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(expr, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
		local ee = _g.sling.util.FindUtil:findNearestEntity(expr)
		local bb = _g.sling.util.SymbolUtil:tryGetSymbolBindingForExpression(expr)
		if ee == bb then
			do return true end
		end
	end
	do return false end
end

function sling.web.compiler.SlingToWebOps:convertVariableDeclarationsToES5Style(node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.VariableDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local vdc = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.VariableDeclarationNode')
				if vdc ~= nil then
					do vdc:addToModifiers(_g.sling.model.CommonModifierNode:forType(_g.sling.js.model.JSModifier.HOIST)) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:convertGetExpressionTypeInfoToMemberAccesses(node, resolver)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.GetExpressionTypeinfoExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local eti = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.GetExpressionTypeinfoExpressionNode')
				if eti ~= nil then
					local ref = _vm:to_table_with_key(_g.sling.util.ExpressionUtil:tryGetExpressionDataType(eti:getExpression(), nil), '_isType.sling.model.ReferenceDataTypeNode')
					if not (ref ~= nil) then
						goto _continue1
					end
					if not (resolver ~= nil) then
						goto _continue1
					end
					do
						local bnd = resolver:getBoundEntity(ref)
						if not (bnd ~= nil) then
							goto _continue1
						end
						do
							local mae = _g.sling.model.MemberAccessExpressionNode:forNodes(eti:getExpression(), _g.sling.model.SymbolExpressionNode:forName("_tobj"))
							do _g.sling.util.NodeUtil:replaceAndExport(eti, mae) end
						end
					end
				end
				::_continue1::
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:convertConstructorsToES5Style(ctx, node, resolver)
	do _g.sling.op.RenamerForReservedWords:execute(ctx, node, {
		"NEW",
		"CTOR"
	}, false) end
	do
		local ff = _g.sling.web.compiler.SlingToWebOps.MyFinder._construct0(_g.sling.web.compiler.SlingToWebOps.MyFinder._create())
		do node:accept(ff) end
		do
			local xc = {}
			local array = ff:getCtors()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local ct = array[n + 1]
						if ct ~= nil then
							local cl = _g.sling.util.FindUtil:findNearestClass(ct)
							if not (cl ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("constructor is not inside a class", ct, nil))
								do return end
							end
							do
								local cd = _vm:to_table_with_key(_g.sling.util.NodeUtil:dupAsNode(ct), '_isType.sling.model.ConstructorDeclarationNode')
								local nn = _g.sling.web.compiler.SlingToWebOps:getCombinedParametersTypeName(cd:getParameters(), resolver)
								local cn = _g.sling.web.compiler.SlingToWebOps:getClassDeclarationQualifiedName(cl)
								local fd = _g.sling.model.FunctionDeclarationNode:forName(_g.sling.web.compiler.SlingToWebOps:getCombinedName({
									"CTOR",
									cn,
									nn
								}), false)
								do _g.sling.util.ModifierUtil:copyModifiers(cd, fd) end
								do fd:setReturnType(_g.sling.model.ReferenceDataTypeNode:forName(cl:getNodeName()), false) end
								do fd:setSource(cd:getSource()) end
								do fd:setParameters(cd:exportParameters(), false) end
								do fd:setBody(cd:exportBody(), false) end
								do
									local array2 = _g.sling.util.FindUtil:findNodesOfType(fd, "class:sling.model.CreateObjectExpressionNode", false, true, false)
									if array2 ~= nil then
										local n2 = 0
										local m2 = _g.jk.lang.Vector:getSize(array2)
										do
											n2 = 0
											while n2 < m2 do
												local cobx = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.CreateObjectExpressionNode')
												if cobx ~= nil then
													do ff:addToNews(cobx) end
												end
												do n2 = n2 + 1 end
											end
										end
									end
									do _g.sling.util.FunctionUtil:addStatement(fd, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create()))) end
									do cl:prependNode(fd) end
									do
										local nx = nil
										if ct:getNext() ~= nil and _g.sling.util.ModifierUtil:hasCommonModifier(cl, _g.sling.model.Modifier.HEADER) == false then
											nx = ct:exportNext()
											do _g.sling.util.FunctionUtil:prependStatement(fd, nx) end
										else
											nx = _g.sling.web.compiler.SlingToWebOps:getBaseConstructorCall(fd)
										end
										if nx ~= nil then
											do _g.jk.lang.Vector:append(xc, nx) end
										end
										do
											local pr = _vm:to_table_with_key(fd:getParent(), '_isType.sling.common.ContainerNode')
											if not (pr ~= nil) then
												_vm:throw_error(_g.sling.common.ReferenceError:forMessage("function declaration has no parent", fd, nil))
												do return end
											end
											do
												local bd = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
												local vd = _g.sling.model.VariableDeclarationNode:instance(_g.sling.util.DataTypeUtil:dupAsDataType(fd:getOwnReturnType()), "v", _g.sling.model.CreateObjectExpressionNode:forType(_g.sling.util.DataTypeUtil:dupAsDataType(fd:getOwnReturnType())))
												do bd:addNode(vd) end
												do
													local mx = _g.sling.model.MemberAccessExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forBinding(vd, nil), _g.sling.model.SymbolExpressionNode:forBinding(fd, nil))
													do mx:setSource(ct:getSource()) end
													do
														local mc = _g.sling.model.FunctionCallExpressionNode:forExpression(mx)
														local array3 = fd:getParameters()
														if array3 ~= nil then
															local n3 = 0
															local m3 = _g.jk.lang.Vector:getSize(array3)
															do
																n3 = 0
																while n3 < m3 do
																	local vv = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.model.VariableDeclarationNode')
																	if vv ~= nil then
																		do mc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(vv, nil)) end
																	end
																	do n3 = n3 + 1 end
																end
															end
														end
														do bd:addNode(_g.sling.model.ReturnStatementNode:forExpression(mc)) end
														do
															local nd = _g.sling.model.FunctionDeclarationNode:forName(_g.sling.web.compiler.SlingToWebOps:getCombinedName({
																"NEW",
																nn
															}), false)
															do _g.sling.util.ModifierUtil:copyModifiers(fd, nd) end
															do nd:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(fd:getOwnReturnType()), false) end
															do nd:addToModifiers(_g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.STATIC)) end
															do nd:addToModifiers(_g.sling.model.AnnotationModifierNode:forText("constructor")) end
															do nd:setBody(bd, false) end
															do
																local tmap = {}
																local array4 = cl:getGenericTypes()
																if array4 ~= nil then
																	local n4 = 0
																	local m4 = _g.jk.lang.Vector:getSize(array4)
																	do
																		n4 = 0
																		while n4 < m4 do
																			local gn = _vm:to_table_with_key(array4[n4 + 1], '_isType.sling.model.TemplateDeclarationNode')
																			if gn ~= nil then
																				local tm = _vm:to_table_with_key(_g.sling.util.NodeUtil:dupAsNode(gn), '_isType.sling.model.TemplateDeclarationNode')
																				if not (tm ~= nil) then
																					goto _continue2
																				end
																				do nd:addToGenericTypes(tm) end
																				do _g.jk.lang.Map:set(tmap, tm:getNodeName(), tm) end
																			end
																			::_continue2::
																			do n4 = n4 + 1 end
																		end
																	end
																end
																do
																	local array5 = fd:getParameters()
																	if array5 ~= nil then
																		local n5 = 0
																		local m5 = _g.jk.lang.Vector:getSize(array5)
																		do
																			n5 = 0
																			while n5 < m5 do
																				local param = _vm:to_table_with_key(array5[n5 + 1], '_isType.sling.common.NodeObject')
																				if param ~= nil then
																					local npram = _g.sling.util.NodeUtil:dupAsNode(param)
																					local array6 = _g.sling.util.NodeFinder:findCompatibleNodes(npram, "class:sling.model.SymbolNode", false, true, false)
																					if array6 ~= nil then
																						local n6 = 0
																						local m6 = _g.jk.lang.Vector:getSize(array6)
																						do
																							n6 = 0
																							while n6 < m6 do
																								local rsymb = _vm:to_table_with_key(array6[n6 + 1], '_isType.sling.model.SymbolNode')
																								if rsymb ~= nil then
																									local rbind = _vm:to_table_with_key(_g.sling.util.SymbolUtil:tryGetSymbolBinding(rsymb), '_isType.sling.model.TemplateDeclarationNode')
																									if rbind ~= nil and _g.jk.lang.Map:containsKey(tmap, rbind:getNodeName()) then
																										do rsymb:setBinding(_g.jk.lang.Map:get(tmap, rbind:getNodeName()), nil) end
																									end
																								end
																								do n6 = n6 + 1 end
																							end
																						end
																					end
																					do nd:addToParameters(npram) end
																				end
																				do n5 = n5 + 1 end
																			end
																		end
																	end
																	do pr:insertAboveNode(nd, fd) end
																end
															end
														end
													end
												end
											end
										end
									end
								end
							end
						end
						do n = n + 1 end
					end
				end
			end
			do
				local array7 = ff:getNews()
				if array7 ~= nil then
					local n7 = 0
					local m7 = _g.jk.lang.Vector:getSize(array7)
					do
						n7 = 0
						while n7 < m7 do
							local co = array7[n7 + 1]
							if co ~= nil then
								local rf = _vm:to_table_with_key(co:getType(), '_isType.sling.model.ReferenceDataTypeNode')
								if not (rf ~= nil) then
									goto _continue3
								end
								do
									local entity = resolver:getBoundEntity(rf)
									if not (entity ~= nil) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to find bound entity", rf, nil))
									end
									do
										local typemap = nil
										local tps = resolver:getTypeParametersForNode(rf)
										if tps ~= nil then
											typemap = resolver:createTypeMapforEntity(_vm:to_table_with_key(entity, '_isType.sling.model.GenericCapableEntityDeclarationNode'), tps)
										end
										do
											local mctor = resolver:getMatchingConstructor(entity, co:getParameters(), typemap)
											if not (mctor ~= nil) then
												_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to find matching constructor", co, nil))
											end
											do
												local nn = _g.sling.web.compiler.SlingToWebOps:getCombinedParametersTypeName(mctor:getParameters(), resolver)
												local se = _g.sling.model.SymbolExpressionNode:forArrayOfNames({
													_g.sling.util.SymbolUtil:getSymbolName(rf:getSymbol()),
													_g.sling.web.compiler.SlingToWebOps:getCombinedName({
														"NEW",
														nn
													})
												})
												do se:setSource(co:getSource()) end
												do
													local fc = _g.sling.model.FunctionCallExpressionNode:forExpression(se)
													do fc:setSource(co:getSource()) end
													do fc:setParameters(co:exportParameters(), false) end
													do _g.sling.util.NodeUtil:replaceNode(co, fc) end
													if resolver ~= nil then
														do resolver:resolveExpression(fc) end
													end
												end
											end
										end
									end
								end
							end
							::_continue3::
							do n7 = n7 + 1 end
						end
					end
				end
				if xc ~= nil then
					local n8 = 0
					local m8 = _g.jk.lang.Vector:getSize(xc)
					do
						n8 = 0
						while n8 < m8 do
							local xx = xc[n8 + 1]
							if xx ~= nil then
								local fx = xx:getExpression()
								if not (fx ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("next constructor call has no expression", xx, nil))
									do return end
								end
								do
									local cl = _g.sling.util.FindUtil:findNearestClass(xx)
									if not (cl ~= nil) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("next constructor is not inside a class", xx, nil))
										do return end
									end
									do
										local fd = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
										local pm = xx:getParameters()
										if _g.jk.lang.Vector:isNotEmpty(pm) then
											local pp = {}
											if pm ~= nil then
												local n9 = 0
												local m9 = _g.jk.lang.Vector:getSize(pm)
												do
													n9 = 0
													while n9 < m9 do
														local ex = _vm:to_table_with_key(pm[n9 + 1], '_isType.sling.model.ExpressionNode')
														if ex ~= nil then
															do _g.jk.lang.Vector:append(pp, _g.sling.model.VariableDeclarationNode:forType(_g.sling.util.ExpressionUtil:tryGetExpressionDataType(ex, nil))) end
														end
														do n9 = n9 + 1 end
													end
												end
											end
											do fd:setParameters(pp, false) end
										end
										do
											local dc = _g.sling.web.compiler.SlingToWebOps:findCtorBaseClassDeclaration(_vm:to_table_with_key(resolver, '_isType.sling.compiler.SlingTypeResolver'), fd, cl, false, nil, true, false, nil)
											if not (dc ~= nil) then
												_vm:throw_error(_g.sling.common.ReferenceError:forMessage("failed to find base constructor declaration", xx, nil))
												do return end
											end
											if _g.sling.util.ModifierUtil:hasCommonModifier(dc, _g.sling.model.Modifier.PRIVATE) then
												do _g.sling.util.NodeUtil:removeNode(xx) end
												goto _continue4
											end
											if _g.sling.web.compiler.SlingToWebOps:isReferenceToCurrentClass(fx) then
												local mx = _g.sling.model.SymbolExpressionNode:forBinding(dc, nil)
												do _g.sling.util.NodeUtil:replaceNode(fx, mx) end
											elseif (_vm:to_table_with_key(fx, '_isType.sling.model.BaseClassAccessExpressionNode') ~= nil) then
												local mx = _g.sling.model.MemberAccessExpressionNode:forNodes(_g.sling.model.BaseClassAccessExpressionNode._construct0(_g.sling.model.BaseClassAccessExpressionNode._create()), _g.sling.model.SymbolExpressionNode:forBinding(dc, nil))
												do _g.sling.util.NodeUtil:replaceNode(fx, mx) end
											else
												_vm:throw_error(_g.sling.common.ReferenceError:forMessage("unknown next constructor call expression", fx, nil))
												do return end
											end
											do
												local ib = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
												do ib:addNode(_g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create()))) end
												do
													local ii = _g.sling.model.IfStatementNode:instance(nil, ib, nil)
													do _g.sling.util.NodeUtil:replaceAndExport(xx, ii) end
													do ii:setCondition(_g.sling.model.EqualsExpressionNode:forNull(xx), false) end
												end
											end
										end
									end
								end
							end
							::_continue4::
							do n8 = n8 + 1 end
						end
					end
				end
				do
					local array8 = ff:getCtors()
					if array8 ~= nil then
						local n10 = 0
						local m10 = _g.jk.lang.Vector:getSize(array8)
						do
							n10 = 0
							while n10 < m10 do
								local ct = array8[n10 + 1]
								if ct ~= nil then
									do _g.sling.util.NodeUtil:removeNode(ct) end
								end
								do n10 = n10 + 1 end
							end
						end
					end
				end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:findCtorBaseClassDeclaration(resolver, fdecl, ee, lookHere, typemap, ignoreType, ignoreParameters, typemapr)
	if not (resolver ~= nil) then
		do return nil end
	end
	if ee == nil or (_vm:to_table_with_key(ee, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) then
		do return nil end
	end
	if lookHere then
		local array = ee:getNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local eef = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionDeclarationNode')
					if eef ~= nil then
						local pcn = _g.sling.web.compiler.SlingToWebOps:getCombinedParametersTypeName(fdecl:getParameters(), _vm:to_table_with_key(resolver, '_isType.sling.util.TypeResolver'))
						local een = _g.sling.web.compiler.SlingToWebOps:getClassDeclarationQualifiedName(ee)
						do fdecl:renameNode(_g.sling.web.compiler.SlingToWebOps:getCombinedName({
							"CTOR",
							een,
							pcn
						})) end
						if _g.sling.compiler.SlingTypeResolver:hasSameSignature(eef, fdecl, typemap, ignoreType, ignoreParameters, false) then
							if typemapr ~= nil then
								do typemapr:clear() end
								if typemap ~= nil then
									do typemap:copyTo(typemapr) end
								end
							end
							do return eef end
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do
		local array2 = ee:getBaseTypes()
		if array2 ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(array2)
			do
				n2 = 0
				while n2 < m2 do
					local btn = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.BaseTypeNode')
					if btn ~= nil then
						local type = btn:getReferenceType()
						if not (type ~= nil) then
							goto _continue5
						end
						do
							local ref = resolver:getBoundEntity(type)
							if not (ref ~= nil) then
								goto _continue5
							end
							if (_vm:to_table_with_key(ref, '_isType.sling.model.MagicalClassDeclarationNode') ~= nil) then
								goto _continue5
							end
							do
								local ntypemap = nil
								local tps = resolver:getTypeParametersForNode(type)
								if tps ~= nil then
									ntypemap = resolver:createTypeMapforEntity(_vm:to_table_with_key(ref, '_isType.sling.model.GenericCapableEntityDeclarationNode'), tps)
								end
								if ref ~= nil then
									local mf = _g.sling.web.compiler.SlingToWebOps:findCtorBaseClassDeclaration(resolver, fdecl, ref, true, ntypemap, ignoreType, ignoreParameters, typemapr)
									if mf ~= nil then
										do return mf end
									end
								end
							end
						end
					end
					::_continue5::
					do n2 = n2 + 1 end
				end
			end
		end
		do return nil end
	end
end

function sling.web.compiler.SlingToWebOps:getCombinedName(names)
	local name = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if names ~= nil then
		local n = 0
		local m = #names
		do
			n = 0
			while n < m do
				local comp = names[n + 1]
				if comp ~= nil then
					if _g.jk.lang.String:isEmpty(comp) then
						goto _continue6
					end
					if name:count() > 0 then
						do name:appendString("_") end
					end
					do name:appendString(comp) end
				end
				::_continue6::
				do n = n + 1 end
			end
		end
	end
	do return name:toString() end
end

function sling.web.compiler.SlingToWebOps:getCombinedParametersTypeName(params, resolver)
	local name = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if params ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(params)
		do
			n = 0
			while n < m do
				local pram = _vm:to_table_with_key(params[n + 1], '_isType.sling.common.NodeObject')
				if pram ~= nil then
					if (_vm:to_table_with_key(pram, '_isType.sling.model.VariableDeclarationNode') ~= nil) or (_vm:to_table_with_key(pram, '_isType.sling.model.ExpressionNode') ~= nil) then
						local type = nil
						if (_vm:to_table_with_key(pram, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
							type = pram:getType()
						elseif (_vm:to_table_with_key(pram, '_isType.sling.model.ExpressionNode') ~= nil) then
							local pexp = pram
							if (_vm:to_table_with_key(pram, '_isType.sling.model.NullLiteralExpressionNode') ~= nil) then
								type = resolver:getExpectedExpressionDataType(pexp)
							else
								type = _g.sling.util.ExpressionUtil:getExpressionDataType(pexp, nil)
							end
						end
						do
							local tstr = _g.sling.web.compiler.SlingToWebOps:getDataTypeName(type)
							if _g.jk.lang.String:isEmpty(tstr) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No data type name found for `" .. _g.jk.lang.String:safeString(type:getNodeTypeName()) .. "'", type, nil))
							end
							do name:appendString(_g.jk.lang.String:capitalize(tstr)) end
						end
					else
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported parameter type in getUniqueCtorAndNewName", pram, nil))
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return name:toString() end
end

function sling.web.compiler.SlingToWebOps:getDataTypeName(type)
	local name = nil
	if (_vm:to_table_with_key(type, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
		local symb = type:getSymbol()
		local bldr = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local array = _g.sling.util.SymbolUtil:getSymbolNames(symb)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local comp = array[n + 1]
					if comp ~= nil then
						do bldr:appendString(comp) end
					end
					do n = n + 1 end
				end
			end
		end
		name = bldr:toString()
	else
		name = _g.sling.util.DataTypeUtil:getDataTypeName(type)
	end
	do return name end
end

function sling.web.compiler.SlingToWebOps:getClassDeclarationQualifiedName(cdec)
	if not (cdec ~= nil) then
		do return nil end
	end
	do
		local name = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local array = _g.sling.util.NodeUtil:getQualifiedNameComponents(cdec, true)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local comp = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(array[n + 1])
					if comp ~= nil then
						do name:appendString(comp) end
					end
					do n = n + 1 end
				end
			end
		end
		do return name:toString() end
	end
end

function sling.web.compiler.SlingToWebOps:getBaseConstructorCall(fdec)
	if not (fdec ~= nil) then
		do return nil end
	end
	do
		local cdec = _vm:to_table_with_key(fdec:getParent(), '_isType.sling.model.ClassDeclarationNode')
		if not (cdec ~= nil) then
			do return nil end
		end
		if _g.sling.util.ModifierUtil:hasCommonModifier(cdec, _g.sling.model.Modifier.HEADER) then
			do return nil end
		end
		do
			local body = fdec:getBody()
			if not (body ~= nil) then
				do return nil end
			end
			do
				local array = body:getNodes()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local call = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionCallExpressionNode')
							if call ~= nil then
								local expr = call:getExpression()
								if expr ~= nil and ((_vm:to_table_with_key(expr, '_isType.sling.model.BaseClassAccessExpressionNode') ~= nil) or _g.sling.web.compiler.SlingToWebOps:isReferenceToCurrentClass(expr)) then
									do return call end
								end
							end
							do n = n + 1 end
						end
					end
				end
				do return nil end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:getBaseTypeName(node, resolver)
	if not (node ~= nil) then
		do return nil end
	end
	if not (resolver ~= nil) then
		do return nil end
	end
	do
		local refc = resolver:getBoundEntity(_vm:to_table_with_key(_g.sling.util.ExpressionUtil:tryGetExpressionDataType(node, nil), '_isType.sling.model.ReferenceDataTypeNode'))
		if not (refc ~= nil) then
			local entt = _g.sling.util.FindUtil:findNearestEntity(node)
			if not (entt ~= nil) then
				do return nil end
			end
			if not ((function()
				refc = resolver:getBaseClass(entt)
				do return refc end
			end)() ~= nil) then
				do return nil end
			end
		end
		do return refc:getNodeName() end
	end
end

function sling.web.compiler.SlingToWebOps:collectBaseTypes(entt, bsts, resolver)
	if not (entt ~= nil) then
		do return end
	end
	if not (bsts ~= nil) then
		do return end
	end
	do
		local array = entt:getBaseTypes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local bstp = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.BaseTypeNode')
					if bstp ~= nil then
						local refn = resolver:getBoundEntity(bstp:getReferenceType())
						do bsts:add(refn:getNodeName()) end
						do _g.sling.web.compiler.SlingToWebOps:collectBaseTypes(refn, bsts, resolver) end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:collectAllBaseTypeInfo(root, resolver)
	local v = {}
	local array = _g.sling.util.FindUtil:findCompatibleNodes(root, "class:sling.model.EntityDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local entt = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
				if entt ~= nil then
					local name = entt:getNodeName()
					if not (name ~= nil) then
						goto _continue7
					end
					do
						local btst = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
						do btst:add(name) end
						do _g.sling.web.compiler.SlingToWebOps:collectBaseTypes(entt, btst, resolver) end
						v[name] = btst
					end
				end
				::_continue7::
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function sling.web.compiler.SlingToWebOps:convertBaseClassFunctionCalls(node, resolver)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.FunctionCallExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local fcxp = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionCallExpressionNode')
				if fcxp ~= nil then
					local mxpr = _vm:to_table_with_key(fcxp:getExpression(), '_isType.sling.model.MemberAccessExpressionNode')
					if not (mxpr ~= nil) then
						goto _continue8
					end
					do
						local prnt = _vm:to_table_with_key(mxpr:getParentExpression(), '_isType.sling.model.BaseClassAccessExpressionNode')
						if not (prnt ~= nil) then
							goto _continue8
						end
						do
							local name = _g.sling.web.compiler.SlingToWebOps:getBaseTypeName(prnt, resolver)
							if _g.jk.lang.String:isEmpty(name) then
								goto _continue8
							end
							do
								local xvec = {}
								do _g.jk.lang.Vector:append(xvec, _g.sling.model.SymbolExpressionNode:forName(name)) end
								do _g.jk.lang.Vector:append(xvec, _g.sling.model.SymbolExpressionNode:forName("prototype")) end
								do _g.jk.lang.Vector:append(xvec, mxpr:exportChildExpression()) end
								do _g.jk.lang.Vector:append(xvec, _g.sling.model.SymbolExpressionNode:forName("call")) end
								do
									local call = _g.sling.model.FunctionCallExpressionNode:forExpression(_g.sling.model.MemberAccessExpressionNode:forExpressions(xvec))
									do call:addToParameters(_g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create())) end
									do
										local array2 = fcxp:exportParameters()
										if array2 ~= nil then
											local n2 = 0
											local m2 = _g.jk.lang.Vector:getSize(array2)
											do
												n2 = 0
												while n2 < m2 do
													local pram = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.ExpressionNode')
													if pram ~= nil then
														do call:addToParameters(pram) end
													end
													do n2 = n2 + 1 end
												end
											end
										end
										do _g.sling.util.NodeUtil:replaceAndExport(fcxp, call) end
									end
								end
							end
						end
					end
				end
				::_continue8::
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:convertTypeCheckExpressions(node, resolver)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.TypeCheckExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local tcxp = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.TypeCheckExpressionNode')
				if tcxp ~= nil then
					local type = _vm:to_table_with_key(tcxp:getType(), '_isType.sling.model.ReferenceDataTypeNode')
					if not (type ~= nil) then
						goto _continue9
					end
					if type:getMagical() then
						goto _continue9
					end
					if not (resolver ~= nil) then
						goto _continue9
					end
					do
						local bind = resolver:getBoundEntity(type)
						if not (bind ~= nil) then
							goto _continue9
						end
						do
							local name = bind:getNodeName()
							local call = _g.sling.model.FunctionCallExpressionNode:forNames({
								name,
								"IS_INSTANCE"
							})
							do call:addToParameters(tcxp:exportExpression()) end
							do
								local comp = _g.sling.model.LogicalAndExpressionNode:instance(_g.sling.model.MemberAccessExpressionNode:forSymbolNames(name, "IS_INSTANCE"), call)
								do _g.sling.util.NodeUtil:replaceAndExport(tcxp, comp) end
							end
						end
					end
				end
				::_continue9::
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:bindFunctionDeclarationExpressions(node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.FunctionDeclarationExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local fexp = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.FunctionDeclarationExpressionNode')
				if fexp ~= nil then
					local expr = nil
					local jsfx = _g.sling.js.model.JavascriptFunctionDeclarationExpressionNode._construct0(_g.sling.js.model.JavascriptFunctionDeclarationExpressionNode._create())
					do jsfx:setDeclaration(fexp:exportDeclaration(), false) end
					do jsfx:setType(fexp:exportType(), false) end
					if _g.sling.util.FindUtil:findNearestEntity(fexp) ~= nil then
						local bind = _g.sling.model.FunctionCallExpressionNode:forMethod(jsfx, "bind", false)
						do bind:addToParameters(_g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create())) end
						expr = bind
					else
						expr = jsfx
					end
					do _g.sling.util.NodeUtil:replaceAndExport(fexp, expr) end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:convertEntityToES5Style(entt, decs, innerEntity, btinfo, resolver)
	local fdecs = {}
	local vdecs = {}
	local stvrs = {}
	local innrs = {}
	local array = entt:exportNodes()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local mmbr = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
				if mmbr ~= nil then
					if (_vm:to_table_with_key(mmbr, '_isType.sling.model.CommentNode') ~= nil) then
						goto _continue10
					end
					if (_vm:to_table_with_key(mmbr, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
						do _g.jk.lang.Vector:append(fdecs, mmbr) end
						goto _continue10
					end
					if (_vm:to_table_with_key(mmbr, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
						do _g.jk.lang.Vector:append(innrs, mmbr) end
						goto _continue10
					end
					if (_vm:to_table_with_key(mmbr, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
						local vdec = mmbr
						if _g.sling.util.ModifierUtil:hasCommonModifier(vdec, _g.sling.model.Modifier.STATIC) then
							do _g.jk.lang.Vector:append(stvrs, vdec) end
						else
							do _g.jk.lang.Vector:append(vdecs, vdec) end
						end
						goto _continue10
					end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported member inside entity declaration for ES5: `" .. _g.jk.lang.String:safeString(mmbr:getNodeTypeName()) .. "'", mmbr, nil))
				end
				::_continue10::
				do n = n + 1 end
			end
		end
	end
	do
		local name = entt:getNodeName()
		local bcls = nil
		local extn = nil
		if resolver ~= nil then
			extn = resolver:getBaseClassType(entt)
		end
		if extn ~= nil then
			bcls = _g.sling.util.SymbolUtil:getSymbolNamesString(extn:getSymbol(), 46)
		end
		if (_vm:to_table_with_key(entt, '_isType.sling.model.ClassDeclarationNode') ~= nil) then
			local fdec = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
			if _g.jk.lang.String:isNotEmpty(bcls) then
				local call = _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.SymbolExpressionNode:forName(bcls), "call", false)
				do call:addToParameters(_g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create())) end
				do _g.sling.util.FunctionUtil:addStatement(fdec, call) end
			end
			if vdecs ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(vdecs)
				do
					n2 = 0
					while n2 < m2 do
						local vdec = vdecs[n2 + 1]
						if vdec ~= nil then
							local init = vdec:getInitializer()
							if not (init ~= nil) then
								init = _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create())
							end
							do _g.sling.util.FunctionUtil:addStatement(fdec, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forNodes(_g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create()), _g.sling.model.SymbolExpressionNode:forName(vdec:getNodeName())), init)) end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			if innerEntity then
				do _g.jk.lang.Vector:append(decs, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forName(name), _g.sling.js.model.JavascriptFunctionDeclarationExpressionNode:forDeclaration(fdec))) end
			else
				do _g.jk.lang.Vector:append(decs, _g.sling.model.VariableDeclarationNode:forAutomatic(name, _g.sling.js.model.JavascriptFunctionDeclarationExpressionNode:forDeclaration(fdec))) end
			end
			if _g.jk.lang.String:isNotEmpty(bcls) then
				do _g.jk.lang.Vector:append(decs, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forSymbolNames(name, "prototype"), _g.sling.model.EmbedBlockNode:instance("js", "(function(o) { function F() {}; F.prototype = o; return(new F()); }) (" .. _g.jk.lang.String:safeString(bcls) .. ".prototype)"))) end
				do _g.jk.lang.Vector:append(decs, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forSymbols({
					name,
					"prototype",
					"constructor"
				}), _g.sling.model.SymbolExpressionNode:forName(name))) end
			end
			do
				local btst = btinfo[name]
				if not (btst ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No base class info found for entity `" .. _g.jk.lang.String:safeString(name) .. "'", entt, nil))
				end
				do
					local tpmp = _g.sling.js.model.ObjectLiteralExpressionNode._construct0(_g.sling.js.model.ObjectLiteralExpressionNode._create())
					local array2 = btst:getAll()
					if array2 ~= nil then
						local n3 = 0
						local m3 = _g.jk.lang.Vector:getSize(array2)
						do
							n3 = 0
							while n3 < m3 do
								local type = array2[n3 + 1]
								if type ~= nil then
									do tpmp:addToValues(_g.sling.model.KeyValueNode:forValues(_g.sling.model.StringLiteralExpressionNode:forValue(type), _g.sling.model.BooleanLiteralExpressionNode:forValue(true))) end
								end
								do n3 = n3 + 1 end
							end
						end
					end
					do _g.jk.lang.Vector:append(decs, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forSymbols({
						name,
						"prototype",
						"_t"
					}), tpmp)) end
					do _g.jk.lang.Vector:append(decs, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forSymbols({
						name,
						"prototype",
						"_tobj"
					}), _g.sling.model.SymbolExpressionNode:forName(name))) end
					if fdecs ~= nil then
						local n4 = 0
						local m4 = _g.jk.lang.Vector:getSize(fdecs)
						do
							n4 = 0
							while n4 < m4 do
								local decl = fdecs[n4 + 1]
								if decl ~= nil then
									local lval = nil
									if _g.sling.util.ModifierUtil:hasCommonModifier(decl, _g.sling.model.Modifier.STATIC) then
										lval = _g.sling.model.MemberAccessExpressionNode:forSymbolNames(name, decl:getNodeName())
									else
										lval = _g.sling.model.MemberAccessExpressionNode:forSymbols({
											name,
											"prototype",
											decl:getNodeName()
										})
									end
									do _g.jk.lang.Vector:append(decs, _g.sling.model.AssignmentExpressionNode:forNodes(lval, _g.sling.js.model.JavascriptFunctionDeclarationExpressionNode:forDeclaration(decl))) end
									if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "main") then
										do _g.jk.lang.Vector:append(decs, _g.sling.model.FunctionCallExpressionNode:forExpression(_g.sling.util.ExpressionUtil:dupAsExpression(lval))) end
									end
								end
								do n4 = n4 + 1 end
							end
						end
					end
				end
			end
		elseif (_vm:to_table_with_key(entt, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) then
			if innerEntity then
				do _g.jk.lang.Vector:append(decs, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forName(name), _g.sling.js.model.ObjectLiteralExpressionNode._construct0(_g.sling.js.model.ObjectLiteralExpressionNode._create()))) end
			else
				do _g.jk.lang.Vector:append(decs, _g.sling.model.VariableDeclarationNode:forAutomatic(name, _g.sling.js.model.ObjectLiteralExpressionNode._construct0(_g.sling.js.model.ObjectLiteralExpressionNode._create()))) end
			end
		else
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported entity declaration for ES5: `" .. _g.jk.lang.String:safeString(entt:getNodeTypeName()) .. "'", entt, nil))
		end
		do
			local tcfd = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
			do tcfd:addToModifiers(_g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PUBLIC)) end
			do tcfd:addToParameters(_g.sling.model.VariableDeclarationNode:forAutomatic("o", nil)) end
			do _g.sling.util.FunctionUtil:addStatement(tcfd, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.EmbedBlockNode:instance("js", "o != null && o._t != null && o._t[\"" .. _g.jk.lang.String:safeString(name) .. "\"] === true"))) end
			do _g.jk.lang.Vector:append(decs, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forArrayOfNames({
				name,
				"IS_INSTANCE"
			}), _g.sling.js.model.JavascriptFunctionDeclarationExpressionNode:forDeclaration(tcfd))) end
			if stvrs ~= nil then
				local n5 = 0
				local m5 = _g.jk.lang.Vector:getSize(stvrs)
				do
					n5 = 0
					while n5 < m5 do
						local stvr = stvrs[n5 + 1]
						if stvr ~= nil then
							local init = stvr:getInitializer()
							if not (init ~= nil) then
								init = _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create())
							end
							do _g.jk.lang.Vector:append(decs, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forSymbolNames(name, stvr:getNodeName()), init)) end
						end
						do n5 = n5 + 1 end
					end
				end
			end
			if innrs ~= nil then
				local n6 = 0
				local m6 = _g.jk.lang.Vector:getSize(innrs)
				do
					n6 = 0
					while n6 < m6 do
						local innr = innrs[n6 + 1]
						if innr ~= nil then
							do _g.sling.web.compiler.SlingToWebOps:convertEntityToES5Style(innr, decs, true, btinfo, resolver) end
						end
						do n6 = n6 + 1 end
					end
				end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:convertEntitiesToES5Style(node, btinfo, resolver)
	local decs = {}
	local array = _g.sling.util.FindUtil:findCompatibleNodesForTypes(node, {
		"class:sling.common.CodeUnitSettingsNode",
		"class:sling.model.ResourceFileNode"
	}, false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local othr = array[n + 1]
				if othr ~= nil then
					do _g.sling.util.NodeUtil:exportNode(othr) end
					do _g.jk.lang.Vector:append(decs, othr) end
				end
				do n = n + 1 end
			end
		end
	end
	do
		local array2 = _g.sling.util.FindUtil:findCompatibleNodes(node, "class:sling.model.EntityDeclarationNode", false, true, false)
		if array2 ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(array2)
			do
				n2 = 0
				while n2 < m2 do
					local entt = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.EntityDeclarationNode')
					if entt ~= nil then
						if (_vm:to_table_with_key(entt:getParent(), '_isType.sling.model.NamespaceNode') ~= nil) == false then
							goto _continue11
						end
						if _g.sling.util.ModifierUtil:hasCommonModifier(entt, _g.sling.model.Modifier.HEADER) then
							goto _continue11
						end
						do _g.sling.web.compiler.SlingToWebOps:convertEntityToES5Style(entt, decs, false, btinfo, resolver) end
						do _g.sling.util.NodeUtil:removeNode(entt) end
					end
					::_continue11::
					do n2 = n2 + 1 end
				end
			end
		end
		do
			local root = _g.sling.util.FindUtil:findRootNamespace(node)
			if not (root ~= nil) then
				do return end
			end
			do root:exportNodes() end
			if decs ~= nil then
				local n3 = 0
				local m3 = _g.jk.lang.Vector:getSize(decs)
				do
					n3 = 0
					while n3 < m3 do
						local decl = decs[n3 + 1]
						if decl ~= nil then
							do root:addNode(decl) end
						end
						do n3 = n3 + 1 end
					end
				end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:convertEntityToES6Style(entt, decs, innerEntity, btinfo, resolver)
	local fdecs = {}
	local vdecs = {}
	local stvrs = {}
	local innrs = {}
	local exports = {}
	local array = entt:getNodes()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local mmbr = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
				if mmbr ~= nil then
					if (_vm:to_table_with_key(mmbr, '_isType.sling.model.CommentNode') ~= nil) then
						goto _continue12
					end
					if (_vm:to_table_with_key(mmbr, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
						if _g.sling.util.ModifierUtil:hasCommonModifier(mmbr, _g.sling.model.Modifier.STATIC) then
							do _g.jk.lang.Vector:append(exports, mmbr) end
							do _g.jk.lang.Vector:append(fdecs, mmbr) end
						end
						goto _continue12
					end
					if (_vm:to_table_with_key(mmbr, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
						do _g.jk.lang.Vector:append(exports, mmbr) end
						do _g.jk.lang.Vector:append(innrs, mmbr) end
						goto _continue12
					end
					if (_vm:to_table_with_key(mmbr, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
						do _g.jk.lang.Vector:append(exports, mmbr) end
						do
							local vdec = mmbr
							if _g.sling.util.ModifierUtil:hasCommonModifier(vdec, _g.sling.model.Modifier.STATIC) then
								do _g.jk.lang.Vector:append(stvrs, vdec) end
							else
								do _g.jk.lang.Vector:append(vdecs, vdec) end
							end
							goto _continue12
						end
					end
					if (_vm:to_table_with_key(mmbr, '_isType.sling.model.EmbedBlockNode') ~= nil) then
						goto _continue12
					end
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported member inside entity declaration for ES6: `" .. _g.jk.lang.String:safeString(mmbr:getNodeTypeName()) .. "'", mmbr, nil))
				end
				::_continue12::
				do n = n + 1 end
			end
		end
	end
	if exports ~= nil then
		local n2 = 0
		local m2 = _g.jk.lang.Vector:getSize(exports)
		do
			n2 = 0
			while n2 < m2 do
				local export = exports[n2 + 1]
				if export ~= nil then
					do _g.sling.util.NodeUtil:exportNode(export) end
				end
				do n2 = n2 + 1 end
			end
		end
	end
	do
		local name = entt:getNodeName()
		local extn = nil
		if resolver ~= nil then
			extn = resolver:getBaseClassType(entt)
		end
		if (_vm:to_table_with_key(entt, '_isType.sling.model.ClassDeclarationNode') ~= nil) then
			local ctordec = _g.sling.model.ConstructorDeclarationNode._construct0(_g.sling.model.ConstructorDeclarationNode._create())
			do entt:prependNode(ctordec) end
			if extn ~= nil then
				do _g.sling.util.FunctionUtil:addStatement(ctordec, _g.sling.model.FunctionCallExpressionNode:forExpression(_g.sling.model.BaseClassAccessExpressionNode._construct0(_g.sling.model.BaseClassAccessExpressionNode._create()))) end
			end
			do
				local removebts = {}
				local array2 = entt:getBaseTypes()
				if array2 ~= nil then
					local n3 = 0
					local m3 = _g.jk.lang.Vector:getSize(array2)
					do
						n3 = 0
						while n3 < m3 do
							local bt = _vm:to_table_with_key(array2[n3 + 1], '_isType.sling.model.BaseTypeNode')
							if bt ~= nil then
								if bt:getInheritType() ~= _g.sling.model.BaseTypeNode.INHERIT_EXTEND then
									do _g.jk.lang.Vector:append(removebts, bt) end
								end
							end
							do n3 = n3 + 1 end
						end
					end
				end
				if removebts ~= nil then
					local n4 = 0
					local m4 = _g.jk.lang.Vector:getSize(removebts)
					do
						n4 = 0
						while n4 < m4 do
							local removebt = removebts[n4 + 1]
							if removebt ~= nil then
								do _g.sling.util.NodeUtil:removeNode(removebt) end
							end
							do n4 = n4 + 1 end
						end
					end
				end
				if vdecs ~= nil then
					local n5 = 0
					local m5 = _g.jk.lang.Vector:getSize(vdecs)
					do
						n5 = 0
						while n5 < m5 do
							local vdec = vdecs[n5 + 1]
							if vdec ~= nil then
								local init = vdec:getInitializer()
								if not (init ~= nil) then
									init = _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create())
								end
								do _g.sling.util.FunctionUtil:addStatement(ctordec, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forNodes(_g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create()), _g.sling.model.SymbolExpressionNode:forName(vdec:getNodeName())), init)) end
							end
							do n5 = n5 + 1 end
						end
					end
				end
				do
					local array3 = entt:getNodes()
					if array3 ~= nil then
						local n6 = 0
						local m6 = _g.jk.lang.Vector:getSize(array3)
						do
							n6 = 0
							while n6 < m6 do
								local fdecl = _vm:to_table_with_key(array3[n6 + 1], '_isType.sling.model.FunctionDeclarationNode')
								if fdecl ~= nil then
									if _g.sling.util.ModifierUtil:hasAnnotationModifier(fdecl, "jsctor") and fdecl:getParameterCount() == 0 then
										do _g.sling.util.FunctionUtil:addStatement(ctordec, _g.sling.model.FunctionCallExpressionNode:forMethod(_g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create()), fdecl:getName(), false)) end
									end
								end
								do n6 = n6 + 1 end
							end
						end
					end
					do _g.jk.lang.Vector:append(decs, entt) end
					do
						local btst = btinfo[name]
						if not (btst ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No base class info found for entity `" .. _g.jk.lang.String:safeString(name) .. "'", entt, nil))
						end
						do
							local tpmp = _g.sling.js.model.ObjectLiteralExpressionNode._construct0(_g.sling.js.model.ObjectLiteralExpressionNode._create())
							local array4 = btst:getAll()
							if array4 ~= nil then
								local n7 = 0
								local m7 = _g.jk.lang.Vector:getSize(array4)
								do
									n7 = 0
									while n7 < m7 do
										local type = array4[n7 + 1]
										if type ~= nil then
											do tpmp:addToValues(_g.sling.model.KeyValueNode:forValues(_g.sling.model.StringLiteralExpressionNode:forValue(type), _g.sling.model.BooleanLiteralExpressionNode:forValue(true))) end
										end
										do n7 = n7 + 1 end
									end
								end
							end
							do _g.sling.util.FunctionUtil:addStatement(ctordec, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forNodes(_g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create()), _g.sling.model.SymbolExpressionNode:forName("_t")), tpmp)) end
							do _g.sling.util.FunctionUtil:addStatement(ctordec, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forNodes(_g.sling.model.CurrentObjectExpressionNode._construct0(_g.sling.model.CurrentObjectExpressionNode._create()), _g.sling.model.SymbolExpressionNode:forName("_tobj")), _g.sling.model.SymbolExpressionNode:forName(name))) end
							if fdecs ~= nil then
								local n8 = 0
								local m8 = _g.jk.lang.Vector:getSize(fdecs)
								do
									n8 = 0
									while n8 < m8 do
										local decl = fdecs[n8 + 1]
										if decl ~= nil then
											local lval = _g.sling.model.MemberAccessExpressionNode:forSymbolNames(name, decl:getNodeName())
											do _g.jk.lang.Vector:append(decs, _g.sling.model.AssignmentExpressionNode:forNodes(lval, _g.sling.js.model.JavascriptFunctionDeclarationExpressionNode:forDeclaration(decl))) end
											if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "main") then
												do _g.jk.lang.Vector:append(decs, _g.sling.model.FunctionCallExpressionNode:forExpression(_g.sling.util.ExpressionUtil:dupAsExpression(lval))) end
											end
										end
										do n8 = n8 + 1 end
									end
								end
							end
						end
					end
				end
			end
		elseif (_vm:to_table_with_key(entt, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) then
			do _g.jk.lang.Vector:append(decs, _g.sling.model.VariableDeclarationNode:forAutomatic(name, _g.sling.js.model.ObjectLiteralExpressionNode._construct0(_g.sling.js.model.ObjectLiteralExpressionNode._create()))) end
		else
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported entity declaration for ES6: `" .. _g.jk.lang.String:safeString(entt:getNodeTypeName()) .. "'", entt, nil))
		end
		do
			local tcfd = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
			do tcfd:addToModifiers(_g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PUBLIC)) end
			do tcfd:addToParameters(_g.sling.model.VariableDeclarationNode:forAutomatic("o", nil)) end
			do _g.sling.util.FunctionUtil:addStatement(tcfd, _g.sling.model.ReturnStatementNode:forExpression(_g.sling.model.EmbedBlockNode:instance("js", "o != null && o._t != null && o._t[\"" .. _g.jk.lang.String:safeString(name) .. "\"] === true"))) end
			do _g.jk.lang.Vector:append(decs, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forArrayOfNames({
				name,
				"IS_INSTANCE"
			}), _g.sling.js.model.JavascriptFunctionDeclarationExpressionNode:forDeclaration(tcfd))) end
			if stvrs ~= nil then
				local n9 = 0
				local m9 = _g.jk.lang.Vector:getSize(stvrs)
				do
					n9 = 0
					while n9 < m9 do
						local stvr = stvrs[n9 + 1]
						if stvr ~= nil then
							local init = stvr:getInitializer()
							if not (init ~= nil) then
								init = _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create())
							end
							do _g.jk.lang.Vector:append(decs, _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.MemberAccessExpressionNode:forSymbolNames(name, stvr:getNodeName()), init)) end
						end
						do n9 = n9 + 1 end
					end
				end
			end
			if innrs ~= nil then
				local n10 = 0
				local m10 = _g.jk.lang.Vector:getSize(innrs)
				do
					n10 = 0
					while n10 < m10 do
						local innr = innrs[n10 + 1]
						if innr ~= nil then
							do _g.sling.web.compiler.SlingToWebOps:convertEntityToES6Style(innr, decs, true, btinfo, resolver) end
						end
						do n10 = n10 + 1 end
					end
				end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:convertEntitiesToES6Style(ctx, node, btinfo, resolver)
	local root = _g.sling.util.FindUtil:findRootNamespace(node)
	if not (root ~= nil) then
		do return end
	end
	do
		local decs = {}
		local array = _g.sling.util.FindUtil:findCompatibleNodes(root, "class:sling.model.NamespaceNode", false, true, false)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local ns = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.NamespaceNode')
					if ns ~= nil then
						local exports = {}
						local array2 = ns:getNodes()
						if array2 ~= nil then
							local n2 = 0
							local m2 = _g.jk.lang.Vector:getSize(array2)
							do
								n2 = 0
								while n2 < m2 do
									local nn = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
									if nn ~= nil then
										if (_vm:to_table_with_key(nn, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
											local entt = nn
											do _g.jk.lang.Vector:append(exports, entt) end
											if _g.sling.util.ModifierUtil:hasCommonModifier(entt, _g.sling.model.Modifier.HEADER) then
												goto _continue13
											end
											do _g.sling.web.compiler.SlingToWebOps:convertEntityToES6Style(entt, decs, false, btinfo, resolver) end
										elseif (_vm:to_table_with_key(nn, '_isType.sling.model.ResourceFileNode') ~= nil) then
											do _g.jk.lang.Vector:append(exports, nn) end
											do _g.jk.lang.Vector:append(decs, nn) end
										elseif (_vm:to_table_with_key(nn, '_isType.sling.model.NamespaceNode') ~= nil) then
										elseif (_vm:to_table_with_key(nn, '_isType.sling.model.ext.NSlingUnitSettings') ~= nil) then
											do _g.jk.lang.Vector:append(exports, nn) end
											do _g.jk.lang.Vector:append(decs, nn) end
										else
											do _g.sling.common.RefLog:warning(ctx, "Unsupported node in ES6 namespace: `" .. _g.jk.lang.String:safeString(nn:getNodeTypeName()) .. "'", nn) end
										end
									end
									::_continue13::
									do n2 = n2 + 1 end
								end
							end
						end
						if exports ~= nil then
							local n3 = 0
							local m3 = _g.jk.lang.Vector:getSize(exports)
							do
								n3 = 0
								while n3 < m3 do
									local export = exports[n3 + 1]
									if export ~= nil then
										do _g.sling.util.NodeUtil:exportNode(export) end
									end
									do n3 = n3 + 1 end
								end
							end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do root:clearNodes() end
		if decs ~= nil then
			local n4 = 0
			local m4 = _g.jk.lang.Vector:getSize(decs)
			do
				n4 = 0
				while n4 < m4 do
					local decl = decs[n4 + 1]
					if decl ~= nil then
						do root:addNode(decl) end
					end
					do n4 = n4 + 1 end
				end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:convertCharactersInComparisonAndArithmeticToStaticCast(node)
	local array = _g.sling.util.FindUtil:findNodesOfTypes(node, {
		"class:sling.model.ComparisonExpressionNode",
		"class:sling.model.ArithmeticExpressionNode"
	}, false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local bi = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.BinaryExpressionNode')
				if bi ~= nil then
					local lv = bi:getLeft()
					if not (lv ~= nil) then
						goto _continue14
					end
					do
						local rv = bi:getRight()
						if not (rv ~= nil) then
							goto _continue14
						end
						do
							local lt = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(lv, nil)
							local rt = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(rv, nil)
							local tt = nil
							local ex = nil
							if (_vm:to_table_with_key(lt, '_isType.sling.model.CharacterDataTypeNode') ~= nil) and _g.sling.web.compiler.SlingToWebOps:isNumberType(rt) then
								ex = lv
								tt = _g.sling.util.DataTypeUtil:dupAsDataType(rt)
							elseif (_vm:to_table_with_key(rt, '_isType.sling.model.CharacterDataTypeNode') ~= nil) and _g.sling.web.compiler.SlingToWebOps:isNumberType(lt) then
								ex = rv
								tt = _g.sling.util.DataTypeUtil:dupAsDataType(lt)
							else
								goto _continue14
							end
							do
								local v = _g.sling.model.StaticCastExpressionNode._construct0(_g.sling.model.StaticCastExpressionNode._create())
								do _g.sling.util.NodeUtil:replaceAndExport(ex, v) end
								do v:setType(tt, false) end
								do v:setExpression(ex, false) end
							end
						end
					end
				end
				::_continue14::
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:flattenDynamicCastsWithDynamicType(node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.DynamicCastExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local dcst = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.DynamicCastExpressionNode')
				if dcst ~= nil then
					local type = _vm:to_table_with_key(dcst:getType(), '_isType.sling.model.DynamicDataTypeNode')
					if not (type ~= nil) then
						goto _continue15
					end
					do _g.sling.util.NodeUtil:replaceAndExport(dcst, dcst:getExpression()) end
				end
				::_continue15::
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:removeStaticCastExpressions(node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.StaticCastExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local sc = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.StaticCastExpressionNode')
				if sc ~= nil then
					local xpr = sc:exportExpression()
					if not (xpr ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No expression", sc, nil))
					end
					do
						local type = sc:getType()
						if (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
							local newnode = _g.sling.model.BitwiseNotExpressionNode:forExpression(_g.sling.model.BitwiseNotExpressionNode:forExpression(xpr))
							do _g.sling.util.NodeUtil:replaceNode(sc, newnode) end
						else
							do _g.sling.util.NodeUtil:replaceNode(sc, xpr) end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:convertGetSizeExpressions(node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.GetSizeExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local gsx = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.GetSizeExpressionNode')
				if gsx ~= nil then
					local xx = gsx:exportExpression()
					if not (xx ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No expression", gsx, nil))
					end
					do
						local dt = _g.sling.util.ExpressionUtil:getExpressionDataType(xx, nil)
						if (_vm:to_table_with_key(dt, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) or (_vm:to_table_with_key(dt, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
							local max = _g.sling.model.MemberAccessExpressionNode:forNodes(xx, _g.sling.model.SymbolExpressionNode:forName("length"))
							do _g.sling.util.NodeUtil:replaceNode(gsx, max) end
						elseif (_vm:to_table_with_key(dt, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
							local max = _g.sling.model.MemberAccessExpressionNode:forNodes(xx, _g.sling.model.SymbolExpressionNode:forName("byteLength"))
							do _g.sling.util.NodeUtil:replaceNode(gsx, max) end
						elseif (_vm:to_table_with_key(dt, '_isType.sling.model.MapDataTypeNode') ~= nil) then
							local nodes = {}
							do _g.jk.lang.Vector:append(nodes, xx) end
							do _g.jk.lang.Vector:append(nodes, _g.sling.model.SymbolExpressionNode:forName("prototype")) end
							do _g.jk.lang.Vector:append(nodes, _g.sling.model.SymbolExpressionNode:forName("size")) end
							do
								local max = _g.sling.model.MemberAccessExpressionNode:forExpressions(nodes)
								do _g.sling.util.NodeUtil:replaceNode(gsx, max) end
							end
						else
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported data type in get size expression: `" .. _g.jk.lang.String:safeString(dt:getNodeTypeName()) .. "'", xx, nil))
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:convertPrimitiveStatiCastsToFunctionCalls(node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.StaticCastExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local scst = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.StaticCastExpressionNode')
				if scst ~= nil then
					local type = scst:getType()
					local expr = scst:getExpression()
					local xpdt = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(expr, nil)
					if not (xpdt ~= nil) then
						goto _continue16
					end
					do
						local rplc = nil
						if (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and ((_vm:to_table_with_key(xpdt, '_isType.sling.model.DoubleDataTypeNode') ~= nil) or (_vm:to_table_with_key(xpdt, '_isType.sling.model.FloatDataTypeNode') ~= nil)) then
							rplc = _g.sling.model.BitwiseNotExpressionNode:forExpression(_g.sling.model.BitwiseNotExpressionNode:forExpression(scst:exportExpression()))
						end
						if not (rplc ~= nil) then
							goto _continue16
						end
						do _g.sling.util.NodeUtil:replaceAndExport(scst, rplc) end
					end
				end
				::_continue16::
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:isNumberType(type)
	if not (type ~= nil) then
		do return false end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(type, '_isType.sling.model.FloatDataTypeNode') ~= nil) then
		do return true end
	end
	do return false end
end

function sling.web.compiler.SlingToWebOps:renameEntitiesAndSymbol(ctx, node)
	local root = _vm:to_table_with_key(node, '_isType.sling.common.ContainerNode')
	if not (root ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Root node is not a container", node, nil))
		do return end
	end
	do
		local array = _g.sling.util.FindUtil:findCompatibleNodes(node, "class:sling.model.EntityDeclarationNode", true, true, false)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local entt = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.EntityDeclarationNode')
					if entt ~= nil then
						if (_vm:to_table_with_key(entt, '_isType.sling.model.TemplateDeclarationNode') ~= nil) then
							goto _continue17
						end
						do
							local name = _g.sling.web.compiler.SlingToWebOps:getQualifiedName(entt)
							if _g.jk.lang.String:isNotEmpty(name) then
								do entt:renameNode(name) end
							end
							do
								local pp = _vm:to_table_with_key(entt:getParent(), '_isType.sling.common.ContainerNode')
								if pp ~= root then
									do _g.sling.util.NodeUtil:exportNode(entt) end
									do root:addNode(entt) end
								end
							end
						end
					end
					::_continue17::
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:getQualifiedName(node)
	if not (node ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local pp = _vm:to_table_with_key(node, '_isType.sling.common.NodeObject')
		while pp ~= nil do
			if (_vm:to_table_with_key(pp, '_isType.sling.common.NamedNode') ~= nil) then
				do sb:insertString(0, _g.jk.lang.String:capitalize(pp:getNodeName())) end
			end
			pp = pp:getParent()
		end
		do return sb:toString() end
	end
end

function sling.web.compiler.SlingToWebOps:renameNodesWithReservedWords(ctx, node)
	local words = {
		"abstract",
		"arguments",
		"boolean",
		"break",
		"byte",
		"case",
		"catch",
		"char",
		"class",
		"const",
		"continue",
		"debugger",
		"default",
		"delete",
		"do",
		"double",
		"else",
		"enum",
		"eval",
		"export",
		"extends",
		"false",
		"final",
		"finally",
		"float",
		"for",
		"goto",
		"if",
		"implements",
		"import",
		"in",
		"instanceof",
		"int",
		"interface",
		"let",
		"long",
		"native",
		"new",
		"null",
		"function",
		"package",
		"private",
		"protected",
		"public",
		"return",
		"short",
		"static",
		"super",
		"switch",
		"synchronized",
		"this",
		"throw",
		"throws",
		"transient",
		"true",
		"try",
		"typeof",
		"var",
		"void",
		"volatile",
		"while",
		"with",
		"yield",
		"eval",
		"length",
		"NaN",
		"prototype",
		"undefined"
	}
	do _g.sling.op.RenamerForReservedWords:execute(ctx, node, words, ctx:isInDebugMode()) end
end

function sling.web.compiler.SlingToWebOps:transformMapLiterals(node, resolver)
	local array = _g.sling.util.FindUtil:findCompatibleNodes(node, "class:sling.model.MapLiteralExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local maplit = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.MapLiteralExpressionNode')
				if maplit ~= nil then
					local values = maplit:exportValues()
					local objlit = _g.sling.js.model.ObjectLiteralExpressionNode._construct0(_g.sling.js.model.ObjectLiteralExpressionNode._create())
					do objlit:setValues(values, false) end
					do
						local fc = _g.sling.model.FunctionCallExpressionNode:forNames({
							"jk",
							"lang",
							"Map",
							"asMap"
						})
						do fc:addToParameters(objlit) end
						do _g.sling.util.NodeUtil:replaceNode(maplit, fc) end
						if resolver ~= nil then
							do resolver:resolveExpression(fc) end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:convertMapSubscriptsToFunctionCalls(node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.SubscriptExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local ssxp = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.SubscriptExpressionNode')
				if ssxp ~= nil then
					local chld = ssxp:getChild()
					local type = _g.sling.util.ExpressionUtil:getExpressionDataType(chld, nil)
					if (_vm:to_table_with_key(type, '_isType.sling.model.MapDataTypeNode') ~= nil) then
						local rval = nil
						local call = nil
						local rplc = nil
						local prnt = _vm:to_table_with_key(ssxp:getParent(), '_isType.sling.model.AssignmentExpressionNode')
						if prnt ~= nil and prnt:getLeft() == ssxp then
							call = _g.sling.model.FunctionCallExpressionNode:forExpression(_g.sling.model.MemberAccessExpressionNode:forNodes(ssxp:exportChild(), _g.sling.model.SymbolExpressionNode:forName("set")))
							rval = prnt:exportRight()
							rplc = prnt
						else
							call = _g.sling.model.FunctionCallExpressionNode:forExpression(_g.sling.model.MemberAccessExpressionNode:forNodes(ssxp:exportChild(), _g.sling.model.SymbolExpressionNode:forName("get")))
							rplc = ssxp
						end
						do
							local subx = ssxp:getSubscript()
							do _g.sling.util.NodeUtil:exportNode(subx) end
							do call:addToParameters(subx) end
							if rval ~= nil then
								do call:addToParameters(rval) end
							end
							do _g.sling.util.NodeUtil:replaceAndExport(rplc, call) end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:convertMainFunctionsToRegularFunctions(ctx, root)
	local array = _g.sling.util.FindUtil:findCompatibleNodes(root, "class:sling.model.MainFunctionDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local mainf = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.MainFunctionDeclarationNode')
				if mainf ~= nil then
					local name = mainf:getArgumentArrayName()
					if _g.jk.lang.String:isEmpty(name) then
						name = "args"
					end
					do
						local fd = _g.sling.model.FunctionDeclarationNode:forName("_main", false)
						do fd:addToModifiers(_g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.PUBLIC)) end
						do fd:addToModifiers(_g.sling.model.CommonModifierNode:forType(_g.sling.model.Modifier.STATIC)) end
						do fd:addToModifiers(_g.sling.model.AnnotationModifierNode:forText("main")) end
						do
							local adt = _g.sling.model.StaticArrayDataTypeNode:forPrimaryType(_g.sling.model.StringDataTypeNode._construct0(_g.sling.model.StringDataTypeNode._create()), nil)
							do fd:addToParameters(_g.sling.model.VariableDeclarationNode:instance(adt, name, nil)) end
							do fd:setReturnType(_g.sling.model.IntegerDataTypeNode._construct0(_g.sling.model.IntegerDataTypeNode._create()), false) end
							do fd:setBody(mainf:exportBody(), false) end
							do _g.sling.util.NodeUtil:replaceNode(mainf, fd) end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:moveClassVariableDefaultValuesToConstructors(node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.ClassDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local cl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ClassDeclarationNode')
				if cl ~= nil then
					local cts = nil
					local array2 = cl:getNodes()
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local ct = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.ConstructorDeclarationNode')
								if ct ~= nil then
									if not (cts ~= nil) then
										cts = {}
									end
									do _g.jk.lang.Vector:append(cts, ct) end
								end
								do n2 = n2 + 1 end
							end
						end
					end
					do
						local array3 = cl:getNodes()
						if array3 ~= nil then
							local n3 = 0
							local m3 = _g.jk.lang.Vector:getSize(array3)
							do
								n3 = 0
								while n3 < m3 do
									local vd = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.model.VariableDeclarationNode')
									if vd ~= nil then
										if _g.sling.util.ModifierUtil:hasCommonModifier(vd, _g.sling.model.Modifier.STATIC) then
											goto _continue18
										end
										do
											local ii = vd:getInitializer()
											if not (ii ~= nil) then
												goto _continue18
											end
											if cts ~= nil then
												local n4 = 0
												local m4 = _g.jk.lang.Vector:getSize(cts)
												do
													n4 = 0
													while n4 < m4 do
														local ct = cts[n4 + 1]
														if ct ~= nil then
															local di = _g.sling.util.ExpressionUtil:dupAsExpression(ii)
															if not (di ~= nil) then
																goto _continue19
															end
															do
																local aa = _g.sling.model.AssignmentExpressionNode:forNodes(_g.sling.model.SymbolExpressionNode:forBinding(vd, nil), di)
																do _g.sling.util.FunctionUtil:prependStatement(ct, aa) end
															end
														end
														::_continue19::
														do n4 = n4 + 1 end
													end
												end
											end
										end
									end
									::_continue18::
									do n3 = n3 + 1 end
								end
							end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:isFunctionRerefence(sx)
	local fd = _vm:to_table_with_key(_g.sling.util.SymbolUtil:tryGetSymbolBindingForExpression(sx), '_isType.sling.model.FunctionDeclarationNode')
	if not (fd ~= nil) then
		do return nil end
	end
	do
		local pp = _vm:to_table_with_key(sx, '_isType.sling.model.ExpressionNode')
		while true do
			local op = pp
			pp = _vm:to_table_with_key(pp:getParent(), '_isType.sling.model.ExpressionNode')
			if not (pp ~= nil) then
				do break end
			end
			do
				local fc = _vm:to_table_with_key(pp, '_isType.sling.model.FunctionCallExpressionNode')
				if fc ~= nil and fc:getExpression() == op then
					do return nil end
				end
			end
		end
		do return fd end
	end
end

function sling.web.compiler.SlingToWebOps:convertFunctionSymbolReferencesToFunctionDeclarationExpressions(node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.SymbolExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local sx = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.SymbolExpressionNode')
				if sx ~= nil then
					local bd = _g.sling.web.compiler.SlingToWebOps:isFunctionRerefence(sx)
					if not (bd ~= nil) then
						goto _continue20
					end
					do
						local fd = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
						local tp = bd:getOwnReturnType()
						if tp ~= nil then
							do fd:setReturnType(_g.sling.util.DataTypeUtil:dupAsDataType(tp), false) end
						end
						do
							local array2 = bd:getParameters()
							if array2 ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(array2)
								do
									n2 = 0
									while n2 < m2 do
										local pr = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
										if pr ~= nil then
											do fd:addToParameters(_g.sling.util.NodeUtil:dupAsNode(pr)) end
										end
										do n2 = n2 + 1 end
									end
								end
							end
							do
								local fe = _g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(fd)
								do fe:setSource(sx:getSource()) end
								do _g.sling.util.NodeUtil:replaceAndExport(sx, fe) end
								do
									local fc = _g.sling.model.FunctionCallExpressionNode:forExpression(sx)
									local array3 = fd:getParameters()
									if array3 ~= nil then
										local n3 = 0
										local m3 = _g.jk.lang.Vector:getSize(array3)
										do
											n3 = 0
											while n3 < m3 do
												local pr = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.common.NodeObject')
												if pr ~= nil then
													do fc:addToParameters(_g.sling.model.SymbolExpressionNode:forBinding(pr, nil)) end
												end
												do n3 = n3 + 1 end
											end
										end
									end
									if tp == nil or (_vm:to_table_with_key(tp, '_isType.sling.model.VoidDataTypeNode') ~= nil) then
										do _g.sling.util.FunctionUtil:addStatement(fd, fc) end
									else
										do _g.sling.util.FunctionUtil:addStatement(fd, _g.sling.model.ReturnStatementNode:forExpression(fc)) end
									end
								end
							end
						end
					end
				end
				::_continue20::
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:removeDefaultValuesFromFunctionDeclarations(node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.VariableDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local vd = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.VariableDeclarationNode')
				if vd ~= nil then
					if not (vd:getInitializer() ~= nil) then
						goto _continue21
					end
					if (_vm:to_table_with_key(vd:getParent(), '_isType.sling.model.FunctionDeclarationBaseNode') ~= nil) == false then
						goto _continue21
					end
					do vd:setInitializer(nil, false) end
				end
				::_continue21::
				do n = n + 1 end
			end
		end
	end
end

sling.web.compiler.SlingToWebOps.FunctionFinder = _g.sling.common.NodeVisitor._create()
sling.web.compiler.SlingToWebOps.FunctionFinder.__index = sling.web.compiler.SlingToWebOps.FunctionFinder
_vm:set_metatable(sling.web.compiler.SlingToWebOps.FunctionFinder, {
	__index = _g.sling.common.NodeVisitor
})

function sling.web.compiler.SlingToWebOps.FunctionFinder._create()
	local v = _vm:set_metatable({}, sling.web.compiler.SlingToWebOps.FunctionFinder)
	return v
end

function sling.web.compiler.SlingToWebOps.FunctionFinder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.web.compiler.SlingToWebOps.FunctionFinder'
	self['_isType.sling.web.compiler.SlingToWebOps.FunctionFinder'] = true
	self.results = nil
end

function sling.web.compiler.SlingToWebOps.FunctionFinder:_construct0()
	sling.web.compiler.SlingToWebOps.FunctionFinder._init(self)
	do _g.sling.common.NodeVisitor._construct0(self) end
	self.results = {}
	return self
end

function sling.web.compiler.SlingToWebOps.FunctionFinder:visit(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationBaseNode') ~= nil) then
		do _g.jk.lang.Vector:append(self.results, node) end
		do self:setSkipChildren(true) end
	end
	do return true end
end

function sling.web.compiler.SlingToWebOps.FunctionFinder:getResults()
	do return self.results end
end

function sling.web.compiler.SlingToWebOps.FunctionFinder:setResults(v)
	self.results = v
	do return self end
end

function sling.web.compiler.SlingToWebOps:ensureUniqueVariableNames(ctx, node)
	if not (node ~= nil) then
		do return end
	end
	do
		local ff = _g.sling.web.compiler.SlingToWebOps.FunctionFinder._construct0(_g.sling.web.compiler.SlingToWebOps.FunctionFinder._create())
		do node:accept(ff) end
		do
			local array = ff:getResults()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local fd = array[n + 1]
						if fd ~= nil then
							local vv = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
							local array2 = _g.sling.util.FindUtil:findNodesOfType(fd, "class:sling.model.VariableDeclarationNode", false, true, false)
							if array2 ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(array2)
								do
									n2 = 0
									while n2 < m2 do
										local vd = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.VariableDeclarationNode')
										if vd ~= nil then
											local nn = vd:getNodeName()
											if _g.jk.lang.String:isEmpty(nn) then
												goto _continue22
											end
											if not vv:contains(nn) then
												do vv:add(nn) end
												goto _continue22
											end
											do
												local cc = 1
												while true do
													local nm = _g.jk.lang.String:safeString(nn) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(cc))
													if vv:contains(nm) then
														do cc = cc + 1 end
														goto _continue23
													end
													do vd:renameNode(nm) end
													do vv:add(nm) end
													do break end
													::_continue23::
												end
											end
										end
										::_continue22::
										do n2 = n2 + 1 end
									end
								end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:processHTMLScreensForMotion(root)
	local array = _g.sling.util.NodeFinder:findNodesOfType(root, "class:sling.model.ClassDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local decl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ClassDeclarationNode')
				if decl ~= nil then
					if not _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "mainScene") then
						goto _continue24
					end
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "nojkop") then
						goto _continue24
					end
					do
						local className = decl:getNodeName()
						local code = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
						do code:appendString("func main(args as array<string>) static as int #main\n{\n\tvar context = new jk.ui.GuiApplicationContextForHTML()\n\tvar scene = new ") end
						do code:appendString(className) end
						do code:appendString("()\n\tscene.onPreInitialize(context)\n\tvar resources = new string[] {\n\t\t") end
						do
							local first = true
							local array2 = _g.sling.util.ProjectUtil:findResourcesForTree(decl)
							if array2 ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(array2)
								do
									n2 = 0
									while n2 < m2 do
										local resourceNode = array2[n2 + 1]
										if resourceNode ~= nil then
											if first == false then
												do code:appendString(", ") end
											end
											do code:appendString("\"") end
											do code:appendString(resourceNode:getName()) end
											do code:appendString("\"") end
											first = false
										end
										do n2 = n2 + 1 end
									end
								end
							end
							do code:appendString("\n\t}\n\tcontext.prepareResources(resources, func {\n\t\tvar backend = motion.BackendForHTMLElements.forScene(scene, context, jk.ui.HTMLDOM.getDocumentBody())\n\t\tbackend.start()\n\t})\n\treturn 0\n}\n") end
							do
								local decls = _g.sling.parser.SlingParser._construct0(_g.sling.parser.SlingParser._create()):parseStringAsEntityDeclarations(code:toString(), "MotionMainForHTML5.sling.t")
								if not (decls ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to parse the generated code: MotionMainForHTML5 (compiler internal error)", decl, nil))
								end
								do
									local array3 = decls:exportNodes()
									if array3 ~= nil then
										local n3 = 0
										local m3 = _g.jk.lang.Vector:getSize(array3)
										do
											n3 = 0
											while n3 < m3 do
												local node = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.common.NodeObject')
												if node ~= nil then
													do decl:addNode(node) end
												end
												do n3 = n3 + 1 end
											end
										end
									end
									do decls:destroy() end
									do _g.sling.util.ModifierUtil:removeAnnotationModifier(decl, "mainScene") end
								end
							end
						end
					end
				end
				::_continue24::
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:processHTMLScreensForWidgets(root)
	local array = _g.sling.util.NodeFinder:findNodesOfType(root, "class:sling.model.ClassDeclarationNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local decl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ClassDeclarationNode')
				if decl ~= nil then
					if not _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "screen") then
						goto _continue25
					end
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "nojkop") then
						goto _continue25
					end
					if _g.sling.util.ModifierUtil:hasAnnotationModifier(decl, "main") then
						local className = decl:getNodeName()
						local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
						do sb:appendString("func main(args as array<string>) static as int #main\n{\n\tvar context = new jk.ui.GuiApplicationContextForHTML()\n\tvar resources = new string[] {\n\t\t") end
						do
							local first = true
							local array2 = _g.sling.util.ProjectUtil:findResourcesForTree(root)
							if array2 ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(array2)
								do
									n2 = 0
									while n2 < m2 do
										local resourceNode = array2[n2 + 1]
										if resourceNode ~= nil then
											if first == false then
												do sb:appendString(", ") end
											end
											do sb:appendString("\"") end
											do sb:appendString(resourceNode:getName()) end
											do sb:appendString("\"") end
											first = false
										end
										do n2 = n2 + 1 end
									end
								end
							end
							do sb:appendString("\n\t}\n\tcontext.prepareResources(resources, func {\n\t\tvar main = new ") end
							do sb:appendString(className) end
							do sb:appendString("()\n\t\tif main is jk.ui.ScreenWithContext:\n\t\t\tmain.setContext(context)\n\t\tmain.initialize()\n\t})\n\treturn 0\n}\n") end
							do
								local code = sb:toString()
								local csp = _g.sling.parser.SlingParser._construct0(_g.sling.parser.SlingParser._create())
								local decls = csp:parseStringAsEntityDeclarations(code, "WidgetMainForHTML5.sling.t")
								if not (decls ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to parse the generated code: WidgetMainForHTML5 (compiler internal error)", decl, nil))
								end
								do
									local array3 = decls:exportNodes()
									if array3 ~= nil then
										local n3 = 0
										local m3 = _g.jk.lang.Vector:getSize(array3)
										do
											n3 = 0
											while n3 < m3 do
												local node = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.common.NodeObject')
												if node ~= nil then
													do decl:addNode(node) end
												end
												do n3 = n3 + 1 end
											end
										end
									end
									do decls:destroy() end
									do _g.sling.util.ModifierUtil:removeAnnotationModifier(decl, "main") end
								end
							end
						end
					end
					do _g.sling.util.ModifierUtil:removeAnnotationModifier(decl, "screen") end
				end
				::_continue25::
				do n = n + 1 end
			end
		end
	end
end

function sling.web.compiler.SlingToWebOps:convertPromiseLiteralsToPromiseInstantiations(node)
	local array = _g.sling.util.FindUtil:findNodesOfType(node, "class:sling.model.PromiseLiteralExpressionNode", false, true, false)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local plex = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.PromiseLiteralExpressionNode')
				if plex ~= nil then
					local body = plex:getBody()
					local rslv = _g.sling.util.FunctionUtil:findUniqueVariableNameInFunction(_g.sling.util.FindUtil:findNearestFunctionBase(plex), "resolve")
					local rjct = _g.sling.util.FunctionUtil:findUniqueVariableNameInFunction(_g.sling.util.FindUtil:findNearestFunctionBase(plex), "reject")
					local array2 = _g.sling.util.FindUtil:findNodesOfTypes(body, {
						"class:sling.model.ReturnStatementNode",
						"class:sling.model.ThrowStatementNode"
					}, false, true, false)
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local expr = array2[n2 + 1]
								if expr ~= nil then
									local call = nil
									if (_vm:to_table_with_key(expr, '_isType.sling.model.ReturnStatementNode') ~= nil) then
										local prnt = expr:getParent()
										while true do
											if not (prnt ~= nil) then
												do break end
											end
											if (_vm:to_table_with_key(prnt, '_isType.sling.model.PromiseLiteralExpressionNode') ~= nil) then
												do break end
											end
											if (_vm:to_table_with_key(prnt, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
												do break end
											end
											prnt = prnt:getParent()
										end
										if (_vm:to_table_with_key(prnt, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
											goto _continue26
										end
										call = _g.sling.model.FunctionCallExpressionNode:forName(rslv)
										do call:addToParameters(expr:exportExpression()) end
									elseif (_vm:to_table_with_key(expr, '_isType.sling.model.ThrowStatementNode') ~= nil) then
										call = _g.sling.model.FunctionCallExpressionNode:forName(rjct)
										do call:addToParameters(expr:exportExpression()) end
									end
									if not (call ~= nil) then
										goto _continue26
									end
									do _g.sling.util.NodeUtil:replaceAndExport(expr, call) end
								end
								::_continue26::
								do n2 = n2 + 1 end
							end
						end
					end
					do
						local decl = _g.sling.model.FunctionDeclarationNode._construct0(_g.sling.model.FunctionDeclarationNode._create())
						do decl:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), rslv, nil)) end
						do decl:addToParameters(_g.sling.model.VariableDeclarationNode:instance(_g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create()), rjct, nil)) end
						do decl:setBody(plex:exportBody(), false) end
						do
							local prms = _g.sling.model.CreateObjectExpressionNode:forReferenceTypeName("Promise")
							do prms:addToParameters(_g.sling.model.FunctionDeclarationExpressionNode:forDeclaration(decl)) end
							do _g.sling.util.NodeUtil:replaceAndExport(plex, prms) end
						end
					end
				end
				do n = n + 1 end
			end
		end
	end
end
