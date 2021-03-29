jk = jk or {}

jk.json = jk.json or {}

jk.json.JSONObject = {}

jk.json.JSONParser = {}
jk.json.JSONParser.__index = jk.json.JSONParser
_vm:set_metatable(jk.json.JSONParser, {})

function jk.json.JSONParser._create()
	local v = _vm:set_metatable({}, jk.json.JSONParser)
	return v
end

function jk.json.JSONParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.json.JSONParser'
	self['_isType.jk.json.JSONParser'] = true
	self.iterator = nil
end

function jk.json.JSONParser:_construct0()
	jk.json.JSONParser._init(self)
	return self
end

jk.json.JSONParser.NullObject = {}
jk.json.JSONParser.NullObject.__index = jk.json.JSONParser.NullObject
_vm:set_metatable(jk.json.JSONParser.NullObject, {})

function jk.json.JSONParser.NullObject._create()
	local v = _vm:set_metatable({}, jk.json.JSONParser.NullObject)
	return v
end

function jk.json.JSONParser.NullObject:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.json.JSONParser.NullObject'
	self['_isType.jk.json.JSONParser.NullObject'] = true
end

function jk.json.JSONParser.NullObject:_construct0()
	jk.json.JSONParser.NullObject._init(self)
	return self
end

function jk.json.JSONParser:parse(data)
	if not (data ~= nil) then
		do return nil end
	end
	if _util:is_buffer(data) then
		do return _g.jk.json.JSONParser:parseBuffer(data) end
	end
	if (_vm:get_variable_type(data) == 'string') then
		do return _g.jk.json.JSONParser:parseString(data) end
	end
	if (_vm:to_table_with_key(data, '_isType.jk.fs.File') ~= nil) then
		do return _g.jk.json.JSONParser:parseFile(data) end
	end
	do return nil end
end

function jk.json.JSONParser:parseBuffer(buffer)
	if buffer == nil then
		do return nil end
	end
	do return _g.jk.json.JSONParser:forBuffer(buffer):acceptObject() end
end

function jk.json.JSONParser:parseString(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return nil end
	end
	do return _g.jk.json.JSONParser:forString(str):acceptObject() end
end

function jk.json.JSONParser:parseFile(file)
	if file == nil then
		do return nil end
	end
	do return _g.jk.json.JSONParser:parseString(file:getContentsUTF8()) end
end

function jk.json.JSONParser:forString(str)
	local v = _g.jk.json.JSONParser._construct0(_g.jk.json.JSONParser._create())
	do v:setDataString(str) end
	do return v end
end

function jk.json.JSONParser:forBuffer(buffer)
	local v = _g.jk.json.JSONParser._construct0(_g.jk.json.JSONParser._create())
	do v:setDataBuffer(buffer) end
	do return v end
end

function jk.json.JSONParser:setDataString(str)
	self.iterator = _g.jk.lang.CharacterIteratorForString:forString(str)
	do self.iterator:moveToNextChar() end
end

function jk.json.JSONParser:setDataBuffer(buffer)
	self.iterator = _g.jk.lang.CharacterIteratorForBuffer:forBuffer(buffer)
	do self.iterator:moveToNextChar() end
end

function jk.json.JSONParser:skipSpaces()
	while true do
		if self.iterator:hasEnded() then
			do break end
		end
		do
			local c = self.iterator:getCurrentChar()
			if c == 32 or c == 9 or c == 13 or c == 10 then
				do self.iterator:moveToNextChar() end
				goto _continue1
			end
			do break end
		end
		::_continue1::
	end
end

function jk.json.JSONParser:acceptChar(c)
	do self:skipSpaces() end
	if self.iterator:getCurrentChar() == c then
		do self.iterator:moveToNextChar() end
		do return true end
	end
	do return false end
end

function jk.json.JSONParser:acceptString()
	do self:skipSpaces() end
	do
		local ss = self.iterator:getCurrentChar()
		if ss ~= 39 and ss ~= 34 then
			do return nil end
		end
		do
			local i = 0
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			while true do
				local c = self.iterator:getNextChar()
				do i = i + 1 end
				if _g.jk.lang.Character:isEOF(c) then
					do
						local n = 0
						while n < i do
							do self.iterator:moveToPreviousChar() end
							do n = n + 1 end
						end
					end
					do return nil end
				end
				if c == ss then
					do self.iterator:moveToNextChar() end
					do break end
				end
				if c == 92 then
					c = self.iterator:getNextChar()
					if c == 117 then
						local v = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
						local x = 0
						while x < 4 do
							if self.iterator:hasEnded() then
								do break end
							end
							do v:appendCharacter(self.iterator:getNextChar()) end
							do x = x + 1 end
						end
						c = _g.jk.lang.String:toIntegerFromHex(v:toString())
					elseif c == 116 then
						c = 9
					elseif c == 114 then
						c = 13
					elseif c == 110 then
						c = 10
					elseif c == 98 then
						c = 8
					elseif c == 102 then
						c = 12
					end
				end
				do sb:appendCharacter(c) end
			end
			do return sb:toString() end
		end
	end
end

function jk.json.JSONParser:acceptBoolean()
	do self:skipSpaces() end
	do
		local ss = self.iterator:getCurrentChar()
		if ss ~= 116 and ss ~= 102 then
			do return nil end
		end
		do
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			do sb:appendCharacter(ss) end
			do
				local li = 5
				if ss == 116 then
					li = 4
				end
				do
					local btc = 0
					while true do
						local c = self.iterator:getNextChar()
						do btc = btc + 1 end
						if c ~= 97 and c ~= 108 and c ~= 115 and c ~= 101 and c ~= 114 and c ~= 117 then
							do self.iterator:moveToNextChar() end
							do btc = btc + 1 end
							do break end
						end
						do sb:appendCharacter(c) end
						if sb:count() == li then
							do self.iterator:moveToNextChar() end
							do btc = btc + 1 end
							do break end
						end
					end
					do
						local v = sb:toString()
						if li == 4 and "true" == v then
							do return _g.jk.lang.Boolean:asObject(true) end
						end
						if li == 5 and "false" == v then
							do return _g.jk.lang.Boolean:asObject(false) end
						end
						do
							local i = 0
							while i < btc do
								do self.iterator:moveToPreviousChar() end
								do i = i + 1 end
							end
							do return nil end
						end
					end
				end
			end
		end
	end
end

function jk.json.JSONParser:acceptNumber()
	do self:skipSpaces() end
	do
		local ss = self.iterator:getCurrentChar()
		if ss ~= 45 and ss ~= 43 and ss ~= 46 and (ss < 48 or ss > 57) then
			do return nil end
		end
		do
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			do sb:appendCharacter(ss) end
			while true do
				local c = self.iterator:getNextChar()
				if c ~= 46 and c ~= 101 and c ~= 69 and c ~= 45 and (c < 48 or c > 57) then
					do break end
				end
				do sb:appendCharacter(c) end
			end
			do
				local s = sb:toString()
				if _g.jk.lang.String:getIndexOfCharacter(s, 46, 0) > -1 then
					do return _g.jk.lang.Double:asObject(_g.jk.lang.Double:asDouble(s)) end
				end
				do
					local value = _g.jk.lang.String:toLong(s)
					if value >= -2147483648 and value <= 2147483647 then
						do return _g.jk.lang.Integer:asObject(value) end
					end
					do return _g.jk.lang.LongInteger:asObject(value) end
				end
			end
		end
	end
end

function jk.json.JSONParser:acceptNull()
	do self:skipSpaces() end
	do
		local ss = self.iterator:getCurrentChar()
		if ss ~= 110 then
			do return nil end
		end
		do
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			do sb:appendCharacter(ss) end
			do
				local btc = 0
				while true do
					local c = self.iterator:getNextChar()
					do btc = btc + 1 end
					if c ~= 117 and c ~= 108 then
						do self.iterator:moveToNextChar() end
						do btc = btc + 1 end
						do break end
					end
					do sb:appendCharacter(c) end
					if sb:count() == 4 then
						do self.iterator:moveToNextChar() end
						do btc = btc + 1 end
						do break end
					end
				end
				if "null" == sb:toString() then
					do return _g.jk.json.JSONParser.NullObject._construct0(_g.jk.json.JSONParser.NullObject._create()) end
				end
				do
					local i = 0
					while i < btc do
						do self.iterator:moveToPreviousChar() end
						do i = i + 1 end
					end
					do return nil end
				end
			end
		end
	end
end

function jk.json.JSONParser:acceptObject()
	if self:acceptChar(91) then
		local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
		while true do
			if self:acceptChar(93) then
				do break end
			end
			do
				local o = self:acceptObject()
				if o == nil then
					do return nil end
				end
				do v:appendObject(o) end
				do self:acceptChar(44) end
			end
		end
		do return v end
	end
	if self:acceptChar(123) then
		local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		while true do
			if self:acceptChar(125) then
				do break end
			end
			do
				local key = self:acceptString()
				if key == nil then
					do return nil end
				end
				if self:acceptChar(58) == false then
					do return nil end
				end
				do
					local val = self:acceptObject()
					if val == nil then
						do return nil end
					end
					if (_vm:to_table_with_key(val, '_isType.jk.json.JSONParser.NullObject') ~= nil) then
						do v:setObject(key, nil) end
					else
						do v:setObject(key, val) end
					end
					do self:acceptChar(44) end
				end
			end
		end
		do return v end
	end
	do
		local s = self:acceptString()
		if s ~= nil then
			do return s end
		end
		do
			local b = self:acceptBoolean()
			if b ~= nil then
				do return b end
			end
			do
				local n = self:acceptNull()
				if n ~= nil then
					do return n end
				end
				do
					local v = self:acceptNumber()
					if v ~= nil then
						do return v end
					end
					do return nil end
				end
			end
		end
	end
end

function jk.json.JSONParser:getNextToken()
	if self:acceptChar(91) then
		do return "[" end
	end
	if self:acceptChar(93) then
		do return "]" end
	end
	if self:acceptChar(123) then
		do return "{" end
	end
	if self:acceptChar(125) then
		do return "}" end
	end
	if self:acceptChar(44) then
		do return "," end
	end
	do
		local s = self:acceptString()
		if s ~= nil then
			do return s end
		end
		do
			local b = self:acceptBoolean()
			if b ~= nil then
				do return b end
			end
			do
				local n = self:acceptNull()
				if n ~= nil then
					do return n end
				end
				do
					local v = self:acceptNumber()
					if v ~= nil then
						do return v end
					end
					do return nil end
				end
			end
		end
	end
end

function jk.json.JSONParser:pushData(string)
	if not (string ~= nil) then
		do return end
	end
	if self.iterator == nil then
		do self:setDataString(string) end
		do return end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		while true do
			local c = self.iterator:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			do sb:appendCharacter(c) end
		end
		do sb:appendString(string) end
		do self:setDataString(sb:toString()) end
	end
end

jk.json.JSONObjectAdapterExplicit = {}
jk.json.JSONObjectAdapterExplicit.__index = jk.json.JSONObjectAdapterExplicit
_vm:set_metatable(jk.json.JSONObjectAdapterExplicit, {})

function jk.json.JSONObjectAdapterExplicit._create()
	local v = _vm:set_metatable({}, jk.json.JSONObjectAdapterExplicit)
	return v
end

function jk.json.JSONObjectAdapterExplicit:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.json.JSONObjectAdapterExplicit'
	self['_isType.jk.json.JSONObjectAdapterExplicit'] = true
	self['_isType.jk.json.JSONObject'] = true
end

function jk.json.JSONObjectAdapterExplicit:_construct0()
	jk.json.JSONObjectAdapterExplicit._init(self)
	return self
end

function jk.json.JSONObjectAdapterExplicit:asJsonValue(value)
	if not (value ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(value, '_isType.jk.json.JSONObject') ~= nil) then
		local oj = value
		do return oj:toJsonObject() end
	end
	do return value end
end

function jk.json.JSONObjectAdapterExplicit:toDynamicMap()
	do return _vm:to_table_with_key(self:toJsonObject(), '_isType.jk.lang.DynamicMap') end
end

function jk.json.JSONObjectAdapterExplicit:toObjectMap()
	local dm = self:toDynamicMap()
	if not (dm ~= nil) then
		do return nil end
	end
	do return dm:toObjectMap() end
end

function jk.json.JSONObjectAdapterExplicit:toJsonObject()
end

function jk.json.JSONObjectAdapterExplicit:fromJsonObject(o)
end

jk.json.JSONObjectAdapter = {}
jk.json.JSONObjectAdapter.__index = jk.json.JSONObjectAdapter
_vm:set_metatable(jk.json.JSONObjectAdapter, {})

function jk.json.JSONObjectAdapter._create()
	local v = _vm:set_metatable({}, jk.json.JSONObjectAdapter)
	return v
end

function jk.json.JSONObjectAdapter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.json.JSONObjectAdapter'
	self['_isType.jk.json.JSONObjectAdapter'] = true
	self['_isType.jk.json.JSONObject'] = true
end

function jk.json.JSONObjectAdapter:_construct0()
	jk.json.JSONObjectAdapter._init(self)
	return self
end

function jk.json.JSONObjectAdapter:asJsonValue(value)
	if not (value ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(value, '_isType.jk.json.JSONObject') ~= nil) then
		local oj = value
		do return oj:toJsonObject() end
	end
	do return value end
end

function jk.json.JSONObjectAdapter:toDynamicMap()
	do return _vm:to_table_with_key(self:toJsonObject(), '_isType.jk.lang.DynamicMap') end
end

function jk.json.JSONObjectAdapter:toObjectMap()
	local dm = self:toDynamicMap()
	if not (dm ~= nil) then
		do return nil end
	end
	do return dm:toObjectMap() end
end

function jk.json.JSONObjectAdapter:toJsonObject()
end

function jk.json.JSONObjectAdapter:fromJsonObject(o)
end

jk.json.JSONEncoder = {}
jk.json.JSONEncoder.__index = jk.json.JSONEncoder
_vm:set_metatable(jk.json.JSONEncoder, {})

function jk.json.JSONEncoder._create()
	local v = _vm:set_metatable({}, jk.json.JSONEncoder)
	return v
end

function jk.json.JSONEncoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.json.JSONEncoder'
	self['_isType.jk.json.JSONEncoder'] = true
	self.niceFormatting = true
	self.stringFormattedBoolean = false
	self.stringFormattedNumber = false
	self.newJSONFormat = true
	self.encodeNullAsNull = false
	self.isNewLine = true
	self.mysb = nil
end

function jk.json.JSONEncoder:_construct0()
	jk.json.JSONEncoder._init(self)
	return self
end

function jk.json.JSONEncoder:print(line, indent, startline, endline, sb)
	if startline and self.isNewLine == false then
		if self.niceFormatting then
			do sb:appendCharacter(10) end
		end
		self.isNewLine = true
	end
	if self.isNewLine and self.niceFormatting then
		do
			local n = 0
			while n < indent do
				do sb:appendCharacter(9) end
				do n = n + 1 end
			end
		end
	end
	do sb:appendString(line) end
	if endline then
		if self.niceFormatting then
			do sb:appendCharacter(10) end
		end
		self.isNewLine = true
	else
		self.isNewLine = false
	end
end

function jk.json.JSONEncoder:encodeArray(cc, indent, sb)
	do self:print("[", indent, false, true, sb) end
	do
		local first = true
		if cc ~= nil then
			local n = 0
			local m = #cc
			do
				n = 0
				while n < m do
					local o = cc[n + 1]
					if o ~= nil then
						if first == false then
							do self:print(",", indent, false, true, sb) end
						end
						do self:encodeObject(o, indent + 1, sb) end
						first = false
					end
					do n = n + 1 end
				end
			end
		end
		do self:print("]", indent, true, false, sb) end
	end
end

function jk.json.JSONEncoder:encodeDynamicVector(cc, indent, sb)
	do self:print("[", indent, false, true, sb) end
	do
		local first = true
		local array = cc:toVector()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local o = array[n + 1]
					if o ~= nil then
						if first == false then
							do self:print(",", indent, false, true, sb) end
						end
						do self:encodeObject(o, indent + 1, sb) end
						first = false
					end
					do n = n + 1 end
				end
			end
		end
		do self:print("]", indent, true, false, sb) end
	end
end

function jk.json.JSONEncoder:encodeVector(cc, indent, sb)
	do self:print("[", indent, false, true, sb) end
	do
		local first = true
		if cc ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(cc)
			do
				n = 0
				while n < m do
					local o = cc[n + 1]
					if o ~= nil then
						if first == false then
							do self:print(",", indent, false, true, sb) end
						end
						do self:encodeObject(o, indent + 1, sb) end
						first = false
					end
					do n = n + 1 end
				end
			end
		end
		do self:print("]", indent, true, false, sb) end
	end
end

function jk.json.JSONEncoder:encodeMap(map, indent, sb)
	do self:print("{", indent, false, true, sb) end
	do
		local first = true
		local it = _g.jk.lang.Map:iterateKeys(map)
		while it ~= nil do
			local keyo = it:next()
			if not (keyo ~= nil) then
				do break end
			end
			do
				local key = _g.jk.lang.String:asString(keyo)
				if not (key ~= nil) then
					goto _continue2
				end
				if not first then
					do self:print(",", indent, false, true, sb) end
				end
				do self:encodeString(key, indent + 1, sb) end
				if self.niceFormatting then
					do sb:appendString(" : ") end
				else
					do sb:appendCharacter(58) end
				end
				do self:encodeObject(map[keyo], indent + 1, sb) end
				first = false
			end
			::_continue2::
		end
		do self:print("}", indent, true, false, sb) end
	end
end

function jk.json.JSONEncoder:encodeDynamicMap(map, indent, sb)
	do self:print("{", indent, false, true, sb) end
	do
		local first = true
		local it = map:iterateKeys()
		while it ~= nil do
			local key = it:next()
			if not (key ~= nil) then
				do break end
			end
			if first == false then
				do self:print(",", indent, false, true, sb) end
			end
			do self:encodeString(key, indent + 1, sb) end
			if self.niceFormatting then
				do sb:appendString(" : ") end
			else
				do sb:appendCharacter(58) end
			end
			do self:encodeObject(map:get(key), indent + 1, sb) end
			first = false
		end
		do self:print("}", indent, true, false, sb) end
	end
end

function jk.json.JSONEncoder:encodeKeyValueList(list, indent, sb)
	do self:print("{", indent, false, true, sb) end
	do
		local first = true
		local it = list:iterate()
		while it ~= nil do
			local pair = it:next()
			if pair == nil then
				do break end
			end
			if first == false then
				do self:print(",", indent, false, true, sb) end
			end
			do self:encodeString(pair.key, indent + 1, sb) end
			if self.niceFormatting then
				do sb:appendString(" : ") end
			else
				do sb:appendCharacter(58) end
			end
			do self:encodeString(pair.value, indent + 1, sb) end
			first = false
		end
		do self:print("}", indent, true, false, sb) end
	end
end

function jk.json.JSONEncoder:encodeString(s, indent, sb)
	if self.mysb == nil then
		self.mysb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	else
		do self.mysb:clear() end
	end
	do self.mysb:appendCharacter(34) end
	do
		local it = _g.jk.lang.String:iterate(s)
		while true do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			if self.newJSONFormat then
				if c == 9 then
					do self.mysb:appendString("\\t") end
					goto _continue3
				end
				if c == 10 then
					do self.mysb:appendString("\\n") end
					goto _continue3
				end
				if c == 13 then
					do self.mysb:appendString("\\r") end
					goto _continue3
				end
				if c == 8 then
					do self.mysb:appendString("\\b") end
					goto _continue3
				end
				if c == 12 then
					do self.mysb:appendString("\\f") end
					goto _continue3
				end
			end
			if c == 34 then
				do self.mysb:appendCharacter(92) end
			elseif c == 92 then
				do self.mysb:appendCharacter(92) end
			end
			do self.mysb:appendCharacter(c) end
			::_continue3::
		end
		do self.mysb:appendCharacter(34) end
		do self:print(self.mysb:toString(), indent, false, false, sb) end
	end
end

function jk.json.JSONEncoder:encodeBoolean(b, indent, sb)
	if self.mysb == nil then
		self.mysb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	else
		do self.mysb:clear() end
	end
	if self.stringFormattedBoolean then
		do self.mysb:appendCharacter(34) end
		do self.mysb:appendString(_g.jk.lang.String:forBoolean(b)) end
		do self.mysb:appendCharacter(34) end
	else
		do self.mysb:appendString(_g.jk.lang.String:forBoolean(b)) end
	end
	do self:print(self.mysb:toString(), indent, false, false, sb) end
end

function jk.json.JSONEncoder:encodeNumber(o, indent, sb)
	if self.mysb == nil then
		self.mysb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	else
		do self.mysb:clear() end
	end
	if self.stringFormattedNumber then
		do self.mysb:appendCharacter(34) end
		do self.mysb:appendString(_g.jk.lang.String:asString(o)) end
		do self.mysb:appendCharacter(34) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.IntegerObject') ~= nil) then
		do self.mysb:appendInteger(_g.jk.lang.Integer:asInteger(o)) end
	elseif _vm:to_table_with_key(o, '_isType.jk.lang.LongIntegerObject') ~= nil then
		do self.mysb:appendLong(_g.jk.lang.LongInteger:asLong(o)) end
	elseif _vm:to_table_with_key(o, '_isType.jk.lang.DoubleObject') ~= nil then
		do self.mysb:appendDouble(_g.jk.lang.Double:asDouble(o)) end
	else
		do self.mysb:appendString("") end
	end
	do self:print(self.mysb:toString(), indent, false, false, sb) end
end

function jk.json.JSONEncoder:encodeObject(o, indent, sb)
	if not (o ~= nil) then
		if self.encodeNullAsNull then
			do self:print("null", indent, false, false, sb) end
		else
			do self:encodeString("", indent, sb) end
		end
	elseif (_vm:to_table_with_key(o, '_isType.jk.json.JSONObject') ~= nil) then
		do self:encodeObject(o:toJsonObject(), indent, sb) end
	elseif (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(o) then
		do self:encodeArray(o, indent, sb) end
	elseif (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(o) then
		do self:encodeVector(o, indent, sb) end
	elseif (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x < 1 end)(o) then
		do self:encodeMap(o, indent, sb) end
	elseif _util:is_buffer(o) then
		do self:encodeString(_g.jk.base64.Base64Encoder:encode(o), indent, sb) end
	elseif (_vm:get_variable_type(o) == 'string') then
		do self:encodeString(o, indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.DynamicMap') ~= nil) then
		do self:encodeDynamicMap(o, indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.DynamicVector') ~= nil) then
		do self:encodeDynamicVector(o, indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.KeyValueListForStrings') ~= nil) then
		do self:encodeKeyValueList(o, indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.StringObject') ~= nil) then
		do self:encodeString(o:toString(), indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.BufferObject') ~= nil) then
		do self:encodeString(_g.jk.base64.Base64Encoder:encode(o:toBuffer()), indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.ArrayObject') ~= nil) then
		local aa = o:toArray()
		do self:encodeArray(aa, indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.VectorObject') ~= nil) then
		local vv = o:toVector()
		do self:encodeVector(vv, indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.IntegerObject') ~= nil) or (_vm:to_table_with_key(o, '_isType.jk.lang.LongIntegerObject') ~= nil) or (_vm:to_table_with_key(o, '_isType.jk.lang.DoubleObject') ~= nil) then
		do self:encodeNumber(o, indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.CharacterObject') ~= nil) then
		do self:encodeString(_g.jk.lang.String:asString(o), indent, sb) end
	elseif (_vm:to_table_with_key(o, '_isType.jk.lang.BooleanObject') ~= nil) then
		do self:encodeBoolean(_g.jk.lang.Boolean:asBoolean(o, false), indent, sb) end
	else
		do self:encodeString("", indent, sb) end
	end
end

function jk.json.JSONEncoder:encode(o, niceFormatting, stringFormattedNumber)
	local v = _g.jk.json.JSONEncoder._construct0(_g.jk.json.JSONEncoder._create())
	do v:setStringFormattedBoolean(true) end
	do v:setStringFormattedNumber(stringFormattedNumber) end
	do v:setNiceFormatting(niceFormatting) end
	do return v:execute(o) end
end

function jk.json.JSONEncoder:execute(o)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do self:encodeObject(o, 0, sb) end
	do return sb:toString() end
end

function jk.json.JSONEncoder:encodeToBuilder(o, sb)
	if not (sb ~= nil) then
		do return end
	end
	do
		local str = _g.jk.json.JSONEncoder._construct0(_g.jk.json.JSONEncoder._create()):setEncodeNullAsNull(true):execute(o)
		if str ~= nil then
			do sb:appendString(str) end
		end
	end
end

function jk.json.JSONEncoder:toString(o)
	local v = _g.jk.json.JSONEncoder._construct0(_g.jk.json.JSONEncoder._create())
	do v:setStringFormattedBoolean(false) end
	do v:setStringFormattedNumber(false) end
	do v:setNiceFormatting(true) end
	do v:setEncodeNullAsNull(true) end
	do return v:execute(o) end
end

function jk.json.JSONEncoder:toCompactString(o)
	local v = _g.jk.json.JSONEncoder._construct0(_g.jk.json.JSONEncoder._create())
	do v:setStringFormattedBoolean(false) end
	do v:setStringFormattedNumber(false) end
	do v:setNiceFormatting(false) end
	do v:setEncodeNullAsNull(true) end
	do return v:execute(o) end
end

function jk.json.JSONEncoder:getNiceFormatting()
	do return self.niceFormatting end
end

function jk.json.JSONEncoder:setNiceFormatting(v)
	self.niceFormatting = v
	do return self end
end

function jk.json.JSONEncoder:getStringFormattedBoolean()
	do return self.stringFormattedBoolean end
end

function jk.json.JSONEncoder:setStringFormattedBoolean(v)
	self.stringFormattedBoolean = v
	do return self end
end

function jk.json.JSONEncoder:getStringFormattedNumber()
	do return self.stringFormattedNumber end
end

function jk.json.JSONEncoder:setStringFormattedNumber(v)
	self.stringFormattedNumber = v
	do return self end
end

function jk.json.JSONEncoder:getNewJSONFormat()
	do return self.newJSONFormat end
end

function jk.json.JSONEncoder:setNewJSONFormat(v)
	self.newJSONFormat = v
	do return self end
end

function jk.json.JSONEncoder:getEncodeNullAsNull()
	do return self.encodeNullAsNull end
end

function jk.json.JSONEncoder:setEncodeNullAsNull(v)
	self.encodeNullAsNull = v
	do return self end
end
