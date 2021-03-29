jk = jk or {}

jk.mypacket = jk.mypacket or {}

jk.mypacket.MyPacketParser = {}
jk.mypacket.MyPacketParser.__index = jk.mypacket.MyPacketParser
_vm:set_metatable(jk.mypacket.MyPacketParser, {})

function jk.mypacket.MyPacketParser._create()
	local v = _vm:set_metatable({}, jk.mypacket.MyPacketParser)
	return v
end

function jk.mypacket.MyPacketParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mypacket.MyPacketParser'
	self['_isType.jk.mypacket.MyPacketParser'] = true
	self.buffer = nil
	self.position = 0
end

function jk.mypacket.MyPacketParser:_construct0()
	jk.mypacket.MyPacketParser._init(self)
	return self
end

function jk.mypacket.MyPacketParser:forBuffer(buffer)
	local v = _g.jk.mypacket.MyPacketParser._construct0(_g.jk.mypacket.MyPacketParser._create())
	do v:setBuffer(buffer) end
	do return v end
end

function jk.mypacket.MyPacketParser:isValid(length)
	if not (self.buffer ~= nil) then
		do return false end
	end
	do
		local sz = #self.buffer
		if not (self.position + length <= sz) then
			do return false end
		end
		do return true end
	end
end

function jk.mypacket.MyPacketParser:skipBytes(count)
	self.position = self.position + count
end

function jk.mypacket.MyPacketParser:getInt8()
	if not self:isValid(1) then
		do return 0 end
	end
	do return self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1] end
end

function jk.mypacket.MyPacketParser:getFloat()
	if not self:isValid(4) then
		do return 0.0 end
	end
	do
		local bb = _util:allocate_buffer(4)
		bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[2 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[3 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		do return _g.jk.lang.Buffer:getFloatLE(bb, 0) end
	end
end

function jk.mypacket.MyPacketParser:getDouble()
	if not self:isValid(8) then
		do return 0.0 end
	end
	do
		local bb = _util:allocate_buffer(8)
		bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[2 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[3 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[4 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[5 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[6 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[7 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		do return _g.jk.lang.Buffer:getDoubleLE(bb, 0) end
	end
end

function jk.mypacket.MyPacketParser:getInt16()
	if not self:isValid(2) then
		do return 0 end
	end
	do
		local bb = _util:allocate_buffer(2)
		bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		do return _g.jk.lang.Buffer:getInt16LE(bb, 0) end
	end
end

function jk.mypacket.MyPacketParser:getInt24()
	if not self:isValid(3) then
		do return 0 end
	end
	do
		local bb = _util:allocate_buffer(4)
		bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[2 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[3 + 1] = 0
		do return _g.jk.lang.Buffer:getInt32LE(bb, 0) end
	end
end

function jk.mypacket.MyPacketParser:getInt32()
	if not self:isValid(4) then
		do return 0 end
	end
	do
		local bb = _util:allocate_buffer(4)
		bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[2 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[3 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		do return _g.jk.lang.Buffer:getInt32LE(bb, 0) end
	end
end

function jk.mypacket.MyPacketParser:getInt64()
	if not self:isValid(8) then
		do return 0 end
	end
	do
		local bb = _util:allocate_buffer(8)
		bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[2 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[3 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[4 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[5 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[6 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		bb[7 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
		do return _g.jk.lang.Buffer:getInt64LE(bb, 0) end
	end
end

function jk.mypacket.MyPacketParser:getLengthEncodedInteger()
	if not self:isValid(1) then
		do return 0 end
	end
	do
		local first = self.buffer[self.position + 1]
		if first < 251 then
			do self.position = self.position + 1 end
			do return first end
		end
		if first == 252 then
			if not self:isValid(3) then
				do return 0 end
			end
			do self.position = self.position + 1 end
			do
				local bb = _util:allocate_buffer(2)
				bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				do return _g.jk.lang.Buffer:getInt16LE(bb, 0) end
			end
		end
		if first == 253 then
			if not self:isValid(4) then
				do return 0 end
			end
			do self.position = self.position + 1 end
			do
				local bb = _util:allocate_buffer(4)
				bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[2 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[3 + 1] = 0
				do return _g.jk.lang.Buffer:getInt32LE(bb, 0) end
			end
		end
		if first == 254 then
			if not self:isValid(9) then
				do return 0 end
			end
			do self.position = self.position + 1 end
			do
				local bb = _util:allocate_buffer(8)
				bb[0 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[1 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[2 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[3 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[4 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[5 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[6 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				bb[7 + 1] = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
				do return _g.jk.lang.Buffer:getInt64LE(bb, 0) end
			end
		end
		_io:write_to_stdout("[jk.mypacket.MyPacketParser.getLengthEncodedInteger] (MyPacketParser.sling:166:2): Invalid byte as first byte of length encoded integer." .. "\n")
		do return 0 end
	end
end

function jk.mypacket.MyPacketParser:getNullTerminatedString()
	if not (self.buffer ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local sz = #self.buffer
		while self.position < sz do
			local c = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
			if c < 1 then
				do break end
			end
			do sb:appendCharacter(c) end
		end
		do return sb:toString() end
	end
end

function jk.mypacket.MyPacketParser:getEofTerminatedString()
	if not (self.buffer ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local sz = #self.buffer
		while self.position < sz do
			local c = self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]
			do sb:appendCharacter(c) end
		end
		do return sb:toString() end
	end
end

function jk.mypacket.MyPacketParser:getStaticLengthString(length)
	if not (length > 0) then
		do return nil end
	end
	if not self:isValid(length) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do
			local n = 0
			while n < length do
				do sb:appendCharacter(self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1]) end
				do n = n + 1 end
			end
		end
		do return sb:toString() end
	end
end

function jk.mypacket.MyPacketParser:getLengthEncodedString()
	local length = self:getLengthEncodedInteger()
	if length < 1 then
		do return "" end
	end
	do return self:getStaticLengthString(length) end
end

function jk.mypacket.MyPacketParser:getLengthEncodedBuffer()
	local length = self:getLengthEncodedInteger()
	if length < 1 then
		do return nil end
	end
	do return self:getBuffer(length) end
end

function jk.mypacket.MyPacketParser:getBuffer(length)
	if not self:isValid(length) then
		do return nil end
	end
	do
		local v = _util:allocate_buffer(length)
		do _g.jk.lang.Buffer:copyFrom(v, self.buffer, self.position, 0, length) end
		self.position = self.position + length
		do return v end
	end
end

function jk.mypacket.MyPacketParser:setBuffer(v)
	self.buffer = v
	do return self end
end

function jk.mypacket.MyPacketParser:getPosition()
	do return self.position end
end

function jk.mypacket.MyPacketParser:setPosition(v)
	self.position = v
	do return self end
end

jk.mypacket.MyPacketBuilder = {}
jk.mypacket.MyPacketBuilder.__index = jk.mypacket.MyPacketBuilder
_vm:set_metatable(jk.mypacket.MyPacketBuilder, {})

function jk.mypacket.MyPacketBuilder._create()
	local v = _vm:set_metatable({}, jk.mypacket.MyPacketBuilder)
	return v
end

function jk.mypacket.MyPacketBuilder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mypacket.MyPacketBuilder'
	self['_isType.jk.mypacket.MyPacketBuilder'] = true
	self.buffer = nil
	self.position = 0
end

function jk.mypacket.MyPacketBuilder:_construct0()
	jk.mypacket.MyPacketBuilder._init(self)
	return self
end

function jk.mypacket.MyPacketBuilder:ensureAvailablesize(count)
	local sz = 0
	if self.buffer ~= nil then
		sz = #self.buffer
	end
	if sz < self.position + count then
		local nsz = sz
		while nsz < self.position + count do
			nsz = nsz + 65536
		end
		self.buffer = _g.jk.lang.Buffer:resize(self.buffer, nsz)
	end
end

function jk.mypacket.MyPacketBuilder:appendByte(byte)
	do self:ensureAvailablesize(1) end
	self.buffer[self.position + 1] = _vm:bitwise_and(byte, 255)
	do self.position = self.position + 1 end
end

function jk.mypacket.MyPacketBuilder:appendMultipleBytes(byte, count)
	if not (count > 0) then
		do return end
	end
	do self:ensureAvailablesize(count) end
	do
		local n = 0
		while n < count do
			self.buffer[(function() local v = self.position self.position = self.position + 1 return v end)() + 1] = _vm:bitwise_and(byte, 255)
			do n = n + 1 end
		end
	end
end

function jk.mypacket.MyPacketBuilder:appendBuffer(newdata)
	if not (newdata ~= nil) then
		do return end
	end
	do
		local nds = #newdata
		do self:ensureAvailablesize(nds) end
		do _g.jk.lang.Buffer:copyFrom(self.buffer, newdata, 0, self.position, nds) end
		self.position = self.position + nds
	end
end

function jk.mypacket.MyPacketBuilder:appendInt16(number)
	do self:ensureAvailablesize(2) end
	do
		local bb = _g.jk.lang.Buffer:forInt16LE(number)
		do _g.jk.lang.Buffer:copyFrom(self.buffer, bb, 0, self.position, 2) end
		self.position = self.position + 2
	end
end

function jk.mypacket.MyPacketBuilder:appendInt24(number)
	do self:ensureAvailablesize(3) end
	do
		local bb = _g.jk.lang.Buffer:forInt32LE(number)
		do _g.jk.lang.Buffer:copyFrom(self.buffer, bb, 0, self.position, 3) end
		self.position = self.position + 3
	end
end

function jk.mypacket.MyPacketBuilder:appendInt32(number)
	do self:ensureAvailablesize(4) end
	do
		local bb = _g.jk.lang.Buffer:forInt32LE(number)
		do _g.jk.lang.Buffer:copyFrom(self.buffer, bb, 0, self.position, 4) end
		self.position = self.position + 4
	end
end

function jk.mypacket.MyPacketBuilder:appendInt64(number)
	do self:ensureAvailablesize(8) end
	do
		local bb = _g.jk.lang.Buffer:forInt64LE(number)
		do _g.jk.lang.Buffer:copyFrom(self.buffer, bb, 0, self.position, 8) end
		self.position = self.position + 8
	end
end

function jk.mypacket.MyPacketBuilder:appendDouble(number)
	do self:ensureAvailablesize(8) end
	do
		local bb = _g.jk.lang.Buffer:forDouble64LE(number)
		do _g.jk.lang.Buffer:copyFrom(self.buffer, bb, 0, self.position, 8) end
		self.position = self.position + 8
	end
end

function jk.mypacket.MyPacketBuilder:appendNullTerminatedString(string)
	if not (string ~= nil) then
		do self:appendByte(0) end
		do return end
	end
	do
		local it = _g.jk.lang.String:iterate(string)
		while it ~= nil do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do self:appendByte(0) end
				do break end
			end
			do self:appendByte(_util:convert_to_integer(c)) end
		end
	end
end

function jk.mypacket.MyPacketBuilder:appendFixedLengthString(string, length)
	if not (length > 0) then
		do return end
	end
	do
		local it = _g.jk.lang.String:iterate(string)
		do
			local n = 0
			while n < length do
				local c = it:getNextChar()
				if _g.jk.lang.Character:isEOF(c) then
					do self:appendByte(0) end
				else
					do self:appendByte(_util:convert_to_integer(c)) end
				end
				do n = n + 1 end
			end
		end
	end
end

function jk.mypacket.MyPacketBuilder:appendEofTerminatedString(string)
	if not (string ~= nil) then
		do return end
	end
	do
		local it = _g.jk.lang.String:iterate(string)
		while it ~= nil do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			do self:appendByte(_util:convert_to_integer(c)) end
		end
	end
end

function jk.mypacket.MyPacketBuilder:appendLengthEncodedInteger(value)
	if value < 251 then
		do self:appendByte(value) end
	elseif value < 65536 then
		do self:appendByte(252) end
		do self:appendInt16(value) end
	elseif value < 16777216 then
		do self:appendByte(253) end
		do self:appendInt24(value) end
	else
		do self:appendByte(254) end
		do self:appendInt64(value) end
	end
end

function jk.mypacket.MyPacketBuilder:appendLengthEncodedString(value)
	if not (value ~= nil) then
		do self:appendLengthEncodedInteger(0) end
		do return end
	end
	do
		local bb = _g.jk.lang.String:toUTF8Buffer(value)
		if not (bb ~= nil) then
			do self:appendLengthEncodedInteger(0) end
			do return end
		end
		do
			local sz = #bb
			do self:appendLengthEncodedInteger(sz) end
			if sz > 0 then
				do self:appendBuffer(bb) end
			end
		end
	end
end

function jk.mypacket.MyPacketBuilder:appendLengthEncodedBuffer(value)
	if not (value ~= nil) then
		do self:appendLengthEncodedInteger(0) end
		do return end
	end
	do
		local sz = #value
		do self:appendLengthEncodedInteger(sz) end
		if sz > 0 then
			do self:appendBuffer(value) end
		end
	end
end

function jk.mypacket.MyPacketBuilder:finalize()
	if not (self.buffer ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Buffer:getSubBuffer(self.buffer, 0, self.position, false) end
end
