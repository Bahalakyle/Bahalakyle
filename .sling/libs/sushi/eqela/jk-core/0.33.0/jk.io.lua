jk = jk or {}

jk.io = jk.io or {}

jk.io.Reader = {}

jk.io.LineReader = {}

jk.io.SeekableReader = {}

jk.io.CharacterIteratorForReader = _g.jk.lang.CharacterDecoder._create()
jk.io.CharacterIteratorForReader.__index = jk.io.CharacterIteratorForReader
_vm:set_metatable(jk.io.CharacterIteratorForReader, {
	__index = _g.jk.lang.CharacterDecoder
})

function jk.io.CharacterIteratorForReader._create()
	local v = _vm:set_metatable({}, jk.io.CharacterIteratorForReader)
	return v
end

function jk.io.CharacterIteratorForReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.CharacterIteratorForReader'
	self['_isType.jk.io.CharacterIteratorForReader'] = true
	self.reader = nil
	self.buffer = nil
	self.bufferStart = -1
	self.bufferSize = 0
	self.bufferDataSize = 0
	self.currentPos = -1
	self.readPos = 0
end

function jk.io.CharacterIteratorForReader:_construct0()
	jk.io.CharacterIteratorForReader._init(self)
	do _g.jk.lang.CharacterDecoder._construct0(self) end
	return self
end

function jk.io.CharacterIteratorForReader:forReader(reader)
	do return _g.jk.io.CharacterIteratorForReader._construct1(_g.jk.io.CharacterIteratorForReader._create(), reader) end
end

function jk.io.CharacterIteratorForReader:forReaderWithBufferSize(reader, bufferSize)
	do return _g.jk.io.CharacterIteratorForReader._construct2(_g.jk.io.CharacterIteratorForReader._create(), reader, bufferSize) end
end

function jk.io.CharacterIteratorForReader:_construct1(reader)
	jk.io.CharacterIteratorForReader._init(self)
	do _g.jk.lang.CharacterDecoder._construct0(self) end
	self.reader = reader
	self.buffer = _util:allocate_buffer(1024)
	self.bufferSize = 1024
	return self
end

function jk.io.CharacterIteratorForReader:_construct2(reader, bufferSize)
	jk.io.CharacterIteratorForReader._init(self)
	do _g.jk.lang.CharacterDecoder._construct0(self) end
	self.reader = reader
	self.buffer = _util:allocate_buffer(bufferSize)
	self.bufferSize = bufferSize
	return self
end

function jk.io.CharacterIteratorForReader:makeDataAvailable(n)
	if n >= self.bufferStart and n < self.bufferStart + self.bufferDataSize then
		do return true end
	end
	if (_vm:to_table_with_key(self.reader, '_isType.jk.io.SeekableReader') ~= nil) then
		local rs = self.reader
		local block = _util:convert_to_integer(n / self.bufferSize)
		local blockPos = block * self.bufferSize
		if self.readPos ~= blockPos then
			if not rs:setCurrentPosition(blockPos) then
				do return false end
			end
			self.readPos = blockPos
		end
	end
	self.bufferDataSize = self.reader:read(self.buffer)
	self.bufferStart = self.readPos
	self.readPos = self.readPos + self.bufferDataSize
	if n >= self.bufferStart and n < self.bufferStart + self.bufferDataSize then
		do return true end
	end
	do return false end
end

function jk.io.CharacterIteratorForReader:moveToPreviousByte()
	if not self:makeDataAvailable(self.currentPos - 1) then
		do return false end
	end
	do self.currentPos = self.currentPos - 1 end
	do return true end
end

function jk.io.CharacterIteratorForReader:moveToNextByte()
	if not self:makeDataAvailable(self.currentPos + 1) then
		do return false end
	end
	do self.currentPos = self.currentPos + 1 end
	do return true end
end

function jk.io.CharacterIteratorForReader:getCurrentByte()
	do return _g.jk.lang.Buffer:getByte(self.buffer, self.currentPos - self.bufferStart) end
end

function jk.io.CharacterIteratorForReader:getCurrentPosition()
	do return self.currentPos end
end

function jk.io.CharacterIteratorForReader:setCurrentPosition(position)
	self.currentPos = position
end

jk.io.Writer = {}

jk.io.PrintReader = {}
jk.io.PrintReader.__index = jk.io.PrintReader
_vm:set_metatable(jk.io.PrintReader, {})

function jk.io.PrintReader._create()
	local v = _vm:set_metatable({}, jk.io.PrintReader)
	return v
end

function jk.io.PrintReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.PrintReader'
	self['_isType.jk.io.PrintReader'] = true
	self['_isType.jk.io.Reader'] = true
	self['_isType.jk.io.LineReader'] = true
	self['_isType.jk.lang.Closable'] = true
	self.reader = nil
	self.iterator = nil
end

function jk.io.PrintReader:_construct0()
	jk.io.PrintReader._init(self)
	return self
end

function jk.io.PrintReader:forReader(reader)
	if not (reader ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(reader, '_isType.jk.io.PrintReader') ~= nil) then
		do return reader end
	end
	do
		local v = _g.jk.io.PrintReader._construct0(_g.jk.io.PrintReader._create())
		do v:setReader(reader, nil) end
		do return v end
	end
end

function jk.io.PrintReader:forReaderAndEncoding(reader, encoding)
	if not (reader ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(reader, '_isType.jk.io.PrintReader') ~= nil) then
		do return reader end
	end
	do
		local v = _g.jk.io.PrintReader._construct0(_g.jk.io.PrintReader._create())
		do v:setReader(reader, encoding) end
		do return v end
	end
end

function jk.io.PrintReader:setReader(reader, encoding)
	self.reader = reader
	if reader == nil then
		self.iterator = nil
	else
		self.iterator = _g.jk.io.CharacterIteratorForReader:forReader(reader)
		if encoding ~= nil then
			do self.iterator:setEncoding(encoding) end
		end
	end
end

function jk.io.PrintReader:readLine()
	if not (self.iterator ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		while true do
			local c = self.iterator:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				if sb:count() < 1 then
					do return nil end
				end
				do break end
			end
			if c == 13 then
				goto _continue1
			end
			if c == 10 then
				do break end
			end
			do sb:appendCharacter(c) end
			::_continue1::
		end
		if sb:count() < 1 then
			do return "" end
		end
		do return sb:toString() end
	end
end

function jk.io.PrintReader:readAll()
	if not (self.iterator ~= nil) then
		do return nil end
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
		if sb:count() < 1 then
			do return nil end
		end
		do return sb:toString() end
	end
end

function jk.io.PrintReader:hasEnded()
	if not (self.iterator ~= nil) then
		do return true end
	end
	do return self.iterator:hasEnded() end
end

function jk.io.PrintReader:read(buffer)
	if self.reader == nil then
		do return -1 end
	end
	do return self.reader:read(buffer) end
end

function jk.io.PrintReader:close()
	local rc = _vm:to_table_with_key(self.reader, '_isType.jk.lang.Closable')
	if rc ~= nil then
		do rc:close() end
	end
end

jk.io.PrintWriter = {}

jk.io.FileDescriptor = {}

jk.io.StaticFileDescriptor = {}
jk.io.StaticFileDescriptor.__index = jk.io.StaticFileDescriptor
_vm:set_metatable(jk.io.StaticFileDescriptor, {})

function jk.io.StaticFileDescriptor._create()
	local v = _vm:set_metatable({}, jk.io.StaticFileDescriptor)
	return v
end

function jk.io.StaticFileDescriptor:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.StaticFileDescriptor'
	self['_isType.jk.io.StaticFileDescriptor'] = true
	self['_isType.jk.io.FileDescriptor'] = true
	self.fileDescriptor = 0
end

function jk.io.StaticFileDescriptor:_construct0()
	jk.io.StaticFileDescriptor._init(self)
	return self
end

function jk.io.StaticFileDescriptor:forFileDescriptor(fd)
	do return _g.jk.io.StaticFileDescriptor._construct0(_g.jk.io.StaticFileDescriptor._create()):setFileDescriptor(fd) end
end

function jk.io.StaticFileDescriptor:getFileDescriptor()
	do return self.fileDescriptor end
end

function jk.io.StaticFileDescriptor:setFileDescriptor(v)
	self.fileDescriptor = v
	do return self end
end

jk.io.FlushableWriter = {}

jk.io.FileDescriptorReader = {}
jk.io.FileDescriptorReader.__index = jk.io.FileDescriptorReader
_vm:set_metatable(jk.io.FileDescriptorReader, {})

function jk.io.FileDescriptorReader._create()
	local v = _vm:set_metatable({}, jk.io.FileDescriptorReader)
	return v
end

function jk.io.FileDescriptorReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.FileDescriptorReader'
	self['_isType.jk.io.FileDescriptorReader'] = true
	self['_isType.jk.io.Reader'] = true
	self['_isType.jk.lang.Closable'] = true
	self['_isType.jk.io.FileDescriptor'] = true
	self.fd = -1
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.io.FileDescriptorReader:_construct0()
	jk.io.FileDescriptorReader._init(self)
	return self
end

function jk.io.FileDescriptorReader:forFileDescriptor(fd)
	local v = _g.jk.io.FileDescriptorReader._construct0(_g.jk.io.FileDescriptorReader._create())
	do v:setFd(fd) end
	do return v end
end

function jk.io.FileDescriptorReader:_destruct()
	do self:close() end
end

function jk.io.FileDescriptorReader:getFileDescriptor()
	do return self.fd end
end

function jk.io.FileDescriptorReader:read(buffer)
	local v = -1
	local handle = self.fd
	if handle >= 0 then
		do v = _io:read_from_handle(handle, buffer) end
	end
	do return v end
end

function jk.io.FileDescriptorReader:close()
	local handle = self.fd
	if handle >= 0 then
		do _io:close_handle(handle) end
		self.fd = -1
	end
end

function jk.io.FileDescriptorReader:getFd()
	do return self.fd end
end

function jk.io.FileDescriptorReader:setFd(v)
	self.fd = v
	do return self end
end

jk.io.SizedReader = {}

jk.io.DataStream = {}

jk.io.SeekableWriter = {}

jk.io.BinaryReader = {}
jk.io.BinaryReader.__index = jk.io.BinaryReader
_vm:set_metatable(jk.io.BinaryReader, {})

function jk.io.BinaryReader._create()
	local v = _vm:set_metatable({}, jk.io.BinaryReader)
	return v
end

function jk.io.BinaryReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.BinaryReader'
	self['_isType.jk.io.BinaryReader'] = true
	self['_isType.jk.lang.Closable'] = true
	self.reader = nil
	self.buffer1 = nil
	self.buffer2 = nil
	self.buffer4 = nil
end

function jk.io.BinaryReader:_construct0()
	jk.io.BinaryReader._init(self)
	return self
end

function jk.io.BinaryReader:forReader(reader)
	local v = _g.jk.io.BinaryReader._construct0(_g.jk.io.BinaryReader._create())
	do v:setReader(reader) end
	do return v end
end

function jk.io.BinaryReader:isOK()
	if not (self.reader ~= nil) then
		do return false end
	end
	do return true end
end

function jk.io.BinaryReader:close()
	local rc = _vm:to_table_with_key(self.reader, '_isType.jk.lang.Closable')
	if rc ~= nil then
		do rc:close() end
	end
	self.reader = nil
end

function jk.io.BinaryReader:seek(position)
	local sr = _vm:to_table_with_key(self.reader, '_isType.jk.io.SeekableReader')
	if not (sr ~= nil) then
		do return false end
	end
	do return sr:setCurrentPosition(position) end
end

function jk.io.BinaryReader:read1()
	if not (self.reader ~= nil) then
		do return nil end
	end
	if not (self.buffer1 ~= nil) then
		self.buffer1 = _util:allocate_buffer(1)
	end
	do
		local r = self.reader:read(self.buffer1)
		if not (r == 1) then
			do self:close() end
			do return nil end
		end
		do return self.buffer1 end
	end
end

function jk.io.BinaryReader:read2()
	if not (self.reader ~= nil) then
		do return nil end
	end
	if not (self.buffer2 ~= nil) then
		self.buffer2 = _util:allocate_buffer(2)
	end
	do
		local r = self.reader:read(self.buffer2)
		if not (r == 2) then
			do self:close() end
			do return nil end
		end
		do return self.buffer2 end
	end
end

function jk.io.BinaryReader:read4()
	if not (self.reader ~= nil) then
		do return nil end
	end
	if not (self.buffer4 ~= nil) then
		self.buffer4 = _util:allocate_buffer(4)
	end
	do
		local r = self.reader:read(self.buffer4)
		if not (r == 4) then
			do self:close() end
			do return nil end
		end
		do return self.buffer4 end
	end
end

function jk.io.BinaryReader:readBuffer(size)
	if not (self.reader ~= nil) then
		do return nil end
	end
	if not (size > 0) then
		do return nil end
	end
	do
		local b = _util:allocate_buffer(size)
		local r = self.reader:read(b)
		if not (r == size) then
			do self:close() end
			do return nil end
		end
		do return b end
	end
end

function jk.io.BinaryReader:readInt8()
	local b = self:read1()
	if not (b ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.Buffer:getInt8(b, 0) end
end

function jk.io.BinaryReader:readInt16LE()
	local b = self:read2()
	if not (b ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.Buffer:getInt16LE(b, 0) end
end

function jk.io.BinaryReader:readInt16BE()
	local b = self:read2()
	if not (b ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.Buffer:getInt16BE(b, 0) end
end

function jk.io.BinaryReader:readInt32LE()
	local b = self:read4()
	if not (b ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.Buffer:getInt32LE(b, 0) end
end

function jk.io.BinaryReader:readInt32BE()
	local b = self:read4()
	if not (b ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.Buffer:getInt32BE(b, 0) end
end

function jk.io.BinaryReader:getReader()
	do return self.reader end
end

function jk.io.BinaryReader:setReader(v)
	self.reader = v
	do return self end
end

jk.io.ByteReader = {}

jk.io.FileDescriptorWriter = {}
jk.io.FileDescriptorWriter.__index = jk.io.FileDescriptorWriter
_vm:set_metatable(jk.io.FileDescriptorWriter, {})

function jk.io.FileDescriptorWriter._create()
	local v = _vm:set_metatable({}, jk.io.FileDescriptorWriter)
	return v
end

function jk.io.FileDescriptorWriter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.FileDescriptorWriter'
	self['_isType.jk.io.FileDescriptorWriter'] = true
	self['_isType.jk.io.Writer'] = true
	self['_isType.jk.lang.Closable'] = true
	self['_isType.jk.io.FileDescriptor'] = true
	self.fd = -1
	self.owned = true
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.io.FileDescriptorWriter:_construct0()
	jk.io.FileDescriptorWriter._init(self)
	return self
end

function jk.io.FileDescriptorWriter:forFileDescriptor(fd)
	local v = _g.jk.io.FileDescriptorWriter._construct0(_g.jk.io.FileDescriptorWriter._create())
	do v:setFd(fd) end
	do return v end
end

function jk.io.FileDescriptorWriter:forUnownedFileDescriptor(fd)
	local v = _g.jk.io.FileDescriptorWriter._construct0(_g.jk.io.FileDescriptorWriter._create())
	do v:setFd(fd) end
	do v:setOwned(false) end
	do return v end
end

function jk.io.FileDescriptorWriter:_destruct()
	do self:close() end
end

function jk.io.FileDescriptorWriter:getFileDescriptor()
	do return self.fd end
end

function jk.io.FileDescriptorWriter:write(buf, size)
	local v = -1
	local handle = self.fd
	if handle >= 0 then
		do v = _io:write_to_handle(handle, buf, size) end
	end
	do return v end
end

function jk.io.FileDescriptorWriter:close()
	if not self.owned then
		do return end
	end
	do
		local handle = self.fd
		if handle >= 0 then
			do _io:close_handle(handle) end
			self.fd = -1
		end
	end
end

function jk.io.FileDescriptorWriter:getFd()
	do return self.fd end
end

function jk.io.FileDescriptorWriter:setFd(v)
	self.fd = v
	do return self end
end

function jk.io.FileDescriptorWriter:getOwned()
	do return self.owned end
end

function jk.io.FileDescriptorWriter:setOwned(v)
	self.owned = v
	do return self end
end

jk.io.StringLineReader = {}
jk.io.StringLineReader.__index = jk.io.StringLineReader
_vm:set_metatable(jk.io.StringLineReader, {})

function jk.io.StringLineReader._create()
	local v = _vm:set_metatable({}, jk.io.StringLineReader)
	return v
end

function jk.io.StringLineReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.StringLineReader'
	self['_isType.jk.io.StringLineReader'] = true
	self['_isType.jk.io.LineReader'] = true
	self.iterator = nil
end

function jk.io.StringLineReader:_construct0()
	jk.io.StringLineReader._init(self)
	return self
end

function jk.io.StringLineReader:_construct1(str)
	jk.io.StringLineReader._init(self)
	self.iterator = _g.jk.lang.CharacterIteratorForString:forString(str)
	return self
end

function jk.io.StringLineReader:readLine()
	if not (self.iterator ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		while true do
			local c = self.iterator:getNextChar()
			if c < 1 then
				if sb:count() < 1 then
					do return nil end
				end
				do break end
			end
			if c == 13 then
				goto _continue2
			end
			if c == 10 then
				do break end
			end
			do sb:appendCharacter(c) end
			::_continue2::
		end
		if sb:count() < 1 then
			do return "" end
		end
		do return sb:toString() end
	end
end

jk.io.PrintWriterWrapper = {}
jk.io.PrintWriterWrapper.__index = jk.io.PrintWriterWrapper
_vm:set_metatable(jk.io.PrintWriterWrapper, {})

function jk.io.PrintWriterWrapper._create()
	local v = _vm:set_metatable({}, jk.io.PrintWriterWrapper)
	return v
end

function jk.io.PrintWriterWrapper:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.PrintWriterWrapper'
	self['_isType.jk.io.PrintWriterWrapper'] = true
	self['_isType.jk.io.Writer'] = true
	self['_isType.jk.io.PrintWriter'] = true
	self['_isType.jk.lang.Closable'] = true
	self['_isType.jk.io.FlushableWriter'] = true
	self.writer = nil
end

function jk.io.PrintWriterWrapper:_construct0()
	jk.io.PrintWriterWrapper._init(self)
	return self
end

function jk.io.PrintWriterWrapper:forWriter(writer)
	if writer == nil then
		do return nil end
	end
	if (_vm:to_table_with_key(writer, '_isType.jk.io.PrintWriter') ~= nil) then
		do return writer end
	end
	do
		local v = _g.jk.io.PrintWriterWrapper._construct0(_g.jk.io.PrintWriterWrapper._create())
		do v:setWriter(writer) end
		do return v end
	end
end

function jk.io.PrintWriterWrapper:closeWriter(writer)
	local wc = _vm:to_table_with_key(writer, '_isType.jk.lang.Closable')
	if not (wc ~= nil) then
		do return nil end
	end
	do wc:close() end
	do return nil end
end

function jk.io.PrintWriterWrapper:print(str)
	if str == nil then
		do return false end
	end
	do
		local buffer = _g.jk.lang.String:toUTF8Buffer(str)
		if buffer == nil then
			do return false end
		end
		do
			local sz = _g.jk.lang.Buffer:getSize(buffer)
			if self.writer:write(buffer, -1) ~= sz then
				do return false end
			end
			do return true end
		end
	end
end

function jk.io.PrintWriterWrapper:println(str)
	do return self:print(_g.jk.lang.String:safeString(str) .. "\n") end
end

function jk.io.PrintWriterWrapper:writeWholeBuffer(buf)
	do return self:write(buf, -1) end
end

function jk.io.PrintWriterWrapper:write(buf, size)
	if self.writer == nil then
		do return -1 end
	end
	do return self.writer:write(buf, size) end
end

function jk.io.PrintWriterWrapper:close()
	local cw = _vm:to_table_with_key(self.writer, '_isType.jk.lang.Closable')
	if cw ~= nil then
		do cw:close() end
	end
end

function jk.io.PrintWriterWrapper:flush()
	local cw = _vm:to_table_with_key(self.writer, '_isType.jk.io.FlushableWriter')
	if cw ~= nil then
		do cw:flush() end
	end
end

function jk.io.PrintWriterWrapper:getWriter()
	do return self.writer end
end

function jk.io.PrintWriterWrapper:setWriter(v)
	self.writer = v
	do return self end
end

jk.io.DataStreamSource = {}

jk.io.BufferWriter = {}
jk.io.BufferWriter.__index = jk.io.BufferWriter
_vm:set_metatable(jk.io.BufferWriter, {})

function jk.io.BufferWriter._create()
	local v = _vm:set_metatable({}, jk.io.BufferWriter)
	return v
end

function jk.io.BufferWriter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.BufferWriter'
	self['_isType.jk.io.BufferWriter'] = true
	self['_isType.jk.io.Writer'] = true
	self.buffer = nil
	self.pos = 0
end

function jk.io.BufferWriter:_construct0()
	jk.io.BufferWriter._init(self)
	return self
end

function jk.io.BufferWriter:forBuffer(buf)
	local v = _g.jk.io.BufferWriter._construct0(_g.jk.io.BufferWriter._create())
	v.buffer = buf
	do return v end
end

function jk.io.BufferWriter:getBufferSize()
	do return _g.jk.lang.Buffer:getSize(self.buffer) end
end

function jk.io.BufferWriter:getBufferPos()
	do return 0 end
end

function jk.io.BufferWriter:getBuffer()
	do return self.buffer end
end

function jk.io.BufferWriter:write(src, ssize)
	if src == nil then
		do return 0 end
	end
	do
		local size = ssize
		if size < 0 then
			size = _g.jk.lang.Buffer:getSize(src)
		end
		if size < 1 then
			do return 0 end
		end
		if self.buffer == nil then
			self.buffer = _util:allocate_buffer(size)
			if self.buffer == nil then
				do return 0 end
			end
			do _g.jk.lang.Buffer:copyFrom(self.buffer, src, 0, 0, size) end
			self.pos = size
		elseif self.pos + size <= _g.jk.lang.Buffer:getSize(self.buffer) then
			do _g.jk.lang.Buffer:copyFrom(self.buffer, src, 0, self.pos, size) end
			self.pos = self.pos + size
		else
			local nb = _g.jk.lang.Buffer:resize(self.buffer, self.pos + size)
			if nb == nil then
				do return 0 end
			end
			self.buffer = nb
			do _g.jk.lang.Buffer:copyFrom(self.buffer, src, 0, self.pos, size) end
			self.pos = self.pos + size
		end
		do return size end
	end
end

jk.io.BufferReader = {}
jk.io.BufferReader.__index = jk.io.BufferReader
_vm:set_metatable(jk.io.BufferReader, {})

function jk.io.BufferReader._create()
	local v = _vm:set_metatable({}, jk.io.BufferReader)
	return v
end

function jk.io.BufferReader:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.io.BufferReader'
	self['_isType.jk.io.BufferReader'] = true
	self['_isType.jk.io.Reader'] = true
	self['_isType.jk.io.SizedReader'] = true
	self['_isType.jk.io.SeekableReader'] = true
	self.buffer = nil
	self.pos = 0
end

function jk.io.BufferReader:_construct0()
	jk.io.BufferReader._init(self)
	return self
end

function jk.io.BufferReader:readFrom(reader)
	if not (reader ~= nil) then
		do return nil end
	end
	do
		local v = nil
		local tmp = _util:allocate_buffer(1024)
		while true do
			local r = reader:read(tmp)
			if r < 1 then
				do break end
			end
			v = _g.jk.lang.Buffer:append(v, tmp, r)
			if v == nil then
				do break end
			end
		end
		do return v end
	end
end

function jk.io.BufferReader:forBuffer(buf)
	do return _g.jk.io.BufferReader._construct0(_g.jk.io.BufferReader._create()):setBuffer(buf) end
end

function jk.io.BufferReader:setCurrentPosition(n)
	self.pos = n
	do return true end
end

function jk.io.BufferReader:getCurrentPosition()
	do return self.pos end
end

function jk.io.BufferReader:getBuffer()
	do return self.buffer end
end

function jk.io.BufferReader:setBuffer(buf)
	self.buffer = buf
	self.pos = 0
	do return self end
end

function jk.io.BufferReader:rewind()
	self.pos = 0
end

function jk.io.BufferReader:getSize()
	if self.buffer == nil then
		do return 0 end
	end
	do return #self.buffer end
end

function jk.io.BufferReader:read(buf)
	if buf == nil or self.buffer == nil then
		do return 0 end
	end
	do
		local buffersz = #self.buffer
		if self.pos >= buffersz then
			do return 0 end
		end
		do
			local size = #buf
			if size > buffersz - self.pos then
				size = buffersz - self.pos
			end
			do _g.jk.lang.Buffer:copyFrom(buf, self.buffer, self.pos, 0, size) end
			self.pos = self.pos + size
			do return size end
		end
	end
end

function jk.io.BufferReader:getPos()
	do return self.pos end
end

function jk.io.BufferReader:setPos(v)
	self.pos = v
	do return self end
end
