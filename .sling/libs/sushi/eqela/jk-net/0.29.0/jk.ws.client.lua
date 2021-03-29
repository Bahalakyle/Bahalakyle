jk = jk or {}

jk.ws = jk.ws or {}

jk.ws.client = jk.ws.client or {}

jk.ws.client.WSCloseEvent = {}
jk.ws.client.WSCloseEvent.__index = jk.ws.client.WSCloseEvent
_vm:set_metatable(jk.ws.client.WSCloseEvent, {})

jk.ws.client.WSCloseEvent.CLOSE_NORMAL = 1000
jk.ws.client.WSCloseEvent.CLOSE_GOING_AWAY = 1001
jk.ws.client.WSCloseEvent.CLOSE_PROTOCOL_ERROR = 1002
jk.ws.client.WSCloseEvent.CLOSE_UNSUPPORTED = 1003
jk.ws.client.WSCloseEvent.CLOSE_NO_STATUS = 1005
jk.ws.client.WSCloseEvent.CLOSE_ABNORMAL = 1006
jk.ws.client.WSCloseEvent.UNSUPPORTED_DATA = 1007
jk.ws.client.WSCloseEvent.POLICY_VIOLATION = 1008
jk.ws.client.WSCloseEvent.CLOSE_TOO_LARGE = 1009
jk.ws.client.WSCloseEvent.MISSING_EXTENSION = 1010
jk.ws.client.WSCloseEvent.INTERNAL_ERROR = 1011
jk.ws.client.WSCloseEvent.SERVICE_RESTART = 1012
jk.ws.client.WSCloseEvent.TRY_AGAIN_LATER = 1013
jk.ws.client.WSCloseEvent.TLS_HANDSHAKE = 1015

function jk.ws.client.WSCloseEvent._create()
	local v = _vm:set_metatable({}, jk.ws.client.WSCloseEvent)
	return v
end

function jk.ws.client.WSCloseEvent:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.client.WSCloseEvent'
	self['_isType.jk.ws.client.WSCloseEvent'] = true
end

function jk.ws.client.WSCloseEvent:_construct0()
	jk.ws.client.WSCloseEvent._init(self)
	return self
end

function jk.ws.client.WSCloseEvent:getStatusCode()
end

function jk.ws.client.WSCloseEvent:getReason()
end

jk.ws.client.WSMessage = {}
jk.ws.client.WSMessage.__index = jk.ws.client.WSMessage
_vm:set_metatable(jk.ws.client.WSMessage, {})

function jk.ws.client.WSMessage._create()
	local v = _vm:set_metatable({}, jk.ws.client.WSMessage)
	return v
end

function jk.ws.client.WSMessage:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.client.WSMessage'
	self['_isType.jk.ws.client.WSMessage'] = true
	self.data = nil
	self.isString = false
	self.isPing = false
end

function jk.ws.client.WSMessage:_construct0()
	jk.ws.client.WSMessage._init(self)
	return self
end

function jk.ws.client.WSMessage:forStringData(data)
	if not (data ~= nil) then
		do return nil end
	end
	do return _g.jk.ws.client.WSMessage._construct0(_g.jk.ws.client.WSMessage._create()):setData1(data) end
end

function jk.ws.client.WSMessage:forData(data)
	if not (data ~= nil) then
		do return nil end
	end
	do return _g.jk.ws.client.WSMessage._construct0(_g.jk.ws.client.WSMessage._create()):setData2(data) end
end

function jk.ws.client.WSMessage:forPingMessage()
	do return _g.jk.ws.client.WSMessage._construct0(_g.jk.ws.client.WSMessage._create()):setIsPing(true) end
end

function jk.ws.client.WSMessage:isText()
	do return self.isString end
end

function jk.ws.client.WSMessage:setData1(v)
	if _g.jk.lang.String:isEmpty(v) then
		do return self end
	end
	self.isString = true
	self.data = _g.jk.lang.String:toUTF8Buffer(v)
	do return self end
end

function jk.ws.client.WSMessage:setData2(v)
	self.isString = false
	self.data = v
	do return self end
end

function jk.ws.client.WSMessage:getDataAsString()
	if self:isText() == false then
		do return nil end
	end
	do return _g.jk.lang.String:forUTF8Buffer(self.data) end
end

function jk.ws.client.WSMessage:getData()
	do return self.data end
end

function jk.ws.client.WSMessage:getIsPing()
	do return self.isPing end
end

function jk.ws.client.WSMessage:setIsPing(v)
	self.isPing = v
	do return self end
end

jk.ws.client.WSSocket = {}
jk.ws.client.WSSocket.__index = jk.ws.client.WSSocket
_vm:set_metatable(jk.ws.client.WSSocket, {})

function jk.ws.client.WSSocket._create()
	local v = _vm:set_metatable({}, jk.ws.client.WSSocket)
	return v
end

function jk.ws.client.WSSocket:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.client.WSSocket'
	self['_isType.jk.ws.client.WSSocket'] = true
	self.onOpenCallback = nil
	self.onCloseCallback = nil
	self.onMessageCallback = nil
	self.onErrorCallback = nil
end

function jk.ws.client.WSSocket:_construct0()
	jk.ws.client.WSSocket._init(self)
	return self
end

function jk.ws.client.WSSocket:create()
	do return _g.jk.ws.client.WSSocketGeneric._construct0(_g.jk.ws.client.WSSocketGeneric._create()) end
end

function jk.ws.client.WSSocket:connect(url)
end

function jk.ws.client.WSSocket:send(message)
end

function jk.ws.client.WSSocket:close()
end

function jk.ws.client.WSSocket:closeWithReason(statusCode, reason, callback)
end

function jk.ws.client.WSSocket:getOnOpenCallback()
	do return self.onOpenCallback end
end

function jk.ws.client.WSSocket:setOnOpenCallback(v)
	self.onOpenCallback = v
	do return self end
end

function jk.ws.client.WSSocket:getOnCloseCallback()
	do return self.onCloseCallback end
end

function jk.ws.client.WSSocket:setOnCloseCallback(v)
	self.onCloseCallback = v
	do return self end
end

function jk.ws.client.WSSocket:getOnMessageCallback()
	do return self.onMessageCallback end
end

function jk.ws.client.WSSocket:setOnMessageCallback(v)
	self.onMessageCallback = v
	do return self end
end

function jk.ws.client.WSSocket:getOnErrorCallback()
	do return self.onErrorCallback end
end

function jk.ws.client.WSSocket:setOnErrorCallback(v)
	self.onErrorCallback = v
	do return self end
end

jk.ws.client.WSSocketGeneric = _g.jk.ws.client.WSSocket._create()
jk.ws.client.WSSocketGeneric.__index = jk.ws.client.WSSocketGeneric
_vm:set_metatable(jk.ws.client.WSSocketGeneric, {
	__index = _g.jk.ws.client.WSSocket
})

jk.ws.client.WSSocketGeneric.WEBSOCKET_GUID = "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

function jk.ws.client.WSSocketGeneric._create()
	local v = _vm:set_metatable({}, jk.ws.client.WSSocketGeneric)
	return v
end

function jk.ws.client.WSSocketGeneric:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.client.WSSocketGeneric'
	self['_isType.jk.ws.client.WSSocketGeneric'] = true
	self.client = nil
	self.key = nil
	self.accept = nil
	self.parser = nil
	self.leftOverBuffer = nil
	self.frameNo = 1
end

jk.ws.client.WSSocketGeneric.MyWSMessage = {}
jk.ws.client.WSSocketGeneric.MyWSMessage.__index = jk.ws.client.WSSocketGeneric.MyWSMessage
_vm:set_metatable(jk.ws.client.WSSocketGeneric.MyWSMessage, {})

jk.ws.client.WSSocketGeneric.MyWSMessage.CLOSE_FRAME = 8
jk.ws.client.WSSocketGeneric.MyWSMessage.PING_FRAME = 9
jk.ws.client.WSSocketGeneric.MyWSMessage.PONG_FRAME = 10

function jk.ws.client.WSSocketGeneric.MyWSMessage._create()
	local v = _vm:set_metatable({}, jk.ws.client.WSSocketGeneric.MyWSMessage)
	return v
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.client.WSSocketGeneric.MyWSMessage'
	self['_isType.jk.ws.client.WSSocketGeneric.MyWSMessage'] = true
	self.fin = 0
	self.rsv1 = 0
	self.rsv2 = 0
	self.rsv3 = 0
	self.opcode = 0
	self.maskingBuffer = nil
	self.payloadBuffer = nil
	self.messageBuffer = nil
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:_construct0()
	jk.ws.client.WSSocketGeneric.MyWSMessage._init(self)
	return self
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:forPingControlFrame()
	do return _g.jk.ws.client.WSSocketGeneric.MyWSMessage._construct0(_g.jk.ws.client.WSSocketGeneric.MyWSMessage._create()):setFin(1):setOpcode(_g.jk.ws.client.WSSocketGeneric.MyWSMessage.PING_FRAME) end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:forPongControlFrame()
	do return _g.jk.ws.client.WSSocketGeneric.MyWSMessage._construct0(_g.jk.ws.client.WSSocketGeneric.MyWSMessage._create()):setFin(1):setOpcode(_g.jk.ws.client.WSSocketGeneric.MyWSMessage.PONG_FRAME) end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:create(fin, rsv1, rsv2, rsv3, opcode, maskingBuffer, payloadBuffer)
	do return _g.jk.ws.client.WSSocketGeneric.MyWSMessage._construct0(_g.jk.ws.client.WSSocketGeneric.MyWSMessage._create()):setFin(fin):setRsv1(rsv1):setRsv2(rsv2):setRsv3(rsv3):setOpcode(opcode):setMaskingBuffer(maskingBuffer):setPayloadBuffer(payloadBuffer) end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:onChanged()
	self.messageBuffer = nil
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:setFin(fin)
	self.fin = fin
	do self:onChanged() end
	do return self end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:getFin()
	do return self.fin end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:setRsv1(rsv1)
	self.rsv1 = rsv1
	do self:onChanged() end
	do return self end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:getRsv1()
	do return self.rsv1 end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:setRsv2(rsv2)
	self.rsv2 = rsv2
	do self:onChanged() end
	do return self end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:getRsv2()
	do return self.rsv2 end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:setRsv3(rsv3)
	self.rsv3 = rsv3
	do self:onChanged() end
	do return self end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:getRsv3()
	do return self.rsv3 end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:setOpcode(opcode)
	self.opcode = opcode
	do self:onChanged() end
	do return self end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:getOpcode()
	do return self.opcode end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:setMaskingBuffer(maskingBuffer)
	self.maskingBuffer = maskingBuffer
	do self:onChanged() end
	do return self end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:getMaskingBuffer()
	do return self.maskingBuffer end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:setPayloadBuffer(payloadBuffer)
	self.payloadBuffer = payloadBuffer
	do self:onChanged() end
	do return self end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:getPayloadBuffer()
	do return self.payloadBuffer end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:forCloseControlFrame(statusCode, reason)
	if statusCode < 65536 and statusCode > -1 and _g.jk.lang.String:isNotEmpty(reason) then
		local rBuffer = _g.jk.lang.String:toUTF8Buffer(reason)
		local size = #rBuffer
		local plBuffer = _g.jk.lang.Buffer:allocate(size + 2)
		do _g.jk.lang.Buffer:setByte(plBuffer, 0, _vm:bitwise_and(_vm:bitwise_right_shift(statusCode, 8), 255)) end
		do _g.jk.lang.Buffer:setByte(plBuffer, 1, _vm:bitwise_and(statusCode, 255)) end
		do _g.jk.lang.Buffer:copyFrom(plBuffer, rBuffer, 0, 2, size) end
		do return _g.jk.ws.client.WSSocketGeneric.MyWSMessage._construct0(_g.jk.ws.client.WSSocketGeneric.MyWSMessage._create()):setFin(1):setOpcode(_g.jk.ws.client.WSSocketGeneric.MyWSMessage.CLOSE_FRAME):setPayloadBuffer(plBuffer) end
	end
	do return _g.jk.ws.client.WSSocketGeneric.MyWSMessage._construct0(_g.jk.ws.client.WSSocketGeneric.MyWSMessage._create()):setFin(1):setOpcode(_g.jk.ws.client.WSSocketGeneric.MyWSMessage.CLOSE_FRAME) end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:isDataText()
	do return self.opcode == 1 end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:isDataBinary()
	do return self.opcode == 1 end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:isCloseControlFrame()
	do return self.opcode == _g.jk.ws.client.WSSocketGeneric.MyWSMessage.CLOSE_FRAME end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:isPingControlFrame()
	do return self.opcode == _g.jk.ws.client.WSSocketGeneric.MyWSMessage.PING_FRAME end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:isPongControlFrame()
	do return self.opcode == _g.jk.ws.client.WSSocketGeneric.MyWSMessage.PONG_FRAME end
end

function jk.ws.client.WSSocketGeneric.MyWSMessage:toBuffer()
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
				payloadLength = #self.payloadBuffer
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
						b2 = _vm:bitwise_or(b2, 128)
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

jk.ws.client.WSSocketGeneric.MyWSCloseEvent = _g.jk.ws.client.WSCloseEvent._create()
jk.ws.client.WSSocketGeneric.MyWSCloseEvent.__index = jk.ws.client.WSSocketGeneric.MyWSCloseEvent
_vm:set_metatable(jk.ws.client.WSSocketGeneric.MyWSCloseEvent, {
	__index = _g.jk.ws.client.WSCloseEvent
})

function jk.ws.client.WSSocketGeneric.MyWSCloseEvent._create()
	local v = _vm:set_metatable({}, jk.ws.client.WSSocketGeneric.MyWSCloseEvent)
	return v
end

function jk.ws.client.WSSocketGeneric.MyWSCloseEvent:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.client.WSSocketGeneric.MyWSCloseEvent'
	self['_isType.jk.ws.client.WSSocketGeneric.MyWSCloseEvent'] = true
	self.statusCode = 0
	self.reason = nil
end

function jk.ws.client.WSSocketGeneric.MyWSCloseEvent:_construct0()
	jk.ws.client.WSSocketGeneric.MyWSCloseEvent._init(self)
	do _g.jk.ws.client.WSCloseEvent._construct0(self) end
	return self
end

function jk.ws.client.WSSocketGeneric.MyWSCloseEvent:setStatusCode(v)
	self.statusCode = v
	do return self end
end

function jk.ws.client.WSSocketGeneric.MyWSCloseEvent:setReason(v)
	self.reason = v
	do return self end
end

function jk.ws.client.WSSocketGeneric.MyWSCloseEvent:getStatusCode()
	do return self.statusCode end
end

function jk.ws.client.WSSocketGeneric.MyWSCloseEvent:getReason()
	do return self.reason end
end

function jk.ws.client.WSSocketGeneric.MyWSCloseEvent:forPayloadBuffer(payloadBuffer)
	if not (payloadBuffer ~= nil) then
		do return nil end
	end
	do
		local size = #payloadBuffer
		local e = _g.jk.ws.client.WSSocketGeneric.MyWSCloseEvent._construct0(_g.jk.ws.client.WSSocketGeneric.MyWSCloseEvent._create())
		local v = 0
		v = _vm:bitwise_or(v, _vm:bitwise_left_shift(_g.jk.lang.Buffer:getByte(payloadBuffer, 0), 8))
		v = _vm:bitwise_or(v, _g.jk.lang.Buffer:getByte(payloadBuffer, 1))
		do e:setStatusCode(v) end
		if size - 2 > 0 then
			do e:setReason(_g.jk.lang.String:forUTF8Buffer(_g.jk.lang.Buffer:getSubBuffer(payloadBuffer, 2, size - 2, false))) end
		end
		do return e end
	end
end

jk.ws.client.WSSocketGeneric.HTTPClientResponse = {}
jk.ws.client.WSSocketGeneric.HTTPClientResponse.__index = jk.ws.client.WSSocketGeneric.HTTPClientResponse
_vm:set_metatable(jk.ws.client.WSSocketGeneric.HTTPClientResponse, {})

function jk.ws.client.WSSocketGeneric.HTTPClientResponse._create()
	local v = _vm:set_metatable({}, jk.ws.client.WSSocketGeneric.HTTPClientResponse)
	return v
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.client.WSSocketGeneric.HTTPClientResponse'
	self['_isType.jk.ws.client.WSSocketGeneric.HTTPClientResponse'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.httpVersion = nil
	self.httpStatus = nil
	self.httpStatusDescription = nil
	self.rawHeaders = nil
	self.headers = nil
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:_construct0()
	jk.ws.client.WSSocketGeneric.HTTPClientResponse._init(self)
	return self
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:addHeader(key, value)
	if not (self.rawHeaders ~= nil) then
		self.rawHeaders = _g.jk.lang.KeyValueListForStrings._construct0(_g.jk.lang.KeyValueListForStrings._create())
	end
	if not (self.headers ~= nil) then
		self.headers = {}
	end
	do self.rawHeaders:add(key, value) end
	self.headers[_g.jk.lang.String:toLowerCase(key)] = value
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:getHeader(key)
	if not (self.headers ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(self.headers, key) end
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:toString()
	do return _g.jk.lang.String:asString(self.rawHeaders) end
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:getHttpVersion()
	do return self.httpVersion end
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:setHttpVersion(v)
	self.httpVersion = v
	do return self end
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:getHttpStatus()
	do return self.httpStatus end
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:setHttpStatus(v)
	self.httpStatus = v
	do return self end
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:getHttpStatusDescription()
	do return self.httpStatusDescription end
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:setHttpStatusDescription(v)
	self.httpStatusDescription = v
	do return self end
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:getRawHeaders()
	do return self.rawHeaders end
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:setRawHeaders(v)
	self.rawHeaders = v
	do return self end
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:getHeaders()
	do return self.headers end
end

function jk.ws.client.WSSocketGeneric.HTTPClientResponse:setHeaders(v)
	self.headers = v
	do return self end
end

jk.ws.client.WSSocketGeneric.HTTPResponseParser = {}
jk.ws.client.WSSocketGeneric.HTTPResponseParser.__index = jk.ws.client.WSSocketGeneric.HTTPResponseParser
_vm:set_metatable(jk.ws.client.WSSocketGeneric.HTTPResponseParser, {})

function jk.ws.client.WSSocketGeneric.HTTPResponseParser._create()
	local v = _vm:set_metatable({}, jk.ws.client.WSSocketGeneric.HTTPResponseParser)
	return v
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.client.WSSocketGeneric.HTTPResponseParser'
	self['_isType.jk.ws.client.WSSocketGeneric.HTTPResponseParser'] = true
	self.receivedData = nil
	self.headers = nil
	self.bodyData = nil
	self.isChunked = false
	self.contentLength = 0
	self.dataCounter = 0
	self.endOfResponse = false
	self.aborted = false
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser:_construct0()
	jk.ws.client.WSSocketGeneric.HTTPResponseParser._init(self)
	return self
end

jk.ws.client.WSSocketGeneric.HTTPResponseParser.Chunk = {}
jk.ws.client.WSSocketGeneric.HTTPResponseParser.Chunk.__index = jk.ws.client.WSSocketGeneric.HTTPResponseParser.Chunk
_vm:set_metatable(jk.ws.client.WSSocketGeneric.HTTPResponseParser.Chunk, {})

function jk.ws.client.WSSocketGeneric.HTTPResponseParser.Chunk._create()
	local v = _vm:set_metatable({}, jk.ws.client.WSSocketGeneric.HTTPResponseParser.Chunk)
	return v
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser.Chunk:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.client.WSSocketGeneric.HTTPResponseParser.Chunk'
	self['_isType.jk.ws.client.WSSocketGeneric.HTTPResponseParser.Chunk'] = true
	self.data = nil
	self.completed = true
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser.Chunk:_construct0()
	jk.ws.client.WSSocketGeneric.HTTPResponseParser.Chunk._init(self)
	return self
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser:reset()
	self.isChunked = false
	self.headers = nil
	self.bodyData = nil
	self.contentLength = 0
	self.dataCounter = 0
	self.endOfResponse = false
	self.aborted = false
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser:hasEndOfHeaders(buf, size)
	local n = 0
	local v = false
	while n <= size - 4 do
		if _g.jk.lang.Buffer:getByte(buf, n) == 13 and _g.jk.lang.Buffer:getByte(buf, n + 1) == 10 and _g.jk.lang.Buffer:getByte(buf, n + 2) == 13 and _g.jk.lang.Buffer:getByte(buf, n + 3) == 10 then
			v = true
			do break end
		end
		do n = n + 1 end
	end
	do return v end
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser:parseResponseHeader(buf)
	local i = 0
	local p = _util:convert_to_integer(48)
	local v = nil
	local first = true
	local isChunked = false
	while true do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		while (function()
			p = _g.jk.lang.Buffer:getByte(buf, i)
			do return p end
		end)() ~= 0 do
			if p == 13 then
			elseif p == 10 then
				do i = i + 1 end
				do break end
			else
				do sb:appendCharacter(p) end
			end
			do i = i + 1 end
		end
		do
			local t = sb:toString()
			if _g.jk.lang.String:isEmpty(t) then
				do break end
			end
			if first then
				local comps = _g.jk.lang.String:split(t, 32, 3)
				v = _g.jk.ws.client.WSSocketGeneric.HTTPClientResponse._construct0(_g.jk.ws.client.WSSocketGeneric.HTTPClientResponse._create())
				do v:setHttpVersion(_g.jk.lang.Vector:get(comps, 0)) end
				do v:setHttpStatus(_g.jk.lang.Vector:get(comps, 1)) end
				do v:setHttpStatusDescription(_g.jk.lang.Vector:get(comps, 2)) end
			else
				local comps = _g.jk.lang.String:split(t, 58, 2)
				local key = _g.jk.lang.Vector:get(comps, 0)
				if _g.jk.lang.String:isEmpty(key) == false then
					local val = _g.jk.lang.String:strip(_g.jk.lang.Vector:get(comps, 1))
					do v:addHeader(key, val) end
					if isChunked == false and _g.jk.lang.String:equalsIgnoreCase(key, "transfer-encoding") then
						if val == "chunked" then
							isChunked = true
						end
					elseif self.contentLength < 1 and _g.jk.lang.String:equalsIgnoreCase(key, "content-length") then
						self.contentLength = _g.jk.lang.String:toInteger(val)
					end
				end
			end
			first = false
		end
	end
	do
		local l = _g.jk.lang.Buffer:getSize(buf) - i
		if l > 0 then
			self.receivedData = _g.jk.lang.Buffer:getSubBuffer(buf, i, l, false)
		else
			self.receivedData = nil
		end
		self.isChunked = isChunked
		do return v end
	end
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser:getChunk()
	if self.receivedData == nil then
		do return nil end
	end
	do
		local i = 0
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		while true do
			local p = _g.jk.lang.Buffer:getByte(self.receivedData, i)
			if p == 13 then
			elseif p == 10 then
				do i = i + 1 end
				do break end
			else
				do sb:appendCharacter(p) end
			end
			do i = i + 1 end
			if sb:count() >= 16 then
				do return nil end
			end
		end
		do
			local cl = -1
			local t = _g.jk.lang.String:strip(sb:toString())
			if _g.jk.lang.String:isEmpty(t) == false then
				cl = _g.jk.lang.String:toIntegerFromHex(t)
			end
			do
				local chunk = _g.jk.ws.client.WSSocketGeneric.HTTPResponseParser.Chunk._construct0(_g.jk.ws.client.WSSocketGeneric.HTTPResponseParser.Chunk._create())
				if cl > 0 then
					if _g.jk.lang.Buffer:getSize(self.receivedData) - i < cl + 2 then
						chunk.completed = false
						do return chunk end
					end
					chunk.data = _util:allocate_buffer(cl)
					do _g.jk.lang.Buffer:copyFrom(chunk.data, self.receivedData, i, 0, cl) end
					i = i + cl
				end
				while i < _g.jk.lang.Buffer:getSize(self.receivedData) and (_g.jk.lang.Buffer:getByte(self.receivedData, i) == 13 or _g.jk.lang.Buffer:getByte(self.receivedData, i) == 10) do
					do i = i + 1 end
				end
				do
					local rem = _g.jk.lang.Buffer:getSize(self.receivedData) - i
					if rem > 0 then
						local tmp = self.receivedData
						self.receivedData = _util:allocate_buffer(rem)
						do _g.jk.lang.Buffer:copyFrom(self.receivedData, tmp, i, 0, rem) end
					else
						self.receivedData = nil
					end
					do return chunk end
				end
			end
		end
	end
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser:onDataReceived(buf, size)
	if size > 0 then
		self.receivedData = _g.jk.lang.Buffer:append(self.receivedData, buf, size)
	end
	if self.headers == nil then
		if self:hasEndOfHeaders(self.receivedData, _g.jk.lang.Buffer:getSize(self.receivedData)) then
			self.headers = self:parseResponseHeader(self.receivedData)
		end
	end
	if self.isChunked then
		while true do
			local r = self:getChunk()
			if r ~= nil then
				if not r.completed then
					do break end
				end
				do
					local sz = _g.jk.lang.Buffer:getSize(r.data)
					self.dataCounter = self.dataCounter + sz
					do self:onBodyDataReceived(r.data, sz) end
				end
			else
				do self:onEndOfResponse() end
				do break end
			end
			if not (self.receivedData ~= nil) then
				do break end
			end
		end
	elseif self.contentLength > 0 then
		local rsz = _g.jk.lang.Buffer:getSize(self.receivedData)
		if rsz > 0 then
			if self.contentLength <= 0 or self.dataCounter + rsz <= self.contentLength then
				local v = self.receivedData
				self.receivedData = nil
				self.dataCounter = self.dataCounter + rsz
				do self:onBodyDataReceived(v, rsz) end
			else
				local vsz = self.contentLength - self.dataCounter
				local v = _g.jk.lang.Buffer:getSubBuffer(self.receivedData, 0, vsz, false)
				self.receivedData = _g.jk.lang.Buffer:getSubBuffer(self.receivedData, vsz, rsz - vsz, false)
				self.dataCounter = self.dataCounter + vsz
				do self:onBodyDataReceived(v, vsz) end
			end
		end
		if self.dataCounter >= self.contentLength then
			do self:onEndOfResponse() end
		end
	else
		do self:onEndOfResponse() end
	end
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser:onBodyDataReceived(buffer, size)
	self.bodyData = _g.jk.lang.Buffer:append(self.bodyData, buffer, -1)
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser:onEndOfResponse()
	self.endOfResponse = true
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser:getEndOfResponse()
	do return self.endOfResponse end
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser:setEndOfResponse(v)
	self.endOfResponse = v
	do return self end
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser:getAborted()
	do return self.aborted end
end

function jk.ws.client.WSSocketGeneric.HTTPResponseParser:setAborted(v)
	self.aborted = v
	do return self end
end

function jk.ws.client.WSSocketGeneric:_construct0()
	jk.ws.client.WSSocketGeneric._init(self)
	do _g.jk.ws.client.WSSocket._construct0(self) end
	self.key = _g.jk.ws.client.WSSocketGeneric:generateKey()
	self.accept = _g.jk.ws.client.WSSocketGeneric:getAcceptValueForKey(self.key)
	return self
end

function jk.ws.client.WSSocketGeneric:getAcceptValueForKey(key)
	local shaEncoder = _g.jk.sha.SHAEncoder:create()
	if not (shaEncoder ~= nil) then
		do return nil end
	end
	do return _g.jk.base64.Base64Encoder:encode(shaEncoder:encodeAsBuffer(_g.jk.lang.String:toUTF8Buffer(_g.jk.lang.String:safeString(key) .. _g.jk.lang.String:safeString(_g.jk.ws.client.WSSocketGeneric.WEBSOCKET_GUID)), _g.jk.sha.SHAEncoder.SHA1)) end
end

function jk.ws.client.WSSocketGeneric:generateKey()
	do return _g.jk.base64.Base64Encoder:encode(_g.jk.lang.String:toUTF8Buffer("EXTREMEPERFORMED")) end
end

function jk.ws.client.WSSocketGeneric:createOpenHandshakeHTTPRequest(url, key)
	if not (url ~= nil and key ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("GET ") end
		do
			local path = url:toStringNohost()
			if _g.jk.lang.String:isEmpty(path) then
				do sb:appendCharacter(47) end
			else
				if _g.jk.lang.String:getIndexOfCharacter(path, 47, 0) ~= 0 then
					do sb:appendCharacter(47) end
				end
				do sb:appendString(path) end
			end
			do sb:appendString(" HTTP/1.1\r\n") end
			do sb:appendString("Host: ") end
			do sb:appendString(url:getHost()) end
			do
				local port = url:getPort()
				if not (port == nil) then
					do sb:appendCharacter(58) end
					do sb:appendString(port) end
				end
				do sb:appendString("\r\n") end
				do sb:appendString("Upgrade: websocket\r\n") end
				do sb:appendString("Connection: Upgrade\r\n") end
				do sb:appendString("Sec-WebSocket-Key: ") end
				do sb:appendString(key) end
				do sb:appendString("\r\nSec-WebSocket-Version: 13\r\n\r\n") end
				do return _g.jk.lang.String:toUTF8Buffer(sb:toString()) end
			end
		end
	end
end

function jk.ws.client.WSSocketGeneric:createOpenHandshakeHTTPResponse(key)
	if not (key ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("HTTP/1.1 101 Switching Protocols\r\n") end
		do sb:appendString("Upgrade: websocket\r\n") end
		do sb:appendString("Connection: Upgrade\r\n") end
		do sb:appendString("Sec-WebSocket-Accept: ") end
		do sb:appendString(_g.jk.ws.client.WSSocketGeneric:getAcceptValueForKey(key)) end
		do sb:appendString("\r\n\r\n") end
		do return _g.jk.lang.String:toUTF8Buffer(sb:toString()) end
	end
end

function jk.ws.client.WSSocketGeneric:generateMaskingKey()
	do return _g.jk.lang.String:toUTF8Buffer("byte") end
end

function jk.ws.client.WSSocketGeneric:processData(data, size)
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
	while true do
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
				else
					maskingBuffer = _g.jk.lang.Buffer:allocate(4)
				end
				payloadLength = _vm:bitwise_and(b, 127)
				if payloadLength >= 0 and payloadLength < 126 then
					do p = p + 1 end
					if maskingBuffer ~= nil then
						lastMaskingBufferIndex = p + 3
					end
					goto _continue1
				elseif payloadLength == 126 then
					local v = 0
					v = _vm:bitwise_or(v, _vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 1), _vm:bitwise_left_shift(255, 8)))
					v = _vm:bitwise_or(v, _vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 2), 255))
					payloadLength = v
					p = p + 3
					if maskingBuffer ~= nil then
						lastMaskingBufferIndex = p + 3
					end
					goto _continue1
				elseif payloadLength == 127 then
					local v = 0
					v = _vm:bitwise_or(v, _vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 1), _vm:bitwise_left_shift(127, 56)))
					v = _vm:bitwise_or(v, _vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 2), _vm:bitwise_left_shift(255, 48)))
					v = _vm:bitwise_or(v, _vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 3), _vm:bitwise_left_shift(255, 40)))
					v = _vm:bitwise_or(v, _vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 4), _vm:bitwise_left_shift(255, 32)))
					v = _vm:bitwise_or(v, _vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 5), _vm:bitwise_left_shift(255, 24)))
					v = _vm:bitwise_or(v, _vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 6), _vm:bitwise_left_shift(255, 16)))
					v = _vm:bitwise_or(v, _vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 7), _vm:bitwise_left_shift(255, 8)))
					v = _vm:bitwise_or(v, _vm:bitwise_and(_g.jk.lang.Buffer:getByte(nbuffer, p + 8), 255))
					payloadLength = v
					p = p + 9
					if maskingBuffer ~= nil then
						lastMaskingBufferIndex = p + 3
					end
					goto _continue1
				end
				do return false end
			elseif p <= lastMaskingBufferIndex then
				do _g.jk.lang.Buffer:setByte(maskingBuffer, mi, b) end
				do mi = mi + 1 end
			else
				do break end
			end
			do p = p + 1 end
			::_continue1::
		end
		do
			local frameLength = p + payloadLength
			if nsize < frameLength then
				self.leftOverBuffer = _g.jk.lang.Buffer:allocate(nsize)
				do _g.jk.lang.Buffer:copyFrom(self.leftOverBuffer, nbuffer, 0, 0, nsize) end
				do self.frameNo = self.frameNo + 1 end
				do break end
			end
			payloadBuffer = _g.jk.lang.Buffer:allocate(payloadLength)
			do _g.jk.lang.Buffer:copyFrom(payloadBuffer, nbuffer, p, 0, payloadLength) end
			do self:processFrame(fin, rsv1, rsv2, rsv3, opcode, mask, maskingBuffer, payloadLength, payloadBuffer) end
			self.frameNo = 1
			if nsize > frameLength then
				local losize = nsize - frameLength
				local nnb = _g.jk.lang.Buffer:allocate(losize)
				do _g.jk.lang.Buffer:copyFrom(nnb, nbuffer, frameLength, 0, losize) end
				nbuffer = nnb
				nsize = losize
			else
				do break end
			end
		end
	end
	do return true end
end

function jk.ws.client.WSSocketGeneric:processFrame(fin, rsv1, rsv2, rsv3, opcode, mask, maskingBuffer, payloadLength, payloadBuffer)
	if fin == 0 then
		do return end
	end
	do self:onNewMessage(_g.jk.ws.client.WSSocketGeneric.MyWSMessage:create(fin, rsv1, rsv2, rsv3, opcode, maskingBuffer, payloadBuffer)) end
end

function jk.ws.client.WSSocketGeneric:onNewMessage(message)
	if message:isCloseControlFrame() then
		do self:close() end
	elseif message:isPingControlFrame() then
		do self:doSend(_g.jk.ws.client.WSSocketGeneric.MyWSMessage:forPongControlFrame()) end
	elseif message:isPongControlFrame() then
	else
		local cb = self:getOnMessageCallback()
		if cb ~= nil then
			if message:isDataText() then
				do cb(_g.jk.ws.client.WSMessage:forStringData(_g.jk.lang.String:forUTF8Buffer(message:getPayloadBuffer()))) end
			else
				do cb(_g.jk.ws.client.WSMessage:forData(message:getPayloadBuffer())) end
			end
			do return end
		end
	end
end

function jk.ws.client.WSSocketGeneric:connect(url)
	if self.client ~= nil then
		do self:closeWithError(_g.jk.lang.Error:forCode("alreadyConnected", nil)) end
	end
	if not ((function()
		self.client = _g.jk.socket.async.TCPClient:instance()
		do return self.client end
	end)() ~= nil) then
		do self:closeWithError(_g.jk.lang.Error:forCode("failedToCreateTcpClient", nil)) end
		do return end
	end
	do
		local u = _g.jk.url.URL:forString(url, false)
		if not (u ~= nil) then
			do self:closeWithError(_g.jk.lang.Error:forCode("invalidUrl", nil)) end
			do return end
		end
		do
			local port = u:getPortInt()
			if port < 1 then
				port = 80
			end
			do
				local scheme = u:getScheme()
				if _g.jk.lang.String:equals("https", scheme) or _g.jk.lang.String:equals("wss", scheme) then
					do self.client:connectSSL(u:getHost(), port, function(e)
						do self:handleConnect(u, e) end
					end) end
					do return end
				end
				do self.client:connect(u:getHost(), port, function(e)
					do self:handleConnect(u, e) end
				end) end
			end
		end
	end
end

function jk.ws.client.WSSocketGeneric:closeWithError(error)
	local cc = self.client
	self.client = nil
	if error ~= nil then
		local ecb = self:getOnErrorCallback()
		if ecb ~= nil then
			do ecb(error) end
		end
	end
	if cc ~= nil then
		local ccb = self:getOnCloseCallback()
		if ccb ~= nil then
			do ccb(_g.jk.ws.client.WSSocketGeneric.MyWSCloseEvent._construct0(_g.jk.ws.client.WSSocketGeneric.MyWSCloseEvent._create()):setStatusCode(_g.jk.ws.client.WSCloseEvent.CLOSE_ABNORMAL)) end
		end
		do cc:disconnect(nil) end
	end
end

function jk.ws.client.WSSocketGeneric:closeWithoutError()
	do self:closeWithError(nil) end
end

function jk.ws.client.WSSocketGeneric:handleConnect(u, error)
	if error ~= nil then
		do self:closeWithError(error) end
		do return end
	end
	if not (self.client ~= nil) then
		do self:closeWithError(_g.jk.lang.Error:forCode("nullClient", nil)) end
		do return end
	end
	self.parser = _g.jk.ws.client.WSSocketGeneric.HTTPResponseParser._construct0(_g.jk.ws.client.WSSocketGeneric.HTTPResponseParser._create())
	do self.client:receive(function(data, size)
		do self:onOpenHandshakeResponse(data, size) end
	end) end
	do
		local v = _g.jk.ws.client.WSSocketGeneric:createOpenHandshakeHTTPRequest(u, self.key)
		do self.client:send(v, #v, function(oe)
			if oe ~= nil then
				do self:closeWithError(oe) end
			end
		end) end
	end
end

function jk.ws.client.WSSocketGeneric:onOpenHandshakeResponse(data, size)
	if not (self.parser ~= nil) then
		do return end
	end
	if size < 1 then
		do self:closeWithError(_g.jk.lang.Error:forCode("dataSizeInvalid", nil)) end
		do return end
	end
	do self.parser:onDataReceived(data, size) end
	if not self.parser:getEndOfResponse() then
		do return end
	end
	do
		local headers = self.parser.headers
		do self.parser:reset() end
		self.parser = nil
		do
			local statusCode = headers:getHttpStatus()
			if not (statusCode == "101") then
				do self:closeWithError(_g.jk.lang.Error:forCode("invalidWebsocketHttpStatus", nil)) end
				do return end
			end
			if _g.jk.lang.String:equalsIgnoreCase("websocket", headers:getHeader("upgrade")) == false then
				do self:closeWithError(_g.jk.lang.Error:forCode("invalidWebsocketHeader1", nil)) end
				do return end
			elseif _g.jk.lang.String:equalsIgnoreCase("websocket", headers:getHeader("upgrade")) == false then
				do self:closeWithError(_g.jk.lang.Error:forCode("invalidWebsocketHeader2", nil)) end
				do return end
			elseif _g.jk.lang.String:equalsIgnoreCase("upgrade", headers:getHeader("connection")) == false then
				do self:closeWithError(_g.jk.lang.Error:forCode("invalidWebsocketHeader3", nil)) end
				do return end
			elseif _g.jk.lang.String:equals(self.accept, headers:getHeader("sec-websocket-accept")) == false then
				do self:closeWithError(_g.jk.lang.Error:forCode("invalidWebsocketHeader4", nil)) end
				do return end
			end
			do self.client:receive(function(_p0, _p1)
				do self:receiveData(_p0, _p1) end
			end) end
			do
				local ocb = self:getOnOpenCallback()
				if ocb ~= nil then
					do ocb() end
				end
			end
		end
	end
end

function jk.ws.client.WSSocketGeneric:receiveData(buffer, size)
	if not (buffer ~= nil) or size < 1 then
		do self:closeWithError(_g.jk.lang.Error:forCode("closedByServer", nil)) end
		do return end
	end
	if self:processData(buffer, size) == false then
		do self:closeWithError(_g.jk.lang.Error:forCode("invalidDataReceived", nil)) end
		do return end
	end
	if self.client ~= nil then
		do self.client:receive(function(_p0, _p1)
			do self:receiveData(_p0, _p1) end
		end) end
	end
end

function jk.ws.client.WSSocketGeneric:send(message)
	if not (message ~= nil) then
		do return end
	end
	if not (self.client ~= nil) then
		do return end
	end
	do
		local v = nil
		if message:getIsPing() then
			v = _g.jk.ws.client.WSSocketGeneric.MyWSMessage:forPingControlFrame()
		elseif message:isText() then
			v = _g.jk.ws.client.WSSocketGeneric.MyWSMessage:create(1, 0, 0, 0, 1, _g.jk.ws.client.WSSocketGeneric:generateMaskingKey(), message:getData())
		else
			v = _g.jk.ws.client.WSSocketGeneric.MyWSMessage:create(1, 0, 0, 0, 2, _g.jk.ws.client.WSSocketGeneric:generateMaskingKey(), message:getData())
		end
		do self:doSend(v) end
	end
end

function jk.ws.client.WSSocketGeneric:doSend(message)
	if not (message ~= nil) then
		do return end
	end
	do
		local data = message:toBuffer()
		do self.client:send(data, #data, function(error)
			if error ~= nil then
				do self:closeWithError(error) end
			end
		end) end
	end
end

function jk.ws.client.WSSocketGeneric:closeWithReason(statusCode, reason, callback)
	if not (self.client ~= nil) then
		do return end
	end
	do
		local data = _g.jk.ws.client.WSSocketGeneric.MyWSMessage:forCloseControlFrame(_g.jk.ws.client.WSCloseEvent.CLOSE_NORMAL, nil):toBuffer()
		do self.client:send(data, #data, function(error)
			if error ~= nil then
				do self:closeWithError(error) end
			else
				do self:closeWithoutError() end
			end
			if callback ~= nil then
				do callback() end
			end
		end) end
	end
end

function jk.ws.client.WSSocketGeneric:close()
	do self:closeWithoutError() end
end

jk.ws.client.WSClient = {}
jk.ws.client.WSClient.__index = jk.ws.client.WSClient
_vm:set_metatable(jk.ws.client.WSClient, {})

jk.ws.client.WSClient.STATE_STOPPED = 0
jk.ws.client.WSClient.STATE_DISCONNECTED = 1
jk.ws.client.WSClient.STATE_CONNECTING = 2
jk.ws.client.WSClient.STATE_CONNECTED = 3

function jk.ws.client.WSClient._create()
	local v = _vm:set_metatable({}, jk.ws.client.WSClient)
	return v
end

function jk.ws.client.WSClient:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.ws.client.WSClient'
	self['_isType.jk.ws.client.WSClient'] = true
	self['_isType.jk.ws.WSProtocolSource'] = true
	self.url = nil
	self.eventLoop = nil
	self.socket = nil
	self.state = _g.jk.ws.client.WSClient.STATE_STOPPED
	self.lastActivity = 0
	self.reconnectInterval = 5000000
	self.connectionTimeoutInterval = 30000000
	self.pingInterval = 30000000
	self.protocol = nil
	self.stateChangeHandler = nil
	self.nextTick = 0
end

function jk.ws.client.WSClient:_construct0()
	jk.ws.client.WSClient._init(self)
	return self
end

function jk.ws.client.WSClient:getTickInterval()
	if self.state == _g.jk.ws.client.WSClient.STATE_STOPPED then
		do return 0 end
	end
	if self.state == _g.jk.ws.client.WSClient.STATE_DISCONNECTED then
		do return self.reconnectInterval end
	end
	if self.state == _g.jk.ws.client.WSClient.STATE_CONNECTING then
		do return self.connectionTimeoutInterval end
	end
	if self.state == _g.jk.ws.client.WSClient.STATE_CONNECTED then
		do return self.pingInterval end
	end
	do return 0 end
end

function jk.ws.client.WSClient:start(url, eventLoop, protocol)
	self.url = url
	self.eventLoop = eventLoop
	self.protocol = protocol
	if protocol ~= nil then
		do protocol:setSource(self) end
	end
	do self:updateState(_g.jk.ws.client.WSClient.STATE_DISCONNECTED) end
	do self:tick(self.nextTick) end
end

function jk.ws.client.WSClient:stop()
	do self:closeConnection() end
	if self.protocol ~= nil then
		do self.protocol:setSource(nil) end
	end
	self.protocol = nil
	do self:updateState(_g.jk.ws.client.WSClient.STATE_STOPPED) end
	self.url = nil
	self.eventLoop = nil
end

function jk.ws.client.WSClient:closeConnection()
	if self.socket ~= nil then
		do self.socket:close() end
	end
	self.socket = nil
	do self:updateState(_g.jk.ws.client.WSClient.STATE_DISCONNECTED) end
end

function jk.ws.client.WSClient:updateState(state)
	if self.state ~= state then
		self.state = state
		do self:onStateChanged(state) end
		do self:scheduleTick() end
	end
end

function jk.ws.client.WSClient:failConnection(error)
	if error ~= nil then
		do self:onConnectionError(error) end
	end
	do self:closeConnection() end
end

function jk.ws.client.WSClient:scheduleTick()
	if self.eventLoop ~= nil then
		local ti = self:getTickInterval()
		if ti > 0 then
			do self.nextTick = self.nextTick + 1 end
			do
				local tc = self.nextTick
				do self.eventLoop:runScheduled(self:getTickInterval(), _g.jk.lang.RunnableFunction:forFunction(function()
					do self:tick(tc) end
				end)) end
			end
		end
	end
end

function jk.ws.client.WSClient:tick(tickId)
	if tickId < self.nextTick then
		do return end
	end
	if self.state == _g.jk.ws.client.WSClient.STATE_STOPPED then
		do return end
	end
	do self:doTick() end
	do self:scheduleTick() end
end

function jk.ws.client.WSClient:onActivity()
	self.lastActivity = _g.jk.time.SystemClock:asUTCSeconds()
end

function jk.ws.client.WSClient:doTick()
	if self.state == _g.jk.ws.client.WSClient.STATE_DISCONNECTED then
		self.socket = _g.jk.ws.client.WSSocket:create()
		if not (self.socket ~= nil) then
			do self:failConnection(_g.jk.lang.Error:forCode("failedToCreateWebSocket", nil)) end
			do return end
		end
		do self:updateState(_g.jk.ws.client.WSClient.STATE_CONNECTING) end
		do self.socket:setOnOpenCallback(function()
			do self:onActivity() end
			do self:updateState(_g.jk.ws.client.WSClient.STATE_CONNECTED) end
			do self:onConnectionOpened() end
		end) end
		do self.socket:setOnCloseCallback(function(event)
			do self:closeConnection() end
			do self:onConnectionClosed() end
		end) end
		do self.socket:setOnMessageCallback(function(event)
			do self:onActivity() end
			do self:onConnectionMessage(event) end
		end) end
		do self.socket:setOnErrorCallback(function(error)
			do self:failConnection(error) end
		end) end
		do self.socket:connect(self.url) end
		do return end
	end
	if self.state == _g.jk.ws.client.WSClient.STATE_CONNECTING then
		do self:failConnection(_g.jk.lang.Error:forCode("connectionTimeout", nil)) end
		do return end
	end
	if self.state == _g.jk.ws.client.WSClient.STATE_CONNECTED then
		if _g.jk.time.SystemClock:asUTCSeconds() - self.lastActivity >= _util:convert_to_integer(self.pingInterval / 1000000) then
			do self:sendPing() end
		end
		do return end
	end
end

function jk.ws.client.WSClient:sendPing()
	do self:sendMessage(_g.jk.ws.client.WSMessage:forPingMessage()) end
end

function jk.ws.client.WSClient:sendString(data)
	do self:sendMessage(_g.jk.ws.client.WSMessage:forStringData(data)) end
end

function jk.ws.client.WSClient:sendBuffer(data)
	do self:sendMessage(_g.jk.ws.client.WSMessage:forData(data)) end
end

function jk.ws.client.WSClient:sendMessage(message)
	do self:onActivity() end
	if self.socket ~= nil then
		do self.socket:send(message) end
	end
end

function jk.ws.client.WSClient:onConnectionOpened()
	if self.protocol ~= nil then
		do self.protocol:onConnectionOpened() end
	end
end

function jk.ws.client.WSClient:onConnectionClosed()
	if self.protocol ~= nil then
		do self.protocol:onConnectionClosed() end
	end
end

function jk.ws.client.WSClient:onConnectionMessage(message)
	if self.protocol ~= nil and message ~= nil then
		if message:isText() then
			do self.protocol:onStringMessage(message:getDataAsString()) end
		else
			do self.protocol:onBinaryMessage(message:getData()) end
		end
	end
end

function jk.ws.client.WSClient:onConnectionError(error)
	if self.protocol ~= nil then
		do self.protocol:onConnectionError(error) end
	end
end

function jk.ws.client.WSClient:onStateChanged(newState)
	if self.stateChangeHandler ~= nil then
		do self.stateChangeHandler(newState) end
	end
end

function jk.ws.client.WSClient:getReconnectInterval()
	do return self.reconnectInterval end
end

function jk.ws.client.WSClient:setReconnectInterval(v)
	self.reconnectInterval = v
	do return self end
end

function jk.ws.client.WSClient:getConnectionTimeoutInterval()
	do return self.connectionTimeoutInterval end
end

function jk.ws.client.WSClient:setConnectionTimeoutInterval(v)
	self.connectionTimeoutInterval = v
	do return self end
end

function jk.ws.client.WSClient:getPingInterval()
	do return self.pingInterval end
end

function jk.ws.client.WSClient:setPingInterval(v)
	self.pingInterval = v
	do return self end
end

function jk.ws.client.WSClient:getProtocol()
	do return self.protocol end
end

function jk.ws.client.WSClient:setProtocol(v)
	self.protocol = v
	do return self end
end

function jk.ws.client.WSClient:getStateChangeHandler()
	do return self.stateChangeHandler end
end

function jk.ws.client.WSClient:setStateChangeHandler(v)
	self.stateChangeHandler = v
	do return self end
end
