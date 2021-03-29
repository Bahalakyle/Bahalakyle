jk = jk or {}

jk.posix = jk.posix or {}

jk.posix.PosixSignal = {}
jk.posix.PosixSignal.__index = jk.posix.PosixSignal
_vm:set_metatable(jk.posix.PosixSignal, {})

jk.posix.PosixSignal.SIGHUP = 1
jk.posix.PosixSignal.SIGINT = 2
jk.posix.PosixSignal.SIGQUIT = 3
jk.posix.PosixSignal.SIGILL = 4
jk.posix.PosixSignal.SIGTRAP = 5
jk.posix.PosixSignal.SIGABRT = 6
jk.posix.PosixSignal.SIGFPE = 8
jk.posix.PosixSignal.SIGKILL = 9
jk.posix.PosixSignal.SIGSEGV = 11
jk.posix.PosixSignal.SIGPIPE = 13
jk.posix.PosixSignal.SIGALRM = 14
jk.posix.PosixSignal.SIGTERM = 15

function jk.posix.PosixSignal._create()
	local v = _vm:set_metatable({}, jk.posix.PosixSignal)
	return v
end

function jk.posix.PosixSignal:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.posix.PosixSignal'
	self['_isType.jk.posix.PosixSignal'] = true
end

function jk.posix.PosixSignal:_construct0()
	jk.posix.PosixSignal._init(self)
	return self
end

function jk.posix.PosixSignal:trapSignal(signum, enabled)
	local n = (function(a, b, c)
		if a then
			do return b() end
		end
		do return c() end
	end)(enabled, function()
		do return 1 end
	end, function()
		do return 0 end
	end)
	local o = _os:trap_signal(signum, n)
	if o == 1 then
		do return true end
	end
	do return false end
end

function jk.posix.PosixSignal:checkSignalState(signum)
	local n = _os:check_signal_state(signum, n)
	if n == 1 then
		do return true end
	end
	do return false end
end

jk.posix.PosixEnvironment = {}
jk.posix.PosixEnvironment.__index = jk.posix.PosixEnvironment
_vm:set_metatable(jk.posix.PosixEnvironment, {})

function jk.posix.PosixEnvironment._create()
	local v = _vm:set_metatable({}, jk.posix.PosixEnvironment)
	return v
end

function jk.posix.PosixEnvironment:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.posix.PosixEnvironment'
	self['_isType.jk.posix.PosixEnvironment'] = true
end

function jk.posix.PosixEnvironment:_construct0()
	jk.posix.PosixEnvironment._init(self)
	return self
end

jk.posix.PosixEnvironment.PosixUser = {}
jk.posix.PosixEnvironment.PosixUser.__index = jk.posix.PosixEnvironment.PosixUser
_vm:set_metatable(jk.posix.PosixEnvironment.PosixUser, {})

function jk.posix.PosixEnvironment.PosixUser._create()
	local v = _vm:set_metatable({}, jk.posix.PosixEnvironment.PosixUser)
	return v
end

function jk.posix.PosixEnvironment.PosixUser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.posix.PosixEnvironment.PosixUser'
	self['_isType.jk.posix.PosixEnvironment.PosixUser'] = true
	self.pwName = nil
	self.pwUid = 0
	self.pwGid = 0
	self.pwGecos = nil
	self.pwDir = nil
	self.pwShell = nil
end

function jk.posix.PosixEnvironment.PosixUser:_construct0()
	jk.posix.PosixEnvironment.PosixUser._init(self)
	return self
end

function jk.posix.PosixEnvironment.PosixUser:getPwName()
	do return self.pwName end
end

function jk.posix.PosixEnvironment.PosixUser:setPwName(v)
	self.pwName = v
	do return self end
end

function jk.posix.PosixEnvironment.PosixUser:getPwUid()
	do return self.pwUid end
end

function jk.posix.PosixEnvironment.PosixUser:setPwUid(v)
	self.pwUid = v
	do return self end
end

function jk.posix.PosixEnvironment.PosixUser:getPwGid()
	do return self.pwGid end
end

function jk.posix.PosixEnvironment.PosixUser:setPwGid(v)
	self.pwGid = v
	do return self end
end

function jk.posix.PosixEnvironment.PosixUser:getPwGecos()
	do return self.pwGecos end
end

function jk.posix.PosixEnvironment.PosixUser:setPwGecos(v)
	self.pwGecos = v
	do return self end
end

function jk.posix.PosixEnvironment.PosixUser:getPwDir()
	do return self.pwDir end
end

function jk.posix.PosixEnvironment.PosixUser:setPwDir(v)
	self.pwDir = v
	do return self end
end

function jk.posix.PosixEnvironment.PosixUser:getPwShell()
	do return self.pwShell end
end

function jk.posix.PosixEnvironment.PosixUser:setPwShell(v)
	self.pwShell = v
	do return self end
end

function jk.posix.PosixEnvironment:getpwnam(username)
	do return nil end
end

function jk.posix.PosixEnvironment:getpwuid(uid)
	do return nil end
end

function jk.posix.PosixEnvironment:setuid(gid)
	do return false end
end

function jk.posix.PosixEnvironment:setgid(gid)
	do return false end
end

function jk.posix.PosixEnvironment:seteuid(uid)
	do return false end
end

function jk.posix.PosixEnvironment:setegid(gid)
	do return false end
end

function jk.posix.PosixEnvironment:getuid()
	do return -1 end
end

function jk.posix.PosixEnvironment:geteuid()
	do return -1 end
end

function jk.posix.PosixEnvironment:getgid()
	do return -1 end
end

function jk.posix.PosixEnvironment:getegid()
	do return -1 end
end
