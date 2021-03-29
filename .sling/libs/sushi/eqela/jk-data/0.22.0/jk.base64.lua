jk = jk or {}

jk.base64 = jk.base64 or {}

jk.base64.Base64Decoder = {}
jk.base64.Base64Decoder.__index = jk.base64.Base64Decoder
_vm:set_metatable(jk.base64.Base64Decoder, {})

function jk.base64.Base64Decoder._create()
	local v = _vm:set_metatable({}, jk.base64.Base64Decoder)
	return v
end

function jk.base64.Base64Decoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.base64.Base64Decoder'
	self['_isType.jk.base64.Base64Decoder'] = true
end

function jk.base64.Base64Decoder:_construct0()
	jk.base64.Base64Decoder._init(self)
	return self
end

function jk.base64.Base64Decoder:fromUrlSafeFormat(str)
	local v = str
	if not (v ~= nil) then
		do return nil end
	end
	v = _g.jk.lang.String:replaceCharacter(v, 45, 43)
	v = _g.jk.lang.String:replaceCharacter(v, 95, 47)
	do
		local mod = _util:convert_to_integer(_g.jk.lang.String:getLength(v) % 4)
		if mod == 1 then
			v = _g.jk.lang.String:safeString(v) .. "==="
		elseif mod == 2 then
			v = _g.jk.lang.String:safeString(v) .. "=="
		elseif mod == 3 then
			v = _g.jk.lang.String:safeString(v) .. "="
		end
		do return v end
	end
end

function jk.base64.Base64Decoder:appendByte(buffer, byte)
	local nbyte = _g.jk.lang.Buffer:allocate(1)
	do _g.jk.lang.Buffer:setByte(nbyte, 0, byte) end
	do return _g.jk.lang.Buffer:append(buffer, nbyte, _g.jk.lang.Buffer:getSize(nbyte)) end
end

function jk.base64.Base64Decoder:fromLookupChar(ascii)
	local c = 0
	if ascii == 43 then
		c = 62
	elseif ascii == 47 then
		c = 63
	elseif ascii >= 48 and ascii <= 57 then
		c = ascii + 4
	elseif ascii >= 65 and ascii <= 90 then
		c = ascii - 65
	elseif ascii >= 97 and ascii <= 122 then
		c = ascii - 71
	end
	do return c end
end

function jk.base64.Base64Decoder:decode(text)
	if not (text ~= nil) then
		do return nil end
	end
	do
		local data = _util:allocate_buffer(0)
		local iter = _g.jk.lang.String:iterate(text)
		if iter ~= nil then
			local ch = 0
			while (function()
				ch = iter:getNextChar()
				do return ch end
			end)() > 0 do
				local c1 = 0
				local c2 = 0
				local c3 = 0
				local c4 = 0
				local byte1 = 0
				local byte2 = 0
				local byte3 = 0
				c1 = _g.jk.base64.Base64Decoder:fromLookupChar(ch)
				c2 = _g.jk.base64.Base64Decoder:fromLookupChar((function()
					ch = iter:getNextChar()
					do return ch end
				end)())
				byte1 = _vm:bitwise_left_shift(c1, 2) + _vm:bitwise_right_shift(c2, 4)
				data = _g.jk.base64.Base64Decoder:appendByte(data, byte1)
				ch = iter:getNextChar()
				if ch == 61 then
					do break end
				else
					c3 = _g.jk.base64.Base64Decoder:fromLookupChar(ch)
				end
				byte2 = _vm:bitwise_left_shift(_vm:bitwise_and(c2, 15), 4) + _vm:bitwise_right_shift(c3, 2)
				data = _g.jk.base64.Base64Decoder:appendByte(data, byte2)
				ch = iter:getNextChar()
				if ch == 61 then
					do break end
				else
					c4 = _g.jk.base64.Base64Decoder:fromLookupChar(ch)
				end
				byte3 = _vm:bitwise_left_shift(_vm:bitwise_and(c3, 3), 6) + c4
				data = _g.jk.base64.Base64Decoder:appendByte(data, byte3)
			end
		end
		do return data end
	end
end

jk.base64.Base64Encoder = {}
jk.base64.Base64Encoder.__index = jk.base64.Base64Encoder
_vm:set_metatable(jk.base64.Base64Encoder, {})

function jk.base64.Base64Encoder._create()
	local v = _vm:set_metatable({}, jk.base64.Base64Encoder)
	return v
end

function jk.base64.Base64Encoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.base64.Base64Encoder'
	self['_isType.jk.base64.Base64Encoder'] = true
end

function jk.base64.Base64Encoder:_construct0()
	jk.base64.Base64Encoder._init(self)
	return self
end

function jk.base64.Base64Encoder:toUrlSafeFormat(str)
	local v = str
	if not (v ~= nil) then
		do return nil end
	end
	v = _g.jk.lang.String:replaceString(v, "=", "")
	v = _g.jk.lang.String:replaceCharacter(v, 43, 45)
	v = _g.jk.lang.String:replaceCharacter(v, 47, 95)
	do return v end
end

function jk.base64.Base64Encoder:encodeString(str)
	if not (str ~= nil) then
		do return nil end
	end
	do return _g.jk.base64.Base64Encoder:encode(_g.jk.lang.String:toUTF8Buffer(str)) end
end

function jk.base64.Base64Encoder:encode(buffer)
	if not (buffer ~= nil) then
		do return nil end
	end
	do
		local length = _g.jk.lang.Buffer:getSize(buffer)
		local dst = _g.jk.lang.Buffer:allocate(_util:convert_to_integer((length + 2) / 3) * 4)
		local x = 0
		local dstIndex = 0
		local state = 0
		local old = 0
		do
			local srcIndex = 0
			while srcIndex < length do
				x = buffer[srcIndex + 1]
				do
					local v = (function() state = state + 1 return state end)()
					if v == 1 then
						dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(_g.jk.base64.Base64Encoder:toASCIIChar(_vm:bitwise_and(_vm:bitwise_right_shift(x, 2), 63)))
					elseif v == 2 then
						dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(_g.jk.base64.Base64Encoder:toASCIIChar(_vm:bitwise_or(_vm:bitwise_and(_vm:bitwise_left_shift(old, 4), 48), _vm:bitwise_and(_vm:bitwise_right_shift(x, 4), 15))))
					elseif v == 3 then
						dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(_g.jk.base64.Base64Encoder:toASCIIChar(_vm:bitwise_or(_vm:bitwise_and(_vm:bitwise_left_shift(old, 2), 60), _vm:bitwise_and(_vm:bitwise_right_shift(x, 6), 3))))
						dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(_g.jk.base64.Base64Encoder:toASCIIChar(_vm:bitwise_and(x, 63)))
						state = 0
					end
				end
				old = x
				do srcIndex = srcIndex + 1 end
			end
		end
		do
			local v2 = state
			if v2 == 1 then
				dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(_g.jk.base64.Base64Encoder:toASCIIChar(_vm:bitwise_and(_vm:bitwise_left_shift(old, 4), 48)))
				dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(61)
				dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(61)
			elseif v2 == 2 then
				dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(_g.jk.base64.Base64Encoder:toASCIIChar(_vm:bitwise_and(_vm:bitwise_left_shift(old, 2), 60)))
				dst[(function() local v = dstIndex dstIndex = dstIndex + 1 return v end)() + 1] = _util:convert_to_integer(61)
			end
		end
		do return _g.jk.lang.String:forBuffer(dst, "ASCII") end
	end
end

function jk.base64.Base64Encoder:toASCIIChar(lookup)
	local c = 0
	if lookup < 0 or lookup > 63 then
		do return c end
	end
	if lookup <= 25 then
		c = lookup + 65
	elseif lookup <= 51 then
		c = lookup + 71
	elseif lookup <= 61 then
		c = lookup - 4
	elseif lookup == 62 then
		c = _util:convert_to_integer(43)
	elseif lookup == 63 then
		c = _util:convert_to_integer(47)
	end
	do return c end
end
