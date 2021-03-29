jk = jk or {}

jk.generator = jk.generator or {}

jk.generator.DataGenerator = {}
jk.generator.DataGenerator.__index = jk.generator.DataGenerator
_vm:set_metatable(jk.generator.DataGenerator, {})

function jk.generator.DataGenerator._create()
	local v = _vm:set_metatable({}, jk.generator.DataGenerator)
	return v
end

function jk.generator.DataGenerator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.generator.DataGenerator'
	self['_isType.jk.generator.DataGenerator'] = true
end

function jk.generator.DataGenerator:_construct0()
	jk.generator.DataGenerator._init(self)
	return self
end

function jk.generator.DataGenerator:generateCodeOrId(length, allDigits, allCaps, prefix)
	local random = _g.jk.random.Random:getSharedInstance()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if _g.jk.lang.String:isNotEmpty(prefix) then
		do sb:appendString(prefix) end
	end
	do
		local l = length
		if l < 1 then
			l = 1
		end
		do
			local i = 0
			while i < l do
				if allDigits then
					do sb:appendCharacter(random:nextInt3(48, 58)) end
				elseif random:nextInt3(0, 2) == 0 then
					do sb:appendCharacter(random:nextInt3(48, 58)) end
				elseif allCaps then
					do sb:appendCharacter(_g.jk.lang.Character:toUppercase(random:nextInt3(97, 123))) end
				elseif random:nextInt3(0, 2) == 0 then
					do sb:appendCharacter(_g.jk.lang.Character:toUppercase(random:nextInt3(97, 123))) end
				else
					do sb:appendCharacter(random:nextInt3(97, 123)) end
				end
				do i = i + 1 end
			end
		end
		do return sb:toString() end
	end
end
