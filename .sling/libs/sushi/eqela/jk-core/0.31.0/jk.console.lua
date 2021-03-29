jk = jk or {}

jk.console = jk.console or {}

jk.console.StdoutForSushi = {}
jk.console.StdoutForSushi.__index = jk.console.StdoutForSushi
_vm:set_metatable(jk.console.StdoutForSushi, {})

function jk.console.StdoutForSushi._create()
	local v = _vm:set_metatable({}, jk.console.StdoutForSushi)
	return v
end

function jk.console.StdoutForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.StdoutForSushi'
	self['_isType.jk.console.StdoutForSushi'] = true
	self['_isType.jk.io.Writer'] = true
	self['_isType.jk.io.PrintWriter'] = true
end

function jk.console.StdoutForSushi:_construct0()
	jk.console.StdoutForSushi._init(self)
	return self
end

function jk.console.StdoutForSushi:write(buf, size)
	local v = 0
	do v = _io:write_to_handle(1, buf, size) end
	do return v end
end

function jk.console.StdoutForSushi:print(str)
	do _io:write_to_stdout(str) end
	do return true end
end

function jk.console.StdoutForSushi:println(str)
	do _io:write_to_stdout(str .. "\n") end
	do return true end
end

jk.console.ArgumentVector = {}
jk.console.ArgumentVector.__index = jk.console.ArgumentVector
_vm:set_metatable(jk.console.ArgumentVector, {})

function jk.console.ArgumentVector._create()
	local v = _vm:set_metatable({}, jk.console.ArgumentVector)
	return v
end

function jk.console.ArgumentVector:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.ArgumentVector'
	self['_isType.jk.console.ArgumentVector'] = true
	self.args = nil
	self.position = 0
	self.optionValue = nil
end

function jk.console.ArgumentVector:_construct0()
	jk.console.ArgumentVector._init(self)
	return self
end

function jk.console.ArgumentVector:forStringVector(args)
	local v = _g.jk.console.ArgumentVector._construct0(_g.jk.console.ArgumentVector._create())
	do v:setArgs(args) end
	do return v end
end

function jk.console.ArgumentVector:forArray(args)
	local v = _g.jk.console.ArgumentVector._construct0(_g.jk.console.ArgumentVector._create())
	local vv = {}
	if args ~= nil then
		local n = 0
		local m = #args
		do
			n = 0
			while n < m do
				local arg = args[n + 1]
				if arg ~= nil then
					do _g.jk.lang.Vector:append(vv, arg) end
				end
				do n = n + 1 end
			end
		end
	end
	do v:setArgs(vv) end
	do return v end
end

function jk.console.ArgumentVector:getCurrent()
	if not (self.args ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Vector:get(self.args, self.position) end
end

function jk.console.ArgumentVector:moveToNext()
	do self.position = self.position + 1 end
end

function jk.console.ArgumentVector:hasMore()
	if not (self.args ~= nil) then
		do return false end
	end
	if self.position < _g.jk.lang.Vector:getSize(self.args) then
		do return true end
	end
	do return false end
end

function jk.console.ArgumentVector:acceptFlag(flag)
	if not (flag ~= nil) then
		do return false end
	end
	do
		local cc = self:getCurrent()
		if not (cc ~= nil) then
			do return false end
		end
		if cc == "-" .. _g.jk.lang.String:safeString(flag) then
			do self:moveToNext() end
			do return true end
		end
		if cc == "--" .. _g.jk.lang.String:safeString(flag) then
			do self:moveToNext() end
			do return true end
		end
		do return false end
	end
end

function jk.console.ArgumentVector:acceptOption(str)
	if not _g.jk.lang.String:isNotEmpty(str) then
		do return false end
	end
	do
		local cc = self:getCurrent()
		if not (cc ~= nil) then
			do return false end
		end
		do
			local f1 = "-" .. _g.jk.lang.String:safeString(str)
			local f2 = "--" .. _g.jk.lang.String:safeString(str)
			if _g.jk.lang.String:startsWith(cc, _g.jk.lang.String:safeString(f1) .. "=", 0) then
				do self:moveToNext() end
				self.optionValue = _g.jk.lang.String:getEndOfString(cc, _g.jk.lang.String:getLength(f1) + 1)
				do return true end
			end
			if _g.jk.lang.String:startsWith(cc, _g.jk.lang.String:safeString(f2) .. "=", 0) then
				do self:moveToNext() end
				self.optionValue = _g.jk.lang.String:getEndOfString(cc, _g.jk.lang.String:getLength(f2) + 1)
				do return true end
			end
			if cc == f1 or cc == f2 then
				do self:moveToNext() end
				self.optionValue = self:getCurrent()
				if not (self.optionValue ~= nil) then
					do self.position = self.position - 1 end
				else
					do self:moveToNext() end
					do return true end
				end
			end
			do return false end
		end
	end
end

function jk.console.ArgumentVector:acceptValue(value)
	if not (value ~= nil) then
		do return false end
	end
	do
		local cc = self:getCurrent()
		if not (cc ~= nil) then
			do return false end
		end
		if cc == value then
			do self:moveToNext() end
			do return true end
		end
		do return false end
	end
end

function jk.console.ArgumentVector:acceptAnyValue()
	local cc = self:getCurrent()
	if not (cc ~= nil) then
		do return nil end
	end
	do self:moveToNext() end
	do return cc end
end

function jk.console.ArgumentVector:acceptParameter()
	local cc = self:getCurrent()
	if not (cc ~= nil) then
		do return nil end
	end
	if _g.jk.lang.String:startsWith(cc, "-", 0) then
		do return nil end
	end
	do self:moveToNext() end
	do return cc end
end

function jk.console.ArgumentVector:requireParameter(name)
	local v = self:acceptParameter()
	if not (v ~= nil) then
		do _g.jk.lang.Error:throw("missingValue", name) end
	end
	do return v end
end

function jk.console.ArgumentVector:acceptAllValues()
	local v = {}
	while true do
		local cc = self:acceptAnyValue()
		if cc ~= nil then
			do _g.jk.lang.Vector:append(v, cc) end
		else
			do break end
		end
	end
	do return v end
end

function jk.console.ArgumentVector:getArgs()
	do return self.args end
end

function jk.console.ArgumentVector:setArgs(v)
	self.args = v
	do return self end
end

function jk.console.ArgumentVector:getPosition()
	do return self.position end
end

function jk.console.ArgumentVector:setPosition(v)
	self.position = v
	do return self end
end

function jk.console.ArgumentVector:getOptionValue()
	do return self.optionValue end
end

function jk.console.ArgumentVector:setOptionValue(v)
	self.optionValue = v
	do return self end
end

jk.console.Terminal = {}
jk.console.Terminal.__index = jk.console.Terminal
_vm:set_metatable(jk.console.Terminal, {})

function jk.console.Terminal._create()
	local v = _vm:set_metatable({}, jk.console.Terminal)
	return v
end

function jk.console.Terminal:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.Terminal'
	self['_isType.jk.console.Terminal'] = true
end

function jk.console.Terminal:_construct0()
	jk.console.Terminal._init(self)
	return self
end

function jk.console.Terminal:forCurrent()
	do return nil end
end

function jk.console.Terminal:clear()
end

function jk.console.Terminal:moveTo(x, y)
end

function jk.console.Terminal:print(text)
end

function jk.console.Terminal:printTo(x, y, text)
end

function jk.console.Terminal:readKey()
end

function jk.console.Terminal:readLine()
end

function jk.console.Terminal:readLineWithoutEcho()
end

jk.console.ConsoleApplicationUtil = {}
jk.console.ConsoleApplicationUtil.__index = jk.console.ConsoleApplicationUtil
_vm:set_metatable(jk.console.ConsoleApplicationUtil, {})

function jk.console.ConsoleApplicationUtil._create()
	local v = _vm:set_metatable({}, jk.console.ConsoleApplicationUtil)
	return v
end

function jk.console.ConsoleApplicationUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.ConsoleApplicationUtil'
	self['_isType.jk.console.ConsoleApplicationUtil'] = true
end

function jk.console.ConsoleApplicationUtil:_construct0()
	jk.console.ConsoleApplicationUtil._init(self)
	return self
end

function jk.console.ConsoleApplicationUtil:printHeader(out, title, version, copyright, license, platform, component)
	if not (out ~= nil) then
		do return end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if _g.jk.lang.String:isEmpty(title) then
			do sb:appendString("Untitled Application") end
		else
			do sb:appendString(title) end
		end
		if _g.jk.lang.String:isNotEmpty(component) then
			if sb:count() > 0 then
				do sb:appendCharacter(32) end
			end
			do sb:appendString(component) end
		end
		if _g.jk.lang.String:isNotEmpty(version) then
			do sb:appendString(" / ") end
			do sb:appendString(version) end
		end
		if _g.jk.lang.String:isNotEmpty(platform) then
			do sb:appendString(" @ ") end
			do sb:appendString(platform) end
		end
		if sb:count() > 0 then
			do sb:appendCharacter(10) end
		end
		if _g.jk.lang.String:isNotEmpty(copyright) then
			do sb:appendString(copyright) end
			do sb:appendCharacter(10) end
		end
		if _g.jk.lang.String:isNotEmpty(license) then
			do sb:appendString(license) end
			do sb:appendCharacter(10) end
		end
		if sb:count() > 0 then
			do sb:appendCharacter(10) end
		end
		if sb:count() > 0 then
			do out:print(sb:toString()) end
		end
	end
end

function jk.console.ConsoleApplicationUtil:printVersion(out, version, title)
	if not (out ~= nil) then
		do return end
	end
	if _g.jk.lang.String:isNotEmpty(title) then
		do out:println(_g.jk.lang.String:safeString(title) .. "/" .. _g.jk.lang.String:safeString(version)) end
	else
		do out:println(version) end
	end
end

function jk.console.ConsoleApplicationUtil:parseCommandLineArguments(args)
	local v = {}
	if args ~= nil then
		local n = 0
		local m = #args
		do
			n = 0
			while n < m do
				local arg = args[n + 1]
				if arg ~= nil then
					if _g.jk.lang.String:startsWith(arg, "-", 0) then
						if _g.jk.lang.String:getIndexOfCharacter(arg, 61, 0) > 0 then
							local comps = _g.jk.lang.String:split(arg, 61, 2)
							local key = _g.jk.lang.String:getEndOfString(comps[0 + 1], 1)
							local val = comps[1 + 1]
							do _g.jk.lang.Vector:append(v, _g.jk.console.CommandLineArgument._construct5(_g.jk.console.CommandLineArgument._create(), arg, nil, nil, key, val)) end
						else
							do _g.jk.lang.Vector:append(v, _g.jk.console.CommandLineArgument._construct5(_g.jk.console.CommandLineArgument._create(), arg, nil, _g.jk.lang.String:getEndOfString(arg, 1), nil, "true")) end
						end
					else
						do _g.jk.lang.Vector:append(v, _g.jk.console.CommandLineArgument._construct5(_g.jk.console.CommandLineArgument._create(), arg, arg, nil, nil, arg)) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.console.ConsoleApplicationUtil:getLongestString(strings, add, ov)
	local v = ov
	if strings ~= nil then
		local n = 0
		local m = #strings
		do
			n = 0
			while n < m do
				local string = (function(o)
					if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(o) then
						do return o end
					end
					do return nil end
				end)(strings[n + 1])
				if string ~= nil then
					local ss = _g.jk.lang.String:getLength(_g.jk.lang.String:asString(string[0 + 1])) + add
					if ss > v then
						v = ss
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.console.ConsoleApplicationUtil:printUsage(stdout, name, parameters, flags, options)
	local nn = name
	if _g.jk.lang.String:isEmpty(nn) then
		nn = _g.jk.process.CurrentProcess:getProcessName()
	end
	if _g.jk.lang.String:isEmpty(nn) then
		nn = "(command)"
	end
	do
		local ll = 0
		ll = _g.jk.console.ConsoleApplicationUtil:getLongestString(parameters, 0, ll)
		ll = _g.jk.console.ConsoleApplicationUtil:getLongestString(flags, 1, ll)
		ll = _g.jk.console.ConsoleApplicationUtil:getLongestString(options, 9, ll)
		do stdout:print("Usage: " .. _g.jk.lang.String:safeString(nn) .. " [parameters, flags and options]\n") end
		if _g.jk.lang.Array:isEmpty(parameters) == false then
			do stdout:print("\n") end
			do stdout:print("Supported Parameters:\n") end
			do stdout:print("\n") end
			if parameters ~= nil then
				local n = 0
				local m = #parameters
				do
					n = 0
					while n < m do
						local parameter = (function(o)
							if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(o) then
								do return o end
							end
							do return nil end
						end)(parameters[n + 1])
						if parameter ~= nil then
							do stdout:print("  " .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:padToLength(_g.jk.lang.String:asString(parameter[0 + 1]), ll, -1, 32)) .. " - " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(parameter[1 + 1])) .. "\n") end
						end
						do n = n + 1 end
					end
				end
			end
		end
		if _g.jk.lang.Array:isEmpty(flags) == false then
			do stdout:print("\n") end
			do stdout:print("Supported Flags:\n") end
			do stdout:print("\n") end
			if flags ~= nil then
				local n2 = 0
				local m2 = #flags
				do
					n2 = 0
					while n2 < m2 do
						local flag = (function(o)
							if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(o) then
								do return o end
							end
							do return nil end
						end)(flags[n2 + 1])
						if flag ~= nil then
							do stdout:print("  -" .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:padToLength(_g.jk.lang.String:asString(flag[0 + 1]), ll, -1, 32)) .. " - " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(flag[1 + 1])) .. "\n") end
						end
						do n2 = n2 + 1 end
					end
				end
			end
		end
		if _g.jk.lang.Array:isEmpty(options) == false then
			do stdout:print("\n") end
			do stdout:print("Supported Options:\n") end
			do stdout:print("\n") end
			if options ~= nil then
				local n3 = 0
				local m3 = #options
				do
					n3 = 0
					while n3 < m3 do
						local option = (function(o)
							if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(o) then
								do return o end
							end
							do return nil end
						end)(options[n3 + 1])
						if option ~= nil then
							do stdout:print("  -" .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:padToLength(_g.jk.lang.String:safeString(_g.jk.lang.String:asString(option[0 + 1])) .. "=<value>", ll, -1, 32)) .. " - " .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(option[1 + 1])) .. "\n") end
						end
						do n3 = n3 + 1 end
					end
				end
			end
		end
		do stdout:print("\n") end
	end
end

jk.console.ConsoleApplicationContext = {}
jk.console.ConsoleApplicationContext.__index = jk.console.ConsoleApplicationContext
_vm:set_metatable(jk.console.ConsoleApplicationContext, {})

function jk.console.ConsoleApplicationContext._create()
	local v = _vm:set_metatable({}, jk.console.ConsoleApplicationContext)
	return v
end

function jk.console.ConsoleApplicationContext:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.ConsoleApplicationContext'
	self['_isType.jk.console.ConsoleApplicationContext'] = true
	self['_isType.jk.app.ApplicationContext'] = true
	self['_isType.jk.log.LoggingContext'] = true
	self.applicationName = nil
	self.enableColor = true
	self.dumbMode = false
	self.showInfo = true
	self.showWarning = true
	self.showError = true
	self.showDebug = false
	self.enableStatus = true
	self.enableOutput = true
	self.autoClearStatus = true
	self.currentPrefix = nil
	self.lastStatus = false
	self.lastStatusLength = 0
	self.errorCounter = 0
	self.warningCounter = 0
	self.infoCounter = 0
	self.debugCounter = 0
	self.stdout = nil
end

function jk.console.ConsoleApplicationContext:forApplicationName(name)
	local v = _g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create())
	do v:setApplicationName(name) end
	do return v end
end

function jk.console.ConsoleApplicationContext:_construct0()
	jk.console.ConsoleApplicationContext._init(self)
	self.stdout = _g.jk.console.Stdout:instance()
	do
		local term = _g.jk.env.EnvironmentVariable:get("TERM")
		if term == nil or term == "cygwin" then
			self.enableColor = false
		end
		do
			local logColor = _g.jk.env.EnvironmentVariable:get("CONSOLE_LOG_COLOR")
			if logColor ~= nil then
				self.enableColor = _g.jk.lang.Boolean:asBoolean(logColor, false)
			end
			do
				local logDebug = _g.jk.env.EnvironmentVariable:get("CONSOLE_LOG_DEBUG")
				if not (logDebug ~= nil) then
					logDebug = _g.jk.env.EnvironmentVariable:get("CONSOLE_DEBUG")
				end
				if not (logDebug ~= nil) then
					logDebug = _g.jk.env.EnvironmentVariable:get("EQELA_DEBUG")
				end
				if logDebug ~= nil then
					do self:setEnableDebugMessages(_g.jk.lang.Boolean:asBoolean(logDebug, false)) end
				end
			end
		end
	end
	return self
end

function jk.console.ConsoleApplicationContext:isInDebugMode()
	do return self.showDebug end
end

function jk.console.ConsoleApplicationContext:setEnableDebugMessages(v)
	self.showDebug = v
	do return self end
end

function jk.console.ConsoleApplicationContext:useApplicationNameAsPrefix()
	self.currentPrefix = self.applicationName
	if _g.jk.lang.String:isEmpty(self.currentPrefix) then
		self.currentPrefix = _g.jk.process.CurrentProcess:getProcessName()
	end
end

function jk.console.ConsoleApplicationContext:resetCounters()
	self.errorCounter = 0
	self.warningCounter = 0
	self.infoCounter = 0
	self.debugCounter = 0
end

function jk.console.ConsoleApplicationContext:getErrorCount()
	do return self.errorCounter end
end

function jk.console.ConsoleApplicationContext:getWarningCount()
	do return self.warningCounter end
end

function jk.console.ConsoleApplicationContext:getInfoCount()
	do return self.infoCounter end
end

function jk.console.ConsoleApplicationContext:getDebugCount()
	do return self.debugCounter end
end

function jk.console.ConsoleApplicationContext:logError(message)
	if self.showError and self.enableOutput then
		do self:doPrintLine("ERROR", 91, self.currentPrefix, message) end
	end
	do self.errorCounter = self.errorCounter + 1 end
end

function jk.console.ConsoleApplicationContext:logWarning(message)
	if self.showWarning and self.enableOutput then
		do self:doPrintLine("WARNING", 95, self.currentPrefix, message) end
	end
	do self.warningCounter = self.warningCounter + 1 end
end

function jk.console.ConsoleApplicationContext:logInfo(message)
	if self.showInfo and self.enableOutput then
		do self:doPrintLine("INFO", -1, self.currentPrefix, message) end
	end
	do self.infoCounter = self.infoCounter + 1 end
end

function jk.console.ConsoleApplicationContext:logDebug(message)
	if self.showDebug and self.enableOutput then
		do self:doPrintLine("DEBUG", 96, self.currentPrefix, message) end
	end
	do self.debugCounter = self.debugCounter + 1 end
end

function jk.console.ConsoleApplicationContext:logStatus(message)
	if self.enableOutput and self.enableStatus then
		if self.currentPrefix ~= nil and message ~= nil then
			do self:doPrintStatus("[" .. _g.jk.lang.String:safeString(self.currentPrefix) .. "] " .. _g.jk.lang.String:safeString(message)) end
		else
			do self:doPrintStatus(message) end
		end
	end
end

function jk.console.ConsoleApplicationContext:getApplicationDataDirectory()
	do return self:getApplicationDataDirectoryForAppId(self.applicationName) end
end

function jk.console.ConsoleApplicationContext:getApplicationDataDirectoryForAppId(appId)
	local applicationName = appId
	if _g.jk.lang.String:isEmpty(applicationName) then
		applicationName = _g.jk.process.CurrentProcess:getProcessName()
	end
	if _g.jk.lang.String:isEmpty(applicationName) then
		do return nil end
	end
	do
		local v = nil
		if v == nil then
			v = _g.jk.fs.File:forRelativePath("." .. _g.jk.lang.String:safeString(applicationName), _g.jk.env.CommonPath:getHomeDirectory(), false)
		end
		do return v end
	end
end

function jk.console.ConsoleApplicationContext:doPrintLine(type, color, prefix, message)
	if self.autoClearStatus then
		do self:doPrintStatus(nil) end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if self.lastStatus then
			do sb:appendCharacter(10) end
		end
		if type ~= nil or prefix ~= nil then
			do sb:appendCharacter(91) end
			if self.dumbMode == false and self.enableColor and color >= 0 then
				do sb:appendCharacter(27) end
				do sb:appendCharacter(91) end
				do sb:appendInteger(color) end
				do sb:appendCharacter(109) end
			end
			if type ~= nil then
				do sb:appendString(type) end
				if prefix ~= nil then
					do sb:appendCharacter(58) end
				end
			end
			if prefix ~= nil then
				do sb:appendString(prefix) end
			end
			if self.dumbMode == false and self.enableColor and color >= 0 then
				do sb:appendCharacter(27) end
				do sb:appendString("[39m") end
			end
			do sb:appendCharacter(93) end
			do sb:appendCharacter(32) end
		end
		do sb:appendString(message) end
		do sb:appendCharacter(10) end
		if self.stdout ~= nil then
			do self.stdout:print(sb:toString()) end
		end
		self.lastStatus = false
	end
end

function jk.console.ConsoleApplicationContext:doPrintStatus(m)
	if self.showDebug and m ~= nil then
		do self:doPrintLine(nil, -1, nil, m) end
		do return end
	end
	if self.dumbMode then
		if m == nil then
			do return end
		end
		if self.stdout ~= nil then
			do self.stdout:print(_g.jk.lang.String:safeString(m) .. "\n") end
		end
		do return end
	end
	if self.lastStatusLength < 1 and m == nil then
		do return end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendCharacter(13) end
		do
			local n = 0
			while n < self.lastStatusLength do
				do sb:appendCharacter(32) end
				do n = n + 1 end
			end
		end
		do sb:appendCharacter(13) end
		do
			local rm = m
			if rm ~= nil then
				local width = 0
				if width > 0 and _g.jk.lang.String:getLength(rm) >= width then
					rm = _g.jk.lang.String:safeString(_g.jk.lang.String:getSubString(rm, 0, width - 4)) .. " .."
				end
				do sb:appendString(rm) end
			end
			if self.stdout ~= nil then
				do self.stdout:print(sb:toString()) end
			end
			if m ~= nil then
				self.lastStatusLength = _g.jk.lang.String:getLength(rm)
			else
				self.lastStatusLength = 0
			end
			if rm == nil then
				self.lastStatus = false
			else
				self.lastStatus = true
			end
		end
	end
end

function jk.console.ConsoleApplicationContext:getApplicationName()
	do return self.applicationName end
end

function jk.console.ConsoleApplicationContext:setApplicationName(v)
	self.applicationName = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getEnableColor()
	do return self.enableColor end
end

function jk.console.ConsoleApplicationContext:setEnableColor(v)
	self.enableColor = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getDumbMode()
	do return self.dumbMode end
end

function jk.console.ConsoleApplicationContext:setDumbMode(v)
	self.dumbMode = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getShowInfo()
	do return self.showInfo end
end

function jk.console.ConsoleApplicationContext:setShowInfo(v)
	self.showInfo = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getShowWarning()
	do return self.showWarning end
end

function jk.console.ConsoleApplicationContext:setShowWarning(v)
	self.showWarning = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getShowError()
	do return self.showError end
end

function jk.console.ConsoleApplicationContext:setShowError(v)
	self.showError = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getShowDebug()
	do return self.showDebug end
end

function jk.console.ConsoleApplicationContext:setShowDebug(v)
	self.showDebug = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getEnableStatus()
	do return self.enableStatus end
end

function jk.console.ConsoleApplicationContext:setEnableStatus(v)
	self.enableStatus = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getEnableOutput()
	do return self.enableOutput end
end

function jk.console.ConsoleApplicationContext:setEnableOutput(v)
	self.enableOutput = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getAutoClearStatus()
	do return self.autoClearStatus end
end

function jk.console.ConsoleApplicationContext:setAutoClearStatus(v)
	self.autoClearStatus = v
	do return self end
end

function jk.console.ConsoleApplicationContext:getCurrentPrefix()
	do return self.currentPrefix end
end

function jk.console.ConsoleApplicationContext:setCurrentPrefix(v)
	self.currentPrefix = v
	do return self end
end

jk.console.CommandLineArgument = {}
jk.console.CommandLineArgument.__index = jk.console.CommandLineArgument
_vm:set_metatable(jk.console.CommandLineArgument, {})

function jk.console.CommandLineArgument._create()
	local v = _vm:set_metatable({}, jk.console.CommandLineArgument)
	return v
end

function jk.console.CommandLineArgument:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.CommandLineArgument'
	self['_isType.jk.console.CommandLineArgument'] = true
	self.arg = nil
	self.parameter = nil
	self.flag = nil
	self.key = nil
	self.value = nil
end

function jk.console.CommandLineArgument:_construct0()
	jk.console.CommandLineArgument._init(self)
	return self
end

function jk.console.CommandLineArgument:_construct5(arg, parameter, flag, key, value)
	jk.console.CommandLineArgument._init(self)
	self.arg = arg
	self.parameter = parameter
	self.flag = flag
	self.key = key
	self.value = value
	return self
end

function jk.console.CommandLineArgument:isParameter()
	if self.parameter ~= nil then
		do return true end
	end
	do return false end
end

function jk.console.CommandLineArgument:isAnyFlag()
	if self.flag ~= nil then
		do return true end
	end
	do return false end
end

function jk.console.CommandLineArgument:isAnyOption()
	if self.key ~= nil then
		do return true end
	end
	do return false end
end

function jk.console.CommandLineArgument:isFlag(text)
	if text ~= nil and _g.jk.lang.String:equalsIgnoreCase(text, self.flag) then
		do return true end
	end
	do return false end
end

function jk.console.CommandLineArgument:isOption(text)
	if text ~= nil and _g.jk.lang.String:equalsIgnoreCase(text, self.key) then
		do return true end
	end
	do return false end
end

function jk.console.CommandLineArgument:hasValue()
	if self.value ~= nil then
		do return true end
	end
	do return false end
end

function jk.console.CommandLineArgument:getKey()
	do return self.key end
end

function jk.console.CommandLineArgument:getComplete()
	do return self.arg end
end

function jk.console.CommandLineArgument:getStringValue()
	do return self.value end
end

function jk.console.CommandLineArgument:getIntegerValue()
	do return _g.jk.lang.Integer:asInteger(self.value) end
end

function jk.console.CommandLineArgument:getBooleanValue()
	do return _g.jk.lang.Boolean:asBoolean(self.value, false) end
end

function jk.console.CommandLineArgument:reportAsUnsupported(ctx)
	do _g.jk.log.Log:error(ctx, "Unsupported command line parameter: `" .. _g.jk.lang.String:safeString(self.arg) .. "'") end
end

jk.console.Stdout = {}
jk.console.Stdout.__index = jk.console.Stdout
_vm:set_metatable(jk.console.Stdout, {})

function jk.console.Stdout._create()
	local v = _vm:set_metatable({}, jk.console.Stdout)
	return v
end

function jk.console.Stdout:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.Stdout'
	self['_isType.jk.console.Stdout'] = true
end

function jk.console.Stdout:_construct0()
	jk.console.Stdout._init(self)
	return self
end

function jk.console.Stdout:instance()
	do return _g.jk.console.StdoutForSushi._construct0(_g.jk.console.StdoutForSushi._create()) end
end

jk.console.UsageInfo = {}
jk.console.UsageInfo.__index = jk.console.UsageInfo
_vm:set_metatable(jk.console.UsageInfo, {})

function jk.console.UsageInfo._create()
	local v = _vm:set_metatable({}, jk.console.UsageInfo)
	return v
end

function jk.console.UsageInfo:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.UsageInfo'
	self['_isType.jk.console.UsageInfo'] = true
	self.command = nil
	self.description = nil
	self.paramDesc = nil
	self.data = nil
end

function jk.console.UsageInfo:forCommand(command)
	local v = _g.jk.console.UsageInfo._construct0(_g.jk.console.UsageInfo._create())
	do v:setCommand(command) end
	do return v end
end

jk.console.UsageInfo.Parameter = {}
jk.console.UsageInfo.Parameter.__index = jk.console.UsageInfo.Parameter
_vm:set_metatable(jk.console.UsageInfo.Parameter, {})

function jk.console.UsageInfo.Parameter._create()
	local v = _vm:set_metatable({}, jk.console.UsageInfo.Parameter)
	return v
end

function jk.console.UsageInfo.Parameter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.UsageInfo.Parameter'
	self['_isType.jk.console.UsageInfo.Parameter'] = true
	self.name = nil
	self.description = nil
end

function jk.console.UsageInfo.Parameter:_construct0()
	jk.console.UsageInfo.Parameter._init(self)
	return self
end

jk.console.UsageInfo.Flag = {}
jk.console.UsageInfo.Flag.__index = jk.console.UsageInfo.Flag
_vm:set_metatable(jk.console.UsageInfo.Flag, {})

function jk.console.UsageInfo.Flag._create()
	local v = _vm:set_metatable({}, jk.console.UsageInfo.Flag)
	return v
end

function jk.console.UsageInfo.Flag:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.UsageInfo.Flag'
	self['_isType.jk.console.UsageInfo.Flag'] = true
	self.flag = nil
	self.description = nil
end

function jk.console.UsageInfo.Flag:_construct0()
	jk.console.UsageInfo.Flag._init(self)
	return self
end

jk.console.UsageInfo.Option = {}
jk.console.UsageInfo.Option.__index = jk.console.UsageInfo.Option
_vm:set_metatable(jk.console.UsageInfo.Option, {})

function jk.console.UsageInfo.Option._create()
	local v = _vm:set_metatable({}, jk.console.UsageInfo.Option)
	return v
end

function jk.console.UsageInfo.Option:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.UsageInfo.Option'
	self['_isType.jk.console.UsageInfo.Option'] = true
	self.name = nil
	self.value = nil
	self.description = nil
end

function jk.console.UsageInfo.Option:_construct0()
	jk.console.UsageInfo.Option._init(self)
	return self
end

function jk.console.UsageInfo:_construct0()
	jk.console.UsageInfo._init(self)
	self.data = {}
	self.paramDesc = "[parameters]"
	self.command = _g.jk.process.CurrentProcess:getProcessName()
	if _g.jk.lang.String:isEmpty(self.command) then
		self.command = "(command)"
	end
	return self
end

function jk.console.UsageInfo:ensureSection()
	if _g.jk.lang.Vector:getSize(self.data) < 1 then
		do self:addSection("Available parameters") end
	end
end

function jk.console.UsageInfo:addSection(name)
	do _g.jk.lang.Vector:append(self.data, name) end
end

function jk.console.UsageInfo:addParameter(name, description)
	do self:ensureSection() end
	do
		local p = _g.jk.console.UsageInfo.Parameter._construct0(_g.jk.console.UsageInfo.Parameter._create())
		p.name = name
		p.description = description
		do _g.jk.lang.Vector:append(self.data, p) end
	end
end

function jk.console.UsageInfo:addFlag(flag, description)
	do self:ensureSection() end
	do
		local f = _g.jk.console.UsageInfo.Flag._construct0(_g.jk.console.UsageInfo.Flag._create())
		f.flag = flag
		f.description = description
		do _g.jk.lang.Vector:append(self.data, f) end
	end
end

function jk.console.UsageInfo:addOption(name, value, description)
	do self:ensureSection() end
	do
		local o = _g.jk.console.UsageInfo.Option._construct0(_g.jk.console.UsageInfo.Option._create())
		o.name = name
		o.value = value
		o.description = description
		do _g.jk.lang.Vector:append(self.data, o) end
	end
end

function jk.console.UsageInfo:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString("Usage: ") end
	do sb:appendString(self.command) end
	if _g.jk.lang.String:isEmpty(self.paramDesc) == false then
		do sb:appendCharacter(32) end
		do sb:appendString(self.paramDesc) end
	end
	do sb:appendCharacter(10) end
	do sb:appendCharacter(10) end
	if _g.jk.lang.String:isEmpty(self.description) == false then
		do sb:appendString(self.description) end
		do sb:appendCharacter(10) end
		do sb:appendCharacter(10) end
	end
	do
		local longest = 0
		local db = true
		if self.data ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.data)
			do
				n = 0
				while n < m do
					local o = self.data[n + 1]
					if o ~= nil then
						if (_vm:to_table_with_key(o, '_isType.jk.console.UsageInfo.Parameter') ~= nil) then
							local nn = o.name
							if not (nn == nil) then
								local ll = _g.jk.lang.String:getLength(nn)
								if ll > longest then
									longest = ll
								end
							end
						elseif (_vm:to_table_with_key(o, '_isType.jk.console.UsageInfo.Flag') ~= nil) then
							local ff = o.flag
							if not (ff == nil) then
								local ll = _g.jk.lang.String:getLength(ff) + 1
								if ll > longest then
									longest = ll
								end
							end
						elseif (_vm:to_table_with_key(o, '_isType.jk.console.UsageInfo.Option') ~= nil) then
							local name = o.name
							local value = o.value
							local ll = 1 + _g.jk.lang.String:getLength(name) + 2 + _g.jk.lang.String:getLength(value) + 1
							if ll > longest then
								longest = ll
							end
						end
					end
					do n = n + 1 end
				end
			end
		end
		if longest < 30 then
			longest = 30
		end
		if self.data ~= nil then
			local n2 = 0
			local m2 = _g.jk.lang.Vector:getSize(self.data)
			do
				n2 = 0
				while n2 < m2 do
					local o = self.data[n2 + 1]
					if o ~= nil then
						if (_vm:get_variable_type(o) == 'string') or (_vm:to_table_with_key(o, '_isType.jk.lang.StringObject') ~= nil) then
							if db == false then
								do sb:appendCharacter(10) end
							end
							do sb:appendString(_g.jk.lang.String:asString(o)) end
							do sb:appendCharacter(58) end
							do sb:appendCharacter(10) end
							do sb:appendCharacter(10) end
							db = true
						elseif (_vm:to_table_with_key(o, '_isType.jk.console.UsageInfo.Parameter') ~= nil) then
							local p = o
							do sb:appendString("  ") end
							do sb:appendString(_g.jk.text.StringUtil:padToLength(p.name, longest, -1, 32)) end
							if _g.jk.lang.String:isEmpty(p.description) == false then
								do sb:appendString(" - ") end
								do sb:appendString(p.description) end
							end
							do sb:appendCharacter(10) end
							db = false
						elseif (_vm:to_table_with_key(o, '_isType.jk.console.UsageInfo.Flag') ~= nil) then
							local p = o
							do sb:appendString("  -") end
							do sb:appendString(_g.jk.text.StringUtil:padToLength(p.flag, longest - 1, -1, 32)) end
							if _g.jk.lang.String:isEmpty(p.description) == false then
								do sb:appendString(" - ") end
								do sb:appendString(p.description) end
							end
							do sb:appendCharacter(10) end
							db = false
						elseif (_vm:to_table_with_key(o, '_isType.jk.console.UsageInfo.Option') ~= nil) then
							local p = o
							do sb:appendString("  ") end
							do sb:appendString(_g.jk.text.StringUtil:padToLength("-" .. _g.jk.lang.String:safeString(p.name) .. "=[" .. _g.jk.lang.String:safeString(p.value) .. "]", longest, -1, 32)) end
							if _g.jk.lang.String:isEmpty(p.description) == false then
								do sb:appendString(" - ") end
								do sb:appendString(p.description) end
							end
							do sb:appendCharacter(10) end
							db = false
						end
					end
					do n2 = n2 + 1 end
				end
			end
		end
		do return sb:toString() end
	end
end

function jk.console.UsageInfo:getCommand()
	do return self.command end
end

function jk.console.UsageInfo:setCommand(v)
	self.command = v
	do return self end
end

function jk.console.UsageInfo:getDescription()
	do return self.description end
end

function jk.console.UsageInfo:setDescription(v)
	self.description = v
	do return self end
end

function jk.console.UsageInfo:getParamDesc()
	do return self.paramDesc end
end

function jk.console.UsageInfo:setParamDesc(v)
	self.paramDesc = v
	do return self end
end

jk.console.StdinForSushi = {}
jk.console.StdinForSushi.__index = jk.console.StdinForSushi
_vm:set_metatable(jk.console.StdinForSushi, {})

function jk.console.StdinForSushi._create()
	local v = _vm:set_metatable({}, jk.console.StdinForSushi)
	return v
end

function jk.console.StdinForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.StdinForSushi'
	self['_isType.jk.console.StdinForSushi'] = true
	self['_isType.jk.io.Reader'] = true
end

function jk.console.StdinForSushi:_construct0()
	jk.console.StdinForSushi._init(self)
	return self
end

function jk.console.StdinForSushi:read(buf)
	if buf == nil then
		do return 0 end
	end
	do
		local v = 0
		do v = _io:read_from_handle(0, buf) end
		do return v end
	end
end

jk.console.Stdin = {}
jk.console.Stdin.__index = jk.console.Stdin
_vm:set_metatable(jk.console.Stdin, {})

function jk.console.Stdin._create()
	local v = _vm:set_metatable({}, jk.console.Stdin)
	return v
end

function jk.console.Stdin:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.Stdin'
	self['_isType.jk.console.Stdin'] = true
end

function jk.console.Stdin:_construct0()
	jk.console.Stdin._init(self)
	return self
end

function jk.console.Stdin:instance()
	local reader = nil
	reader = _g.jk.console.StdinForSushi._construct0(_g.jk.console.StdinForSushi._create())
	if not (reader ~= nil) then
		do return nil end
	end
	do return _g.jk.io.PrintReader:forReader(reader) end
end

jk.console.ConsoleApplicationMain = {}
jk.console.ConsoleApplicationMain.__index = jk.console.ConsoleApplicationMain
_vm:set_metatable(jk.console.ConsoleApplicationMain, {})

function jk.console.ConsoleApplicationMain._create()
	local v = _vm:set_metatable({}, jk.console.ConsoleApplicationMain)
	return v
end

function jk.console.ConsoleApplicationMain:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.console.ConsoleApplicationMain'
	self['_isType.jk.console.ConsoleApplicationMain'] = true
	self.stdout = nil
	self.stdin = nil
	self.ctx = nil
	self.args = nil
	self.verbosityLevel = 3
	self.terminal = nil
end

function jk.console.ConsoleApplicationMain:executeMain(app, args)
	if not (app ~= nil) then
		do return -1 end
	end
	do return app:executeWithArgumentArray(args) end
end

function jk.console.ConsoleApplicationMain:_construct0()
	jk.console.ConsoleApplicationMain._init(self)
	self.stdin = _g.jk.console.Stdin:instance()
	self.stdout = _g.jk.console.Stdout:instance()
	self.ctx = _g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create())
	return self
end

function jk.console.ConsoleApplicationMain:setCtx(v)
	self.ctx = v
	do return self end
end

function jk.console.ConsoleApplicationMain:getTerminal()
	if not (self.terminal ~= nil) then
		self.terminal = _g.jk.console.Terminal:forCurrent()
	end
	do return self.terminal end
end

function jk.console.ConsoleApplicationMain:print(string)
	if self.stdout ~= nil then
		do self.stdout:print(string) end
	end
end

function jk.console.ConsoleApplicationMain:println(string)
	if self.stdout ~= nil then
		do self.stdout:println(string) end
	end
end

function jk.console.ConsoleApplicationMain:readLine()
	local tt = self:getTerminal()
	if tt ~= nil then
		do return tt:readLine() end
	end
	if self.stdin ~= nil then
		do return self.stdin:readLine() end
	end
	do return nil end
end

function jk.console.ConsoleApplicationMain:readLineWithoutEcho()
	local tt = self:getTerminal()
	if tt ~= nil then
		do return tt:readLineWithoutEcho() end
	end
	do return self:readLine() end
end

function jk.console.ConsoleApplicationMain:initialize()
	do return true end
end

function jk.console.ConsoleApplicationMain:getVerbosityLevel()
	do return self.verbosityLevel end
end

function jk.console.ConsoleApplicationMain:setVerbosityLevel(level)
	self.verbosityLevel = level
	if self.verbosityLevel <= 0 then
		do self.ctx:setEnableOutput(false) end
	elseif self.verbosityLevel == 1 then
		do self.ctx:setEnableOutput(true) end
		do self.ctx:setShowError(true) end
		do self.ctx:setShowWarning(false) end
		do self.ctx:setShowInfo(false) end
		do self.ctx:setShowDebug(false) end
	elseif self.verbosityLevel == 2 then
		do self.ctx:setEnableOutput(true) end
		do self.ctx:setShowError(true) end
		do self.ctx:setShowWarning(true) end
		do self.ctx:setShowInfo(false) end
		do self.ctx:setShowDebug(false) end
	elseif self.verbosityLevel == 3 then
		do self.ctx:setEnableOutput(true) end
		do self.ctx:setShowError(true) end
		do self.ctx:setShowWarning(true) end
		do self.ctx:setShowInfo(true) end
		do self.ctx:setShowDebug(false) end
	else
		do self.ctx:setEnableOutput(true) end
		do self.ctx:setShowError(true) end
		do self.ctx:setShowWarning(true) end
		do self.ctx:setShowInfo(true) end
		do self.ctx:setShowDebug(true) end
	end
end

function jk.console.ConsoleApplicationMain:handleVerbosityParams()
	local nargs = {}
	local vl = self.verbosityLevel
	if self.args ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.args)
		do
			n = 0
			while n < m do
				local arg = self.args[n + 1]
				if arg ~= nil then
					if arg:isFlag("v0") then
						vl = 0
					elseif arg:isFlag("v1") then
						vl = 1
					elseif arg:isFlag("v2") then
						vl = 2
					elseif arg:isFlag("v3") then
						vl = 3
					elseif arg:isFlag("v4") or arg:isFlag("vv") or arg:isFlag("debug") then
						vl = 4
					else
						do _g.jk.lang.Vector:append(nargs, arg) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	self.args = nargs
	if vl ~= self.verbosityLevel then
		do self:setVerbosityLevel(vl) end
	end
end

function jk.console.ConsoleApplicationMain:executeWithArgumentArray(args)
	if args ~= nil then
		self.args = _g.jk.console.ConsoleApplicationUtil:parseCommandLineArguments(args)
	end
	if not self:initialize() then
		do return 1 end
	end
	do
		local r = self:execute()
		do _g.jk.log.Log:status(self.ctx, nil) end
		if r then
			do return 0 end
		end
		do return 1 end
	end
end

function jk.console.ConsoleApplicationMain:executeWithArgumentVector(args)
	local arga = nil
	if args ~= nil then
		arga = _vm:allocate_array(_g.jk.lang.Vector:getSize(args))
		do
			local n = 0
			if args ~= nil then
				local n2 = 0
				local m = _g.jk.lang.Vector:getSize(args)
				do
					n2 = 0
					while n2 < m do
						local arg = args[n2 + 1]
						if arg ~= nil then
							arga[(function() local v = n n = n + 1 return v end)() + 1] = arg
						end
						do n2 = n2 + 1 end
					end
				end
			end
		end
	end
	do return self:executeWithArgumentArray(arga) end
end

function jk.console.ConsoleApplicationMain:executeWithParsedArguments(args)
	self.args = args
	if not self:initialize() then
		do return false end
	end
	do
		local r = self:execute()
		do _g.jk.log.Log:status(self.ctx, nil) end
		do return r end
	end
end

function jk.console.ConsoleApplicationMain:execute()
end
