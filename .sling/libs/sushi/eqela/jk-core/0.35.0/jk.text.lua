jk = jk or {}

jk.text = jk.text or {}

jk.text.StringBufferDecoder = {}
jk.text.StringBufferDecoder.__index = jk.text.StringBufferDecoder
_vm:set_metatable(jk.text.StringBufferDecoder, {})

function jk.text.StringBufferDecoder._create()
	local v = _vm:set_metatable({}, jk.text.StringBufferDecoder)
	return v
end

function jk.text.StringBufferDecoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.text.StringBufferDecoder'
	self['_isType.jk.text.StringBufferDecoder'] = true
end

function jk.text.StringBufferDecoder:_construct0()
	jk.text.StringBufferDecoder._init(self)
	return self
end

function jk.text.StringBufferDecoder:decodeUTF8Buffer(buf)
	do return _g.jk.lang.String:forUTF8Buffer(buf) end
end

function jk.text.StringBufferDecoder:decodeUTF16LEBuffer(buf)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local n = 0
	local m = _g.jk.lang.Buffer:getSize(buf)
	while n < m do
		do sb:appendCharacter(_g.jk.lang.Buffer:getInt16LE(buf, n)) end
		n = n + 2
	end
	do return sb:toString() end
end

function jk.text.StringBufferDecoder:decodeUTF16BEBuffer(buf)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local n = 0
	local m = _g.jk.lang.Buffer:getSize(buf)
	while n < m do
		local c = _g.jk.lang.Buffer:getInt16BE(buf, n)
		do sb:appendCharacter(c) end
		n = n + 2
	end
	do return sb:toString() end
end

function jk.text.StringBufferDecoder:decodeUTF32LEBuffer(buf)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local n = 0
	local m = _g.jk.lang.Buffer:getSize(buf)
	while n < m do
		do sb:appendCharacter(_g.jk.lang.Buffer:getInt32LE(buf, n)) end
		n = n + 4
	end
	do return sb:toString() end
end

function jk.text.StringBufferDecoder:decodeUTF32BEBuffer(buf)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local n = 0
	local m = _g.jk.lang.Buffer:getSize(buf)
	while n < m do
		do sb:appendCharacter(_g.jk.lang.Buffer:getInt32BE(buf, n)) end
		n = n + 4
	end
	do return sb:toString() end
end

function jk.text.StringBufferDecoder:decodeBufferWithBOM(buf, keepBomCharacter)
	if not (buf ~= nil) then
		do return nil end
	end
	if _g.jk.lang.Buffer:getByte(buf, 0) == 239 and _g.jk.lang.Buffer:getByte(buf, 1) == 187 and _g.jk.lang.Buffer:getByte(buf, 2) == 191 then
		if keepBomCharacter then
			do return _g.jk.text.StringBufferDecoder:decodeUTF8Buffer(buf) end
		end
		do return _g.jk.text.StringBufferDecoder:decodeUTF8Buffer(_g.jk.lang.Buffer:getSubBuffer(buf, 3, _g.jk.lang.Buffer:getSize(buf) - 3, false)) end
	end
	if _g.jk.lang.Buffer:getByte(buf, 0) == 255 and _g.jk.lang.Buffer:getByte(buf, 1) == 254 then
		if _g.jk.lang.Buffer:getByte(buf, 2) == 0 and _g.jk.lang.Buffer:getByte(buf, 3) == 0 then
			if keepBomCharacter then
				do return _g.jk.text.StringBufferDecoder:decodeUTF32LEBuffer(buf) end
			end
			do return _g.jk.text.StringBufferDecoder:decodeUTF32LEBuffer(_g.jk.lang.Buffer:getSubBuffer(buf, 4, _g.jk.lang.Buffer:getSize(buf) - 4, false)) end
		end
		if keepBomCharacter then
			do return _g.jk.text.StringBufferDecoder:decodeUTF16LEBuffer(buf) end
		end
		do return _g.jk.text.StringBufferDecoder:decodeUTF16LEBuffer(_g.jk.lang.Buffer:getSubBuffer(buf, 2, _g.jk.lang.Buffer:getSize(buf) - 2, false)) end
	end
	if _g.jk.lang.Buffer:getByte(buf, 0) == 254 and _g.jk.lang.Buffer:getByte(buf, 1) == 255 then
		if _g.jk.lang.Buffer:getByte(buf, 2) == 0 and _g.jk.lang.Buffer:getByte(buf, 3) == 0 then
			if keepBomCharacter then
				do return _g.jk.text.StringBufferDecoder:decodeUTF32BEBuffer(buf) end
			end
			do return _g.jk.text.StringBufferDecoder:decodeUTF32BEBuffer(_g.jk.lang.Buffer:getSubBuffer(buf, 4, _g.jk.lang.Buffer:getSize(buf) - 4, false)) end
		end
		if keepBomCharacter then
			do return _g.jk.text.StringBufferDecoder:decodeUTF16BEBuffer(buf) end
		end
		do return _g.jk.text.StringBufferDecoder:decodeUTF16BEBuffer(_g.jk.lang.Buffer:getSubBuffer(buf, 2, _g.jk.lang.Buffer:getSize(buf) - 2, false)) end
	end
	do return _g.jk.lang.String:forUTF8Buffer(buf) end
end

jk.text.StringUtil = {}
jk.text.StringUtil.__index = jk.text.StringUtil
_vm:set_metatable(jk.text.StringUtil, {})

function jk.text.StringUtil._create()
	local v = _vm:set_metatable({}, jk.text.StringUtil)
	return v
end

function jk.text.StringUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.text.StringUtil'
	self['_isType.jk.text.StringUtil'] = true
end

function jk.text.StringUtil:_construct0()
	jk.text.StringUtil._init(self)
	return self
end

function jk.text.StringUtil:padToLength(value, length, align, paddingCharacter)
	local ll = 0
	if value == nil then
		ll = 0
	else
		ll = _g.jk.lang.String:getLength(value)
	end
	if ll >= length then
		do return value end
	end
	do
		local add = length - ll
		local n = 0
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		if align < 0 then
			do sb:appendString(value) end
			do
				n = 0
				while n < add do
					do sb:appendCharacter(paddingCharacter) end
					do n = n + 1 end
				end
			end
		elseif align == 0 then
			local ff = _util:convert_to_integer(add / 2)
			local ss = add - ff
			do
				n = 0
				while n < ff do
					do sb:appendCharacter(paddingCharacter) end
					do n = n + 1 end
				end
			end
			do sb:appendString(value) end
			do
				n = 0
				while n < ss do
					do sb:appendCharacter(paddingCharacter) end
					do n = n + 1 end
				end
			end
		else
			do
				n = 0
				while n < add do
					do sb:appendCharacter(paddingCharacter) end
					do n = n + 1 end
				end
			end
			do sb:appendString(value) end
		end
		do return sb:toString() end
	end
end

function jk.text.StringUtil:quotedStringToVector(str, delim, ignoreRepeatedDelimiters, escapeCharacter)
	local v = {}
	if str == nil then
		do return v end
	end
	do
		local dquote = false
		local quote = false
		local sb = nil
		local it = _g.jk.lang.String:iterate(str)
		while true do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			if c == 34 and quote == false then
				dquote = not dquote
			elseif c == 39 and dquote == false then
				quote = not quote
			elseif quote == false and dquote == false and c == delim then
				if sb ~= nil then
					local r = sb:toString()
					if r == nil then
						r = ""
					end
					do _g.jk.lang.Vector:append(v, r) end
				elseif ignoreRepeatedDelimiters == false then
					do _g.jk.lang.Vector:append(v, "") end
				end
				sb = nil
			else
				if escapeCharacter > 0 and c == escapeCharacter then
					c = it:getNextChar()
					if _g.jk.lang.Character:isEOF(c) then
						do break end
					end
				end
				if sb == nil then
					sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				end
				do sb:appendCharacter(c) end
			end
			if quote == true or dquote == true and sb == nil then
				sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			end
		end
		if sb ~= nil then
			local r = sb:toString()
			if r == nil then
				r = ""
			end
			do _g.jk.lang.Vector:append(v, r) end
		end
		do return v end
	end
end

function jk.text.StringUtil:quotedStringToMap(str, delim)
	local v = {}
	local vector = _g.jk.text.StringUtil:quotedStringToVector(str, delim, true, 92)
	if vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(vector)
		do
			n = 0
			while n < m do
				local c = vector[n + 1]
				if c ~= nil then
					local sp = _g.jk.lang.String:split(c, 61, 2)
					local key = sp[0 + 1]
					local val = sp[1 + 1]
					if _g.jk.lang.String:isEmpty(key) == false then
						v[key] = val
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.text.StringUtil:combine(strings, delim, unique, index)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local flags = nil
	if unique then
		flags = {}
	end
	do
		local i = index
		while i < _g.jk.lang.Vector:getSize(strings) do
			local o = strings[i + 1]
			do i = i + 1 end
			if o == nil then
				goto _continue1
			end
			if flags ~= nil then
				if _g.jk.lang.Map:get(flags, o) ~= nil then
					goto _continue1
				end
				do _g.jk.lang.Map:set(flags, o, "true") end
			end
			if delim > 0 and sb:count() > 0 then
				do sb:appendCharacter(delim) end
			end
			do sb:appendString(o) end
			::_continue1::
		end
		do return sb:toString() end
	end
end

function jk.text.StringUtil:validateCharacters(str, validator)
	if not (str ~= nil) then
		do return false end
	end
	do
		local it = _g.jk.lang.String:iterate(str)
		if not (it ~= nil) then
			do return false end
		end
		while true do
			local c = it:getNextChar()
			if c < 1 then
				do break end
			end
			if validator(c) == false then
				do return false end
			end
		end
		do return true end
	end
end

function jk.text.StringUtil:toStringVector(vector, allowConversion)
	local v = {}
	if vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(vector)
		do
			n = 0
			while n < m do
				local o = vector[n + 1]
				if o ~= nil then
					if allowConversion then
						local s = _g.jk.lang.String:asString(o)
						if s ~= nil then
							do _g.jk.lang.Vector:append(v, s) end
						end
					elseif (_vm:get_variable_type(o) == 'string') then
						do _g.jk.lang.Vector:append(v, o) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.text.StringUtil:toObjectVector(vector)
	do return vector end
end

function jk.text.StringUtil:wrapToLines(text, charactersPerLine)
	if not (text ~= nil) then
		do return nil end
	end
	do
		local v = {}
		local it = _g.jk.lang.String:iterate(text)
		local lineBuilder = nil
		local wordBuilder = nil
		while it ~= nil do
			local c = it:getNextChar()
			if c == 32 or c == 9 or c == 10 or c < 1 then
				if wordBuilder ~= nil then
					local word = wordBuilder:toString()
					wordBuilder = nil
					if lineBuilder == nil then
						lineBuilder = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					end
					do
						local cc = lineBuilder:count()
						if cc > 0 then
							do cc = cc + 1 end
						end
						cc = cc + _g.jk.lang.String:getLength(word)
						if cc > charactersPerLine then
							do _g.jk.lang.Vector:append(v, lineBuilder:toString()) end
							lineBuilder = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
						end
						if lineBuilder:count() > 0 then
							do lineBuilder:appendCharacter(32) end
						end
						do lineBuilder:appendString(word) end
					end
				end
				if c < 1 then
					do break end
				end
				goto _continue2
			end
			if wordBuilder == nil then
				wordBuilder = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			end
			do wordBuilder:appendCharacter(c) end
			::_continue2::
		end
		if lineBuilder ~= nil then
			do _g.jk.lang.Vector:append(v, lineBuilder:toString()) end
		end
		do return v end
	end
end

function jk.text.StringUtil:stripLeadingZeros(str)
	if _g.jk.lang.String:getChar(str, 0) == 48 then
		local iter = _g.jk.lang.String:iterate(str)
		if not (iter ~= nil) then
			do return nil end
		end
		do
			local i = 0
			while true do
				local c = iter:getNextChar()
				if _g.jk.lang.Character:isEOF(c) then
					do break end
				end
				if c ~= 48 then
					do return _g.jk.lang.String:getEndOfString(str, i) end
				end
				do i = i + 1 end
			end
			do return "" end
		end
	end
	do return str end
end

function jk.text.StringUtil:formatNumberString(vv, delimiter)
	if not (vv ~= nil) then
		do return nil end
	end
	do
		local it = _g.jk.lang.String:iterate(vv)
		if not (it ~= nil) then
			do return nil end
		end
		do
			local rr = _g.jk.lang.String:getLength(vv)
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			while true do
				local c = it:getNextChar()
				if c < 1 then
					do break end
				end
				do sb:appendCharacter(c) end
				do rr = rr - 1 end
				if rr < 1 then
					do break end
				end
				if _util:convert_to_integer(rr % 3) == 0 then
					do sb:appendCharacter(delimiter) end
				end
			end
			do return sb:toString() end
		end
	end
end

function jk.text.StringUtil:formatInteger(vv, delimiter)
	do return _g.jk.text.StringUtil:formatNumberString(_g.jk.lang.String:forInteger(vv), delimiter) end
end

function jk.text.StringUtil:formatLongInteger(vv, delimiter)
	do return _g.jk.text.StringUtil:formatNumberString(_g.jk.lang.String:forLongInteger(vv), delimiter) end
end
