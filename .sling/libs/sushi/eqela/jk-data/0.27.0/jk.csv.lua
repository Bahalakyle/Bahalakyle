jk = jk or {}

jk.csv = jk.csv or {}

jk.csv.CSVParser = {}
jk.csv.CSVParser.__index = jk.csv.CSVParser
_vm:set_metatable(jk.csv.CSVParser, {})

function jk.csv.CSVParser._create()
	local v = _vm:set_metatable({}, jk.csv.CSVParser)
	return v
end

function jk.csv.CSVParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.csv.CSVParser'
	self['_isType.jk.csv.CSVParser'] = true
	self.iterator = nil
end

function jk.csv.CSVParser:_construct0()
	jk.csv.CSVParser._init(self)
	return self
end

function jk.csv.CSVParser:parse1(buffer)
	if not (buffer ~= nil) then
		do return nil end
	end
	do return _g.jk.csv.CSVParser:forBuffer(buffer):acceptRows() end
end

function jk.csv.CSVParser:parse2(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return nil end
	end
	do return _g.jk.csv.CSVParser:forString(str):acceptRows() end
end

function jk.csv.CSVParser:parse3(file)
	if not (file ~= nil) then
		do return nil end
	end
	do return _g.jk.csv.CSVParser:parse2(file:getContentsUTF8()) end
end

function jk.csv.CSVParser:forString(str)
	local v = _g.jk.csv.CSVParser._construct0(_g.jk.csv.CSVParser._create())
	do v:setDataString(str) end
	do return v end
end

function jk.csv.CSVParser:forBuffer(buffer)
	local v = _g.jk.csv.CSVParser._construct0(_g.jk.csv.CSVParser._create())
	do v:setDataBuffer(buffer) end
	do return v end
end

function jk.csv.CSVParser:setDataString(str)
	self.iterator = _g.jk.lang.CharacterIteratorForString:forString(str)
	do self.iterator:moveToNextChar() end
end

function jk.csv.CSVParser:setDataBuffer(buffer)
	self.iterator = _g.jk.lang.CharacterIteratorForBuffer:forBuffer(buffer)
	do self.iterator:moveToNextChar() end
end

function jk.csv.CSVParser:acceptRows()
	local records = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
	while true do
		local record = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
		while true do
			local column = self:acceptColumn()
			do record:appendObject(column) end
			do
				local c = self.iterator:getCurrentChar()
				if c == 44 then
					do self.iterator:moveToNextChar() end
				elseif c == 10 then
					do self.iterator:moveToNextChar() end
					do break end
				end
				if self.iterator:hasEnded() then
					do break end
				end
			end
		end
		do records:appendObject(record) end
		if self.iterator:hasEnded() then
			do break end
		end
	end
	do return records end
end

function jk.csv.CSVParser:acceptColumn()
	local ss = self.iterator:getCurrentChar()
	local insideQuotes = ss == 39 or ss == 34
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if not insideQuotes then
		if ss < 1 then
			do return nil end
		end
		if ss == 44 or ss == 10 then
			do return sb:toString() end
		end
		do sb:appendCharacter(ss) end
	end
	do
		local i = 0
		while true do
			local c = self.iterator:getNextChar()
			do i = i + 1 end
			if c < 1 then
				do
					local n = 0
					while n < i do
						do self.iterator:moveToPreviousChar() end
						do n = n + 1 end
					end
				end
				do return nil end
			end
			if insideQuotes then
				if c == ss then
					local x = self.iterator:getNextChar()
					if x == 44 or x == 10 then
						do break end
					end
					do sb:appendCharacter(92) end
				end
			elseif c == 44 or c == 10 then
				do break end
			end
			do sb:appendCharacter(c) end
		end
		do return sb:toString() end
	end
end
