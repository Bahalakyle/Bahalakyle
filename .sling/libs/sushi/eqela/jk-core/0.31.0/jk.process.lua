jk = jk or {}

jk.process = jk.process or {}

jk.process.Process = {}

jk.process.ProcessLauncher = {}
jk.process.ProcessLauncher.__index = jk.process.ProcessLauncher
_vm:set_metatable(jk.process.ProcessLauncher, {})

function jk.process.ProcessLauncher._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncher)
	return v
end

function jk.process.ProcessLauncher:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncher'
	self['_isType.jk.process.ProcessLauncher'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.file = nil
	self.params = nil
	self.env = nil
	self.cwd = nil
	self.uid = -1
	self.gid = -1
	self.trapSigint = true
	self.replaceSelf = false
	self.pipePty = false
	self.startGroup = false
	self.noCmdWindow = false
	self.errorBuffer = nil
	self.detachFromTerminal = false
end

jk.process.ProcessLauncher.MyStringPipeHandler = {}
jk.process.ProcessLauncher.MyStringPipeHandler.__index = jk.process.ProcessLauncher.MyStringPipeHandler
_vm:set_metatable(jk.process.ProcessLauncher.MyStringPipeHandler, {})

function jk.process.ProcessLauncher.MyStringPipeHandler._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncher.MyStringPipeHandler)
	return v
end

function jk.process.ProcessLauncher.MyStringPipeHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncher.MyStringPipeHandler'
	self['_isType.jk.process.ProcessLauncher.MyStringPipeHandler'] = true
	self['_isType.jk.lang.BufferDataReceiver'] = true
	self.builder = nil
	self.encoding = nil
end

function jk.process.ProcessLauncher.MyStringPipeHandler:_construct0()
	jk.process.ProcessLauncher.MyStringPipeHandler._init(self)
	self.encoding = "UTF-8"
	return self
end

function jk.process.ProcessLauncher.MyStringPipeHandler:onBufferData(data, size)
	if self.builder == nil or data == nil or size < 1 then
		do return false end
	end
	do
		local str = _g.jk.lang.String:forBuffer(_g.jk.lang.Buffer:getSubBuffer(data, 0, size, false), self.encoding)
		if not (str ~= nil) then
			do return false end
		end
		do self.builder:appendString(str) end
		do return true end
	end
end

function jk.process.ProcessLauncher.MyStringPipeHandler:getBuilder()
	do return self.builder end
end

function jk.process.ProcessLauncher.MyStringPipeHandler:setBuilder(v)
	self.builder = v
	do return self end
end

function jk.process.ProcessLauncher.MyStringPipeHandler:getEncoding()
	do return self.encoding end
end

function jk.process.ProcessLauncher.MyStringPipeHandler:setEncoding(v)
	self.encoding = v
	do return self end
end

jk.process.ProcessLauncher.MyBufferPipeHandler = {}
jk.process.ProcessLauncher.MyBufferPipeHandler.__index = jk.process.ProcessLauncher.MyBufferPipeHandler
_vm:set_metatable(jk.process.ProcessLauncher.MyBufferPipeHandler, {})

function jk.process.ProcessLauncher.MyBufferPipeHandler._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncher.MyBufferPipeHandler)
	return v
end

function jk.process.ProcessLauncher.MyBufferPipeHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncher.MyBufferPipeHandler'
	self['_isType.jk.process.ProcessLauncher.MyBufferPipeHandler'] = true
	self['_isType.jk.lang.BufferDataReceiver'] = true
	self.data = nil
end

function jk.process.ProcessLauncher.MyBufferPipeHandler:_construct0()
	jk.process.ProcessLauncher.MyBufferPipeHandler._init(self)
	return self
end

function jk.process.ProcessLauncher.MyBufferPipeHandler:onBufferData(newData, size)
	self.data = _g.jk.lang.Buffer:append(self.data, newData, size)
	do return true end
end

function jk.process.ProcessLauncher.MyBufferPipeHandler:getData()
	do return self.data end
end

function jk.process.ProcessLauncher.MyBufferPipeHandler:setData(v)
	self.data = v
	do return self end
end

jk.process.ProcessLauncher.QuietPipeHandler = {}
jk.process.ProcessLauncher.QuietPipeHandler.__index = jk.process.ProcessLauncher.QuietPipeHandler
_vm:set_metatable(jk.process.ProcessLauncher.QuietPipeHandler, {})

function jk.process.ProcessLauncher.QuietPipeHandler._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncher.QuietPipeHandler)
	return v
end

function jk.process.ProcessLauncher.QuietPipeHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncher.QuietPipeHandler'
	self['_isType.jk.process.ProcessLauncher.QuietPipeHandler'] = true
	self['_isType.jk.lang.BufferDataReceiver'] = true
end

function jk.process.ProcessLauncher.QuietPipeHandler:_construct0()
	jk.process.ProcessLauncher.QuietPipeHandler._init(self)
	return self
end

function jk.process.ProcessLauncher.QuietPipeHandler:onBufferData(data, size)
	do return true end
end

function jk.process.ProcessLauncher:asProcessLauncher(o)
	if not (o ~= nil) then
		do return nil end
	end
	if (_vm:get_variable_type(o) == 'string') then
		do return _g.jk.process.ProcessLauncher:forString(o) end
	end
	do
		local vector = _g.jk.lang.Vector:asObjectVector(o)
		if vector ~= nil then
			local vsz = _g.jk.lang.Vector:getSize(vector)
			if vsz > 0 then
				local pl = _g.jk.process.ProcessLauncher:forCommand(_g.jk.lang.String:asString(_g.jk.lang.Vector:get(vector, 0)), nil)
				if not (pl ~= nil) then
					do return nil end
				end
				do
					local n = 1
					while n < vsz do
						do pl:addToParams(_g.jk.lang.String:asString(_g.jk.lang.Vector:get(vector, n))) end
						do n = n + 1 end
					end
				end
				do return pl end
			end
		end
		do return nil end
	end
end

function jk.process.ProcessLauncher:forSelf()
	local exe = _g.jk.process.CurrentProcess:getExecutableFile()
	if not (exe ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.process.ProcessLauncher._construct0(_g.jk.process.ProcessLauncher._create())
		do v:setFile(exe) end
		do return v end
	end
end

function jk.process.ProcessLauncher:forFile(file, params)
	if file == nil or file:isFile() == false then
		do return nil end
	end
	do
		local v = _g.jk.process.ProcessLauncher._construct0(_g.jk.process.ProcessLauncher._create())
		do v:setFile(file) end
		if params ~= nil then
			local n = 0
			local m = #params
			do
				n = 0
				while n < m do
					local param = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(params[n + 1])
					if param ~= nil then
						do v:addToParams(param) end
					end
					do n = n + 1 end
				end
			end
		end
		do return v end
	end
end

function jk.process.ProcessLauncher:forCommand(command, params)
	if _g.jk.lang.String:isEmpty(command) then
		do return nil end
	end
	do
		local file = nil
		local delim = _g.jk.fs.PathInfo:getPathSeparator()
		if _g.jk.lang.String:getIndexOfCharacter(command, delim, 0) >= 0 then
			file = _g.jk.fs.File:forPath(command)
		elseif delim ~= 47 and _g.jk.lang.String:getIndexOfCharacter(command, 47, 0) >= 0 then
			file = _g.jk.fs.File:forPath(command)
		else
			file = _g.jk.env.ExternalCommand:findInPath(command)
		end
		do return _g.jk.process.ProcessLauncher:forFile(file, params) end
	end
end

function jk.process.ProcessLauncher:forString(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return nil end
	end
	do
		local arr = _g.jk.text.StringUtil:quotedStringToVector(str, 32, true, 92)
		if arr == nil or _g.jk.lang.Vector:getSize(arr) < 1 then
			do return nil end
		end
		do
			local vsz = _g.jk.lang.Vector:getSize(arr)
			local cmd = arr[0 + 1]
			local params = nil
			local paramCount = vsz - 1
			if paramCount > 0 then
				params = _vm:allocate_array(paramCount)
				do
					local n = 1
					while n < vsz do
						params[n - 1 + 1] = arr[n + 1]
						do n = n + 1 end
					end
				end
			end
			do return _g.jk.process.ProcessLauncher:forCommand(cmd, params) end
		end
	end
end

function jk.process.ProcessLauncher:_construct0()
	jk.process.ProcessLauncher._init(self)
	self.params = {}
	self.env = {}
	return self
end

function jk.process.ProcessLauncher:appendProperParam(sb, p)
	if not _g.jk.lang.String:isNotEmpty(p) then
		do return end
	end
	do sb:appendCharacter(32) end
	do sb:appendCharacter(34) end
	do self:escapeQuotesAndBackSlashes(sb, p) end
	do sb:appendCharacter(34) end
end

function jk.process.ProcessLauncher:escapeQuotesAndBackSlashes(sb, param)
	local it = _g.jk.lang.String:iterate(param)
	while it ~= nil do
		local c = it:getNextChar()
		if _g.jk.lang.Character:isEOF(c) then
			do break end
		end
		if c == 34 or c == 92 then
			do sb:appendCharacter(92) end
		end
		do sb:appendCharacter(c) end
	end
end

function jk.process.ProcessLauncher:getFullCommandString(includeEnv)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if includeEnv then
		local keys = _g.jk.lang.Map:getKeys(self.env)
		if keys ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(keys)
			do
				n = 0
				while n < m do
					local key = keys[n + 1]
					if key ~= nil then
						do sb:appendString(key) end
						do sb:appendCharacter(61) end
						do sb:appendString(self.env[key]) end
						do sb:appendCharacter(32) end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do sb:appendCharacter(34) end
	if self.file ~= nil then
		do self:escapeQuotesAndBackSlashes(sb, self.file:getPath()) end
	end
	do sb:appendCharacter(34) end
	if self.params ~= nil then
		local n2 = 0
		local m2 = _g.jk.lang.Vector:getSize(self.params)
		do
			n2 = 0
			while n2 < m2 do
				local p = self.params[n2 + 1]
				if p ~= nil then
					do self:appendProperParam(sb, p) end
				end
				do n2 = n2 + 1 end
			end
		end
	end
	do return sb:toString() end
end

function jk.process.ProcessLauncher:toString()
	do return self:getFullCommandString(true) end
end

function jk.process.ProcessLauncher:addToParams(arg)
	if arg ~= nil then
		if self.params == nil then
			self.params = {}
		end
		do _g.jk.lang.Vector:append(self.params, arg) end
	end
	do return self end
end

function jk.process.ProcessLauncher:addFileToParams(file)
	if file ~= nil then
		do self:addToParams(file:getPath()) end
	end
	do return self end
end

function jk.process.ProcessLauncher:addStringsToParams(params)
	if params ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(params)
		do
			n = 0
			while n < m do
				local s = params[n + 1]
				if s ~= nil then
					do self:addToParams(s) end
				end
				do n = n + 1 end
			end
		end
	end
	do return self end
end

function jk.process.ProcessLauncher:setEnvVariable(key, val)
	if key ~= nil then
		if self.env == nil then
			self.env = {}
		end
		self.env[key] = val
	end
end

function jk.process.ProcessLauncher:startProcess(wait, pipeHandler, withIO)
	do return _g.jk.process.ProcessLauncherSushi:startProcess(self, wait, pipeHandler, withIO, self.errorBuffer) end
end

function jk.process.ProcessLauncher:start()
	do return self:startProcess(false, nil, false) end
end

function jk.process.ProcessLauncher:startWithIO()
	do return _vm:to_table_with_key(self:startProcess(false, nil, true), '_isType.jk.process.ProcessWithIO') end
end

function jk.process.ProcessLauncher:execute()
	local cp = self:startProcess(true, nil, false)
	if cp == nil then
		do return -1 end
	end
	do return cp:getExitStatus() end
end

function jk.process.ProcessLauncher:executeSilent()
	local cp = self:startProcess(true, _g.jk.process.ProcessLauncher.QuietPipeHandler._construct0(_g.jk.process.ProcessLauncher.QuietPipeHandler._create()), false)
	if cp == nil then
		do return -1 end
	end
	do return cp:getExitStatus() end
end

function jk.process.ProcessLauncher:executeToStringBuilder(output)
	local msp = _g.jk.process.ProcessLauncher.MyStringPipeHandler._construct0(_g.jk.process.ProcessLauncher.MyStringPipeHandler._create())
	do msp:setBuilder(output) end
	do
		local cp = self:startProcess(true, msp, false)
		if cp == nil then
			do return -1 end
		end
		do return cp:getExitStatus() end
	end
end

function jk.process.ProcessLauncher:executeToString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if self:executeToStringBuilder(sb) < 0 then
		do return nil end
	end
	do return sb:toString() end
end

function jk.process.ProcessLauncher:executeToBuffer()
	local ph = _g.jk.process.ProcessLauncher.MyBufferPipeHandler._construct0(_g.jk.process.ProcessLauncher.MyBufferPipeHandler._create())
	local cp = self:startProcess(true, ph, false)
	if cp == nil then
		do return nil end
	end
	do return ph:getData() end
end

function jk.process.ProcessLauncher:executeToPipe(pipeHandler)
	local cp = self:startProcess(true, pipeHandler, false)
	if cp == nil then
		do return -1 end
	end
	do return cp:getExitStatus() end
end

function jk.process.ProcessLauncher:getFile()
	do return self.file end
end

function jk.process.ProcessLauncher:setFile(v)
	self.file = v
	do return self end
end

function jk.process.ProcessLauncher:getParams()
	do return self.params end
end

function jk.process.ProcessLauncher:setParams(v)
	self.params = v
	do return self end
end

function jk.process.ProcessLauncher:getEnv()
	do return self.env end
end

function jk.process.ProcessLauncher:setEnv(v)
	self.env = v
	do return self end
end

function jk.process.ProcessLauncher:getCwd()
	do return self.cwd end
end

function jk.process.ProcessLauncher:setCwd(v)
	self.cwd = v
	do return self end
end

function jk.process.ProcessLauncher:getUid()
	do return self.uid end
end

function jk.process.ProcessLauncher:setUid(v)
	self.uid = v
	do return self end
end

function jk.process.ProcessLauncher:getGid()
	do return self.gid end
end

function jk.process.ProcessLauncher:setGid(v)
	self.gid = v
	do return self end
end

function jk.process.ProcessLauncher:getTrapSigint()
	do return self.trapSigint end
end

function jk.process.ProcessLauncher:setTrapSigint(v)
	self.trapSigint = v
	do return self end
end

function jk.process.ProcessLauncher:getReplaceSelf()
	do return self.replaceSelf end
end

function jk.process.ProcessLauncher:setReplaceSelf(v)
	self.replaceSelf = v
	do return self end
end

function jk.process.ProcessLauncher:getPipePty()
	do return self.pipePty end
end

function jk.process.ProcessLauncher:setPipePty(v)
	self.pipePty = v
	do return self end
end

function jk.process.ProcessLauncher:getStartGroup()
	do return self.startGroup end
end

function jk.process.ProcessLauncher:setStartGroup(v)
	self.startGroup = v
	do return self end
end

function jk.process.ProcessLauncher:getNoCmdWindow()
	do return self.noCmdWindow end
end

function jk.process.ProcessLauncher:setNoCmdWindow(v)
	self.noCmdWindow = v
	do return self end
end

function jk.process.ProcessLauncher:getErrorBuffer()
	do return self.errorBuffer end
end

function jk.process.ProcessLauncher:setErrorBuffer(v)
	self.errorBuffer = v
	do return self end
end

function jk.process.ProcessLauncher:getDetachFromTerminal()
	do return self.detachFromTerminal end
end

function jk.process.ProcessLauncher:setDetachFromTerminal(v)
	self.detachFromTerminal = v
	do return self end
end

jk.process.ProcessWithIO = {}

jk.process.ProcessLauncherSushi = {}
jk.process.ProcessLauncherSushi.__index = jk.process.ProcessLauncherSushi
_vm:set_metatable(jk.process.ProcessLauncherSushi, {})

function jk.process.ProcessLauncherSushi._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncherSushi)
	return v
end

function jk.process.ProcessLauncherSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncherSushi'
	self['_isType.jk.process.ProcessLauncherSushi'] = true
end

function jk.process.ProcessLauncherSushi:_construct0()
	jk.process.ProcessLauncherSushi._init(self)
	return self
end

jk.process.ProcessLauncherSushi.FDReader = {}
jk.process.ProcessLauncherSushi.FDReader.__index = jk.process.ProcessLauncherSushi.FDReader
_vm:set_metatable(jk.process.ProcessLauncherSushi.FDReader, {})

function jk.process.ProcessLauncherSushi.FDReader._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncherSushi.FDReader)
	return v
end

function jk.process.ProcessLauncherSushi.FDReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncherSushi.FDReader'
	self['_isType.jk.process.ProcessLauncherSushi.FDReader'] = true
	self['_isType.jk.io.Reader'] = true
	self['_isType.jk.lang.Closable'] = true
	self.fd = 0
end

function jk.process.ProcessLauncherSushi.FDReader:_construct0()
	jk.process.ProcessLauncherSushi.FDReader._init(self)
	return self
end

function jk.process.ProcessLauncherSushi.FDReader:forFd(fd)
	if fd < 0 then
		do return nil end
	end
	do
		local v = _g.jk.process.ProcessLauncherSushi.FDReader._construct0(_g.jk.process.ProcessLauncherSushi.FDReader._create())
		do v:setFd(fd) end
		do return v end
	end
end

function jk.process.ProcessLauncherSushi.FDReader:close()
	local fd = self.fd
	if fd >= 0 then
		do _io:close_handle(fd) end
		fd = -1
	end
end

function jk.process.ProcessLauncherSushi.FDReader:read(buffer)
	if not (buffer ~= nil) then
		do return 0 end
	end
	do
		local fd = self.fd
		local v = 0
		do v = _io:read_from_handle(fd, buffer) end
		do return v end
	end
end

function jk.process.ProcessLauncherSushi.FDReader:getFd()
	do return self.fd end
end

function jk.process.ProcessLauncherSushi.FDReader:setFd(v)
	self.fd = v
	do return self end
end

jk.process.ProcessLauncherSushi.FDWriter = {}
jk.process.ProcessLauncherSushi.FDWriter.__index = jk.process.ProcessLauncherSushi.FDWriter
_vm:set_metatable(jk.process.ProcessLauncherSushi.FDWriter, {})

function jk.process.ProcessLauncherSushi.FDWriter._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncherSushi.FDWriter)
	return v
end

function jk.process.ProcessLauncherSushi.FDWriter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncherSushi.FDWriter'
	self['_isType.jk.process.ProcessLauncherSushi.FDWriter'] = true
	self['_isType.jk.io.Writer'] = true
	self['_isType.jk.lang.Closable'] = true
	self.fd = 0
end

function jk.process.ProcessLauncherSushi.FDWriter:_construct0()
	jk.process.ProcessLauncherSushi.FDWriter._init(self)
	return self
end

function jk.process.ProcessLauncherSushi.FDWriter:forFd(fd)
	if fd < 0 then
		do return nil end
	end
	do
		local v = _g.jk.process.ProcessLauncherSushi.FDWriter._construct0(_g.jk.process.ProcessLauncherSushi.FDWriter._create())
		do v:setFd(fd) end
		do return v end
	end
end

function jk.process.ProcessLauncherSushi.FDWriter:close()
	local fd = self.fd
	if fd >= 0 then
		do _io:close_handle(fd) end
		fd = -1
	end
end

function jk.process.ProcessLauncherSushi.FDWriter:write(buf, size)
	local fd = self.fd
	local v = 0
	do v = _io:write_to_handle(fd, buf, size) end
	do return v end
end

function jk.process.ProcessLauncherSushi.FDWriter:getFd()
	do return self.fd end
end

function jk.process.ProcessLauncherSushi.FDWriter:setFd(v)
	self.fd = v
	do return self end
end

jk.process.ProcessLauncherSushi.MyProcess = {}
jk.process.ProcessLauncherSushi.MyProcess.__index = jk.process.ProcessLauncherSushi.MyProcess
_vm:set_metatable(jk.process.ProcessLauncherSushi.MyProcess, {})

function jk.process.ProcessLauncherSushi.MyProcess._create()
	local v = _vm:set_metatable({}, jk.process.ProcessLauncherSushi.MyProcess)
	return v
end

function jk.process.ProcessLauncherSushi.MyProcess:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessLauncherSushi.MyProcess'
	self['_isType.jk.process.ProcessLauncherSushi.MyProcess'] = true
	self['_isType.jk.process.Process'] = true
	self['_isType.jk.process.ProcessWithIO'] = true
	self.pid = 0
	self.inWriter = nil
	self.outReader = nil
	self.errReader = nil
	self.status = 0
end

function jk.process.ProcessLauncherSushi.MyProcess:_construct0()
	jk.process.ProcessLauncherSushi.MyProcess._init(self)
	return self
end

function jk.process.ProcessLauncherSushi.MyProcess:close()
	if self.inWriter ~= nil then
		do self.inWriter:close() end
		self.inWriter = nil
	end
	if self.outReader ~= nil then
		do self.outReader:close() end
		self.outReader = nil
	end
	if self.errReader ~= nil then
		do self.errReader:close() end
		self.errReader = nil
	end
end

function jk.process.ProcessLauncherSushi.MyProcess:getStandardInput()
	do return self.inWriter end
end

function jk.process.ProcessLauncherSushi.MyProcess:getStandardOutput()
	do return self.outReader end
end

function jk.process.ProcessLauncherSushi.MyProcess:getStandardError()
	do return self.errReader end
end

function jk.process.ProcessLauncherSushi.MyProcess:getId()
	do return _g.jk.lang.String:forInteger(self.pid) end
end

function jk.process.ProcessLauncherSushi.MyProcess:updateStatus()
	if self.pid >= 0 then
		local alive = 0
		local pid = self.pid
		do alive = _os:is_process_alive(pid) end
		if alive == 0 then
			do self:waitForExit() end
		end
	end
end

function jk.process.ProcessLauncherSushi.MyProcess:isRunning()
	do self:updateStatus() end
	if self.pid >= 0 then
		do return true end
	end
	do return false end
end

function jk.process.ProcessLauncherSushi.MyProcess:getExitStatus()
	do self:updateStatus() end
	do return self.status end
end

function jk.process.ProcessLauncherSushi.MyProcess:sendInterrupt()
	local pid = self.pid
	do _os:send_process_signal(pid, 2) end
end

function jk.process.ProcessLauncherSushi.MyProcess:killRequest()
	local pid = self.pid
	do _os:send_process_signal(pid, 15) end
end

function jk.process.ProcessLauncherSushi.MyProcess:killForce()
	local pid = self.pid
	do _os:send_process_signal(pid, 9) end
end

function jk.process.ProcessLauncherSushi.MyProcess:kill(timeout)
	do self:killRequest() end
	do
		local n = 0
		while n < timeout do
			if not self:isRunning() then
				do return end
			end
			do _os:sleep_milliseconds(100); end
			n = n + 100
		end
		do self:killForce() end
	end
end

function jk.process.ProcessLauncherSushi.MyProcess:waitForExit()
	local v = self.status
	local pid = self.pid
	if pid >= 0 then
		do v = _os:wait_for_process(pid) end
		do self:close() end
		self.status = v
		self.pid = -1
	end
	do return v end
end

function jk.process.ProcessLauncherSushi.MyProcess:getPid()
	do return self.pid end
end

function jk.process.ProcessLauncherSushi.MyProcess:setPid(v)
	self.pid = v
	do return self end
end

function jk.process.ProcessLauncherSushi.MyProcess:getInWriter()
	do return self.inWriter end
end

function jk.process.ProcessLauncherSushi.MyProcess:setInWriter(v)
	self.inWriter = v
	do return self end
end

function jk.process.ProcessLauncherSushi.MyProcess:getOutReader()
	do return self.outReader end
end

function jk.process.ProcessLauncherSushi.MyProcess:setOutReader(v)
	self.outReader = v
	do return self end
end

function jk.process.ProcessLauncherSushi.MyProcess:getErrReader()
	do return self.errReader end
end

function jk.process.ProcessLauncherSushi.MyProcess:setErrReader(v)
	self.errReader = v
	do return self end
end

function jk.process.ProcessLauncherSushi:startProcess(launcher, wait, pipeHandler, withIO, errorBuffer)
	if not (launcher ~= nil) then
		do return nil end
	end
	do
		local file = launcher:getFile()
		if not (file ~= nil) then
			do return nil end
		end
		do
			local filepath = file:getPath()
			local params = launcher:getParams()
			local env = {}
			local cenv = _g.jk.env.EnvironmentVariable:getAll()
			if cenv ~= nil then
				local keys = _g.jk.lang.Map:getKeys(cenv)
				if keys ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(keys)
					do
						n = 0
						while n < m do
							local key = keys[n + 1]
							if key ~= nil then
								do _g.jk.lang.Vector:append(env, _g.jk.lang.String:safeString(key) .. "=" .. _g.jk.lang.String:safeString(cenv[key])) end
							end
							do n = n + 1 end
						end
					end
				end
			end
			do
				local emap = launcher:getEnv()
				if emap ~= nil then
					local keys = _g.jk.lang.Map:getKeys(emap)
					if keys ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(keys)
						do
							n2 = 0
							while n2 < m2 do
								local key = keys[n2 + 1]
								if key ~= nil then
									do _g.jk.lang.Vector:append(env, _g.jk.lang.String:safeString(key) .. "=" .. _g.jk.lang.String:safeString(emap[key])) end
								end
								do n2 = n2 + 1 end
							end
						end
					end
				end
				do
					local cwd = launcher:getCwd()
					local cwdpath = nil
					if cwd ~= nil then
						cwdpath = cwd:getPath()
					end
					do
						local pid = 0
						local fdin = -1
						local fdout = -1
						local fderr = -1
						local sigintWasTrapped = false
						if launcher:getTrapSigint() then
							sigintWasTrapped = _g.jk.posix.PosixSignal:trapSignal(_g.jk.posix.PosixSignal.SIGINT, true)
						end
						do
							local detachFromTerminal = 0
							if launcher:getDetachFromTerminal() then
								detachFromTerminal = 1
							end
							if launcher:getReplaceSelf() then
								do _os:replace_process(filepath, params, env, cwdpath, detachFromTerminal) end
							elseif pipeHandler ~= nil then
								do pid, fdin, fdout, fderr = _os:start_piped_process(filepath, params, env, cwdpath, detachFromTerminal) end
							else
								do pid = _os:start_process(filepath, params, env, cwdpath, detachFromTerminal) end
							end
							do
								local v = nil
								if pid >= 0 then
									local vv = _g.jk.process.ProcessLauncherSushi.MyProcess._construct0(_g.jk.process.ProcessLauncherSushi.MyProcess._create())
									do vv:setPid(pid) end
									do vv:setInWriter(_g.jk.process.ProcessLauncherSushi.FDWriter:forFd(fdin)) end
									do vv:setOutReader(_g.jk.process.ProcessLauncherSushi.FDReader:forFd(fdout)) end
									do vv:setErrReader(_g.jk.process.ProcessLauncherSushi.FDReader:forFd(fderr)) end
									if wait then
										if pipeHandler ~= nil then
											local _or = vv:getOutReader()
											local buffer = _util:allocate_buffer(4096)
											while true do
												local r = _or:read(buffer)
												if r < 1 then
													do break end
												end
												do pipeHandler:onBufferData(buffer, r) end
											end
											do
												local er = vv:getErrReader()
												while true do
													local r = er:read(buffer)
													if r < 1 then
														do break end
													end
													do pipeHandler:onBufferData(buffer, r) end
												end
											end
										end
										do vv:waitForExit() end
									end
									v = vv
								end
								if launcher:getTrapSigint() and sigintWasTrapped == false then
									do _g.jk.posix.PosixSignal:trapSignal(_g.jk.posix.PosixSignal.SIGINT, sigintWasTrapped) end
								end
								do return v end
							end
						end
					end
				end
			end
		end
	end
end

jk.process.ProcessKit = {}
jk.process.ProcessKit.__index = jk.process.ProcessKit
_vm:set_metatable(jk.process.ProcessKit, {})

function jk.process.ProcessKit._create()
	local v = _vm:set_metatable({}, jk.process.ProcessKit)
	return v
end

function jk.process.ProcessKit:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.ProcessKit'
	self['_isType.jk.process.ProcessKit'] = true
	self.ctx = nil
end

function jk.process.ProcessKit:_construct0()
	jk.process.ProcessKit._init(self)
	return self
end

function jk.process.ProcessKit:_construct1(ctx)
	jk.process.ProcessKit._init(self)
	self.ctx = ctx
	return self
end

function jk.process.ProcessKit:execute(command)
	local pl = _g.jk.process.ProcessLauncher:asProcessLauncher(command)
	if not (pl ~= nil) then
		do _g.jk.lang.Error:throw("invalidParameter", _g.jk.lang.String:asString(command)) end
	end
	do
		local cmd = pl:toString()
		do _g.jk.log.Log:debug(self.ctx, "Executing command: `" .. _g.jk.lang.String:safeString(cmd) .. "'") end
		do
			local r = pl:execute()
			if r ~= 0 then
				do _g.jk.lang.Error:throw("errorStatus", _g.jk.lang.String:forInteger(r)) end
			end
		end
	end
end

jk.process.CurrentProcess = {}
jk.process.CurrentProcess.__index = jk.process.CurrentProcess
_vm:set_metatable(jk.process.CurrentProcess, {})

function jk.process.CurrentProcess._create()
	local v = _vm:set_metatable({}, jk.process.CurrentProcess)
	return v
end

function jk.process.CurrentProcess:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.process.CurrentProcess'
	self['_isType.jk.process.CurrentProcess'] = true
end

function jk.process.CurrentProcess:_construct0()
	jk.process.CurrentProcess._init(self)
	return self
end

function jk.process.CurrentProcess:terminate(value)
	_io:write_to_stdout("[jk.process.CurrentProcess.terminate] (CurrentProcess.sling:53:3): Not implemented" .. "\n")
end

function jk.process.CurrentProcess:getExecutableFile()
	do return _g.jk.fs.File:forPath(_vm.get_sushi_executable_path()) end
end

function jk.process.CurrentProcess:getProcessName()
	local v = nil
	local exe = _g.jk.process.CurrentProcess:getExecutableFile()
	if exe ~= nil then
		v = exe:getBasenameWithoutExtension()
	end
	do return v end
end
