jk = jk or {}

jk.uuid = jk.uuid or {}

jk.uuid.UUIDGenerator = {}
jk.uuid.UUIDGenerator.__index = jk.uuid.UUIDGenerator
_vm:set_metatable(jk.uuid.UUIDGenerator, {})

function jk.uuid.UUIDGenerator._create()
	local v = _vm:set_metatable({}, jk.uuid.UUIDGenerator)
	return v
end

function jk.uuid.UUIDGenerator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.uuid.UUIDGenerator'
	self['_isType.jk.uuid.UUIDGenerator'] = true
end

function jk.uuid.UUIDGenerator:_construct0()
	jk.uuid.UUIDGenerator._init(self)
	return self
end

function jk.uuid.UUIDGenerator:generate()
	local random = _g.jk.random.Random:getSharedInstance()
	local bytes = _util:allocate_buffer(16)
	do
		local n = 0
		while n < 16 do
			bytes[n + 1] = random:nextInt2(255)
			do n = n + 1 end
		end
	end
	bytes[6 + 1] = _vm:bitwise_or(64, _vm:bitwise_and(bytes[6 + 1], 15))
	bytes[8 + 1] = _vm:bitwise_or(128, _vm:bitwise_and(bytes[8 + 1], 63))
	do
		local hex = _g.jk.lang.String:forBufferHex(bytes)
		do return _g.jk.lang.String:safeString(_g.jk.lang.String:getSubString(hex, 0, 8)) .. "-" .. _g.jk.lang.String:safeString(_g.jk.lang.String:getSubString(hex, 8, 4)) .. "-" .. _g.jk.lang.String:safeString(_g.jk.lang.String:getSubString(hex, 12, 4)) .. "-" .. _g.jk.lang.String:safeString(_g.jk.lang.String:getSubString(hex, 16, 4)) .. "-" .. _g.jk.lang.String:safeString(_g.jk.lang.String:getSubString(hex, 20, 12)) end
	end
end

function jk.uuid.UUIDGenerator:forString(value)
	_io:write_to_stdout("[jk.uuid.UUIDGenerator.forString] (UUIDGenerator.sling:97:3): Not implemented." .. "\n")
	do return nil end
end
