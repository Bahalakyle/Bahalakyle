jk = jk or {}

jk.worker = jk.worker or {}

jk.worker.WorkerPool = {}
jk.worker.WorkerPool.__index = jk.worker.WorkerPool
_vm:set_metatable(jk.worker.WorkerPool, {})

function jk.worker.WorkerPool._create()
	local v = _vm:set_metatable({}, jk.worker.WorkerPool)
	return v
end

function jk.worker.WorkerPool:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.worker.WorkerPool'
	self['_isType.jk.worker.WorkerPool'] = true
	self.ctx = nil
	self.maxWorkers = 200
	self.maxQueue = 1000
end

function jk.worker.WorkerPool:_construct0()
	jk.worker.WorkerPool._init(self)
	return self
end

function jk.worker.WorkerPool:forContext(ctx)
	local v = _g.jk.worker.WorkerPoolForSushi._construct0(_g.jk.worker.WorkerPoolForSushi._create())
	do v:setCtx(ctx) end
	do return v end
end

function jk.worker.WorkerPool:executeWorker(workertype, input, handler)
end

function jk.worker.WorkerPool:getCtx()
	do return self.ctx end
end

function jk.worker.WorkerPool:setCtx(v)
	self.ctx = v
	do return self end
end

function jk.worker.WorkerPool:getMaxWorkers()
	do return self.maxWorkers end
end

function jk.worker.WorkerPool:setMaxWorkers(v)
	self.maxWorkers = v
	do return self end
end

function jk.worker.WorkerPool:getMaxQueue()
	do return self.maxQueue end
end

function jk.worker.WorkerPool:setMaxQueue(v)
	self.maxQueue = v
	do return self end
end

jk.worker.WorkerPoolForSushi = _g.jk.worker.WorkerPool._create()
jk.worker.WorkerPoolForSushi.__index = jk.worker.WorkerPoolForSushi
_vm:set_metatable(jk.worker.WorkerPoolForSushi, {
	__index = _g.jk.worker.WorkerPool
})

function jk.worker.WorkerPoolForSushi._create()
	local v = _vm:set_metatable({}, jk.worker.WorkerPoolForSushi)
	return v
end

function jk.worker.WorkerPoolForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.worker.WorkerPoolForSushi'
	self['_isType.jk.worker.WorkerPoolForSushi'] = true
	self.queue = _g.jk.lang.Queue._construct0(_g.jk.lang.Queue._create())
	self.workers = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
	self.createdWorkers = 0
end

function jk.worker.WorkerPoolForSushi:_construct0()
	jk.worker.WorkerPoolForSushi._init(self)
	do _g.jk.worker.WorkerPool._construct0(self) end
	return self
end

jk.worker.WorkerPoolForSushi.MyTask = {}
jk.worker.WorkerPoolForSushi.MyTask.__index = jk.worker.WorkerPoolForSushi.MyTask
_vm:set_metatable(jk.worker.WorkerPoolForSushi.MyTask, {})

function jk.worker.WorkerPoolForSushi.MyTask._create()
	local v = _vm:set_metatable({}, jk.worker.WorkerPoolForSushi.MyTask)
	return v
end

function jk.worker.WorkerPoolForSushi.MyTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.worker.WorkerPoolForSushi.MyTask'
	self['_isType.jk.worker.WorkerPoolForSushi.MyTask'] = true
	self.worker = nil
	self.input = nil
	self.handler = nil
end

function jk.worker.WorkerPoolForSushi.MyTask:_construct0()
	jk.worker.WorkerPoolForSushi.MyTask._init(self)
	return self
end

function jk.worker.WorkerPoolForSushi.MyTask:getWorker()
	do return self.worker end
end

function jk.worker.WorkerPoolForSushi.MyTask:setWorker(v)
	self.worker = v
	do return self end
end

function jk.worker.WorkerPoolForSushi.MyTask:getInput()
	do return self.input end
end

function jk.worker.WorkerPoolForSushi.MyTask:setInput(v)
	self.input = v
	do return self end
end

function jk.worker.WorkerPoolForSushi.MyTask:getHandler()
	do return self.handler end
end

function jk.worker.WorkerPoolForSushi.MyTask:setHandler(v)
	self.handler = v
	do return self end
end

function jk.worker.WorkerPoolForSushi:getWorker()
	local v = self.workers:pop()
	if not (v ~= nil) then
		if self.createdWorkers < self.maxWorkers then
			v = _g.jk.thread.SushiThread:forThisProgram()
			do v:setReuseInterpreter(true) end
			do self.createdWorkers = self.createdWorkers + 1 end
			do _g.jk.log.Log:debug(self:getCtx(), "Created a new worker. createdWorkers=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.createdWorkers)) .. ", maxWorkers=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.maxWorkers))) end
		end
	else
		do _g.jk.log.Log:debug(self:getCtx(), "Reused a worker. createdWorkers=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.createdWorkers)) .. ", maxWorkers=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.maxWorkers))) end
	end
	do return v end
end

function jk.worker.WorkerPoolForSushi:onWorkerDone(worker)
	do _g.jk.log.Log:debug(self:getCtx(), "Worker done. createdWorkers=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.createdWorkers)) .. ", workersInStack=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.workers:getSize())) .. ", queueSize=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.queue:getSize()))) end
	while true do
		local task = self.queue:pop()
		if not (task ~= nil) then
			do break end
		end
		do _g.jk.log.Log:debug(self:getCtx(), "Reusing worker to execute a task from queue. queueSize=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.queue:getSize()))) end
		do
			local v = self:executeWorkerWithThread(worker, task:getWorker(), task:getInput(), task:getHandler())
			if v then
				do return end
			end
			do _g.jk.log.Log:debug(self:getCtx(), "Failed to start queued task.") end
		end
	end
	do self.workers:push(worker) end
	do _g.jk.log.Log:debug(self:getCtx(), "Released a worker. createdWorkers=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.createdWorkers)) .. ", workersInStack=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.workers:getSize()))) end
end

function jk.worker.WorkerPoolForSushi:executeWorker(workertype, input, handler)
	if not (workertype ~= nil) then
		do return false end
	end
	do
		local typename = workertype
		if not _g.jk.lang.String:startsWith(typename, "class:", 0) then
			do return false end
		end
		typename = _g.jk.lang.String:getEndOfString(typename, 6)
		if not _g.jk.lang.String:isNotEmpty(typename) then
			do return false end
		end
		do
			local code = "_g." .. _g.jk.lang.String:safeString(typename) .. "._construct0(_g." .. _g.jk.lang.String:safeString(typename) .. "._create()):run()"
			local thread = self:getWorker()
			if not (thread ~= nil) then
				if self.queue:getSize() >= self.maxQueue then
					do _g.jk.log.Log:error(self.ctx, "Worker pool ran out of threads and queue is full. Rejecting task.") end
					if handler ~= nil then
						do handler(nil, 0) end
					end
					do return false end
				end
				do
					local t = _g.jk.worker.WorkerPoolForSushi.MyTask._construct0(_g.jk.worker.WorkerPoolForSushi.MyTask._create())
					do t:setWorker(code) end
					do t:setInput(input) end
					do t:setHandler(handler) end
					do self.queue:push(t) end
					do _g.jk.log.Log:debug(self:getCtx(), "Added a task to queue. queueSize=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.queue:getSize()))) end
					do return true end
				end
			end
			do
				local v = self:executeWorkerWithThread(thread, code, input, handler)
				if not v then
					do self:onWorkerDone(thread) end
				end
				do return v end
			end
		end
	end
end

function jk.worker.WorkerPoolForSushi:executeWorkerWithThread(thread, worker, input, handler)
	local iomgr = _g.jk.socket.io.IOManager:getCurrent()
	if not (iomgr ~= nil) then
		do _g.jk.log.Log:error(self:getCtx(), "There is no current IO manager. Unable to execute workers.") end
		if handler ~= nil then
			do handler(nil, 0) end
		end
		do return false end
	end
	do
		local reader = thread:startPiped(worker, input)
		if not (reader ~= nil) then
			do _g.jk.log.Log:error(self:getCtx(), "Failed to start piped sushi thread.") end
			if handler ~= nil then
				do handler(nil, 0) end
			end
			do return false end
		end
		do
			local ee = iomgr:add(reader)
			if not (ee ~= nil) then
				do _g.jk.log.Log:error(self:getCtx(), "Failed to register reader with IO manager.") end
				if (_vm:to_table_with_key(reader, '_isType.jk.lang.Closable') ~= nil) then
					do reader:close() end
				end
				if handler ~= nil then
					do handler(nil, 0) end
				end
				do return false end
			end
			do
				local buffer = _util:allocate_buffer(65536)
				local v = ee:setReadListener(function()
					local r = reader:read(buffer)
					if r < 1 then
						if handler ~= nil then
							do handler(nil, 0) end
						end
						do ee:remove() end
						if (_vm:to_table_with_key(reader, '_isType.jk.lang.Closable') ~= nil) then
							do reader:close() end
						end
						do self:onWorkerDone(thread) end
					elseif handler ~= nil then
						do handler(buffer, r) end
					end
				end)
				if not v then
					do _g.jk.log.Log:error(self:getCtx(), "Failed to set read listener for new thread pipe") end
					if handler ~= nil then
						do handler(nil, 0) end
					end
				end
				do return v end
			end
		end
	end
end

jk.worker.Worker = {}
jk.worker.Worker.__index = jk.worker.Worker
_vm:set_metatable(jk.worker.Worker, {})

function jk.worker.Worker._create()
	local v = _vm:set_metatable({}, jk.worker.Worker)
	return v
end

function jk.worker.Worker:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.worker.Worker'
	self['_isType.jk.worker.Worker'] = true
end

function jk.worker.Worker:_construct0()
	jk.worker.Worker._init(self)
	return self
end

function jk.worker.Worker:getOutputWriter()
	do return _g.jk.thread.SushiThread:getOutputWriter() end
end

function jk.worker.Worker:getInputBuffer()
	do return _g.jk.thread.SushiThread:getInputBuffer() end
end
