jk = jk or {}

jk.http = jk.http or {}

jk.http.server = jk.http.server or {}

jk.http.server.HTTPServerRequestHandler = {}

jk.http.server.HTTPServerComponent = {}

jk.http.server.HTTPServerRequestHandlerAdapter = {}
jk.http.server.HTTPServerRequestHandlerAdapter.__index = jk.http.server.HTTPServerRequestHandlerAdapter
_vm:set_metatable(jk.http.server.HTTPServerRequestHandlerAdapter, {})

function jk.http.server.HTTPServerRequestHandlerAdapter._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequestHandlerAdapter)
	return v
end

function jk.http.server.HTTPServerRequestHandlerAdapter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequestHandlerAdapter'
	self['_isType.jk.http.server.HTTPServerRequestHandlerAdapter'] = true
	self['_isType.jk.http.server.HTTPServerRequestHandler'] = true
	self['_isType.jk.http.server.HTTPServerComponent'] = true
	self.server = nil
	self.logContext = nil
end

function jk.http.server.HTTPServerRequestHandlerAdapter:_construct0()
	jk.http.server.HTTPServerRequestHandlerAdapter._init(self)
	return self
end

function jk.http.server.HTTPServerRequestHandlerAdapter:getServer()
	do return self.server end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:isInitialized()
	if self.server == nil then
		do return false end
	end
	do return true end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:initialize(server)
	self.server = server
	if server ~= nil then
		self.logContext = server:getLogContext()
	else
		self.logContext = nil
	end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onMaintenance()
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onRefresh()
end

function jk.http.server.HTTPServerRequestHandlerAdapter:cleanup()
	self.server = nil
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onGET1(req)
	do return false end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onGET2(req, next)
	if self:onGET1(req) == false then
		do next() end
	end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onPOST1(req)
	do return false end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onPOST2(req, next)
	if self:onPOST1(req) == false then
		do next() end
	end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onPUT1(req)
	do return false end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onPUT2(req, next)
	if self:onPUT1(req) == false then
		do next() end
	end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onDELETE1(req)
	do return false end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onDELETE2(req, next)
	if self:onDELETE1(req) == false then
		do next() end
	end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onPATCH1(req)
	do return false end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:onPATCH2(req, next)
	if self:onPATCH1(req) == false then
		do next() end
	end
end

function jk.http.server.HTTPServerRequestHandlerAdapter:handleRequest(req, next)
	if req == nil then
		do next() end
	elseif req:isGET() then
		do self:onGET2(req, next) end
	elseif req:isPOST() then
		do self:onPOST2(req, next) end
	elseif req:isPUT() then
		do self:onPUT2(req, next) end
	elseif req:isDELETE() then
		do self:onDELETE2(req, next) end
	elseif req:isPATCH() then
		do self:onPATCH2(req, next) end
	else
		do next() end
	end
end

jk.http.server.HTTPServerResponseWorker = {}
jk.http.server.HTTPServerResponseWorker.__index = jk.http.server.HTTPServerResponseWorker
_vm:set_metatable(jk.http.server.HTTPServerResponseWorker, {})

function jk.http.server.HTTPServerResponseWorker._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerResponseWorker)
	return v
end

function jk.http.server.HTTPServerResponseWorker:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerResponseWorker'
	self['_isType.jk.http.server.HTTPServerResponseWorker'] = true
	self.context = nil
	self.session = nil
	self.startTime = nil
end

function jk.http.server.HTTPServerResponseWorker:_construct0()
	jk.http.server.HTTPServerResponseWorker._init(self)
	return self
end

function jk.http.server.HTTPServerResponseWorker:setContext(v)
	self.context = v
	do return self end
end

function jk.http.server.HTTPServerResponseWorker:getContext()
	do return self.context end
end

function jk.http.server.HTTPServerResponseWorker:setSession(v)
	self.session = v
	do return self end
end

function jk.http.server.HTTPServerResponseWorker:getSession()
	do return self.session end
end

function jk.http.server.HTTPServerResponseWorker:getMimeType()
end

function jk.http.server.HTTPServerResponseWorker:getWorkerDescription()
end

function jk.http.server.HTTPServerResponseWorker:onStart()
	self.startTime = _g.jk.time.SystemClock:asTimeValue()
	do _g.jk.log.Log:debug(self.context, "Response worker `" .. _g.jk.lang.String:safeString(self:getWorkerDescription()) .. "' started.") end
	do self.session:writeHeader() end
end

function jk.http.server.HTTPServerResponseWorker:tick()
	do self:execute() end
	do return false end
end

function jk.http.server.HTTPServerResponseWorker:execute()
end

function jk.http.server.HTTPServerResponseWorker:onEnd()
	do self.session:_end() end
	do
		local diff = _g.jk.text.StringUtil:formatLongInteger(_g.jk.lang.TimeValue:diff(_g.jk.time.SystemClock:asTimeValue(), self.startTime), 44)
		do _g.jk.log.Log:debug(self.context, "Response worker `" .. _g.jk.lang.String:safeString(self:getWorkerDescription()) .. "' ended. Wrote " .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:formatInteger(self.session:getTotalBytes(), 44)) .. " bytes. Duration=" .. _g.jk.lang.String:safeString(diff) .. " us") end
	end
end

function jk.http.server.HTTPServerResponseWorker:abort()
	if self.session ~= nil then
		do self.session:_end() end
	end
end

jk.http.server.HTTPServerResponseSession = {}
jk.http.server.HTTPServerResponseSession.__index = jk.http.server.HTTPServerResponseSession
_vm:set_metatable(jk.http.server.HTTPServerResponseSession, {})

function jk.http.server.HTTPServerResponseSession._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerResponseSession)
	return v
end

function jk.http.server.HTTPServerResponseSession:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerResponseSession'
	self['_isType.jk.http.server.HTTPServerResponseSession'] = true
	self.socket = nil
	self.server = nil
	self.request = nil
	self.response = nil
	self.totalBytes = 0
end

function jk.http.server.HTTPServerResponseSession:_construct0()
	jk.http.server.HTTPServerResponseSession._init(self)
	return self
end

function jk.http.server.HTTPServerResponseSession:createHeaderBuffer()
	local ver = nil
	local met = nil
	if self.request ~= nil then
		ver = self.request:getVersion()
		met = self.request:getMethod()
	end
	if ver == "HTTP/0.9" then
		do return nil end
	end
	do
		local resp = self.response
		if resp == nil then
			resp = _g.jk.http.server.HTTPServerResponse:forTextString("")
		end
		do
			local status = resp:getStatus()
			local headers = resp:getHeaders()
			if status == nil or _g.jk.lang.String:getLength(status) < 1 then
				status = "200"
				do resp:setStatus(status) end
			end
			do
				local fs = _g.jk.http.server.HTTPServerResponse:getFullStatus(status)
				local reply = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				if ver == nil or _g.jk.lang.String:getLength(ver) < 1 then
					do reply:appendString("HTTP/1.1") end
				else
					do reply:appendString(ver) end
				end
				do reply:appendCharacter(32) end
				do reply:appendString(fs) end
				do reply:appendCharacter(13) end
				do reply:appendCharacter(10) end
				if headers ~= nil then
					local it = headers:iterate()
					while it ~= nil do
						local kvp = it:next()
						if kvp == nil then
							do break end
						end
						do reply:appendString(kvp.key) end
						do reply:appendCharacter(58) end
						do reply:appendCharacter(32) end
						do reply:appendString(kvp.value) end
						do reply:appendCharacter(13) end
						do reply:appendCharacter(10) end
					end
				end
				do reply:appendString("Connection: close\r\n") end
				do reply:appendString("Cache-Control: no-store\r\n") end
				if self.server ~= nil then
					local name = self.server:getServerName()
					if _g.jk.lang.String:isNotEmpty(name) then
						do reply:appendString("Server: ") end
						do reply:appendString(name) end
						do reply:appendCharacter(13) end
						do reply:appendCharacter(10) end
					end
				end
				do reply:appendString("Date: ") end
				do reply:appendString(_g.jk.time.format.VerboseDateTimeString:forUTCNow()) end
				do reply:appendCharacter(13) end
				do reply:appendCharacter(10) end
				do reply:appendCharacter(13) end
				do reply:appendCharacter(10) end
				do return _g.jk.lang.String:toUTF8Buffer(reply:toString()) end
			end
		end
	end
end

function jk.http.server.HTTPServerResponseSession:writeHeader()
	local bb = self:createHeaderBuffer()
	if not (bb ~= nil) then
		do return true end
	end
	do return self:writeData(bb, -1) end
end

function jk.http.server.HTTPServerResponseSession:writeData(data, size)
	if not (self.socket ~= nil) then
		do return false end
	end
	if not (data ~= nil) then
		do return true end
	end
	do
		local sz = size
		if sz < 0 then
			sz = #data
		end
		do
			local r = self.socket:write(data, sz)
			if r > 0 then
				self.totalBytes = self.totalBytes + r
			end
			if r < sz then
				do return false end
			end
			do return true end
		end
	end
end

function jk.http.server.HTTPServerResponseSession:_end()
	if not (self.socket ~= nil) then
		do return end
	end
	do self.socket:close() end
	self.socket = nil
end

function jk.http.server.HTTPServerResponseSession:getSocket()
	do return self.socket end
end

function jk.http.server.HTTPServerResponseSession:setSocket(v)
	self.socket = v
	do return self end
end

function jk.http.server.HTTPServerResponseSession:getServer()
	do return self.server end
end

function jk.http.server.HTTPServerResponseSession:setServer(v)
	self.server = v
	do return self end
end

function jk.http.server.HTTPServerResponseSession:getRequest()
	do return self.request end
end

function jk.http.server.HTTPServerResponseSession:setRequest(v)
	self.request = v
	do return self end
end

function jk.http.server.HTTPServerResponseSession:getResponse()
	do return self.response end
end

function jk.http.server.HTTPServerResponseSession:setResponse(v)
	self.response = v
	do return self end
end

function jk.http.server.HTTPServerResponseSession:getTotalBytes()
	do return self.totalBytes end
end

function jk.http.server.HTTPServerResponseSession:setTotalBytes(v)
	self.totalBytes = v
	do return self end
end

jk.http.server.HTTPServerConnection = _g.jk.server.NetworkConnection._create()
jk.http.server.HTTPServerConnection.__index = jk.http.server.HTTPServerConnection
_vm:set_metatable(jk.http.server.HTTPServerConnection, {
	__index = _g.jk.server.NetworkConnection
})

function jk.http.server.HTTPServerConnection._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerConnection)
	return v
end

function jk.http.server.HTTPServerConnection:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerConnection'
	self['_isType.jk.http.server.HTTPServerConnection'] = true
	self.requests = 0
	self.responses = 0
	self.parser = nil
	self.currentRequest = nil
	self.closeAfterSend = false
	self.sendWritten = 0
	self.sendBodyBuffer = nil
	self.sendBody = nil
	self.sendBuffer = nil
	self.responseToSend = nil
	self.requestQueue = nil
	self.isWaitingForBodyReceiver = false
end

jk.http.server.HTTPServerConnection.ParserState = {}
jk.http.server.HTTPServerConnection.ParserState.__index = jk.http.server.HTTPServerConnection.ParserState
_vm:set_metatable(jk.http.server.HTTPServerConnection.ParserState, {})

function jk.http.server.HTTPServerConnection.ParserState._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerConnection.ParserState)
	return v
end

function jk.http.server.HTTPServerConnection.ParserState:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerConnection.ParserState'
	self['_isType.jk.http.server.HTTPServerConnection.ParserState'] = true
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

function jk.http.server.HTTPServerConnection.ParserState:_construct0()
	jk.http.server.HTTPServerConnection.ParserState._init(self)
	return self
end

function jk.http.server.HTTPServerConnection:_construct0()
	jk.http.server.HTTPServerConnection._init(self)
	do _g.jk.server.NetworkConnection._construct0(self) end
	self.parser = _g.jk.http.server.HTTPServerConnection.ParserState._construct0(_g.jk.http.server.HTTPServerConnection.ParserState._create())
	return self
end

function jk.http.server.HTTPServerConnection:getIsWaitingForBodyReceiver()
	do return self.isWaitingForBodyReceiver end
end

function jk.http.server.HTTPServerConnection:getHTTPServer()
	do return _vm:to_table_with_key(self:getManager(), '_isType.jk.http.server.HTTPServerBase') end
end

function jk.http.server.HTTPServerConnection:getWriteBufferSize()
	local server = self:getHTTPServer()
	if server == nil then
		do return 1024 * 512 end
	end
	do return server:getWriteBufferSize() end
end

function jk.http.server.HTTPServerConnection:getSmallBodyLimit()
	local server = self:getHTTPServer()
	if server == nil then
		do return 1024 * 32 end
	end
	do return server:getSmallBodyLimit() end
end

function jk.http.server.HTTPServerConnection:resetParser()
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
end

function jk.http.server.HTTPServerConnection:initialize()
	if not _g.jk.server.NetworkConnection.initialize(self) then
		do return false end
	end
	do self:updateListeningMode() end
	do return true end
end

function jk.http.server.HTTPServerConnection:updateListeningMode()
	local writeFlag = false
	local readFlag = true
	if self.responseToSend ~= nil then
		writeFlag = true
	end
	if self.isWaitingForBodyReceiver or self.closeAfterSend then
		readFlag = false
	end
	do
		local v = true
		if readFlag and writeFlag then
			v = self:enableReadWriteMode()
		elseif readFlag then
			v = self:enableReadMode()
		elseif writeFlag then
			v = self:enableWriteMode()
		else
			v = self:enableIdleMode()
		end
		if not v then
			do _g.jk.log.Log:error(self.logContext, "HTTPServerConnection updateListeningMode failed. Disconnecting client.") end
			do self:close() end
		end
	end
end

function jk.http.server.HTTPServerConnection:setBodyReceiver(stream)
	if self.isWaitingForBodyReceiver == false then
		if stream ~= nil then
			if stream:onDataStreamStart(0) then
				do stream:onDataStreamEnd() end
			end
		end
		do return end
	end
	self.parser.bodyStream = stream
	if stream ~= nil then
		self.isWaitingForBodyReceiver = false
		do self:updateListeningMode() end
		do
			local ll = self.parser.contentLength
			if self.parser.bodyIsChunked then
				ll = -1
			end
			if stream:onDataStreamStart(ll) == false then
				self.parser.bodyStream = nil
				do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil)) end
				do self:resetParser() end
				do return end
			end
			do
				local sbc = self.parser.savedBodyChunk
				self.parser.savedBodyChunk = nil
				if sbc ~= nil then
					do self:onBodyData(sbc, 0, #sbc) end
				end
			end
		end
	end
end

function jk.http.server.HTTPServerConnection:isExpectingBody()
	if self.parser.method == "POST" or self.parser.method == "PUT" or self.parser.method == "PATCH" or self.parser.contentLength > 0 or self.parser.bodyIsChunked then
		do return true end
	end
	do return false end
end

function jk.http.server.HTTPServerConnection:onHeadersDone()
	local hasBody = self:isExpectingBody()
	if hasBody then
		local sbl = self:getSmallBodyLimit()
		if sbl > 0 and self.parser.contentLength > 0 and self.parser.contentLength < sbl then
			self.parser.bodyBuffer = _util:allocate_buffer(self.parser.contentLength)
			do return end
		end
		self.isWaitingForBodyReceiver = true
	end
	do
		local req = _g.jk.http.server.HTTPServerRequest:forDetails(self.parser.method, self.parser.uri, self.parser.version, self.parser.headers)
		do self:onCompleteRequest(req) end
		if hasBody == false then
			do self:resetParser() end
		end
		do self:updateListeningMode() end
	end
end

function jk.http.server.HTTPServerConnection:onHeaderData(inputBuffer, offset, sz)
	if not (inputBuffer ~= nil) then
		do return end
	end
	do
		local p = 0
		while p < sz do
			local c = inputBuffer[p + offset + 1]
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
					do self:onHeadersDone() end
					if p < sz then
						do self:onData(inputBuffer, offset + p, sz - p) end
					end
					do return end
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
						do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(nil)) end
						do self:resetParser() end
						do return end
					end
					self.parser.headersDone = true
					do self:onHeadersDone() end
					if p < sz then
						do self:onData(inputBuffer, offset + p, sz - p) end
					end
					do return end
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
				if _g.jk.lang.String:equalsIgnoreCase(self.parser.key, "content-length") and value ~= nil then
					self.parser.contentLength = _g.jk.lang.String:toInteger(value)
				elseif _g.jk.lang.String:equalsIgnoreCase(self.parser.key, "transfer-encoding") and value ~= nil and _g.jk.lang.String:contains(value, "chunked") then
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
				do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(nil)) end
				do self:resetParser() end
				do return end
			end
			::_continue1::
		end
	end
end

function jk.http.server.HTTPServerConnection:onBodyData(inputBuffer, offset, sz)
	if not (inputBuffer ~= nil) then
		do return end
	end
	if not (sz > 0) then
		do return end
	end
	if self.parser.bodyBuffer == nil and self.parser.bodyStream == nil then
		do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(nil)) end
		do self:resetParser() end
		do return end
	end
	if self.parser.contentLength > 0 then
		local p = 0
		if self.parser.dataCounter + sz <= self.parser.contentLength then
			p = sz
		else
			p = self.parser.contentLength - self.parser.dataCounter
		end
		if self.parser.bodyBuffer ~= nil then
			do _g.jk.lang.Buffer:copyFrom(self.parser.bodyBuffer, inputBuffer, offset, self.parser.dataCounter, p) end
		elseif self.parser.bodyStream:onDataStreamContent(_g.jk.lang.Buffer:getSubBuffer(inputBuffer, offset, p, false), p) == false then
			do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil)) end
			self.parser.bodyStream = nil
			do self:resetParser() end
			do return end
		end
		self.parser.dataCounter = self.parser.dataCounter + p
		if self.parser.dataCounter >= self.parser.contentLength then
			self.parser.bodyDone = true
			if self.parser.bodyBuffer ~= nil then
				local req = _g.jk.http.server.HTTPServerRequest:forDetails(self.parser.method, self.parser.uri, self.parser.version, self.parser.headers)
				do req:setBodyBuffer(self.parser.bodyBuffer) end
				self.parser.bodyBuffer = nil
				do self:onCompleteRequest(req) end
				do self:resetParser() end
			else
				if self.parser.bodyStream:onDataStreamEnd() == false then
					do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil)) end
					self.parser.bodyStream = nil
					do self:resetParser() end
					do return end
				end
				self.parser.bodyStream = nil
			end
			if p < sz then
				do self:onData(inputBuffer, offset + p, sz - p) end
			end
		end
		do return end
	elseif self.parser.bodyIsChunked then
		do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest("Chunked content body is not supported.")) end
		do self:resetParser() end
		do return end
	else
		do self:sendErrorResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(nil)) end
		do self:resetParser() end
	end
end

function jk.http.server.HTTPServerConnection:onData(buffer, offset, asz)
	if not (buffer ~= nil) then
		do return end
	end
	do
		local sz = asz
		if sz < 0 then
			sz = _g.jk.lang.Buffer:getSize(buffer) - offset
		end
		if self.isWaitingForBodyReceiver then
			self.parser.savedBodyChunk = _g.jk.lang.Buffer:getSubBuffer(buffer, offset, sz, false)
			do return end
		end
		if self.parser.headersDone and self.parser.bodyDone then
			do self:resetParser() end
		end
		if self.parser.headersDone == false then
			do self:onHeaderData(buffer, offset, sz) end
		elseif self.parser.bodyDone == false then
			do self:onBodyData(buffer, offset, sz) end
		end
	end
end

function jk.http.server.HTTPServerConnection:onOpened()
end

function jk.http.server.HTTPServerConnection:onClosed()
	do self:resetParser() end
end

function jk.http.server.HTTPServerConnection:onError(message)
	do _g.jk.log.Log:error(self.logContext, message) end
end

function jk.http.server.HTTPServerConnection:onDataReceived(data, size)
	do self:onData(data, 0, size) end
end

function jk.http.server.HTTPServerConnection:onWriteReady()
	do self:sendData1() end
end

function jk.http.server.HTTPServerConnection:onCompleteRequest(req)
	if not (req ~= nil) then
		do return end
	end
	do self.requests = self.requests + 1 end
	do req:setServer(self:getHTTPServer()) end
	do req:setConnection(self) end
	if self.currentRequest == nil then
		self.currentRequest = req
		do self:handleCurrentRequest() end
	else
		if self.requestQueue == nil then
			self.requestQueue = _g.jk.lang.Queue._construct0(_g.jk.lang.Queue._create())
		end
		do self.requestQueue:push(req) end
	end
end

function jk.http.server.HTTPServerConnection:handleNextRequest()
	if not (self.currentRequest == nil) then
		do return end
	end
	if not (self.requestQueue ~= nil) then
		do return end
	end
	do
		local req = _vm:to_table_with_key(self.requestQueue:pop(), '_isType.jk.http.server.HTTPServerRequest')
		if not (req ~= nil) then
			do return end
		end
		self.currentRequest = req
		do self:handleCurrentRequest() end
	end
end

function jk.http.server.HTTPServerConnection:sendErrorResponse(response)
	self.closeAfterSend = true
	do self:sendResponse(nil, response) end
end

function jk.http.server.HTTPServerConnection:handleCurrentRequest()
	if not (self.currentRequest ~= nil) then
		do return end
	end
	do
		local server = self:getHTTPServer()
		if not (server ~= nil) then
			do return end
		end
		do
			local method = self.currentRequest:getMethod()
			local url = self.currentRequest:getUrlString()
			if _g.jk.lang.String:isEmpty(method) or _g.jk.lang.String:isEmpty(url) then
				self.closeAfterSend = true
				do self:sendResponse(self.currentRequest, _g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(nil)) end
				do return end
			end
			if self.currentRequest:getVersion() == "HTTP/0.9" and not (method == "GET") then
				self.closeAfterSend = true
				do self:sendResponse(self.currentRequest, _g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(nil)) end
				do return end
			end
			do server:handleIncomingRequest(self.currentRequest) end
		end
	end
end

function jk.http.server.HTTPServerConnection:getStatusCode(status)
	if not (status ~= nil) then
		do return nil end
	end
	do
		local comps = _g.jk.lang.Vector:iterate(_g.jk.lang.String:split(status, 32, 0))
		if comps ~= nil then
			do return (function(o)
				if (_vm:get_variable_type(o) == 'string') then
					do return o end
				end
				do return nil end
			end)(comps:next()) end
		end
		do return nil end
	end
end

function jk.http.server.HTTPServerConnection:validateCurrentRequest(req)
	if not (req ~= nil) then
		do return false end
	end
	if self.currentRequest == nil then
		do _g.jk.log.Log:error(self.logContext, "Sending a response, but no current request!") end
		do _g.jk.log.Log:error(self.logContext, _g.jk.lang.StackTrace:generate()) end
		do self:close() end
		do return false end
	end
	if self.currentRequest ~= req then
		do _g.jk.log.Log:error(self.logContext, "Sending a response for an incorrect request") end
		do self:close() end
		do return false end
	end
	do return true end
end

function jk.http.server.HTTPServerConnection:startResponse(req, resp)
	if not (self.socket ~= nil) then
		do return nil end
	end
	if req ~= nil then
		if not self:validateCurrentRequest(req) then
			do return nil end
		end
	end
	do
		local server = self:getHTTPServer()
		if server ~= nil then
			do server:onRequestComplete(req, resp, 0, self:getRemoteAddress()) end
		end
		do
			local v = _g.jk.http.server.HTTPServerResponseSession._construct0(_g.jk.http.server.HTTPServerResponseSession._create())
			do v:setSocket(self:exportSocket()) end
			do v:setRequest(req) end
			do v:setResponse(resp) end
			do v:setServer(server) end
			self.currentRequest = nil
			do self:close() end
			do return v end
		end
	end
end

function jk.http.server.HTTPServerConnection:sendResponse(req, aresp)
	if not (self.socket ~= nil) then
		do return end
	end
	if req ~= nil then
		if not self:validateCurrentRequest(req) then
			do return end
		end
	end
	if self.isWaitingForBodyReceiver then
		self.closeAfterSend = true
	end
	do self.responses = self.responses + 1 end
	do
		local resp = aresp
		if resp == nil then
			resp = _g.jk.http.server.HTTPServerResponse:forTextString("")
		end
		do
			local inm = nil
			if req ~= nil then
				inm = req:getETag()
			end
			if inm ~= nil then
				if _g.jk.lang.String:equals(inm, resp:getETag()) then
					resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
					do resp:setStatus("304") end
					do resp:setETag(aresp:getETag()) end
				end
			end
			do
				local status = resp:getStatus()
				local bod = resp:getBody()
				local ver = nil
				local met = nil
				if req ~= nil then
					ver = req:getVersion()
					met = req:getMethod()
				end
				do
					local headers = resp:getHeaders()
					local server = self:getHTTPServer()
					if _g.jk.lang.String:equals("HTTP/0.9", ver) then
						self.closeAfterSend = true
					else
						if status == nil or _g.jk.lang.String:getLength(status) < 1 then
							status = "200"
							do resp:setStatus(status) end
						end
						if req ~= nil and req:getConnectionClose() then
							self.closeAfterSend = true
						end
						do
							local fs = _g.jk.http.server.HTTPServerResponse:getFullStatus(status)
							do
								local reply = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
								if ver == nil or _g.jk.lang.String:getLength(ver) < 1 then
									do reply:appendString("HTTP/1.1") end
								else
									do reply:appendString(ver) end
								end
								do reply:appendCharacter(32) end
								do reply:appendString(fs) end
								do reply:appendCharacter(13) end
								do reply:appendCharacter(10) end
								if _g.jk.lang.String:startsWith(fs, "400 ", 0) then
									self.closeAfterSend = true
								end
								if headers ~= nil then
									local it = headers:iterate()
									while it ~= nil do
										local kvp = it:next()
										if kvp == nil then
											do break end
										end
										do reply:appendString(kvp.key) end
										do reply:appendCharacter(58) end
										do reply:appendCharacter(32) end
										do reply:appendString(kvp.value) end
										do reply:appendCharacter(13) end
										do reply:appendCharacter(10) end
									end
								end
								if self.closeAfterSend then
									do reply:appendString("Connection: close\r\n") end
								end
								if server ~= nil then
									local name = server:getServerName()
									if _g.jk.lang.String:isNotEmpty(name) then
										do reply:appendString("Server: ") end
										do reply:appendString(name) end
										do reply:appendCharacter(13) end
										do reply:appendCharacter(10) end
									end
								end
								do reply:appendString("Date: ") end
								do reply:appendString(_g.jk.time.format.VerboseDateTimeString:forUTCNow()) end
								do reply:appendCharacter(13) end
								do reply:appendCharacter(10) end
								do reply:appendCharacter(13) end
								do reply:appendCharacter(10) end
								self.sendBuffer = _g.jk.lang.String:toUTF8Buffer(reply:toString())
							end
						end
					end
					self.sendWritten = 0
					if bod ~= nil then
						if _g.jk.lang.String:equals("HEAD", met) == false then
							self.sendBody = bod
						end
					end
					self.responseToSend = resp
					do self:updateListeningMode() end
				end
			end
		end
	end
end

function jk.http.server.HTTPServerConnection:sendData1()
	if not (self.socket ~= nil) then
		do return end
	end
	do
		local remoteAddress = self:getRemoteAddress()
		if _g.jk.lang.Buffer:getSize(self.sendBuffer) == 0 then
			if self.sendBody ~= nil then
				if (_vm:to_table_with_key(self.sendBody, '_isType.jk.io.BufferReader') ~= nil) then
					self.sendBuffer = self.sendBody:getBuffer()
					self.sendBody = nil
				else
					if self.sendBodyBuffer == nil then
						self.sendBodyBuffer = _util:allocate_buffer(self:getWriteBufferSize())
					end
					do
						local n = self.sendBody:read(self.sendBodyBuffer)
						if n < 1 then
							self.sendBody = nil
						elseif n == #self.sendBodyBuffer then
							self.sendBuffer = self.sendBodyBuffer
						else
							self.sendBuffer = _g.jk.lang.Buffer:getSubBuffer(self.sendBodyBuffer, 0, n, false)
						end
					end
				end
			end
		end
		if _g.jk.lang.Buffer:getSize(self.sendBuffer) > 0 then
			local socket = self.socket
			local r = socket:write(self.sendBuffer, _g.jk.lang.Buffer:getSize(self.sendBuffer))
			if r < 0 then
				self.sendBuffer = nil
				self.sendBody = nil
				do self:close() end
				do return end
			elseif r == 0 then
			else
				self.sendWritten = self.sendWritten + r
				do
					local osz = _g.jk.lang.Buffer:getSize(self.sendBuffer)
					if r < osz then
						self.sendBuffer = _g.jk.lang.Buffer:getSubBuffer(self.sendBuffer, r, osz - r, false)
					else
						self.sendBuffer = nil
					end
				end
			end
		end
		if _g.jk.lang.Buffer:getSize(self.sendBuffer) == 0 and self.sendBody == nil then
			local server = self:getHTTPServer()
			if server ~= nil then
				do server:onRequestComplete(self.currentRequest, self.responseToSend, self.sendWritten, remoteAddress) end
			end
			self.currentRequest = nil
			self.responseToSend = nil
			if self.closeAfterSend then
				do self:close() end
			else
				do self:updateListeningMode() end
				do self:handleNextRequest() end
			end
		end
		self.lastActivity = _g.jk.time.SystemClock:asSeconds()
	end
end

function jk.http.server.HTTPServerConnection:getRequests()
	do return self.requests end
end

function jk.http.server.HTTPServerConnection:setRequests(v)
	self.requests = v
	do return self end
end

function jk.http.server.HTTPServerConnection:getResponses()
	do return self.responses end
end

function jk.http.server.HTTPServerConnection:setResponses(v)
	self.responses = v
	do return self end
end

jk.http.server.HTTPServerBase = _g.jk.server.NetworkServer._create()
jk.http.server.HTTPServerBase.__index = jk.http.server.HTTPServerBase
_vm:set_metatable(jk.http.server.HTTPServerBase, {
	__index = _g.jk.server.NetworkServer
})

function jk.http.server.HTTPServerBase._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerBase)
	return v
end

function jk.http.server.HTTPServerBase:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerBase'
	self['_isType.jk.http.server.HTTPServerBase'] = true
	self.writeBufferSize = 1024 * 512
	self.smallBodyLimit = 5 * 1024 * 1024
	self.timeoutDelay = 30
	self.maintenanceTimerDelay = 60
	self.serverName = nil
	self.workerThreadPool = nil
	self.timeoutTimer = nil
	self.maintenanceTimer = nil
end

function jk.http.server.HTTPServerBase:_construct0()
	jk.http.server.HTTPServerBase._init(self)
	do _g.jk.server.NetworkServer._construct0(self) end
	do self:setPort(8080) end
	return self
end

function jk.http.server.HTTPServerBase:createConnectionObject()
	do return _g.jk.http.server.HTTPServerConnection._construct0(_g.jk.http.server.HTTPServerConnection._create()) end
end

function jk.http.server.HTTPServerBase:onRefresh()
end

function jk.http.server.HTTPServerBase:onTimeoutTimer()
	local cfc = {}
	local now = _g.jk.time.SystemClock:asSeconds()
	do self:forEachConnection(function(connection)
		local httpc = _vm:to_table_with_key(connection, '_isType.jk.http.server.HTTPServerConnection')
		if httpc == nil then
			do return end
		end
		if httpc:getResponses() >= httpc:getRequests() or httpc:getIsWaitingForBodyReceiver() and now - httpc:getLastActivity() >= self.timeoutDelay then
			do _g.jk.lang.Vector:append(cfc, httpc) end
		end
	end) end
	if cfc ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(cfc)
		do
			n = 0
			while n < m do
				local wsc = cfc[n + 1]
				if wsc ~= nil then
					do wsc:close() end
				end
				do n = n + 1 end
			end
		end
	end
	do return true end
end

function jk.http.server.HTTPServerBase:onMaintenanceTimer()
	do self:onMaintenance() end
	do return true end
end

function jk.http.server.HTTPServerBase:onMaintenance()
end

function jk.http.server.HTTPServerBase:startTimer(delay, handler)
	if not (self.ioManager ~= nil) then
		do return nil end
	end
	do return self.ioManager:startTimer(delay, handler) end
end

function jk.http.server.HTTPServerBase:initialize2()
	if not _g.jk.server.NetworkServer.initialize2(self) then
		do return false end
	end
	if self.timeoutDelay < 1 then
		do _g.jk.log.Log:debug(self.logContext, "HTTPServerBase" .. ": Timeout timer disabled") end
	else
		do _g.jk.log.Log:debug(self.logContext, "HTTPServerBase" .. ": Starting a timeout timer with a " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.timeoutDelay)) .. " second delay.") end
		self.timeoutTimer = self.ioManager:startTimer(self.timeoutDelay * 1000000, function()
			do self:onTimeoutTimer() end
		end)
		if self.timeoutTimer == nil then
			do _g.jk.log.Log:error(self.logContext, "HTTPServerBase" .. ": Failed to start timeout timer") end
		end
	end
	if self.maintenanceTimerDelay < 1 then
		do _g.jk.log.Log:debug(self.logContext, "Maintenance timer disabled") end
	else
		do _g.jk.log.Log:debug(self.logContext, "HTTPServerBase" .. ": Starting a maintenance timer with a " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.maintenanceTimerDelay)) .. " second delay.") end
		self.maintenanceTimer = self.ioManager:startTimer(self.maintenanceTimerDelay * 1000000, function()
			do self:onMaintenanceTimer() end
		end)
		if self.maintenanceTimer == nil then
			do _g.jk.log.Log:error(self.logContext, "HTTPServerBase" .. ": Failed to start maintenance timer") end
		end
	end
	do _g.jk.log.Log:info(self.logContext, "HTTPServerBase" .. ": server initialized.") end
	do return true end
end

function jk.http.server.HTTPServerBase:cleanup()
	do _g.jk.server.NetworkServer.cleanup(self) end
	if self.maintenanceTimer ~= nil then
		do self.maintenanceTimer:stop() end
		self.maintenanceTimer = nil
	end
	if self.timeoutTimer ~= nil then
		do self.timeoutTimer:stop() end
		self.timeoutTimer = nil
	end
end

function jk.http.server.HTTPServerBase:createOptionsResponse(req)
	do return _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create()):setStatus("200"):addHeader("Content-Length", "0") end
end

function jk.http.server.HTTPServerBase:onRequest(req)
	do req:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPNotFound(nil)) end
end

function jk.http.server.HTTPServerBase:handleIncomingRequest(req)
	if not (req ~= nil) then
		do return end
	end
	if req:getMethod() == "OPTIONS" then
		local resp = self:createOptionsResponse(req)
		if resp ~= nil then
			do req:sendResponse(resp) end
			do return end
		end
	end
	do self:onRequest(req) end
end

function jk.http.server.HTTPServerBase:sendResponse(connection, req, resp)
	if not (connection ~= nil) then
		do return end
	end
	do connection:sendResponse(req, resp) end
end

function jk.http.server.HTTPServerBase:startResponse(connection, req, resp)
	if not (connection ~= nil) then
		do return nil end
	end
	do return connection:startResponse(req, resp) end
end

jk.http.server.HTTPServerBase.WorkerThread = {}
jk.http.server.HTTPServerBase.WorkerThread.__index = jk.http.server.HTTPServerBase.WorkerThread
_vm:set_metatable(jk.http.server.HTTPServerBase.WorkerThread, {})

function jk.http.server.HTTPServerBase.WorkerThread._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerBase.WorkerThread)
	return v
end

function jk.http.server.HTTPServerBase.WorkerThread:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerBase.WorkerThread'
	self['_isType.jk.http.server.HTTPServerBase.WorkerThread'] = true
	self['_isType.jk.lang.Runnable'] = true
	self.worker = nil
end

function jk.http.server.HTTPServerBase.WorkerThread:_construct0()
	jk.http.server.HTTPServerBase.WorkerThread._init(self)
	return self
end

function jk.http.server.HTTPServerBase.WorkerThread:run()
	if not (self.worker ~= nil) then
		do return end
	end
	do self.worker:onStart() end
	while true do
		if self.worker:tick() == false then
			do break end
		end
	end
	do self.worker:onEnd() end
end

function jk.http.server.HTTPServerBase.WorkerThread:getWorker()
	do return self.worker end
end

function jk.http.server.HTTPServerBase.WorkerThread:setWorker(v)
	self.worker = v
	do return self end
end

function jk.http.server.HTTPServerBase:startResponseWorker(worker)
	if not (worker ~= nil) then
		do return false end
	end
	do worker:setContext(self.logContext) end
	if not (self.workerThreadPool ~= nil) then
		do _g.jk.log.Log:error(self.logContext, "Trying to start a response worker, but no thread pool has been initialized") end
		do worker:abort() end
		do return false end
	end
	do self.workerThreadPool:submitTask(_g.jk.http.server.HTTPServerBase.WorkerThread._construct0(_g.jk.http.server.HTTPServerBase.WorkerThread._create()):setWorker(worker)) end
	do _g.jk.log.Log:debug(self.logContext, "HTTPServerBase" .. ": Starting a new worker thread. We now have " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.workerThreadPool:getRunningThreadsCount())) .. " thread(s).") end
	do return true end
end

function jk.http.server.HTTPServerBase:onRequestComplete(request, resp, bytesSent, remoteAddress)
end

function jk.http.server.HTTPServerBase:getWriteBufferSize()
	do return self.writeBufferSize end
end

function jk.http.server.HTTPServerBase:setWriteBufferSize(v)
	self.writeBufferSize = v
	do return self end
end

function jk.http.server.HTTPServerBase:getSmallBodyLimit()
	do return self.smallBodyLimit end
end

function jk.http.server.HTTPServerBase:setSmallBodyLimit(v)
	self.smallBodyLimit = v
	do return self end
end

function jk.http.server.HTTPServerBase:getTimeoutDelay()
	do return self.timeoutDelay end
end

function jk.http.server.HTTPServerBase:setTimeoutDelay(v)
	self.timeoutDelay = v
	do return self end
end

function jk.http.server.HTTPServerBase:getMaintenanceTimerDelay()
	do return self.maintenanceTimerDelay end
end

function jk.http.server.HTTPServerBase:setMaintenanceTimerDelay(v)
	self.maintenanceTimerDelay = v
	do return self end
end

function jk.http.server.HTTPServerBase:getServerName()
	do return self.serverName end
end

function jk.http.server.HTTPServerBase:setServerName(v)
	self.serverName = v
	do return self end
end

function jk.http.server.HTTPServerBase:getWorkerThreadPool()
	do return self.workerThreadPool end
end

function jk.http.server.HTTPServerBase:setWorkerThreadPool(v)
	self.workerThreadPool = v
	do return self end
end

jk.http.server.HTTPServerRequestHandlerMap = _g.jk.http.server.HTTPServerRequestHandlerAdapter._create()
jk.http.server.HTTPServerRequestHandlerMap.__index = jk.http.server.HTTPServerRequestHandlerMap
_vm:set_metatable(jk.http.server.HTTPServerRequestHandlerMap, {
	__index = _g.jk.http.server.HTTPServerRequestHandlerAdapter
})

function jk.http.server.HTTPServerRequestHandlerMap._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequestHandlerMap)
	return v
end

function jk.http.server.HTTPServerRequestHandlerMap:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequestHandlerMap'
	self['_isType.jk.http.server.HTTPServerRequestHandlerMap'] = true
	self.getHandlerFunctions = nil
	self.postHandlerFunctions = nil
	self.putHandlerFunctions = nil
	self.deleteHandlerFunctions = nil
	self.patchHandlerFunctions = nil
	self.childObjects = nil
end

function jk.http.server.HTTPServerRequestHandlerMap:_construct0()
	jk.http.server.HTTPServerRequestHandlerMap._init(self)
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter._construct0(self) end
	return self
end

function jk.http.server.HTTPServerRequestHandlerMap:initialize(server)
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.initialize(self, server) end
	do
		local it = _g.jk.lang.Map:iterateValues(self.childObjects)
		while true do
			local child = it:next()
			if child == nil then
				do break end
			end
			if (_vm:to_table_with_key(child, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do child:initialize(server) end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerMap:onMaintenance()
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.onMaintenance(self) end
	do
		local it = _g.jk.lang.Map:iterateValues(self.childObjects)
		while true do
			local child = it:next()
			if child == nil then
				do break end
			end
			if (_vm:to_table_with_key(child, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do child:onMaintenance() end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerMap:onRefresh()
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.onRefresh(self) end
	do
		local it = _g.jk.lang.Map:iterateValues(self.childObjects)
		while true do
			local child = it:next()
			if child == nil then
				do break end
			end
			if (_vm:to_table_with_key(child, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do child:onRefresh() end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerMap:cleanup()
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.cleanup(self) end
	do
		local it = _g.jk.lang.Map:iterateValues(self.childObjects)
		while true do
			local child = it:next()
			if child == nil then
				do break end
			end
			if (_vm:to_table_with_key(child, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do child:cleanup() end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerMap:onHTTPMethod(req, functions)
	local rsc = req:peekResource()
	if not (rsc ~= nil) then
		rsc = ""
	end
	do
		local handler = nil
		local rsccount = req:getRemainingResourceCount()
		local pop = true
		if rsccount < 1 then
			handler = _g.jk.lang.Map:get(functions, rsc)
			if not (handler ~= nil) then
				handler = _g.jk.lang.Map:get(functions, "*")
				if handler ~= nil then
					pop = false
				end
			end
		elseif rsccount == 1 then
			handler = _g.jk.lang.Map:get(functions, _g.jk.lang.String:safeString(rsc) .. "/*")
			if not (handler ~= nil) then
				handler = _g.jk.lang.Map:get(functions, _g.jk.lang.String:safeString(rsc) .. "/**")
			end
		else
			handler = _g.jk.lang.Map:get(functions, _g.jk.lang.String:safeString(rsc) .. "/**")
		end
		if handler ~= nil then
			if pop then
				do req:popResource() end
			end
			do handler(req) end
			do return true end
		end
		do return false end
	end
end

function jk.http.server.HTTPServerRequestHandlerMap:onGET1(req)
	do return self:onHTTPMethod(req, self.getHandlerFunctions) end
end

function jk.http.server.HTTPServerRequestHandlerMap:onPOST1(req)
	do return self:onHTTPMethod(req, self.postHandlerFunctions) end
end

function jk.http.server.HTTPServerRequestHandlerMap:onPUT1(req)
	do return self:onHTTPMethod(req, self.putHandlerFunctions) end
end

function jk.http.server.HTTPServerRequestHandlerMap:onDELETE1(req)
	do return self:onHTTPMethod(req, self.deleteHandlerFunctions) end
end

function jk.http.server.HTTPServerRequestHandlerMap:onPATCH1(req)
	do return self:onHTTPMethod(req, self.patchHandlerFunctions) end
end

function jk.http.server.HTTPServerRequestHandlerMap:tryHandleRequest(req)
	local v = false
	if not (req ~= nil) then
	elseif req:isGET() then
		v = self:onGET1(req)
	elseif req:isPOST() then
		v = self:onPOST1(req)
	elseif req:isPUT() then
		v = self:onPUT1(req)
	elseif req:isDELETE() then
		v = self:onDELETE1(req)
	elseif req:isPATCH() then
		v = self:onPATCH1(req)
	end
	do return v end
end

function jk.http.server.HTTPServerRequestHandlerMap:handleRequest(req, next)
	if self:tryHandleRequest(req) then
		do return end
	end
	do
		local rsc = req:peekResource()
		if not (rsc ~= nil) then
			rsc = ""
		end
		do
			local sub = _g.jk.lang.Map:get(self.childObjects, rsc)
			if not (sub ~= nil) then
				sub = _g.jk.lang.Map:get(self.childObjects, "*")
			end
			if not (sub ~= nil) then
				sub = _g.jk.lang.Map:get(self.childObjects, _g.jk.lang.String:safeString(rsc) .. "/**")
			end
			if sub ~= nil then
				do req:popResource() end
				do sub:handleRequest(req, next) end
				do return end
			end
			do next() end
			do return end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerMap:child(path, handler)
	if path ~= nil then
		if not (self.childObjects ~= nil) then
			self.childObjects = {}
		end
		self.childObjects[path] = handler
		if handler ~= nil and (_vm:to_table_with_key(handler, '_isType.jk.http.server.HTTPServerComponent') ~= nil) and self:isInitialized() then
			do handler:initialize(self:getServer()) end
		end
	end
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerMap:get(path, handler)
	if path ~= nil then
		if not (self.getHandlerFunctions ~= nil) then
			self.getHandlerFunctions = {}
		end
		self.getHandlerFunctions[path] = handler
	end
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerMap:post(path, handler)
	if path ~= nil then
		if not (self.postHandlerFunctions ~= nil) then
			self.postHandlerFunctions = {}
		end
		self.postHandlerFunctions[path] = handler
	end
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerMap:put(path, handler)
	if path ~= nil then
		if not (self.putHandlerFunctions ~= nil) then
			self.putHandlerFunctions = {}
		end
		self.putHandlerFunctions[path] = handler
	end
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerMap:delete(path, handler)
	if path ~= nil then
		if not (self.deleteHandlerFunctions ~= nil) then
			self.deleteHandlerFunctions = {}
		end
		self.deleteHandlerFunctions[path] = handler
	end
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerMap:patch(path, handler)
	if path ~= nil then
		if not (self.patchHandlerFunctions ~= nil) then
			self.patchHandlerFunctions = {}
		end
		self.patchHandlerFunctions[path] = handler
	end
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerMap:getOrPost(path, handler)
	do self:get(path, handler) end
	do self:post(path, handler) end
	do return self end
end

jk.http.server.HTTPServerStaticContentHandler = {}
jk.http.server.HTTPServerStaticContentHandler.__index = jk.http.server.HTTPServerStaticContentHandler
_vm:set_metatable(jk.http.server.HTTPServerStaticContentHandler, {})

function jk.http.server.HTTPServerStaticContentHandler._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerStaticContentHandler)
	return v
end

function jk.http.server.HTTPServerStaticContentHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerStaticContentHandler'
	self['_isType.jk.http.server.HTTPServerStaticContentHandler'] = true
	self['_isType.jk.http.server.HTTPServerRequestHandler'] = true
	self.content = nil
	self.mimeType = nil
	self.redirectUrl = nil
end

function jk.http.server.HTTPServerStaticContentHandler:_construct0()
	jk.http.server.HTTPServerStaticContentHandler._init(self)
	return self
end

function jk.http.server.HTTPServerStaticContentHandler:forContent(content, mimeType)
	local v = _g.jk.http.server.HTTPServerStaticContentHandler._construct0(_g.jk.http.server.HTTPServerStaticContentHandler._create())
	do v:setContent(content) end
	do v:setMimeType(mimeType) end
	do return v end
end

function jk.http.server.HTTPServerStaticContentHandler:forHTMLContent(content)
	local v = _g.jk.http.server.HTTPServerStaticContentHandler._construct0(_g.jk.http.server.HTTPServerStaticContentHandler._create())
	do v:setContent(content) end
	do v:setMimeType("text/html") end
	do return v end
end

function jk.http.server.HTTPServerStaticContentHandler:forJSONContent(content)
	local v = _g.jk.http.server.HTTPServerStaticContentHandler._construct0(_g.jk.http.server.HTTPServerStaticContentHandler._create())
	do v:setContent(content) end
	do v:setMimeType("application/json") end
	do return v end
end

function jk.http.server.HTTPServerStaticContentHandler:forRedirect(url)
	local v = _g.jk.http.server.HTTPServerStaticContentHandler._construct0(_g.jk.http.server.HTTPServerStaticContentHandler._create())
	do v:setRedirectUrl(url) end
	do return v end
end

function jk.http.server.HTTPServerStaticContentHandler:handleRequest(req, next)
	if self.redirectUrl ~= nil then
		do req:sendResponse(_g.jk.http.server.HTTPServerResponse:forRedirect(self.redirectUrl)) end
	else
		do req:sendResponse(_g.jk.http.server.HTTPServerResponse:forString(self.content, self.mimeType)) end
	end
end

function jk.http.server.HTTPServerStaticContentHandler:getContent()
	do return self.content end
end

function jk.http.server.HTTPServerStaticContentHandler:setContent(v)
	self.content = v
	do return self end
end

function jk.http.server.HTTPServerStaticContentHandler:getMimeType()
	do return self.mimeType end
end

function jk.http.server.HTTPServerStaticContentHandler:setMimeType(v)
	self.mimeType = v
	do return self end
end

function jk.http.server.HTTPServerStaticContentHandler:getRedirectUrl()
	do return self.redirectUrl end
end

function jk.http.server.HTTPServerStaticContentHandler:setRedirectUrl(v)
	self.redirectUrl = v
	do return self end
end

jk.http.server.HTTPServerRequestHandlerListener = {}

jk.http.server.HTTPServerBinaryReaderResponseWorker = _g.jk.http.server.HTTPServerResponseWorker._create()
jk.http.server.HTTPServerBinaryReaderResponseWorker.__index = jk.http.server.HTTPServerBinaryReaderResponseWorker
_vm:set_metatable(jk.http.server.HTTPServerBinaryReaderResponseWorker, {
	__index = _g.jk.http.server.HTTPServerResponseWorker
})

function jk.http.server.HTTPServerBinaryReaderResponseWorker._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerBinaryReaderResponseWorker)
	return v
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerBinaryReaderResponseWorker'
	self['_isType.jk.http.server.HTTPServerBinaryReaderResponseWorker'] = true
	self.reader = nil
	self.packetSize = 8192 * 2
	self.mimeType = nil
	self.workBuffer = nil
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:forReader(reader)
	local v = _g.jk.http.server.HTTPServerBinaryReaderResponseWorker._construct0(_g.jk.http.server.HTTPServerBinaryReaderResponseWorker._create())
	do v:setReader(reader) end
	do return v end
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:_construct0()
	jk.http.server.HTTPServerBinaryReaderResponseWorker._init(self)
	do _g.jk.http.server.HTTPServerResponseWorker._construct0(self) end
	self.mimeType = "application/octet-stream"
	return self
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:setMimeType(value)
	self.mimeType = value
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:getMimeType()
	do return self.mimeType end
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:getWorkerDescription()
	do return "HTTPServerBinaryReaderResponseWorker" end
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:onStart()
	do _g.jk.http.server.HTTPServerResponseWorker.onStart(self) end
	self.workBuffer = _util:allocate_buffer(self.packetSize)
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:tick()
	if not (self.workBuffer ~= nil) then
		do return false end
	end
	if not (self.reader ~= nil) then
		do return false end
	end
	do
		local r = self.reader:read(self.workBuffer)
		if r < 1 then
			do return false end
		end
		if not self.session:writeData(self.workBuffer, r) then
			do _g.jk.log.Log:debug(self.context, "Remote connection closed. " .. "HTTPServerBinaryReaderResponseWorker" .. " aborted.") end
			do return false end
		end
		do return true end
	end
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:getReader()
	do return self.reader end
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:setReader(v)
	self.reader = v
	do return self end
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:getPacketSize()
	do return self.packetSize end
end

function jk.http.server.HTTPServerBinaryReaderResponseWorker:setPacketSize(v)
	self.packetSize = v
	do return self end
end

jk.http.server.HTTPServerResponse = {}
jk.http.server.HTTPServerResponse.__index = jk.http.server.HTTPServerResponse
_vm:set_metatable(jk.http.server.HTTPServerResponse, {})

function jk.http.server.HTTPServerResponse._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerResponse)
	return v
end

function jk.http.server.HTTPServerResponse:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerResponse'
	self['_isType.jk.http.server.HTTPServerResponse'] = true
	self.headers = nil
	self.message = nil
	self.status = nil
	self.statusIsOk = false
	self.body = nil
	self.eTag = nil
end

function jk.http.server.HTTPServerResponse:_construct0()
	jk.http.server.HTTPServerResponse._init(self)
	return self
end

function jk.http.server.HTTPServerResponse:forMyPacket(packet)
	if not (packet ~= nil) then
		do return nil end
	end
	do
		local parser = _g.jk.mypacket.MyPacketParser:forBuffer(packet)
		local v = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
		do v:setStatus(parser:getLengthEncodedString()) end
		do
			local nheaders = parser:getLengthEncodedInteger()
			do
				local n = 0
				while n < nheaders do
					local key = parser:getLengthEncodedString()
					local val = parser:getLengthEncodedString()
					if not (key ~= nil) then
						key = ""
					end
					do v:addHeader(key, val) end
					do n = n + 1 end
				end
			end
			do v:setBody1(parser:getLengthEncodedBuffer()) end
			do return v end
		end
	end
end

function jk.http.server.HTTPServerResponse:parseBuffer(data)
	if not (data ~= nil) then
		do return nil end
	end
	do
		local version = nil
		local statusCode = nil
		local statusMessage = nil
		local key = nil
		local headers = nil
		local hdr = nil
		local contentLength = 0
		local bodyBuffer = nil
		local sz = _g.jk.lang.Buffer:getSize(data)
		local p = 0
		while p < sz do
			local c = _vm:bitwise_and(_g.jk.lang.Buffer:getByte(data, p), 255)
			do p = p + 1 end
			if c == 13 then
				goto _continue2
			end
			if version == nil then
				if c == 32 then
					if hdr ~= nil then
						version = hdr:toString()
						hdr = nil
					end
					goto _continue2
				end
			elseif statusCode == nil then
				if c == 32 then
					if hdr ~= nil then
						statusCode = hdr:toString()
						hdr = nil
					end
					goto _continue2
				end
			elseif statusMessage == nil then
				if c == 10 then
					if hdr ~= nil then
						statusMessage = hdr:toString()
						hdr = nil
					end
					goto _continue2
				end
			elseif key == nil then
				if c == 58 then
					if hdr ~= nil then
						key = hdr:toString()
						hdr = nil
					end
					goto _continue2
				elseif c == 10 then
					if hdr ~= nil then
						do return nil end
					end
					do break end
				end
			elseif c == 32 and hdr == nil then
				goto _continue2
			elseif c == 10 then
				local value = nil
				if hdr ~= nil then
					value = hdr:toString()
					hdr = nil
				end
				if headers == nil then
					headers = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
				end
				do headers:add(key, value) end
				if _g.jk.lang.String:equalsIgnoreCase(key, "content-length") and not (value == nil) then
					contentLength = _g.jk.lang.Integer:asInteger(value)
				elseif _g.jk.lang.String:equalsIgnoreCase(key, "transfer-encoding") and not (value == nil) and _g.jk.lang.String:contains(value, "chunked") then
					do return nil end
				end
				key = nil
				goto _continue2
			end
			if hdr == nil then
				hdr = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			end
			do hdr:appendCharacter(c) end
			if hdr:count() > 32 * 1024 then
				do return nil end
			end
			::_continue2::
		end
		if contentLength > 0 then
			bodyBuffer = _g.jk.lang.Buffer:getSubBuffer(data, p, -1, false)
		end
		do
			local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
			do resp:setStatus(statusCode) end
			do resp:setMessage(statusMessage) end
			do resp:setHeaders(headers) end
			do resp:setBody1(bodyBuffer) end
			do return resp end
		end
	end
end

function jk.http.server.HTTPServerResponse:forFile(file, maxCachedSize)
	if file == nil or file:isFile() == false then
		do return _g.jk.http.server.HTTPServerResponse:forHTTPNotFound(nil) end
	end
	do
		local bodyset = false
		local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
		do resp:setStatus("200") end
		do resp:addHeader("Content-Type", _g.jk.mime.MimeTypeRegistry:getSharedInstance():getTypeForFile(file)) end
		do
			local st = file:stat()
			if st ~= nil then
				local lm = st:getModifyTimeUTC()
				if lm > 0 then
					local dts = _g.jk.time.format.VerboseDateTimeString:forDateTime(_g.jk.lang.DateTime:forSeconds(lm))
					do resp:addHeader("Last-Modified", dts) end
					do resp:setETag(_g.jk.md5.MD5Encoder:encodeString(dts)) end
				end
				do
					local mcs = maxCachedSize
					if mcs < 0 then
						mcs = 32 * 1024
					end
					if st:getSize() < mcs then
						do resp:setBody1(file:getContentsBuffer()) end
						bodyset = true
					end
				end
			end
			if bodyset == false then
				do resp:setBody3(file) end
			end
			do return resp end
		end
	end
end

function jk.http.server.HTTPServerResponse:forBuffer(data, mimetype)
	local mt = mimetype
	if _g.jk.lang.String:isEmpty(mt) then
		mt = "application/binary"
	end
	do
		local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
		do resp:setStatus("200") end
		do resp:addHeader("Content-Type", mt) end
		do resp:setBody1(data) end
		do return resp end
	end
end

function jk.http.server.HTTPServerResponse:forOk(mimetype)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("200") end
	if _g.jk.lang.String:isEmpty(mimetype) == false then
		do resp:addHeader("Content-Type", mimetype) end
	end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forString(text, mimetype)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("200") end
	if _g.jk.lang.String:isEmpty(mimetype) == false then
		do resp:addHeader("Content-Type", mimetype) end
	end
	do resp:setBody2(text) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forTextString(text)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("200") end
	do resp:addHeader("Content-Type", "text/plain; charset=\"UTF-8\"") end
	do resp:setBody2(text) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTMLString(html)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("200") end
	do resp:addHeader("Content-Type", "text/html; charset=\"UTF-8\"") end
	do resp:setBody2(html) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forXMLString(xml)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("200") end
	do resp:addHeader("Content-Type", "text/xml; charset=\"UTF-8\"") end
	do resp:setBody2(xml) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forJSONObject(o)
	do return _g.jk.http.server.HTTPServerResponse:forJSONString(_g.jk.json.JSONEncoder:encode(o, true, false)) end
end

function jk.http.server.HTTPServerResponse:forJSONString(json)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("200") end
	do resp:addHeader("Content-Type", "application/json; charset=\"UTF-8\"") end
	do resp:setBody2(json) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:stringWithMessage(str, message)
	if _g.jk.lang.String:isEmpty(message) then
		do return str end
	end
	do return _g.jk.lang.String:safeString(str) .. ": " .. _g.jk.lang.String:safeString(message) end
end

function jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(message)
	local resp = _g.jk.http.server.HTTPServerResponse:forTextString(_g.jk.http.server.HTTPServerResponse:stringWithMessage("Invalid request", message))
	do resp:setStatus("400") end
	do resp:addHeader("Connection", "close") end
	do resp:setMessage(message) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTTPInternalError(message)
	local resp = _g.jk.http.server.HTTPServerResponse:forTextString(_g.jk.http.server.HTTPServerResponse:stringWithMessage("Internal server error", message))
	do resp:setStatus("500") end
	do resp:addHeader("Connection", "close") end
	do resp:setMessage(message) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTTPNotImplemented(message)
	local resp = _g.jk.http.server.HTTPServerResponse:forTextString(_g.jk.http.server.HTTPServerResponse:stringWithMessage("Not implemented", message))
	do resp:setStatus("501") end
	do resp:addHeader("Connection", "close") end
	do resp:setMessage(message) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTTPNotAllowed(message)
	local resp = _g.jk.http.server.HTTPServerResponse:forTextString(_g.jk.http.server.HTTPServerResponse:stringWithMessage("Not allowed", message))
	do resp:setStatus("405") end
	do resp:setMessage(message) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTTPNotFound(message)
	local resp = _g.jk.http.server.HTTPServerResponse:forTextString(_g.jk.http.server.HTTPServerResponse:stringWithMessage("Not found", message))
	do resp:setStatus("404") end
	do resp:setMessage(message) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTTPForbidden(message)
	local resp = _g.jk.http.server.HTTPServerResponse:forTextString(_g.jk.http.server.HTTPServerResponse:stringWithMessage("Forbidden", message))
	do resp:setStatus("403") end
	do resp:setMessage(message) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forRedirect(url)
	do return _g.jk.http.server.HTTPServerResponse:forHTTPMovedTemporarily(url) end
end

function jk.http.server.HTTPServerResponse:forHTTPMovedPermanently(url)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("301") end
	do resp:addHeader("Location", url) end
	do resp:setBody2(url) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTTPMovedTemporarily(url)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("303") end
	do resp:addHeader("Location", url) end
	do resp:setBody2(url) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:forHTTPTemporaryRedirect(url)
	local resp = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do resp:setStatus("307") end
	do resp:addHeader("Location", url) end
	do resp:setBody2(url) end
	do return resp end
end

function jk.http.server.HTTPServerResponse:getFullStatus(status)
	local v = nil
	if status ~= nil and _g.jk.lang.String:getIndexOfString(status, " ", 0) < 1 then
		if _g.jk.lang.String:equals("200", status) then
			v = "200 OK"
		elseif _g.jk.lang.String:equals("301", status) then
			v = "301 Moved Permanently"
		elseif _g.jk.lang.String:equals("303", status) then
			v = "303 See Other"
		elseif _g.jk.lang.String:equals("304", status) then
			v = "304 Not Modified"
		elseif _g.jk.lang.String:equals("400", status) then
			v = "400 Bad Request"
		elseif _g.jk.lang.String:equals("401", status) then
			v = "401 Unauthorized"
		elseif _g.jk.lang.String:equals("403", status) then
			v = "403 Forbidden"
		elseif _g.jk.lang.String:equals("404", status) then
			v = "404 Not found"
		elseif _g.jk.lang.String:equals("405", status) then
			v = "405 Method not allowed"
		elseif _g.jk.lang.String:equals("500", status) then
			v = "500 Internal server error"
		elseif _g.jk.lang.String:equals("501", status) then
			v = "501 Not implemented"
		elseif _g.jk.lang.String:equals("503", status) then
			v = "503 Service unavailable"
		else
			v = _g.jk.lang.String:safeString(status) .. " Unknown"
		end
	else
		v = status
	end
	do return v end
end

function jk.http.server.HTTPServerResponse:forException(e)
	local v = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do v:setStatus("500") end
	do v:setBody2(_g.jk.lang.String:asString(e)) end
	do return v end
end

function jk.http.server.HTTPServerResponse:setETag(eTag)
	self.eTag = eTag
	do self:addHeader("ETag", eTag) end
	do return self end
end

function jk.http.server.HTTPServerResponse:getETag()
	do return self.eTag end
end

function jk.http.server.HTTPServerResponse:setStatus(status)
	self.status = status
	if status == "200" then
		self.statusIsOk = true
	end
	do return self end
end

function jk.http.server.HTTPServerResponse:getStatus()
	do return self.status end
end

function jk.http.server.HTTPServerResponse:addHeader(key, value)
	if not (self.headers ~= nil) then
		self.headers = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
	end
	do self.headers:add(key, value) end
	do return self end
end

function jk.http.server.HTTPServerResponse:addCookie(cookie)
	if not (cookie ~= nil) then
		do return end
	end
	do self:addHeader("Set-Cookie", cookie:toString()) end
end

function jk.http.server.HTTPServerResponse:setBody1(buf)
	if not (buf ~= nil) then
		self.body = nil
		do self:addHeader("Content-Length", "0") end
	else
		self.body = _g.jk.io.BufferReader:forBuffer(buf)
		do self:addHeader("Content-Length", _g.jk.lang.String:forInteger(#buf)) end
	end
	do return self end
end

function jk.http.server.HTTPServerResponse:setBody2(str)
	if not (str ~= nil) then
		self.body = nil
		do self:addHeader("Content-Length", "0") end
	else
		local buf = _g.jk.lang.String:toUTF8Buffer(str)
		self.body = _g.jk.io.BufferReader:forBuffer(buf)
		do self:addHeader("Content-Length", _g.jk.lang.String:forInteger(_g.jk.lang.Buffer:getSize(buf))) end
	end
	do return self end
end

function jk.http.server.HTTPServerResponse:setBody3(file)
	if file == nil or file:isFile() == false then
		self.body = nil
		do self:addHeader("Content-Length", "0") end
	else
		self.body = file:read()
		do self:addHeader("Content-Length", _g.jk.lang.String:forInteger(file:getSize())) end
	end
	do return self end
end

function jk.http.server.HTTPServerResponse:setBody4(reader)
	if reader == nil then
		self.body = nil
		do self:addHeader("Content-Length", "0") end
	else
		self.body = reader
		do self:addHeader("Content-Length", _g.jk.lang.String:forInteger(reader:getSize())) end
	end
	do return self end
end

function jk.http.server.HTTPServerResponse:getBody()
	do return self.body end
end

function jk.http.server.HTTPServerResponse:getHeaders()
	do return self.headers end
end

function jk.http.server.HTTPServerResponse:setHeaders(v)
	self.headers = v
	do return self end
end

function jk.http.server.HTTPServerResponse:getMessage()
	do return self.message end
end

function jk.http.server.HTTPServerResponse:setMessage(v)
	self.message = v
	do return self end
end

jk.http.server.HTTPServerJSONResponse = {}
jk.http.server.HTTPServerJSONResponse.__index = jk.http.server.HTTPServerJSONResponse
_vm:set_metatable(jk.http.server.HTTPServerJSONResponse, {})

function jk.http.server.HTTPServerJSONResponse._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerJSONResponse)
	return v
end

function jk.http.server.HTTPServerJSONResponse:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerJSONResponse'
	self['_isType.jk.http.server.HTTPServerJSONResponse'] = true
end

function jk.http.server.HTTPServerJSONResponse:_construct0()
	jk.http.server.HTTPServerJSONResponse._init(self)
	return self
end

function jk.http.server.HTTPServerJSONResponse:forError(eo)
	if (_vm:to_table_with_key(eo, '_isType.jk.lang.Error') ~= nil) then
		local error = eo
		local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do v:setString("status", "error") end
		if error ~= nil then
			local code = error:getCode()
			local detail = _g.jk.lang.String:asString(error:getDetail())
			if _g.jk.lang.String:isNotEmpty(code) then
				do v:setString("code", code) end
			end
			if _g.jk.lang.String:isNotEmpty(detail) then
				do v:setString("detail", detail) end
			end
		end
		do return v end
	end
	if (_vm:get_variable_type(eo) == 'string') then
		do return _g.jk.http.server.HTTPServerJSONResponse:forErrorCode(eo) end
	end
	do
		local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do v:setString("status", "error") end
		do return v end
	end
end

function jk.http.server.HTTPServerJSONResponse:forErrorCode(code)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("status", "error") end
	do v:setString("code", code) end
	do return v end
end

function jk.http.server.HTTPServerJSONResponse:forErrorMessage(message, code)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("status", "error") end
	if _g.jk.lang.String:isNotEmpty(message) then
		do v:setString("message", message) end
	end
	if _g.jk.lang.String:isNotEmpty(code) then
		do v:setString("code", code) end
	end
	do return v end
end

function jk.http.server.HTTPServerJSONResponse:forOk(data)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("status", "ok") end
	if data ~= nil then
		do v:setObject("data", data) end
	end
	do return v end
end

function jk.http.server.HTTPServerJSONResponse:forDetails(status, code, message)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	if _g.jk.lang.String:isNotEmpty(status) then
		do v:setString("status", status) end
	end
	if _g.jk.lang.String:isNotEmpty(code) then
		do v:setString("code", code) end
	end
	if _g.jk.lang.String:isNotEmpty(message) then
		do v:setString("message", message) end
	end
	do return v end
end

function jk.http.server.HTTPServerJSONResponse:forMissingData(type)
	if _g.jk.lang.String:isNotEmpty(type) then
		do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Missing data: " .. _g.jk.lang.String:safeString(type), "missing_data") end
	end
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Missing data", "missing_data") end
end

function jk.http.server.HTTPServerJSONResponse:forInvalidData(type)
	if _g.jk.lang.String:isNotEmpty(type) then
		do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Invalid data: " .. _g.jk.lang.String:safeString(type), "invalid_data") end
	end
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Invalid data", "invalid_data") end
end

function jk.http.server.HTTPServerJSONResponse:forAlreadyExists()
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Already exists", "already_exists") end
end

function jk.http.server.HTTPServerJSONResponse:forInvalidRequest(type)
	if _g.jk.lang.String:isNotEmpty(type) then
		do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Invalid request: " .. _g.jk.lang.String:safeString(type), "invalid_request") end
	end
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Invalid request", "invalid_request") end
end

function jk.http.server.HTTPServerJSONResponse:forNotAllowed()
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Not allowed", "not_allowed") end
end

function jk.http.server.HTTPServerJSONResponse:forNotAuthenticated()
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Not authenticated", "not_authenticated") end
end

function jk.http.server.HTTPServerJSONResponse:forFailedToCreate()
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Failed to create", "failed_to_create") end
end

function jk.http.server.HTTPServerJSONResponse:forNotFound()
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Not found", "not_found") end
end

function jk.http.server.HTTPServerJSONResponse:forAuthenticationFailed()
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Authentication failed", "authentication_failed") end
end

function jk.http.server.HTTPServerJSONResponse:forIncorrectUsernamePassword()
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Incorrect username and/or password", "authentication_failed") end
end

function jk.http.server.HTTPServerJSONResponse:forInternalError(details)
	if _g.jk.lang.String:isNotEmpty(details) then
		do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Internal error: " .. _g.jk.lang.String:safeString(details), "internal_error") end
	end
	do return _g.jk.http.server.HTTPServerJSONResponse:forErrorMessage("Internal error", "internal_error") end
end

jk.http.server.HTTPServerRequest = {}
jk.http.server.HTTPServerRequest.__index = jk.http.server.HTTPServerRequest
_vm:set_metatable(jk.http.server.HTTPServerRequest, {})

function jk.http.server.HTTPServerRequest._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequest)
	return v
end

function jk.http.server.HTTPServerRequest:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequest'
	self['_isType.jk.http.server.HTTPServerRequest'] = true
	self['_isType.jk.io.DataStreamSource'] = true
	self.method = nil
	self.urlString = nil
	self.version = nil
	self.rawHeaders = nil
	self.headers = nil
	self.url = nil
	self.connection = nil
	self.server = nil
	self.data = nil
	self.session = nil
	self.cookies = nil
	self.bodyBuffer = nil
	self.bodyString = nil
	self.postParameters = nil
	self.resources = nil
	self.currentResource = 0
	self.relativeResourcePath = nil
	self.responseSent = false
	self.responseCookies = nil
end

function jk.http.server.HTTPServerRequest:_construct0()
	jk.http.server.HTTPServerRequest._init(self)
	return self
end

function jk.http.server.HTTPServerRequest:forDetails(method, url, version, headers)
	local v = _g.jk.http.server.HTTPServerRequest._construct0(_g.jk.http.server.HTTPServerRequest._create())
	v.method = method
	v.urlString = url
	v.version = version
	do v:setHeaders(headers) end
	do return v end
end

function jk.http.server.HTTPServerRequest:asBuffer()
	if _g.jk.lang.String:isEmpty(self.method) or _g.jk.lang.String:isEmpty(self.urlString) or _g.jk.lang.String:isEmpty(self.version) or self.rawHeaders == nil then
		do return nil end
	end
	do
		local hdr = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do hdr:appendString(self.method) end
		do hdr:appendCharacter(32) end
		do hdr:appendString(self.urlString) end
		do hdr:appendCharacter(32) end
		do hdr:appendString(self.version) end
		do hdr:appendCharacter(13) end
		do hdr:appendCharacter(10) end
		do
			local itr = self:iterateHeaders()
			if not (itr ~= nil) then
				do return nil end
			end
			while true do
				local kvp = _vm:to_table_with_key(itr:next(), '_isType.jk.lang.KeyValuePair')
				if kvp == nil then
					do break end
				end
				do hdr:appendString(kvp.key) end
				do hdr:appendCharacter(58) end
				do hdr:appendCharacter(32) end
				do hdr:appendString(kvp.value) end
				do hdr:appendCharacter(13) end
				do hdr:appendCharacter(10) end
			end
			do hdr:appendCharacter(13) end
			do hdr:appendCharacter(10) end
			do
				local v = _g.jk.lang.String:toUTF8Buffer(hdr:toString())
				if not (v ~= nil) then
					do return nil end
				end
				if self.bodyBuffer ~= nil then
					v = _g.jk.lang.Buffer:append(v, self.bodyBuffer, -1)
				end
				do return v end
			end
		end
	end
end

function jk.http.server.HTTPServerRequest:setReceiverDataStream(stream)
	do self:setBodyReceiver(stream) end
end

function jk.http.server.HTTPServerRequest:setBodyReceiver(receiver)
	if not (receiver ~= nil) then
		do return end
	end
	if self.bodyBuffer ~= nil then
		local sz = #self.bodyBuffer
		if not receiver:onDataStreamStart(sz) then
			do return end
		end
		if not receiver:onDataStreamContent(self.bodyBuffer, sz) then
			do return end
		end
		do receiver:onDataStreamEnd() end
		do return end
	end
	if not (self.connection ~= nil) then
		do return end
	end
	do self.connection:setBodyReceiver(receiver) end
end

function jk.http.server.HTTPServerRequest:clearHeaders()
	self.rawHeaders = nil
	self.headers = nil
end

function jk.http.server.HTTPServerRequest:addHeader(key, value)
	if not (key ~= nil) then
		do return end
	end
	if not (self.rawHeaders ~= nil) then
		self.rawHeaders = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
	end
	if not (self.headers ~= nil) then
		self.headers = {}
	end
	do self.rawHeaders:add(key, value) end
	self.headers[_g.jk.lang.String:toLowerCase(key)] = value
end

function jk.http.server.HTTPServerRequest:setHeaders(headers)
	do self:clearHeaders() end
	if not (headers ~= nil) then
		do return end
	end
	do
		local it = headers:iterate()
		if not (it ~= nil) then
			do return end
		end
		while true do
			local kvp = it:next()
			if not (kvp ~= nil) then
				do break end
			end
			do self:addHeader(kvp.key, kvp.value) end
		end
	end
end

function jk.http.server.HTTPServerRequest:getHeader(name)
	if not _g.jk.lang.String:isNotEmpty(name) then
		do return nil end
	end
	if not (self.headers ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(self.headers, name) end
end

function jk.http.server.HTTPServerRequest:iterateHeaders()
	if not (self.rawHeaders ~= nil) then
		do return nil end
	end
	do return self.rawHeaders:iterate() end
end

function jk.http.server.HTTPServerRequest:getHeaders()
	do return self.headers end
end

function jk.http.server.HTTPServerRequest:getURL()
	if self.url == nil then
		self.url = _g.jk.url.URL:forString(self.urlString, true)
	end
	do return self.url end
end

function jk.http.server.HTTPServerRequest:getQueryParameters()
	local url = self:getURL()
	if not (url ~= nil) then
		do return nil end
	end
	do return url:getQueryParameters() end
end

function jk.http.server.HTTPServerRequest:iterateQueryParameters()
	local url = self:getURL()
	if not (url ~= nil) then
		do return nil end
	end
	do
		local list = url:getRawQueryParameters()
		if not (list ~= nil) then
			do return nil end
		end
		do return list:iterate() end
	end
end

function jk.http.server.HTTPServerRequest:getQueryParameter(key)
	local url = self:getURL()
	if not (url ~= nil) then
		do return nil end
	end
	do return url:getQueryParameter(key) end
end

function jk.http.server.HTTPServerRequest:getURLPath()
	local url = self:getURL()
	if not (url ~= nil) then
		do return nil end
	end
	do return url:getPath() end
end

function jk.http.server.HTTPServerRequest:getRemoteIPAddress()
	local rr = self:getRemoteAddress()
	if not (rr ~= nil) then
		do return nil end
	end
	do
		local colon = _g.jk.lang.String:getIndexOfCharacter(rr, 58, 0)
		if colon < 0 then
			do return rr end
		end
		do return _g.jk.lang.String:getSubString(rr, 0, colon) end
	end
end

function jk.http.server.HTTPServerRequest:getRemoteAddress()
	if not (self.connection ~= nil) then
		do return nil end
	end
	do return self.connection:getRemoteAddress() end
end

function jk.http.server.HTTPServerRequest:getConnectionClose()
	local hdr = self:getHeader("connection")
	if self.version == "HTTP/1.0" then
		if hdr == "keep-alive" then
			do return false end
		end
		do return true end
	end
	if hdr == "close" then
		do return true end
	end
	do return false end
end

function jk.http.server.HTTPServerRequest:getETag()
	do return self:getHeader("if-none-match") end
end

function jk.http.server.HTTPServerRequest:getCookieValues()
	if self.cookies == nil then
		local v = {}
		local cvals = self:getHeader("cookie")
		if cvals ~= nil then
			local sp = _g.jk.lang.String:split(cvals, 59, 0)
			if sp ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(sp)
				do
					n = 0
					while n < m do
						local ck = sp[n + 1]
						if ck ~= nil then
							ck = _g.jk.lang.String:strip(ck)
							if _g.jk.lang.String:isEmpty(ck) then
								goto _continue3
							end
							do
								local e = _g.jk.lang.String:getIndexOfCharacter(ck, 61, 0)
								if e < 0 then
									do _g.jk.lang.Map:set(v, ck, "") end
								else
									do _g.jk.lang.Map:set(v, _g.jk.lang.String:getSubString(ck, 0, e), _g.jk.lang.String:getEndOfString(ck, e + 1)) end
								end
							end
						end
						::_continue3::
						do n = n + 1 end
					end
				end
			end
		end
		self.cookies = v
	end
	do return self.cookies end
end

function jk.http.server.HTTPServerRequest:getCookieValue(name)
	local c = self:getCookieValues()
	if not (c ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(c, name) end
end

function jk.http.server.HTTPServerRequest:getBodyString()
	if self.bodyString == nil then
		local buffer = self:getBodyBuffer()
		if buffer ~= nil then
			self.bodyString = _g.jk.lang.String:forUTF8Buffer(buffer)
		end
		self.bodyBuffer = nil
	end
	do return self.bodyString end
end

function jk.http.server.HTTPServerRequest:getBodyJSONObject()
	do return _g.jk.json.JSONParser:parseString(self:getBodyString()) end
end

function jk.http.server.HTTPServerRequest:getBodyJSONVector()
	do return _vm:to_table_with_key(self:getBodyJSONObject(), '_isType.jk.lang.DynamicVector') end
end

function jk.http.server.HTTPServerRequest:getBodyJSONMap()
	do return _vm:to_table_with_key(self:getBodyJSONObject(), '_isType.jk.lang.DynamicMap') end
end

function jk.http.server.HTTPServerRequest:getBodyJSONMapValue(key)
	local map = self:getBodyJSONMap()
	if not (map ~= nil) then
		do return nil end
	end
	do return map:getString(key, nil) end
end

function jk.http.server.HTTPServerRequest:getPostParameters()
	if self.postParameters == nil then
		local bs = self:getBodyString()
		if _g.jk.lang.String:isEmpty(bs) then
			do return nil end
		end
		self.postParameters = _g.jk.url.QueryString:parse(bs)
	end
	do return self.postParameters end
end

function jk.http.server.HTTPServerRequest:getPostParameter(key)
	local pps = self:getPostParameters()
	if not (pps ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(pps, key) end
end

function jk.http.server.HTTPServerRequest:getParameterAsString(key)
	local qp = self:getQueryParameter(key)
	if qp ~= nil then
		do return qp end
	end
	do
		local pp = self:getPostParameter(key)
		if pp ~= nil then
			do return pp end
		end
		do
			local mv = self:getBodyJSONMapValue(key)
			if mv ~= nil then
				do return mv end
			end
			do return nil end
		end
	end
end

function jk.http.server.HTTPServerRequest:getParameterAsDynamicMap(key)
	local mm = self:getBodyJSONMap()
	if mm ~= nil then
		do return mm:getDynamicMap(key) end
	end
	do return nil end
end

function jk.http.server.HTTPServerRequest:getParameterAsDynamicVector(key)
	local mm = self:getBodyJSONMap()
	if mm ~= nil then
		do return mm:getDynamicVector(key) end
	end
	do
		local pp = self:getParameterAsString(key)
		if pp ~= nil then
			local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
			local array = _g.jk.lang.String:split(pp, 44, 0)
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local comp = array[n + 1]
						if comp ~= nil then
							do v:appendObject(comp) end
						end
						do n = n + 1 end
					end
				end
			end
			do return v end
		end
		do return nil end
	end
end

function jk.http.server.HTTPServerRequest:getParameterAsVector(key)
	local dv = self:getParameterAsDynamicVector(key)
	if not (dv ~= nil) then
		do return nil end
	end
	do return dv:toVector() end
end

function jk.http.server.HTTPServerRequest:getRelativeRequestPath(relativeTo)
	local path = self:getURLPath()
	if not (path ~= nil) then
		do return nil end
	end
	if relativeTo ~= nil and _g.jk.lang.String:startsWith(path, relativeTo, 0) then
		path = _g.jk.lang.String:getEndOfString(path, _g.jk.lang.String:getLength(relativeTo))
	else
		do return nil end
	end
	if _g.jk.lang.String:isEmpty(path) then
		path = "/"
	end
	do return path end
end

function jk.http.server.HTTPServerRequest:initResources()
	local path = self:getURLPath()
	if not (path ~= nil) then
		do return end
	end
	self.resources = _g.jk.lang.String:split(path, 47, 0)
	do _g.jk.lang.Vector:removeFirst(self.resources) end
	do
		local vsz = _g.jk.lang.Vector:getSize(self.resources)
		if vsz > 0 then
			local last = _g.jk.lang.Vector:get(self.resources, vsz - 1)
			if _g.jk.lang.String:isEmpty(last) then
				do _g.jk.lang.Vector:removeLast(self.resources) end
			end
		end
		self.currentResource = 0
	end
end

function jk.http.server.HTTPServerRequest:hasMoreResources()
	if not (self.resources ~= nil) then
		do self:initResources() end
	end
	if not (self.resources ~= nil) then
		do return false end
	end
	if self.currentResource < _g.jk.lang.Vector:getSize(self.resources) then
		do return true end
	end
	do return false end
end

function jk.http.server.HTTPServerRequest:getRemainingResourceCount()
	if not (self.resources ~= nil) then
		do self:initResources() end
	end
	if not (self.resources ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.Vector:getSize(self.resources) - self.currentResource - 1 end
end

function jk.http.server.HTTPServerRequest:acceptMethodAndResource(methodToAccept, resource, mustBeLastResource)
	if not (resource ~= nil) then
		do return false end
	end
	if methodToAccept == nil or self.method == methodToAccept then
		local cc = self:peekResource()
		if not (cc ~= nil) then
			do return false end
		end
		if not (cc == resource) then
			do return false end
		end
		do self:popResource() end
		if mustBeLastResource and self:hasMoreResources() then
			do self:unpopResource() end
			do return false end
		end
		do return true end
	end
	do return false end
end

function jk.http.server.HTTPServerRequest:acceptResource(resource, mustBeLastResource)
	if not (resource ~= nil) then
		do return false end
	end
	do
		local cc = self:peekResource()
		if not (cc ~= nil) then
			do return false end
		end
		if not (cc == resource) then
			do return false end
		end
		do self:popResource() end
		if mustBeLastResource and self:hasMoreResources() then
			do self:unpopResource() end
			do return false end
		end
		do return true end
	end
end

function jk.http.server.HTTPServerRequest:peekResource()
	if self.resources == nil then
		do self:initResources() end
	end
	if not (self.resources ~= nil) then
		do return nil end
	end
	if self.currentResource < _g.jk.lang.Vector:getSize(self.resources) then
		do return self.resources[self.currentResource + 1] end
	end
	do return nil end
end

function jk.http.server.HTTPServerRequest:getCurrentResource()
	do return self.currentResource end
end

function jk.http.server.HTTPServerRequest:setCurrentResource(value)
	self.currentResource = value
	self.relativeResourcePath = nil
end

function jk.http.server.HTTPServerRequest:popResource()
	if self.resources == nil then
		do self:initResources() end
	end
	do
		local v = self:peekResource()
		if v ~= nil then
			do self.currentResource = self.currentResource + 1 end
			self.relativeResourcePath = nil
		end
		do return v end
	end
end

function jk.http.server.HTTPServerRequest:unpopResource()
	if self.currentResource > 0 then
		do self.currentResource = self.currentResource - 1 end
		self.relativeResourcePath = nil
	end
end

function jk.http.server.HTTPServerRequest:resetResources()
	self.resources = nil
	self.currentResource = 0
	self.relativeResourcePath = nil
end

function jk.http.server.HTTPServerRequest:getRelativeResources()
	if not (self.resources ~= nil) then
		do self:initResources() end
	end
	if not (self.resources ~= nil) then
		do return nil end
	end
	if self.currentResource < 1 then
		do return self.resources end
	end
	do
		local v = {}
		local cr = self.currentResource
		while cr < _g.jk.lang.Vector:getSize(self.resources) do
			do _g.jk.lang.Vector:append(v, self.resources[cr + 1]) end
			do cr = cr + 1 end
		end
		do return v end
	end
end

function jk.http.server.HTTPServerRequest:getResourcePathComponent(index, nTrailingComponents)
	if index < 0 then
		do return nil end
	end
	if not (self.resources ~= nil) then
		do self:initResources() end
	end
	if not (self.resources ~= nil) then
		do return nil end
	end
	do
		local max = nTrailingComponents
		local vsz = _g.jk.lang.Vector:getSize(self.resources)
		if max < 0 then
			max = vsz
		end
		if max > vsz then
			max = vsz
		end
		if index >= max then
			do return nil end
		end
		if max < vsz then
			do return _g.jk.lang.Vector:get(self.resources, index + vsz - max) end
		end
		do return _g.jk.lang.Vector:get(self.resources, index) end
	end
end

function jk.http.server.HTTPServerRequest:getRelativeResourcePath()
	if self.resources == nil then
		do return self:getURLPath() end
	end
	if self.relativeResourcePath == nil then
		local rrs = self:getRelativeResources()
		if rrs ~= nil then
			local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			if rrs ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(rrs)
				do
					n = 0
					while n < m do
						local rr = rrs[n + 1]
						if rr ~= nil then
							if _g.jk.lang.String:isEmpty(rr) == false then
								do sb:appendCharacter(47) end
								do sb:appendString(rr) end
							end
						end
						do n = n + 1 end
					end
				end
			end
			if sb:count() < 1 then
				do sb:appendCharacter(47) end
			end
			self.relativeResourcePath = sb:toString()
		end
	end
	do return self.relativeResourcePath end
end

function jk.http.server.HTTPServerRequest:isForResource(res)
	if not (res ~= nil) then
		do return false end
	end
	do
		local rrp = self:getRelativeResourcePath()
		if not (rrp ~= nil) then
			do return false end
		end
		if rrp == res then
			do return true end
		end
		do return false end
	end
end

function jk.http.server.HTTPServerRequest:isForDirectory()
	local path = self:getURLPath()
	if path ~= nil and _g.jk.lang.String:endsWith(path, "/") then
		do return true end
	end
	do return false end
end

function jk.http.server.HTTPServerRequest:isForPrefix(res)
	if not (res ~= nil) then
		do return false end
	end
	do
		local rr = self:getRelativeResourcePath()
		if rr ~= nil and _g.jk.lang.String:startsWith(rr, res, 0) then
			do return true end
		end
		do return false end
	end
end

function jk.http.server.HTTPServerRequest:isForMethod(mm)
	if not (mm ~= nil) then
		do return false end
	end
	if mm == self.method then
		do return true end
	end
	do return false end
end

function jk.http.server.HTTPServerRequest:isGET()
	do return self.method == "GET" end
end

function jk.http.server.HTTPServerRequest:isPOST()
	do return self.method == "POST" end
end

function jk.http.server.HTTPServerRequest:isDELETE()
	do return self.method == "DELETE" end
end

function jk.http.server.HTTPServerRequest:isPUT()
	do return self.method == "PUT" end
end

function jk.http.server.HTTPServerRequest:isPATCH()
	do return self.method == "PATCH" end
end

function jk.http.server.HTTPServerRequest:sendJSONObject(o)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forJSONString(_g.jk.json.JSONEncoder:encode(o, true, false))) end
end

function jk.http.server.HTTPServerRequest:sendJSONString(json)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forJSONString(json)) end
end

function jk.http.server.HTTPServerRequest:sendJSONError(error)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forJSONString(_g.jk.json.JSONEncoder:encode(_g.jk.http.server.HTTPServerJSONResponse:forError(error), true, false))) end
end

function jk.http.server.HTTPServerRequest:sendJSONOK(data)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forJSONString(_g.jk.json.JSONEncoder:encode(_g.jk.http.server.HTTPServerJSONResponse:forOk(data), true, false))) end
end

function jk.http.server.HTTPServerRequest:sendInternalError(text)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(text)) end
end

function jk.http.server.HTTPServerRequest:sendNotAllowed()
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPNotAllowed(nil)) end
end

function jk.http.server.HTTPServerRequest:sendNotFound()
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPNotFound(nil)) end
end

function jk.http.server.HTTPServerRequest:sendInvalidRequest(text)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInvalidRequest(text)) end
end

function jk.http.server.HTTPServerRequest:sendTextString(text)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forTextString(text)) end
end

function jk.http.server.HTTPServerRequest:sendHTMLString(html)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTMLString(html)) end
end

function jk.http.server.HTTPServerRequest:sendXMLString(xml)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forXMLString(xml)) end
end

function jk.http.server.HTTPServerRequest:sendFile(file)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forFile(file, -1)) end
end

function jk.http.server.HTTPServerRequest:sendBuffer(buffer, mimeType)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forBuffer(buffer, mimeType)) end
end

function jk.http.server.HTTPServerRequest:sendRedirect(url)
	do self:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPMovedTemporarily(url)) end
end

function jk.http.server.HTTPServerRequest:sendRedirectAsDirectory()
	local path = self:getURLPath()
	if path == nil then
		path = ""
	end
	do self:sendRedirect(_g.jk.lang.String:safeString(path) .. "/") end
end

function jk.http.server.HTTPServerRequest:sendFromDirectory(resourceDir)
	if not (resourceDir ~= nil and resourceDir:isDirectory()) then
		do self:sendNotFound() end
		do return end
	end
	do
		local name = self:popResource()
		if not _g.jk.lang.String:isNotEmpty(name) then
			do self:sendNotFound() end
			do return end
		end
		do
			local ff = resourceDir:entry(name)
			if not ff:isFile() then
				do self:sendNotFound() end
				do return end
			end
			do self:sendFile(ff) end
		end
	end
end

function jk.http.server.HTTPServerRequest:isResponseSent()
	do return self.responseSent end
end

function jk.http.server.HTTPServerRequest:addResponseCookie(cookie)
	if not (cookie ~= nil) then
		do return end
	end
	if self.responseCookies == nil then
		self.responseCookies = {}
	end
	do _g.jk.lang.Vector:append(self.responseCookies, cookie) end
end

function jk.http.server.HTTPServerRequest:sendResponse(resp)
	if not (self.server ~= nil) then
		do return end
	end
	if self.responseSent then
		do return end
	end
	if self.responseCookies ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.responseCookies)
		do
			n = 0
			while n < m do
				local cookie = self.responseCookies[n + 1]
				if cookie ~= nil then
					do resp:addCookie(cookie) end
				end
				do n = n + 1 end
			end
		end
	end
	self.responseCookies = nil
	do self.server:sendResponse(self.connection, self, resp) end
	self.responseSent = true
end

function jk.http.server.HTTPServerRequest:startBufferResponseWorker(buffer, mimeType)
	local worker = _g.jk.http.server.HTTPServerBinaryReaderResponseWorker:forReader(_g.jk.io.BufferReader:forBuffer(buffer))
	if not (worker ~= nil) then
		do return false end
	end
	do worker:setMimeType(mimeType) end
	do return self:startResponseWorker(worker) end
end

function jk.http.server.HTTPServerRequest:startResponse(resp)
	if not (self.server ~= nil) then
		do return nil end
	end
	if not (self.responseSent == false) then
		do return nil end
	end
	if self.responseCookies ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.responseCookies)
		do
			n = 0
			while n < m do
				local cookie = self.responseCookies[n + 1]
				if cookie ~= nil then
					do resp:addCookie(cookie) end
				end
				do n = n + 1 end
			end
		end
	end
	self.responseCookies = nil
	self.responseSent = true
	do return self.server:startResponse(self.connection, self, resp) end
end

function jk.http.server.HTTPServerRequest:startResponseWorker(worker)
	if not (worker ~= nil) then
		do return false end
	end
	do
		local rs = self:startResponse(_g.jk.http.server.HTTPServerResponse:forOk(worker:getMimeType()))
		if not (rs ~= nil) then
			do return false end
		end
		do worker:setSession(rs) end
		do return self.server:startResponseWorker(worker) end
	end
end

function jk.http.server.HTTPServerRequest:toMyPacket()
	local builder = _g.jk.mypacket.MyPacketBuilder._construct0(_g.jk.mypacket.MyPacketBuilder._create())
	do builder:appendLengthEncodedString(self:getMethod()) end
	do builder:appendLengthEncodedString(self:getUrlString()) end
	do
		local nheaders = 0
		if self.rawHeaders ~= nil then
			nheaders = self.rawHeaders:count()
		end
		do builder:appendLengthEncodedInteger(nheaders) end
		do
			local n = 0
			while n < nheaders do
				local key = self.rawHeaders:getKey(n)
				local val = self.rawHeaders:getValue(n)
				if not (key ~= nil) then
					key = ""
				end
				if not (val ~= nil) then
					val = ""
				end
				do builder:appendLengthEncodedString(key) end
				do builder:appendLengthEncodedString(val) end
				do n = n + 1 end
			end
		end
		do builder:appendLengthEncodedBuffer(self:getBodyBuffer()) end
		do return builder:finalize() end
	end
end

function jk.http.server.HTTPServerRequest:getMethod()
	do return self.method end
end

function jk.http.server.HTTPServerRequest:setMethod(v)
	self.method = v
	do return self end
end

function jk.http.server.HTTPServerRequest:getUrlString()
	do return self.urlString end
end

function jk.http.server.HTTPServerRequest:setUrlString(v)
	self.urlString = v
	do return self end
end

function jk.http.server.HTTPServerRequest:getVersion()
	do return self.version end
end

function jk.http.server.HTTPServerRequest:setVersion(v)
	self.version = v
	do return self end
end

function jk.http.server.HTTPServerRequest:getConnection()
	do return self.connection end
end

function jk.http.server.HTTPServerRequest:setConnection(v)
	self.connection = v
	do return self end
end

function jk.http.server.HTTPServerRequest:getServer()
	do return self.server end
end

function jk.http.server.HTTPServerRequest:setServer(v)
	self.server = v
	do return self end
end

function jk.http.server.HTTPServerRequest:getData()
	do return self.data end
end

function jk.http.server.HTTPServerRequest:setData(v)
	self.data = v
	do return self end
end

function jk.http.server.HTTPServerRequest:getSession()
	do return self.session end
end

function jk.http.server.HTTPServerRequest:setSession(v)
	self.session = v
	do return self end
end

function jk.http.server.HTTPServerRequest:getBodyBuffer()
	do return self.bodyBuffer end
end

function jk.http.server.HTTPServerRequest:setBodyBuffer(v)
	self.bodyBuffer = v
	do return self end
end

jk.http.server.HTTPServerRequestHandlerContainer = _g.jk.http.server.HTTPServerRequestHandlerAdapter._create()
jk.http.server.HTTPServerRequestHandlerContainer.__index = jk.http.server.HTTPServerRequestHandlerContainer
_vm:set_metatable(jk.http.server.HTTPServerRequestHandlerContainer, {
	__index = _g.jk.http.server.HTTPServerRequestHandlerAdapter
})

function jk.http.server.HTTPServerRequestHandlerContainer._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequestHandlerContainer)
	return v
end

function jk.http.server.HTTPServerRequestHandlerContainer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequestHandlerContainer'
	self['_isType.jk.http.server.HTTPServerRequestHandlerContainer'] = true
end

function jk.http.server.HTTPServerRequestHandlerContainer:_construct0()
	jk.http.server.HTTPServerRequestHandlerContainer._init(self)
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter._construct0(self) end
	return self
end

function jk.http.server.HTTPServerRequestHandlerContainer:iterateRequestHandlers()
end

function jk.http.server.HTTPServerRequestHandlerContainer:initialize(server)
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.initialize(self, server) end
	do
		local it = self:iterateRequestHandlers()
		while it ~= nil do
			local handler = it:next()
			if handler == nil then
				do break end
			end
			if (_vm:to_table_with_key(handler, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do handler:initialize(server) end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerContainer:onRefresh()
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.onRefresh(self) end
	do
		local it = self:iterateRequestHandlers()
		while it ~= nil do
			local handler = it:next()
			if handler == nil then
				do break end
			end
			if (_vm:to_table_with_key(handler, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do handler:onRefresh() end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerContainer:onMaintenance()
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.onMaintenance(self) end
	do
		local it = self:iterateRequestHandlers()
		while it ~= nil do
			local handler = it:next()
			if handler == nil then
				do break end
			end
			if (_vm:to_table_with_key(handler, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do handler:onMaintenance() end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestHandlerContainer:cleanup()
	do _g.jk.http.server.HTTPServerRequestHandlerAdapter.cleanup(self) end
	do
		local it = self:iterateRequestHandlers()
		while it ~= nil do
			local handler = it:next()
			if handler == nil then
				do break end
			end
			if (_vm:to_table_with_key(handler, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
				do handler:cleanup() end
			end
		end
	end
end

jk.http.server.HTTPServerExternalCommandResponseWorker = _g.jk.http.server.HTTPServerResponseWorker._create()
jk.http.server.HTTPServerExternalCommandResponseWorker.__index = jk.http.server.HTTPServerExternalCommandResponseWorker
_vm:set_metatable(jk.http.server.HTTPServerExternalCommandResponseWorker, {
	__index = _g.jk.http.server.HTTPServerResponseWorker
})

function jk.http.server.HTTPServerExternalCommandResponseWorker._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerExternalCommandResponseWorker)
	return v
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerExternalCommandResponseWorker'
	self['_isType.jk.http.server.HTTPServerExternalCommandResponseWorker'] = true
	self.launcher = nil
	self.mimeType = nil
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:forProcessLauncher(launcher)
	local v = _g.jk.http.server.HTTPServerExternalCommandResponseWorker._construct0(_g.jk.http.server.HTTPServerExternalCommandResponseWorker._create())
	do v:setLauncher(launcher) end
	do return v end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:forFile(file)
	do return _g.jk.http.server.HTTPServerExternalCommandResponseWorker:forProcessLauncher(_g.jk.process.ProcessLauncher:forFile(file, nil)) end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:forCommand(command)
	do return _g.jk.http.server.HTTPServerExternalCommandResponseWorker:forProcessLauncher(_g.jk.process.ProcessLauncher:forCommand(command, nil)) end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:_construct0()
	jk.http.server.HTTPServerExternalCommandResponseWorker._init(self)
	do _g.jk.http.server.HTTPServerResponseWorker._construct0(self) end
	self.mimeType = "text/plain"
	return self
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:setMimeType(value)
	self.mimeType = value
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:getMimeType()
	do return self.mimeType end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:getWorkerDescription()
	do return "HTTPServerExternalCommandResponseWorker" end
end

jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver = {}
jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver.__index = jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver
_vm:set_metatable(jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver, {})

function jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver)
	return v
end

function jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver'
	self['_isType.jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver'] = true
	self['_isType.jk.lang.BufferDataReceiver'] = true
	self.session = nil
end

function jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver:_construct0()
	jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver._init(self)
	return self
end

function jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver:onBufferData(data, size)
	if not self.session:writeData(data, size) then
		do return false end
	end
	do return true end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver:getSession()
	do return self.session end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver:setSession(v)
	self.session = v
	do return self end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:execute()
	if not (self.launcher ~= nil) then
		do return end
	end
	do
		local md = _g.jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver._construct0(_g.jk.http.server.HTTPServerExternalCommandResponseWorker.MyDataReceiver._create())
		do md:setSession(self.session) end
		do self.launcher:executeToPipe(md) end
	end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:getLauncher()
	do return self.launcher end
end

function jk.http.server.HTTPServerExternalCommandResponseWorker:setLauncher(v)
	self.launcher = v
	do return self end
end

jk.http.server.HTTPServerRequestLogger = {}
jk.http.server.HTTPServerRequestLogger.__index = jk.http.server.HTTPServerRequestLogger
_vm:set_metatable(jk.http.server.HTTPServerRequestLogger, {})

function jk.http.server.HTTPServerRequestLogger._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequestLogger)
	return v
end

function jk.http.server.HTTPServerRequestLogger:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequestLogger'
	self['_isType.jk.http.server.HTTPServerRequestLogger'] = true
	self['_isType.jk.http.server.HTTPServerRequestHandlerListener'] = true
	self.logdir = nil
	self.logContext = nil
end

function jk.http.server.HTTPServerRequestLogger:_construct0()
	jk.http.server.HTTPServerRequestLogger._init(self)
	return self
end

function jk.http.server.HTTPServerRequestLogger:onRequestHandled(request, resp, written, aremoteAddress)
	local remoteAddress = aremoteAddress
	if _g.jk.lang.String:isEmpty(remoteAddress) then
		remoteAddress = "-"
	end
	do
		local username = nil
		if _g.jk.lang.String:isEmpty(username) then
			username = "-"
		end
		do
			local sessionid = nil
			if _g.jk.lang.String:isEmpty(sessionid) then
				sessionid = "-"
			end
			do
				local dt = _g.jk.time.SystemClock:asDateTimeUTC()
				local logTime = nil
				if dt ~= nil then
					logTime = _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getDayOfMonth())) .. "/" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getMonth())) .. "/" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getYear())) .. "/" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getHours())) .. "/" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getMinutes())) .. "/" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getSeconds())) .. " UTC"
				else
					logTime = "[DATE/TIME]"
				end
				do
					local rf = request:getHeader("referer")
					if _g.jk.lang.String:isEmpty(rf) then
						rf = "-"
					end
					do
						local logLine = _g.jk.lang.String:safeString(remoteAddress) .. " " .. _g.jk.lang.String:safeString(username) .. " " .. _g.jk.lang.String:safeString(sessionid) .. " [" .. _g.jk.lang.String:safeString(logTime) .. "] \"" .. _g.jk.lang.String:safeString(request:getMethod()) .. " " .. _g.jk.lang.String:safeString(request:getURLPath()) .. " " .. _g.jk.lang.String:safeString(request:getVersion()) .. "\" " .. _g.jk.lang.String:safeString(resp:getStatus()) .. " " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(written)) .. " \"" .. _g.jk.lang.String:safeString(rf) .. "\" \"" .. _g.jk.lang.String:safeString(request:getHeader("user-agent")) .. "\""
						if self.logdir ~= nil then
							local logidname = nil
							if dt ~= nil then
								logidname = "accesslog_" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getYear())) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getMonth())) .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(dt:getDayOfMonth())) .. ".log"
							else
								logidname = "accesslog.log"
							end
							do
								local os = _g.jk.io.PrintWriterWrapper:forWriter(self.logdir:entry(logidname):append())
								if os == nil and self.logdir:isDirectory() == false then
									do self.logdir:createDirectoryRecursive() end
									os = _g.jk.io.PrintWriterWrapper:forWriter(self.logdir:entry(logidname):append())
								end
								if os ~= nil then
									do os:println(logLine) end
								end
								do _g.jk.log.Log:debug(self.logContext, logLine) end
							end
						elseif self.logContext ~= nil then
							do _g.jk.log.Log:info(self.logContext, logLine) end
						else
							_io:write_to_stdout(logLine .. "\n")
						end
					end
				end
			end
		end
	end
end

function jk.http.server.HTTPServerRequestLogger:getLogdir()
	do return self.logdir end
end

function jk.http.server.HTTPServerRequestLogger:setLogdir(v)
	self.logdir = v
	do return self end
end

function jk.http.server.HTTPServerRequestLogger:getLogContext()
	do return self.logContext end
end

function jk.http.server.HTTPServerRequestLogger:setLogContext(v)
	self.logContext = v
	do return self end
end

jk.http.server.HTTPServerRequestHandlerStack = _g.jk.http.server.HTTPServerRequestHandlerContainer._create()
jk.http.server.HTTPServerRequestHandlerStack.__index = jk.http.server.HTTPServerRequestHandlerStack
_vm:set_metatable(jk.http.server.HTTPServerRequestHandlerStack, {
	__index = _g.jk.http.server.HTTPServerRequestHandlerContainer
})

function jk.http.server.HTTPServerRequestHandlerStack._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequestHandlerStack)
	return v
end

function jk.http.server.HTTPServerRequestHandlerStack:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequestHandlerStack'
	self['_isType.jk.http.server.HTTPServerRequestHandlerStack'] = true
	self.requestHandlers = nil
end

function jk.http.server.HTTPServerRequestHandlerStack:_construct0()
	jk.http.server.HTTPServerRequestHandlerStack._init(self)
	do _g.jk.http.server.HTTPServerRequestHandlerContainer._construct0(self) end
	return self
end

jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler = {}
jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler.__index = jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler
_vm:set_metatable(jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler, {})

function jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler)
	return v
end

function jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler'
	self['_isType.jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler'] = true
	self['_isType.jk.http.server.HTTPServerRequestHandler'] = true
	self.handler = nil
end

function jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler:_construct0()
	jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler._init(self)
	return self
end

function jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler:handleRequest(req, next)
	do self.handler(req, next) end
end

function jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler:getHandler()
	do return self.handler end
end

function jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler:setHandler(v)
	self.handler = v
	do return self end
end

jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor = {}
jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor.__index = jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor
_vm:set_metatable(jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor, {})

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor)
	return v
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor'
	self['_isType.jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor'] = true
	self.requestHandlers = nil
	self.request = nil
	self.last = nil
	self.current = 0
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:_construct0()
	jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor._init(self)
	return self
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:start()
	self.current = -1
	do self:next() end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:next()
	do self.current = self.current + 1 end
	do
		local handler = _g.jk.lang.Vector:get(self.requestHandlers, self.current)
		if handler == nil then
			if self.last == nil then
				do self:defaultLast() end
			else
				do self.last() end
			end
			do return end
		end
		do handler:handleRequest(self.request, function()
			do self:next() end
		end) end
		do self.request:resetResources() end
	end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:defaultLast()
	do self.request:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPNotFound(nil)) end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:getRequestHandlers()
	do return self.requestHandlers end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:setRequestHandlers(v)
	self.requestHandlers = v
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:getRequest()
	do return self.request end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:setRequest(v)
	self.request = v
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:getLast()
	do return self.last end
end

function jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor:setLast(v)
	self.last = v
	do return self end
end

function jk.http.server.HTTPServerRequestHandlerStack:iterateRequestHandlers()
	if not (self.requestHandlers ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Vector:iterate(self.requestHandlers) end
end

function jk.http.server.HTTPServerRequestHandlerStack:pushRequestHandler1(handler)
	if not (handler ~= nil) then
		do return end
	end
	do self:pushRequestHandler2(_g.jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler._construct0(_g.jk.http.server.HTTPServerRequestHandlerStack.FunctionRequestHandler._create()):setHandler(handler)) end
end

function jk.http.server.HTTPServerRequestHandlerStack:pushRequestHandler2(handler)
	if not (handler ~= nil) then
		do return end
	end
	if self.requestHandlers == nil then
		self.requestHandlers = {}
	end
	do _g.jk.lang.Vector:append(self.requestHandlers, handler) end
	if (_vm:to_table_with_key(handler, '_isType.jk.http.server.HTTPServerComponent') ~= nil) and self:isInitialized() then
		do handler:initialize(self:getServer()) end
	end
end

function jk.http.server.HTTPServerRequestHandlerStack:handleRequest(req, next)
	local rp = _g.jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor._construct0(_g.jk.http.server.HTTPServerRequestHandlerStack.RequestProcessor._create())
	do rp:setRequestHandlers(self.requestHandlers) end
	do rp:setRequest(req) end
	do rp:setLast(next) end
	do rp:start() end
end

jk.http.server.HTTPServer = _g.jk.http.server.HTTPServerBase._create()
jk.http.server.HTTPServer.__index = jk.http.server.HTTPServer
_vm:set_metatable(jk.http.server.HTTPServer, {
	__index = _g.jk.http.server.HTTPServerBase
})

function jk.http.server.HTTPServer._create()
	local v = _vm:set_metatable({}, jk.http.server.HTTPServer)
	return v
end

function jk.http.server.HTTPServer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.HTTPServer'
	self['_isType.jk.http.server.HTTPServer'] = true
	self.createOptionsResponseHandler = nil
	self.requestHandlerListenerFunctions = nil
	self.requestHandlerListenerObjects = nil
	self.handlerStack = nil
end

function jk.http.server.HTTPServer:_construct0()
	jk.http.server.HTTPServer._init(self)
	do _g.jk.http.server.HTTPServerBase._construct0(self) end
	self.handlerStack = _g.jk.http.server.HTTPServerRequestHandlerStack._construct0(_g.jk.http.server.HTTPServerRequestHandlerStack._create())
	return self
end

function jk.http.server.HTTPServer:initialize2()
	if not _g.jk.http.server.HTTPServerBase.initialize2(self) then
		do return false end
	end
	do self.handlerStack:initialize(self) end
	if self.requestHandlerListenerObjects ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.requestHandlerListenerObjects)
		do
			n = 0
			while n < m do
				local listener = self.requestHandlerListenerObjects[n + 1]
				if listener ~= nil then
					if (_vm:to_table_with_key(listener, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
						do listener:initialize(self) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return true end
end

function jk.http.server.HTTPServer:onRefresh()
	do _g.jk.http.server.HTTPServerBase.onRefresh(self) end
	do self.handlerStack:onRefresh() end
	if self.requestHandlerListenerObjects ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.requestHandlerListenerObjects)
		do
			n = 0
			while n < m do
				local listener = self.requestHandlerListenerObjects[n + 1]
				if listener ~= nil then
					if (_vm:to_table_with_key(listener, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
						do listener:onRefresh() end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function jk.http.server.HTTPServer:onMaintenance()
	do _g.jk.http.server.HTTPServerBase.onMaintenance(self) end
	do self.handlerStack:onMaintenance() end
	if self.requestHandlerListenerObjects ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.requestHandlerListenerObjects)
		do
			n = 0
			while n < m do
				local listener = self.requestHandlerListenerObjects[n + 1]
				if listener ~= nil then
					if (_vm:to_table_with_key(listener, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
						do listener:onMaintenance() end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function jk.http.server.HTTPServer:cleanup()
	do _g.jk.http.server.HTTPServerBase.cleanup(self) end
	do self.handlerStack:cleanup() end
	if self.requestHandlerListenerObjects ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.requestHandlerListenerObjects)
		do
			n = 0
			while n < m do
				local listener = self.requestHandlerListenerObjects[n + 1]
				if listener ~= nil then
					if (_vm:to_table_with_key(listener, '_isType.jk.http.server.HTTPServerComponent') ~= nil) then
						do listener:cleanup() end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function jk.http.server.HTTPServer:pushRequestHandler1(handler)
	do self.handlerStack:pushRequestHandler1(handler) end
end

function jk.http.server.HTTPServer:pushRequestHandler2(handler)
	do self.handlerStack:pushRequestHandler2(handler) end
end

function jk.http.server.HTTPServer:addRequestHandlerListener1(handler)
	if self.requestHandlerListenerFunctions == nil then
		self.requestHandlerListenerFunctions = {}
	end
	do _g.jk.lang.Vector:append(self.requestHandlerListenerFunctions, handler) end
end

function jk.http.server.HTTPServer:addRequestHandlerListener2(handler)
	if self.requestHandlerListenerObjects == nil then
		self.requestHandlerListenerObjects = {}
	end
	do _g.jk.lang.Vector:append(self.requestHandlerListenerObjects, handler) end
	if (_vm:to_table_with_key(handler, '_isType.jk.http.server.HTTPServerComponent') ~= nil) and self:isInitialized() then
		do handler:initialize(self) end
	end
end

function jk.http.server.HTTPServer:createOptionsResponse(req)
	if self.createOptionsResponseHandler ~= nil then
		do return self.createOptionsResponseHandler(req) end
	end
	do return _g.jk.http.server.HTTPServerBase.createOptionsResponse(self, req) end
end

function jk.http.server.HTTPServer:onRequest(req)
	local rq = req
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self.handlerStack:handleRequest(_vm:to_table_with_key(req, '_isType.jk.http.server.HTTPServerRequest'), function()
				do rq:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPNotFound(nil)) end
			end) end
		end)
		if _err then
			local e = _err
			do _g.jk.log.Log:error(self.logContext, "Exception while processing request: " .. _g.jk.lang.String:safeString(_g.jk.log.Log:asString(self.logContext, e))) end
			do rq:sendResponse(_g.jk.http.server.HTTPServerResponse:forHTTPInternalError(nil)) end
		end
	end
end

function jk.http.server.HTTPServer:onRequestComplete(request, resp, bytesSent, remoteAddress)
	do _g.jk.http.server.HTTPServerBase.onRequestComplete(self, request, resp, bytesSent, remoteAddress) end
	if self.requestHandlerListenerFunctions ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.requestHandlerListenerFunctions)
		do
			n = 0
			while n < m do
				local handler = self.requestHandlerListenerFunctions[n + 1]
				if handler ~= nil then
					do handler(request, resp, bytesSent, remoteAddress) end
				end
				do n = n + 1 end
			end
		end
	end
	if self.requestHandlerListenerObjects ~= nil then
		local n2 = 0
		local m2 = _g.jk.lang.Vector:getSize(self.requestHandlerListenerObjects)
		do
			n2 = 0
			while n2 < m2 do
				local handler = self.requestHandlerListenerObjects[n2 + 1]
				if handler ~= nil then
					do handler:onRequestHandled(request, resp, bytesSent, remoteAddress) end
				end
				do n2 = n2 + 1 end
			end
		end
	end
end

function jk.http.server.HTTPServer:getCreateOptionsResponseHandler()
	do return self.createOptionsResponseHandler end
end

function jk.http.server.HTTPServer:setCreateOptionsResponseHandler(v)
	self.createOptionsResponseHandler = v
	do return self end
end
