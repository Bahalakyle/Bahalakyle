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

jk.csv.CSVGenerator = {}
jk.csv.CSVGenerator.__index = jk.csv.CSVGenerator
_vm:set_metatable(jk.csv.CSVGenerator, {})

function jk.csv.CSVGenerator._create()
	local v = _vm:set_metatable({}, jk.csv.CSVGenerator)
	return v
end

function jk.csv.CSVGenerator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.csv.CSVGenerator'
	self['_isType.jk.csv.CSVGenerator'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.table = {}
	self.fields = {}
end

function jk.csv.CSVGenerator:_construct0()
	jk.csv.CSVGenerator._init(self)
	return self
end

function jk.csv.CSVGenerator:setFields(data)
	self.fields = {}
	if data ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(data)
		do
			n = 0
			while n < m do
				local field = data[n + 1]
				if field ~= nil then
					do _g.jk.lang.Vector:append(self.fields, field) end
				end
				do n = n + 1 end
			end
		end
	end
end

function jk.csv.CSVGenerator:addHeaderFields(data)
	if not (self.fields ~= nil) then
		do return end
	end
	if not _g.jk.lang.Vector:isEmpty(self.table) then
		do return end
	end
	do
		local row = {}
		self.fields = {}
		if data ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(data)
			do
				n = 0
				while n < m do
					local field = data[n + 1]
					if field ~= nil then
						do _g.jk.lang.Vector:append(row, field) end
						do _g.jk.lang.Vector:append(self.fields, field) end
					end
					do n = n + 1 end
				end
			end
		end
		do self:addRow(row) end
	end
end

function jk.csv.CSVGenerator:addHeaderFromModel(record)
	if not (record ~= nil) then
		do return end
	end
	if not _g.jk.lang.Vector:isEmpty(self.table) then
		do return end
	end
	do
		local row = {}
		self.fields = {}
		do
			local array = record:getFieldInformation()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local hdr = array[n + 1]
						if hdr ~= nil then
							local val = hdr:getName()
							if not (val ~= nil) then
								val = ""
							end
							do _g.jk.lang.Vector:append(row, val) end
							do _g.jk.lang.Vector:append(self.fields, val) end
						end
						do n = n + 1 end
					end
				end
			end
			do self:addRow(row) end
		end
	end
end

function jk.csv.CSVGenerator:addRecordFromModel(record)
	if not (record ~= nil) then
		do return end
	end
	do self:addRecordFromDynamicMap(record:getData()) end
end

function jk.csv.CSVGenerator:addRecordFromDynamicMap(data)
	if not (data ~= nil) then
		do return end
	end
	do
		local row = {}
		if self.fields ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(self.fields)
			do
				n = 0
				while n < m do
					local field = self.fields[n + 1]
					if field ~= nil then
						local val = data:getString(field, nil)
						if not (val ~= nil) then
							val = ""
						end
						do _g.jk.lang.Vector:append(row, val) end
					end
					do n = n + 1 end
				end
			end
		end
		do self:addRow(row) end
	end
end

function jk.csv.CSVGenerator:addRow(data)
	if not (data ~= nil) then
		do return end
	end
	do _g.jk.lang.Vector:append(self.table, data) end
end

function jk.csv.CSVGenerator:escapeCellContents(value)
	if not (value ~= nil) then
		do return "" end
	end
	if _g.jk.lang.String:contains(value, ",") == false then
		do return value end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendCharacter(34) end
		do
			local it = _g.jk.lang.String:iterate(value)
			while it ~= nil do
				local c = it:getNextChar()
				if _g.jk.lang.Character:isEOF(c) then
					do break end
				end
				if c == 34 then
					do sb:appendCharacter(34) end
					do sb:appendCharacter(34) end
				else
					do sb:appendCharacter(c) end
				end
			end
			do sb:appendCharacter(34) end
			do return sb:toString() end
		end
	end
end

function jk.csv.CSVGenerator:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if self.table ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.table)
		do
			n = 0
			while n < m do
				local row = self.table[n + 1]
				if row ~= nil then
					local first = true
					if row ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(row)
						do
							n2 = 0
							while n2 < m2 do
								local cell = row[n2 + 1]
								if cell ~= nil then
									if not first then
										do sb:appendCharacter(44) end
									end
									first = false
									do sb:appendString(self:escapeCellContents(cell)) end
								end
								do n2 = n2 + 1 end
							end
						end
					end
					do sb:appendCharacter(10) end
				end
				do n = n + 1 end
			end
		end
	end
	do return sb:toString() end
end
