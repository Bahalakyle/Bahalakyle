jk = jk or {}

jk.sushi = jk.sushi or {}

jk.sushi.SushiKit = {}
jk.sushi.SushiKit.__index = jk.sushi.SushiKit
_vm:set_metatable(jk.sushi.SushiKit, {})

function jk.sushi.SushiKit._create()
	local v = _vm:set_metatable({}, jk.sushi.SushiKit)
	return v
end

function jk.sushi.SushiKit:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.sushi.SushiKit'
	self['_isType.jk.sushi.SushiKit'] = true
	self.ctx = nil
end

function jk.sushi.SushiKit:_construct0()
	jk.sushi.SushiKit._init(self)
	return self
end

function jk.sushi.SushiKit:_construct1(ctx)
	jk.sushi.SushiKit._init(self)
	self.ctx = ctx
	return self
end

function jk.sushi.SushiKit:asStringVector(o)
	local it = _g.jk.lang.DynamicObject:iterate(o)
	if not (it ~= nil) then
		do return nil end
	end
	do
		local v = {}
		while true do
			local oo = it:next()
			if not (oo ~= nil) then
				do break end
			end
			do
				local s = _g.jk.lang.String:asString(oo)
				if s ~= nil then
					do _g.jk.lang.Vector:append(v, s) end
				end
			end
		end
		do return v end
	end
end

function jk.sushi.SushiKit:executeBuffer(code, args)
	local cc = _g.jk.sushi.SushiCode:forBuffer(code)
	if not (cc ~= nil) then
		do _g.jk.lang.Error:throw("failedToInitialize", "SushiCode") end
	end
	do return cc:execute(self:asStringVector(args)) end
end

function jk.sushi.SushiKit:executeFile(file, args)
	local ff = _g.jk.fs.FileKit._construct1(_g.jk.fs.FileKit._create(), self.ctx):asFile(file)
	local code = _g.jk.sushi.SushiCode:forFile(ff)
	if not (code ~= nil) then
		do _g.jk.lang.Error:throw("failedToRead", ff:getPath()) end
	end
	do return code:execute(self:asStringVector(args)) end
end

function jk.sushi.SushiKit:executeFileProcess(file, args)
	local ff = _g.jk.fs.FileKit._construct1(_g.jk.fs.FileKit._create(), self.ctx):asFile(file)
	local pl = nil
	pl = _g.jk.process.ProcessLauncher:forSelf()
	if not (pl ~= nil) then
		pl = _g.jk.process.ProcessLauncher:forCommand("eqela", nil)
	end
	if not (pl ~= nil) then
		pl = _g.jk.process.ProcessLauncher:forCommand("sushi", nil)
	end
	if not (pl ~= nil) then
		do _g.jk.lang.Error:throw("failedToFindSushiVm", nil) end
	end
	do pl:addToParams(ff:getPath()) end
	do
		local array = self:asStringVector(args)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local arg = array[n + 1]
					if arg ~= nil then
						do pl:addToParams(arg) end
					end
					do n = n + 1 end
				end
			end
		end
		do return pl:execute() end
	end
end

jk.sushi.SushiCode = {}
jk.sushi.SushiCode.__index = jk.sushi.SushiCode
_vm:set_metatable(jk.sushi.SushiCode, {})

function jk.sushi.SushiCode._create()
	local v = _vm:set_metatable({}, jk.sushi.SushiCode)
	return v
end

function jk.sushi.SushiCode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.sushi.SushiCode'
	self['_isType.jk.sushi.SushiCode'] = true
	self.code = nil
	self.name = nil
end

function jk.sushi.SushiCode:_construct0()
	jk.sushi.SushiCode._init(self)
	return self
end

function jk.sushi.SushiCode:forBuffer(code)
	local v = _g.jk.sushi.SushiCode._construct0(_g.jk.sushi.SushiCode._create())
	do v:setCode(code) end
	do v:setName("code") end
	do return v end
end

function jk.sushi.SushiCode:forFile(file)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local code = file:getContentsBuffer()
		if not (code ~= nil) then
			do return nil end
		end
		do
			local v = _g.jk.sushi.SushiCode._construct0(_g.jk.sushi.SushiCode._create())
			do v:setCode(code) end
			do v:setName(file:getBasename()) end
			do return v end
		end
	end
end

function jk.sushi.SushiCode:execute(args)
	local buffer = self:getCode()
	local name = self:getName()
	do return _vm:execute_program(buffer, name, args) end
end

function jk.sushi.SushiCode:getCode()
	do return self.code end
end

function jk.sushi.SushiCode:setCode(v)
	self.code = v
	do return self end
end

function jk.sushi.SushiCode:getName()
	do return self.name end
end

function jk.sushi.SushiCode:setName(v)
	self.name = v
	do return self end
end
