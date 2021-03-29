jk = jk or {}

jk.env = jk.env or {}

jk.env.TemporaryDirectory = {}
jk.env.TemporaryDirectory.__index = jk.env.TemporaryDirectory
_vm:set_metatable(jk.env.TemporaryDirectory, {})

function jk.env.TemporaryDirectory._create()
	local v = _vm:set_metatable({}, jk.env.TemporaryDirectory)
	return v
end

function jk.env.TemporaryDirectory:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.env.TemporaryDirectory'
	self['_isType.jk.env.TemporaryDirectory'] = true
end

function jk.env.TemporaryDirectory:_construct0()
	jk.env.TemporaryDirectory._init(self)
	return self
end

function jk.env.TemporaryDirectory:create()
	do return _g.jk.env.TemporaryDirectory:forDirectory(nil) end
end

function jk.env.TemporaryDirectory:forDirectory(dir)
	local ff = _g.jk.env.TemporaryFile:forDirectory(dir, nil)
	if not (ff ~= nil) then
		do return nil end
	end
	do ff:remove() end
	do ff:createDirectoryRecursive() end
	if not ff:isDirectory() then
		do return nil end
	end
	do return ff end
end

jk.env.ExternalCommand = {}
jk.env.ExternalCommand.__index = jk.env.ExternalCommand
_vm:set_metatable(jk.env.ExternalCommand, {})

function jk.env.ExternalCommand._create()
	local v = _vm:set_metatable({}, jk.env.ExternalCommand)
	return v
end

function jk.env.ExternalCommand:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.env.ExternalCommand'
	self['_isType.jk.env.ExternalCommand'] = true
end

function jk.env.ExternalCommand:_construct0()
	jk.env.ExternalCommand._init(self)
	return self
end

function jk.env.ExternalCommand:findInPath(command)
	if not (command ~= nil) then
		do return nil end
	end
	do
		local path = _g.jk.env.EnvironmentVariable:get("PATH")
		if not _g.jk.lang.String:isNotEmpty(path) then
			do return nil end
		end
		do
			local separator = 58
			if _g.jk.os.OS:isWindows() then
				separator = 59
			end
			do
				local array = _g.jk.lang.String:split(path, separator, 0)
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local dir = array[n + 1]
							if dir ~= nil then
								local pp = _g.jk.fs.File:forPath(dir):rawEntry(command):asExecutable()
								if pp:isFile() then
									do return pp end
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

jk.env.CommonPath = {}
jk.env.CommonPath.__index = jk.env.CommonPath
_vm:set_metatable(jk.env.CommonPath, {})

function jk.env.CommonPath._create()
	local v = _vm:set_metatable({}, jk.env.CommonPath)
	return v
end

function jk.env.CommonPath:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.env.CommonPath'
	self['_isType.jk.env.CommonPath'] = true
end

function jk.env.CommonPath:_construct0()
	jk.env.CommonPath._init(self)
	return self
end

function jk.env.CommonPath:getTemporaryDirectory()
	if _g.jk.os.OS:isLinux() or _g.jk.os.OS:isMacOS() then
		do return _g.jk.fs.File:forPath("/tmp") end
	end
	_io:write_to_stdout("[jk.env.CommonPath.getTemporaryDirectory] (CommonPath.sling:45:3): Not implemented" .. "\n")
	do return _g.jk.fs.FileInvalid._construct0(_g.jk.fs.FileInvalid._create()) end
end

function jk.env.CommonPath:getHomeDirectory()
	local dirname = _g.jk.env.EnvironmentVariable:get("HOME")
	if _g.jk.lang.String:isNotEmpty(dirname) then
		do return _g.jk.fs.File:forPath(dirname) end
	end
	do return nil end
end

function jk.env.CommonPath:getAppDirectory()
	local program = _vm:get_program_path()
	if not _g.jk.lang.String:isNotEmpty(program) then
		do return nil end
	end
	do
		local pf = _g.jk.fs.File:forPath(program)
		if not (pf ~= nil) then
			do return nil end
		end
		do return pf:getParent() end
	end
end

function jk.env.CommonPath:getCodeFileForObject(oo)
	if not (oo ~= nil) then
		do return nil end
	end
	do return nil end
end

function jk.env.CommonPath:getProgramFilesDirectory()
	do return nil end
end

function jk.env.CommonPath:getProgramFilesX86Directory()
	do return nil end
end

function jk.env.CommonPath:getApplicationsDirectory()
	if _g.jk.os.OS:isMacOS() then
		local v = _g.jk.fs.File:forPath("/Applications")
		if v:isDirectory() == false then
			v = nil
		end
		do return v end
	end
	do return nil end
end

jk.env.EnvironmentVariable = {}
jk.env.EnvironmentVariable.__index = jk.env.EnvironmentVariable
_vm:set_metatable(jk.env.EnvironmentVariable, {})

function jk.env.EnvironmentVariable._create()
	local v = _vm:set_metatable({}, jk.env.EnvironmentVariable)
	return v
end

function jk.env.EnvironmentVariable:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.env.EnvironmentVariable'
	self['_isType.jk.env.EnvironmentVariable'] = true
end

function jk.env.EnvironmentVariable:_construct0()
	jk.env.EnvironmentVariable._init(self)
	return self
end

function jk.env.EnvironmentVariable:getAll()
	local v = {}
	local envs = _os:get_all_environment_variables()
	if envs ~= nil then
		if envs ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(envs)
			do
				n = 0
				while n < m do
					local env = envs[n + 1]
					if env ~= nil then
						local comps = _g.jk.lang.String:split(env, 61, 2)
						local key = _g.jk.lang.Vector:get(comps, 0)
						local val = _g.jk.lang.Vector:get(comps, 1)
						if not (key ~= nil) then
							goto _continue1
						end
						if not (val ~= nil) then
							val = ""
						end
						do _g.jk.lang.Map:set(v, key, val) end
					end
					::_continue1::
					do n = n + 1 end
				end
			end
		end
	end
	do return v end
end

function jk.env.EnvironmentVariable:get(key)
	if not (key ~= nil) then
		do return nil end
	end
	do
		local v = nil
		do v = _os:get_environment_variable(key) end
		do return v end
	end
end

function jk.env.EnvironmentVariable:set(key, val)
	if not (key ~= nil) then
		do return end
	end
	_io:write_to_stdout("[jk.env.EnvironmentVariable.set] (EnvironmentVariable.sling:135:3): Not implemented" .. "\n")
end

function jk.env.EnvironmentVariable:unset(key)
	_io:write_to_stdout("[jk.env.EnvironmentVariable.unset] (EnvironmentVariable.sling:141:2): Not implemented" .. "\n")
end

jk.env.TemporaryFile = {}
jk.env.TemporaryFile.__index = jk.env.TemporaryFile
_vm:set_metatable(jk.env.TemporaryFile, {})

function jk.env.TemporaryFile._create()
	local v = _vm:set_metatable({}, jk.env.TemporaryFile)
	return v
end

function jk.env.TemporaryFile:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.env.TemporaryFile'
	self['_isType.jk.env.TemporaryFile'] = true
end

function jk.env.TemporaryFile:_construct0()
	jk.env.TemporaryFile._init(self)
	return self
end

function jk.env.TemporaryFile:create(extension)
	do return _g.jk.env.TemporaryFile:forDirectory(nil, extension) end
end

function jk.env.TemporaryFile:forDirectory(dir, extension)
	local tmpdir = dir
	if tmpdir == nil then
		tmpdir = _g.jk.env.CommonPath:getTemporaryDirectory()
	end
	if tmpdir == nil then
		do return nil end
	end
	do tmpdir:createDirectoryRecursive() end
	if tmpdir:isDirectory() == false then
		do return nil end
	end
	do
		local v = nil
		local n = 0
		local rnd = _g.jk.random.Random._construct0(_g.jk.random.Random._create())
		while n < 100 do
			local id = "_tmp_" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(_g.jk.time.SystemClock:asSeconds())) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(_util:convert_to_integer(rnd:nextInt1() % 1000000)))
			if extension == nil or _g.jk.lang.String:getLength(extension) < 1 then
				id = _g.jk.lang.String:safeString(id) .. _g.jk.lang.String:safeString(extension)
			end
			v = tmpdir:entry(id)
			if v:exists() == false then
				do v:touch() end
				do break end
			end
			do n = n + 1 end
		end
		if v ~= nil and v:isFile() == false then
			v = nil
		end
		do return v end
	end
end

function jk.env.TemporaryFile:forString(data)
	if not (data ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.env.TemporaryFile:create(nil)
		if not (v ~= nil) then
			do return nil end
		end
		if not v:setContentsUTF8(data) then
			do v:remove() end
			do return nil end
		end
		do return v end
	end
end

function jk.env.TemporaryFile:forBuffer(data)
	if not (data ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.env.TemporaryFile:create(nil)
		if not (v ~= nil) then
			do return nil end
		end
		if not v:setContentsBuffer(data) then
			do v:remove() end
			do return nil end
		end
		do return v end
	end
end
