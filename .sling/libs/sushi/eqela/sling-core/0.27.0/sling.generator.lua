sling = sling or {}

sling.generator = sling.generator or {}

sling.generator.SlingGenerator = _g.sling.common.CodeGenerator._create()
sling.generator.SlingGenerator.__index = sling.generator.SlingGenerator
_vm:set_metatable(sling.generator.SlingGenerator, {
	__index = _g.sling.common.CodeGenerator
})

sling.generator.SlingGenerator.CONTEXT_NAMESPACE = 0
sling.generator.SlingGenerator.CONTEXT_CLASS = 1
sling.generator.SlingGenerator.CONTEXT_INTERFACE = 2
sling.generator.SlingGenerator.CONTEXT_ENUM = 3
sling.generator.SlingGenerator.CONTEXT_SCRIPT = 4
sling.generator.SlingGenerator.CONTEXT_EXPRESSION = 5
sling.generator.SlingGenerator.CONTEXT_STATEMENT_BLOCK = 6
sling.generator.SlingGenerator.CONTEXT_DELEGATE = 7

function sling.generator.SlingGenerator._create()
	local v = _vm:set_metatable({}, sling.generator.SlingGenerator)
	return v
end

function sling.generator.SlingGenerator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.generator.SlingGenerator'
	self['_isType.sling.generator.SlingGenerator'] = true
	self.isLastNL = false
	self.excludeComments = false
	self.currentIndent = 0
	self.copyrightDeclaration = nil
	self.hangingBraces = false
	self.insertSpaceAfterKeywords = true
end

function sling.generator.SlingGenerator:_construct0()
	sling.generator.SlingGenerator._init(self)
	do _g.sling.common.CodeGenerator._construct0(self) end
	return self
end

function sling.generator.SlingGenerator:_construct2(ctx, output)
	sling.generator.SlingGenerator._init(self)
	do _g.sling.common.CodeGenerator._construct2(self, ctx, output) end
	return self
end

function sling.generator.SlingGenerator:adjustIndent(n)
	self.currentIndent = self.currentIndent + n
end

function sling.generator.SlingGenerator:dumpOpeningBrace()
	if self.hangingBraces then
		do self:output(" {\n") end
	else
		do self:output("\n") end
		do self:output("{\n") end
	end
end

function sling.generator.SlingGenerator:dumpKeywordParens()
	if self.insertSpaceAfterKeywords then
		do self:output(" (") end
	else
		do self:output("(") end
	end
end

function sling.generator.SlingGenerator:onFileStarted()
	do _g.sling.common.CodeGenerator.onFileStarted(self) end
	self.currentIndent = 0
	self.isLastNL = false
	if _g.jk.lang.String:isEmpty(self.copyrightDeclaration) == false then
		local cc = _g.sling.model.CommentNode:forText(self.copyrightDeclaration, false)
		do cc:setSubstantial(true) end
		do self:dumpComment(cc, true) end
	end
end

function sling.generator.SlingGenerator:dumpComment(node, allowExtraNewlines)
	if self.excludeComments then
		do return true end
	end
	do
		local substantial = node:getSubstantial()
		local text = node:getText()
		if substantial == false and _g.jk.lang.String:getIndexOfCharacter(text, 10, 0) >= 0 then
			substantial = true
		end
		if substantial and allowExtraNewlines then
			do self:doOutput("\n", true) end
		end
		if substantial == false then
			if _g.jk.lang.String:startsWith(text, " ", 0) == false then
				do self:doOutput("// " .. _g.jk.lang.String:safeString(text) .. "\n", true) end
			else
				do self:doOutput("//" .. _g.jk.lang.String:safeString(text) .. "\n", true) end
			end
		else
			do self:doOutput("/*\n", true) end
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
								if _g.jk.lang.String:isEmpty(line) then
									do self:doOutput(" *\n", true) end
								else
									do self:doOutput(" * " .. _g.jk.lang.String:safeString(line) .. "\n", true) end
								end
							end
							do n = n + 1 end
						end
					end
				end
				do self:doOutput(" */\n", true) end
			end
		end
		if substantial and allowExtraNewlines then
			do self:doOutput("\n", true) end
		end
		do return true end
	end
end

function sling.generator.SlingGenerator:output(str)
	do self:doOutput(str, false) end
end

function sling.generator.SlingGenerator:doOutput(str, isComment)
	if not (str ~= nil) then
		do return end
	end
	do
		local decIndent = false
		if self.isLastNL and self.currentIndent > 0 then
			if isComment == false and (_g.jk.lang.String:startsWith(str, "}", 0) or _g.jk.lang.String:startsWith(str, "]", 0)) then
				do self.currentIndent = self.currentIndent - 1 end
				decIndent = true
			end
			if not (str == "\n") then
				local n = 0
				do
					n = 0
					while n < self.currentIndent do
						do self:outputDirect("\t") end
						do n = n + 1 end
					end
				end
			end
		end
		self.isLastNL = false
		do self:outputDirect(str) end
		if _g.jk.lang.String:endsWith(str, "\n") then
			self.isLastNL = true
			if isComment == false then
				if _g.jk.lang.String:endsWith(str, "{\n") or _g.jk.lang.String:endsWith(str, "[\n") then
					do self.currentIndent = self.currentIndent + 1 end
				elseif _g.jk.lang.String:endsWith(str, "}\n") or _g.jk.lang.String:endsWith(str, "]\n") then
					if decIndent == false then
						do self.currentIndent = self.currentIndent - 1 end
					end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:getContextName(ctx)
	if ctx == _g.sling.generator.SlingGenerator.CONTEXT_NAMESPACE then
		do return "namespace" end
	end
	if ctx == _g.sling.generator.SlingGenerator.CONTEXT_CLASS then
		do return "class" end
	end
	if ctx == _g.sling.generator.SlingGenerator.CONTEXT_INTERFACE then
		do return "interface" end
	end
	if ctx == _g.sling.generator.SlingGenerator.CONTEXT_ENUM then
		do return "enum" end
	end
	if ctx == _g.sling.generator.SlingGenerator.CONTEXT_SCRIPT then
		do return "script" end
	end
	if ctx == _g.sling.generator.SlingGenerator.CONTEXT_EXPRESSION then
		do return "expression" end
	end
	if ctx == _g.sling.generator.SlingGenerator.CONTEXT_STATEMENT_BLOCK then
		do return "statement block" end
	end
	do return "unknown context" end
end

function sling.generator.SlingGenerator:startModuleFile(name)
	if _g.jk.lang.String:isEmpty(name) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty name for startModuleFile", nil, _g.jk.lang.StackTrace:generate()))
	end
	do
		local module = self:getCurrentModuleName()
		if _g.jk.lang.String:isEmpty(module) then
			do self:startFile(name) end
		else
			do self:startFile(_g.jk.lang.String:safeString(module) .. "/" .. _g.jk.lang.String:safeString(name)) end
		end
	end
end

function sling.generator.SlingGenerator:dumpHeader(node, name)
	do self:startFile(_g.jk.lang.String:safeString(name) .. ".sling") end
	do
		local array = _g.sling.util.NodeFinder:findCompatibleNodesForTypes(node, {
			"class:sling.model.EntityDeclarationNode",
			"class:sling.model.VariableDeclarationNode",
			"class:sling.model.FunctionDeclarationNode"
		}, false, true, false)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local decl = array[n + 1]
					if decl ~= nil then
						if (_vm:to_table_with_key(decl, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
							local edecl = decl
							if (_vm:to_table_with_key(decl, '_isType.sling.model.TemplateDeclarationNode') ~= nil) then
								goto _continue1
							end
							if (_vm:to_table_with_key(decl:getParent(), '_isType.sling.model.EntityDeclarationNode') ~= nil) then
								goto _continue1
							end
							if _g.sling.util.ModifierUtil:hasCommonModifier(edecl, _g.sling.model.Modifier.HEADER) then
								goto _continue1
							end
							do self:dumpEntityDeclarationHeader(edecl, true) end
						end
						if (_vm:to_table_with_key(decl, '_isType.sling.model.VariableDeclarationNode') ~= nil) or (_vm:to_table_with_key(decl, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
							if (_vm:to_table_with_key(decl:getParent(), '_isType.sling.model.NamespaceNode') ~= nil) == false then
								goto _continue1
							end
							if (_vm:to_table_with_key(decl, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
								do self:dumpFunctionSignature(decl, true) end
								do self:output("\n") end
							elseif (_vm:to_table_with_key(decl, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
								do self:dumpHeaderVariableDeclaration(decl, true) end
							end
						end
					end
					::_continue1::
					do n = n + 1 end
				end
			end
		end
		do self:endFile() end
	end
end

function sling.generator.SlingGenerator:dumpDirectory(cd)
	if not (cd ~= nil) then
		do return end
	end
	do
		local nodes = cd:getNodes()
		if nodes ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(nodes)
			do
				n = 0
				while n < m do
					local node = _vm:to_table_with_key(nodes[n + 1], '_isType.sling.common.NodeObject')
					if node ~= nil then
						if (_vm:to_table_with_key(node, '_isType.sling.common.CodeDirectoryNode') ~= nil) then
							do self:dumpDirectory(node) end
						elseif (_vm:to_table_with_key(node, '_isType.sling.common.CodeFileNode') ~= nil) then
							local script = node
							local names = {}
							local dir = script:getParent()
							while dir ~= nil do
								if (_vm:to_table_with_key(dir, '_isType.sling.common.CodeDirectoryNode') ~= nil) then
									do _g.jk.lang.Vector:append(names, dir:getNodeName()) end
								end
								dir = dir:getParent()
							end
							do _g.jk.lang.Vector:reverse(names) end
							do
								local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
								if names ~= nil then
									local n2 = 0
									local m2 = _g.jk.lang.Vector:getSize(names)
									do
										n2 = 0
										while n2 < m2 do
											local name = names[n2 + 1]
											if name ~= nil then
												do sb:appendString(name) end
												do sb:appendCharacter(47) end
											end
											do n2 = n2 + 1 end
										end
									end
								end
								do self:doDumpFile(script, sb:toString()) end
							end
						else
							do _g.sling.common.RefLog:warning(self.ctx, "Unsupported node type in dumpDirectory: `" .. _g.jk.lang.String:safeString(node:getNodeTypeName()) .. "'", node) end
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpFile(script)
	if not (script ~= nil) then
		do return end
	end
	do self:doDumpFile(script, nil) end
end

function sling.generator.SlingGenerator:doDumpFile(script, moduleName)
	if not (script ~= nil) then
		do return end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if _g.jk.lang.String:isNotEmpty(moduleName) then
			do sb:appendString(moduleName) end
			if not _g.jk.lang.String:endsWith(moduleName, "/") then
				do sb:appendCharacter(47) end
			end
		end
		do
			local scriptName = script:getName()
			do sb:appendString(_g.jk.lang.String:safeString(scriptName) .. ".sling") end
			do self:startModuleFile(sb:toString()) end
			do
				local prev = nil
				local array = script:getNodes()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local snode = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
							if snode ~= nil then
								do self:dumpNodeInContext(snode, prev, _g.sling.generator.SlingGenerator.CONTEXT_NAMESPACE) end
								prev = snode
							end
							do n = n + 1 end
						end
					end
				end
				do self:endFile() end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpPlingMapValue(key, value)
	do self:output(key) end
	do self:output(" = ") end
	do self:output(_g.jk.lang.String:forObject(value)) end
	do self:output("\n") end
end

function sling.generator.SlingGenerator:dumpPlingStringValueWithInt(key, value)
	do self:dumpPlingStringValue(key, _g.jk.lang.String:forInteger(value)) end
end

function sling.generator.SlingGenerator:dumpPlingStringValueWithBool(key, value)
	do self:dumpPlingStringValue(key, _g.jk.lang.String:forBoolean(value)) end
end

function sling.generator.SlingGenerator:dumpPlingStringValueWithVector(key, values)
	if values ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(values)
		do
			n = 0
			while n < m do
				local val = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(values[n + 1])
				if val ~= nil then
					do self:output(key) end
					do self:output(" += ") end
					do self:dumpPlingStringValueWithString(val) end
					do self:output("\n") end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpPlingStringValueWithString(value)
	do self:output("\"") end
	do self:output(value) end
	do self:output("\"") end
end

function sling.generator.SlingGenerator:dumpPlingStringValue(key, value)
	do self:output(key) end
	do self:output(" = ") end
	do self:dumpPlingStringValueWithString(value) end
	do self:output("\n") end
end

function sling.generator.SlingGenerator:dumpModulePling(node)
	local pling = node
	if not (pling ~= nil) then
		do return end
	end
	do self:startFile("module.pling") end
	do
		local vendorId = pling:getVendorId()
		if vendorId ~= nil then
			do self:dumpPlingStringValue("vendorId", vendorId) end
		end
		do
			local projectId = pling:getProjectId()
			if projectId ~= nil then
				do self:dumpPlingStringValue("projectId", projectId) end
			end
			do
				local projectVersion = pling:getProjectVersion()
				if projectVersion ~= nil then
					do self:dumpPlingStringValue("projectVersion", projectVersion) end
				end
				do
					local projectTitle = pling:getProjectTitle()
					if projectTitle ~= nil then
						do self:dumpPlingStringValue("projectTitle", projectTitle) end
					end
					do
						local projectDescription = pling:getProjectDescription()
						if projectDescription ~= nil then
							do self:dumpPlingStringValue("projectDescription", projectDescription) end
						end
						do
							local projectCopyright = pling:getProjectCopyright()
							if projectCopyright ~= nil then
								do self:dumpPlingStringValue("projectCopyright", projectCopyright) end
							end
							do
								local projectLicense = pling:getProjectLicense()
								if projectLicense ~= nil then
									do self:dumpPlingStringValue("projectLicense", projectLicense) end
								end
								do
									local moduleId = pling:getModuleId()
									if moduleId ~= nil then
										do self:dumpPlingStringValue("moduleId", moduleId) end
									end
									do
										local moduleTitle = pling:getModuleTitle()
										if moduleTitle ~= nil then
											do self:dumpPlingStringValue("moduleTitle", moduleTitle) end
										end
										do
											local moduleDescription = pling:getModuleDescription()
											if moduleDescription ~= nil then
												do self:dumpPlingStringValue("moduleDescription", moduleDescription) end
											end
											do
												local useJkop = pling:getUseJkop()
												if useJkop then
													do self:dumpPlingStringValueWithBool("useJkop", useJkop) end
												end
												do
													local imports = pling:getImports()
													if _g.jk.lang.Vector:isNotEmpty(imports) then
														do self:dumpPlingStringValueWithVector("imports", imports) end
													end
													do
														local ignoreModuleIdInNamespace = pling:getIgnoreModuleIdInNamespace()
														if ignoreModuleIdInNamespace then
															do self:dumpPlingStringValueWithBool("ignoreModuleIdInNamespace", ignoreModuleIdInNamespace) end
														end
														do
															local libraries = pling:getLibraries()
															if _g.jk.lang.Vector:isNotEmpty(libraries) then
																do self:dumpPlingStringValueWithVector("libraries", libraries) end
															end
															do
																local androidProjectId = pling:getAndroidProjectId()
																if androidProjectId ~= nil then
																	do self:dumpPlingStringValue("androidProjectId", androidProjectId) end
																end
																do
																	local androidVersion = pling:getAndroidVersion()
																	if androidVersion ~= nil then
																		do self:dumpPlingStringValue("androidVersion", androidVersion) end
																	end
																	do
																		local androidPackageName = pling:getAndroidPackageName()
																		if androidPackageName ~= nil then
																			do self:dumpPlingStringValue("androidPackageName", androidPackageName) end
																		end
																		do
																			local androidMinSdkVersion = pling:getAndroidMinSdkVersion()
																			if androidMinSdkVersion > 0 then
																				do self:dumpPlingStringValueWithInt("androidMinSdkVersion", androidMinSdkVersion) end
																			end
																			do
																				local androidTargetSdkVersion = pling:getAndroidTargetSdkVersion()
																				if androidTargetSdkVersion > 0 then
																					do self:dumpPlingStringValueWithInt("androidTargetSdkVersion", androidTargetSdkVersion) end
																				end
																				do
																					local androidToolsVersion = pling:getAndroidToolsVersion()
																					if androidToolsVersion ~= nil then
																						do self:dumpPlingStringValue("androidToolsVersion", androidToolsVersion) end
																					end
																					do
																						local androidGradlePluginVersion = pling:getAndroidGradlePluginVersion()
																						if androidGradlePluginVersion ~= nil then
																							do self:dumpPlingStringValue("androidGradlePluginVersion", androidGradlePluginVersion) end
																						end
																						do
																							local androidKotlinVersion = pling:getAndroidKotlinVersion()
																							if androidKotlinVersion ~= nil then
																								do self:dumpPlingStringValue("androidKotlinVersion", androidKotlinVersion) end
																							end
																							do
																								local androidEnableAndroidJackForLibraries = pling:getAndroidEnableAndroidJackForLibraries()
																								if androidEnableAndroidJackForLibraries then
																									do self:dumpPlingStringValueWithBool("androidEnableAndroidJackForLibraries", androidEnableAndroidJackForLibraries) end
																								end
																								do
																									local androidKeyStore = pling:getAndroidKeyStore()
																									if androidKeyStore ~= nil then
																										do self:dumpPlingStringValue("androidKeyStore", androidKeyStore) end
																									end
																									do
																										local androidKeyStorePassword = pling:getAndroidKeyStorePassword()
																										if androidKeyStorePassword ~= nil then
																											do self:dumpPlingStringValue("androidKeyStorePassword", androidKeyStorePassword) end
																										end
																										do
																											local androidKeyAlias = pling:getAndroidKeyAlias()
																											if androidKeyAlias ~= nil then
																												do self:dumpPlingStringValue("androidKeyAlias", androidKeyAlias) end
																											end
																											do
																												local androidKeyAliasPassword = pling:getAndroidKeyAliasPassword()
																												if androidKeyAliasPassword ~= nil then
																													do self:dumpPlingStringValue("androidKeyAliasPassword", androidKeyAliasPassword) end
																												end
																												do
																													local androidGoogleServicesVersion = pling:getAndroidGoogleServicesVersion()
																													if androidGoogleServicesVersion ~= nil then
																														do self:dumpPlingStringValue("androidGoogleServicesVersion", androidGoogleServicesVersion) end
																													end
																													do
																														local androidMetaData = pling:getAndroidMetaData()
																														if androidMetaData ~= nil then
																															do self:dumpPlingMapValue("androidMetaData", androidMetaData) end
																														end
																														do
																															local androidManifestCustomXmls = pling:getAndroidManifestCustomXmls()
																															if androidManifestCustomXmls ~= nil then
																																do self:dumpPlingStringValueWithVector("androidManifestCustomXmls", androidManifestCustomXmls) end
																															end
																															do
																																local androidManifestApplicationCustomXmls = pling:getAndroidManifestApplicationCustomXmls()
																																if androidManifestApplicationCustomXmls ~= nil then
																																	do self:dumpPlingStringValueWithVector("androidManifestApplicationCustomXml", androidManifestApplicationCustomXmls) end
																																end
																																do
																																	local androidPermissions = pling:getAndroidPermissions()
																																	if androidPermissions ~= nil then
																																		do self:dumpPlingStringValueWithVector("androidPermissions", androidPermissions) end
																																	end
																																	do
																																		local androidFeatures = pling:getAndroidPermissions()
																																		if androidFeatures ~= nil then
																																			do self:dumpPlingStringValueWithVector("androidFeatures", androidFeatures) end
																																		end
																																		do
																																			local androidGradleDepends = pling:getAndroidGradleDepends()
																																			if androidGradleDepends ~= nil then
																																				do self:dumpPlingStringValueWithVector("androidGradleDepends", androidGradleDepends) end
																																			end
																																			do
																																				local androidGradleHeap = pling:getAndroidGradleHeap()
																																				if androidGradleHeap > 0 then
																																					do self:dumpPlingStringValue("androidGradleHeap", androidGradleHeap) end
																																				end
																																				do
																																					local iosProjectName = pling:getIosProjectName()
																																					if iosProjectName ~= nil then
																																						do self:dumpPlingStringValue("iosProjectName", iosProjectName) end
																																					end
																																					do
																																						local iosVersion = pling:getIosVersion()
																																						if iosVersion ~= nil then
																																							do self:dumpPlingStringValue("iosVersion", iosVersion) end
																																						end
																																						do
																																							local iosDisplayName = pling:getIosDisplayName()
																																							if iosDisplayName ~= nil then
																																								do self:dumpPlingStringValue("iosDisplayName", iosDisplayName) end
																																							end
																																							do
																																								local iosCflags = pling:getIosCflags()
																																								if iosCflags ~= nil then
																																									do self:dumpPlingStringValue("iosCflags", iosCflags) end
																																								end
																																								do
																																									local iosLinkMethod = pling:getIosLinkMethod()
																																									if iosLinkMethod ~= nil then
																																										do self:dumpPlingStringValue("iosLinkMethod", iosLinkMethod) end
																																									end
																																									do
																																										local iosDeploymentTarget = pling:getIosDeploymentTarget()
																																										if iosDeploymentTarget ~= nil then
																																											do self:dumpPlingStringValue("iosDeploymentTarget", iosDeploymentTarget) end
																																										end
																																										do
																																											local iosResultType = pling:getIosResultType()
																																											if iosResultType ~= nil then
																																												do self:dumpPlingStringValue("iosResultType", iosResultType) end
																																											end
																																											do
																																												local iosPods = pling:getIosPods()
																																												if iosPods ~= nil then
																																													do self:dumpPlingStringValueWithVector("iosPods", iosPods) end
																																												end
																																												do
																																													local iosFrameworks = pling:getIosFrameworks()
																																													if iosFrameworks ~= nil then
																																														do self:dumpPlingStringValueWithVector("iosFrameworks", iosFrameworks) end
																																													end
																																													do
																																														local iosLinkLibs = pling:getIosLinkLibs()
																																														if iosLinkLibs ~= nil then
																																															do self:dumpPlingStringValueWithVector("iosLinkLibs", iosLinkLibs) end
																																														end
																																														do
																																															local iosLdFlags = pling:getIosLdFlags()
																																															if iosLdFlags ~= nil then
																																																do self:dumpPlingStringValueWithVector("iosLdFlags", iosLdFlags) end
																																															end
																																															do
																																																local iosPlists = pling:getIosPlists()
																																																if iosPlists ~= nil then
																																																	do self:dumpPlingStringValueWithVector("iosPlists", iosPlists) end
																																																end
																																																do
																																																	local iosInfoPlistData = pling:getIosInfoPlistData()
																																																	if iosInfoPlistData ~= nil then
																																																		do self:dumpPlingStringValueWithVector("iosInfoPlistData", iosInfoPlistData) end
																																																	end
																																																	do
																																																		local iosScreenOrientation = pling:getIosScreenOrientation()
																																																		if iosScreenOrientation ~= nil then
																																																			do self:dumpPlingStringValue("iosScreenOrientation", iosScreenOrientation) end
																																																		end
																																																		do
																																																			local mavenArtifactId = pling:getMavenArtifactId()
																																																			if mavenArtifactId ~= nil then
																																																				do self:dumpPlingStringValue("mavenArtifactId", mavenArtifactId) end
																																																			end
																																																			do
																																																				local mavenGroupId = pling:getMavenGroupId()
																																																				if mavenGroupId ~= nil then
																																																					do self:dumpPlingStringValue("mavenGroupId", mavenGroupId) end
																																																				end
																																																				do
																																																					local mavenVersion = pling:getMavenVersion()
																																																					if mavenVersion ~= nil then
																																																						do self:dumpPlingStringValue("mavenVersion", mavenVersion) end
																																																					end
																																																					do
																																																						local mavenName = pling:getMavenName()
																																																						if mavenName ~= nil then
																																																							do self:dumpPlingStringValue("mavenName", mavenName) end
																																																						end
																																																						do
																																																							local npmPackageJson = pling:getNpmPackageJson()
																																																							if npmPackageJson ~= nil then
																																																								do self:dumpPlingMapValue("npmPackageJson", npmPackageJson) end
																																																							end
																																																							do
																																																								local npmAngularJson = pling:getNpmAngularJson()
																																																								if npmAngularJson ~= nil then
																																																									do self:dumpPlingMapValue("npmAngularJson", npmAngularJson) end
																																																								end
																																																								do
																																																									local npmTsconfigJson = pling:getNpmTsconfigJson()
																																																									if npmTsconfigJson ~= nil then
																																																										do self:dumpPlingMapValue("npmTsconfigJson", npmTsconfigJson) end
																																																									end
																																																									do
																																																										local npmTslintJson = pling:getNpmTslintJson()
																																																										if npmTslintJson ~= nil then
																																																											do self:dumpPlingMapValue("npmTslintJson", npmTslintJson) end
																																																										end
																																																										do self:endFile() end
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
		end
	end
end

function sling.generator.SlingGenerator:dumpResources(node)
	local array = node:getNodes()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local nn = array[n + 1]
				if nn ~= nil then
					local rsf = _vm:to_table_with_key(nn, '_isType.sling.model.ResourceFileNode')
					if not (rsf ~= nil) then
						goto _continue2
					end
					do
						local name = rsf:getFileName()
						if _g.jk.lang.String:isEmpty(name) then
							goto _continue2
						end
						do
							local buffer = rsf:getBuffer()
							if not (buffer ~= nil) then
								goto _continue2
							end
							do self:startFile("resources/" .. _g.jk.lang.String:safeString(name)) end
							do
								local writer = self:getCurrentWriter()
								if not (writer ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to get file writer for resource `" .. _g.jk.lang.String:safeString(name) .. "'", rsf, nil))
								end
								do
									local r = writer:writeBuffer(buffer)
									if not r then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to write resource `" .. _g.jk.lang.String:safeString(name) .. "'", rsf, nil))
									end
									do self:endFile() end
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

function sling.generator.SlingGenerator:dumpModule(module)
	if not (module ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null module given to Sling writer", nil, _g.jk.lang.StackTrace:generate()))
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
							goto _continue3
						elseif (_vm:to_table_with_key(node, '_isType.sling.common.CodeDirectoryNode') ~= nil) then
							do self:dumpDirectory(node) end
							goto _continue3
						else
							do _g.sling.common.RefLog:warning(self.ctx, "Unsupported node type in code unit: `" .. _g.jk.lang.String:safeString(node:getNodeTypeName()) .. "'", node) end
						end
					end
					::_continue3::
					do n = n + 1 end
				end
			end
		end
		do
			local settings = _vm:to_table_with_key(module:getSettings(), '_isType.sling.model.ext.NSlingUnitSettings')
			if settings ~= nil then
				do self:dumpModulePling(settings) end
			end
			do self:dumpResources(module) end
		end
	end
end

function sling.generator.SlingGenerator:dumpImportStaticMemberStatement(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output("import static ") end
	do self:dumpSymbol(node:getMember(), true) end
	if node:getAllMembers() then
		do self:output(".*") end
	end
	do
		local container = node:getContainer()
		if container ~= nil then
			do self:output(" from ") end
			do self:dumpSymbol(container, true) end
		end
		do self:output("\n") end
	end
end

function sling.generator.SlingGenerator:dumpImportPackageStatement(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output("import ") end
	do self:dumpSymbol(node:getPackage(), true) end
	do
		local localName = node:getLocalName()
		if _g.jk.lang.String:isNotEmpty(localName) then
			do self:output(" as ") end
			do self:output(localName) end
		end
		do self:output("\n") end
	end
end

function sling.generator.SlingGenerator:dumpImportEntityStatement(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output("use ") end
	do self:dumpSymbol(node:getEntity(), true) end
	if node:getAllMembers() then
		do self:output(".*") end
	end
	do
		local container = node:getContainer()
		if container ~= nil then
			do self:output(" from ") end
			do self:dumpSymbol(container, true) end
		end
		do self:output("\n") end
	end
end

function sling.generator.SlingGenerator:dumpTypeAliasDeclaration(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output("typedef ") end
	do self:output(node:getNodeName()) end
	do self:dumpGenericTypes(node:getGenericTypes()) end
	do self:output(" = ") end
	do self:dumpDataType(node:getType()) end
	do self:output("\n") end
end

function sling.generator.SlingGenerator:dumpModifier(node, mod)
	if not (mod ~= nil) then
		do return end
	end
	do
		local table = {
			[_g.sling.model.Modifier.PUBLIC] = "public",
			[_g.sling.model.Modifier.PRIVATE] = "private",
			[_g.sling.model.Modifier.PROTECTED] = "protected",
			[_g.sling.model.Modifier.NAMESPACEPRIVATE] = "nsprivate",
			[_g.sling.model.Modifier.STATIC] = "static",
			[_g.sling.model.Modifier.ABSTRACT] = "abstract",
			[_g.sling.model.Modifier.EXTERNAL] = "extern",
			[_g.sling.model.Modifier.IMPLEMENT] = "implement",
			[_g.sling.model.Modifier.OVERRIDE] = "override",
			[_g.sling.model.Modifier.VIRTUAL] = "virtual",
			[_g.sling.model.Modifier.FUNDAMENTAL] = "fundamental",
			[_g.sling.model.Modifier.PARTIAL] = "partial",
			[_g.sling.model.Modifier.CONSTANT] = "const",
			[_g.sling.model.Modifier.NEW] = "new",
			[_g.sling.model.Modifier.STUB] = "stub",
			[_g.sling.model.Modifier.WEAK] = "weak",
			[_g.sling.model.Modifier.FINAL] = "final",
			[_g.sling.model.Modifier.GLOBAL] = "global",
			[_g.sling.model.Modifier.HEADER] = "header",
			[_g.sling.model.Modifier.PROPERTY] = "property",
			[_g.sling.model.Modifier.READONLY] = "readonly",
			[_g.sling.model.Modifier.WRITEONLY] = "writeonly",
			[_g.sling.model.Modifier.READWRITE] = "readwrite",
			[_g.sling.model.Modifier.VOLATILE] = "volatile",
			[_g.sling.model.Modifier.THROWABLE] = "throwable",
			[_g.sling.model.Modifier.TRANSIENT] = "transient",
			[_g.sling.model.Modifier.DEPRECATED] = "deprecated",
			[_g.sling.model.Modifier.ASYNCHRONOUS] = "async",
			[_g.sling.model.Modifier.SYNCHRONIZED] = "synchronized",
			[_g.sling.model.Modifier.IMPLEMENTATION] = "implementation",
			[_g.sling.model.Modifier.REFERENCE] = "reference"
		}
		local ss = _g.jk.lang.Map:get(table, mod)
		if _g.jk.lang.String:isEmpty(ss) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported modifier: `" .. _g.jk.lang.String:safeString(mod) .. "'", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output(ss) end
	end
end

function sling.generator.SlingGenerator:dumpCommonModifiers(node, excludeModifiers)
	if not (node ~= nil) then
		do return end
	end
	do
		local array = _g.sling.util.ModifierUtil:getCommonModifiers(node)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local mod = array[n + 1]
					if mod ~= nil then
						if excludeModifiers ~= nil and excludeModifiers:contains(mod) then
							goto _continue4
						end
						do self:output(" ") end
						do self:dumpModifier(node, mod) end
					end
					::_continue4::
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpAnnotationModifierText(text)
	if not (text ~= nil) then
		do return end
	end
	do
		local simple = true
		local it = _g.jk.lang.String:iterate(text)
		while it ~= nil do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			if _g.jk.lang.Character:isAlnum(c) then
				goto _continue5
			end
			if c == 95 then
				goto _continue5
			end
			simple = false
			do break end
			::_continue5::
		end
		if simple then
			do self:output(text) end
		else
			do self:output("[" .. _g.jk.lang.String:safeString(text) .. "]") end
		end
	end
end

function sling.generator.SlingGenerator:dumpAnnotationModifiers(node, excludeModifiers)
	if not (node ~= nil) then
		do return end
	end
	do
		local array = node:getModifiers()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local annt = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.AnnotationModifierNode')
					if annt ~= nil then
						do self:output(" ") end
						do
							local text = annt:getText()
							local symbol = annt:getSymbol()
							if _g.jk.lang.String:isEmpty(text) and symbol == nil then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty text and symbol for annotation modifier", annt, _g.jk.lang.StackTrace:generate()))
							end
							if text ~= nil and excludeModifiers ~= nil and excludeModifiers:contains(text) then
								goto _continue6
							end
							do self:output("#") end
							if text ~= nil then
								do self:dumpAnnotationModifierText(text) end
							end
							if symbol ~= nil then
								do self:output("@") end
								do self:dumpSymbol(symbol, true) end
							end
							do
								local xprs = annt:getExpressions()
								if xprs ~= nil then
									do self:output("(") end
									do
										local first = true
										if xprs ~= nil then
											local n2 = 0
											local m2 = _g.jk.lang.Vector:getSize(xprs)
											do
												n2 = 0
												while n2 < m2 do
													local xpr = _vm:to_table_with_key(xprs[n2 + 1], '_isType.sling.model.ExpressionNode')
													if xpr ~= nil then
														if not first then
															do self:output(",") end
														end
														first = false
														do self:dumpExpression(xpr, nil, false) end
													end
													do n2 = n2 + 1 end
												end
											end
										end
										do self:output(")") end
									end
								end
							end
						end
					end
					::_continue6::
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:symbolComponentToString(symbol, o)
	if (_vm:get_variable_type(o) == 'string') then
		do return o end
	end
	if (_vm:to_table_with_key(o, '_isType.sling.model.SymbolNameComponentNode') ~= nil) then
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local c = o
		do sb:appendString(c:getName()) end
		do
			local tps = c:getTypeParameters()
			if _g.jk.lang.Vector:isEmpty(tps) == false then
				do sb:appendCharacter(60) end
				do
					local first = true
					if tps ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(tps)
						do
							n = 0
							while n < m do
								local nd = _vm:to_table_with_key(tps[n + 1], '_isType.sling.common.DataTypeNode')
								if nd ~= nil then
									if first then
										first = false
									else
										do sb:appendCharacter(44) end
									end
									do sb:appendString(_g.sling.generator.SlingGenerator:dataTypeToString(nd)) end
								end
								do n = n + 1 end
							end
						end
					end
					do sb:appendCharacter(62) end
				end
			end
			do return sb:toString() end
		end
	end
	do return nil end
end

function sling.generator.SlingGenerator:symbolToString(symbol, dumpAbsolute)
	local names = _g.sling.util.SymbolUtil:getSymbolComponents(symbol)
	if _g.jk.lang.Vector:isEmpty(names) then
		do return nil end
	end
	if not dumpAbsolute then
		local cc = _g.jk.lang.Vector:get(names, _g.jk.lang.Vector:getSize(names) - 1)
		if not (cc ~= nil) then
			do return nil end
		end
		do return _g.sling.generator.SlingGenerator:symbolComponentToString(symbol, cc) end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if names ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(names)
			do
				n = 0
				while n < m do
					local o = names[n + 1]
					if o ~= nil then
						if sb:count() > 0 then
							do sb:appendCharacter(46) end
						end
						do sb:appendString(_g.sling.generator.SlingGenerator:symbolComponentToString(symbol, o)) end
					end
					do n = n + 1 end
				end
			end
		end
		do return sb:toString() end
	end
end

function sling.generator.SlingGenerator:getFunctionCallDisplayString(fc)
	if not (fc ~= nil) then
		do return nil end
	end
	do
		local fname = _g.sling.util.FunctionUtil:getFunctionNameForExpression(fc:getExpression())
		if _g.jk.lang.String:isEmpty(fname) then
			fname = "<function>"
		end
		do
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			do sb:appendString(fname) end
			do sb:appendCharacter(40) end
			do
				local params = fc:getParameters()
				local first = true
				if params ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(params)
					do
						n = 0
						while n < m do
							local param = _vm:to_table_with_key(params[n + 1], '_isType.sling.model.ExpressionNode')
							if param ~= nil then
								if not first then
									do sb:appendString(", ") end
								end
								first = false
								do
									local dts = _g.sling.generator.SlingGenerator:dataTypeToString(_g.sling.util.ExpressionUtil:getExpressionDataType(param, nil))
									if _g.jk.lang.String:isEmpty(dts) then
										dts = "UNKNOWN"
									end
									do sb:appendString(dts) end
								end
							end
							do n = n + 1 end
						end
					end
				end
				do sb:appendCharacter(41) end
				do return sb:toString() end
			end
		end
	end
end

function sling.generator.SlingGenerator:dataTypeToString(node)
	if not (node ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PointerDataTypeNode') ~= nil) then
		local ptype = node:getPrimaryType()
		if ptype == nil then
			do return "ptr" end
		end
		if (_vm:to_table_with_key(ptype, '_isType.sling.model.IntegerDataTypeNode') ~= nil) and ptype:getType() == _g.sling.model.IntegerDataTypeNode.TYPE_UINT8 then
			do return "ptr" end
		end
		do return "ptr<" .. _g.jk.lang.String:safeString(_g.sling.generator.SlingGenerator:dataTypeToString(ptype)) .. ">" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableReferenceDataTypeNode') ~= nil) then
		local ptype = node:getPrimaryType()
		if ptype == nil then
			do return "ref" end
		end
		if (_vm:to_table_with_key(ptype, '_isType.sling.model.DynamicDataTypeNode') ~= nil) then
			do return "ref" end
		end
		do return "ref<" .. _g.jk.lang.String:safeString(_g.sling.generator.SlingGenerator:dataTypeToString(ptype)) .. ">" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ExpressionDataTypeNode') ~= nil) then
		do return "typeof" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TypeInfoDataTypeNode') ~= nil) then
		do return "typeinfo" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ThisDataTypeNode') ~= nil) then
		do return "this" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ParentDataTypeNode') ~= nil) then
		do return "parent" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StaticArrayDataTypeNode') ~= nil) then
		local adt = node
		local pt = adt:getPrimaryType()
		local sz = _vm:to_table_with_key(adt:getSize(), '_isType.sling.model.IntegerLiteralExpressionNode')
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("array") end
		do
			local sdt = _g.sling.generator.SlingGenerator:dataTypeToString(pt)
			if sz ~= nil or (sdt ~= nil and not (sdt == "object")) then
				do sb:appendCharacter(60) end
				if sdt ~= nil then
					do sb:appendString(sdt) end
				else
					do sb:appendString("object") end
				end
				if sz ~= nil then
					do sb:appendCharacter(91) end
					do sb:appendString(_g.jk.lang.String:forInteger(sz:getValue())) end
					do sb:appendCharacter(93) end
				end
				do sb:appendCharacter(62) end
			end
			do return sb:toString() end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) then
		local rf = node
		local symbol = rf:getSymbol()
		if not (symbol ~= nil) then
			do return nil end
		end
		do
			local ss = _g.sling.generator.SlingGenerator:symbolToString(symbol, true)
			if not (ss ~= nil) then
				do return nil end
			end
			if rf:getMagical() then
				local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				do sb:appendString("!\"") end
				do sb:appendString(ss) end
				do sb:appendString("\"") end
				do return sb:toString() end
			end
			do return ss end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.UnknownDataTypeNode') ~= nil) then
		do return "unknown" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DynamicDataTypeNode') ~= nil) then
		do return "dynamic" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AutomaticDataTypeNode') ~= nil) then
		do return "var" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CharacterDataTypeNode') ~= nil) then
		do return "char" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.IntegerDataTypeNode') ~= nil) then
		local idn = node
		local type = idn:getType()
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_INT then
			do return "int" end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT then
			do return "uint" end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_SHORT then
			do return "short" end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_USHORT then
			do return "ushort" end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_LONG then
			do return "long" end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_ULONG then
			do return "ulong" end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_INT8 then
			do return "int8" end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT8 then
			do return "uint8" end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_INT16 then
			do return "int16" end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT16 then
			do return "uint16" end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_INT32 then
			do return "int32" end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT32 then
			do return "uint32" end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_INT64 then
			do return "int64" end
		end
		if type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT64 then
			do return "uint64" end
		end
		do return nil end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DoubleDataTypeNode') ~= nil) then
		do return "double" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FloatDataTypeNode') ~= nil) then
		do return "float" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VoidDataTypeNode') ~= nil) then
		do return "void" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BooleanDataTypeNode') ~= nil) then
		do return "bool" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StringDataTypeNode') ~= nil) then
		do return "string" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ObjectDataTypeNode') ~= nil) then
		do return "object" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BufferDataTypeNode') ~= nil) then
		do return "buffer" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TupleDataTypeNode') ~= nil) then
		do return "tuple" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DateTimeDataTypeNode') ~= nil) then
		do return "datetime" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DecimalDataTypeNode') ~= nil) then
		do return "decimal" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ExceptionDataTypeNode') ~= nil) then
		do return "exception" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDataTypeNode') ~= nil) then
		local fdt = node
		local ddt = fdt:getFunctionReturnType()
		if not (ddt ~= nil) then
			ddt = _g.sling.model.VoidDataTypeNode._construct0(_g.sling.model.VoidDataTypeNode._create())
		end
		do
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			do sb:appendString("function<") end
			do sb:appendString(_g.sling.generator.SlingGenerator:dataTypeToString(ddt)) end
			do
				local array = fdt:getFunctionParameters()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local pdecl = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.VariableDeclarationNode')
							if pdecl ~= nil then
								local pdt = pdecl:getType()
								if pdt == nil then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No data type", pdecl, nil))
								end
								do sb:appendCharacter(44) end
								do sb:appendString(_g.sling.generator.SlingGenerator:dataTypeToString(pdt)) end
							end
							do n = n + 1 end
						end
					end
				end
				do sb:appendCharacter(62) end
				do return sb:toString() end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MapDataTypeNode') ~= nil) then
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("map") end
		do
			local dds1 = node:getKeyType()
			if not (dds1 ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No key type", node, nil))
			end
			do
				local dds2 = node:getValueType()
				if not (dds2 ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No value type", node, nil))
				end
				if (_vm:to_table_with_key(dds1, '_isType.sling.model.ObjectDataTypeNode') ~= nil) and (_vm:to_table_with_key(dds2, '_isType.sling.model.ObjectDataTypeNode') ~= nil) then
				else
					do sb:appendCharacter(60) end
					do sb:appendString(_g.sling.generator.SlingGenerator:dataTypeToString(dds1)) end
					do sb:appendCharacter(44) end
					do sb:appendString(_g.sling.generator.SlingGenerator:dataTypeToString(dds2)) end
					do sb:appendCharacter(62) end
				end
				do return sb:toString() end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SetDataTypeNode') ~= nil) then
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("set") end
		do
			local vt = node:getPrimaryType()
			if vt ~= nil and (_vm:to_table_with_key(vt, '_isType.sling.model.ObjectDataTypeNode') ~= nil) == false then
				do sb:appendCharacter(60) end
				do sb:appendString(_g.sling.generator.SlingGenerator:dataTypeToString(vt)) end
				do sb:appendCharacter(62) end
			end
			do return sb:toString() end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PromiseDataTypeNode') ~= nil) then
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("promise") end
		do
			local vt = node:getPrimaryType()
			if vt ~= nil and (_vm:to_table_with_key(vt, '_isType.sling.model.VoidDataTypeNode') ~= nil) == false then
				do sb:appendCharacter(60) end
				do sb:appendString(_g.sling.generator.SlingGenerator:dataTypeToString(vt)) end
				do sb:appendCharacter(62) end
			end
			do return sb:toString() end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VectorDataTypeNode') ~= nil) then
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("vector") end
		do
			local dt = node:getPrimaryType()
			if dt ~= nil and (_vm:to_table_with_key(dt, '_isType.sling.model.ObjectDataTypeNode') ~= nil) == false then
				do sb:appendCharacter(60) end
				do sb:appendString(_g.sling.generator.SlingGenerator:dataTypeToString(dt)) end
				do sb:appendCharacter(62) end
			end
			do return sb:toString() end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.OptionalDataTypeNode') ~= nil) then
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local pr = node:getPrimaryType()
		local um = node:getUnwrappingMethod()
		do sb:appendString(_g.sling.generator.SlingGenerator:dataTypeToString(pr)) end
		if um == _g.sling.model.OptionalDataTypeNode.EXPLICIT_UNWRAPPING then
			do sb:appendCharacter(63) end
		else
			do sb:appendCharacter(33) end
		end
		do return sb:toString() end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ConstrainedDataTypeNode') ~= nil) then
		local cdt = node
		local prim = cdt:getPrimaryType()
		if not (prim ~= nil) then
			prim = _g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create())
		end
		do
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			do sb:appendString(_g.sling.generator.SlingGenerator:dataTypeToString(prim)) end
			do
				local bts = cdt:getBaseTypes()
				if _g.jk.lang.Vector:isEmpty(bts) == false then
					local first = true
					if bts ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(bts)
						do
							n2 = 0
							while n2 < m2 do
								local dtn = _vm:to_table_with_key(bts[n2 + 1], '_isType.sling.common.DataTypeNode')
								if dtn ~= nil then
									if first then
										do sb:appendString(" : ") end
										first = false
									else
										do sb:appendString(" & ") end
									end
									do sb:appendString(_g.sling.generator.SlingGenerator:dataTypeToString(dtn)) end
								end
								do n2 = n2 + 1 end
							end
						end
					end
				end
				do return sb:toString() end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StyleSheetDataTypeNode') ~= nil) then
		do return "stylesheet" end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TreeDataTypeNode') ~= nil) then
		do return "tree" end
	end
	do return nil end
end

function sling.generator.SlingGenerator:dumpSymbol(symbol, dumpAbsolute)
	local str = _g.sling.generator.SlingGenerator:symbolToString(symbol, dumpAbsolute)
	if not (str ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Failed to convert symbol to string", symbol, _g.jk.lang.StackTrace:generate()))
	end
	do self:output(str) end
end

function sling.generator.SlingGenerator:dumpDataType(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null data type node to dump", nil, _g.jk.lang.StackTrace:generate()))
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ExpressionDataTypeNode') ~= nil) then
		do self:output("typeof(") end
		do self:dumpExpression(node:getExpression(), nil, false) end
		do self:output(")") end
		do return end
	end
	do
		local dts = _g.sling.generator.SlingGenerator:dataTypeToString(node)
		if not (dts ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "data type" .. "'", node, nil))
		end
		do self:output(dts) end
	end
end

function sling.generator.SlingGenerator:dumpEntityBaseTypes(node)
	local bts = node:getBaseTypes()
	if _g.jk.lang.Vector:isEmpty(bts) == false then
		if bts ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(bts)
			do
				n = 0
				while n < m do
					local basetype = _vm:to_table_with_key(bts[n + 1], '_isType.sling.model.BaseTypeNode')
					if basetype ~= nil then
						if basetype:getInheritType() == _g.sling.model.BaseTypeNode.INHERIT_AUTO then
							do self:output(" is ") end
							do self:dumpDataType(basetype:getReferenceType()) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		if bts ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(bts)
			do
				n2 = 0
				while n2 < m2 do
					local basetype = _vm:to_table_with_key(bts[n2 + 1], '_isType.sling.model.BaseTypeNode')
					if basetype ~= nil then
						local it = basetype:getInheritType()
						if it == _g.sling.model.BaseTypeNode.INHERIT_AUTO then
							goto _continue7
						end
						if it == _g.sling.model.BaseTypeNode.INHERIT_EXTEND then
							do self:output(" extends ") end
						elseif it == _g.sling.model.BaseTypeNode.INHERIT_IMPLEMENT then
							do self:output(" implements ") end
						elseif it == _g.sling.model.BaseTypeNode.INHERIT_INFORMATIVE then
							do self:output(" isAlso ") end
						else
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unknown inheritance type: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(it)), basetype, _g.jk.lang.StackTrace:generate()))
						end
						do self:dumpDataType(basetype:getReferenceType()) end
					end
					::_continue7::
					do n2 = n2 + 1 end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:escapeDoubleQuotes(str)
	if not (str ~= nil) then
		do return nil end
	end
	if _g.jk.lang.String:getIndexOfCharacter(str, 34, 0) < 0 then
		do return str end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local it = _g.jk.lang.String:iterate(str)
		while it ~= nil do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			if c == 34 then
				do sb:appendCharacter(92) end
			end
			do sb:appendCharacter(c) end
		end
		do return sb:toString() end
	end
end

function sling.generator.SlingGenerator:dumpEntityImports(node, addNewline)
	if not (node ~= nil) then
		do return 0 end
	end
	do
		local v = 0
		local nl = addNewline
		local array = node:getImportStaticNamespaces()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local importStatic = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.ImportStaticMemberStatementNode')
					if importStatic ~= nil then
						if nl then
							do self:output("\n") end
							nl = false
						end
						do self:dumpImportStaticMemberStatement(importStatic) end
						do v = v + 1 end
					end
					do n = n + 1 end
				end
			end
		end
		do
			local array2 = node:getImportEntities()
			if array2 ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(array2)
				do
					n2 = 0
					while n2 < m2 do
						local importEntity = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.ImportEntityStatementNode')
						if importEntity ~= nil then
							if nl then
								do self:output("\n") end
								nl = false
							end
							do self:dumpImportEntityStatement(importEntity) end
							do v = v + 1 end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			do
				local array3 = node:getImportNamespaces()
				if array3 ~= nil then
					local n3 = 0
					local m3 = _g.jk.lang.Vector:getSize(array3)
					do
						n3 = 0
						while n3 < m3 do
							local symbol = _vm:to_table_with_key(array3[n3 + 1], '_isType.sling.model.SymbolNode')
							if symbol ~= nil then
								if nl then
									do self:output("\n") end
									nl = false
								end
								do self:output("import ") end
								do self:dumpSymbol(symbol, true) end
								do self:output("\n") end
								do v = v + 1 end
							end
							do n3 = n3 + 1 end
						end
					end
				end
				do return v end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpEntityDeclarationHeader(node, useQualifiedName)
	if (_vm:to_table_with_key(node, '_isType.sling.model.ClassDeclarationNode') ~= nil) then
		do self:output("class") end
	elseif (_vm:to_table_with_key(node, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) then
		do self:output("interface") end
	elseif (_vm:to_table_with_key(node, '_isType.sling.model.EnumDeclarationNode') ~= nil) then
		do self:output("enum") end
	elseif (_vm:to_table_with_key(node, '_isType.sling.model.ScriptDeclarationNode') ~= nil) then
		do self:output("script") end
	elseif (_vm:to_table_with_key(node, '_isType.sling.model.DelegateDeclarationNode') ~= nil) then
		do self:output("delegate") end
	else
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "entity type for header" .. "'", node, nil))
	end
	do self:output(" ") end
	do self:output("name ") end
	if useQualifiedName then
		do self:output(_g.sling.util.NodeUtil:getQualifiedNameString(node, 46)) end
	else
		do self:output(node:getName()) end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GenericCapableEntityDeclarationNode') ~= nil) then
		do self:dumpGenericTypes(node:getGenericTypes()) end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DelegateDeclarationNode') ~= nil) then
		local fdec = node:getDeclaration()
		if fdec ~= nil then
			do self:dumpFunctionSignatureParameters(fdec:getParameters()) end
		end
	end
	if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.HEADER) == false then
		do self:output(" header") end
	end
	do self:dumpEntityModifiers(node) end
	do self:output("\n") end
	do self:output("{\n") end
	do self:dumpEntityImports(node, false) end
	do
		local array = node:getDependencies()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local dep = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(array[n + 1])
					if dep ~= nil then
						do self:output("depend \"" .. _g.jk.lang.String:safeString(self:escapeDoubleQuotes(dep)) .. "\"\n") end
					end
					do n = n + 1 end
				end
			end
		end
		do
			local array2 = node:getNodes()
			if array2 ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(array2)
				do
					n2 = 0
					while n2 < m2 do
						local child = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
						if child ~= nil then
							if (_vm:to_table_with_key(child, '_isType.sling.model.FunctionDeclarationBaseNode') ~= nil) and _g.sling.util.ModifierUtil:hasAnnotationModifier(child, "macro") then
								do self:dumpFunctionDeclaration(child, false) end
								goto _continue8
							end
							do
								local nwm = _vm:to_table_with_key(child, '_isType.sling.model.NodeWithModifiers')
								if not (nwm ~= nil) then
									goto _continue8
								end
								if _g.sling.util.ModifierUtil:hasCommonModifier(nwm, _g.sling.model.Modifier.PUBLIC) == false and _g.sling.util.ModifierUtil:hasCommonModifier(nwm, _g.sling.model.Modifier.PROTECTED) == false then
									goto _continue8
								end
								if (_vm:to_table_with_key(child, '_isType.sling.model.FunctionDeclarationBaseNode') ~= nil) then
									do self:dumpFunctionSignature(child, false) end
									do self:output("\n") end
								elseif (_vm:to_table_with_key(child, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
									do self:dumpHeaderVariableDeclaration(child, false) end
								elseif (_vm:to_table_with_key(child, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
									do self:dumpEntityDeclarationHeader(child, false) end
								elseif (_vm:to_table_with_key(child, '_isType.sling.model.EnumValueNode') ~= nil) then
									do self:dumpEnumValue(child) end
								elseif (_vm:to_table_with_key(child, '_isType.sling.model.PropertyDeclarationNode') ~= nil) then
									do self:dumpPropertyDeclarationHeader(child) end
								elseif (_vm:to_table_with_key(child, '_isType.sling.model.EventDeclarationNode') ~= nil) then
									do self:dumpEventDeclarationHeader(child) end
								end
							end
						end
						::_continue8::
						do n2 = n2 + 1 end
					end
				end
			end
			do self:output("}\n") end
		end
	end
end

function sling.generator.SlingGenerator:dumpEntityModifiers(node)
	do self:dumpEntityBaseTypes(node) end
	do self:dumpCommonModifiers(node, nil) end
	do self:dumpAnnotationModifiers(node, nil) end
end

function sling.generator.SlingGenerator:entitySupportsFileMode(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.ClassDeclarationNode') ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EnumDeclarationNode') ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ModelDeclarationNode') ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) then
		do return true end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ScriptDeclarationNode') ~= nil) then
		do return true end
	end
	do return false end
end

function sling.generator.SlingGenerator:dumpEntityDeclaration(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local isInFileMode = false
		if self:entitySupportsFileMode(node) then
			local parentFile = _vm:to_table_with_key(node:getParent(), '_isType.sling.common.CodeFileNode')
			if parentFile ~= nil and _g.jk.lang.String:equals(node:getName(), parentFile:getName()) then
				local isLast = false
				local array = parentFile:getNodes()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local snode = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
							if snode ~= nil then
								if snode == node then
									isLast = true
								else
									isLast = false
								end
							end
							do n = n + 1 end
						end
					end
				end
				if isLast then
					isInFileMode = true
				end
			end
		end
		do
			local nc = 0
			if (_vm:to_table_with_key(node, '_isType.sling.model.ClassDeclarationNode') ~= nil) then
				do self:output("class") end
				nc = _g.sling.generator.SlingGenerator.CONTEXT_CLASS
			elseif (_vm:to_table_with_key(node, '_isType.sling.model.InterfaceDeclarationNode') ~= nil) then
				do self:output("interface") end
				nc = _g.sling.generator.SlingGenerator.CONTEXT_INTERFACE
			elseif (_vm:to_table_with_key(node, '_isType.sling.model.EnumDeclarationNode') ~= nil) then
				do self:output("enum") end
				nc = _g.sling.generator.SlingGenerator.CONTEXT_ENUM
			elseif (_vm:to_table_with_key(node, '_isType.sling.model.ScriptDeclarationNode') ~= nil) then
				do self:output("script") end
				nc = _g.sling.generator.SlingGenerator.CONTEXT_SCRIPT
			elseif (_vm:to_table_with_key(node, '_isType.sling.model.DelegateDeclarationNode') ~= nil) then
				do self:output("delegate") end
				nc = _g.sling.generator.SlingGenerator.CONTEXT_DELEGATE
			else
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "entity type" .. "'", node, nil))
			end
			if not isInFileMode then
				do self:output(" ") end
				do self:output(node:getNodeName()) end
			end
			if (_vm:to_table_with_key(node, '_isType.sling.model.GenericCapableEntityDeclarationNode') ~= nil) then
				do self:dumpGenericTypes(node:getGenericTypes()) end
			end
			if (_vm:to_table_with_key(node, '_isType.sling.model.DelegateDeclarationNode') ~= nil) then
				local fdec = node:getDeclaration()
				if fdec ~= nil then
					do self:dumpFunctionSignatureParameters(fdec:getParameters()) end
				end
			end
			do self:dumpEntityModifiers(node) end
			if isInFileMode then
				do self:output(":\n") end
				do self:output("\n") end
			else
				do self:output("\n") end
				do self:output("{\n") end
			end
			do
				local addSpace = false
				local description = node:getDescription()
				local metadata = node:getMetadata()
				if _g.jk.lang.String:isNotEmpty(description) or _g.jk.lang.String:isNotEmpty(metadata) then
					do self:output("meta\n") end
					do self:output("{\n") end
					if _g.jk.lang.String:isNotEmpty(description) then
						do self:output("description ") end
						do self:outputLongStringWithWrapping(description) end
						do self:output("}\n") end
					end
					if _g.jk.lang.String:isNotEmpty(metadata) then
						do self:output("data ") end
						do self:outputLongStringWithWrapping(metadata) end
						do self:output("}\n") end
					end
					addSpace = true
				end
				if self:dumpEntityImports(node, addSpace) > 0 then
					addSpace = true
				end
				do
					local nl = addSpace
					local array2 = node:getImportEntities()
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local symbol = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.SymbolNode')
								if symbol ~= nil then
									if nl then
										do self:output("\n") end
										nl = false
									end
									do self:output("use ") end
									do self:dumpSymbol(symbol, true) end
									do self:output("\n") end
									addSpace = true
								end
								do n2 = n2 + 1 end
							end
						end
					end
					do
						local array3 = node:getDependencies()
						if array3 ~= nil then
							local n3 = 0
							local m3 = _g.jk.lang.Vector:getSize(array3)
							do
								n3 = 0
								while n3 < m3 do
									local dep = (function(o)
										if (_vm:get_variable_type(o) == 'string') then
											do return o end
										end
										do return nil end
									end)(array3[n3 + 1])
									if dep ~= nil then
										if nl then
											do self:output("\n") end
											nl = false
										end
										do self:output("depend \"" .. _g.jk.lang.String:safeString(self:escapeDoubleQuotes(dep)) .. "\"\n") end
										addSpace = true
									end
									do n3 = n3 + 1 end
								end
							end
						end
						if addSpace then
							do self:output("\n") end
						end
						do
							local prev = nil
							local array4 = node:getNodes()
							if array4 ~= nil then
								local n4 = 0
								local m4 = _g.jk.lang.Vector:getSize(array4)
								do
									n4 = 0
									while n4 < m4 do
										local child = _vm:to_table_with_key(array4[n4 + 1], '_isType.sling.common.NodeObject')
										if child ~= nil then
											if (_vm:to_table_with_key(child, '_isType.sling.model.FunctionDeclarationBaseNode') ~= nil) and (_vm:to_table_with_key(prev, '_isType.sling.model.FunctionDeclarationBaseNode') ~= nil) then
												local pbody = _vm:to_table_with_key(prev, '_isType.sling.model.FunctionDeclarationBaseNode'):getBody()
												local cbody = _vm:to_table_with_key(child, '_isType.sling.model.FunctionDeclarationBaseNode'):getBody()
												if not (pbody ~= nil) and cbody ~= nil then
													do self:output("\n") end
												end
											end
											do self:dumpNodeInContext(child, prev, nc) end
											prev = child
										end
										do n4 = n4 + 1 end
									end
								end
							end
							if prev ~= nil and (_vm:to_table_with_key(prev, '_isType.sling.model.FunctionDeclarationBaseNode') ~= nil) then
								if not (_vm:to_table_with_key(prev, '_isType.sling.model.FunctionDeclarationBaseNode'):getBody() ~= nil) then
									do self:output("\n") end
								end
							end
							if not isInFileMode then
								do self:output("}\n") end
							end
						end
					end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:shouldHaveBraces(node)
	if not (node ~= nil) then
		do return false end
	end
	if node:getChildCount() ~= 1 then
		do return true end
	end
	do
		local parent = node:getParent()
		if not (parent ~= nil) then
			do return false end
		end
		if (_vm:to_table_with_key(parent, '_isType.sling.model.TryCatchStatementNode') ~= nil) then
			do return true end
		end
		if (_vm:to_table_with_key(parent, '_isType.sling.model.CatchBlockNode') ~= nil) then
			do return true end
		end
		if (_vm:to_table_with_key(parent, '_isType.sling.model.ForEachStatementNode') ~= nil) then
			local fes = parent
			if fes:getElseBlock() ~= nil then
				do return true end
			end
		end
		if (_vm:to_table_with_key(parent, '_isType.sling.model.WhileStatementNode') ~= nil) then
			local wsn = parent
			if wsn:getElseBlock() ~= nil then
				do return true end
			end
		end
		if (_vm:to_table_with_key(parent, '_isType.sling.model.IfStatementNode') ~= nil) then
			local ifs = parent
			if ifs:getElseBlock() ~= nil then
				do return true end
			end
			do
				local ifsb = _vm:to_table_with_key(ifs:getParent(), '_isType.sling.model.BlockNode')
				if ifsb ~= nil and ifsb:getChildCount() == 1 and ifsb:getFirstNode() == ifs then
					local ifsp = _vm:to_table_with_key(ifsb:getParent(), '_isType.sling.model.IfStatementNode')
					if ifsp ~= nil and ifsp:getElseBlock() == ifsb then
						do return true end
					end
				end
				do return false end
			end
		end
		do return false end
	end
end

function sling.generator.SlingGenerator:isSimpleBlock(node)
	if not (node ~= nil) then
		do return false end
	end
	if not (node:getChildCount() == 1) then
		do return false end
	end
	do
		local child = node:getFirstNode()
		if child ~= nil then
			if (_vm:to_table_with_key(child, '_isType.sling.model.IfStatementNode') ~= nil) then
				do return false end
			end
			if (_vm:to_table_with_key(child, '_isType.sling.model.WhileStatementNode') ~= nil) then
				do return false end
			end
			if (_vm:to_table_with_key(child, '_isType.sling.model.DoWhileStatementNode') ~= nil) then
				do return false end
			end
			if (_vm:to_table_with_key(child, '_isType.sling.model.ForStatementNode') ~= nil) then
				do return false end
			end
			if (_vm:to_table_with_key(child, '_isType.sling.model.ForEachStatementNode') ~= nil) then
				do return false end
			end
			if (_vm:to_table_with_key(child, '_isType.sling.model.SwitchStatementNode') ~= nil) then
				do return false end
			end
			if (_vm:to_table_with_key(child, '_isType.sling.model.TryCatchStatementNode') ~= nil) then
				do return false end
			end
			if (_vm:to_table_with_key(child, '_isType.sling.model.AssertStatementNode') ~= nil) then
				local ass = child
				if ass:getErrorBlock() ~= nil then
					do return false end
				end
			end
			if (_vm:to_table_with_key(child, '_isType.sling.model.PreprocessorIfStatementNode') ~= nil) then
				do return false end
			end
			if (_vm:to_table_with_key(child, '_isType.sling.model.EmbedBlockNode') ~= nil) then
				if _g.jk.lang.String:contains(child:getCode(), "\n") then
					do return false end
				end
			end
			if (_vm:to_table_with_key(child, '_isType.sling.model.EnumDeclarationNode') ~= nil) then
				do return false end
			end
			if (_vm:to_table_with_key(child, '_isType.sling.model.CommentNode') ~= nil) then
				do return false end
			end
		end
		do return true end
	end
end

function sling.generator.SlingGenerator:dumpControlStructureBlock(node)
	local hasBraces = self:shouldHaveBraces(node)
	if hasBraces == false and self:isSimpleBlock(node) then
		do self:output(":\n") end
		do self:adjustIndent(1) end
		do self:dumpStatementContainer(node) end
		do self:adjustIndent(-1) end
	else
		do self:output(" {\n") end
		do self:dumpStatementContainer(node) end
		do self:output("}\n") end
	end
end

function sling.generator.SlingGenerator:outputLongStringWithWrapping(value)
	do self:output("[[\n") end
	do
		local array = _g.jk.text.StringUtil:wrapToLines(value, 80)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local line = array[n + 1]
					if line ~= nil then
						do self:output(line) end
						do self:output("\n") end
					end
					do n = n + 1 end
				end
			end
		end
		do self:output("]]\n") end
	end
end

function sling.generator.SlingGenerator:dumpFunctionBlock(node, description)
	if _g.jk.lang.String:isEmpty(description) and self:isSimpleBlock(node) then
		do self:output(":\n") end
		do self:adjustIndent(1) end
		do self:dumpStatementContainer(node) end
		do self:adjustIndent(-1) end
	else
		do self:output("\n") end
		do self:output("{\n") end
		if _g.jk.lang.String:isNotEmpty(description) then
			do self:output("meta {\n") end
			do self:output("description ") end
			do self:outputLongStringWithWrapping(description) end
			do self:output("}\n") end
		end
		do self:dumpStatementContainer(node) end
		do self:output("}\n") end
	end
end

function sling.generator.SlingGenerator:dumpStandaloneBlock(node)
	local first = true
	local array = _g.sling.util.ModifierUtil:getCommonModifiers(node)
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local mod = array[n + 1]
				if mod ~= nil then
					if not first then
						do self:output(" ") end
					end
					do self:dumpModifier(node, mod) end
					first = false
				end
				do n = n + 1 end
			end
		end
	end
	if not first then
		do self:output(" ") end
	end
	do self:output("{\n") end
	do self:dumpStatementContainer(node) end
	do self:output("}\n") end
end

function sling.generator.SlingGenerator:dumpFunctionExpressionBlock(node)
	do self:output(" {\n") end
	do self:dumpStatementContainer(node) end
	do self:output("}") end
end

function sling.generator.SlingGenerator:dumpFunctionSignatureParameter(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
		do self:dumpVariableDeclaration(node, nil, false, nil) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableArgumentsDeclarationNode') ~= nil) then
		local dd = node:getVariableDeclaration()
		if dd ~= nil then
			do self:dumpVariableDeclaration(dd, nil, false, nil) end
			do self:output(" ") end
		end
		do self:output("...") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.NamedParameterDeclarationNode') ~= nil) then
		local npd = node
		do self:output(npd:getName()) end
		do self:output(":") end
		do self:dumpVariableDeclaration(npd:getVariable(), nil, false, nil) end
		do return end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "function declaration parameters" .. "'", node, nil))
end

function sling.generator.SlingGenerator:dumpFunctionSignatureParameters(params)
	if not _g.jk.lang.Vector:isNotEmpty(params) then
		do return end
	end
	do self:output("(") end
	do
		local first = true
		if params ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(params)
			do
				n = 0
				while n < m do
					local cnode = _vm:to_table_with_key(params[n + 1], '_isType.sling.common.NodeObject')
					if cnode ~= nil then
						if first == false then
							do self:output(", ") end
						end
						first = false
						do self:dumpFunctionSignatureParameter(cnode) end
					end
					do n = n + 1 end
				end
			end
		end
		do self:output(")") end
	end
end

function sling.generator.SlingGenerator:dumpGenericTypes(genericTypes)
	if not (_g.jk.lang.Vector:getSize(genericTypes) > 0) then
		do return end
	end
	do self:output("<") end
	do
		local tf = true
		if genericTypes ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(genericTypes)
			do
				n = 0
				while n < m do
					local gt = _vm:to_table_with_key(genericTypes[n + 1], '_isType.sling.model.ClassDeclarationNode')
					if gt ~= nil then
						if tf == false then
							do self:output(",") end
						end
						tf = false
						do self:output(gt:getNodeName()) end
						do
							local first = true
							local array = gt:getBaseTypes()
							if array ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(array)
								do
									n2 = 0
									while n2 < m2 do
										local btn = _vm:to_table_with_key(array[n2 + 1], '_isType.sling.model.BaseTypeNode')
										if btn ~= nil then
											if first then
												do self:output(" : ") end
												first = false
											else
												do self:output(" & ") end
											end
											do self:dumpDataType(btn:getReferenceType()) end
										end
										do n2 = n2 + 1 end
									end
								end
							end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do self:output(">") end
	end
end

function sling.generator.SlingGenerator:dumpFunctionSignature(node, useQualifiedName)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null node for function declaration", nil, _g.jk.lang.StackTrace:generate()))
	end
	do
		local excludeCustom = nil
		if (_vm:to_table_with_key(node, '_isType.sling.model.ConstructorDeclarationNode') ~= nil) then
			do self:output("ctor") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.DestructorDeclarationNode') ~= nil) then
			do self:output("dtor") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
			local fdn = node
			local isMacro = _g.sling.util.ModifierUtil:hasAnnotationModifier(node, "macro")
			if isMacro then
				do self:output("macro") end
				excludeCustom = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
				do excludeCustom:add("macro") end
			else
				do self:output("func") end
			end
			do
				local name = nil
				if useQualifiedName then
					name = _g.sling.util.NodeUtil:getQualifiedNameString(fdn, 46)
				else
					name = fdn:getNodeName()
				end
				if _g.jk.lang.String:isEmpty(name) == false then
					do self:output(" ") end
					do self:output(name) end
				end
				do
					local gts = node:getGenericTypes()
					if _g.jk.lang.Vector:isEmpty(gts) == false then
						do self:output(" ") end
						do self:dumpGenericTypes(gts) end
						do self:output(" ") end
					end
				end
			end
		else
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported function declaration type", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpFunctionSignatureParameters(node:getParameters()) end
		do
			local xx = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
			do xx:add(_g.sling.model.Modifier.PUBLIC) end
			do self:dumpCommonModifiers(node, xx) end
			if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationNode') ~= nil) then
				local fdn = node
				local dt = fdn:getReturnType()
				if dt ~= nil and (_vm:to_table_with_key(dt, '_isType.sling.model.VoidDataTypeNode') ~= nil) == false then
					do self:output(" as ") end
					do self:dumpDataType(dt) end
				end
			end
			do
				local throws = node:getThrowables()
				if _g.jk.lang.Vector:isEmpty(throws) == false then
					if throws ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(throws)
						do
							n = 0
							while n < m do
								local dt = _vm:to_table_with_key(throws[n + 1], '_isType.sling.common.DataTypeNode')
								if dt ~= nil then
									do self:output(" throws ") end
									do self:dumpDataType(dt) end
								end
								do n = n + 1 end
							end
						end
					end
				end
				if (_vm:to_table_with_key(node, '_isType.sling.model.ConstructorDeclarationNode') ~= nil) then
					local nextcall = node:getNext()
					if nextcall ~= nil then
						do self:output(" next ") end
						do self:dumpExpression(nextcall, nil, false) end
					end
				end
				do self:dumpAnnotationModifiers(node, excludeCustom) end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpStaticBlockDeclaration(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output("initStatic") end
	do self:dumpFunctionBlock(node:getBlock(), nil) end
end

function sling.generator.SlingGenerator:dumpFunctionDeclaration(node, isExpression)
	do self:dumpFunctionSignature(node, false) end
	do
		local body = node:getBody()
		if body ~= nil then
			if isExpression then
				do self:dumpFunctionExpressionBlock(body) end
			else
				do self:dumpFunctionBlock(body, node:getDescription()) end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpInitializerBlockDeclaration(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output("init") end
	do self:dumpFunctionBlock(node:getBlock(), nil) end
end

function sling.generator.SlingGenerator:dumpMainFunctionDeclaration(_function)
	if not (_function ~= nil) then
		do return end
	end
	do
		local aan = _function:getArgumentArrayName()
		if aan ~= nil and _g.jk.lang.String:equals(aan, "args") == false then
			do self:output("main(") end
			do self:output(aan) end
			do self:output(")") end
		else
			do self:output("main") end
		end
		do self:dumpFunctionBlock(_function:getBody(), nil) end
	end
end

function sling.generator.SlingGenerator:dumpWebApiRequestHandlerFunction(_function)
	if not (_function ~= nil) then
		do return end
	end
	do self:output(_g.jk.lang.String:safeString(_function:getMethod()) .. " \"" .. _g.jk.lang.String:safeString(_function:getPath()) .. "\"") end
	do self:dumpFunctionBlock(_function:getBody(), nil) end
end

function sling.generator.SlingGenerator:dumpStatementContainer(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local prev = nil
		local array = node:getNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local cc = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
					if cc ~= nil then
						do self:dumpNodeInContext(cc, prev, _g.sling.generator.SlingGenerator.CONTEXT_STATEMENT_BLOCK) end
						prev = cc
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpContainerInContext(node, context)
	if not (node ~= nil) then
		do return end
	end
	do
		local prev = nil
		local array = node:getNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local cc = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
					if cc ~= nil then
						do self:dumpNodeInContext(cc, prev, context) end
						prev = cc
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpMemberVariableDeclaration(node)
	local exclude = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
	local isProperty = _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.PROPERTY)
	local isConstant = _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.CONSTANT)
	if isProperty or isConstant then
		do exclude:add(_g.sling.model.Modifier.PUBLIC) end
	else
		do exclude:add(_g.sling.model.Modifier.PRIVATE) end
	end
	if isProperty then
		do self:output("pvar ") end
		do exclude:add(_g.sling.model.Modifier.PROPERTY) end
	elseif isConstant then
		do self:output("const ") end
		do exclude:add(_g.sling.model.Modifier.CONSTANT) end
		do exclude:add(_g.sling.model.Modifier.STATIC) end
		do exclude:add(_g.sling.model.Modifier.FINAL) end
	else
		do self:output("var ") end
	end
	do self:dumpVariableDeclaration(node, exclude, false, nil) end
	do self:output("\n") end
end

function sling.generator.SlingGenerator:dumpExplicitPropertyParameterDeclaration(_function)
	if not (_function ~= nil) then
		do return end
	end
	do
		local pname = nil
		local parameter = _vm:to_table_with_key(_function:getParameter(0), '_isType.sling.model.VariableDeclarationNode')
		if parameter ~= nil then
			pname = parameter:getName()
		end
		if pname ~= nil and not (pname == "value") then
			do self:output("(") end
			do self:output(pname) end
			do self:output(")") end
		end
	end
end

function sling.generator.SlingGenerator:dumpEventDeclaration(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output("event ") end
	do self:output(node:getName()) end
	do
		local exclude = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
		do exclude:add(_g.sling.model.Modifier.PUBLIC) end
		do self:dumpCommonModifiers(node, exclude) end
		do self:output(" as ") end
		do self:dumpDataType(node:getType()) end
		do self:dumpAnnotationModifiers(node, nil) end
		do self:output("\n") end
		do self:output("{\n") end
		do
			local desc = node:getDescription()
			if _g.jk.lang.String:isNotEmpty(desc) then
				do self:output("description ") end
				do self:outputLongStringWithWrapping(desc) end
			end
			do
				local body = node:getBody()
				if body ~= nil then
					local array = body:getNodes()
					if array ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(array)
						do
							n = 0
							while n < m do
								local child = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
								if child ~= nil then
									if (_vm:to_table_with_key(child, '_isType.sling.model.EventAddFunctionDeclarationNode') ~= nil) then
										local f = child
										do self:output("add") end
										do self:dumpExplicitPropertyParameterDeclaration(f) end
										do self:dumpControlStructureBlock(f:getBody()) end
									elseif (_vm:to_table_with_key(child, '_isType.sling.model.EventRemoveFunctionDeclarationNode') ~= nil) then
										local f = child
										do self:output("remove") end
										do self:dumpExplicitPropertyParameterDeclaration(f) end
										do self:dumpControlStructureBlock(f:getBody()) end
									else
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. child:getNodeTypeName() .. "' in context `" .. "event declaration" .. "'", child, nil))
									end
								end
								do n = n + 1 end
							end
						end
					end
				end
				do self:output("}\n") end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpEventDeclarationHeader(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output("event ") end
	do self:output(node:getName()) end
	do
		local exclude = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
		do exclude:add(_g.sling.model.Modifier.PUBLIC) end
		do self:dumpCommonModifiers(node, exclude) end
		do self:output(" as ") end
		do self:dumpDataType(node:getType()) end
		do self:dumpAnnotationModifiers(node, nil) end
		do self:output("\n") end
		do self:output("{\n") end
		do self:output("}\n") end
	end
end

function sling.generator.SlingGenerator:dumpPropertyDeclaration(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output("property ") end
	do self:output(node:getName()) end
	do
		local bvn = node:getBackingVariableName()
		if _g.jk.lang.String:isNotEmpty(bvn) then
			do self:output(":") end
			do self:output(bvn) end
		end
		do
			local exclude = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
			do exclude:add(_g.sling.model.Modifier.PUBLIC) end
			do self:dumpCommonModifiers(node, exclude) end
			do self:output(" as ") end
			do self:dumpDataType(node:getType()) end
			do self:dumpAnnotationModifiers(node, nil) end
			do
				local init = node:getInitializer()
				if init ~= nil then
					do self:output(" = ") end
					do self:dumpExpression(init, nil, false) end
				end
				do self:output("\n") end
				do self:output("{\n") end
				do
					local desc = node:getDescription()
					if _g.jk.lang.String:isNotEmpty(desc) then
						do self:output("description ") end
						do self:outputLongStringWithWrapping(desc) end
					end
					do
						local body = node:getBody()
						if body ~= nil then
							local array = body:getNodes()
							if array ~= nil then
								local n = 0
								local m = _g.jk.lang.Vector:getSize(array)
								do
									n = 0
									while n < m do
										local child = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
										if child ~= nil then
											if (_vm:to_table_with_key(child, '_isType.sling.model.PropertySetFunctionDeclarationNode') ~= nil) then
												local setter = child
												do self:output("set") end
												do self:dumpExplicitPropertyParameterDeclaration(setter) end
												do self:dumpControlStructureBlock(setter:getBody()) end
											elseif (_vm:to_table_with_key(child, '_isType.sling.model.PropertyGetFunctionDeclarationNode') ~= nil) then
												local getter = child
												do self:output("get") end
												do self:dumpControlStructureBlock(getter:getBody()) end
											elseif (_vm:to_table_with_key(child, '_isType.sling.model.PropertyInitializeFunctionDeclarationNode') ~= nil) then
												local init = child
												do self:output("init") end
												do self:dumpControlStructureBlock(init:getBody()) end
											elseif (_vm:to_table_with_key(child, '_isType.sling.model.PropertyWillSetFunctionDeclarationNode') ~= nil) then
												local willset = child
												do self:output("willset") end
												do self:dumpExplicitPropertyParameterDeclaration(willset) end
												do self:dumpControlStructureBlock(willset:getBody()) end
											elseif (_vm:to_table_with_key(child, '_isType.sling.model.PropertyDidSetFunctionDeclarationNode') ~= nil) then
												local didset = child
												do self:output("didset") end
												do self:dumpExplicitPropertyParameterDeclaration(didset) end
												do self:dumpControlStructureBlock(didset:getBody()) end
											else
												_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. child:getNodeTypeName() .. "' in context `" .. "property declaration" .. "'", child, nil))
											end
										end
										do n = n + 1 end
									end
								end
							end
						end
						do self:output("}\n") end
					end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpPropertyDeclarationHeader(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output("property ") end
	do self:output(node:getName()) end
	do
		local exclude = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
		do exclude:add(_g.sling.model.Modifier.PUBLIC) end
		do self:dumpCommonModifiers(node, exclude) end
		do self:output(" as ") end
		do self:dumpDataType(node:getType()) end
		do self:dumpAnnotationModifiers(node, nil) end
		do self:output(" {") end
		do
			local hasset = false
			local hasget = false
			local body = node:getBody()
			if body ~= nil then
				local array = body:getNodes()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local child = array[n + 1]
							if child ~= nil then
								if (_vm:to_table_with_key(child, '_isType.sling.model.PropertySetFunctionDeclarationNode') ~= nil) then
									hasset = true
								elseif (_vm:to_table_with_key(child, '_isType.sling.model.PropertyGetFunctionDeclarationNode') ~= nil) then
									hasget = true
								end
							end
							do n = n + 1 end
						end
					end
				end
			end
			if hasset then
				do self:output(" hasset") end
			end
			if hasget then
				do self:output(" hasget") end
			end
			if hasset or hasget then
				do self:output(" ") end
			end
			do self:output("}") end
			do self:output("\n") end
		end
	end
end

function sling.generator.SlingGenerator:dumpAssertStatement(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local child = node:getChild()
		if not (child ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null child", node, _g.jk.lang.StackTrace:generate()))
		end
		if (_vm:to_table_with_key(child, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
			local nl = true
			local eb = node:getErrorBlock()
			if eb ~= nil then
				nl = false
			end
			do self:dumpVariableDeclarationStatement(child, nl, true, eb) end
		elseif (_vm:to_table_with_key(child, '_isType.sling.model.ExpressionNode') ~= nil) then
			do self:output("assert ") end
			do self:dumpExpression(child, nil, false) end
			do
				local eb = node:getErrorBlock()
				if eb ~= nil then
					do self:dumpControlStructureBlock(eb) end
				else
					do self:output("\n") end
				end
			end
		else
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("unsupported assert statement child", child, _g.jk.lang.StackTrace:generate()))
		end
	end
end

function sling.generator.SlingGenerator:dumpPrintLineStatement(node)
	do self:output("println") end
	do
		local xpr = node:getExpression()
		if xpr ~= nil then
			do self:output(" ") end
			do self:dumpExpression(xpr, nil, false) end
		end
		do self:output("\n") end
	end
end

function sling.generator.SlingGenerator:dumpPrintStatement(node)
	do self:output("print") end
	do
		local xpr = node:getExpression()
		if xpr ~= nil then
			do self:output(" ") end
			do self:dumpExpression(xpr, nil, false) end
		end
		do self:output("\n") end
	end
end

function sling.generator.SlingGenerator:dumpReturnStatement(node)
	do self:output("return") end
	do
		local xpr = node:getExpression()
		if xpr ~= nil then
			do self:output(" ") end
			do self:dumpExpression(xpr, nil, false) end
		end
		do self:output("\n") end
	end
end

function sling.generator.SlingGenerator:dumpThrowStatement(node)
	do self:output("throw ") end
	do self:dumpExpression(node:getExpression(), nil, false) end
	do self:output("\n") end
end

function sling.generator.SlingGenerator:dumpForEachStatement(node)
	local lefts = node:getLefts()
	if not (lefts ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No left nodes", node, _g.jk.lang.StackTrace:generate()))
	end
	do
		local right = node:getRight()
		if not (right ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No right node", node, _g.jk.lang.StackTrace:generate()))
		end
		do
			local block = node:getBlock()
			if not (block ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No block", node, _g.jk.lang.StackTrace:generate()))
			end
			do
				local condition = node:getCondition()
				do self:output("foreach ") end
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
									do self:dumpVariableDeclaration(left, nil, false, nil) end
								end
								do n = n + 1 end
							end
						end
					end
					do self:output(" in ") end
					do self:dumpExpression(right, nil, false) end
					if condition ~= nil then
						do self:output(" where ") end
						do self:dumpExpression(condition, nil, false) end
					end
					do self:dumpControlStructureBlock(block) end
					do
						local elseBlock = node:getElseBlock()
						if elseBlock ~= nil then
							do self:output("else") end
							do self:dumpControlStructureBlock(elseBlock) end
						end
					end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpEmbedBlock(node, isStatement)
	local type = node:getType()
	if _g.jk.lang.String:isEmpty(type) then
		type = "unknown"
	end
	do self:output("lang") end
	do self:output(" \"" .. _g.jk.lang.String:safeString(type) .. "\"") end
	do
		local dt = node:getDefaultDataType()
		if dt ~= nil then
			do self:output(" ") end
			do self:dumpDataType(dt) end
		end
		do
			local cc = node:getCode()
			if cc ~= nil then
				cc = _g.jk.lang.String:strip(cc)
				do
					local lines = _g.jk.lang.String:split(cc, 10, 0)
					if dt ~= nil and _g.jk.lang.Vector:getSize(lines) < 2 then
						do self:output(" {{{") end
						do
							local line = _g.jk.lang.Vector:get(lines, 0)
							if line ~= nil then
								do self:output(" " .. _g.jk.lang.String:safeString(line) .. " ") end
							end
						end
					else
						local oi = self:getCurrentIndent()
						do self:output(" {{{\n") end
						if lines ~= nil then
							local n = 0
							local m = _g.jk.lang.Vector:getSize(lines)
							do
								n = 0
								while n < m do
									local line = lines[n + 1]
									if line ~= nil then
										line = _g.jk.lang.String:strip(line)
										do self:output(_g.jk.lang.String:safeString(line) .. "\n") end
									end
									do n = n + 1 end
								end
							end
						end
						do self:setCurrentIndent(oi + 1) end
					end
				end
			else
				do self:output(" {{{ ") end
			end
			do self:output("}}}") end
			if isStatement then
				do self:output("\n") end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpForStatement(node)
	do self:output("for(") end
	do
		local init = node:getInitializer()
		if init ~= nil then
			local first = true
			local array = init:getNodes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local inode = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
						if inode ~= nil then
							if first == false then
								do self:output(", ") end
							end
							first = false
							if (_vm:to_table_with_key(inode, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
								do self:dumpVariableDeclarationStatement(inode, false, false, nil) end
							elseif (_vm:to_table_with_key(inode, '_isType.sling.model.ExpressionNode') ~= nil) then
								do self:dumpExpression(inode, nil, false) end
							elseif (_vm:to_table_with_key(inode, '_isType.sling.model.EmptyStatementNode') ~= nil) then
							else
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unknown initializer in `for' node.", inode, _g.jk.lang.StackTrace:generate()))
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
		do self:output(" ; ") end
		do
			local cond = node:getCondition()
			if not (cond ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null condition", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(cond, nil, false) end
			do self:output(" ; ") end
			do
				local ff = node:getFinalizer()
				if ff ~= nil then
					local first = true
					local array2 = ff:getNodes()
					if array2 ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(array2)
						do
							n2 = 0
							while n2 < m2 do
								local fnode = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
								if fnode ~= nil then
									if first == false then
										do self:output(", ") end
									end
									first = false
									if (_vm:to_table_with_key(fnode, '_isType.sling.model.ExpressionNode') ~= nil) then
										do self:dumpExpression(fnode, nil, false) end
									else
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unknown node in finalizer", fnode, _g.jk.lang.StackTrace:generate()))
									end
								end
								do n2 = n2 + 1 end
							end
						end
					end
				end
				do self:output(")") end
				do self:dumpControlStructureBlock(node:getBlock()) end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpErrorStatement(node)
	local msg = node:getMessage()
	if _g.jk.lang.String:isNotEmpty(msg) then
		do self:output("ERROR \"" .. _g.jk.lang.String:safeString(_g.sling.common.CodeStringUtil:escapeStringLiteralCStyle(msg)) .. "\"\n") end
	end
end

function sling.generator.SlingGenerator:dumpBaseTypeNode(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local type = node:getInheritType()
		if type == _g.sling.model.BaseTypeNode.INHERIT_AUTO then
			do self:output("is ") end
		elseif type == _g.sling.model.BaseTypeNode.INHERIT_EXTEND then
			do self:output("extend ") end
		elseif type == _g.sling.model.BaseTypeNode.INHERIT_IMPLEMENT then
			do self:output("implement ") end
		elseif type == _g.sling.model.BaseTypeNode.INHERIT_INFORMATIVE then
			do self:output("isAlso ") end
		else
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported base type node type: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(type)) .. "'", node, _g.jk.lang.StackTrace:generate()))
		end
		do
			local dt = node:getReferenceType()
			if not (dt ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No data type for base type node", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpDataType(dt) end
			do self:output("\n") end
		end
	end
end

function sling.generator.SlingGenerator:dumpDependencyDeclaration(node)
	do self:output("depend ") end
	do
		local value = node:getValue()
		if not (value ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null value", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("\"" .. _g.jk.lang.String:safeString(_g.sling.common.CodeStringUtil:escapeStringLiteralCStyle(value)) .. "\"\n") end
	end
end

function sling.generator.SlingGenerator:getVariableDeclarationType(node)
	if not (node ~= nil) then
		do return 0 end
	end
	if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.CONSTANT) then
		do return 1 end
	end
	if _g.sling.util.ModifierUtil:hasCommonModifier(node, _g.sling.model.Modifier.PROPERTY) then
		do return 2 end
	end
	do return 3 end
end

function sling.generator.SlingGenerator:dumpNodeInContext(node, previousNode, context)
	if context == _g.sling.generator.SlingGenerator.CONTEXT_CLASS or context == _g.sling.generator.SlingGenerator.CONTEXT_INTERFACE or context == _g.sling.generator.SlingGenerator.CONTEXT_NAMESPACE or context == _g.sling.generator.SlingGenerator.CONTEXT_ENUM or context == _g.sling.generator.SlingGenerator.CONTEXT_SCRIPT then
		if previousNode == nil then
		elseif _g.jk.lang.String:equals(previousNode:getNodeTypeName(), node:getNodeTypeName()) == false then
			do self:output("\n") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationBaseNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.EntityDeclarationNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.PropertyDeclarationNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.EventDeclarationNode') ~= nil) then
			do self:output("\n") end
		elseif (_vm:to_table_with_key(previousNode, '_isType.sling.model.VariableDeclarationNode') ~= nil) and (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) and context ~= _g.sling.generator.SlingGenerator.CONTEXT_ENUM then
			local t1 = self:getVariableDeclarationType(previousNode)
			local t2 = self:getVariableDeclarationType(node)
			if t1 ~= t2 then
				do self:output("\n") end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PreprocessorIfStatementNode') ~= nil) then
		do self:dumpPreprocessorIfStatement(node, false, context) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SwitchStatementNode') ~= nil) then
		do self:dumpSwitchStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ErrorStatementNode') ~= nil) then
		do self:dumpErrorStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ForStatementNode') ~= nil) then
		do self:dumpForStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.WhileStatementNode') ~= nil) then
		do self:dumpWhileStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TryCatchStatementNode') ~= nil) then
		do self:dumpTryCatchStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EmbedBlockNode') ~= nil) then
		do self:dumpEmbedBlock(node, true) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DoWhileStatementNode') ~= nil) then
		do self:dumpDoWhileStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TemplateStatementNode') ~= nil) then
		local temp = node
		do self:output("TEMPLATE \"") end
		do
			local name = temp:getName()
			if name ~= nil then
				do self:output(name) end
			end
			do self:output("\" ") end
			do self:dumpSymbol(temp:getSymbol(), true) end
			do self:output("\n") end
			do
				local relativeTo = temp:getRelativeTo()
				if name ~= nil and relativeTo ~= nil then
					do self:writeRelativeFileToRelativeFile(relativeTo, name) end
				end
				do return end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TypeAliasDeclarationNode') ~= nil) then
		do self:dumpTypeAliasDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.UIExpressionNode') ~= nil) then
		do self:dumpUIExpressionNodeInClass(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ImportStaticMemberStatementNode') ~= nil) then
		do self:dumpImportStaticMemberStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ImportPackageStatementNode') ~= nil) then
		do self:dumpImportPackageStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ImportEntityStatementNode') ~= nil) then
		do self:dumpImportEntityStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DependencyDeclarationNode') ~= nil) then
		do self:dumpDependencyDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BaseTypeNode') ~= nil) then
		do self:dumpBaseTypeNode(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CommentNode') ~= nil) then
		do self:dumpComment(node, true) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EnumValueNode') ~= nil) then
		do self:dumpEnumValue(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EntityDeclarationNode') ~= nil) then
		do self:dumpEntityDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BreakStatementNode') ~= nil) then
		do self:output("break\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ContinueStatementNode') ~= nil) then
		do self:output("continue\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EmptyStatementNode') ~= nil) then
		do self:output(";\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BlockNode') ~= nil) then
		do self:dumpStandaloneBlock(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ExpressionNode') ~= nil) then
		do self:dumpExpression(node, nil, false) end
		do self:output("\n") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationNode') ~= nil) then
		if context == _g.sling.generator.SlingGenerator.CONTEXT_CLASS or context == _g.sling.generator.SlingGenerator.CONTEXT_INTERFACE then
			do self:dumpMemberVariableDeclaration(node) end
		else
			do self:dumpVariableDeclarationStatement(node, true, false, nil) end
		end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PropertyDeclarationNode') ~= nil) then
		do self:dumpPropertyDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EventDeclarationNode') ~= nil) then
		do self:dumpEventDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AssertStatementNode') ~= nil) then
		do self:dumpAssertStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PrintLineStatementNode') ~= nil) then
		do self:dumpPrintLineStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PrintStatementNode') ~= nil) then
		do self:dumpPrintStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ReturnStatementNode') ~= nil) then
		do self:dumpReturnStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.IfStatementNode') ~= nil) then
		do self:dumpIfStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ForEachStatementNode') ~= nil) then
		do self:dumpForEachStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ThrowStatementNode') ~= nil) then
		do self:dumpThrowStatement(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MainFunctionDeclarationNode') ~= nil) then
		do self:dumpMainFunctionDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ext.NSlingWebApiRequestHandlerFunctionDeclaration') ~= nil) then
		do self:dumpWebApiRequestHandlerFunction(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StaticBlockDeclarationNode') ~= nil) then
		do self:dumpStaticBlockDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationBaseNode') ~= nil) then
		do self:dumpFunctionDeclaration(node, false) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.InitializerBlockDeclarationNode') ~= nil) then
		do self:dumpInitializerBlockDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CriticalSectionBlockNode') ~= nil) then
		local nn = node
		do self:output("critical") end
		do
			local obj = nn:getObject()
			if obj ~= nil then
				do self:output("(") end
				do self:dumpExpression(obj, nil, false) end
				do self:output(")") end
			end
			do self:dumpControlStructureBlock(nn:getBlock()) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MultipleVariableDeclarationNode') ~= nil) then
		do self:dumpMultipleVariableDeclarationStatement(node, true, false, nil) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ExternalImplementationReferenceNode') ~= nil) then
		do self:dumpExternalImplementationReference(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.RegionDeclarationNode') ~= nil) then
		do self:dumpRegionDeclaration(node, context) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.WithStatementNode') ~= nil) then
		do self:dumpWithStatementNode(node, context) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.NamespaceNode') ~= nil) then
		do self:dumpNamespaceNode(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.IndexerDeclarationNode') ~= nil) then
		do self:dumpIndexerDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TreeDeclarationNode') ~= nil) then
		do self:dumpTreeDeclaration(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StyleSheetDeclarationNode') ~= nil) then
		do self:dumpStyleSheetDeclaration(node) end
		do return end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node `" .. _g.jk.lang.String:safeString(node:getNodeTypeName()) .. "' in context `" .. _g.jk.lang.String:safeString(self:getContextName(context)) .. "'", node, _g.jk.lang.StackTrace:generate()))
end

function sling.generator.SlingGenerator:dumpStyleSheetRule(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local first = true
		local array = node:getSelectors()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local selector = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(array[n + 1])
					if selector ~= nil then
						if not first then
							do self:output(",") end
						end
						do self:output(selector) end
						first = false
					end
					do n = n + 1 end
				end
			end
		end
		do self:output(" {\n") end
		do
			local body = node:getBody()
			if body ~= nil then
				local array2 = body:getNodes()
				if array2 ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(array2)
					do
						n2 = 0
						while n2 < m2 do
							local child = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
							if child ~= nil then
								if (_vm:to_table_with_key(child, '_isType.sling.model.CommentNode') ~= nil) then
									do self:dumpComment(child, true) end
									goto _continue9
								end
								if (_vm:to_table_with_key(child, '_isType.sling.model.StyleSheetRulePropertyNode') ~= nil) then
									local pp = child
									do self:output(pp:getName()) end
									do self:output(" ") end
									do self:dumpExpression(pp:getValue(), nil, false) end
									do self:output("\n") end
									goto _continue9
								end
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. child:getNodeTypeName() .. "' in context `" .. "style sheet rule" .. "'", child, nil))
							end
							::_continue9::
							do n2 = n2 + 1 end
						end
					end
				end
			end
			do self:output("}\n") end
		end
	end
end

function sling.generator.SlingGenerator:dumpStyleSheetBlockContents(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local array = node:getNodes()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local child = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
					if child ~= nil then
						if (_vm:to_table_with_key(child, '_isType.sling.model.CommentNode') ~= nil) then
							do self:dumpComment(child, true) end
							goto _continue10
						end
						if (_vm:to_table_with_key(child, '_isType.sling.model.StyleSheetRuleNode') ~= nil) then
							do self:dumpStyleSheetRule(child) end
							goto _continue10
						end
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. child:getNodeTypeName() .. "' in context `" .. "style sheet" .. "'", child, nil))
					end
					::_continue10::
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpStyleSheetDeclaration(node)
	do self:output("stylesheet") end
	do
		local name = node:getName()
		if _g.jk.lang.String:isNotEmpty(name) then
			do self:output(" ") end
			do self:output(name) end
		end
		do self:output("\n") end
		do self:output("{\n") end
		do self:dumpStyleSheetBlockContents(node:getBody()) end
		do self:output("}\n") end
	end
end

function sling.generator.SlingGenerator:dumpStyleSheetExpression(node)
	do self:output("new stylesheet {\n") end
	do self:dumpStyleSheetBlockContents(node:getBody()) end
	do self:output("}") end
end

function sling.generator.SlingGenerator:dumpIndexerDeclaration(node)
	do self:output("indexer ") end
	do self:dumpFunctionSignatureParameters(node:getParameters()) end
	do
		local type = node:getType()
		if type ~= nil then
			do self:output(" as ") end
			do self:dumpDataType(type) end
		end
		do self:output("\n") end
		do self:output("{\n") end
		do
			local setter = node:getSetter()
			if setter ~= nil then
				do self:output("set") end
				do self:dumpExplicitPropertyParameterDeclaration(setter) end
				do self:dumpControlStructureBlock(setter:getBody()) end
			end
			do
				local getter = node:getGetter()
				if getter ~= nil then
					do self:output("get") end
					do self:dumpControlStructureBlock(getter:getBody()) end
				end
				do self:output("}\n") end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpNamespaceNode(node)
	do self:output("namespace ") end
	do
		local name = node:getName()
		if _g.jk.lang.String:isEmpty(name) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Empty namespace name", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output(name) end
		do self:output("\n") end
		do self:output("{\n") end
		do
			local pp = nil
			local array = node:getNodes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local child = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
						if child ~= nil then
							do self:dumpNodeInContext(child, pp, _g.sling.generator.SlingGenerator.CONTEXT_NAMESPACE) end
							pp = child
						end
						do n = n + 1 end
					end
				end
			end
			do self:output("}\n") end
		end
	end
end

function sling.generator.SlingGenerator:dumpWithStatementNode(node, context)
	do self:output("with ") end
	do
		local xpr = node:getExpression()
		if not (xpr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(xpr, nil, false) end
		do self:output(" {\n") end
		do self:dumpContainerInContext(node:getBlock(), context) end
		do self:output("}\n") end
	end
end

function sling.generator.SlingGenerator:dumpStringLiteralValue(value)
	do self:output("\"" .. _g.jk.lang.String:safeString(_g.sling.common.CodeStringUtil:escapeStringLiteralCStyle(value)) .. "\"") end
end

function sling.generator.SlingGenerator:dumpRegionDeclaration(node, context)
	do self:output("region") end
	do
		local name = node:getName()
		if _g.jk.lang.String:isNotEmpty(name) then
			do self:output(" " .. _g.jk.lang.String:safeString(name)) end
		end
		do
			local desc = node:getDescription()
			if _g.jk.lang.String:isNotEmpty(desc) then
				do self:output(" ") end
				do self:dumpStringLiteralValue(desc) end
			end
			do self:output("\n") end
			do self:output("{\n") end
			do self:dumpContainerInContext(node, context) end
			do self:output("}\n") end
		end
	end
end

function sling.generator.SlingGenerator:dumpExternalImplementationReference(node)
	do self:output("externalImplementation {\n") end
	do
		local data = node:getData()
		if data ~= nil then
			local array = data:getKeys()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local key = array[n + 1]
						if key ~= nil then
							do self:output(key) end
							do
								local value = data:getString(key, nil)
								if not (value ~= nil) then
									value = ""
								end
								do self:dumpStringLiteralValue(value) end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
		do self:output("}\n") end
	end
end

function sling.generator.SlingGenerator:dumpSwitchStatement(node)
	local xp = node:getExpression()
	if not (xp ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
	end
	do self:output("switch(") end
	do self:dumpExpression(xp, nil, false) end
	do self:output(") {\n") end
	do
		local array = node:getBlocks()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local cbnn = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.CaseBlockNode')
					if cbnn ~= nil then
						local xpr = nil
						if (_vm:to_table_with_key(cbnn, '_isType.sling.model.CaseEqualsBlockNode') ~= nil) then
							do self:output("case ") end
							xpr = cbnn:getExpression()
						elseif (_vm:to_table_with_key(cbnn, '_isType.sling.model.CaseNotEqualsBlockNode') ~= nil) then
							do self:output("case != ") end
							xpr = cbnn:getExpression()
						elseif (_vm:to_table_with_key(cbnn, '_isType.sling.model.CaseLessThanBlockNode') ~= nil) then
							do self:output("case < ") end
							xpr = cbnn:getExpression()
						elseif (_vm:to_table_with_key(cbnn, '_isType.sling.model.CaseLessOrEqualBlockNode') ~= nil) then
							do self:output("case <= ") end
							xpr = cbnn:getExpression()
						elseif (_vm:to_table_with_key(cbnn, '_isType.sling.model.CaseGreaterThanBlockNode') ~= nil) then
							do self:output("case > ") end
							xpr = cbnn:getExpression()
						elseif (_vm:to_table_with_key(cbnn, '_isType.sling.model.CaseGreaterOrEqualBlockNode') ~= nil) then
							do self:output("case >= ") end
							xpr = cbnn:getExpression()
						elseif (_vm:to_table_with_key(cbnn, '_isType.sling.model.CaseRangeBlockNode') ~= nil) then
							local rnge = cbnn
							do self:output("case ") end
							do
								local from = rnge:getLowerBound()
								if not (from ~= nil) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Case range block has no from expression", cbnn, _g.jk.lang.StackTrace:generate()))
								end
								do self:dumpExpression(from, nil, false) end
								do
									local type = rnge:getExclusionType()
									if type == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_BOTH_BOUNDS then
										do self:output(">.<") end
									elseif type == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_UPPER_BOUND then
										do self:output("..<") end
									elseif type == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_LOWER_BOUND then
										do self:output(">..") end
									else
										do self:output("...") end
									end
									do
										local to = rnge:getUpperBound()
										if not (to ~= nil) then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Case range block has no to expression", cbnn, _g.jk.lang.StackTrace:generate()))
										end
										do self:dumpExpression(to, nil, false) end
									end
								end
							end
						elseif (_vm:to_table_with_key(cbnn, '_isType.sling.model.CaseMultipleEqualsBlockNode') ~= nil) then
							do self:output("case ") end
							do
								local exps = cbnn:getExpressions()
								if _g.jk.lang.Vector:isEmpty(exps) then
									_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Case multiple equals block has no expressions", cbnn, _g.jk.lang.StackTrace:generate()))
								end
								do
									local first = true
									if exps ~= nil then
										local n2 = 0
										local m2 = _g.jk.lang.Vector:getSize(exps)
										do
											n2 = 0
											while n2 < m2 do
												local expr = _vm:to_table_with_key(exps[n2 + 1], '_isType.sling.model.ExpressionNode')
												if expr ~= nil then
													if not first then
														do self:output(", ") end
													end
													first = false
													do self:dumpExpression(expr, nil, false) end
												end
												do n2 = n2 + 1 end
											end
										end
									end
								end
							end
						elseif (_vm:to_table_with_key(cbnn, '_isType.sling.model.CaseDefaultBlockNode') ~= nil) then
							do self:output("default") end
						end
						if xpr ~= nil then
							do self:dumpExpression(xpr, nil, false) end
						end
						do self:output(" {\n") end
						do
							local block = cbnn:getBlock()
							if not (block ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null block", cbnn, _g.jk.lang.StackTrace:generate()))
							end
							do self:dumpStatementContainer(block) end
							do self:output("}\n") end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do self:output("}\n") end
	end
end

function sling.generator.SlingGenerator:dumpEnumValue(node)
	if not (node ~= nil) then
		do return end
	end
	do self:output(node:getName()) end
	do
		local value = node:getValue()
		if value ~= nil then
			do self:output(" = ") end
			do self:dumpExpression(value, nil, false) end
		end
		do self:output("\n") end
	end
end

function sling.generator.SlingGenerator:dumpVariableDeclarationStatement(node, outputNL, isAssert, errorBlock)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null variable declaration statement", nil, _g.jk.lang.StackTrace:generate()))
	end
	do self:output("var ") end
	do self:dumpVariableDeclaration(node, nil, isAssert, errorBlock) end
	if outputNL then
		do self:output("\n") end
	end
end

function sling.generator.SlingGenerator:dumpMultipleVariableDeclarationStatement(node, outputNL, isAssert, errorBlock)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null variable declaration statement", nil, _g.jk.lang.StackTrace:generate()))
	end
	do self:output("var ") end
	do
		local variables = node:getVariables()
		local isFirst = true
		if variables ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(variables)
			do
				n = 0
				while n < m do
					local variable = _vm:to_table_with_key(variables[n + 1], '_isType.sling.model.VariableDeclarationNode')
					if variable ~= nil then
						if not isFirst then
							do self:output(", ") end
						end
						do self:dumpVariableDeclaration(variable, nil, isAssert, errorBlock) end
						isFirst = false
					end
					do n = n + 1 end
				end
			end
		end
		do
			local init = node:getInitializer()
			if init ~= nil then
				do self:output(" = ") end
				do self:dumpExpression(init, nil, false) end
			end
			if outputNL then
				do self:output("\n") end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpHeaderVariableDeclaration(node, useQualifiedName)
	local name = nil
	if useQualifiedName then
		name = _g.sling.util.NodeUtil:getQualifiedNameString(node, 46)
	else
		name = node:getNodeName()
	end
	if not (name ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Variable declaration has no name", node, _g.jk.lang.StackTrace:generate()))
	end
	do self:output("var ") end
	do self:output(name) end
	do self:dumpCommonModifiers(node, nil) end
	do
		local type = node:getType()
		if not (type ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.AutomaticDataTypeNode') ~= nil) then
			type = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(node:getInitializer(), nil)
			if not (type ~= nil) then
				type = _g.sling.model.DynamicDataTypeNode._construct0(_g.sling.model.DynamicDataTypeNode._create())
			end
		end
		do self:output(" as ") end
		do self:dumpDataType(type) end
		do self:dumpAnnotationModifiers(node, nil) end
		do self:output("\n") end
	end
end

function sling.generator.SlingGenerator:dumpVariableDeclaration(node, excludeModifiers, isAssert, errorBlock)
	local name = node:getNodeName()
	if not (name ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Variable declaration has no name", node, _g.jk.lang.StackTrace:generate()))
	end
	do self:output(name) end
	do self:dumpCommonModifiers(node, excludeModifiers) end
	do
		local init = node:getInitializer()
		local type = node:getType()
		local isDefaultType = false
		if type ~= nil and (_vm:to_table_with_key(type, '_isType.sling.model.AutomaticDataTypeNode') ~= nil) then
			isDefaultType = true
		elseif type ~= nil and (_vm:to_table_with_key(type, '_isType.sling.model.DynamicDataTypeNode') ~= nil) and not (init ~= nil) then
			isDefaultType = true
		end
		if type ~= nil and isDefaultType == false then
			do self:output(" as ") end
			do self:dumpDataType(type) end
		end
		do self:dumpAnnotationModifiers(node, nil) end
		if init ~= nil then
			do self:output(" = ") end
			if isAssert then
				do self:output("assert ") end
			end
			do self:dumpExpression(init, nil, false) end
			if errorBlock ~= nil then
				do self:dumpControlStructureBlock(errorBlock) end
			end
		end
	end
end

function sling.generator.SlingGenerator:getOperatorPrecedence(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.PostDecrementExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.PostIncrementExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.SubscriptExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.MemberAccessExpressionNode') ~= nil) then
		do return 1 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PreDecrementExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.PreIncrementExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.NegativeNumberExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.PositiveNumberExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.LogicalNotExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseNotExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.StaticCastExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.DynamicCastExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.GetExpressionTypeinfoExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.GetDatatypeTypeinfoExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.GetSizeExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.DataTypeDefaultValueExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.AwaitExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.PromiseExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.GetAddressExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.GetReferenceExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.GetValueExpressionNode') ~= nil) then
		do return 2 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MultiplicationExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.DivisionExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.ModuloExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.RangeExpressionNode') ~= nil) then
		do return 3 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AdditionExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.SubtractionExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.StringConcatenationExpressionNode') ~= nil) then
		do return 4 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ShiftLeftExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.ShiftRightExpressionNode') ~= nil) then
		do return 5 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AllocateBufferExpressionNode') ~= nil) then
		do return 6 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ComparisonExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.TypeCheckExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.MembershipCheckExpressionNode') ~= nil) then
		do return 7 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EqualsExpressionNode') ~= nil) or (_vm:to_table_with_key(node, '_isType.sling.model.NotEqualsExpressionNode') ~= nil) then
		do return 8 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseAndExpressionNode') ~= nil) then
		do return 9 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseXorExpressionNode') ~= nil) then
		do return 10 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseOrExpressionNode') ~= nil) then
		do return 11 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LogicalAndExpressionNode') ~= nil) then
		do return 12 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LogicalXorExpressionNode') ~= nil) then
		do return 13 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LogicalOrExpressionNode') ~= nil) then
		do return 14 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DynamicAndExpressionNode') ~= nil) then
		do return 15 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DynamicXorExpressionNode') ~= nil) then
		do return 16 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DynamicOrExpressionNode') ~= nil) then
		do return 17 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ConditionalExpressionNode') ~= nil) then
		do return 18 end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AssignmentExpressionBaseNode') ~= nil) then
		do return 19 end
	end
	do return 0 end
end

function sling.generator.SlingGenerator:isLowerPriority(node, parent, isRvalue)
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

function sling.generator.SlingGenerator:dumpExpression(node, parent, isRvalue)
	local lower = self:isLowerPriority(node, parent, isRvalue)
	if lower then
		do self:output("(") end
	end
	do self:doDumpExpression(node, parent) end
	if lower then
		do self:output(")") end
	end
end

function sling.generator.SlingGenerator:dumpLongString(value)
	if not (value ~= nil) then
		do return end
	end
	do self:output("[[\n") end
	do
		local indent = self:getCurrentIndent()
		local array = _g.jk.lang.String:split(value, 10, 0)
		if array ~= nil then
			local n2 = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n2 = 0
				while n2 < m do
					local line = array[n2 + 1]
					if line ~= nil then
						do
							local n = 0
							while n < indent do
								do self:outputDirect("\t") end
								do n = n + 1 end
							end
						end
						do self:outputDirect(line) end
						do self:outputDirect("\n") end
					end
					do n2 = n2 + 1 end
				end
			end
		end
		do self:output("]]") end
	end
end

function sling.generator.SlingGenerator:dumpMemberAccessExpression(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null node for member access expression", nil, _g.jk.lang.StackTrace:generate()))
	end
	do
		local parent = node:getParentExpression()
		if not (parent ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null parent expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(parent, node, false) end
		do
			local p = node:getChildExpression()
			if not (p ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null child expression", node, _g.jk.lang.StackTrace:generate()))
			end
			if (_vm:to_table_with_key(p, '_isType.sling.model.CreateObjectExpressionNode') ~= nil) or (_vm:to_table_with_key(p, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) and (_vm:to_table_with_key(parent, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) then
				do self:output("\n") end
				do self:output("\t") end
			end
			do self:output(".") end
			do self:dumpExpression(p, node, false) end
		end
	end
end

function sling.generator.SlingGenerator:dumpComparisonOperator(node)
	if (_vm:to_table_with_key(node, '_isType.sling.model.EqualsExpressionNode') ~= nil) then
		do self:output("==") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StringEqualsExpressionNode') ~= nil) then
		do self:output("==") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.NotEqualsExpressionNode') ~= nil) then
		do self:output("!=") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LessThanExpressionNode') ~= nil) then
		do self:output("<") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LessOrEqualExpressionNode') ~= nil) then
		do self:output("<=") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GreaterThanExpressionNode') ~= nil) then
		do self:output(">") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GreaterOrEqualExpressionNode') ~= nil) then
		do self:output(">=") end
		do return end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported comparison operator expression type: `" .. _g.jk.lang.String:safeString(node:getNodeTypeName()) .. "'", node, _g.jk.lang.StackTrace:generate()))
end

function sling.generator.SlingGenerator:dumpArrayLiteral(node, open, close, allowType)
	if not (node ~= nil) then
		do return end
	end
	do self:output(open) end
	if allowType then
		local type = node:getType()
		if type ~= nil then
			do self:dumpDataType(type) end
			do self:output(":") end
		end
	end
	do
		local xprs = node:getExpressions()
		local sz = _g.jk.lang.Vector:getSize(xprs)
		if sz < 1 then
			do self:output(close) end
			do return end
		end
		if sz == 1 then
			do self:output(" ") end
			do self:dumpExpression(_vm:to_table_with_key(_g.jk.lang.Vector:get(xprs, 0), '_isType.sling.model.ExpressionNode'), nil, false) end
			do self:output(" " .. _g.jk.lang.String:safeString(close)) end
			do return end
		end
		do self:output("\n") end
		do self:adjustIndent(1) end
		do
			local first = true
			if xprs ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(xprs)
				do
					n = 0
					while n < m do
						local xpr = _vm:to_table_with_key(xprs[n + 1], '_isType.sling.model.ExpressionNode')
						if xpr ~= nil then
							if first == false then
								do self:output(",\n") end
							end
							do self:dumpExpression(xpr, nil, false) end
							first = false
						end
						do n = n + 1 end
					end
				end
			end
			do self:output("\n") end
			do self:output(close) end
		end
	end
end

function sling.generator.SlingGenerator:shouldDumpAbsoluteSymbol(symbol)
	if not (symbol ~= nil) then
		do return true end
	end
	do
		local pp = _vm:to_table_with_key(symbol:getParent(), '_isType.sling.model.MemberAccessExpressionNode')
		if not (pp ~= nil) then
			do return true end
		end
		if pp:getChildExpression() == symbol then
			do return false end
		end
		if pp:getParentExpression() == symbol and (_vm:to_table_with_key(pp:getParent(), '_isType.sling.model.MemberAccessExpressionNode') ~= nil) then
			do return false end
		end
		do return true end
	end
end

function sling.generator.SlingGenerator:doDumpExpression(node, parent)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Null node for expression node", nil, _g.jk.lang.StackTrace:generate()))
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LiteralExpressionNode') ~= nil) then
		if (_vm:to_table_with_key(node, '_isType.sling.model.NullLiteralExpressionNode') ~= nil) then
			do self:output("null") end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.BooleanLiteralExpressionNode') ~= nil) then
			local vv = node:getValue()
			if vv then
				do self:output("true") end
			else
				do self:output("false") end
			end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.StringLiteralExpressionNode') ~= nil) then
			local slit = node
			if slit:getIsLongString() then
				do self:dumpLongString(slit:getValue()) end
			else
				do self:output("\"" .. _g.jk.lang.String:safeString(_g.sling.common.CodeStringUtil:escapeStringLiteralCStyle(slit:getValue())) .. "\"") end
			end
			do self:dumpAnnotationModifiers(slit, nil) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.CharacterLiteralExpressionNode') ~= nil) then
			local cc = node:getValue()
			if cc == 39 then
				do self:output("'\\''") end
			elseif cc == 0 then
				do self:output("'\\0'") end
			elseif cc == 7 then
				do self:output("'\\a'") end
			elseif cc == 8 then
				do self:output("'\\b'") end
			elseif cc == 12 then
				do self:output("'\\f'") end
			elseif cc == 10 then
				do self:output("'\\n'") end
			elseif cc == 13 then
				do self:output("'\\r'") end
			elseif cc == 9 then
				do self:output("'\\t'") end
			elseif cc == 11 then
				do self:output("'\\v'") end
			elseif cc == 92 then
				do self:output("'\\\\'") end
			elseif cc == 34 then
				do self:output("'\"'") end
			else
				do self:output("'" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forCharacter(cc)) .. "'") end
			end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.IntegerLiteralExpressionNode') ~= nil) then
			local ilen = node
			local type = ilen:getType()
			local frmt = ilen:getFormat()
			if frmt == _g.sling.model.IntegerLiteralExpressionNode.FORMAT_HEXADECIMAL then
				do self:output("0x" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forIntegerHex(ilen:getValue(), 0))) end
			else
				local v = _g.jk.lang.String:forInteger(ilen:getValue())
				if type == _g.sling.model.IntegerDataTypeNode.TYPE_ULONG or type == _g.sling.model.IntegerDataTypeNode.TYPE_UINT64 then
					v = _g.jk.lang.String:safeString(v) .. "L"
				end
				do self:output(v) end
			end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.DoubleLiteralExpressionNode') ~= nil) then
			local dl = node
			do self:output(_g.jk.lang.String:forDouble(dl:getValue())) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.DecimalLiteralExpressionNode') ~= nil) then
			local dl = node
			do self:output(dl:getValue()) end
			do self:output("M") end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.FloatLiteralExpressionNode') ~= nil) then
			local dl = node
			local v = _g.jk.lang.String:forFloat(dl:getValue())
			if _g.jk.lang.String:getIndexOfCharacter(v, 46, 0) < 0 then
				v = _g.jk.lang.String:safeString(v) .. ".0"
			end
			do self:output(_g.jk.lang.String:safeString(v) .. "f") end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.BufferLiteralExpressionNode') ~= nil) then
			local bval = node:getValue()
			local size = _g.jk.lang.Buffer:getSize(bval)
			local newl = false
			if size > 10 then
				newl = true
				do self:output("new buffer {\n") end
			else
				do self:output("new buffer {") end
			end
			do
				local c = 1
				local i = 0
				while true do
					if i >= size then
						do break end
					end
					if i > 0 then
						do self:output(",") end
					end
					if c <= 10 then
						if i > 0 then
							do self:output(" ") end
						end
					else
						do self:output("\n") end
						c = 0
					end
					do
						local b = _g.jk.lang.String:forIntegerHex(_g.jk.lang.Buffer:getByte(bval, i), 0)
						if _g.jk.lang.String:getLength(b) < 2 then
							b = "0" .. _g.jk.lang.String:safeString(b)
						end
						do self:output("0x" .. _g.jk.lang.String:safeString(b)) end
						do c = c + 1 end
						do i = i + 1 end
					end
				end
				if newl then
					do self:output("\n") end
				end
				do self:output("}") end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.MapLiteralExpressionNode') ~= nil) then
			local vals = node:getValues()
			if vals == nil or _g.jk.lang.Vector:getSize(vals) < 1 then
				do self:output("new map {") end
			else
				do self:output("new map {\n") end
			end
			do
				local first = true
				if vals ~= nil then
					local n2 = 0
					local m = _g.jk.lang.Vector:getSize(vals)
					do
						n2 = 0
						while n2 < m do
							local val = _vm:to_table_with_key(vals[n2 + 1], '_isType.sling.model.KeyValueNode')
							if val ~= nil then
								if first == false then
									do self:output(",\n") end
								end
								first = false
								do
									local key = val:getKey()
									if not (key ~= nil) then
										_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null key", val, _g.jk.lang.StackTrace:generate()))
									end
									do self:dumpExpression(key, nil, false) end
									do self:output(" : ") end
									do
										local value = val:getValue()
										if not (value ~= nil) then
											_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null value", val, _g.jk.lang.StackTrace:generate()))
										end
										do self:dumpExpression(value, nil, false) end
									end
								end
							end
							do n2 = n2 + 1 end
						end
					end
				end
				if first == false then
					do self:output("\n") end
				end
				do self:output("}") end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.SetLiteralExpressionNode') ~= nil) then
			local vals = node:getValues()
			do self:output("new set {") end
			do
				local multiline = false
				if vals ~= nil and _g.jk.lang.Vector:getSize(vals) > 6 then
					multiline = true
				end
				if multiline then
					do self:output("\n") end
				end
				do
					local n = 0
					if vals ~= nil then
						local n3 = 0
						local m2 = _g.jk.lang.Vector:getSize(vals)
						do
							n3 = 0
							while n3 < m2 do
								local val = _vm:to_table_with_key(vals[n3 + 1], '_isType.sling.model.ExpressionNode')
								if val ~= nil then
									if n == 0 then
										do self:output(" ") end
									elseif multiline and _util:convert_to_integer(n % 6) == 0 then
										do self:output(",\n") end
									else
										do self:output(", ") end
									end
									do self:dumpExpression(val, nil, false) end
									do n = n + 1 end
								end
								do n3 = n3 + 1 end
							end
						end
					end
					if multiline then
						do self:output("\n") end
					else
						do self:output(" ") end
					end
					do self:output("}") end
					do return end
				end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.ArrayLiteralExpressionNode') ~= nil) then
			do self:dumpArrayLiteral(node, "[", "]", true) end
			do return end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.FailureLiteralExpressionNode') ~= nil) then
			do self:output("fail") end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PreprocessorValueExpressionNode') ~= nil) then
		do self:output("VALUE \"") end
		do self:output(node:getVariable()) end
		do self:output("\"") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BaseClassAccessExpressionNode') ~= nil) then
		do self:output("base") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CurrentObjectExpressionNode') ~= nil) then
		do self:output("this") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SymbolExpressionNode') ~= nil) then
		local snode = node
		local ss = snode:getSymbol()
		if not (ss ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No symbol", snode, _g.jk.lang.StackTrace:generate()))
		end
		if _g.sling.util.ModifierUtil:hasCommonModifier(ss, _g.sling.model.Modifier.GLOBAL) then
			do self:output("::") end
		end
		do self:dumpSymbol(ss, self:shouldDumpAbsoluteSymbol(node)) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionCallExpressionNode') ~= nil) then
		local mc = node
		local expr = mc:getExpression()
		if not (expr ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null child expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do
			local tprm = mc:getTrailingParameter()
			do self:dumpExpression(expr, node, false) end
			do self:output("(") end
			do
				local first = true
				local array = mc:getParameters()
				if array ~= nil then
					local n4 = 0
					local m3 = _g.jk.lang.Vector:getSize(array)
					do
						n4 = 0
						while n4 < m3 do
							local param = _vm:to_table_with_key(array[n4 + 1], '_isType.sling.model.ExpressionNode')
							if param ~= nil then
								if first == false then
									do self:output(", ") end
								end
								first = false
								do self:dumpExpression(param, nil, false) end
							end
							do n4 = n4 + 1 end
						end
					end
				end
				if tprm ~= nil then
					local fxpr = _vm:to_table_with_key(tprm, '_isType.sling.model.FunctionDeclarationExpressionNode')
					if not (fxpr ~= nil) then
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("trailing parameter is not a function declaration expression", tprm, _g.jk.lang.StackTrace:generate()))
					end
					do
						local fdec = fxpr:getDeclaration()
						if not (fdec ~= nil) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("no function declaration for function declaration expression", fxpr, _g.jk.lang.StackTrace:generate()))
						end
						do self:output(") ") end
						do self:dumpFunctionDeclaration(fdec, true) end
					end
				else
					do self:output(")") end
				end
				do return end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MemberAccessExpressionNode') ~= nil) then
		do self:dumpMemberAccessExpression(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.CreateObjectExpressionNode') ~= nil) then
		local oc = node
		do self:output("new ") end
		do
			local type = oc:getType()
			local typeExpr = oc:getTypeExpression()
			if type ~= nil then
				do self:dumpDataType(type) end
			elseif typeExpr ~= nil then
				do self:dumpExpression(typeExpr, nil, false) end
			else
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Create object expression has no data type", oc, _g.jk.lang.StackTrace:generate()))
			end
			do
				local params = oc:getParameters()
				local opened = false
				if params ~= nil or (_vm:to_table_with_key(type, '_isType.sling.model.ReferenceDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.ThisDataTypeNode') ~= nil) or (_vm:to_table_with_key(type, '_isType.sling.model.ParentDataTypeNode') ~= nil) then
					do self:output("(") end
					opened = true
				end
				if params ~= nil then
					local first = true
					if params ~= nil then
						local n5 = 0
						local m4 = _g.jk.lang.Vector:getSize(params)
						do
							n5 = 0
							while n5 < m4 do
								local param = _vm:to_table_with_key(params[n5 + 1], '_isType.sling.model.ExpressionNode')
								if param ~= nil then
									if first == false then
										do self:output(", ") end
									end
									first = false
									do self:dumpExpression(param, nil, false) end
								end
								do n5 = n5 + 1 end
							end
						end
					end
				end
				if opened then
					do self:output(")") end
				end
				do return end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TypeCheckExpressionNode') ~= nil) then
		local dc = node
		local xp = dc:getExpression()
		if not (xp ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", dc, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(xp, node, false) end
		do self:output(" is ") end
		do
			local dt = dc:getType()
			if not (dt ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null type", dc, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpDataType(dt) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SubscriptExpressionNode') ~= nil) then
		local n = node
		local xp = n:getChild()
		if not (xp ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null child", n, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(xp, node, false) end
		do self:output("[") end
		do
			local ss = n:getSubscript()
			if not (ss ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null subscript", n, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(ss, nil, false) end
			do self:output("]") end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TupleExpressionNode') ~= nil) then
		do self:output("(") end
		do
			local first = true
			local array2 = node:getExpressions()
			if array2 ~= nil then
				local n6 = 0
				local m5 = _g.jk.lang.Vector:getSize(array2)
				do
					n6 = 0
					while n6 < m5 do
						local xpr = _vm:to_table_with_key(array2[n6 + 1], '_isType.sling.model.ExpressionNode')
						if xpr ~= nil then
							if not first then
								do self:output(", ") end
							end
							first = false
							do self:dumpExpression(xpr, nil, false) end
						end
						do n6 = n6 + 1 end
					end
				end
			end
			do self:output(")") end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.MultipleExpressionNode') ~= nil) then
		local exps = node:getExpressions()
		if _g.jk.lang.Vector:isEmpty(exps) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Multiple expression is empty", node, _g.jk.lang.StackTrace:generate()))
		end
		do
			local first = true
			if exps ~= nil then
				local n7 = 0
				local m6 = _g.jk.lang.Vector:getSize(exps)
				do
					n7 = 0
					while n7 < m6 do
						local expr = _vm:to_table_with_key(exps[n7 + 1], '_isType.sling.model.ExpressionNode')
						if expr ~= nil then
							if not first then
								do self:output(", ") end
							end
							first = false
							do self:dumpExpression(expr, nil, false) end
						end
						do n7 = n7 + 1 end
					end
				end
			end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.VariableDeclarationExpressionNode') ~= nil) then
		local vdec = node:getDeclaration()
		if not (vdec ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Variable declaration expression has no declaration", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("var ") end
		do self:dumpVariableDeclaration(vdec, nil, false, nil) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.RangeExpressionNode') ~= nil) then
		local rnge = node
		local from = rnge:getLowerBound()
		if not (from ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Range has no from expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do
			local to = rnge:getUpperBound()
			if not (to ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Range has no to expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(from, node, false) end
			do
				local type = rnge:getExclusionType()
				if type == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_BOTH_BOUNDS then
					do self:output(">.<") end
				elseif type == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_UPPER_BOUND then
					do self:output("..<") end
				elseif type == _g.sling.model.RangeExpressionNode.TYPE_EXCLUDE_LOWER_BOUND then
					do self:output(">..") end
				else
					do self:output("...") end
				end
				do self:dumpExpression(to, node, false) end
				do return end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.NamedParameterExpressionNode') ~= nil) then
		local np = node
		do self:output(np:getName()) end
		do self:output(":") end
		do self:dumpExpression(np:getValue(), nil, false) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EmptyExpressionNode') ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.LogicalNotExpressionNode') ~= nil) then
		do self:output("not ") end
		do
			local xp = node:getExpression()
			if not (xp ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(xp, node, true) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FunctionDeclarationExpressionNode') ~= nil) then
		local _function = node:getDeclaration()
		if not (_function ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null function", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpFunctionDeclaration(_function, true) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BinaryExpressionNode') ~= nil) then
		local be = node
		if (_vm:to_table_with_key(node, '_isType.sling.model.AssignmentExpressionBaseNode') ~= nil) then
			local ae = node
			local left = ae:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left", ae, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(left, node, false) end
			if (_vm:to_table_with_key(ae, '_isType.sling.model.AssignmentExpressionNode') ~= nil) then
				do self:output(" = ") end
			elseif (_vm:to_table_with_key(ae, '_isType.sling.model.AdditionAssignmentExpressionNode') ~= nil) then
				do self:output(" += ") end
			elseif (_vm:to_table_with_key(ae, '_isType.sling.model.SubtractionAssignmentExpressionNode') ~= nil) then
				do self:output(" -= ") end
			elseif (_vm:to_table_with_key(ae, '_isType.sling.model.BitwiseOrAssignmentExpressionNode') ~= nil) then
				do self:output(" |= ") end
			elseif (_vm:to_table_with_key(ae, '_isType.sling.model.BitwiseAndAssignmentExpressionNode') ~= nil) then
				do self:output(" &= ") end
			elseif (_vm:to_table_with_key(ae, '_isType.sling.model.BitwiseXorAssignmentExpressionNode') ~= nil) then
				do self:output(" ^= ") end
			elseif (_vm:to_table_with_key(ae, '_isType.sling.model.DivisionAssignmentExpressionNode') ~= nil) then
				do self:output(" /= ") end
			elseif (_vm:to_table_with_key(ae, '_isType.sling.model.MultiplicationAssignmentExpressionNode') ~= nil) then
				do self:output(" *= ") end
			elseif (_vm:to_table_with_key(ae, '_isType.sling.model.ModuloAssignmentExpressionNode') ~= nil) then
				do self:output(" %= ") end
			elseif (_vm:to_table_with_key(ae, '_isType.sling.model.ShiftLeftAssignmentExpressionNode') ~= nil) then
				do self:output(" <<= ") end
			elseif (_vm:to_table_with_key(ae, '_isType.sling.model.ShiftRightAssignmentExpressionNode') ~= nil) then
				do self:output(" >>= ") end
			else
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported assignment expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do
				local rr = ae:getRight()
				if not (rr ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right", ae, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(rr, node, true) end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.MembershipCheckExpressionNode') ~= nil) then
			local dc = node
			local left = dc:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", dc, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(left, node, false) end
			do self:output(" in ") end
			do
				local right = dc:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null type", dc, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(right, node, false) end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.ComparisonExpressionNode') ~= nil) then
			local ce = node
			local left = ce:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left expression", ce, _g.jk.lang.StackTrace:generate()))
			end
			do
				local right = ce:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right expression", ce, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(left, node, false) end
				do self:output(" ") end
				do self:dumpComparisonOperator(ce) end
				do self:output(" ") end
				do self:dumpExpression(right, node, true) end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.AdditionExpressionNode') ~= nil) then
			local ae = node
			local left = ae:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left", ae, _g.jk.lang.StackTrace:generate()))
			end
			do
				local right = ae:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right", ae, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(left, node, false) end
				do self:output(" + ") end
				do self:dumpExpression(right, node, true) end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.SubtractionExpressionNode') ~= nil) then
			local ae = node
			local left = ae:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left", ae, _g.jk.lang.StackTrace:generate()))
			end
			do
				local right = ae:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right", ae, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(left, node, false) end
				do self:output(" - ") end
				do self:dumpExpression(right, node, true) end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.MultiplicationExpressionNode') ~= nil) then
			local ae = node
			local left = ae:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left", ae, _g.jk.lang.StackTrace:generate()))
			end
			do
				local right = ae:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right", ae, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(left, node, false) end
				do self:output(" * ") end
				do self:dumpExpression(right, node, true) end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.DivisionExpressionNode') ~= nil) then
			local ae = node
			local left = ae:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left", ae, _g.jk.lang.StackTrace:generate()))
			end
			do
				local right = ae:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right", ae, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(left, node, false) end
				do self:output(" / ") end
				do self:dumpExpression(right, node, true) end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.ModuloExpressionNode') ~= nil) then
			local ae = node
			local left = ae:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left", ae, _g.jk.lang.StackTrace:generate()))
			end
			do
				local right = ae:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right", ae, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(left, node, false) end
				do self:output(" % ") end
				do self:dumpExpression(right, node, true) end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.StringConcatenationExpressionNode') ~= nil) then
			local ae = node
			local left = ae:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left", ae, _g.jk.lang.StackTrace:generate()))
			end
			do
				local right = ae:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right", ae, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(left, node, false) end
				do self:output(" .. ") end
				do self:dumpExpression(right, node, true) end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseAndExpressionNode') ~= nil) then
			local be = node
			local left = be:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left expression", be, _g.jk.lang.StackTrace:generate()))
			end
			do
				local right = be:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right expression", be, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(left, node, false) end
				do self:output(" & ") end
				do self:dumpExpression(right, node, true) end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseOrExpressionNode') ~= nil) then
			local be = node
			local left = be:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left expression", be, _g.jk.lang.StackTrace:generate()))
			end
			do
				local right = be:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right expression", be, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(left, node, false) end
				do self:output(" | ") end
				do self:dumpExpression(right, node, true) end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseXorExpressionNode') ~= nil) then
			local be = node
			local left = be:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left expression", be, _g.jk.lang.StackTrace:generate()))
			end
			do
				local right = be:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right expression", be, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(left, node, false) end
				do self:output(" ^ ") end
				do self:dumpExpression(right, node, true) end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.ShiftLeftExpressionNode') ~= nil) then
			local be = node
			local left = be:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left expression", be, _g.jk.lang.StackTrace:generate()))
			end
			do
				local right = be:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right expression", be, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(left, node, false) end
				do self:output(" << ") end
				do self:dumpExpression(right, node, true) end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.ShiftRightExpressionNode') ~= nil) then
			local be = node
			local left = be:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left expression", be, _g.jk.lang.StackTrace:generate()))
			end
			do
				local right = be:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right expression", be, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(left, node, false) end
				do self:output(" >> ") end
				do self:dumpExpression(right, node, true) end
				do return end
			end
		end
		if (_vm:to_table_with_key(node, '_isType.sling.model.LogicalExpressionNode') ~= nil) then
			local le = node
			local left = le:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left expression", le, _g.jk.lang.StackTrace:generate()))
			end
			do
				local right = le:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right expression", le, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(left, node, false) end
				if (_vm:to_table_with_key(le, '_isType.sling.model.LogicalAndExpressionNode') ~= nil) then
					do self:output(" && ") end
				elseif (_vm:to_table_with_key(le, '_isType.sling.model.LogicalXorExpressionNode') ~= nil) then
					do self:output(" ^^ ") end
				elseif (_vm:to_table_with_key(le, '_isType.sling.model.LogicalOrExpressionNode') ~= nil) then
					do self:output(" || ") end
				else
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unknown logical expression node type: `" .. _g.jk.lang.String:safeString(le:getNodeTypeName()) .. "'", le, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(right, node, true) end
				do return end
			end
		end
		if (_vm:to_table_with_key(be, '_isType.sling.model.DynamicAndExpressionNode') ~= nil) or (_vm:to_table_with_key(be, '_isType.sling.model.DynamicXorExpressionNode') ~= nil) or (_vm:to_table_with_key(be, '_isType.sling.model.DynamicOrExpressionNode') ~= nil) then
			local left = be:getLeft()
			if not (left ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null left expression", be, _g.jk.lang.StackTrace:generate()))
			end
			do
				local right = be:getRight()
				if not (right ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null right expression", be, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(left, node, false) end
				if (_vm:to_table_with_key(be, '_isType.sling.model.DynamicAndExpressionNode') ~= nil) then
					do self:output(" &&& ") end
				elseif (_vm:to_table_with_key(be, '_isType.sling.model.DynamicXorExpressionNode') ~= nil) then
					do self:output(" ^^^ ") end
				elseif (_vm:to_table_with_key(be, '_isType.sling.model.DynamicOrExpressionNode') ~= nil) then
					do self:output(" ||| ") end
				else
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unknown dynamic logical expression node type: `" .. _g.jk.lang.String:safeString(be:getNodeTypeName()) .. "'", be, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(right, node, true) end
				do return end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ConditionalExpressionNode') ~= nil) then
		local ce = node
		local cond = ce:getCondition()
		if not (cond ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null condition", ce, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(cond, node, false) end
		do self:output(" ? ") end
		do
			local te = ce:getTrueExpr()
			if not (te ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null true expression", ce, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(te, node, false) end
			do self:output(" : ") end
			do
				local fe = ce:getFalseExpr()
				if not (fe ~= nil) then
					_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null false expression", ce, _g.jk.lang.StackTrace:generate()))
				end
				do self:dumpExpression(fe, node, false) end
				do return end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AwaitExpressionNode') ~= nil) then
		do self:output("await ") end
		do
			local xp = node:getExpression()
			if not (xp ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null await expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(xp, node, false) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GetAddressExpressionNode') ~= nil) then
		do self:output("addr ") end
		do
			local xp = node:getExpression()
			if not (xp ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(xp, node, false) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GetReferenceExpressionNode') ~= nil) then
		do self:output("ref ") end
		do
			local xp = node:getExpression()
			if not (xp ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(xp, node, false) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GetValueExpressionNode') ~= nil) then
		do self:output("val ") end
		do
			local xp = node:getExpression()
			if not (xp ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(xp, node, false) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PositiveNumberExpressionNode') ~= nil) then
		do self:output("+") end
		do
			local xp = node:getExpression()
			if not (xp ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(xp, node, true) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.NegativeNumberExpressionNode') ~= nil) then
		do self:output("-") end
		do
			local xp = node:getExpression()
			if not (xp ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(xp, node, true) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.EmbedBlockNode') ~= nil) then
		do self:dumpEmbedBlock(node, false) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ArrayCreationExpressionNode') ~= nil) then
		local ac = node
		local inits = ac:getDimensions()
		if _g.jk.lang.Vector:isEmpty(inits) then
			inits = {}
			do _g.jk.lang.Vector:append(inits, _g.sling.model.EmptyExpressionNode._construct0(_g.sling.model.EmptyExpressionNode._create())) end
		end
		do
			local lit = ac:getArrayLiteral()
			do self:output("new ") end
			do
				local dt = ac:getPrimaryType()
				if not (dt ~= nil) then
					dt = _g.sling.model.ObjectDataTypeNode._construct0(_g.sling.model.ObjectDataTypeNode._create())
				end
				do self:dumpDataType(dt) end
				if inits ~= nil then
					local n8 = 0
					local m7 = _g.jk.lang.Vector:getSize(inits)
					do
						n8 = 0
						while n8 < m7 do
							local init = _vm:to_table_with_key(inits[n8 + 1], '_isType.sling.model.ExpressionNode')
							if init ~= nil then
								do self:output("[") end
								do self:dumpExpression(init, nil, false) end
								do self:output("]") end
							end
							do n8 = n8 + 1 end
						end
					end
				end
				if lit ~= nil then
					do self:output(" ") end
					do self:dumpArrayLiteral(lit, "{", "}", false) end
				end
				do return end
			end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DynamicCastExpressionNode') ~= nil) then
		local dc = node
		local xp = dc:getExpression()
		if not (xp ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", dc, _g.jk.lang.StackTrace:generate()))
		end
		do
			local type = dc:getType()
			if not (type ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null type", dc, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(xp, node, false) end
			do self:output(" as ") end
			do self:dumpDataType(type) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StaticCastExpressionNode') ~= nil) then
		local sc = node
		local dns = sc:getType()
		if not (dns ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null type", sc, _g.jk.lang.StackTrace:generate()))
		end
		do
			local xp = sc:getExpression()
			if not (xp ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", sc, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(xp, node, false) end
			if (_vm:to_table_with_key(dns, '_isType.sling.model.PrimitiveDataTypeNode') ~= nil) then
				do self:output(" as ") end
			else
				do self:output(" as! ") end
			end
			do self:dumpDataType(dns) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.BitwiseNotExpressionNode') ~= nil) then
		do self:output("~") end
		do
			local xp = node:getExpression()
			if not (xp ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(xp, node, true) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GetSizeExpressionNode') ~= nil) then
		do self:output("sizeof ") end
		do
			local xp = node:getExpression()
			if not (xp ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(xp, nil, false) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PreIncrementExpressionNode') ~= nil) then
		local xp = node:getExpression()
		if not (xp ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("++") end
		do self:dumpExpression(xp, node, true) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PreDecrementExpressionNode') ~= nil) then
		local xp = node:getExpression()
		if not (xp ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:output("--") end
		do self:dumpExpression(xp, node, true) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PostIncrementExpressionNode') ~= nil) then
		local xp = node:getExpression()
		if not (xp ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(xp, node, false) end
		do self:output("++") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.PostDecrementExpressionNode') ~= nil) then
		local xp = node:getExpression()
		if not (xp ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(xp, node, false) end
		do self:output("--") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AllocateBufferExpressionNode') ~= nil) then
		do self:output("malloc ") end
		do self:dumpExpression(node:getExpression(), nil, false) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.AppendToVectorExpressionNode') ~= nil) then
		do self:dumpExpression(node:getLeft(), node, false) end
		do self:output(" += ") end
		do self:dumpExpression(node:getRight(), node, false) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DefaultValueExpressionNode') ~= nil) then
		do self:output("defaultValue") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.DataTypeDefaultValueExpressionNode') ~= nil) then
		do self:output("defaultValue<") end
		do
			local dt = node:getType()
			if not (dt ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No type", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpDataType(dt) end
			do self:output(">") end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.FileSystemReferenceExpressionNode') ~= nil) then
		local nsr = node
		if (_vm:to_table_with_key(node, '_isType.sling.model.FileSystemDirectoryReferenceExpressionNode') ~= nil) then
			do self:output("DIRECTORY ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.FileSystemBinaryFileReferenceExpressionNode') ~= nil) then
			do self:output("FILE ") end
		elseif (_vm:to_table_with_key(node, '_isType.sling.model.FileSystemTextFileReferenceExpressionNode') ~= nil) then
			do self:output("TEXTFILE ") end
		else
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "filesystem reference expression" .. "'", node, nil))
		end
		do self:dumpExpression(_g.sling.model.StringLiteralExpressionNode:forValue(nsr:getName()), nil, false) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GetExpressionTypeinfoExpressionNode') ~= nil) then
		do self:output("typeof ") end
		do
			local xp = node:getExpression()
			if not (xp ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpExpression(xp, nil, false) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.GetDatatypeTypeinfoExpressionNode') ~= nil) then
		do self:output("typeinfo ") end
		do
			local dt = node:getType()
			if not (dt ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("No type", node, _g.jk.lang.StackTrace:generate()))
			end
			do self:dumpDataType(dt) end
			do return end
		end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ForceUnwrapOptionalExpressionNode') ~= nil) then
		local xp = node:getExpression()
		if not (xp ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression inside force unwrap optional expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(xp, node, false) end
		do self:output("!") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.SafeUnwrapOptionalExpressionNode') ~= nil) then
		local xp = node:getExpression()
		if not (xp ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null expression inside force unwrap optional expression", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(xp, node, false) end
		do self:output("?") end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.ClassDeclarationInstantiationExpressionNode') ~= nil) then
		do self:dumpClassDeclarationInstantiationExpressionNode(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.WithStatementExpressionReferenceNode') ~= nil) then
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.TreeExpressionNode') ~= nil) then
		do self:dumpTreeExpression(node) end
		do return end
	end
	if (_vm:to_table_with_key(node, '_isType.sling.model.StyleSheetExpressionNode') ~= nil) then
		do self:dumpStyleSheetExpression(node) end
		do return end
	end
	_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. node:getNodeTypeName() .. "' in context `" .. "expression" .. "'", node, nil))
end

function sling.generator.SlingGenerator:dumpTreeElementAttribute(node)
	local name = node:getName()
	if _g.jk.lang.String:isEmpty(name) then
		do _g.sling.common.RefLog:warning(self.ctx, "Empty attribute name", node) end
	else
		do self:output(name) end
	end
	do self:output("=") end
	do
		local value = node:getValue()
		if not (value ~= nil) then
			value = _g.sling.model.NullLiteralExpressionNode._construct0(_g.sling.model.NullLiteralExpressionNode._create())
		end
		if (_vm:to_table_with_key(value, '_isType.sling.model.StringLiteralExpressionNode') ~= nil) then
			do self:dumpExpression(value, nil, false) end
		else
			do self:output("{") end
			do self:dumpExpression(value, nil, false) end
			do self:output("}") end
		end
	end
end

function sling.generator.SlingGenerator:asSimpleExpression(nodes)
	if not (_g.jk.lang.Vector:getSize(nodes) == 1) then
		do return nil end
	end
	do
		local xpr = _vm:to_table_with_key(_g.jk.lang.Vector:get(nodes, 0), '_isType.sling.model.ExpressionNode')
		if not (xpr ~= nil) then
			do return nil end
		end
		if (_vm:to_table_with_key(xpr, '_isType.sling.model.StringLiteralExpressionNode') ~= nil) then
			local value = xpr:getValue()
			if value ~= nil and _g.jk.lang.String:contains(value, "\n") then
				do return nil end
			end
		end
		do return xpr end
	end
end

function sling.generator.SlingGenerator:dumpTreeElement(node)
	if not (node ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null node in dumpTreeElement", nil, _g.jk.lang.StackTrace:generate()))
	end
	do
		local name = node:getName()
		if _g.jk.lang.String:isEmpty(name) then
			do _g.sling.common.RefLog:warning(self.ctx, "Empty name in node", node) end
		end
		do self:output("<") end
		do self:output(name) end
		do
			local reference = node:getReference()
			if _g.jk.lang.String:isNotEmpty(reference) then
				do self:output(" @") end
				do self:output(reference) end
			end
			do
				local array = node:getAttributes()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local attribute = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.TreeElementAttributeNode')
							if attribute ~= nil then
								do self:output(" ") end
								do self:dumpTreeElementAttribute(attribute) end
							end
							do n = n + 1 end
						end
					end
				end
				do
					local children = node:getChildren()
					if _g.jk.lang.Vector:isEmpty(children) then
						do self:output(" />\n") end
					else
						do self:output(">") end
						do
							local xpr = self:asSimpleExpression(children)
							if xpr ~= nil then
								if (_vm:to_table_with_key(xpr, '_isType.sling.model.StringLiteralExpressionNode') ~= nil) then
									do self:output(xpr:getValue()) end
								else
									do self:output("{") end
									do self:dumpExpression(xpr, nil, false) end
									do self:output("}") end
								end
							else
								do self:output("\n") end
								do self:adjustIndent(1) end
								do self:dumpTreeElementChildren(node) end
								do self:adjustIndent(-1) end
							end
							do self:output("</") end
							do self:output(name) end
							do self:output(">\n") end
						end
					end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpTreeElementChildren(node)
	if not (node ~= nil) then
		do return end
	end
	do
		local children = node:getChildren()
		if not (children ~= nil) then
			do return end
		end
		if children ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(children)
			do
				n = 0
				while n < m do
					local child = _vm:to_table_with_key(children[n + 1], '_isType.sling.common.NodeObject')
					if child ~= nil then
						if (_vm:to_table_with_key(child, '_isType.sling.model.TreeElementNode') ~= nil) then
							do self:dumpTreeElement(child) end
						elseif (_vm:to_table_with_key(child, '_isType.sling.model.StringLiteralExpressionNode') ~= nil) then
							do self:output(child:getValue()) end
							do self:output("\n") end
						elseif (_vm:to_table_with_key(child, '_isType.sling.model.ExpressionNode') ~= nil) then
							do self:output("{") end
							do self:dumpExpression(child, nil, false) end
							do self:output("}\n") end
						else
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. child:getNodeTypeName() .. "' in context `" .. "tree node children" .. "'", child, nil))
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpTreeExpression(node)
	do self:output("new tree {\n") end
	do self:dumpTreeElementChildren(node:getRoot()) end
	do self:output("}") end
end

function sling.generator.SlingGenerator:dumpTreeDeclaration(node)
	do self:output("markup") end
	do
		local name = node:getName()
		if _g.jk.lang.String:isNotEmpty(name) then
			do self:output(" ") end
			do self:output(name) end
		end
		do self:output("\n") end
		do self:output("{\n") end
		do self:dumpTreeElementChildren(node:getRoot()) end
		do self:output("}\n") end
	end
end

function sling.generator.SlingGenerator:dumpClassDeclarationInstantiationExpressionNode(node)
	local cdec = node:getClassDeclaration()
	local params = node:getParameters()
	do self:output("new ") end
	do
		local basetypes = cdec:getBaseTypes()
		if _g.jk.lang.Vector:getSize(basetypes) > 1 then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Multiple basetypes are not supported", node, _g.jk.lang.StackTrace:generate()))
		end
		if basetypes ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(basetypes)
			do
				n = 0
				while n < m do
					local basetype = _vm:to_table_with_key(basetypes[n + 1], '_isType.sling.model.BaseTypeNode')
					if basetype ~= nil then
						do self:dumpDataType(basetype:getReferenceType()) end
					end
					do n = n + 1 end
				end
			end
		end
		if params ~= nil then
			do self:output("(") end
			do
				local first = true
				if params ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(params)
					do
						n2 = 0
						while n2 < m2 do
							local param = _vm:to_table_with_key(params[n2 + 1], '_isType.sling.model.ExpressionNode')
							if param ~= nil then
								if first == false then
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
			end
		end
		do self:output(" {\n") end
		do
			local array = cdec:getNodes()
			if array ~= nil then
				local n3 = 0
				local m3 = _g.jk.lang.Vector:getSize(array)
				do
					n3 = 0
					while n3 < m3 do
						local child = _vm:to_table_with_key(array[n3 + 1], '_isType.sling.common.NodeObject')
						if child ~= nil then
							do self:dumpNodeInContext(child, nil, _g.sling.generator.SlingGenerator.CONTEXT_CLASS) end
						end
						do n3 = n3 + 1 end
					end
				end
			end
			do self:output(" }") end
		end
	end
end

function sling.generator.SlingGenerator:dumpIfStatement(node)
	local cond = node:getCondition()
	if not (cond ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null condition", node, _g.jk.lang.StackTrace:generate()))
		do return end
	end
	do self:output("if ") end
	do self:dumpExpression(cond, nil, false) end
	do
		local ifBlock = node:getIfBlock()
		if not (ifBlock ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null ifBlock", node, _g.jk.lang.StackTrace:generate()))
			do return end
		end
		do self:dumpControlStructureBlock(ifBlock) end
		do
			local eb = node:getElseBlock()
			if eb ~= nil then
				local ebnodes = eb:getNodes()
				if ebnodes ~= nil and _g.jk.lang.Vector:getSize(ebnodes) == 1 and (_vm:to_table_with_key(_g.jk.lang.Vector:get(ebnodes, 0), '_isType.sling.model.IfStatementNode') ~= nil) then
					do self:output("else ") end
					do self:dumpStatementContainer(eb) end
				else
					do self:output("else") end
					do self:dumpControlStructureBlock(eb) end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpTryCatchStatement(node)
	local init = node:getInitializer()
	if init ~= nil then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Initializers in try-catch statements are not supported", node, _g.jk.lang.StackTrace:generate()))
	end
	do self:output("try") end
	do self:dumpControlStructureBlock(node:getTryBlock()) end
	do
		local array = node:getCatchBlocks()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local catchBlock = _vm:to_table_with_key(array[n + 1], '_isType.sling.model.CatchBlockNode')
					if catchBlock ~= nil then
						local block = catchBlock:getBlock()
						if not (block ~= nil) then
							block = _g.sling.model.BlockNode._construct0(_g.sling.model.BlockNode._create())
						end
						do self:output("catch") end
						do
							local first = true
							local array2 = catchBlock:getExceptions()
							if array2 ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(array2)
								do
									n2 = 0
									while n2 < m2 do
										local exception = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.model.VariableDeclarationNode')
										if exception ~= nil then
											if first then
												do self:output(" ") end
											else
												do self:output(", ") end
											end
											first = false
											do self:dumpVariableDeclaration(exception, nil, false, nil) end
										end
										do n2 = n2 + 1 end
									end
								end
							end
							do
								local when = catchBlock:getWhen()
								if when ~= nil then
									do self:output(" when ") end
									do self:dumpExpression(when, nil, false) end
								end
								do self:dumpControlStructureBlock(block) end
							end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do
			local finally = node:getFinallyBlock()
			if finally ~= nil then
				do self:output("finally") end
				do self:dumpControlStructureBlock(finally) end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpWhileStatement(node)
	local cond = node:getCondition()
	if not (cond ~= nil) then
		_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null condition", node, _g.jk.lang.StackTrace:generate()))
		do return end
	end
	if (_vm:to_table_with_key(cond, '_isType.sling.model.BooleanLiteralExpressionNode') ~= nil) and cond:getValue() == true then
		do self:output("loop") end
	else
		do self:output("while ") end
		do self:dumpExpression(cond, nil, false) end
	end
	do self:dumpControlStructureBlock(node:getBlock()) end
	do
		local elseBlock = node:getElseBlock()
		if elseBlock ~= nil then
			do self:output("else") end
			do self:dumpControlStructureBlock(elseBlock) end
		end
	end
end

function sling.generator.SlingGenerator:dumpDoWhileStatement(node)
	do self:output("do {\n") end
	do self:dumpStatementContainer(node:getBlock()) end
	do self:output("}\n") end
	do self:output("while ") end
	do
		local cond = node:getCondition()
		if not (cond ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null condition", node, _g.jk.lang.StackTrace:generate()))
		end
		do self:dumpExpression(cond, nil, false) end
		do self:output("\n") end
	end
end

function sling.generator.SlingGenerator:dumpPreprocessorIfStatement(node, isElif, context)
	if not (node ~= nil) then
		do return end
	end
	do
		local condition = node:getCondition()
		if not (condition ~= nil) then
			_vm:throw_error(_g.sling.common.ReferenceError:forMessage("null condition", node, _g.jk.lang.StackTrace:generate()))
		end
		if isElif then
			do self:output("ELSE ") end
		end
		if (_vm:to_table_with_key(condition, '_isType.sling.model.LogicalNotExpressionNode') ~= nil) then
			do self:output("IFNDEF \"") end
			condition = condition:getExpression()
		else
			do self:output("IFDEF \"") end
		end
		do
			local ifdefCondition = _vm:to_table_with_key(condition, '_isType.sling.model.PreprocessorIsDefinedExpressionNode')
			if not (ifdefCondition ~= nil) then
				_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Condition is not an ifdef condition: `" .. _g.jk.lang.String:safeString(condition:getNodeTypeName()) .. "'", condition, _g.jk.lang.StackTrace:generate()))
			end
			do self:output(ifdefCondition:getVariable()) end
			do self:output("\"") end
			if context == _g.sling.generator.SlingGenerator.CONTEXT_CLASS or context == _g.sling.generator.SlingGenerator.CONTEXT_INTERFACE or context == _g.sling.generator.SlingGenerator.CONTEXT_NAMESPACE then
				do self:output("\n") end
				do self:output("{\n") end
			else
				do self:output(" {\n") end
			end
			do
				local ifBlock = node:getIfBlock()
				if ifBlock ~= nil then
					local prev = nil
					local array = ifBlock:getNodes()
					if array ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(array)
						do
							n = 0
							while n < m do
								local nn = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
								if nn ~= nil then
									do self:dumpNodeInContext(nn, prev, context) end
									prev = nn
								end
								do n = n + 1 end
							end
						end
					end
				end
				do self:output("}\n") end
				do
					local elseBlock = node:getElseBlock()
					if elseBlock ~= nil then
						local enodes = elseBlock:getNodes()
						if enodes ~= nil and _g.jk.lang.Vector:getSize(enodes) == 1 then
							local pp = _vm:to_table_with_key(_g.jk.lang.Vector:get(enodes, 0), '_isType.sling.model.PreprocessorIfStatementNode')
							if pp ~= nil then
								do self:dumpPreprocessorIfStatement(pp, true, context) end
								do return end
							end
						end
						do self:output("ELSE") end
						do self:output(" {\n") end
						do
							local prev2 = nil
							local array2 = elseBlock:getNodes()
							if array2 ~= nil then
								local n2 = 0
								local m2 = _g.jk.lang.Vector:getSize(array2)
								do
									n2 = 0
									while n2 < m2 do
										local nn = _vm:to_table_with_key(array2[n2 + 1], '_isType.sling.common.NodeObject')
										if nn ~= nil then
											do self:dumpNodeInContext(nn, prev2, context) end
											prev2 = nn
										end
										do n2 = n2 + 1 end
									end
								end
							end
							do self:output("}\n") end
						end
					end
				end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpUIExpressionContents(node)
	local array = node:getChildren()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local child = _vm:to_table_with_key(array[n + 1], '_isType.sling.common.NodeObject')
				if child ~= nil then
					if (_vm:to_table_with_key(child, '_isType.sling.model.UIExpressionNode') ~= nil) then
						local cc = child
						local dt = _g.sling.util.ExpressionUtil:tryGetExpressionDataType(cc, nil)
						if dt ~= nil then
							do self:dumpDataType(dt) end
						else
							local xpr = cc:getExpression()
							if not (xpr ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Neither data type nor expression is set. Don't know what to do.", nil, _g.jk.lang.StackTrace:generate()))
							end
							do self:dumpExpression(xpr, nil, false) end
						end
						do
							local name = cc:getName()
							if _g.jk.lang.String:isNotEmpty(name) then
								do self:output(" " .. _g.jk.lang.String:safeString(name)) end
							end
							do
								local lps = cc:getLayoutParams()
								if lps ~= nil and _g.jk.lang.Vector:getSize(lps) > 0 then
									do self:output(" : ") end
									do
										local first = true
										if lps ~= nil then
											local n2 = 0
											local m2 = _g.jk.lang.Vector:getSize(lps)
											do
												n2 = 0
												while n2 < m2 do
													local xpr = _vm:to_table_with_key(lps[n2 + 1], '_isType.sling.model.ExpressionNode')
													if xpr ~= nil then
														if first == false then
															do self:output(", ") end
														end
														do self:dumpExpression(xpr, nil, false) end
														first = false
													end
													do n2 = n2 + 1 end
												end
											end
										end
									end
								end
								do self:output(" {\n") end
								do self:dumpUIExpressionContents(cc) end
								do self:output("}\n") end
							end
						end
					elseif (_vm:to_table_with_key(child, '_isType.sling.model.PropertyValueDeclarationNode') ~= nil) then
						local pdec = child
						local pkey = pdec:getKey()
						if _g.jk.lang.String:isEmpty(pkey) then
							_vm:throw_error(_g.sling.common.ReferenceError:forMessage("UI expression property has no name", pdec, _g.jk.lang.StackTrace:generate()))
						end
						do
							local pval = pdec:getValue()
							if not (pval ~= nil) then
								_vm:throw_error(_g.sling.common.ReferenceError:forMessage("UI expression property has no value", pdec, _g.jk.lang.StackTrace:generate()))
							end
							do self:output(pkey) end
							do self:dumpAnnotationModifiers(pdec, nil) end
							do self:output(" = ") end
							do self:dumpExpression(pval, nil, false) end
							do self:output("\n") end
						end
					else
						_vm:throw_error(_g.sling.common.ReferenceError:forMessage("Unsupported node type `" .. child:getNodeTypeName() .. "' in context `" .. "ui expression" .. "'", child, nil))
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function sling.generator.SlingGenerator:dumpUIExpressionNodeInClass(node)
	do self:output("ui") end
	do
		local dt = node:getDefaultDataType()
		if dt ~= nil then
			do self:output(" ") end
			do self:dumpDataType(dt) end
		end
		do self:output("\n") end
		do self:output("{\n") end
		do self:dumpUIExpressionContents(node) end
		do self:output("}\n") end
	end
end

function sling.generator.SlingGenerator:getExcludeComments()
	do return self.excludeComments end
end

function sling.generator.SlingGenerator:setExcludeComments(v)
	self.excludeComments = v
	do return self end
end

function sling.generator.SlingGenerator:getCurrentIndent()
	do return self.currentIndent end
end

function sling.generator.SlingGenerator:setCurrentIndent(v)
	self.currentIndent = v
	do return self end
end

function sling.generator.SlingGenerator:getCopyrightDeclaration()
	do return self.copyrightDeclaration end
end

function sling.generator.SlingGenerator:setCopyrightDeclaration(v)
	self.copyrightDeclaration = v
	do return self end
end

function sling.generator.SlingGenerator:getHangingBraces()
	do return self.hangingBraces end
end

function sling.generator.SlingGenerator:setHangingBraces(v)
	self.hangingBraces = v
	do return self end
end

function sling.generator.SlingGenerator:getInsertSpaceAfterKeywords()
	do return self.insertSpaceAfterKeywords end
end

function sling.generator.SlingGenerator:setInsertSpaceAfterKeywords(v)
	self.insertSpaceAfterKeywords = v
	do return self end
end

sling.generator.SlingGeneratorUtil = {}
sling.generator.SlingGeneratorUtil.__index = sling.generator.SlingGeneratorUtil
_vm:set_metatable(sling.generator.SlingGeneratorUtil, {})

function sling.generator.SlingGeneratorUtil._create()
	local v = _vm:set_metatable({}, sling.generator.SlingGeneratorUtil)
	return v
end

function sling.generator.SlingGeneratorUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.generator.SlingGeneratorUtil'
	self['_isType.sling.generator.SlingGeneratorUtil'] = true
end

function sling.generator.SlingGeneratorUtil:_construct0()
	sling.generator.SlingGeneratorUtil._init(self)
	return self
end

function sling.generator.SlingGeneratorUtil:describeDataType(dt)
	if (_vm:to_table_with_key(dt, '_isType.sling.model.NullDataTypeNode') ~= nil) then
		do return "null" end
	end
	do return _g.sling.generator.SlingGenerator:dataTypeToString(dt) end
end

function sling.generator.SlingGeneratorUtil:dumpToString(ctx, code)
	local owm = _g.sling.common.StringOutputWriterManager._construct0(_g.sling.common.StringOutputWriterManager._create())
	local generator = _g.sling.generator.SlingGenerator._construct2(_g.sling.generator.SlingGenerator._create(), ctx, owm)
	do generator:dumpFile(code) end
	do return owm:toString() end
end
