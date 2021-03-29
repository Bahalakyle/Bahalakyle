sling = sling or {}

sling.tools = sling.tools or {}

sling.tools.compiler = sling.tools.compiler or {}

sling.tools.compiler.cli = sling.tools.compiler.cli or {}

sling.tools.compiler.cli.SlingCompilerCli = {}
sling.tools.compiler.cli.SlingCompilerCli.__index = sling.tools.compiler.cli.SlingCompilerCli
_vm:set_metatable(sling.tools.compiler.cli.SlingCompilerCli, {})

function sling.tools.compiler.cli.SlingCompilerCli._create()
	local v = _vm:set_metatable({}, sling.tools.compiler.cli.SlingCompilerCli)
	return v
end

function sling.tools.compiler.cli.SlingCompilerCli:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'sling.tools.compiler.cli.SlingCompilerCli'
	self['_isType.sling.tools.compiler.cli.SlingCompilerCli'] = true
end

function sling.tools.compiler.cli.SlingCompilerCli:_construct0()
	sling.tools.compiler.cli.SlingCompilerCli._init(self)
	return self
end

function sling.tools.compiler.cli.SlingCompilerCli:printHeader()
	do _g.jk.console.ConsoleApplicationUtil:printHeader(_g.jk.console.Stdout:instance(), "Sling Tools", "0.34.0", "Copyright (c) 2020 J42 Pte Ltd", "GPL3", "Sushi", nil) end
end

function sling.tools.compiler.cli.SlingCompilerCli:usage()
	do self:printHeader() end
	_io:write_to_stdout("Usage: SlingCompilerCli <parameters>" .. "\n")
end

function sling.tools.compiler.cli.SlingCompilerCli:doExecute(ctx, args)
	local av = _g.jk.console.ArgumentVector:forArray(args)
	local fargs = nil
	local tasks = _g.sling.tools.compiler.SlingCompilerTaskList._construct0(_g.sling.tools.compiler.SlingCompilerTaskList._create())
	do tasks:setName("Sling Compiler Cli Build") end
	do
		local platform = "sushi"
		while av:hasMore() do
			if av:acceptOption("lib") then
				do tasks:addLibrary(av:getOptionValue(), platform, nil) end
			elseif av:acceptOption("app") then
				do tasks:addApplication(av:getOptionValue(), platform, nil) end
			elseif av:acceptOption("platform") then
				platform = av:getOptionValue()
			else
				fargs = av:acceptAllValues()
			end
		end
		if not tasks:hasTasks() then
			do self:usage() end
			do return -1 end
		end
		do
			local compiler = _g.sling.tools.compiler.SlingCompilerTool._construct0(_g.sling.tools.compiler.SlingCompilerTool._create())
			do compiler:registerCommand("build", function(args)
				do _g.sling.tools.compiler.SlingCompilerCommand:executeBuildCommand(compiler:getCtx(), tasks, args) end
			end) end
			do
				local nargs = _g.jk.lang.Vector:getSize(fargs)
				local fargsa = _vm:allocate_array(nargs)
				do
					local n = 0
					while n < nargs do
						fargsa[n + 1] = fargs[n + 1]
						do n = n + 1 end
					end
				end
				do return compiler:execute(fargsa) end
			end
		end
	end
end

function sling.tools.compiler.cli.SlingCompilerCli:execute(args)
	local v = 0
	local ctx = _g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create())
	do
		local _status, _err = _vm:execute_protected_call(function()
			v = self:doExecute(ctx, args)
		end)
		if _err then
			local e = _err
			do _g.jk.log.Log:error(ctx, _g.jk.log.Log:asString(ctx, e)) end
			v = 1
		end
	end
	do return v end
end

function sling.tools.compiler.cli.SlingCompilerCli:_main(args)
	do return _g.sling.tools.compiler.cli.SlingCompilerCli._construct0(_g.sling.tools.compiler.cli.SlingCompilerCli._create()):execute(args) end
end
