jk = jk or {}

jk.md5 = jk.md5 or {}

jk.md5.MD5Encoder = {}
jk.md5.MD5Encoder.__index = jk.md5.MD5Encoder
_vm:set_metatable(jk.md5.MD5Encoder, {})

function jk.md5.MD5Encoder._create()
	local v = _vm:set_metatable({}, jk.md5.MD5Encoder)
	return v
end

function jk.md5.MD5Encoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.md5.MD5Encoder'
	self['_isType.jk.md5.MD5Encoder'] = true
end

function jk.md5.MD5Encoder:_construct0()
	jk.md5.MD5Encoder._init(self)
	return self
end

function jk.md5.MD5Encoder:encodeBuffer(buffer)
	if buffer == nil or _g.jk.lang.Buffer:getSize(buffer) < 1 then
		do return nil end
	end
	do
		local md5 = _g.jk.md5.MD5EncoderGeneric._construct0(_g.jk.md5.MD5EncoderGeneric._create())
		do return md5:encode(buffer) end
	end
end

function jk.md5.MD5Encoder:encodeString(string)
	do return _g.jk.md5.MD5Encoder:encodeBuffer(_g.jk.lang.String:toUTF8Buffer(string)) end
end

function jk.md5.MD5Encoder:encodeObject(obj)
	local bb = _g.jk.lang.Buffer:asBuffer(obj)
	if bb ~= nil then
		do return _g.jk.md5.MD5Encoder:encodeBuffer(bb) end
	end
	do
		local ss = _g.jk.lang.String:asString(obj)
		if ss ~= nil then
			do return _g.jk.md5.MD5Encoder:encodeString(ss) end
		end
		do return nil end
	end
end

jk.md5.MD5EncoderGeneric = {}
jk.md5.MD5EncoderGeneric.__index = jk.md5.MD5EncoderGeneric
_vm:set_metatable(jk.md5.MD5EncoderGeneric, {})

function jk.md5.MD5EncoderGeneric._create()
	local v = _vm:set_metatable({}, jk.md5.MD5EncoderGeneric)
	return v
end

function jk.md5.MD5EncoderGeneric:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.md5.MD5EncoderGeneric'
	self['_isType.jk.md5.MD5EncoderGeneric'] = true
end

function jk.md5.MD5EncoderGeneric:_construct0()
	jk.md5.MD5EncoderGeneric._init(self)
	return self
end

function jk.md5.MD5EncoderGeneric:encode(buf)
	do return self:stringToHex(self:toMD5(buf)) end
end

function jk.md5.MD5EncoderGeneric:toMD5(input)
	do return self:binl2rstr(self:md5(self:rstr2binl(input), _g.jk.lang.Buffer:getSize(input) * 8)) end
end

function jk.md5.MD5EncoderGeneric:stringToHex(input)
	local hexTab = {
		48,
		49,
		50,
		51,
		52,
		53,
		54,
		55,
		56,
		57,
		65,
		66,
		67,
		68,
		69,
		70
	}
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do
		local i = 0
		while i < _g.jk.lang.Buffer:getSize(input) do
			local x = input[i + 1]
			local value1 = hexTab[_vm:bitwise_and(_vm:bitwise_right_shift(x, 4), 15) + 1]
			local value2 = hexTab[_vm:bitwise_and(x, 15) + 1]
			do sb:appendCharacter(value1) end
			do sb:appendCharacter(value2) end
			do i = i + 1 end
		end
	end
	do return _g.jk.lang.String:toLowerCase(sb:toString()) end
end

function jk.md5.MD5EncoderGeneric:md5(input, len)
	if not (input ~= nil) then
		do return nil end
	end
	do
		local x = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do
			local i = 0
			while i < #input do
				do x:setInteger(_g.jk.lang.String:forInteger(i), input[i + 1]) end
				do i = i + 1 end
			end
		end
		do
			local lenValue = _util:convert_to_integer(len % 32)
			local n = 0
			local value = n + _vm:bitwise_left_shift(128, lenValue)
			local v = _vm:bitwise_or(self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(_vm:bitwise_right_shift(len, 5)), 0), 0), value)
			do x:setInteger(_g.jk.lang.String:forInteger(_vm:bitwise_right_shift(len, 5)), v) end
			do
				local slen = _vm:bitwise_right_shift(len + 64, 9)
				local index = _vm:bitwise_left_shift(slen, 4) + 14
				do x:setInteger(_g.jk.lang.String:forInteger(index), self:unwrap(_vm:bitwise_or(x:getInteger(_g.jk.lang.String:forInteger(index), 0), len), 0)) end
				do
					local a = 1732584193
					local b = -271733879
					local c = -1732584194
					local d = 271733878
					local aa = 0
					local bb = 0
					local cc = 0
					local dd = 0
					do
						local i = 0
						while i < self:getMaxLength(x) do
							aa = a
							bb = b
							cc = c
							dd = d
							a = self:ff(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 0), 0), 0), 7, -680876936)
							d = self:ff(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 1), 0), 0), 12, -389564586)
							c = self:ff(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 2), 0), 0), 17, 606105819)
							b = self:ff(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 3), 0), 0), 22, -1044525330)
							a = self:ff(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 4), 0), 0), 7, -176418897)
							d = self:ff(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 5), 0), 0), 12, 1200080426)
							c = self:ff(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 6), 0), 0), 17, -1473231341)
							b = self:ff(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 7), 0), 0), 22, -45705983)
							a = self:ff(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 8), 0), 0), 7, 1770035416)
							d = self:ff(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 9), 0), 0), 12, -1958414417)
							c = self:ff(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 10), 0), 0), 17, -42063)
							b = self:ff(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 11), 0), 0), 22, -1990404162)
							a = self:ff(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 12), 0), 0), 7, 1804603682)
							d = self:ff(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 13), 0), 0), 12, -40341101)
							c = self:ff(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 14), 0), 0), 17, -1502002290)
							b = self:ff(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 15), 0), 0), 22, 1236535329)
							a = self:gg(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 1), 0), 0), 5, -165796510)
							d = self:gg(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 6), 0), 0), 9, -1069501632)
							c = self:gg(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 11), 0), 0), 14, 643717713)
							b = self:gg(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 0), 0), 0), 20, -373897302)
							a = self:gg(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 5), 0), 0), 5, -701558691)
							d = self:gg(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 10), 0), 0), 9, 38016083)
							c = self:gg(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 15), 0), 0), 14, -660478335)
							b = self:gg(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 4), 0), 0), 20, -405537848)
							a = self:gg(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 9), 0), 0), 5, 568446438)
							d = self:gg(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 14), 0), 0), 9, -1019803690)
							c = self:gg(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 3), 0), 0), 14, -187363961)
							b = self:gg(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 8), 0), 0), 20, 1163531501)
							a = self:gg(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 13), 0), 0), 5, -1444681467)
							d = self:gg(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 2), 0), 0), 9, -51403784)
							c = self:gg(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 7), 0), 0), 14, 1735328473)
							b = self:gg(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 12), 0), 0), 20, -1926607734)
							a = self:hh(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 5), 0), 0), 4, -378558)
							d = self:hh(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 8), 0), 0), 11, -2022574463)
							c = self:hh(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 11), 0), 0), 16, 1839030562)
							b = self:hh(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 14), 0), 0), 23, -35309556)
							a = self:hh(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 1), 0), 0), 4, -1530992060)
							d = self:hh(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 4), 0), 0), 11, 1272893353)
							c = self:hh(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 7), 0), 0), 16, -155497632)
							b = self:hh(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 10), 0), 0), 23, -1094730640)
							a = self:hh(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 13), 0), 0), 4, 681279174)
							d = self:hh(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 0), 0), 0), 11, -358537222)
							c = self:hh(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 3), 0), 0), 16, -722521979)
							b = self:hh(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 6), 0), 0), 23, 76029189)
							a = self:hh(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 9), 0), 0), 4, -640364487)
							d = self:hh(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 12), 0), 0), 11, -421815835)
							c = self:hh(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 15), 0), 0), 16, 530742520)
							b = self:hh(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 2), 0), 0), 23, -995338651)
							a = self:ii(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 0), 0), 0), 6, -198630844)
							d = self:ii(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 7), 0), 0), 10, 1126891415)
							c = self:ii(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 14), 0), 0), 15, -1416354905)
							b = self:ii(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 5), 0), 0), 21, -57434055)
							a = self:ii(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 12), 0), 0), 6, 1700485571)
							d = self:ii(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 3), 0), 0), 10, -1894986606)
							c = self:ii(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 10), 0), 0), 15, -1051523)
							b = self:ii(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 1), 0), 0), 21, -2054922799)
							a = self:ii(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 8), 0), 0), 6, 1873313359)
							d = self:ii(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 15), 0), 0), 10, -30611744)
							c = self:ii(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 6), 0), 0), 15, -1560198380)
							b = self:ii(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 13), 0), 0), 21, 1309151649)
							a = self:ii(a, b, c, d, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 4), 0), 0), 6, -145523070)
							d = self:ii(d, a, b, c, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 11), 0), 0), 10, -1120210379)
							c = self:ii(c, d, a, b, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 2), 0), 0), 15, 718787259)
							b = self:ii(b, c, d, a, self:unwrap(x:getInteger(_g.jk.lang.String:forInteger(i + 9), 0), 0), 21, -343485551)
							a = self:addUnsigned(a, aa)
							b = self:addUnsigned(b, bb)
							c = self:addUnsigned(c, cc)
							d = self:addUnsigned(d, dd)
							i = i + 16
						end
					end
					do
						local ret = _vm:allocate_array(4)
						ret[0 + 1] = a
						ret[1 + 1] = b
						ret[2 + 1] = c
						ret[3 + 1] = d
						do return ret end
					end
				end
			end
		end
	end
end

function jk.md5.MD5EncoderGeneric:getMaxLength(dm)
	local i = 0
	local keys = dm:getKeys()
	if keys ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(keys)
		do
			n = 0
			while n < m do
				local v = keys[n + 1]
				if v ~= nil then
					local key = _g.jk.lang.String:toInteger(v)
					if key > i then
						i = key
					end
				end
				do n = n + 1 end
			end
		end
	end
	do
		local v = i + 1
		do return v end
	end
end

function jk.md5.MD5EncoderGeneric:rstr2binl(input)
	if not (input ~= nil) then
		do return nil end
	end
	do
		local output = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do
			local i = 0
			while i < _g.jk.lang.Buffer:getSize(input) * 8 do
				local value = _vm:bitwise_left_shift(_vm:bitwise_and(input[_util:convert_to_integer(i / 8) + 1], 255), _util:convert_to_integer(i % 32))
				local x = _vm:bitwise_right_shift(i, 5)
				local y = 0
				if output:containsKey(_g.jk.lang.String:forInteger(x)) then
					y = output:getInteger(_g.jk.lang.String:forInteger(x), 0)
				end
				do output:setInteger(_g.jk.lang.String:forInteger(x), _vm:bitwise_or(self:unwrap(y, 0), value)) end
				i = i + 8
			end
		end
		do return self:dictionary2array(output) end
	end
end

function jk.md5.MD5EncoderGeneric:binl2rstr(input)
	local output = _vm:allocate_array(16)
	do
		local i = 0
		while i < #input * 32 do
			local value = self:zeroFillRightShift(input[_vm:bitwise_right_shift(i, 5) + 1], _vm:bitwise_and(_util:convert_to_integer(i % 32), 255))
			output[_util:convert_to_integer(i / 8) + 1] = value
			i = i + 8
		end
	end
	do
		local ret = _util:allocate_buffer(16)
		do
			local i = 0
			while i < #output do
				ret[i + 1] = output[i + 1]
				do i = i + 1 end
			end
		end
		do return ret end
	end
end

function jk.md5.MD5EncoderGeneric:addUnsigned(x, y)
	do return x + y end
end

function jk.md5.MD5EncoderGeneric:rotateLeft(num, cnt)
	local value = _vm:bitwise_or(_vm:bitwise_and(_vm:bitwise_left_shift(num, cnt), 4294967295), self:zeroFillRightShift(num, 32 - cnt))
	do return value end
end

function jk.md5.MD5EncoderGeneric:cmn(q, a, b, x, s, t)
	do return self:addUnsigned(self:rotateLeft(self:addUnsigned(self:addUnsigned(a, q), self:addUnsigned(x, t)), s), b) end
end

function jk.md5.MD5EncoderGeneric:ff(a, b, c, d, x, s, t)
	do return self:cmn(_vm:bitwise_or(_vm:bitwise_and(b, c), _vm:bitwise_and(_vm:bitwise_not(b), d)), a, b, x, s, t) end
end

function jk.md5.MD5EncoderGeneric:gg(a, b, c, d, x, s, t)
	do return self:cmn(_vm:bitwise_or(_vm:bitwise_and(b, d), _vm:bitwise_and(c, _vm:bitwise_not(d))), a, b, x, s, t) end
end

function jk.md5.MD5EncoderGeneric:hh(a, b, c, d, x, s, t)
	do return self:cmn(_vm:bitwise_xor(_vm:bitwise_xor(b, c), d), a, b, x, s, t) end
end

function jk.md5.MD5EncoderGeneric:ii(a, b, c, d, x, s, t)
	do return self:cmn(_vm:bitwise_xor(c, _vm:bitwise_or(b, _vm:bitwise_not(d))), a, b, x, s, t) end
end

function jk.md5.MD5EncoderGeneric:dictionary2array(dic)
	local arr = _vm:allocate_array(dic:getCount())
	do
		local i = 0
		while i < dic:getCount() do
			arr[i + 1] = self:unwrap(dic:getInteger(_g.jk.lang.String:forInteger(i), 0), 0)
			do i = i + 1 end
		end
	end
	do return arr end
end

function jk.md5.MD5EncoderGeneric:unwrap(value, fallback)
	if value ~= 0 then
		do return value end
	end
	do return fallback end
end

function jk.md5.MD5EncoderGeneric:zeroFillRightShift(num, count)
	local value = _vm:bitwise_right_shift(_vm:bitwise_and(num, 4294967295), count)
	do return value end
end
