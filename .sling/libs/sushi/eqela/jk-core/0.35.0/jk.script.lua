jk = jk or {}

jk.script = jk.script or {}

jk.script.Script = {}
jk.script.Script.__index = jk.script.Script
_vm:set_metatable(jk.script.Script, {})

function jk.script.Script._create()
	local v = _vm:set_metatable({}, jk.script.Script)
	return v
end

function jk.script.Script:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.script.Script'
	self['_isType.jk.script.Script'] = true
	self.entryPoints = nil
	self.ctx = nil
end

function jk.script.Script:_construct0()
	jk.script.Script._init(self)
	do _g.jk.fs.CurrentDirectory:set(_g.jk.env.CommonPath:getAppDirectory()) end
	self.ctx = _g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create())
	return self
end

function jk.script.Script:print(message)
	_io:write_to_stdout(_g.jk.lang.String:asString(message) .. "\n")
end

function jk.script.Script:status(message)
	do _g.jk.log.Log:status(self.ctx, _g.jk.lang.String:asString(message)) end
end

function jk.script.Script:debug(message)
	do _g.jk.log.Log:debug(self.ctx, _g.jk.lang.String:asString(message)) end
end

function jk.script.Script:info(message)
	do _g.jk.log.Log:info(self.ctx, _g.jk.lang.String:asString(message)) end
end

function jk.script.Script:warning(message)
	do _g.jk.log.Log:warning(self.ctx, _g.jk.lang.String:asString(message)) end
end

function jk.script.Script:error(message)
	_vm:throw_error(_g.jk.lang.ExceptionWithString:forString(_g.jk.lang.String:asString(message), false))
end

function jk.script.Script:initialize()
end

function jk.script.Script:requireParameter(args, index, name)
	local v = nil
	if args ~= nil and index < #args then
		v = args[index + 1]
	end
	if _g.jk.lang.String:isEmpty(v) then
		do self:error("Missing parameter: <" .. _g.jk.lang.String:safeString(name) .. ">") end
	end
	do return v end
end

function jk.script.Script:executeFunction(script)
	if not (script ~= nil) then
		do return 0 end
	end
	do self:initialize() end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do script() end
		end)
		if _err then
			local e = _err
			do _g.jk.log.Log:error(self.ctx, _g.jk.log.Log:asString(self.ctx, e)) end
			do return 1 end
		end
	end
	do return 0 end
end

function jk.script.Script:command(name, handler)
	local sname = _g.jk.lang.String:asString(name)
	if not (sname ~= nil) then
		do return end
	end
	if not (self.entryPoints ~= nil) then
		self.entryPoints = {}
	end
	self.entryPoints[sname] = handler
end

function jk.script.Script:main(args)
	do self:initialize() end
	do
		local cmd = nil
		if args ~= nil and #args > 0 then
			cmd = args[0 + 1]
		end
		if _g.jk.lang.String:isEmpty(cmd) then
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			do sb:appendString("Missing command parameter: <") end
			do
				local first = true
				local array = _g.jk.lang.Map:getKeys(self.entryPoints)
				if array ~= nil then
					local n2 = 0
					local m = _g.jk.lang.Vector:getSize(array)
					do
						n2 = 0
						while n2 < m do
							local cc = array[n2 + 1]
							if cc ~= nil then
								if not first then
									do sb:appendCharacter(124) end
								end
								do sb:appendString(cc) end
								first = false
							end
							do n2 = n2 + 1 end
						end
					end
				end
				do sb:appendCharacter(62) end
				do _g.jk.log.Log:error(self.ctx, sb:toString()) end
				do return -1 end
			end
		end
		if self.entryPoints ~= nil then
			local handler = _g.jk.lang.Map:get(self.entryPoints, cmd)
			if handler ~= nil then
				local v = {}
				local nargs = #args
				do
					local n = 1
					while n < nargs do
						do _g.jk.lang.Vector:append(v, args[n + 1]) end
						do n = n + 1 end
					end
				end
				do
					local r = -1
					do
						local _status, _err = _vm:execute_protected_call(function()
							r = handler(v)
						end)
						if _err then
							local e = _err
							do _g.jk.log.Log:error(self.ctx, _g.jk.log.Log:asString(self.ctx, e)) end
							r = -1
						end
					end
					do return r end
				end
			end
		end
		do _g.jk.log.Log:error(self.ctx, "Unsupported command: `" .. _g.jk.lang.String:safeString(cmd) .. "'") end
		do return -1 end
	end
end
