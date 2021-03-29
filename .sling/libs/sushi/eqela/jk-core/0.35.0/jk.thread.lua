jk = jk or {}

jk.thread = jk.thread or {}

jk.thread.Mutex = {}
jk.thread.Mutex.__index = jk.thread.Mutex
_vm:set_metatable(jk.thread.Mutex, {})

function jk.thread.Mutex._create()
	local v = _vm:set_metatable({}, jk.thread.Mutex)
	return v
end

function jk.thread.Mutex:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.thread.Mutex'
	self['_isType.jk.thread.Mutex'] = true
end

function jk.thread.Mutex:_construct0()
	jk.thread.Mutex._init(self)
	return self
end

function jk.thread.Mutex:create()
	_io:write_to_stdout("[jk.thread.Mutex.create] (Mutex.sling:48:3): Not implemented" .. "\n")
	do return nil end
end

function jk.thread.Mutex:forObject(value)
	_io:write_to_stdout("[jk.thread.Mutex.forObject] (Mutex.sling:55:2): Not implemented" .. "\n")
	do return nil end
end

function jk.thread.Mutex:lockMutex()
end

function jk.thread.Mutex:unlockMutex()
end

jk.thread.RunningThread = {}

jk.thread.Thread = {}
jk.thread.Thread.__index = jk.thread.Thread
_vm:set_metatable(jk.thread.Thread, {})

jk.thread.Thread.localValues = {}

function jk.thread.Thread._create()
	local v = _vm:set_metatable({}, jk.thread.Thread)
	return v
end

function jk.thread.Thread:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.thread.Thread'
	self['_isType.jk.thread.Thread'] = true
end

function jk.thread.Thread:_construct0()
	jk.thread.Thread._init(self)
	return self
end

function jk.thread.Thread:setLocalValue(id, value)
	if id ~= nil then
		_g.jk.thread.Thread.localValues[id] = value
	end
end

function jk.thread.Thread:getLocalValue(id)
	if not (id ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(_g.jk.thread.Thread.localValues, id) end
end

function jk.thread.Thread:removeLocalValue(id)
	if id ~= nil then
		do _g.jk.lang.Map:remove(_g.jk.thread.Thread.localValues, id) end
	end
end

function jk.thread.Thread:start(runnable)
	if not (runnable ~= nil) then
		do return nil end
	end
	_io:write_to_stdout("[jk.thread.Thread.start] (Thread.sling:359:3): Not implemented" .. "\n")
	do return nil end
end

jk.thread.ThreadPool = {}
jk.thread.ThreadPool.__index = jk.thread.ThreadPool
_vm:set_metatable(jk.thread.ThreadPool, {})

function jk.thread.ThreadPool._create()
	local v = _vm:set_metatable({}, jk.thread.ThreadPool)
	return v
end

function jk.thread.ThreadPool:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.thread.ThreadPool'
	self['_isType.jk.thread.ThreadPool'] = true
	self.maximumPoolSize = 0
	self.queue = nil
	self.runningThreadsCount = 0
	self.mutex = nil
end

function jk.thread.ThreadPool:forMaxPoolSize(maximumPoolSize)
	local v = _g.jk.thread.ThreadPool._construct0(_g.jk.thread.ThreadPool._create())
	v.maximumPoolSize = maximumPoolSize
	do return v end
end

function jk.thread.ThreadPool:_construct0()
	jk.thread.ThreadPool._init(self)
	self.queue = {}
	self.mutex = _g.jk.thread.Mutex:create()
	return self
end

function jk.thread.ThreadPool:getRunningThreadsCount()
	do return self.runningThreadsCount end
end

function jk.thread.ThreadPool:submitTask(task)
	do self:execute(task) end
end

function jk.thread.ThreadPool:submitTasks(tasks)
	if tasks ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(tasks)
		do
			n = 0
			while n < m do
				local task = tasks[n + 1]
				if task ~= nil then
					do self:execute(task) end
				end
				do n = n + 1 end
			end
		end
	end
end

function jk.thread.ThreadPool:execute(task)
	if not (task ~= nil) then
		do return end
	end
	do self.mutex:lockMutex() end
	if self.runningThreadsCount < self.maximumPoolSize then
		local runner = _g.jk.thread.ThreadPool.TaskRunner._construct0(_g.jk.thread.ThreadPool.TaskRunner._create())
		do runner:setMyParent(self) end
		do runner:setRunnable(task) end
		if _g.jk.thread.Thread:start(runner) ~= nil then
			do self.runningThreadsCount = self.runningThreadsCount + 1 end
		else
			do _g.jk.lang.Vector:append(self.queue, task) end
		end
	else
		do _g.jk.lang.Vector:append(self.queue, task) end
	end
	do self.mutex:unlockMutex() end
end

function jk.thread.ThreadPool:getTaskFromQueue()
	do self.mutex:lockMutex() end
	do
		local item = _vm:to_table_with_key(_g.jk.lang.Vector:popFirst(self.queue), '_isType.jk.lang.Runnable')
		if not (item ~= nil) then
			do self.runningThreadsCount = self.runningThreadsCount - 1 end
		end
		do self.mutex:unlockMutex() end
		do return item end
	end
end

jk.thread.ThreadPool.TaskRunner = {}
jk.thread.ThreadPool.TaskRunner.__index = jk.thread.ThreadPool.TaskRunner
_vm:set_metatable(jk.thread.ThreadPool.TaskRunner, {})

function jk.thread.ThreadPool.TaskRunner._create()
	local v = _vm:set_metatable({}, jk.thread.ThreadPool.TaskRunner)
	return v
end

function jk.thread.ThreadPool.TaskRunner:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.thread.ThreadPool.TaskRunner'
	self['_isType.jk.thread.ThreadPool.TaskRunner'] = true
	self['_isType.jk.lang.Runnable'] = true
	self.runnable = nil
	self.myParent = nil
end

function jk.thread.ThreadPool.TaskRunner:_construct0()
	jk.thread.ThreadPool.TaskRunner._init(self)
	return self
end

function jk.thread.ThreadPool.TaskRunner:run()
	while true do
		do self.runnable:run() end
		do
			local next = self.myParent:getTaskFromQueue()
			if not (next ~= nil) then
				do break end
			end
			self.runnable = next
		end
	end
end

function jk.thread.ThreadPool.TaskRunner:getRunnable()
	do return self.runnable end
end

function jk.thread.ThreadPool.TaskRunner:setRunnable(v)
	self.runnable = v
	do return self end
end

function jk.thread.ThreadPool.TaskRunner:getMyParent()
	do return self.myParent end
end

function jk.thread.ThreadPool.TaskRunner:setMyParent(v)
	self.myParent = v
	do return self end
end

jk.thread.CurrentThread = {}
jk.thread.CurrentThread.__index = jk.thread.CurrentThread
_vm:set_metatable(jk.thread.CurrentThread, {})

function jk.thread.CurrentThread._create()
	local v = _vm:set_metatable({}, jk.thread.CurrentThread)
	return v
end

function jk.thread.CurrentThread:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.thread.CurrentThread'
	self['_isType.jk.thread.CurrentThread'] = true
end

function jk.thread.CurrentThread:_construct0()
	jk.thread.CurrentThread._init(self)
	return self
end

function jk.thread.CurrentThread:sleepSeconds(seconds)
	do _os:sleep_seconds(seconds) end
end

function jk.thread.CurrentThread:sleepMicroSeconds(uSeconds)
	do _os:sleep_microseconds(uSeconds) end
end

function jk.thread.CurrentThread:sleepMilliSeconds(mSeconds)
	do _os:sleep_milliseconds(mSeconds) end
end

jk.thread.CriticalSection = {}
jk.thread.CriticalSection.__index = jk.thread.CriticalSection
_vm:set_metatable(jk.thread.CriticalSection, {})

function jk.thread.CriticalSection._create()
	local v = _vm:set_metatable({}, jk.thread.CriticalSection)
	return v
end

function jk.thread.CriticalSection:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.thread.CriticalSection'
	self['_isType.jk.thread.CriticalSection'] = true
end

function jk.thread.CriticalSection:_construct0()
	jk.thread.CriticalSection._init(self)
	return self
end

function jk.thread.CriticalSection:execute(value, block)
	local mutex = _g.jk.thread.Mutex:forObject(value)
	if mutex ~= nil then
		do mutex:lockMutex() end
	end
	if block ~= nil then
		do block() end
	end
	if mutex ~= nil then
		do mutex:unlockMutex() end
	end
end

jk.thread.SushiThread = {}
jk.thread.SushiThread.__index = jk.thread.SushiThread
_vm:set_metatable(jk.thread.SushiThread, {})

function jk.thread.SushiThread._create()
	local v = _vm:set_metatable({}, jk.thread.SushiThread)
	return v
end

function jk.thread.SushiThread:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.thread.SushiThread'
	self['_isType.jk.thread.SushiThread'] = true
	self.interpreter = nil
	self.reuseInterpreter = false
end

function jk.thread.SushiThread:_construct0()
	jk.thread.SushiThread._init(self)
	return self
end

function jk.thread.SushiThread:getOutputWriter()
	local fd = _pipefd
	if fd < 0 then
		do return nil end
	end
	do return _g.jk.io.FileDescriptorWriter:forUnownedFileDescriptor(fd) end
end

function jk.thread.SushiThread:getInputBuffer()
	do return _input end
end

function jk.thread.SushiThread:forThisProgram()
	local interpreter = _vm:prepare_interpreter(_code)
	if not (interpreter ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.thread.SushiThread._construct0(_g.jk.thread.SushiThread._create())
		do v:setInterpreter(interpreter) end
		do return v end
	end
end

function jk.thread.SushiThread:forCode(code)
	if not (code ~= nil) then
		do return nil end
	end
	do
		local interpreter = _vm:prepare_interpreter(code)
		if not (interpreter ~= nil) then
			do return nil end
		end
		do
			local v = _g.jk.thread.SushiThread._construct0(_g.jk.thread.SushiThread._create())
			do v:setInterpreter(interpreter) end
			do return v end
		end
	end
end

function jk.thread.SushiThread:start(fname, input)
	local interpreter = self.interpreter
	if not (interpreter ~= nil) then
		do return false end
	end
	do
		local ff = fname
		if _g.jk.lang.String:isEmpty(ff) then
			ff = "_main()"
		end
		do
			local reuse = 0
			if self.reuseInterpreter then
				reuse = 1
			end
			do
				local v = _os:execute_in_thread(interpreter, ff, input, 0, reuse)
				if v < 0 then
					do return false end
				end
				if not self.reuseInterpreter then
					interpreter = nil
				end
				do return true end
			end
		end
	end
end

function jk.thread.SushiThread:startPiped(fname, input)
	local interpreter = self.interpreter
	if not (interpreter ~= nil) then
		do return nil end
	end
	do
		local ff = fname
		if _g.jk.lang.String:isEmpty(ff) then
			ff = "_main()"
		end
		do
			local reuse = 0
			if self.reuseInterpreter then
				reuse = 1
			end
			do
				local v = _os:execute_in_thread(interpreter, ff, input, 1, reuse)
				if v < 0 then
					do return nil end
				end
				do
					local reader = _g.jk.io.FileDescriptorReader._construct0(_g.jk.io.FileDescriptorReader._create())
					do reader:setFd(v) end
					do return reader end
				end
			end
		end
	end
end

function jk.thread.SushiThread:getInterpreter()
	do return self.interpreter end
end

function jk.thread.SushiThread:setInterpreter(v)
	self.interpreter = v
	do return self end
end

function jk.thread.SushiThread:getReuseInterpreter()
	do return self.reuseInterpreter end
end

function jk.thread.SushiThread:setReuseInterpreter(v)
	self.reuseInterpreter = v
	do return self end
end
