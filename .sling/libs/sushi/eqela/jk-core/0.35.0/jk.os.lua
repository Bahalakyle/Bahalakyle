jk = jk or {}

jk.os = jk.os or {}

jk.os.OS = {}
jk.os.OS.__index = jk.os.OS
_vm:set_metatable(jk.os.OS, {})

jk.os.OS.isWindowsFlag = nil
jk.os.OS.isLinuxFlag = nil
jk.os.OS.isMacOSFlag = nil
jk.os.OS.isAndroidFlag = nil
jk.os.OS.isIOSFlag = nil

function jk.os.OS._create()
	local v = _vm:set_metatable({}, jk.os.OS)
	return v
end

function jk.os.OS:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.os.OS'
	self['_isType.jk.os.OS'] = true
end

function jk.os.OS:_construct0()
	jk.os.OS._init(self)
	return self
end

function jk.os.OS:getCurrentPlatformName()
	do return "Sushi" end
end

function jk.os.OS:is32Bit()
	local cpu = _g.jk.os.OS:getProcessorType()
	if cpu == "x86" or cpu == "arm" then
		do return true end
	end
	do return false end
end

function jk.os.OS:is64Bit()
	local cpu = _g.jk.os.OS:getProcessorType()
	if cpu == "x64" or cpu == "arm64" then
		do return true end
	end
	do return false end
end

function jk.os.OS:getProcessorType()
	do return nil end
end

function jk.os.OS:isWindows()
	if _g.jk.os.OS.isWindowsFlag ~= nil then
		do return _g.jk.os.OS.isWindowsFlag:toBoolean() end
	end
	do
		local v = _g.jk.os.OS:isSystemType("windows")
		_g.jk.os.OS.isWindowsFlag = _g.jk.lang.Boolean:asObject(v)
		do return v end
	end
end

function jk.os.OS:isLinux()
	if _g.jk.os.OS.isLinuxFlag ~= nil then
		do return _g.jk.os.OS.isLinuxFlag:toBoolean() end
	end
	do
		local v = _g.jk.os.OS:isSystemType("linux")
		_g.jk.os.OS.isLinuxFlag = _g.jk.lang.Boolean:asObject(v)
		do return v end
	end
end

function jk.os.OS:isMacOS()
	if _g.jk.os.OS.isMacOSFlag ~= nil then
		do return _g.jk.os.OS.isMacOSFlag:toBoolean() end
	end
	do
		local v = _g.jk.os.OS:isSystemType("macos")
		_g.jk.os.OS.isMacOSFlag = _g.jk.lang.Boolean:asObject(v)
		do return v end
	end
end

function jk.os.OS:isOSX()
	do return _g.jk.os.OS:isMacOS() end
end

function jk.os.OS:isAndroid()
	if _g.jk.os.OS.isAndroidFlag ~= nil then
		do return _g.jk.os.OS.isAndroidFlag:toBoolean() end
	end
	do
		local v = _g.jk.os.OS:isSystemType("android")
		_g.jk.os.OS.isAndroidFlag = _g.jk.lang.Boolean:asObject(v)
		do return v end
	end
end

function jk.os.OS:isIOS()
	if _g.jk.os.OS.isIOSFlag ~= nil then
		do return _g.jk.os.OS.isIOSFlag:toBoolean() end
	end
	do
		local v = _g.jk.os.OS:isSystemType("ios")
		_g.jk.os.OS.isIOSFlag = _g.jk.lang.Boolean:asObject(v)
		do return v end
	end
end

function jk.os.OS:isSystemType(ida)
	local id = ida
	if id == "osx" then
		id = "macos"
	end
	do
		local type = _os:get_system_type()
		do return type == id end
	end
end

function jk.os.OS:isDirectory(path)
	if not _g.jk.lang.String:isNotEmpty(path) then
		do return false end
	end
	_io:write_to_stdout("[jk.os.OS.isDirectory] (OS.sling:385:3): Not implemented" .. "\n")
	do return false end
end

function jk.os.OS:isFile(path)
	if not _g.jk.lang.String:isNotEmpty(path) then
		do return false end
	end
	_io:write_to_stdout("[jk.os.OS.isFile] (OS.sling:423:3): Not implemented" .. "\n")
	do return false end
end
