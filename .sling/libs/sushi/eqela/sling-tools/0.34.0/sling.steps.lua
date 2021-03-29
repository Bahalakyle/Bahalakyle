sling = sling or {}

sling.steps = sling.steps or {}

sling.steps.SlingStepsTask = {}
sling.steps.SlingStepsTask.__index = sling.steps.SlingStepsTask
_vm:set_metatable(sling.steps.SlingStepsTask, {})

function sling.steps.SlingStepsTask._create()
	local v = _vm:set_metatable({}, sling.steps.SlingStepsTask)
	return v
end

function sling.steps.SlingStepsTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.steps.SlingStepsTask'
	self['_isType.sling.steps.SlingStepsTask'] = true
	self._name = nil
	self._options = nil
end

function sling.steps.SlingStepsTask:_construct0()
	sling.steps.SlingStepsTask._init(self)
	return self
end

function sling.steps.SlingStepsTask:execute(ctx)
end

function sling.steps.SlingStepsTask:getName()
	do return self._name end
end

function sling.steps.SlingStepsTask:doSetName(value)
	self._name = value
end

function sling.steps.SlingStepsTask:setName(v)
	do self:doSetName(v) end
	do return v end
end

function sling.steps.SlingStepsTask:getOptions()
	do return self._options end
end

function sling.steps.SlingStepsTask:doSetOptions(value)
	self._options = value
end

function sling.steps.SlingStepsTask:setOptions(v)
	do self:doSetOptions(v) end
	do return v end
end

sling.steps.SlingStepsMain = {}
sling.steps.SlingStepsMain.__index = sling.steps.SlingStepsMain
_vm:set_metatable(sling.steps.SlingStepsMain, {})

function sling.steps.SlingStepsMain._create()
	local v = _vm:set_metatable({}, sling.steps.SlingStepsMain)
	return v
end

function sling.steps.SlingStepsMain:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.steps.SlingStepsMain'
	self['_isType.sling.steps.SlingStepsMain'] = true
	self._ctx = nil
	self.commandMap = {}
end

function sling.steps.SlingStepsMain:_construct0()
	sling.steps.SlingStepsMain._init(self)
	do self:setCtx(_g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create())) end
	return self
end

function sling.steps.SlingStepsMain:_construct1(ctx)
	sling.steps.SlingStepsMain._init(self)
	do self:setCtx(ctx) end
	return self
end

function sling.steps.SlingStepsMain:registerCommand(cmd, handler)
	if cmd ~= nil then
		self.commandMap[cmd] = handler
	end
end

function sling.steps.SlingStepsMain:executeTasks(tasks)
	do tasks:execute(self:getCtx()) end
end

function sling.steps.SlingStepsMain:executeCommand(cmd, args)
	if _g.jk.lang.String:isEmpty(cmd) then
		do _g.jk.lang.Error:throw("noCommand", nil) end
	end
	do
		local handler = _g.jk.lang.Map:get(self.commandMap, cmd)
		if not (handler ~= nil) then
			do _g.jk.lang.Error:throw("invalidCommand", cmd) end
		end
		do handler(args) end
	end
end

function sling.steps.SlingStepsMain:doExecute(args)
	local cmd = nil
	local cmdArgs = {}
	local av = _g.jk.console.ArgumentVector:forArray(args)
	while av:hasMore() do
		if av:acceptFlag("debug") or av:acceptFlag("vv") and (_vm:to_table_with_key(self:getCtx(), '_isType.jk.console.ConsoleApplicationContext') ~= nil) then
			do self:getCtx():setEnableDebugMessages(true) end
		elseif not (cmd ~= nil) then
			cmd = av:acceptParameter()
			if not (cmd ~= nil) then
				do _g.jk.lang.Vector:append(cmdArgs, av:acceptAnyValue()) end
			end
		else
			do _g.jk.lang.Vector:append(cmdArgs, av:acceptAnyValue()) end
		end
	end
	if _g.jk.lang.String:isEmpty(cmd) then
		do _g.jk.lang.Error:throw("noCommand", nil) end
	end
	do self:executeCommand(cmd, _g.jk.console.ArgumentVector:forStringVector(cmdArgs)) end
end

function sling.steps.SlingStepsMain:translateError(e)
	if not (e ~= nil) then
		do return nil end
	end
	if e:getCode() == "noCommand" or e:getCode() == "invalidCommand" then
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("Available commands:") end
		do
			local array = _g.jk.lang.Map:getKeys(self.commandMap)
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local cmd = array[n + 1]
						if cmd ~= nil then
							do sb:appendCharacter(32) end
							do sb:appendString(cmd) end
						end
						do n = n + 1 end
					end
				end
			end
			do return sb:toString() end
		end
	end
	do return _g.jk.lang.Error:asString(e) end
end

function sling.steps.SlingStepsMain:execute(args)
	local v = 0
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:doExecute(args) end
		end)
		if _err then
			if (_vm:to_table_with_key(_err, '_isType.jk.lang.ExceptionWithError') ~= nil) then
				local e = _err
				do _g.jk.log.Log:error(self:getCtx(), self:translateError(e:getError())) end
				v = 1
			else
				local e = _err
				do _g.jk.log.Log:error(self:getCtx(), _g.jk.log.Log:asString(self:getCtx(), e)) end
				v = 1
			end
		end
	end
	do return v end
end

function sling.steps.SlingStepsMain:executeScript(args)
	do _g.jk.fs.CurrentDirectory:set(_g.jk.env.CommonPath:getAppDirectory()) end
	do return self:execute(args) end
end

function sling.steps.SlingStepsMain:getCtx()
	do return self._ctx end
end

function sling.steps.SlingStepsMain:doSetCtx(value)
	self._ctx = value
end

function sling.steps.SlingStepsMain:setCtx(v)
	do self:doSetCtx(v) end
	do return v end
end

sling.steps.SlingStepsFunctionTask = _g.sling.steps.SlingStepsTask._create()
sling.steps.SlingStepsFunctionTask.__index = sling.steps.SlingStepsFunctionTask
_vm:set_metatable(sling.steps.SlingStepsFunctionTask, {
	__index = _g.sling.steps.SlingStepsTask
})

function sling.steps.SlingStepsFunctionTask._create()
	local v = _vm:set_metatable({}, sling.steps.SlingStepsFunctionTask)
	return v
end

function sling.steps.SlingStepsFunctionTask:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.steps.SlingStepsFunctionTask'
	self['_isType.sling.steps.SlingStepsFunctionTask'] = true
	self.handler = nil
end

function sling.steps.SlingStepsFunctionTask:_construct0()
	sling.steps.SlingStepsFunctionTask._init(self)
	do _g.sling.steps.SlingStepsTask._construct0(self) end
	return self
end

function sling.steps.SlingStepsFunctionTask:forFunction(handler)
	local v = _g.sling.steps.SlingStepsFunctionTask._construct0(_g.sling.steps.SlingStepsFunctionTask._create())
	v.handler = handler
	do return v end
end

function sling.steps.SlingStepsFunctionTask:execute(ctx)
	do self.handler() end
end

sling.steps.SlingStepsTaskList = _g.sling.steps.SlingStepsTask._create()
sling.steps.SlingStepsTaskList.__index = sling.steps.SlingStepsTaskList
_vm:set_metatable(sling.steps.SlingStepsTaskList, {
	__index = _g.sling.steps.SlingStepsTask
})

function sling.steps.SlingStepsTaskList._create()
	local v = _vm:set_metatable({}, sling.steps.SlingStepsTaskList)
	return v
end

function sling.steps.SlingStepsTaskList:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.steps.SlingStepsTaskList'
	self['_isType.sling.steps.SlingStepsTaskList'] = true
	self.tasksValue = nil
end

function sling.steps.SlingStepsTaskList:_construct0()
	sling.steps.SlingStepsTaskList._init(self)
	do _g.sling.steps.SlingStepsTask._construct0(self) end
	return self
end

function sling.steps.SlingStepsTaskList:forName(name)
	local v = _g.sling.steps.SlingStepsTaskList._construct0(_g.sling.steps.SlingStepsTaskList._create())
	do v:setName(name) end
	do return v end
end

function sling.steps.SlingStepsTaskList:hasTasks()
	do return _g.jk.lang.Vector:isNotEmpty(self:getTasks()) end
end

function sling.steps.SlingStepsTaskList:addTask(task)
	do _g.jk.lang.Vector:append(self:getTasks(), task) end
end

function sling.steps.SlingStepsTaskList:addFunction(handler)
	do self:addTask(_g.sling.steps.SlingStepsFunctionTask:forFunction(handler)) end
end

function sling.steps.SlingStepsTaskList:execute(ctx)
	if _g.jk.lang.String:isNotEmpty(self:getName()) then
		do _g.jk.log.Log:info(ctx, "Executing task list: `" .. _g.jk.lang.String:safeString(self:getName()) .. "'") end
	else
		do _g.jk.log.Log:info(ctx, "Executing task list.") end
	end
	do
		local hasError = false
		do
			local _status, _err = _vm:execute_protected_call(function()
				local array = self:getTasks()
				if array ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n = 0
						while n < m do
							local task = array[n + 1]
							if task ~= nil then
								do task:execute(ctx) end
							end
							do n = n + 1 end
						end
					end
				end
			end)
			if _err then
				local e = _err
				do _g.jk.log.Log:error(ctx, _g.jk.lang.String:asString(e)) end
				hasError = true
			end
		end
		if _g.jk.lang.String:isNotEmpty(self:getName()) then
			do _g.jk.log.Log:info(ctx, "DONE executing task list: `" .. _g.jk.lang.String:safeString(self:getName()) .. "'") end
		else
			do _g.jk.log.Log:info(ctx, "DONE executing task list.") end
		end
		if hasError then
			do _g.jk.lang.Error:throw("taskListFailed", self:getName()) end
		end
	end
end

function sling.steps.SlingStepsTaskList:getTasks()
	if not (self.tasksValue ~= nil) then
		self.tasksValue = {}
	end
	do return self.tasksValue end
end

function sling.steps.SlingStepsTaskList:doSetTasks(value)
	self.tasksValue = value
end

function sling.steps.SlingStepsTaskList:setTasks(v)
	do self:doSetTasks(v) end
	do return v end
end
