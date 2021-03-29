jk = jk or {}

jk.socket = jk.socket or {}

jk.socket.io = jk.socket.io or {}

jk.socket.io.IOManagerEntry = {}

jk.socket.io.IOManager = {}
jk.socket.io.IOManager.__index = jk.socket.io.IOManager
_vm:set_metatable(jk.socket.io.IOManager, {})

function jk.socket.io.IOManager._create()
	local v = _vm:set_metatable({}, jk.socket.io.IOManager)
	return v
end

function jk.socket.io.IOManager:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.io.IOManager'
	self['_isType.jk.socket.io.IOManager'] = true
	self['_isType.jk.lang.EventLoop'] = true
end

function jk.socket.io.IOManager:_construct0()
	jk.socket.io.IOManager._init(self)
	return self
end

function jk.socket.io.IOManager:createDefault()
	do return _g.jk.socket.io.IOManagerForSushi._construct0(_g.jk.socket.io.IOManagerForSushi._create()) end
end

function jk.socket.io.IOManager:setCurrent(iomgr)
	do _g.jk.thread.Thread:setLocalValue("__IOManager", iomgr) end
end

function jk.socket.io.IOManager:getCurrent()
	do return _vm:to_table_with_key(_g.jk.thread.Thread:getLocalValue("__IOManager"), '_isType.jk.socket.io.IOManager') end
end

function jk.socket.io.IOManager:addWithReadListener(o, rrl)
	local v = self:add(o)
	if v ~= nil then
		do v:setReadListener(rrl) end
	end
	do return v end
end

function jk.socket.io.IOManager:addWithWriteListener(o, wrl)
	local v = self:add(o)
	if v ~= nil then
		do v:setWriteListener(wrl) end
	end
	do return v end
end

function jk.socket.io.IOManager:execute(ctx)
	do _g.jk.socket.io.IOManager:setCurrent(self) end
	do
		local v = self:doExecute(ctx)
		do _g.jk.thread.Thread:removeLocalValue("__IOManager") end
		do return v end
	end
end

function jk.socket.io.IOManager:add(o)
end

function jk.socket.io.IOManager:startTimer(delay, handler)
end

function jk.socket.io.IOManager:stop()
end

function jk.socket.io.IOManager:doExecute(ctx)
end

function jk.socket.io.IOManager:runScheduled(timeout, runnable)
	if not (timeout >= 0) then
		do return end
	end
	do
		local rr = runnable
		if not (rr ~= nil) then
			do return end
		end
		do self:startTimer(timeout, function()
			do rr:run() end
			do return false end
		end) end
	end
end

function jk.socket.io.IOManager:runInBackground(runnable)
	if not (runnable ~= nil) then
		do return end
	end
	do _g.jk.thread.Thread:start(runnable) end
end

jk.socket.io.IOManagerTimer = {}

jk.socket.io.IOManagerForSushi = _g.jk.socket.io.IOManager._create()
jk.socket.io.IOManagerForSushi.__index = jk.socket.io.IOManagerForSushi
_vm:set_metatable(jk.socket.io.IOManagerForSushi, {
	__index = _g.jk.socket.io.IOManager
})

function jk.socket.io.IOManagerForSushi._create()
	local v = _vm:set_metatable({}, jk.socket.io.IOManagerForSushi)
	return v
end

function jk.socket.io.IOManagerForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.io.IOManagerForSushi'
	self['_isType.jk.socket.io.IOManagerForSushi'] = true
	self.exitflag = false
	self.running = false
	self.mgrfd = nil
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

jk.socket.io.IOManagerForSushi.MyEntry = {}
jk.socket.io.IOManagerForSushi.MyEntry.__index = jk.socket.io.IOManagerForSushi.MyEntry
_vm:set_metatable(jk.socket.io.IOManagerForSushi.MyEntry, {})

function jk.socket.io.IOManagerForSushi.MyEntry._create()
	local v = _vm:set_metatable({}, jk.socket.io.IOManagerForSushi.MyEntry)
	return v
end

function jk.socket.io.IOManagerForSushi.MyEntry:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.socket.io.IOManagerForSushi.MyEntry'
	self['_isType.jk.socket.io.IOManagerForSushi.MyEntry'] = true
	self['_isType.jk.socket.io.IOManagerEntry'] = true
	self.mgrfd = nil
	self.fd = 0
	self.objref = 0
	self.rrl = nil
	self.wrl = nil
end

function jk.socket.io.IOManagerForSushi.MyEntry:_construct0()
	jk.socket.io.IOManagerForSushi.MyEntry._init(self)
	return self
end

function jk.socket.io.IOManagerForSushi.MyEntry:onReadReady()
	local rrl = self.rrl
	if not (rrl ~= nil) then
		do return end
	end
	do rrl() end
end

function jk.socket.io.IOManagerForSushi.MyEntry:onWriteReady()
	local wrl = self.wrl
	if not (wrl ~= nil) then
		do return end
	end
	do wrl() end
end

function jk.socket.io.IOManagerForSushi.MyEntry:onReadWriteReady()
	local rrl = self.rrl
	local wrl = self.wrl
	if rrl ~= nil then
		do rrl() end
	end
	if wrl ~= nil then
		do wrl() end
	end
end

function jk.socket.io.IOManagerForSushi.MyEntry:setListeners(rrl, wrl)
	self.rrl = rrl
	self.wrl = wrl
	do return self:update() end
end

function jk.socket.io.IOManagerForSushi.MyEntry:setReadListener(rrl)
	self.rrl = rrl
	do return self:update() end
end

function jk.socket.io.IOManagerForSushi.MyEntry:setWriteListener(wrl)
	self.wrl = wrl
	do return self:update() end
end

function jk.socket.io.IOManagerForSushi.MyEntry:update()
	local mgrfd = self.mgrfd
	local fd = self.fd
	local myself = self
	local mode = -1
	if self.rrl ~= nil and self.wrl ~= nil then
		mode = 2
	elseif self.wrl ~= nil then
		mode = 1
	elseif self.rrl ~= nil then
		mode = 0
	end
	do
		local v = true
		if mode < 0 then
			v = self:remove()
		elseif self.objref > 0 then
			local objref = self.objref
			local r = _net:update_io_listener(mgrfd, fd, mode, objref)
			if r ~= 0 then
				v = false
			end
		else
			local objref = 0
			do objref = _net:register_io_listener(mgrfd, fd, mode, myself) end
			self.objref = objref
			if objref < 1 then
				v = false
			end
		end
		do return v end
	end
end

function jk.socket.io.IOManagerForSushi.MyEntry:remove()
	if not (self.objref > 0) then
		do return false end
	end
	do
		local mgrfd = self.mgrfd
		local fd = self.fd
		local objref = self.objref
		local r = _net:remove_io_listener(mgrfd, fd, objref)
		self.objref = 0
		if r ~= 0 then
			do return false end
		end
		do return true end
	end
end

function jk.socket.io.IOManagerForSushi.MyEntry:getMgrfd()
	do return self.mgrfd end
end

function jk.socket.io.IOManagerForSushi.MyEntry:setMgrfd(v)
	self.mgrfd = v
	do return self end
end

function jk.socket.io.IOManagerForSushi.MyEntry:getFd()
	do return self.fd end
end

function jk.socket.io.IOManagerForSushi.MyEntry:setFd(v)
	self.fd = v
	do return self end
end

function jk.socket.io.IOManagerForSushi:_construct0()
	jk.socket.io.IOManagerForSushi._init(self)
	do _g.jk.socket.io.IOManager._construct0(self) end
	self.mgrfd = _net:create_io_manager()
	return self
end

function jk.socket.io.IOManagerForSushi:_destruct()
	do self:close() end
end

function jk.socket.io.IOManagerForSushi:close()
	local mgrfd = self.mgrfd
	if mgrfd ~= nil then
		do _net:close_io_manager(mgrfd) end
		mgrfd = nil
	end
end

function jk.socket.io.IOManagerForSushi:doExecute(ctx)
	local mgrfd = self.mgrfd
	if not (mgrfd ~= nil) then
		do _g.jk.log.Log:error(ctx, "IOManagerForSushi" .. ": Failed to initialize IO manager file descriptor") end
		do return false end
	end
	self.exitflag = false
	self.running = true
	do _g.jk.log.Log:debug(ctx, "IOManagerForSushi" .. " started") end
	do
		local trap2 = _g.jk.posix.PosixSignal:trapSignal(_g.jk.posix.PosixSignal.SIGINT, true)
		local trap15 = _g.jk.posix.PosixSignal:trapSignal(_g.jk.posix.PosixSignal.SIGTERM, true)
		while self.exitflag == false do
			local r = _net:execute_io_manager(mgrfd, -1)
			if r < 0 then
				do _g.jk.log.Log:error(ctx, "_net:execute_io_manager returned error status " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(r)) .. ". Exiting loop.") end
				do break end
			end
			if _g.jk.posix.PosixSignal:checkSignalState(_g.jk.posix.PosixSignal.SIGINT) or _g.jk.posix.PosixSignal:checkSignalState(_g.jk.posix.PosixSignal.SIGTERM) then
				do _g.jk.log.Log:debug(ctx, "Signal received. Exiting IOManager.") end
				do break end
			end
		end
		self.running = false
		do _g.jk.log.Log:debug(ctx, "IOManagerForSushi" .. " ended") end
		do _g.jk.posix.PosixSignal:trapSignal(_g.jk.posix.PosixSignal.SIGINT, trap2) end
		do _g.jk.posix.PosixSignal:trapSignal(_g.jk.posix.PosixSignal.SIGTERM, trap15) end
		do return true end
	end
end

function jk.socket.io.IOManagerForSushi:stop()
	self.exitflag = true
end

function jk.socket.io.IOManagerForSushi:isRunning()
	do return self.running end
end

function jk.socket.io.IOManagerForSushi:add(o)
	if not (self.mgrfd ~= nil) then
		do return nil end
	end
	do
		local fdo = _vm:to_table_with_key(o, '_isType.jk.io.FileDescriptor')
		if not (fdo ~= nil) then
			do return nil end
		end
		do
			local fd = fdo:getFileDescriptor()
			if not (fd >= 0) then
				do return nil end
			end
			do
				local v = _g.jk.socket.io.IOManagerForSushi.MyEntry._construct0(_g.jk.socket.io.IOManagerForSushi.MyEntry._create())
				do v:setMgrfd(self.mgrfd) end
				do v:setFd(fd) end
				do return v end
			end
		end
	end
end

function jk.socket.io.IOManagerForSushi:startTimer(delay, handler)
	_io:write_to_stdout("[jk.socket.io.IOManagerForSushi.startTimer] (IOManagerForSushi@target_sushi.sling:209:2): Not implemented" .. "\n")
	do return nil end
end
