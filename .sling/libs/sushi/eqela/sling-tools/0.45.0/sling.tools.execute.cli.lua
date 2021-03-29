sling = sling or {}

sling.tools = sling.tools or {}

sling.tools.execute = sling.tools.execute or {}

sling.tools.execute.cli = sling.tools.execute.cli or {}

sling.tools.execute.cli.SlingExecuteCli = {}
sling.tools.execute.cli.SlingExecuteCli.__index = sling.tools.execute.cli.SlingExecuteCli
_vm:set_metatable(sling.tools.execute.cli.SlingExecuteCli, {})

function sling.tools.execute.cli.SlingExecuteCli._create()
	local v = _vm:set_metatable({}, sling.tools.execute.cli.SlingExecuteCli)
	return v
end

function sling.tools.execute.cli.SlingExecuteCli:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.tools.execute.cli.SlingExecuteCli'
	self['_isType.sling.tools.execute.cli.SlingExecuteCli'] = true
end

function sling.tools.execute.cli.SlingExecuteCli:_construct0()
	sling.tools.execute.cli.SlingExecuteCli._init(self)
	return self
end

function sling.tools.execute.cli.SlingExecuteCli:executeMain(argsa)
	local ctx = _g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create())
	local args = _g.jk.console.ArgumentVector:forArray(argsa)
	local sources = {}
	local output = nil
	local tasks = {}
	local providers = {}
	local libraries = {}
	while args:hasMore() do
		local param = args:acceptParameter()
		if param ~= nil then
			do _g.jk.lang.Vector:append(sources, _g.jk.fs.File:forPath(param)) end
			goto _continue1
		end
		if args:acceptOption("e") or args:acceptOption("execute") or args:acceptOption("t") or args:acceptOption("task") then
			do _g.jk.lang.Vector:append(tasks, args:getOptionValue()) end
			goto _continue1
		end
		if args:acceptOption("p") or args:acceptOption("provider") then
			do _g.jk.lang.Vector:append(providers, args:getOptionValue()) end
			goto _continue1
		end
		if args:acceptOption("lib") or args:acceptOption("library") then
			do _g.jk.lang.Vector:append(libraries, args:getOptionValue()) end
			goto _continue1
		end
		if args:acceptOption("o") or args:acceptOption("output") then
			output = _g.jk.fs.File:forPath(args:getOptionValue())
			goto _continue1
		end
		do _g.jk.lang.Error:throw("unsupportedParameter", args:getCurrent()) end
		::_continue1::
	end
	if _g.jk.lang.Vector:isEmpty(tasks) then
		do _g.jk.lang.Error:throw("noTasks", nil) end
	end
	do
		local tool = _g.sling.tools.execute.SlingExecuteTool._construct0(_g.sling.tools.execute.SlingExecuteTool._create())
		do tool:setCtx(ctx) end
		do tool:setSources(sources) end
		do tool:setOutput(output) end
		do tool:setTasks(tasks) end
		do tool:setProviders(providers) end
		do tool:setLibraries(libraries) end
		do tool:execute() end
		do return 0 end
	end
end

function sling.tools.execute.cli.SlingExecuteCli:_main(args)
	do return _g.sling.tools.execute.cli.SlingExecuteCli._construct0(_g.sling.tools.execute.cli.SlingExecuteCli._create()):executeMain(args) end
end

function _main(args)
	do return sling.tools.execute.cli.SlingExecuteCli:_main(args) end
end
