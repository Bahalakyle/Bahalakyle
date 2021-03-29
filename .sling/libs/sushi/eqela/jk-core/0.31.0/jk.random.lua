jk = jk or {}

jk.random = jk.random or {}

jk.random.Random = {}
jk.random.Random.__index = jk.random.Random
_vm:set_metatable(jk.random.Random, {})

jk.random.Random.instance = nil

function jk.random.Random._create()
	local v = _vm:set_metatable({}, jk.random.Random)
	return v
end

function jk.random.Random:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.random.Random'
	self['_isType.jk.random.Random'] = true
	self.random = nil
end

function jk.random.Random:getSushiRandom()
	if not (self.random ~= nil) then
		do self:setSeed(_g.jk.time.SystemClock:asUTCSeconds()) end
	end
	do return self.random end
end

function jk.random.Random:getSharedInstance()
	if not (_g.jk.random.Random.instance ~= nil) then
		_g.jk.random.Random.instance = _g.jk.random.Random._construct0(_g.jk.random.Random._create())
	end
	do return _g.jk.random.Random.instance end
end

function jk.random.Random:_construct0()
	jk.random.Random._init(self)
	return self
end

function jk.random.Random:_construct1(seed)
	jk.random.Random._init(self)
	do self:setSeed(seed) end
	return self
end

function jk.random.Random:setSeed(seed)
	self.random = _util:create_random_number_generator(seed)
end

function jk.random.Random:nextBoolean()
	if _util:convert_to_integer(self:nextInt1() % 2) == 0 then
		do return false end
	end
	do return true end
end

function jk.random.Random:nextInt1()
	local random = self:getSushiRandom()
	do return _util:create_random_number(random) end
end

function jk.random.Random:nextInt2(n)
	do return _util:convert_to_integer(self:nextInt1() % n) end
end

function jk.random.Random:nextInt3(s, e)
	do return s + _util:convert_to_integer(self:nextInt1() % (e - s)) end
end

function jk.random.Random:nextBytes(buf)
	local sz = #buf
	do
		local n = 0
		while n < sz do
			buf[n + 1] = self:nextInt3(-127, 128)
			do n = n + 1 end
		end
	end
end

function jk.random.Random:nextDouble()
	local n = self:nextInt2(2147483647)
	do return n / 2147483647.0 end
end

function jk.random.Random:nextFloat()
	local n = self:nextInt2(2147483647)
	do return n / 2147483647 end
end
