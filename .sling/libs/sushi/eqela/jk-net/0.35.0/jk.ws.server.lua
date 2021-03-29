jk = jk or {}

jk.ws = jk.ws or {}

jk.ws.server = jk.ws.server or {}

jk.ws.server.WSStatusCode = {}
jk.ws.server.WSStatusCode.__index = jk.ws.server.WSStatusCode
_vm:set_metatable(jk.ws.server.WSStatusCode, {})

jk.ws.server.WSStatusCode.CLOSE_NORMAL = 1000
jk.ws.server.WSStatusCode.CLOSE_GOING_AWAY = 1001
jk.ws.server.WSStatusCode.CLOSE_PROTOCOL_ERROR = 1002
jk.ws.server.WSStatusCode.CLOSE_UNSUPPORTED = 1003
jk.ws.server.WSStatusCode.CLOSE_NO_STATUS = 1005
jk.ws.server.WSStatusCode.CLOSE_ABNORMAL = 1006
jk.ws.server.WSStatusCode.UNSUPPORTED_DATA = 1007
jk.ws.server.WSStatusCode.POLICY_VIOLATION = 1008
jk.ws.server.WSStatusCode.CLOSE_TOO_LARGE = 1009
jk.ws.server.WSStatusCode.MISSING_EXTENSION = 1010
jk.ws.server.WSStatusCode.INTERNAL_ERROR = 1011
jk.ws.server.WSStatusCode.SERVICE_RESTART = 1012
jk.ws.server.WSStatusCode.TRY_AGAIN_LATER = 1013
jk.ws.server.WSStatusCode.TLS_HANDSHAKE = 1015

function jk.ws.server.WSStatusCode._create()
	local v = _vm:set_metatable({}, jk.ws.server.WSStatusCode)
	return v
end

function jk.ws.server.WSStatusCode:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.server.WSStatusCode'
	self['_isType.jk.ws.server.WSStatusCode'] = true
end

function jk.ws.server.WSStatusCode:_construct0()
	jk.ws.server.WSStatusCode._init(self)
	return self
end

jk.ws.server.WSServerConnection = _g.jk.server.NetworkConnection._create()
jk.ws.server.WSServerConnection.__index = jk.ws.server.WSServerConnection
_vm:set_metatable(jk.ws.server.WSServerConnection, {
	__index = _g.jk.server.NetworkConnection
})

function jk.ws.server.WSServerConnection._create()
	local v = _vm:set_metatable({}, jk.ws.server.WSServerConnection)
	return v
end

function jk.ws.server.WSServerConnection:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.server.WSServerConnection'
	self['_isType.jk.ws.server.WSServerConnection'] = true
	self.connectionHandler = nil
	self.pingInterval = 30
	self.parser = nil
	self.isWebSocketConnectionOpen = false
	self.webSocketGuid = nil
	self.leftOverBuffer = nil
	self.frameNo = 1
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

jk.ws.server.WSServerConnection.ParserState = {}
jk.ws.server.WSServerConnection.ParserState.__index = jk.ws.server.WSServerConnection.ParserState
_vm:set_metatable(jk.ws.server.WSServerConnection.ParserState, {})

function jk.ws.server.WSServerConnection.ParserState._create()
	local v = _vm:set_metatable({}, jk.ws.server.WSServerConnection.ParserState)
	return v
end

function jk.ws.server.WSServerConnection.ParserState:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.server.WSServerConnection.ParserState'
	self['_isType.jk.ws.server.WSServerConnection.ParserState'] = true
	self.method = nil
	self.uri = nil
	self.version = nil
	self.key = nil
	self.headers = nil
	self.headersDone = false
	self.bodyDone = false
	self.hdr = nil
	self.contentLength = 0
	self.bodyIsChunked = false
	self.dataCounter = 0
	self.bodyStream = nil
	self.savedBodyChunk = nil
	self.bodyBuffer = nil
end

function jk.ws.server.WSServerConnection.ParserState:_construct0()
	jk.ws.server.WSServerConnection.ParserState._init(self)
	return self
end

function jk.ws.server.WSServerConnection:_construct0()
	jk.ws.server.WSServerConnection._init(self)
	do _g.jk.server.NetworkConnection._construct0(self) end
	self.webSocketGuid = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"
	self.parser = _g.jk.ws.server.WSServerConnection.ParserState._construct0(_g.jk.ws.server.WSServerConnection.ParserState._create())
	return self
end

function jk.ws.server.WSServerConnection:_destruct()
	self.leftOverBuffer = nil
	self.webSocketGuid = nil
	self.parser.method = nil
	self.parser.uri = nil
	self.parser.version = nil
	self.parser.key = nil
	self.parser.headers = nil
	self.parser.headersDone = false
	if self.parser.bodyStream ~= nil then
		do self.parser.bodyStream:onDataStreamAbort() end
	end
	self.parser.bodyStream = nil
	self.parser.bodyDone = false
	self.parser.hdr = nil
	self.parser.contentLength = 0
	self.parser.bodyIsChunked = false
	self.parser.dataCounter = 0
	self.parser = nil
end

function jk.ws.server.WSServerConnection:onOpened()
	do self.connectionHandler:onOpened() end
end

function jk.ws.server.WSServerConnection:onClosed()
	do self.connectionHandler:onClosed() end
end

function jk.ws.server.WSServerConnection:onError(message)
	do self:logError(message) end
end

function jk.ws.server.WSServerConnection:onHTTPHeaderData(inputBuffer, offset, sz)
	if not (inputBuffer ~= nil) then
		do return false end
	end
	do
		local p = 0
		while p < sz do
			local c = _g.jk.lang.Buffer:getByte(inputBuffer, p + offset)
			do p = p + 1 end
			if c == 13 then
				goto _continue1
			end
			if self.parser.method == nil then
				if c == 10 then
					goto _continue1
				end
				if c == 32 then
					if self.parser.hdr ~= nil then
						self.parser.method = self.parser.hdr:toString()
						self.parser.hdr = nil
					end
					goto _continue1
				end
			elseif self.parser.uri == nil then
				if c == 32 then
					if self.parser.hdr ~= nil then
						self.parser.uri = self.parser.hdr:toString()
						self.parser.hdr = nil
					end
					goto _continue1
				elseif c == 10 then
					if self.parser.hdr ~= nil then
						self.parser.uri = self.parser.hdr:toString()
						self.parser.hdr = nil
					end
					self.parser.version = "HTTP/0.9"
					self.parser.headersDone = true
					if p < sz then
						do return false end
					end
					do return self:onOpenHandshake() end
				end
			elseif self.parser.version == nil then
				if c == 10 then
					if self.parser.hdr ~= nil then
						self.parser.version = self.parser.hdr:toString()
						self.parser.hdr = nil
					end
					goto _continue1
				end
			elseif self.parser.key == nil then
				if c == 58 then
					if self.parser.hdr ~= nil then
						self.parser.key = self.parser.hdr:toString()
						self.parser.hdr = nil
					end
					goto _continue1
				elseif c == 10 then
					if self.parser.hdr ~= nil then
						do return false end
					end
					self.parser.headersDone = true
					if p < sz then
						do return false end
					end
					do return self:onOpenHandshake() end
				end
				if c >= 65 and c <= 90 then
					c = 97 + c - 65
				end
			elseif c == 32 and self.parser.hdr == nil then
				goto _continue1
			elseif c == 10 then
				local value = nil
				if self.parser.hdr ~= nil then
					value = self.parser.hdr:toString()
					self.parser.hdr = nil
				end
				if self.parser.headers == nil then
					self.parser.headers = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
				end
				do self.parser.headers:add(self.parser.key, value) end
				if _g.jk.lang.String:equalsIgnoreCase(self.parser.key, "content-length") and not (value == nil) then
					self.parser.contentLength = _g.jk.lang.String:toInteger(value)
				elseif _g.jk.lang.String:equalsIgnoreCase(self.parser.key, "transfer-encoding") and not (value == nil) and _g.jk.lang.String:contains(value, "chunked") then
					self.parser.bodyIsChunked = true
				end
				self.parser.key = nil
				goto _continue1
			end
			if self.parser.hdr == nil then
				self.parser.hdr = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			end
			do self.parser.hdr:appendCharacter(c) end
			if self.parser.hdr:count() > 32 * 1024 then
				do return false end
			end
			::_continue1::
		end
		do return false end
	end
end

function jk.ws.server.WSServerConnection:onHTTPError()
	local data = _g.jk.lang.String:toUTF8Buffer("HTTP/1.1 400 Bad Request\r\nConnection: close\r\n\r\n")
	do self:sendData(data, #data) end
	do self:close() end
end

function jk.ws.server.WSServerConnection:onWebsocketError()
	do self:close() end
end

function jk.ws.server.WSServerConnection:onDataReceived(data, size)
	if self.isWebSocketConnectionOpen == false then
		if self:onHTTPHeaderData(data, 0, size) == false then
			do self:onHTTPError() end
		end
		do return end
	end
	if not self:processData(data, size) then
		do self:onWebsocketError() end
	end
end

function jk.ws.server.WSServerConnection:onOpenHandshake()
	if not (self.parser ~= nil) then
		do return false end
	end
	if not (self.parser.headers ~= nil) then
		do return false end
	end
	do
		local it = self.parser.headers:iterate()
		if not (it ~= nil) then
			do return false end
		end
		do
			local headers = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
			while true do
				local kvp = it:next()
				if kvp == nil then
					do break end
				end
				do headers:setObject(kvp.key, kvp.value) end
			end
			do
				local key = headers:getString("sec-websocket-key", nil)
				local shaEncoder = _g.jk.sha.SHAEncoder:create()
				if not (shaEncoder ~= nil) then
					do return false end
				end
				do
					local accept = _g.jk.base64.Base64Encoder:encode(shaEncoder:encodeAsBuffer(_g.jk.lang.String:toUTF8Buffer(_g.jk.lang.String:safeString(key) .. _g.jk.lang.String:safeString(self.webSocketGuid)), _g.jk.sha.SHAEncoder.SHA1))
					local data = _g.jk.lang.String:toUTF8Buffer("HTTP/1.1 101 Switching Protocols\r\nUpgrade: websocket\r\nConnection: Upgrade\r\nSec-WebSocket-Accept: " .. _g.jk.lang.String:safeString(accept) .. "\r\n\r\n")
					do self:sendData(data, #data) end
					self.isWebSocketConnectionOpen = true
					do return true end
				end
			end
		end
	end
end

function jk.ws.server.WSServerConnection:processData(data, size)
	if data == nil or size < 1 then
		do return false end
	end
	do
		local nbuffer = nil
		local nsize = 0
		if self.leftOverBuffer ~= nil then
			local losize = #self.leftOverBuffer
			nsize = losize + size
			nbuffer = _g.jk.lang.Buffer:allocate(nsize)
			do _g.jk.lang.Buffer:copyFrom(nbuffer, self.leftOverBuffer, 0, 0, losize) end
			do _g.jk.lang.Buffer:copyFrom(nbuffer, data, 0, losize, size) end
			self.leftOverBuffer = nil
		else
			nbuffer = data
			nsize = size
		end
		do
			local p = 0
			local fin = 0
			local rsv1 = 0
			local rsv2 = 0
			local rsv3 = 0
			local opcode = 0
			local mask = 0
			local payloadLength = 0
			local lastMaskingBufferIndex = 0
			local mi = 0
			local maskingBuffer = nil
			local payloadBuffer = nil
			while p < nsize do
				local b = _g.jk.lang.Buffer:getByte(nbuffer, p)
				if p == 0 then
					if _vm:bitwise_and(b, 128) ~= 0 then
						fin = 1
					end
					if _vm:bitwise_and(b, 64) ~= 0 then
						rsv1 = 1
					end
					if _vm:bitwise_and(b, 32) ~= 0 then
						rsv2 = 1
					end
					if _vm:bitwise_and(b, 16) ~= 0 then
						rsv3 = 1
					end
					opcode = _vm:bitwise_and(b, 15)
				elseif p == 1 then
					mask = _vm:bitwise_and(b, 128)
					if mask == 0 then
						do return false end
					end
					maskingBuffer = _g.jk.lang.Buffer:allocate(4)
					payloadLength = _vm:bitwise_and(b, 127)
					if payloadLength >= 0 and payloadLength < 126 then
						do p = p + 1 end
						if maskingBuffer ~= nil then
							lastMaskingBufferIndex = p + 3
						end
						goto _continue2
					elseif payloadLength == 126 then
						local v = 0
						v = _vm:bitwise_or(v, _vm:bitwise_left_shift(_vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 1), 255), 8))
						v = _vm:bitwise_or(v, _vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 2), 255))
						payloadLength = v
						p = p + 3
						if maskingBuffer ~= nil then
							lastMaskingBufferIndex = p + 3
						end
						goto _continue2
					elseif payloadLength == 127 then
						local v = 0
						v = _vm:bitwise_or(v, _vm:bitwise_left_shift(_vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 1), 127), 56))
						v = _vm:bitwise_or(v, _vm:bitwise_left_shift(_vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 2), 255), 48))
						v = _vm:bitwise_or(v, _vm:bitwise_left_shift(_vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 3), 255), 40))
						v = _vm:bitwise_or(v, _vm:bitwise_left_shift(_vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 4), 255), 32))
						v = _vm:bitwise_or(v, _vm:bitwise_left_shift(_vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 5), 255), 24))
						v = _vm:bitwise_or(v, _vm:bitwise_left_shift(_vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 6), 255), 16))
						v = _vm:bitwise_or(v, _vm:bitwise_left_shift(_vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 7), 255), 8))
						v = _vm:bitwise_or(v, _vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 8), 255))
						payloadLength = v
						p = p + 9
						if maskingBuffer ~= nil then
							lastMaskingBufferIndex = p + 3
						end
						goto _continue2
					end
					do return false end
				elseif p <= lastMaskingBufferIndex then
					do _g.jk.lang.Buffer:setByte(maskingBuffer, mi, b) end
					do mi = mi + 1 end
				else
					do break end
				end
				do p = p + 1 end
				::_continue2::
			end
			do
				local frameLength = p + payloadLength
				if nsize < frameLength then
					self.leftOverBuffer = _g.jk.lang.Buffer:allocate(nsize)
					do _g.jk.lang.Buffer:copyFrom(self.leftOverBuffer, nbuffer, 0, 0, nsize) end
					do self.frameNo = self.frameNo + 1 end
					do return true end
				end
				payloadBuffer = _g.jk.lang.Buffer:allocate(payloadLength)
				do _g.jk.lang.Buffer:copyFrom(payloadBuffer, nbuffer, p, 0, payloadLength) end
				do self:processFrame(fin, rsv1, rsv2, rsv3, opcode, mask, maskingBuffer, payloadLength, payloadBuffer) end
				self.frameNo = 1
				if nsize > frameLength then
					local losize = nsize - frameLength
					self.leftOverBuffer = _g.jk.lang.Buffer:allocate(losize)
					do _g.jk.lang.Buffer:copyFrom(self.leftOverBuffer, nbuffer, frameLength, 0, losize) end
				end
				do return true end
			end
		end
	end
end

function jk.ws.server.WSServerConnection:processFrame(fin, rsv1, rsv2, rsv3, opcode, mask, maskingBuffer, payloadLength, payloadBuffer)
	if fin == 0 then
		do return end
	end
	if mask == 0 then
	else
		do self:unmaskPayload(payloadBuffer, payloadLength, maskingBuffer) end
	end
	do self:onNewMessage(_g.jk.ws.server.WSServerMessage:create(fin, rsv1, rsv2, rsv3, opcode, maskingBuffer, payloadBuffer)) end
end

function jk.ws.server.WSServerConnection:onNewMessage(message)
	if message:isCloseControlFrame() then
		if self.isWebSocketConnectionOpen == true then
			do self:sendResponse(_g.jk.ws.server.WSServerMessage:forCloseControlFrame(_g.jk.ws.server.WSStatusCode.CLOSE_NORMAL, nil)) end
			self.isWebSocketConnectionOpen = false
		end
		do self:close() end
		do self.connectionHandler:onCloseMessage(message) end
	elseif message:isPingControlFrame() and self.connectionHandler:onPingMessage(message) == false then
		do self:sendResponse(_g.jk.ws.server.WSServerMessage:forPongControlFrame()) end
	elseif message:isPongControlFrame() then
		do self.connectionHandler:onPongMessage(message) end
	else
		do self.connectionHandler:onDataMessage(message) end
	end
end

function jk.ws.server.WSServerConnection:unmaskPayload(maskedPayloadBuffer, payloadLength, maskingBuffer)
	local i = 0
	while i < payloadLength do
		local b = _g.jk.lang.Buffer:getByte(maskedPayloadBuffer, i)
		local ob = _vm:bitwise_xor(b, _g.jk.lang.Buffer:getByte(maskingBuffer, _util:convert_to_integer(i % 4)))
		do _g.jk.lang.Buffer:setByte(maskedPayloadBuffer, i, ob) end
		do i = i + 1 end
	end
end

function jk.ws.server.WSServerConnection:onMaintenance()
	if _g.jk.time.SystemClock:asSeconds() - self:getLastActivity() >= self.pingInterval then
		do self:sendPing() end
	end
	do self.connectionHandler:onMaintenance() end
end

function jk.ws.server.WSServerConnection:sendPing()
	do return self:sendResponse(_g.jk.ws.server.WSServerMessage:forPingControlFrame()) end
end

function jk.ws.server.WSServerConnection:sendResponse(message)
	if message == nil then
		do return -1 end
	end
	if message:isCloseControlFrame() and self.isWebSocketConnectionOpen == true then
		self.isWebSocketConnectionOpen = false
	end
	do
		local buffer = message:toBuffer()
		if buffer == nil then
			do return -1 end
		end
		do return self:sendData(buffer, #buffer) end
	end
end

function jk.ws.server.WSServerConnection:getConnectionHandler()
	do return self.connectionHandler end
end

function jk.ws.server.WSServerConnection:setConnectionHandler(v)
	self.connectionHandler = v
	do return self end
end

function jk.ws.server.WSServerConnection:getPingInterval()
	do return self.pingInterval end
end

function jk.ws.server.WSServerConnection:setPingInterval(v)
	self.pingInterval = v
	do return self end
end

jk.ws.server.WSServerMessage = {}
jk.ws.server.WSServerMessage.__index = jk.ws.server.WSServerMessage
_vm:set_metatable(jk.ws.server.WSServerMessage, {})

jk.ws.server.WSServerMessage.CLOSE_FRAME = 8
jk.ws.server.WSServerMessage.PING_FRAME = 9
jk.ws.server.WSServerMessage.PONG_FRAME = 10

function jk.ws.server.WSServerMessage._create()
	local v = _vm:set_metatable({}, jk.ws.server.WSServerMessage)
	return v
end

function jk.ws.server.WSServerMessage:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.server.WSServerMessage'
	self['_isType.jk.ws.server.WSServerMessage'] = true
	self.fin = 0
	self.rsv1 = 0
	self.rsv2 = 0
	self.rsv3 = 0
	self.opcode = 0
	self.maskingBuffer = nil
	self.payloadBuffer = nil
	self.messageBuffer = nil
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.ws.server.WSServerMessage:_construct0()
	jk.ws.server.WSServerMessage._init(self)
	return self
end

function jk.ws.server.WSServerMessage:forText(text)
	do return _g.jk.ws.server.WSServerMessage:create(1, 0, 0, 0, 1, nil, _g.jk.lang.String:toUTF8Buffer(text)) end
end

function jk.ws.server.WSServerMessage:forBinary(binary)
	do return _g.jk.ws.server.WSServerMessage:create(1, 0, 0, 0, 2, nil, binary) end
end

function jk.ws.server.WSServerMessage:create(fin, rsv1, rsv2, rsv3, opcode, maskingBuffer, payloadBuffer)
	do return _g.jk.ws.server.WSServerMessage._construct0(_g.jk.ws.server.WSServerMessage._create()):setFin(fin):setRsv1(rsv1):setRsv2(rsv2):setRsv3(rsv3):setOpcode(opcode):setMaskingBuffer(maskingBuffer):setPayloadBuffer(payloadBuffer) end
end

function jk.ws.server.WSServerMessage:_destruct()
	self.messageBuffer = nil
	self.maskingBuffer = nil
	self.payloadBuffer = nil
end

function jk.ws.server.WSServerMessage:onChanged()
	self.messageBuffer = nil
end

function jk.ws.server.WSServerMessage:setFin(fin)
	self.fin = fin
	do self:onChanged() end
	do return self end
end

function jk.ws.server.WSServerMessage:getFin()
	do return self.fin end
end

function jk.ws.server.WSServerMessage:setRsv1(rsv1)
	self.rsv1 = rsv1
	do self:onChanged() end
	do return self end
end

function jk.ws.server.WSServerMessage:getRsv1()
	do return self.rsv1 end
end

function jk.ws.server.WSServerMessage:setRsv2(rsv2)
	self.rsv2 = rsv2
	do self:onChanged() end
	do return self end
end

function jk.ws.server.WSServerMessage:getRsv2()
	do return self.rsv2 end
end

function jk.ws.server.WSServerMessage:setRsv3(rsv3)
	self.rsv3 = rsv3
	do self:onChanged() end
	do return self end
end

function jk.ws.server.WSServerMessage:getRsv3()
	do return self.rsv3 end
end

function jk.ws.server.WSServerMessage:setOpcode(opcode)
	self.opcode = opcode
	do self:onChanged() end
	do return self end
end

function jk.ws.server.WSServerMessage:getOpcode()
	do return self.opcode end
end

function jk.ws.server.WSServerMessage:setMaskingBuffer(maskingBuffer)
	self.maskingBuffer = maskingBuffer
	do self:onChanged() end
	do return self end
end

function jk.ws.server.WSServerMessage:getMaskingBuffer()
	do return self.maskingBuffer end
end

function jk.ws.server.WSServerMessage:setPayloadBuffer(payloadBuffer)
	self.payloadBuffer = payloadBuffer
	do self:onChanged() end
	do return self end
end

function jk.ws.server.WSServerMessage:getPayloadBuffer()
	do return self.payloadBuffer end
end

function jk.ws.server.WSServerMessage:getPayloadBufferString()
	do return _g.jk.lang.String:forUTF8Buffer(self.payloadBuffer) end
end

function jk.ws.server.WSServerMessage:forCloseControlFrame(statusCode, reason)
	if statusCode < 65536 and statusCode > -1 then
		if _g.jk.lang.String:isEmpty(reason) == false then
			local rBuffer = _g.jk.lang.String:toUTF8Buffer(reason)
			local size = #rBuffer
			local plBuffer = _g.jk.lang.Buffer:allocate(size + 2)
			do _g.jk.lang.Buffer:setByte(plBuffer, 0, _vm:bitwise_and(_vm:bitwise_right_shift(statusCode, 8), 255)) end
			do _g.jk.lang.Buffer:setByte(plBuffer, 1, _vm:bitwise_and(statusCode, 255)) end
			do _g.jk.lang.Buffer:copyFrom(plBuffer, rBuffer, 0, 2, size) end
			do return _g.jk.ws.server.WSServerMessage._construct0(_g.jk.ws.server.WSServerMessage._create()):setFin(1):setOpcode(_g.jk.ws.server.WSServerMessage.CLOSE_FRAME):setPayloadBuffer(plBuffer) end
		end
		do
			local plBuffer = _g.jk.lang.Buffer:allocate(2)
			do _g.jk.lang.Buffer:setByte(plBuffer, 0, _vm:bitwise_and(_vm:bitwise_right_shift(statusCode, 8), 255)) end
			do _g.jk.lang.Buffer:setByte(plBuffer, 1, _vm:bitwise_and(statusCode, 255)) end
			do return _g.jk.ws.server.WSServerMessage._construct0(_g.jk.ws.server.WSServerMessage._create()):setFin(1):setOpcode(_g.jk.ws.server.WSServerMessage.CLOSE_FRAME):setPayloadBuffer(plBuffer) end
		end
	end
	do return _g.jk.ws.server.WSServerMessage._construct0(_g.jk.ws.server.WSServerMessage._create()):setFin(1):setOpcode(_g.jk.ws.server.WSServerMessage.CLOSE_FRAME) end
end

function jk.ws.server.WSServerMessage:forPingControlFrame()
	do return _g.jk.ws.server.WSServerMessage._construct0(_g.jk.ws.server.WSServerMessage._create()):setFin(1):setOpcode(_g.jk.ws.server.WSServerMessage.PING_FRAME) end
end

function jk.ws.server.WSServerMessage:forPongControlFrame()
	do return _g.jk.ws.server.WSServerMessage._construct0(_g.jk.ws.server.WSServerMessage._create()):setFin(1):setOpcode(_g.jk.ws.server.WSServerMessage.PONG_FRAME) end
end

function jk.ws.server.WSServerMessage:isDataText()
	do return self.opcode == 1 end
end

function jk.ws.server.WSServerMessage:isDataBinary()
	do return self.opcode == 2 end
end

function jk.ws.server.WSServerMessage:isCloseControlFrame()
	do return self.opcode == _g.jk.ws.server.WSServerMessage.CLOSE_FRAME end
end

function jk.ws.server.WSServerMessage:isPingControlFrame()
	do return self.opcode == _g.jk.ws.server.WSServerMessage.PING_FRAME end
end

function jk.ws.server.WSServerMessage:isPongControlFrame()
	do return self.opcode == _g.jk.ws.server.WSServerMessage.PONG_FRAME end
end

function jk.ws.server.WSServerMessage:toBuffer()
	if self.messageBuffer ~= nil then
		do return self.messageBuffer end
	end
	do
		local size = 2
		if self.maskingBuffer ~= nil then
			size = size + 4
		end
		do
			local payloadLength = 0
			if self.payloadBuffer ~= nil then
				payloadLength = _g.jk.lang.Buffer:getSize(self.payloadBuffer)
			end
			do
				local plb = 0
				if payloadLength < 126 and payloadLength >= 0 then
					plb = payloadLength
				elseif payloadLength < 65536 then
					plb = 126
					size = size + 2
				elseif payloadLength > 65535 then
					plb = 127
					size = size + 8
				else
					do return nil end
				end
				size = size + payloadLength
				self.messageBuffer = _g.jk.lang.Buffer:allocate(size)
				do
					local b1 = self.opcode
					if self.fin ~= 0 then
						b1 = _vm:bitwise_or(b1, 128)
					end
					if self.rsv1 ~= 0 then
						b1 = _vm:bitwise_or(b1, 64)
					end
					if self.rsv2 ~= 0 then
						b1 = _vm:bitwise_or(b1, 32)
					end
					if self.rsv3 ~= 0 then
						b1 = _vm:bitwise_or(b1, 16)
					end
					do _g.jk.lang.Buffer:setByte(self.messageBuffer, 0, b1) end
					do
						local b2 = 0
						b2 = plb
						if self.maskingBuffer ~= nil then
							b2 = _vm:bitwise_or(b2, 128)
						end
						do _g.jk.lang.Buffer:setByte(self.messageBuffer, 1, b2) end
						do
							local p = 2
							local tp = p
							local n = 0
							if plb == 126 then
								n = 8
								tp = tp + 2
							elseif plb == 127 then
								n = 56
								tp = tp + 8
							end
							while p < tp do
								if n ~= 0 then
									do _g.jk.lang.Buffer:setByte(self.messageBuffer, p, _vm:bitwise_and(_vm:bitwise_right_shift(payloadLength, n), 255)) end
								else
									do _g.jk.lang.Buffer:setByte(self.messageBuffer, p, _vm:bitwise_and(payloadLength, 255)) end
								end
								do p = p + 1 end
								n = n - 8
							end
							if self.maskingBuffer ~= nil then
								do _g.jk.lang.Buffer:copyFrom(self.messageBuffer, self.maskingBuffer, 0, p, 4) end
								p = p + 4
								if self.payloadBuffer ~= nil then
									local i = 0
									while i < payloadLength do
										local b = _g.jk.lang.Buffer:getByte(self.payloadBuffer, i)
										local ob = _vm:bitwise_xor(b, _g.jk.lang.Buffer:getByte(self.maskingBuffer, _util:convert_to_integer(i % 4)))
										do _g.jk.lang.Buffer:setByte(self.payloadBuffer, i, ob) end
										do i = i + 1 end
									end
								end
							end
							if self.payloadBuffer ~= nil then
								do _g.jk.lang.Buffer:copyFrom(self.messageBuffer, self.payloadBuffer, 0, p, payloadLength) end
							end
							do return self.messageBuffer end
						end
					end
				end
			end
		end
	end
end

jk.ws.server.WSServerConnectionHandler = {}
jk.ws.server.WSServerConnectionHandler.__index = jk.ws.server.WSServerConnectionHandler
_vm:set_metatable(jk.ws.server.WSServerConnectionHandler, {})

jk.ws.server.WSServerConnectionHandler.connectionIndexCounter = 0

function jk.ws.server.WSServerConnectionHandler._create()
	local v = _vm:set_metatable({}, jk.ws.server.WSServerConnectionHandler)
	return v
end

function jk.ws.server.WSServerConnectionHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.server.WSServerConnectionHandler'
	self['_isType.jk.ws.server.WSServerConnectionHandler'] = true
	self['_isType.jk.ws.WSProtocolSource'] = true
	self.connection = nil
	self.logContext = nil
	self.connectionIndex = (function() local v = _g.jk.ws.server.WSServerConnectionHandler.connectionIndexCounter _g.jk.ws.server.WSServerConnectionHandler.connectionIndexCounter = _g.jk.ws.server.WSServerConnectionHandler.connectionIndexCounter + 1 return v end)()
	self.connectionId = nil
	self.protocol = nil
end

function jk.ws.server.WSServerConnectionHandler:_construct0()
	jk.ws.server.WSServerConnectionHandler._init(self)
	return self
end

function jk.ws.server.WSServerConnectionHandler:setProtocol(protocol)
	if self.protocol ~= nil then
		do self.protocol:setSource(nil) end
	end
	self.protocol = protocol
	if protocol ~= nil then
		do protocol:setSource(self) end
	end
	do return self end
end

function jk.ws.server.WSServerConnectionHandler:getProtocol()
	do return self.protocol end
end

function jk.ws.server.WSServerConnectionHandler:getConnectionIdString()
	if _g.jk.lang.String:isEmpty(self.connectionId) then
		do return _g.jk.lang.String:forInteger(self.connectionIndex) end
	end
	do return _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.connectionIndex)) .. ":" .. _g.jk.lang.String:safeString(self.connectionId) end
end

function jk.ws.server.WSServerConnectionHandler:logDebug(text)
	do _g.jk.log.Log:debug(self.logContext, "(ws=" .. _g.jk.lang.String:safeString(self:getConnectionIdString()) .. ") " .. _g.jk.lang.String:safeString(text)) end
end

function jk.ws.server.WSServerConnectionHandler:logInfo(text)
	do _g.jk.log.Log:info(self.logContext, "(ws=" .. _g.jk.lang.String:safeString(self:getConnectionIdString()) .. ") " .. _g.jk.lang.String:safeString(text)) end
end

function jk.ws.server.WSServerConnectionHandler:logWarning(text)
	do _g.jk.log.Log:warning(self.logContext, "(ws=" .. _g.jk.lang.String:safeString(self:getConnectionIdString()) .. ") " .. _g.jk.lang.String:safeString(text)) end
end

function jk.ws.server.WSServerConnectionHandler:logError(text)
	do _g.jk.log.Log:error(self.logContext, "(ws=" .. _g.jk.lang.String:safeString(self:getConnectionIdString()) .. ") " .. _g.jk.lang.String:safeString(text)) end
end

function jk.ws.server.WSServerConnectionHandler:setConnection(conn)
	self.connection = conn
	do return self end
end

function jk.ws.server.WSServerConnectionHandler:getConnection()
	do return self.connection end
end

function jk.ws.server.WSServerConnectionHandler:setLogContext(ctx)
	self.logContext = ctx
	do return self end
end

function jk.ws.server.WSServerConnectionHandler:getLogContext()
	do return self.logContext end
end

function jk.ws.server.WSServerConnectionHandler:sendString(data)
	do self:sendResponse(_g.jk.ws.server.WSServerMessage:forText(data)) end
end

function jk.ws.server.WSServerConnectionHandler:sendBuffer(data)
	do self:sendResponse(_g.jk.ws.server.WSServerMessage:forBinary(data)) end
end

function jk.ws.server.WSServerConnectionHandler:sendResponse(message)
	if self.connection == nil then
		do return -1 end
	end
	do return self.connection:sendResponse(message) end
end

function jk.ws.server.WSServerConnectionHandler:onMaintenance()
end

function jk.ws.server.WSServerConnectionHandler:onOpened()
	if self.protocol ~= nil then
		do self.protocol:onConnectionOpened() end
	end
end

function jk.ws.server.WSServerConnectionHandler:onClosed()
	if self.protocol ~= nil then
		do self.protocol:onConnectionClosed() end
	end
end

function jk.ws.server.WSServerConnectionHandler:closeConnection()
	do self:close() end
end

function jk.ws.server.WSServerConnectionHandler:close()
	if not (self.connection ~= nil) then
		do self:onClosed() end
		do return end
	end
	do self.connection:close() end
	do self:setProtocol(nil) end
end

function jk.ws.server.WSServerConnectionHandler:onCloseMessage(message)
end

function jk.ws.server.WSServerConnectionHandler:onPingMessage(message)
	do return false end
end

function jk.ws.server.WSServerConnectionHandler:onPongMessage(message)
end

function jk.ws.server.WSServerConnectionHandler:onDataMessage(message)
	if self.protocol ~= nil and message ~= nil then
		if message:isDataText() then
			do self.protocol:onStringMessage(message:getPayloadBufferString()) end
		else
			do self.protocol:onBinaryMessage(message:getPayloadBuffer()) end
		end
	end
end

function jk.ws.server.WSServerConnectionHandler:getConnectionId()
	do return self.connectionId end
end

function jk.ws.server.WSServerConnectionHandler:setConnectionId(v)
	self.connectionId = v
	do return self end
end

jk.ws.server.WSServer = _g.jk.server.NetworkServer._create()
jk.ws.server.WSServer.__index = jk.ws.server.WSServer
_vm:set_metatable(jk.ws.server.WSServer, {
	__index = _g.jk.server.NetworkServer
})

function jk.ws.server.WSServer._create()
	local v = _vm:set_metatable({}, jk.ws.server.WSServer)
	return v
end

function jk.ws.server.WSServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.server.WSServer'
	self['_isType.jk.ws.server.WSServer'] = true
	self.createConnectionHandlerObject = nil
	self.maintenanceTimerDelay = 7 * 60
	self.maintenanceTimer = nil
end

function jk.ws.server.WSServer:_construct0()
	jk.ws.server.WSServer._init(self)
	do _g.jk.server.NetworkServer._construct0(self) end
	do self:setPort(8080) end
	return self
end

function jk.ws.server.WSServer:createConnectionObject()
	if not (self.createConnectionHandlerObject ~= nil) then
		do self:logError("No 'createConnectionHandlerObject' set. Cannot create connection object handlers!") end
		do return nil end
	end
	do
		local handler = self.createConnectionHandlerObject()
		if not (handler ~= nil) then
			do self:logError("Failed to create connection object. No connection handler object returned!") end
			do return nil end
		end
		do
			local connection = _g.jk.ws.server.WSServerConnection._construct0(_g.jk.ws.server.WSServerConnection._create())
			do connection:setConnectionHandler(handler) end
			do handler:setConnection(connection) end
			do handler:setLogContext(self.logContext) end
			do return connection end
		end
	end
end

function jk.ws.server.WSServer:logError(message)
	do _g.jk.log.Log:error(self.logContext, message) end
end

function jk.ws.server.WSServer:logWarning(message)
	do _g.jk.log.Log:warning(self.logContext, message) end
end

function jk.ws.server.WSServer:logInfo(message)
	do _g.jk.log.Log:info(self.logContext, message) end
end

function jk.ws.server.WSServer:logDebug(message)
	do _g.jk.log.Log:debug(self.logContext, message) end
end

function jk.ws.server.WSServer:onMaintenanceTimer()
	do self:onMaintenance() end
	do return true end
end

function jk.ws.server.WSServer:onMaintenance()
	do self:forEachConnection(function(connection)
		local wsConnection = _vm:to_table_with_key(connection, '_isType.jk.ws.server.WSServerConnection')
		if not (wsConnection ~= nil) then
			do return end
		end
		do wsConnection:onMaintenance() end
	end) end
end

function jk.ws.server.WSServer:initialize2()
	if not _g.jk.server.NetworkServer.initialize2(self) then
		do return false end
	end
	if self.maintenanceTimerDelay < 1 then
		do self:logDebug("Maintenance timer disabled") end
	else
		do self:logDebug("Starting a maintenance timer with a " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.maintenanceTimerDelay)) .. " second delay.") end
		self.maintenanceTimer = self.ioManager:startTimer(self.maintenanceTimerDelay * 1000000, function()
			do self:onMaintenanceTimer() end
		end)
		if self.maintenanceTimer == nil then
			do self:logError("Failed to start maintenance timer") end
		end
	end
	do return true end
end

function jk.ws.server.WSServer:cleanup()
	do _g.jk.server.NetworkServer.cleanup(self) end
end

function jk.ws.server.WSServer:getCreateConnectionHandlerObject()
	do return self.createConnectionHandlerObject end
end

function jk.ws.server.WSServer:setCreateConnectionHandlerObject(v)
	self.createConnectionHandlerObject = v
	do return self end
end

function jk.ws.server.WSServer:getMaintenanceTimerDelay()
	do return self.maintenanceTimerDelay end
end

function jk.ws.server.WSServer:setMaintenanceTimerDelay(v)
	self.maintenanceTimerDelay = v
	do return self end
end
