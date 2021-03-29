sling = sling or {}

sling.tools = sling.tools or {}

sling.tools.compiler = sling.tools.compiler or {}

sling.tools.compiler.SlingCompilerTask = _g.sling.steps.SlingStepsTask._create()
sling.tools.compiler.SlingCompilerTask.__index = sling.tools.compiler.SlingCompilerTask
_vm:set_metatable(sling.tools.compiler.SlingCompilerTask, {
	__index = _g.sling.steps.SlingStepsTask
})

function sling.tools.compiler.SlingCompilerTask._create()
	local v = _vm:set_metatable({}, sling.tools.compiler.SlingCompilerTask)
	return v
end

function sling.tools.compiler.SlingCompilerTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.tools.compiler.SlingCompilerTask'
	self['_isType.sling.tools.compiler.SlingCompilerTask'] = true
	self._interpreterName = "sushi"
	self._slingScriptVersion = "0.21"
	self.outputDirectoryValue = nil
	self._useCloudBuild = false
	self.compilerUsesValue = nil
	self._source = nil
	self._targetPlatform = nil
	self._buildType = nil
	self._buildVersion = nil
	self.libraryVersionsValue = nil
	self._installLibrary = false
	self._executeApplication = false
	self.customLibsValue = nil
	self.forcedLibsValue = nil
end

function sling.tools.compiler.SlingCompilerTask:_construct0()
	sling.tools.compiler.SlingCompilerTask._init(self)
	do _g.sling.steps.SlingStepsTask._construct0(self) end
	return self
end

function sling.tools.compiler.SlingCompilerTask:createScript(requiredLibs)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if _g.jk.lang.String:isNotEmpty(self:getInterpreterName()) and _g.jk.lang.String:isNotEmpty(self:getSlingScriptVersion()) then
		do sb:appendString("#! " .. _g.jk.lang.String:safeString(self:getInterpreterName()) .. " ss-" .. _g.jk.lang.String:safeString(self:getSlingScriptVersion()) .. "\n") end
	end
	do
		local included = _g.jk.lang.StringSet._construct0(_g.jk.lang.StringSet._create())
		local array = self:getCompilerUses():getKeys()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local key = array[n + 1]
					if key ~= nil then
						if included:contains(key) then
							goto _continue1
						end
						do
							local ver = self:getCompilerUses():getString(key, nil)
							if _g.jk.lang.String:isNotEmpty(ver) then
								do sb:appendString("lib ") end
								do sb:appendString(key) end
								do sb:appendCharacter(58) end
								do sb:appendString(ver) end
								do sb:appendCharacter(10) end
							end
							do included:add(key) end
						end
					end
					::_continue1::
					do n = n + 1 end
				end
			end
		end
		if requiredLibs ~= nil then
			local n2 = 0
			local m2 = #requiredLibs
			do
				n2 = 0
				while n2 < m2 do
					local requiredLib = requiredLibs[n2 + 1]
					if requiredLib ~= nil then
						local libname = _g.jk.lang.String:asString(requiredLib)
						if _g.jk.lang.String:isEmpty(libname) then
							goto _continue2
						end
						if included:contains(libname) then
							goto _continue2
						end
						do
							local ver = self:getLibraryVersions():getString(libname, nil)
							if _g.jk.lang.String:isNotEmpty(ver) then
								do sb:appendString("lib ") end
								do sb:appendString(libname) end
								do sb:appendCharacter(58) end
								do sb:appendString(ver) end
								do sb:appendCharacter(10) end
								do included:add(libname) end
								goto _continue2
							end
							do _g.jk.lang.Error:throw("noLibraryVersion", libname) end
						end
					end
					::_continue2::
					do n2 = n2 + 1 end
				end
			end
		end
		do sb:appendString("import jk.fs\n") end
		do sb:appendString("import jk.log\n") end
		do sb:appendString("import jk.lang\n") end
		do sb:appendString("import jk.sushi\n") end
		do sb:appendString("import jk.console\n") end
		do return sb end
	end
end

function sling.tools.compiler.SlingCompilerTask:startCode(ctx, sb)
	do sb:appendString("var ctx = new ConsoleApplicationContext()\n") end
	if ctx:isInDebugMode() then
		do sb:appendString("ctx.setEnableDebugMessages(true)\n") end
	end
	do sb:appendString("try {\n") end
end

function sling.tools.compiler.SlingCompilerTask:endCode(sb)
	do sb:appendString("}\n") end
	do sb:appendString("catch e as sling.common.ReferenceError {\n") end
	do sb:appendString("Log.error(ctx, e.toStringWithDebug(ctx.isInDebugMode()))\n") end
	do sb:appendString("return 1\n") end
	do sb:appendString("}\n") end
	do sb:appendString("catch e {\n") end
	do sb:appendString("Log.error(ctx, String.asString(e))\n") end
	do sb:appendString("return 1\n") end
	do sb:appendString("}\n") end
end

function sling.tools.compiler.SlingCompilerTask:escapeString(data)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local it = _g.jk.lang.String:iterate(data)
	while it ~= nil do
		local c = it:getNextChar()
		if _g.jk.lang.Character:isEOF(c) then
			do break end
		end
		if c == 34 then
			do sb:appendString("\\\"") end
		elseif c == 92 then
			do sb:appendString("\\\\") end
		elseif c == 10 then
			do sb:appendString("\\n") end
		else
			do sb:appendCharacter(c) end
		end
	end
	do return sb:toString() end
end

function sling.tools.compiler.SlingCompilerTask:executeScript(ctx, code)
	if ctx:isInDebugMode() then
		do _g.jk.log.Log:debug(ctx, code) end
	end
	if self:getUseCloudBuild() then
		do _g.jk.lang.Error:throw("notImplemented", "cloudBuild") end
	else
		local codeFile = _g.jk.env.TemporaryFile:forString(code)
		if not (codeFile ~= nil) then
			do _g.jk.lang.Error:throw("failedToCreate", "temporaryFile") end
		end
		do
			local r = _g.jk.sushi.SushiKit._construct1(_g.jk.sushi.SushiKit._create(), ctx):executeFileProcess(codeFile, nil)
			do codeFile:remove() end
			if r ~= 0 then
				do _g.jk.lang.Error:throw("scriptFailed", _g.jk.lang.String:forInteger(r)) end
			end
		end
	end
end

function sling.tools.compiler.SlingCompilerTask:asSourceFile(source)
	do return _g.jk.fs.File:asFile(source) end
end

function sling.tools.compiler.SlingCompilerTask:execute(ctx)
	if not (self:getSource() ~= nil) then
		do _g.jk.lang.Error:throw("missingValue", "source") end
	end
	do
		local sourceFile = self:asSourceFile(self:getSource())
		if not (sourceFile ~= nil) then
			do _g.jk.lang.Error:throw("invalidValue", "source") end
		end
		if _g.jk.lang.String:isEmpty(self:getBuildVersion()) then
			do _g.jk.lang.Error:throw("missingValue", "buildVersion") end
		end
		if _g.jk.lang.String:isEmpty(self:getBuildType()) then
			do _g.jk.lang.Error:throw("missingValue", "buildType") end
		end
		if not (self:getOutputDirectory() ~= nil) then
			do _g.jk.lang.Error:throw("missingValue", "outputDirectory") end
		end
		do
			local workdir = self:getOutputDirectory():entry("workdir"):entry(self:getBuildVersion()):entry(self:getTargetPlatform())
			local result = self:getOutputDirectory():entry("release")
			do _g.jk.log.Log:info(ctx, "Building " .. _g.jk.lang.String:safeString(self:getBuildType()) .. " to platform `" .. _g.jk.lang.String:safeString(self:getTargetPlatform()) .. "': " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(sourceFile)) .. " ..") end
			do
				local sb = nil
				if self:getTargetPlatform() == "sushi" or self:getTargetPlatform() == "native" then
					sb = self:createScript({
						"sling-core",
						"sling-sushi-export"
					})
					do sb:appendString("import sling.compiler\n") end
					do sb:appendString("import sling.sushi.compiler\n") end
					do self:startCode(ctx, sb) end
					do sb:appendString("var compiler = new SlingToSushiCompiler(ctx)\n") end
				elseif self:getTargetPlatform() == "web5" then
					sb = self:createScript({
						"sling-core",
						"sling-web-export"
					})
					do sb:appendString("import sling.compiler\n") end
					do sb:appendString("import sling.web.compiler\n") end
					do self:startCode(ctx, sb) end
					do sb:appendString("var compiler = new SlingToWeb5Compiler(ctx)\n") end
				elseif self:getTargetPlatform() == "web6" then
					sb = self:createScript({
						"sling-core",
						"sling-web-export"
					})
					do sb:appendString("import sling.compiler\n") end
					do sb:appendString("import sling.web.compiler\n") end
					do self:startCode(ctx, sb) end
					do sb:appendString("var compiler = new SlingToWeb6Compiler(ctx)\n") end
				elseif self:getTargetPlatform() == "java7" then
					sb = self:createScript({
						"sling-core",
						"sling-java-export"
					})
					do sb:appendString("import sling.compiler\n") end
					do sb:appendString("import sling.java.compiler\n") end
					do self:startCode(ctx, sb) end
					do sb:appendString("var compiler = new SlingToJavaCompiler(ctx)\n") end
					do sb:appendString("compiler.setJavaVersion(7)\n") end
				elseif self:getTargetPlatform() == "net5" then
					sb = self:createScript({
						"sling-core",
						"sling-dotnet-export"
					})
					do sb:appendString("import sling.compiler\n") end
					do sb:appendString("import sling.net5.compiler\n") end
					do self:startCode(ctx, sb) end
					do sb:appendString("var compiler = new SlingToNet5Compiler(ctx)\n") end
				elseif self:getTargetPlatform() == "android-java" or self:getTargetPlatform() == "android-kotlin" then
					sb = self:createScript({
						"sling-core",
						"sling-android-export"
					})
					do sb:appendString("import sling.compiler\n") end
					if self:getTargetPlatform() == "android-java" then
						do sb:appendString("import sling.android.java.compiler\n") end
						do self:startCode(ctx, sb) end
						do sb:appendString("var compiler = new SlingToAndroidJavaCompiler(ctx)\n") end
					else
						do sb:appendString("import sling.android.kotlin.compiler\n") end
						do self:startCode(ctx, sb) end
						do sb:appendString("var compiler = new SlingToAndroidKotlinCompiler(ctx)\n") end
					end
				elseif self:getTargetPlatform() == "ios-objc" then
					sb = self:createScript({
						"sling-core",
						"sling-ios-export"
					})
					do sb:appendString("import sling.compiler\n") end
					do sb:appendString("import sling.ios.objc.compiler\n") end
					do self:startCode(ctx, sb) end
					do sb:appendString("var compiler = new SlingToIOSObjcCompiler(ctx)\n") end
				else
					do _g.jk.lang.Error:throw("unsupportedTargetPlatform", self:getTargetPlatform()) end
				end
				if workdir ~= nil then
					do sb:appendString("compiler.setWorkDir(File.asFile(\"") end
					do sb:appendString(self:escapeString(workdir:getPath())) end
					do sb:appendString("\"))\n") end
				end
				do sb:appendString("var src = File.asFile(\"") end
				do sb:appendString(self:escapeString(sourceFile:getPath())) end
				do sb:appendString("\")\n") end
				if self:getBuildType() == "application" then
					do sb:appendString("var modsrc = src.getParent()\n") end
				else
					do sb:appendString("var modsrc = src\n") end
				end
				do sb:appendString("var dst = File.asFile(\"") end
				do sb:appendString(self:escapeString(result:getPath())) end
				do sb:appendString("\")\n") end
				do sb:appendString("var includes = new vector\n") end
				do sb:appendString("Vector.append(includes, modsrc)\n") end
				do sb:appendString("compiler.setIncludes(includes)\n") end
				do sb:appendString("var customLibs = new vector\n") end
				do
					local array = self:getCustomLibs()
					if array ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(array)
						do
							n = 0
							while n < m do
								local customLib = array[n + 1]
								if customLib ~= nil then
									do sb:appendString("Vector.append(customLibs, LibraryName.asLibraryName(\"") end
									do sb:appendString(self:escapeString(customLib)) end
									do sb:appendString("\"))\n") end
								end
								do n = n + 1 end
							end
						end
					end
					do sb:appendString("compiler.setCustomLibs(customLibs)\n") end
					do sb:appendString("compiler.setModuleInfoForLibraries(compiler.getLibraryManager().generateModuleInfosForBuild(ctx, includes, customLibs))\n") end
					if self:getBuildVersion() ~= nil then
						do sb:appendString("var version = \"") end
						do sb:appendString(self:escapeString(self:getBuildVersion())) end
						do sb:appendString("\"\n") end
					else
						do sb:appendString("var version = null\n") end
					end
					do sb:appendString("var options = new DynamicMap()\n") end
					do sb:appendString("options.setString(\"projectVersion\", version)\n") end
					if self:getBuildType() == "library" then
						do sb:appendString("var result = compiler.compileSlingLibrary(src, null, null, dst, options, true)\n") end
						if self:getInstallLibrary() then
							do sb:appendString("if result.getWasModified() {\n") end
							do sb:appendString("if not compiler.getLibraryManager().installLibraryFromFile(ctx, result.getFile(), true):\n") end
							do sb:appendString("Error.throw(\"failedtoInstall\", result.getFile())\n") end
							do sb:appendString("}\n") end
						end
					elseif self:getBuildType() == "application" then
						do sb:appendString("compiler.processModuleByPath(src, options)\n") end
						if self:getTargetPlatform() == "sushi" then
							do sb:appendString("var sushiCode = compiler.buildToSushiApplication(src, dst, null, version).getLinkResult()\n") end
							if self:getExecuteApplication() then
								do sb:appendString("if new SushiKit().executeFileProcess(sushiCode) != 0 {\n\tError.throw(\"applicationExecutionFailed\", sushiCode)\n}") end
							end
						elseif self:getTargetPlatform() == "native" then
							do sb:appendString("compiler.buildToNativeApplication(src, dst, null, version)\n") end
						elseif self:getTargetPlatform() == "web5" then
							local generateIndex = true
							local legacyMode = false
							if self:getOptions() ~= nil then
								generateIndex = self:getOptions():getBoolean("generateIndex", true)
								legacyMode = self:getOptions():getBoolean("legacyMode", false)
							end
							if legacyMode then
								do sb:appendString("compiler.buildToLegacyWebApplication(src, dst, null, version") end
							else
								do sb:appendString("compiler.buildToWebApplication(src, dst, null, version") end
							end
							do sb:appendString(", ") end
							do sb:appendString(_g.jk.lang.String:forBoolean(generateIndex)) end
							do sb:appendString(")\n") end
						elseif self:getTargetPlatform() == "web6" then
							local generateIndex = true
							local generateMainFncCall = false
							if self:getOptions() ~= nil then
								generateIndex = self:getOptions():getBoolean("generateIndex", true)
								generateMainFncCall = self:getOptions():getBoolean("generateMainFncCall", false)
							end
							do sb:appendString("compiler.buildToWebApplication(src, dst, null, version") end
							do sb:appendString(", ") end
							do sb:appendString(_g.jk.lang.String:forBoolean(generateIndex)) end
							do sb:appendString(", ") end
							do sb:appendString(_g.jk.lang.String:forBoolean(generateMainFncCall)) end
							do sb:appendString(")\n") end
						elseif self:getTargetPlatform() == "android-java" or self:getTargetPlatform() == "android-kotlin" then
							do sb:appendString("compiler.buildToAndroidApplication(src, dst, null, version)\n") end
						elseif self:getTargetPlatform() == "ios-objc" then
							do sb:appendString("compiler.buildToIOSApplication(src, dst, null, version)\n") end
						elseif self:getTargetPlatform() == "net5" then
							do sb:appendString("compiler.buildToApplication(src, dst, null, version)\n") end
						else
							do _g.jk.lang.Error:throw("unsupportedTargetPlatformForApplication", self:getTargetPlatform()) end
						end
					else
						do _g.jk.lang.Error:throw("unsupportedBuildType", self:getBuildType()) end
					end
					do self:endCode(sb) end
					do sb:appendString("return 0\n") end
					do self:executeScript(ctx, sb:toString()) end
				end
			end
		end
	end
end

function sling.tools.compiler.SlingCompilerTask:getInterpreterName()
	do return self._interpreterName end
end

function sling.tools.compiler.SlingCompilerTask:doSetInterpreterName(value)
	self._interpreterName = value
end

function sling.tools.compiler.SlingCompilerTask:setInterpreterName(v)
	do self:doSetInterpreterName(v) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTask:getSlingScriptVersion()
	do return self._slingScriptVersion end
end

function sling.tools.compiler.SlingCompilerTask:doSetSlingScriptVersion(value)
	self._slingScriptVersion = value
end

function sling.tools.compiler.SlingCompilerTask:setSlingScriptVersion(v)
	do self:doSetSlingScriptVersion(v) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTask:getOutputDirectory()
	do return self.outputDirectoryValue end
end

function sling.tools.compiler.SlingCompilerTask:doSetOutputDirectory(value)
	self.outputDirectoryValue = value
end

function sling.tools.compiler.SlingCompilerTask:setOutputDirectory(v)
	do self:doSetOutputDirectory(v) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTask:getUseCloudBuild()
	do return self._useCloudBuild end
end

function sling.tools.compiler.SlingCompilerTask:doSetUseCloudBuild(value)
	self._useCloudBuild = value
end

function sling.tools.compiler.SlingCompilerTask:setUseCloudBuild(v)
	do self:doSetUseCloudBuild(v) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTask:getCompilerUses()
	if not (self.compilerUsesValue ~= nil) then
		self.compilerUsesValue = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	end
	do return self.compilerUsesValue end
end

function sling.tools.compiler.SlingCompilerTask:doSetCompilerUses(value)
	self.compilerUsesValue = value
end

function sling.tools.compiler.SlingCompilerTask:setCompilerUses(v)
	do self:doSetCompilerUses(v) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTask:getSource()
	do return self._source end
end

function sling.tools.compiler.SlingCompilerTask:doSetSource(value)
	self._source = value
end

function sling.tools.compiler.SlingCompilerTask:setSource(v)
	do self:doSetSource(v) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTask:getTargetPlatform()
	do return self._targetPlatform end
end

function sling.tools.compiler.SlingCompilerTask:doSetTargetPlatform(value)
	self._targetPlatform = value
end

function sling.tools.compiler.SlingCompilerTask:setTargetPlatform(v)
	do self:doSetTargetPlatform(v) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTask:getBuildType()
	do return self._buildType end
end

function sling.tools.compiler.SlingCompilerTask:doSetBuildType(value)
	self._buildType = value
end

function sling.tools.compiler.SlingCompilerTask:setBuildType(v)
	do self:doSetBuildType(v) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTask:getBuildVersion()
	do return self._buildVersion end
end

function sling.tools.compiler.SlingCompilerTask:doSetBuildVersion(value)
	self._buildVersion = value
end

function sling.tools.compiler.SlingCompilerTask:setBuildVersion(v)
	do self:doSetBuildVersion(v) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTask:getLibraryVersions()
	if not (self.libraryVersionsValue ~= nil) then
		self.libraryVersionsValue = _g.jk.lang.DynamicMap:forObjectMap({
			["sling-core"] = "0.27.0",
			["sling-sushi-export"] = "0.15.0",
			["sling-web-export"] = "0.8.0",
			["sling-java-export"] = "0.9.0",
			["sling-dotnet-export"] = "0.1.0",
			["sling-android-export"] = "0.10.0",
			["sling-ios-export"] = "0.7.0"
		})
	end
	do return self.libraryVersionsValue end
end

function sling.tools.compiler.SlingCompilerTask:doSetLibraryVersions(value)
	self.libraryVersionsValue = value
end

function sling.tools.compiler.SlingCompilerTask:setLibraryVersions(v)
	do self:doSetLibraryVersions(v) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTask:getInstallLibrary()
	do return self._installLibrary end
end

function sling.tools.compiler.SlingCompilerTask:doSetInstallLibrary(value)
	self._installLibrary = value
end

function sling.tools.compiler.SlingCompilerTask:setInstallLibrary(v)
	do self:doSetInstallLibrary(v) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTask:getExecuteApplication()
	do return self._executeApplication end
end

function sling.tools.compiler.SlingCompilerTask:doSetExecuteApplication(value)
	self._executeApplication = value
end

function sling.tools.compiler.SlingCompilerTask:setExecuteApplication(v)
	do self:doSetExecuteApplication(v) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTask:getCustomLibs()
	if not (self.customLibsValue ~= nil) then
		self.customLibsValue = {}
	end
	do return self.customLibsValue end
end

function sling.tools.compiler.SlingCompilerTask:doSetCustomLibs(value)
	self.customLibsValue = value
end

function sling.tools.compiler.SlingCompilerTask:setCustomLibs(v)
	do self:doSetCustomLibs(v) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTask:getForcedLibs()
	if not (self.forcedLibsValue ~= nil) then
		self.forcedLibsValue = {}
	end
	do return self.forcedLibsValue end
end

function sling.tools.compiler.SlingCompilerTask:doSetForcedLibs(value)
	self.forcedLibsValue = value
end

function sling.tools.compiler.SlingCompilerTask:setForcedLibs(v)
	do self:doSetForcedLibs(v) end
	do return v end
end

sling.tools.compiler.SlingWebsiteApplicationBuildTask = _g.sling.steps.SlingStepsTask._create()
sling.tools.compiler.SlingWebsiteApplicationBuildTask.__index = sling.tools.compiler.SlingWebsiteApplicationBuildTask
_vm:set_metatable(sling.tools.compiler.SlingWebsiteApplicationBuildTask, {
	__index = _g.sling.steps.SlingStepsTask
})

function sling.tools.compiler.SlingWebsiteApplicationBuildTask._create()
	local v = _vm:set_metatable({}, sling.tools.compiler.SlingWebsiteApplicationBuildTask)
	return v
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.tools.compiler.SlingWebsiteApplicationBuildTask'
	self['_isType.sling.tools.compiler.SlingWebsiteApplicationBuildTask'] = true
	self._sourceDirectory = nil
	self.outputDirectoryValue = nil
	self._buildVersion = "latest"
	self._useCloudBuild = false
	self._compilerUses = nil
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:_construct0()
	sling.tools.compiler.SlingWebsiteApplicationBuildTask._init(self)
	do _g.sling.steps.SlingStepsTask._construct0(self) end
	return self
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:execute(ctx)
	local link = _g.sling.tools.compiler.SlingWebsiteApplicationLinkTask._construct0(_g.sling.tools.compiler.SlingWebsiteApplicationLinkTask._create())
	do link:setSiteName(self:getSourceDirectory():getBasename()) end
	do link:setOutputDirectory(self:getOutputDirectory()) end
	do link:setBuildVersion(self:getBuildVersion()) end
	do
		local tasks = _g.sling.tools.compiler.SlingCompilerTaskList._construct0(_g.sling.tools.compiler.SlingCompilerTaskList._create())
		do tasks:setName("Build Website Application") end
		do
			local serverModule = self:getSourceDirectory():entry("server"):entry("server.main")
			if serverModule:entry("ServerMain.sling"):isFile() then
				do tasks:addApplication(serverModule, "sushi", nil) end
				do link:setServerAppInstaller(self:getOutputDirectory():entry("release"):entry(_g.jk.lang.String:safeString(serverModule:getBasename()) .. "-" .. _g.jk.lang.String:safeString(self:getBuildVersion()) .. ".sapp")) end
			end
			do
				local webapps = self:getSourceDirectory():entry("webapps")
				local it = webapps:entries()
				while it ~= nil do
					local ff = it:next()
					if not (ff ~= nil) then
						do break end
					end
					do
						local dd = ff:entry(_g.jk.lang.String:safeString(ff:getBasename()) .. ".main")
						if dd:isDirectory() then
							do tasks:addApplication(dd, "web6", nil) end
							do _g.jk.lang.Vector:append(link:getWebappFiles(), self:getOutputDirectory():entry("release"):entry(_g.jk.lang.String:safeString(dd:getBasename()) .. "-" .. _g.jk.lang.String:safeString(self:getBuildVersion()) .. "_web6.zip")) end
						end
					end
				end
				do
					local wwwroot = self:getSourceDirectory():entry("wwwroot")
					if wwwroot:isDirectory() then
						do link:setWwwrootDirectory(wwwroot) end
					end
					do tasks:addTask(link) end
					do
						local array = tasks:getTasks()
						if array ~= nil then
							local n = 0
							local m = _g.jk.lang.Vector:getSize(array)
							do
								n = 0
								while n < m do
									local task = _vm:to_table_with_key(array[n + 1], '_isType.sling.tools.compiler.SlingCompilerTask')
									if task ~= nil then
										do task:setOutputDirectory(self:getOutputDirectory()) end
										do task:setUseCloudBuild(self:getUseCloudBuild()) end
										do task:setCompilerUses(self:getCompilerUses()) end
										do task:setBuildVersion(self:getBuildVersion()) end
										do task:setInstallLibrary(false) end
									end
									do n = n + 1 end
								end
							end
						end
						do tasks:execute(ctx) end
					end
				end
			end
		end
	end
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:getSourceDirectory()
	do return self._sourceDirectory end
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:doSetSourceDirectory(value)
	self._sourceDirectory = value
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:setSourceDirectory(v)
	do self:doSetSourceDirectory(v) end
	do return v end
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:getOutputDirectory()
	if not (self.outputDirectoryValue ~= nil) then
		do return self:getSourceDirectory():entry(".build") end
	end
	do return self.outputDirectoryValue end
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:doSetOutputDirectory(value)
	self.outputDirectoryValue = value
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:setOutputDirectory(v)
	do self:doSetOutputDirectory(v) end
	do return v end
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:getBuildVersion()
	do return self._buildVersion end
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:doSetBuildVersion(value)
	self._buildVersion = value
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:setBuildVersion(v)
	do self:doSetBuildVersion(v) end
	do return v end
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:getUseCloudBuild()
	do return self._useCloudBuild end
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:doSetUseCloudBuild(value)
	self._useCloudBuild = value
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:setUseCloudBuild(v)
	do self:doSetUseCloudBuild(v) end
	do return v end
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:getCompilerUses()
	do return self._compilerUses end
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:doSetCompilerUses(value)
	self._compilerUses = value
end

function sling.tools.compiler.SlingWebsiteApplicationBuildTask:setCompilerUses(v)
	do self:doSetCompilerUses(v) end
	do return v end
end

sling.tools.compiler.SlingWebsiteCompilerCommand = {}
sling.tools.compiler.SlingWebsiteCompilerCommand.__index = sling.tools.compiler.SlingWebsiteCompilerCommand
_vm:set_metatable(sling.tools.compiler.SlingWebsiteCompilerCommand, {})

function sling.tools.compiler.SlingWebsiteCompilerCommand._create()
	local v = _vm:set_metatable({}, sling.tools.compiler.SlingWebsiteCompilerCommand)
	return v
end

function sling.tools.compiler.SlingWebsiteCompilerCommand:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.tools.compiler.SlingWebsiteCompilerCommand'
	self['_isType.sling.tools.compiler.SlingWebsiteCompilerCommand'] = true
end

function sling.tools.compiler.SlingWebsiteCompilerCommand:_construct0()
	sling.tools.compiler.SlingWebsiteCompilerCommand._init(self)
	return self
end

function sling.tools.compiler.SlingWebsiteCompilerCommand:executeBuildWebsiteCommand(ctx, directory, args)
	local isClean = false
	local outputDirectory = directory:entry(".build")
	local version = nil
	local useCloudBuild = false
	local compilerUses = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	while args:hasMore() do
		if args:acceptOption("v") then
			version = args:getOptionValue()
		elseif args:acceptOption("o") then
			outputDirectory = _g.jk.fs.File:forPath(args:getOptionValue())
		elseif args:acceptValue("clean") then
			isClean = true
		elseif args:acceptOption("use") then
			local pp = args:getOptionValue()
			local comps = _g.jk.lang.String:split(pp, 58, 2)
			local id = _g.jk.lang.Vector:get(comps, 0)
			local ver = _g.jk.lang.Vector:get(comps, 1)
			if _g.jk.lang.String:isEmpty(id) or _g.jk.lang.String:isEmpty(ver) then
				do _g.jk.lang.Error:throw("invalidUseParameter", pp) end
			end
			do compilerUses:setString(id, ver) end
		elseif args:acceptFlag("cloud") then
			useCloudBuild = true
		else
			do _g.jk.lang.Error:throw("invalidParameter", args:getCurrent()) end
		end
	end
	if isClean then
		do _g.jk.log.Log:info(ctx, "Removing directory: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(outputDirectory)) .. "'") end
		do outputDirectory:removeRecursive() end
		do return end
	end
	do
		local task = _g.sling.tools.compiler.SlingWebsiteApplicationBuildTask._construct0(_g.sling.tools.compiler.SlingWebsiteApplicationBuildTask._create())
		do task:setSourceDirectory(directory) end
		do task:setOutputDirectory(outputDirectory) end
		do task:setUseCloudBuild(useCloudBuild) end
		do task:setCompilerUses(compilerUses) end
		if version ~= nil then
			do task:setBuildVersion(version) end
		end
		do task:execute(ctx) end
	end
end

sling.tools.compiler.SlingCompilerCommand = {}
sling.tools.compiler.SlingCompilerCommand.__index = sling.tools.compiler.SlingCompilerCommand
_vm:set_metatable(sling.tools.compiler.SlingCompilerCommand, {})

function sling.tools.compiler.SlingCompilerCommand._create()
	local v = _vm:set_metatable({}, sling.tools.compiler.SlingCompilerCommand)
	return v
end

function sling.tools.compiler.SlingCompilerCommand:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.tools.compiler.SlingCompilerCommand'
	self['_isType.sling.tools.compiler.SlingCompilerCommand'] = true
end

function sling.tools.compiler.SlingCompilerCommand:_construct0()
	sling.tools.compiler.SlingCompilerCommand._init(self)
	return self
end

function sling.tools.compiler.SlingCompilerCommand:executeBuildCommand(ctx, mytasks, args)
	local isClean = false
	local install = false
	local execute = false
	local version = "local"
	local outputDirectory = _g.jk.fs.File:forPath(".build")
	local customLibs = {}
	local flibs = {}
	local compilerUses = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	local useCloudBuild = false
	while args:hasMore() do
		if args:acceptOption("flib") then
			do _g.jk.lang.Vector:append(flibs, args:getOptionValue()) end
		elseif args:acceptOption("lib") then
			do _g.jk.lang.Vector:append(customLibs, args:getOptionValue()) end
		elseif args:acceptOption("v") then
			version = args:getOptionValue()
		elseif args:acceptFlag("install") then
			install = true
		elseif args:acceptFlag("execute") or args:acceptFlag("x") then
			execute = true
		elseif args:acceptOption("o") then
			outputDirectory = _g.jk.fs.File:forPath(args:getOptionValue())
		elseif args:acceptFlag("cloud") then
			useCloudBuild = true
		elseif args:acceptOption("use") then
			local pp = args:getOptionValue()
			local comps = _g.jk.lang.String:split(pp, 58, 2)
			local id = _g.jk.lang.Vector:get(comps, 0)
			local ver = _g.jk.lang.Vector:get(comps, 1)
			if _g.jk.lang.String:isEmpty(id) or _g.jk.lang.String:isEmpty(ver) then
				do _g.jk.lang.Error:throw("invalidUseParameter", pp) end
			end
			do compilerUses:setString(id, ver) end
		elseif args:acceptValue("clean") then
			isClean = true
		else
			do _g.jk.lang.Error:throw("invalidParameter", args:getCurrent()) end
		end
	end
	if isClean then
		do _g.jk.log.Log:info(ctx, "Removing directory: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(outputDirectory)) .. "'") end
		do outputDirectory:removeRecursive() end
		do return end
	end
	do
		local array = mytasks:getTasks()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local task = _vm:to_table_with_key(array[n + 1], '_isType.sling.tools.compiler.SlingCompilerTask')
					if task ~= nil then
						do task:setOutputDirectory(outputDirectory) end
						do task:setUseCloudBuild(useCloudBuild) end
						do task:setCompilerUses(compilerUses) end
						do task:setBuildVersion(version) end
						if install == true or version == "local" then
							do task:setInstallLibrary(true) end
						end
						do task:setExecuteApplication(execute) end
						do task:setCustomLibs(customLibs) end
						do task:setForcedLibs(flibs) end
					end
					do n = n + 1 end
				end
			end
		end
		do mytasks:execute(ctx) end
	end
end

sling.tools.compiler.SlingCompilerTool = _g.sling.steps.SlingStepsMain._create()
sling.tools.compiler.SlingCompilerTool.__index = sling.tools.compiler.SlingCompilerTool
_vm:set_metatable(sling.tools.compiler.SlingCompilerTool, {
	__index = _g.sling.steps.SlingStepsMain
})

function sling.tools.compiler.SlingCompilerTool._create()
	local v = _vm:set_metatable({}, sling.tools.compiler.SlingCompilerTool)
	return v
end

function sling.tools.compiler.SlingCompilerTool:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.tools.compiler.SlingCompilerTool'
	self['_isType.sling.tools.compiler.SlingCompilerTool'] = true
end

function sling.tools.compiler.SlingCompilerTool:_construct1(ctx)
	sling.tools.compiler.SlingCompilerTool._init(self)
	do _g.sling.steps.SlingStepsMain._construct1(self, ctx) end
	return self
end

function sling.tools.compiler.SlingCompilerTool:_construct0()
	sling.tools.compiler.SlingCompilerTool._init(self)
	do _g.sling.steps.SlingStepsMain._construct0(self) end
	return self
end

function sling.tools.compiler.SlingCompilerTool:getAllPlatforms()
	local v = {}
	do _g.jk.lang.Vector:append(v, "sushi") end
	do _g.jk.lang.Vector:append(v, "web5") end
	do _g.jk.lang.Vector:append(v, "web6") end
	do _g.jk.lang.Vector:append(v, "java7") end
	do _g.jk.lang.Vector:append(v, "net5") end
	do _g.jk.lang.Vector:append(v, "android-java") end
	do _g.jk.lang.Vector:append(v, "ios-objc") end
	do return v end
end

function sling.tools.compiler.SlingCompilerTool:forCrossPlatformLibraryDirectory()
	local v = _g.sling.tools.compiler.SlingCompilerTool._construct0(_g.sling.tools.compiler.SlingCompilerTool._create())
	do v:registerCommand("build", function(args)
		local platform = nil
		local nargs = {}
		while args:hasMore() do
			if args:acceptOption("platform") then
				platform = args:getOptionValue()
			else
				do _g.jk.lang.Vector:append(nargs, args:acceptAnyValue()) end
			end
		end
		do
			local tts = _g.sling.tools.compiler.SlingCompilerTaskList:forName1("Build Sling Library")
			if platform ~= nil then
				do tts:addLibrary("src", platform, nil) end
			else
				local array = _g.sling.tools.compiler.SlingCompilerTool:getAllPlatforms()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local pp = array[n + 1]
							if pp ~= nil then
								do tts:addLibrary("src", pp, nil) end
							end
							do n = n + 1 end
						end
					end
				end
			end
			do _g.sling.tools.compiler.SlingCompilerCommand:executeBuildCommand(v:getCtx(), tts, _g.jk.console.ArgumentVector:forStringVector(nargs)) end
		end
	end) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTool:forLibraryDirectoryWithPlatform(platform)
	local v = _g.sling.tools.compiler.SlingCompilerTool._construct0(_g.sling.tools.compiler.SlingCompilerTool._create())
	do v:registerCommand("build", function(args)
		local tts = _g.sling.tools.compiler.SlingCompilerTaskList:forName1("Build Sling Library to platform `" .. _g.jk.lang.String:safeString(platform) .. "'")
		do tts:addLibrary("src", platform, nil) end
		do _g.sling.tools.compiler.SlingCompilerCommand:executeBuildCommand(v:getCtx(), tts, args) end
	end) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTool:forSushiLibraryDirectory()
	do return _g.sling.tools.compiler.SlingCompilerTool:forLibraryDirectoryWithPlatform("sushi") end
end

function sling.tools.compiler.SlingCompilerTool:forWebLibraryDirectory()
	local v = _g.sling.tools.compiler.SlingCompilerTool._construct0(_g.sling.tools.compiler.SlingCompilerTool._create())
	do v:registerCommand("build", function(args)
		local tts = _g.sling.tools.compiler.SlingCompilerTaskList:forName1("Build Sling Library to web")
		do tts:addLibrary("src", "web5", nil) end
		do tts:addLibrary("src", "web6", nil) end
		do _g.sling.tools.compiler.SlingCompilerCommand:executeBuildCommand(v:getCtx(), tts, args) end
	end) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTool:forApplicationDirectoryWithPlatform(mainModule, platform, options)
	local v = _g.sling.tools.compiler.SlingCompilerTool._construct0(_g.sling.tools.compiler.SlingCompilerTool._create())
	do v:registerCommand("build", function(args)
		local name = "Build Sling Application to platform `" .. _g.jk.lang.String:safeString(platform) .. "'"
		local tts = _g.sling.tools.compiler.SlingCompilerTaskList:forName1(name)
		do tts:addApplication("src/" .. _g.jk.lang.String:safeString(mainModule), platform, options) end
		do _g.sling.tools.compiler.SlingCompilerCommand:executeBuildCommand(v:getCtx(), tts, args) end
	end) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTool:forSushiApplicationDirectory(mainModule)
	do return _g.sling.tools.compiler.SlingCompilerTool:forApplicationDirectoryWithPlatform(mainModule, "sushi", nil) end
end

function sling.tools.compiler.SlingCompilerTool:forWeb5ApplicationDirectory(mainModule)
	do return _g.sling.tools.compiler.SlingCompilerTool:forApplicationDirectoryWithPlatform(mainModule, "web5", nil) end
end

function sling.tools.compiler.SlingCompilerTool:forWeb6ApplicationDirectory(mainModule)
	do return _g.sling.tools.compiler.SlingCompilerTool:forApplicationDirectoryWithPlatform(mainModule, "web6", nil) end
end

function sling.tools.compiler.SlingCompilerTool:forAndroidJavaApplicationDirectory(mainModule)
	do return _g.sling.tools.compiler.SlingCompilerTool:forApplicationDirectoryWithPlatform(mainModule, "android-java", nil) end
end

function sling.tools.compiler.SlingCompilerTool:forAndroidKotlinApplicationDirectory(mainModule)
	do return _g.sling.tools.compiler.SlingCompilerTool:forApplicationDirectoryWithPlatform(mainModule, "android-kotlin", nil) end
end

function sling.tools.compiler.SlingCompilerTool:forIosObjcApplicationDirectory(mainModule)
	do return _g.sling.tools.compiler.SlingCompilerTool:forApplicationDirectoryWithPlatform(mainModule, "ios-objc", nil) end
end

function sling.tools.compiler.SlingCompilerTool:forIosSwiftApplicationDirectory(mainModule)
	do return _g.sling.tools.compiler.SlingCompilerTool:forApplicationDirectoryWithPlatform(mainModule, "ios-swift", nil) end
end

function sling.tools.compiler.SlingCompilerTool:forMobileApplicationDirectory(mainModule)
	local v = _g.sling.tools.compiler.SlingCompilerTool._construct0(_g.sling.tools.compiler.SlingCompilerTool._create())
	do v:registerCommand("build", function(args)
		local tts = _g.sling.tools.compiler.SlingCompilerTaskList:forName1("Build Sling Application to mobile platforms")
		do tts:addApplication("src/" .. _g.jk.lang.String:safeString(mainModule), "android-java", nil) end
		do tts:addApplication("src/" .. _g.jk.lang.String:safeString(mainModule), "ios-objc", nil) end
		do _g.sling.tools.compiler.SlingCompilerCommand:executeBuildCommand(v:getCtx(), tts, args) end
	end) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTool:forWebsiteDirectory()
	local v = _g.sling.tools.compiler.SlingCompilerTool._construct0(_g.sling.tools.compiler.SlingCompilerTool._create())
	do v:registerCommand("build", function(args)
		do _g.sling.tools.compiler.SlingWebsiteCompilerCommand:executeBuildWebsiteCommand(v:getCtx(), _g.jk.fs.CurrentDirectory:get(), args) end
	end) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTool:forDotnetApplicationDirectory(mainModule)
	do return _g.sling.tools.compiler.SlingCompilerTool:forApplicationDirectoryWithPlatform(mainModule, "net5", nil) end
end

sling.tools.compiler.SlingCompilerTaskList = _g.sling.steps.SlingStepsTaskList._create()
sling.tools.compiler.SlingCompilerTaskList.__index = sling.tools.compiler.SlingCompilerTaskList
_vm:set_metatable(sling.tools.compiler.SlingCompilerTaskList, {
	__index = _g.sling.steps.SlingStepsTaskList
})

function sling.tools.compiler.SlingCompilerTaskList._create()
	local v = _vm:set_metatable({}, sling.tools.compiler.SlingCompilerTaskList)
	return v
end

function sling.tools.compiler.SlingCompilerTaskList:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.tools.compiler.SlingCompilerTaskList'
	self['_isType.sling.tools.compiler.SlingCompilerTaskList'] = true
end

function sling.tools.compiler.SlingCompilerTaskList:_construct0()
	sling.tools.compiler.SlingCompilerTaskList._init(self)
	do _g.sling.steps.SlingStepsTaskList._construct0(self) end
	return self
end

function sling.tools.compiler.SlingCompilerTaskList:forName1(name)
	local v = _g.sling.tools.compiler.SlingCompilerTaskList._construct0(_g.sling.tools.compiler.SlingCompilerTaskList._create())
	do v:setName(name) end
	do return v end
end

function sling.tools.compiler.SlingCompilerTaskList:addLibrary(source, platform, options)
	local td = _g.sling.tools.compiler.SlingCompilerTask._construct0(_g.sling.tools.compiler.SlingCompilerTask._create())
	do td:setSource(source) end
	do td:setTargetPlatform(platform) end
	do td:setBuildType("library") end
	if options ~= nil then
		do td:setOptions(_g.jk.lang.DynamicMap:forStringMap(options)) end
	end
	do self:addTask(td) end
	do return self end
end

function sling.tools.compiler.SlingCompilerTaskList:addApplication(source, platform, options)
	local td = _g.sling.tools.compiler.SlingCompilerTask._construct0(_g.sling.tools.compiler.SlingCompilerTask._create())
	do td:setSource(source) end
	do td:setTargetPlatform(platform) end
	do td:setBuildType("application") end
	if options ~= nil then
		do td:setOptions(_g.jk.lang.DynamicMap:forStringMap(options)) end
	end
	do self:addTask(td) end
	do return self end
end

sling.tools.compiler.SlingWebsiteApplicationLinkTask = _g.sling.steps.SlingStepsTask._create()
sling.tools.compiler.SlingWebsiteApplicationLinkTask.__index = sling.tools.compiler.SlingWebsiteApplicationLinkTask
_vm:set_metatable(sling.tools.compiler.SlingWebsiteApplicationLinkTask, {
	__index = _g.sling.steps.SlingStepsTask
})

function sling.tools.compiler.SlingWebsiteApplicationLinkTask._create()
	local v = _vm:set_metatable({}, sling.tools.compiler.SlingWebsiteApplicationLinkTask)
	return v
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.tools.compiler.SlingWebsiteApplicationLinkTask'
	self['_isType.sling.tools.compiler.SlingWebsiteApplicationLinkTask'] = true
	self._siteName = nil
	self._outputDirectory = nil
	self._buildVersion = nil
	self._serverAppInstaller = nil
	self.webappFilesValue = nil
	self._wwwrootDirectory = nil
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:_construct0()
	sling.tools.compiler.SlingWebsiteApplicationLinkTask._init(self)
	do _g.sling.steps.SlingStepsTask._construct0(self) end
	return self
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:isBuildNeeded(outputFile)
	if not outputFile:isFile() then
		do return true end
	end
	do
		local ofts = outputFile:getLastModifiedTimeStamp()
		if self:getServerAppInstaller() ~= nil and self:getServerAppInstaller():getLastModifiedTimeStamp() > ofts then
			do return true end
		end
		do
			local array = self:getWebappFiles()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local webapp = array[n + 1]
						if webapp ~= nil then
							if webapp:getLastModifiedTimeStamp() > ofts then
								do return true end
							end
						end
						do n = n + 1 end
					end
				end
			end
			if self:getWwwrootDirectory() ~= nil then
				local v = false
				local finder = _g.jk.fs.FileFinder:forRoot(self:getWwwrootDirectory())
				while true do
					local ff = finder:next()
					if not (ff ~= nil) then
						do break end
					end
					if ff:getLastModifiedTimeStamp() > ofts then
						v = true
					end
				end
				do return v end
			end
			do return false end
		end
	end
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:execute(ctx)
	if _g.jk.lang.String:isEmpty(self:getSiteName()) then
		do _g.jk.lang.Error:throw("valueMissing", "siteName") end
	end
	if not (self:getOutputDirectory() ~= nil) then
		do _g.jk.lang.Error:throw("valueMissing", "outputDirectory") end
	end
	if _g.jk.lang.String:isEmpty(self:getBuildVersion()) then
		do _g.jk.lang.Error:throw("valueMissing", "buildVersion") end
	end
	do
		local releaseDir = self:getOutputDirectory():entry("release")
		local outputFile = releaseDir:entry(_g.jk.lang.String:safeString(self:getSiteName()) .. "_" .. _g.jk.lang.String:safeString(self:getBuildVersion()) .. ".zip")
		if not self:isBuildNeeded(outputFile) then
			do _g.jk.log.Log:info(ctx, "Already up to date: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(outputFile)) .. "'") end
			do return end
		end
		do
			local tmpdir = self:getOutputDirectory():entry("workdir"):entry(self:getBuildVersion()):entry("website")
			do tmpdir:removeRecursive() end
			do tmpdir:createDirectoryRecursive() end
			if not tmpdir:isDirectory() then
				do _g.jk.lang.Error:throw("unableToCreateDirectory", tmpdir) end
			end
			if self:getServerAppInstaller() ~= nil then
				do _g.jk.log.Log:debug(ctx, "Server application installer: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(self:getServerAppInstaller())) .. "'") end
				if not _g.jk.archive.ZipReader:extractZipFileToDirectory(self:getServerAppInstaller(), tmpdir, nil) then
					do _g.jk.lang.Error:throw("unableToExtract", self:getServerAppInstaller()) end
				end
			end
			do
				local wwwroot = tmpdir:entry("wwwroot")
				if self:getWwwrootDirectory() ~= nil then
					do _g.jk.log.Log:debug(ctx, "wwwroot directory: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(self:getWwwrootDirectory())) .. "'") end
					if not self:getWwwrootDirectory():copyFileOrDirectoryTo(wwwroot) then
						do _g.jk.lang.Error:throw("failedToCopyDirectory", self:getWwwrootDirectory()) end
					end
				end
				do
					local array = self:getWebappFiles()
					if array ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(array)
						do
							n = 0
							while n < m do
								local webapp = array[n + 1]
								if webapp ~= nil then
									local basename = _g.jk.lang.Vector:get(_g.jk.lang.String:split(webapp:getBasename(), 45, 2), 0)
									if _g.jk.lang.String:endsWith(basename, ".main") then
										basename = _g.jk.lang.String:getSubString(basename, 0, _g.jk.lang.String:getLength(basename) - 5)
									end
									if _g.jk.lang.String:isEmpty(basename) then
										do _g.jk.lang.Error:throw("failedToDetermineBasename", webapp) end
									end
									do _g.jk.log.Log:debug(ctx, "Web application installer: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(webapp)) .. "'") end
									do
										local destdir = wwwroot:entry(basename)
										do destdir:createDirectoryRecursive() end
										if not _g.jk.archive.ZipReader:extractZipFileToDirectory(webapp, destdir, nil) then
											do _g.jk.lang.Error:throw("unableToExtract", webapp) end
										end
									end
								end
								do n = n + 1 end
							end
						end
					end
					if not _g.jk.archive.ZipWriter:writeToZipRecursive(ctx, outputFile, tmpdir, true) then
						do _g.jk.lang.Error:throw("failedToWriteFile", outputFile) end
					end
					do _g.jk.log.Log:info(ctx, "Website: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(outputFile))) end
				end
			end
		end
	end
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:getSiteName()
	do return self._siteName end
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:doSetSiteName(value)
	self._siteName = value
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:setSiteName(v)
	do self:doSetSiteName(v) end
	do return v end
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:getOutputDirectory()
	do return self._outputDirectory end
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:doSetOutputDirectory(value)
	self._outputDirectory = value
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:setOutputDirectory(v)
	do self:doSetOutputDirectory(v) end
	do return v end
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:getBuildVersion()
	do return self._buildVersion end
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:doSetBuildVersion(value)
	self._buildVersion = value
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:setBuildVersion(v)
	do self:doSetBuildVersion(v) end
	do return v end
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:getServerAppInstaller()
	do return self._serverAppInstaller end
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:doSetServerAppInstaller(value)
	self._serverAppInstaller = value
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:setServerAppInstaller(v)
	do self:doSetServerAppInstaller(v) end
	do return v end
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:getWebappFiles()
	if not (self.webappFilesValue ~= nil) then
		self.webappFilesValue = {}
	end
	do return self.webappFilesValue end
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:doSetWebappFiles(value)
	self.webappFilesValue = value
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:setWebappFiles(v)
	do self:doSetWebappFiles(v) end
	do return v end
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:getWwwrootDirectory()
	do return self._wwwrootDirectory end
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:doSetWwwrootDirectory(value)
	self._wwwrootDirectory = value
end

function sling.tools.compiler.SlingWebsiteApplicationLinkTask:setWwwrootDirectory(v)
	do self:doSetWwwrootDirectory(v) end
	do return v end
end
