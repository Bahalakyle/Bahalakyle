jk = jk or {}

jk.slon = jk.slon or {}

jk.slon.SLONParser = {}
jk.slon.SLONParser.__index = jk.slon.SLONParser
_vm:set_metatable(jk.slon.SLONParser, {})

function jk.slon.SLONParser._create()
	local v = _vm:set_metatable({}, jk.slon.SLONParser)
	return v
end

function jk.slon.SLONParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.slon.SLONParser'
	self['_isType.jk.slon.SLONParser'] = true
	self.iterator = nil
end

function jk.slon.SLONParser:_construct0()
	jk.slon.SLONParser._init(self)
	return self
end

jk.slon.SLONParser.NullObject = {}
jk.slon.SLONParser.NullObject.__index = jk.slon.SLONParser.NullObject
_vm:set_metatable(jk.slon.SLONParser.NullObject, {})

function jk.slon.SLONParser.NullObject._create()
	local v = _vm:set_metatable({}, jk.slon.SLONParser.NullObject)
	return v
end

function jk.slon.SLONParser.NullObject:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.slon.SLONParser.NullObject'
	self['_isType.jk.slon.SLONParser.NullObject'] = true
end

function jk.slon.SLONParser.NullObject:_construct0()
	jk.slon.SLONParser.NullObject._init(self)
	return self
end

function jk.slon.SLONParser:parse(data)
	if not (data ~= nil) then
		do return nil end
	end
	if _util:is_buffer(data) then
		do return _g.jk.slon.SLONParser:parseBuffer(data) end
	end
	if (_vm:get_variable_type(data) == 'string') then
		do return _g.jk.slon.SLONParser:parseString(data) end
	end
	if (_vm:to_table_with_key(data, '_isType.jk.fs.File') ~= nil) then
		do return _g.jk.slon.SLONParser:parseFile(data) end
	end
	do return nil end
end

function jk.slon.SLONParser:parseBuffer(buffer)
	if buffer == nil then
		do return nil end
	end
	do return _g.jk.slon.SLONParser:forBuffer(buffer):tryAcceptObject() end
end

function jk.slon.SLONParser:parseString(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return nil end
	end
	do return _g.jk.slon.SLONParser:forString(str):tryAcceptObject() end
end

function jk.slon.SLONParser:parseFile(file)
	if file == nil then
		do return nil end
	end
	do return _g.jk.slon.SLONParser:forFile(file):tryAcceptObject() end
end

function jk.slon.SLONParser:forString(str)
	local v = _g.jk.slon.SLONParser._construct0(_g.jk.slon.SLONParser._create())
	do v:setDataString(str) end
	do return v end
end

function jk.slon.SLONParser:forBuffer(buffer)
	local v = _g.jk.slon.SLONParser._construct0(_g.jk.slon.SLONParser._create())
	do v:setDataBuffer(buffer) end
	do return v end
end

function jk.slon.SLONParser:forFile(file)
	local v = _g.jk.slon.SLONParser._construct0(_g.jk.slon.SLONParser._create())
	if file ~= nil then
		do v:setDataString(file:getContentsUTF8()) end
	end
	do return v end
end

function jk.slon.SLONParser:setDataString(str)
	self.iterator = _g.jk.lang.CharacterIteratorForString:forString(str)
	do self.iterator:moveToNextChar() end
end

function jk.slon.SLONParser:setDataBuffer(buffer)
	self.iterator = _g.jk.lang.CharacterIteratorForBuffer:forBuffer(buffer)
	do self.iterator:moveToNextChar() end
end

function jk.slon.SLONParser:skipSpaces()
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
			if c == 35 then
				do self.iterator:moveToNextChar() end
				while true do
					if self.iterator:hasEnded() then
						do break end
					end
					do
						local cc = self.iterator:getCurrentChar()
						do self.iterator:moveToNextChar() end
						if _g.jk.lang.Character:isEOF(cc) or cc == 10 then
							do break end
						end
					end
				end
				goto _continue1
			end
			do break end
		end
		::_continue1::
	end
end

function jk.slon.SLONParser:acceptChar(c)
	do self:skipSpaces() end
	if self.iterator:getCurrentChar() == c then
		do self.iterator:moveToNextChar() end
		do return true end
	end
	do return false end
end

function jk.slon.SLONParser:acceptDoubleQuotedString()
	do self:skipSpaces() end
	do
		local ss = self.iterator:getCurrentChar()
		if ss ~= 34 then
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

function jk.slon.SLONParser:acceptBoolean()
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

function jk.slon.SLONParser:acceptNumber()
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

function jk.slon.SLONParser:acceptNull()
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
					do return _g.jk.slon.SLONParser.NullObject._construct0(_g.jk.slon.SLONParser.NullObject._create()) end
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

function jk.slon.SLONParser:isIdentifierCharacter(ss)
	if ss == 0 or ss == 32 or ss == 13 or ss == 10 or ss == 9 then
		do return false end
	end
	do return true end
end

function jk.slon.SLONParser:acceptIdentifier()
	do self:skipSpaces() end
	do
		local ss = self.iterator:getCurrentChar()
		if ss == 91 then
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			while true do
				local c = self.iterator:getNextChar()
				if _g.jk.lang.Character:isEOF(c) or c == 93 then
					do break end
				end
				do sb:appendCharacter(c) end
			end
			do return sb:toString() end
		end
		if self:isIdentifierCharacter(ss) then
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			do sb:appendCharacter(ss) end
			while true do
				local c = self.iterator:getNextChar()
				if _g.jk.lang.Character:isEOF(c) or not self:isIdentifierCharacter(c) then
					do break end
				end
				do sb:appendCharacter(c) end
			end
			do return sb:toString() end
		end
		do return nil end
	end
end

function jk.slon.SLONParser:expectIdentifier()
	local v = self:acceptIdentifier()
	if not (v ~= nil) then
		do self:throwExpectationError("identifier") end
	end
	do return v end
end

jk.slon.SLONParser.ParseError = _g.jk.lang.Exception._create()
jk.slon.SLONParser.ParseError.__index = jk.slon.SLONParser.ParseError
_vm:set_metatable(jk.slon.SLONParser.ParseError, {
	__index = _g.jk.lang.Exception
})

function jk.slon.SLONParser.ParseError._create()
	local v = _vm:set_metatable({}, jk.slon.SLONParser.ParseError)
	return v
end

function jk.slon.SLONParser.ParseError:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.slon.SLONParser.ParseError'
	self['_isType.jk.slon.SLONParser.ParseError'] = true
	self['_isType.jk.lang.StringObject'] = true
	self._iterator = nil
	self._expected = nil
	self.lineNumber = 0
	self.columnNumber = 0
	self.lineString = nil
end

function jk.slon.SLONParser.ParseError:_construct0()
	jk.slon.SLONParser.ParseError._init(self)
	do _g.jk.lang.Exception._construct0(self) end
	return self
end

function jk.slon.SLONParser.ParseError:computeData()
	local opos = self:getIterator():getCurrentPosition()
	self.lineNumber = 0
	self.columnNumber = 0
	do self:getIterator():setCurrentPosition(0) end
	while true do
		if self:getIterator():getCurrentPosition() >= opos then
			do break end
		end
		if self:getIterator():getCurrentChar() == 10 then
			do self.lineNumber = self.lineNumber + 1 end
			self.columnNumber = 0
		else
			do self.columnNumber = self.columnNumber + 1 end
		end
		do self:getIterator():moveToNextChar() end
	end
	do self:getIterator():setCurrentPosition(opos) end
	while true do
		if self:getIterator():getCurrentPosition() < 1 then
			do break end
		end
		do self:getIterator():moveToPreviousChar() end
		if self:getIterator():getCurrentChar() == 10 then
			do self:getIterator():moveToNextChar() end
			do break end
		end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		while true do
			local c = self:getIterator():getCurrentChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			if c == 10 then
				do break end
			end
			if c == 9 then
				do sb:appendCharacter(32) end
			else
				do sb:appendCharacter(c) end
			end
			do self:getIterator():moveToNextChar() end
		end
		self.lineString = sb:toString()
		do self:getIterator():setCurrentPosition(opos) end
	end
end

function jk.slon.SLONParser.ParseError:toString()
	if not (self.lineString ~= nil) then
		do self:computeData() end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do
			local n = 0
			while n < self.columnNumber do
				do sb:appendCharacter(32) end
				do n = n + 1 end
			end
		end
		do sb:appendCharacter(94) end
		do return "line=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.lineNumber + 1))) .. ", col=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.columnNumber + 1))) .. ", expected=`" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(self:getExpected())) .. "'\n" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(self.lineString)) .. "\n" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(sb:toString())) end
	end
end

function jk.slon.SLONParser.ParseError:getIterator()
	do return self._iterator end
end

function jk.slon.SLONParser.ParseError:doSetIterator(value)
	self._iterator = value
end

function jk.slon.SLONParser.ParseError:setIterator(v)
	do self:doSetIterator(v) end
	do return v end
end

function jk.slon.SLONParser.ParseError:getExpected()
	do return self._expected end
end

function jk.slon.SLONParser.ParseError:doSetExpected(value)
	self._expected = value
end

function jk.slon.SLONParser.ParseError:setExpected(v)
	do self:doSetExpected(v) end
	do return v end
end

function jk.slon.SLONParser:throwExpectationError(expected)
	local pe = _g.jk.slon.SLONParser.ParseError._construct0(_g.jk.slon.SLONParser.ParseError._create())
	do pe:setIterator(self.iterator) end
	do pe:setExpected(expected) end
	_vm:throw_error(pe)
end

function jk.slon.SLONParser:expectObject()
	local v = self:acceptObject()
	if not (v ~= nil) then
		do self:throwExpectationError("object") end
	end
	do return v end
end

function jk.slon.SLONParser:countIndents(str)
	if not (str ~= nil) then
		do return 0 end
	end
	do
		local it = _g.jk.lang.String:iterate(str)
		local v = 0
		while true do
			local c = it:getNextChar()
			if c == 32 or c == 9 then
				do v = v + 1 end
			else
				do break end
			end
		end
		do return v end
	end
end

function jk.slon.SLONParser:stripLongStringIndentation(str)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local commonIndents = -1
		local lines = _g.jk.lang.String:split(str, 10, 0)
		local vsize = _g.jk.lang.Vector:getSize(lines)
		local removedLastLine = false
		if vsize > 0 then
			local lastLine = _g.jk.lang.Vector:get(lines, vsize - 1)
			if lastLine ~= nil and self:countIndents(lastLine) == _g.jk.lang.String:getLength(lastLine) then
				do _g.jk.lang.Vector:remove(lines, vsize - 1) end
				removedLastLine = true
			end
		end
		if lines ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(lines)
			do
				n = 0
				while n < m do
					local line = lines[n + 1]
					if line ~= nil then
						local indents = self:countIndents(line)
						if commonIndents < 0 or indents < commonIndents then
							commonIndents = indents
						end
					end
					do n = n + 1 end
				end
			end
		end
		if commonIndents < 1 then
			do return str end
		end
		do
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			if lines ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(lines)
				do
					n2 = 0
					while n2 < m2 do
						local line = lines[n2 + 1]
						if line ~= nil then
							if sb:count() > 0 then
								do sb:appendCharacter(10) end
							end
							do sb:appendString(_g.jk.lang.String:getEndOfString(line, commonIndents)) end
						end
						do n2 = n2 + 1 end
					end
				end
			end
			if removedLastLine then
				do sb:appendCharacter(10) end
			end
			do return sb:toString() end
		end
	end
end

function jk.slon.SLONParser:parseLongString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if self.iterator:getCurrentChar() == 10 then
		do self.iterator:moveToNextChar() end
	end
	while true do
		local c = self.iterator:getCurrentChar()
		do self.iterator:moveToNextChar() end
		if _g.jk.lang.Character:isEOF(c) then
			do self:throwExpectationError("]]") end
		end
		if c == 93 then
			c = self.iterator:getCurrentChar()
			if c == 93 then
				do self.iterator:moveToNextChar() end
				do break end
			end
			do sb:appendCharacter(93) end
			goto _continue2
		end
		do sb:appendCharacter(c) end
		::_continue2::
	end
	do return self:stripLongStringIndentation(sb:toString()) end
end

function jk.slon.SLONParser:acceptObject()
	if self:acceptChar(91) then
		if self:acceptChar(91) then
			do return self:parseLongString() end
		end
		do
			local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
			while true do
				if self:acceptChar(93) then
					do break end
				end
				do v:appendObject(self:expectObject()) end
			end
			do return v end
		end
	end
	if self:acceptChar(123) then
		local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		while true do
			if self:acceptChar(125) then
				do break end
			end
			do
				local key = self:expectIdentifier()
				local val = self:expectObject()
				if (_vm:to_table_with_key(val, '_isType.jk.slon.SLONParser.NullObject') ~= nil) then
					do v:setObject(key, nil) end
				else
					do v:setObject(key, val) end
				end
			end
		end
		do return v end
	end
	do
		local s = self:acceptDoubleQuotedString()
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

function jk.slon.SLONParser:tryAcceptObject()
	do
		local _rval = nil
		local _status, _err = _vm:execute_protected_call(function()
			_rval = {}
			_rval.value = self:acceptObject()
			do return end
		end)
		if _err then
		end
		if _rval then
			do return _rval.value end
		end
	end
	do return nil end
end
