jk = jk or {}

jk.http = jk.http or {}

jk.http.client = jk.http.client or {}

jk.http.client.HTTPClientRequest = {}
jk.http.client.HTTPClientRequest.__index = jk.http.client.HTTPClientRequest
_vm:set_metatable(jk.http.client.HTTPClientRequest, {})

function jk.http.client.HTTPClientRequest._create()
	local v = _vm:set_metatable({}, jk.http.client.HTTPClientRequest)
	return v
end

function jk.http.client.HTTPClientRequest:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.client.HTTPClientRequest'
	self['_isType.jk.http.client.HTTPClientRequest'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.method = nil
	self.protocol = nil
	self.username = nil
	self.password = nil
	self.serverAddress = nil
	self.serverPort = 0
	self.requestPath = nil
	self.body = nil
	self.queryParams = nil
	self.rawHeaders = nil
	self.headers = nil
end

function jk.http.client.HTTPClientRequest:forGET(url)
	local v = _g.jk.http.client.HTTPClientRequest._construct0(_g.jk.http.client.HTTPClientRequest._create())
	do v:setMethod("GET") end
	do v:setUrl(url) end
	do return v end
end

function jk.http.client.HTTPClientRequest:forPOST1(url, mimeType, data)
	local v = _g.jk.http.client.HTTPClientRequest._construct0(_g.jk.http.client.HTTPClientRequest._create())
	do v:setMethod("POST") end
	do v:setUrl(url) end
	if _g.jk.lang.String:isEmpty(mimeType) == false then
		do v:addHeader("Content-Type", mimeType) end
	end
	if data ~= nil then
		do v:setBody(data) end
	end
	do return v end
end

function jk.http.client.HTTPClientRequest:forPOST2(url, file)
	if not (url ~= nil) then
		do return nil end
	end
	if not (file ~= nil) then
		do return nil end
	end
	do
		local reader = file:read()
		if not (reader ~= nil) then
			do return nil end
		end
		do return _g.jk.http.client.HTTPClientRequest:forPOST1(url, _g.jk.mime.MimeTypeRegistry:getSharedInstance():getTypeForFile(file), reader) end
	end
end

function jk.http.client.HTTPClientRequest:forPOST3(url, mimeType, data)
	local v = _g.jk.http.client.HTTPClientRequest._construct0(_g.jk.http.client.HTTPClientRequest._create())
	do v:setMethod("POST") end
	do v:setUrl(url) end
	if _g.jk.lang.String:isEmpty(mimeType) == false then
		do v:addHeader("Content-Type", mimeType) end
	end
	if data ~= nil then
		do v:setBody(_g.jk.io.BufferReader:forBuffer(data)) end
	end
	do return v end
end

function jk.http.client.HTTPClientRequest:forPUT1(url, mimeType, data)
	local v = _g.jk.http.client.HTTPClientRequest._construct0(_g.jk.http.client.HTTPClientRequest._create())
	do v:setMethod("PUT") end
	do v:setUrl(url) end
	if _g.jk.lang.String:isEmpty(mimeType) == false then
		do v:addHeader("Content-Type", mimeType) end
	end
	if data ~= nil then
		do v:setBody(data) end
	end
	do return v end
end

function jk.http.client.HTTPClientRequest:forPUT2(url, file)
	if not (url ~= nil) then
		do return nil end
	end
	if not (file ~= nil) then
		do return nil end
	end
	do
		local reader = file:read()
		if not (reader ~= nil) then
			do return nil end
		end
		do return _g.jk.http.client.HTTPClientRequest:forPUT1(url, _g.jk.mime.MimeTypeRegistry:getSharedInstance():getTypeForFile(file), reader) end
	end
end

function jk.http.client.HTTPClientRequest:forPUT3(url, mimeType, data)
	local v = _g.jk.http.client.HTTPClientRequest._construct0(_g.jk.http.client.HTTPClientRequest._create())
	do v:setMethod("PUT") end
	do v:setUrl(url) end
	if _g.jk.lang.String:isEmpty(mimeType) == false then
		do v:addHeader("Content-Type", mimeType) end
	end
	if data ~= nil then
		do v:setBody(_g.jk.io.BufferReader:forBuffer(data)) end
	end
	do return v end
end

function jk.http.client.HTTPClientRequest:forDELETE(url)
	local v = _g.jk.http.client.HTTPClientRequest._construct0(_g.jk.http.client.HTTPClientRequest._create())
	do v:setMethod("DELETE") end
	do v:setUrl(url) end
	do return v end
end

function jk.http.client.HTTPClientRequest:_construct0()
	jk.http.client.HTTPClientRequest._init(self)
	self.protocol = "http"
	self.serverPort = 80
	self.requestPath = "/"
	self.method = "GET"
	return self
end

function jk.http.client.HTTPClientRequest:setUrl(url)
	local uu = _g.jk.url.URL:forString(url, false)
	do self:setProtocol(uu:getScheme()) end
	do self:setUsername(uu:getUsername()) end
	do self:setPassword(uu:getPassword()) end
	do self:setServerAddress(uu:getHost()) end
	do
		local pp = _g.jk.lang.String:toInteger(uu:getPort())
		if pp < 1 then
			if self.protocol == "https" then
				pp = 443
			elseif self.protocol == "http" then
				pp = 80
			end
		end
		do self:setServerPort(pp) end
		do self:setRequestPath(uu:getPath()) end
		self.queryParams = uu:getRawQueryParameters()
	end
end

function jk.http.client.HTTPClientRequest:addHeader(key, value)
	if self.rawHeaders == nil then
		self.rawHeaders = _g.jk.lang.KeyValueListForStrings._construct0(_g.jk.lang.KeyValueListForStrings._create())
	end
	if self.headers == nil then
		self.headers = {}
	end
	do self.rawHeaders:add(key, value) end
	self.headers[_g.jk.lang.String:toLowerCase(key)] = value
end

function jk.http.client.HTTPClientRequest:addQueryParameter(key, value)
	if self.queryParams == nil then
		self.queryParams = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
	end
	do self.queryParams:add(key, value) end
end

function jk.http.client.HTTPClientRequest:getHeader(key)
	if not (self.headers ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(self.headers, key) end
end

function jk.http.client.HTTPClientRequest:setUserAgent(agent)
	do self:addHeader("User-Agent", agent) end
end

function jk.http.client.HTTPClientRequest:getUrl()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(self.protocol) end
	do sb:appendString("://") end
	do sb:appendString(self.serverAddress) end
	if self.serverPort == 80 and self.protocol == "http" then
	elseif self.serverPort == 443 and self.protocol == "https" then
	else
		do sb:appendCharacter(58) end
		do sb:appendString(_g.jk.lang.String:forInteger(self.serverPort)) end
	end
	do
		local path = self:getRequestPath()
		if _g.jk.lang.String:isEmpty(path) then
			path = "/"
		end
		do sb:appendString(path) end
		do return sb:toString() end
	end
end

function jk.http.client.HTTPClientRequest:toString1(defaultUserAgent)
	local rq = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local body = self:getBody()
	local path = self:getRequestPath()
	if _g.jk.lang.String:isEmpty(path) then
		path = "/"
	end
	do rq:appendString(self:getMethod()) end
	do rq:appendCharacter(32) end
	do rq:appendString(path) end
	do
		local first = true
		if self.queryParams ~= nil then
			local it = self.queryParams:iterate()
			while it ~= nil do
				local kv = it:next()
				if kv == nil then
					do break end
				end
				if first then
					do rq:appendCharacter(63) end
					first = false
				else
					do rq:appendCharacter(38) end
				end
				do rq:appendString(kv.key) end
				do
					local val = kv.value
					if val ~= nil then
						do rq:appendCharacter(61) end
						do rq:appendString(_g.jk.url.URLEncoder:encode(val, false, false)) end
					end
				end
			end
		end
		do rq:appendCharacter(32) end
		do rq:appendString("HTTP/1.1\r\n") end
		do
			local hasUserAgent = false
			local hasHost = false
			local hasContentLength = false
			if self.rawHeaders ~= nil then
				local it = self.rawHeaders:iterate()
				while true do
					local kvp = it:next()
					if kvp == nil then
						do break end
					end
					do
						local key = kvp.key
						if _g.jk.lang.String:equalsIgnoreCase(key, "user-agent") then
							hasUserAgent = true
						elseif _g.jk.lang.String:equalsIgnoreCase(key, "host") then
							hasHost = true
						elseif _g.jk.lang.String:equalsIgnoreCase(key, "content-length") then
							hasContentLength = true
						end
						do rq:appendString(key) end
						do rq:appendString(": ") end
						do rq:appendString(kvp.value) end
						do rq:appendString("\r\n") end
					end
				end
			end
			if hasUserAgent == false and defaultUserAgent ~= nil then
				do rq:appendString("User-Agent: ") end
				do rq:appendString(defaultUserAgent) end
				do rq:appendString("\r\n") end
			end
			if hasHost == false then
				do rq:appendString("Host: " .. _g.jk.lang.String:safeString(self:getServerAddress()) .. "\r\n") end
			end
			if body ~= nil and hasContentLength == false then
				local bs = body:getSize()
				local bss = _g.jk.lang.String:forInteger(bs)
				do rq:appendString("Content-Length: " .. _g.jk.lang.String:safeString(bss) .. "\r\n") end
			end
			do rq:appendString("\r\n") end
			do return rq:toString() end
		end
	end
end

function jk.http.client.HTTPClientRequest:toString()
	do return self:toString1(nil) end
end

function jk.http.client.HTTPClientRequest:getMethod()
	do return self.method end
end

function jk.http.client.HTTPClientRequest:setMethod(v)
	self.method = v
	do return self end
end

function jk.http.client.HTTPClientRequest:getProtocol()
	do return self.protocol end
end

function jk.http.client.HTTPClientRequest:setProtocol(v)
	self.protocol = v
	do return self end
end

function jk.http.client.HTTPClientRequest:getUsername()
	do return self.username end
end

function jk.http.client.HTTPClientRequest:setUsername(v)
	self.username = v
	do return self end
end

function jk.http.client.HTTPClientRequest:getPassword()
	do return self.password end
end

function jk.http.client.HTTPClientRequest:setPassword(v)
	self.password = v
	do return self end
end

function jk.http.client.HTTPClientRequest:getServerAddress()
	do return self.serverAddress end
end

function jk.http.client.HTTPClientRequest:setServerAddress(v)
	self.serverAddress = v
	do return self end
end

function jk.http.client.HTTPClientRequest:getServerPort()
	do return self.serverPort end
end

function jk.http.client.HTTPClientRequest:setServerPort(v)
	self.serverPort = v
	do return self end
end

function jk.http.client.HTTPClientRequest:getRequestPath()
	do return self.requestPath end
end

function jk.http.client.HTTPClientRequest:setRequestPath(v)
	self.requestPath = v
	do return self end
end

function jk.http.client.HTTPClientRequest:getBody()
	do return self.body end
end

function jk.http.client.HTTPClientRequest:setBody(v)
	self.body = v
	do return self end
end

function jk.http.client.HTTPClientRequest:getRawHeaders()
	do return self.rawHeaders end
end

function jk.http.client.HTTPClientRequest:setRawHeaders(v)
	self.rawHeaders = v
	do return self end
end

function jk.http.client.HTTPClientRequest:getHeaders()
	do return self.headers end
end

function jk.http.client.HTTPClientRequest:setHeaders(v)
	self.headers = v
	do return self end
end

jk.http.client.HTTPClientListener = {}
jk.http.client.HTTPClientListener.__index = jk.http.client.HTTPClientListener
_vm:set_metatable(jk.http.client.HTTPClientListener, {})

function jk.http.client.HTTPClientListener._create()
	local v = _vm:set_metatable({}, jk.http.client.HTTPClientListener)
	return v
end

function jk.http.client.HTTPClientListener:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.client.HTTPClientListener'
	self['_isType.jk.http.client.HTTPClientListener'] = true
	self.completed = false
end

function jk.http.client.HTTPClientListener:_construct0()
	jk.http.client.HTTPClientListener._init(self)
	return self
end

function jk.http.client.HTTPClientListener:onError(message)
end

function jk.http.client.HTTPClientListener:onStatus(message)
end

function jk.http.client.HTTPClientListener:onStartRequest(request)
	do return true end
end

function jk.http.client.HTTPClientListener:onEndRequest()
	do return true end
end

function jk.http.client.HTTPClientListener:onResponseReceived(response)
	do return true end
end

function jk.http.client.HTTPClientListener:onDataReceived(buffer)
	do return true end
end

function jk.http.client.HTTPClientListener:onAborted()
end

function jk.http.client.HTTPClientListener:onResponseCompleted()
	self.completed = true
end

function jk.http.client.HTTPClientListener:getCompleted()
	do return self.completed end
end

function jk.http.client.HTTPClientListener:setCompleted(v)
	self.completed = v
	do return self end
end

jk.http.client.HTTPClientResponse = {}
jk.http.client.HTTPClientResponse.__index = jk.http.client.HTTPClientResponse
_vm:set_metatable(jk.http.client.HTTPClientResponse, {})

function jk.http.client.HTTPClientResponse._create()
	local v = _vm:set_metatable({}, jk.http.client.HTTPClientResponse)
	return v
end

function jk.http.client.HTTPClientResponse:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.client.HTTPClientResponse'
	self['_isType.jk.http.client.HTTPClientResponse'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.httpVersion = nil
	self.httpStatus = nil
	self.httpStatusDescription = nil
	self.rawHeaders = nil
	self.headers = nil
end

function jk.http.client.HTTPClientResponse:_construct0()
	jk.http.client.HTTPClientResponse._init(self)
	return self
end

function jk.http.client.HTTPClientResponse:addHeader(key, value)
	if self.rawHeaders == nil then
		self.rawHeaders = _g.jk.lang.KeyValueListForStrings._construct0(_g.jk.lang.KeyValueListForStrings._create())
	end
	if self.headers == nil then
		self.headers = {}
	end
	do self.rawHeaders:add(key, value) end
	self.headers[_g.jk.lang.String:toLowerCase(key)] = value
end

function jk.http.client.HTTPClientResponse:getHeader(key)
	if not (self.headers ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(self.headers, key) end
end

function jk.http.client.HTTPClientResponse:toString()
	do return _g.jk.lang.String:asString(self.rawHeaders) end
end

function jk.http.client.HTTPClientResponse:getHttpVersion()
	do return self.httpVersion end
end

function jk.http.client.HTTPClientResponse:setHttpVersion(v)
	self.httpVersion = v
	do return self end
end

function jk.http.client.HTTPClientResponse:getHttpStatus()
	do return self.httpStatus end
end

function jk.http.client.HTTPClientResponse:setHttpStatus(v)
	self.httpStatus = v
	do return self end
end

function jk.http.client.HTTPClientResponse:getHttpStatusDescription()
	do return self.httpStatusDescription end
end

function jk.http.client.HTTPClientResponse:setHttpStatusDescription(v)
	self.httpStatusDescription = v
	do return self end
end

function jk.http.client.HTTPClientResponse:getRawHeaders()
	do return self.rawHeaders end
end

function jk.http.client.HTTPClientResponse:setRawHeaders(v)
	self.rawHeaders = v
	do return self end
end

function jk.http.client.HTTPClientResponse:getHeaders()
	do return self.headers end
end

function jk.http.client.HTTPClientResponse:setHeaders(v)
	self.headers = v
	do return self end
end

jk.http.client.HTTPClient = {}
jk.http.client.HTTPClient.__index = jk.http.client.HTTPClient
_vm:set_metatable(jk.http.client.HTTPClient, {})

function jk.http.client.HTTPClient._create()
	local v = _vm:set_metatable({}, jk.http.client.HTTPClient)
	return v
end

function jk.http.client.HTTPClient:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.client.HTTPClient'
	self['_isType.jk.http.client.HTTPClient'] = true
end

function jk.http.client.HTTPClient:_construct0()
	jk.http.client.HTTPClient._init(self)
	return self
end

function jk.http.client.HTTPClient:createDefault()
	do return _g.jk.http.client.HTTPClientOperation._construct0(_g.jk.http.client.HTTPClientOperation._create()) end
end

function jk.http.client.HTTPClient:execute1(client, request, listener)
	if not (client ~= nil) then
		do return end
	end
	do client:executeRequest(request, listener) end
end

jk.http.client.HTTPClient.MyListener = _g.jk.http.client.HTTPClientListener._create()
jk.http.client.HTTPClient.MyListener.__index = jk.http.client.HTTPClient.MyListener
_vm:set_metatable(jk.http.client.HTTPClient.MyListener, {
	__index = _g.jk.http.client.HTTPClientListener
})

function jk.http.client.HTTPClient.MyListener._create()
	local v = _vm:set_metatable({}, jk.http.client.HTTPClient.MyListener)
	return v
end

function jk.http.client.HTTPClient.MyListener:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.client.HTTPClient.MyListener'
	self['_isType.jk.http.client.HTTPClient.MyListener'] = true
	self.response = nil
	self.buffer = nil
	self.errorHandler = nil
	self.ctx = nil
end

function jk.http.client.HTTPClient.MyListener:_construct0()
	jk.http.client.HTTPClient.MyListener._init(self)
	do _g.jk.http.client.HTTPClientListener._construct0(self) end
	return self
end

function jk.http.client.HTTPClient.MyListener:onResponseReceived(response)
	self.response = response
	do return true end
end

function jk.http.client.HTTPClient.MyListener:onDataReceived(buffer)
	self.buffer = _g.jk.lang.Buffer:append(self.buffer, buffer, -1)
	do return true end
end

function jk.http.client.HTTPClient.MyListener:onAborted()
end

function jk.http.client.HTTPClient.MyListener:onStatus(message)
	if message ~= nil then
		do _g.jk.log.Log:debug(self.ctx, message) end
	end
end

function jk.http.client.HTTPClient.MyListener:onError(message)
	do _g.jk.log.Log:error(self.ctx, message) end
	if self.errorHandler ~= nil then
		do self.errorHandler(message) end
	end
end

function jk.http.client.HTTPClient.MyListener:onResponseCompleted()
end

function jk.http.client.HTTPClient.MyListener:getResponse()
	do return self.response end
end

function jk.http.client.HTTPClient.MyListener:setResponse(v)
	self.response = v
	do return self end
end

function jk.http.client.HTTPClient.MyListener:getBuffer()
	do return self.buffer end
end

function jk.http.client.HTTPClient.MyListener:setBuffer(v)
	self.buffer = v
	do return self end
end

function jk.http.client.HTTPClient.MyListener:getErrorHandler()
	do return self.errorHandler end
end

function jk.http.client.HTTPClient.MyListener:setErrorHandler(v)
	self.errorHandler = v
	do return self end
end

function jk.http.client.HTTPClient.MyListener:getCtx()
	do return self.ctx end
end

function jk.http.client.HTTPClient.MyListener:setCtx(v)
	self.ctx = v
	do return self end
end

function jk.http.client.HTTPClient:execute2(ctx, client, request, listener, errorHandler)
	local ll = _g.jk.http.client.HTTPClient.MyListener._construct0(_g.jk.http.client.HTTPClient.MyListener._create())
	do ll:setCtx(ctx) end
	do ll:setErrorHandler(errorHandler) end
	do _g.jk.http.client.HTTPClient:execute1(client, request, ll) end
	if listener ~= nil then
		do listener(ll:getResponse()) end
	end
end

function jk.http.client.HTTPClient:executeForBuffer(ctx, client, request, listener, errorHandler)
	local ll = _g.jk.http.client.HTTPClient.MyListener._construct0(_g.jk.http.client.HTTPClient.MyListener._create())
	do ll:setCtx(ctx) end
	do ll:setErrorHandler(errorHandler) end
	do _g.jk.http.client.HTTPClient:execute1(client, request, ll) end
	if listener ~= nil then
		do listener(ll:getResponse(), ll:getBuffer()) end
	end
end

function jk.http.client.HTTPClient:executeForString(ctx, client, request, listener, errorHandler)
	local ll = _g.jk.http.client.HTTPClient.MyListener._construct0(_g.jk.http.client.HTTPClient.MyListener._create())
	do ll:setCtx(ctx) end
	do ll:setErrorHandler(errorHandler) end
	do _g.jk.http.client.HTTPClient:execute1(client, request, ll) end
	if listener ~= nil then
		do listener(ll:getResponse(), _g.jk.lang.String:forUTF8Buffer(ll:getBuffer())) end
	end
end

function jk.http.client.HTTPClient:executeRequest(request, listener)
end

jk.http.client.HTTPRPCClient = {}
jk.http.client.HTTPRPCClient.__index = jk.http.client.HTTPRPCClient
_vm:set_metatable(jk.http.client.HTTPRPCClient, {})

function jk.http.client.HTTPRPCClient._create()
	local v = _vm:set_metatable({}, jk.http.client.HTTPRPCClient)
	return v
end

function jk.http.client.HTTPRPCClient:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.client.HTTPRPCClient'
	self['_isType.jk.http.client.HTTPRPCClient'] = true
	self.baseUrl = nil
end

function jk.http.client.HTTPRPCClient:_construct0()
	jk.http.client.HTTPRPCClient._init(self)
	return self
end

function jk.http.client.HTTPRPCClient:forBaseUrl(url)
	local v = _g.jk.http.client.HTTPRPCClient._construct0(_g.jk.http.client.HTTPRPCClient._create())
	do v:setBaseUrl(url) end
	do return v end
end

function jk.http.client.HTTPRPCClient:callRemoteFunction(name, data)
	local dd = data
	if not (dd ~= nil) then
		dd = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	end
	do
		local sdata = _g.jk.json.JSONEncoder:encode(dd, true, false)
		local bdata = _g.jk.lang.String:toUTF8Buffer(sdata)
		local url = _g.jk.lang.String:safeString(self.baseUrl) .. "/func/" .. _g.jk.lang.String:safeString(name)
		local rdata = nil
		local headers = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
		do headers:add("content-type", "application/json") end
		do
			local wc = _g.jk.http.client.CustomWebClient._construct0(_g.jk.http.client.CustomWebClient._create())
			do wc:query("POST", url, headers, bdata, function(status, headers, body)
				if status == nil then
					local detail = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
					do detail:setString("url", url) end
					do detail:setString("error", _g.jk.lang.String:forUTF8Buffer(body)) end
					do _g.jk.lang.Error:throw("failedToCallRemoteFunction", _g.jk.json.JSONEncoder:toString(detail)) end
				end
				do
					local str = _g.jk.lang.String:forUTF8Buffer(body)
					rdata = _vm:to_table_with_key(_g.jk.json.JSONParser:parseString(str), '_isType.jk.lang.DynamicMap')
					if not (rdata ~= nil) then
						local detail = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
						do detail:setString("url", url) end
						do detail:setString("responseBody", str) end
						do _g.jk.lang.Error:throw("failedToCallRemoteFunction", _g.jk.json.JSONEncoder:toString(detail)) end
					end
				end
			end) end
			if not (rdata ~= nil) then
				do _g.jk.lang.Error:throw("failedToCallRemoteFunction", url) end
			end
			do
				local status = rdata:getString("status", nil)
				if _g.jk.lang.String:equals(status, "ok") then
					do return rdata:get("data") end
				elseif _g.jk.lang.String:equals(status, "error") then
					local error = rdata:getString("errorCode", nil)
					local detail = rdata:getString("errorDetail", nil)
					if _g.jk.lang.String:isEmpty(error) then
						error = "errorStatusFromRemoteFunction"
					end
					if _g.jk.lang.String:isEmpty(detail) then
						detail = name
					end
					do _g.jk.lang.Error:throw(error, detail) end
				else
					do _g.jk.lang.Error:throw("unsupportedRpcStatus", status) end
				end
				do return nil end
			end
		end
	end
end

function jk.http.client.HTTPRPCClient:getBaseUrl()
	do return self.baseUrl end
end

function jk.http.client.HTTPRPCClient:setBaseUrl(v)
	self.baseUrl = v
	do return self end
end

jk.http.client.WebRequest = {}
jk.http.client.WebRequest.__index = jk.http.client.WebRequest
_vm:set_metatable(jk.http.client.WebRequest, {})

function jk.http.client.WebRequest._create()
	local v = _vm:set_metatable({}, jk.http.client.WebRequest)
	return v
end

function jk.http.client.WebRequest:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.client.WebRequest'
	self['_isType.jk.http.client.WebRequest'] = true
end

function jk.http.client.WebRequest:_construct0()
	jk.http.client.WebRequest._init(self)
	return self
end

jk.http.client.WebRequest.Response = {}
jk.http.client.WebRequest.Response.__index = jk.http.client.WebRequest.Response
_vm:set_metatable(jk.http.client.WebRequest.Response, {})

function jk.http.client.WebRequest.Response._create()
	local v = _vm:set_metatable({}, jk.http.client.WebRequest.Response)
	return v
end

function jk.http.client.WebRequest.Response:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.client.WebRequest.Response'
	self['_isType.jk.http.client.WebRequest.Response'] = true
	self.httpStatus = nil
	self.httpStatusDescription = nil
	self.headers = nil
	self.body = nil
	self.bodyAsString = nil
	self.bodyAsDynamicMap = nil
end

function jk.http.client.WebRequest.Response:_construct0()
	jk.http.client.WebRequest.Response._init(self)
	return self
end

function jk.http.client.WebRequest.Response:getHeaderValue(key)
	if not (self.headers ~= nil) then
		do return nil end
	end
	if not (key ~= nil) then
		do return nil end
	end
	do
		local it = self.headers:iterate()
		while it ~= nil do
			local ee = it:next()
			if not (ee ~= nil) then
				do break end
			end
			if _g.jk.lang.String:equalsIgnoreCase(ee.key, key) then
				do return ee.value end
			end
		end
		do return nil end
	end
end

function jk.http.client.WebRequest.Response:getBodyAsBuffer()
	if not (self.body ~= nil) then
		do _g.jk.lang.Error:throw("httpRequestError", "noBody") end
	end
	do return self.body end
end

function jk.http.client.WebRequest.Response:getBodyAsString()
	if self.bodyAsString ~= nil then
		do return self.bodyAsString end
	end
	do
		local v = _g.jk.lang.String:forUTF8Buffer(self:getBodyAsBuffer())
		if not (v ~= nil) then
			do _g.jk.lang.Error:throw("httpRequestError", "notString") end
		end
		self.bodyAsString = v
		do return v end
	end
end

function jk.http.client.WebRequest.Response:getBodyAsDynamicMap()
	if self.bodyAsDynamicMap ~= nil then
		do return self.bodyAsDynamicMap end
	end
	do
		local v = _vm:to_table_with_key(_g.jk.json.JSONParser:parseBuffer(self:getBodyAsBuffer()), '_isType.jk.lang.DynamicMap')
		if not (v ~= nil) then
			do _g.jk.lang.Error:throw("httpRequestError", "notJsonMap") end
		end
		self.bodyAsDynamicMap = v
		do return v end
	end
end

function jk.http.client.WebRequest.Response:getHttpStatus()
	do return self.httpStatus end
end

function jk.http.client.WebRequest.Response:setHttpStatus(v)
	self.httpStatus = v
	do return self end
end

function jk.http.client.WebRequest.Response:getHttpStatusDescription()
	do return self.httpStatusDescription end
end

function jk.http.client.WebRequest.Response:setHttpStatusDescription(v)
	self.httpStatusDescription = v
	do return self end
end

function jk.http.client.WebRequest.Response:getHeaders()
	do return self.headers end
end

function jk.http.client.WebRequest.Response:setHeaders(v)
	self.headers = v
	do return self end
end

function jk.http.client.WebRequest.Response:getBody()
	do return self.body end
end

function jk.http.client.WebRequest.Response:setBody(v)
	self.body = v
	do return self end
end

jk.http.client.WebRequest.MyHTTPClientListener = _g.jk.http.client.HTTPClientListener._create()
jk.http.client.WebRequest.MyHTTPClientListener.__index = jk.http.client.WebRequest.MyHTTPClientListener
_vm:set_metatable(jk.http.client.WebRequest.MyHTTPClientListener, {
	__index = _g.jk.http.client.HTTPClientListener
})

function jk.http.client.WebRequest.MyHTTPClientListener._create()
	local v = _vm:set_metatable({}, jk.http.client.WebRequest.MyHTTPClientListener)
	return v
end

function jk.http.client.WebRequest.MyHTTPClientListener:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.client.WebRequest.MyHTTPClientListener'
	self['_isType.jk.http.client.WebRequest.MyHTTPClientListener'] = true
	self.response = nil
	self.body = nil
end

function jk.http.client.WebRequest.MyHTTPClientListener:_construct0()
	jk.http.client.WebRequest.MyHTTPClientListener._init(self)
	do _g.jk.http.client.HTTPClientListener._construct0(self) end
	return self
end

function jk.http.client.WebRequest.MyHTTPClientListener:onError(message)
	do _g.jk.lang.Error:throw("httpRequestError", message) end
end

function jk.http.client.WebRequest.MyHTTPClientListener:onAborted()
	do _g.jk.lang.Error:throw("httpRequestError", "aborted") end
end

function jk.http.client.WebRequest.MyHTTPClientListener:onDataReceived(buffer)
	self.body = _g.jk.lang.Buffer:append(self.body, buffer, -1)
	do return true end
end

function jk.http.client.WebRequest.MyHTTPClientListener:onResponseReceived(response)
	if not (response ~= nil) then
		do return false end
	end
	self.response = response
	do return true end
end

function jk.http.client.WebRequest.MyHTTPClientListener:getResponse()
	do return self.response end
end

function jk.http.client.WebRequest.MyHTTPClientListener:setResponse(v)
	self.response = v
	do return self end
end

function jk.http.client.WebRequest.MyHTTPClientListener:getBody()
	do return self.body end
end

function jk.http.client.WebRequest.MyHTTPClientListener:setBody(v)
	self.body = v
	do return self end
end

function jk.http.client.WebRequest:execute(method, url, headers, body)
	local req = _g.jk.http.client.HTTPClientRequest._construct0(_g.jk.http.client.HTTPClientRequest._create())
	do req:setMethod(method) end
	do req:setUrl(url) end
	if headers ~= nil then
		local it = headers:iterate()
		while it ~= nil do
			local pair = it:next()
			if not (pair ~= nil) then
				do break end
			end
			do req:addHeader(pair.key, pair.value) end
		end
	end
	do req:setBody(_g.jk.io.BufferReader:forBuffer(body)) end
	do
		local op = _g.jk.http.client.HTTPClientOperation._construct0(_g.jk.http.client.HTTPClientOperation._create())
		local listener = _g.jk.http.client.WebRequest.MyHTTPClientListener._construct0(_g.jk.http.client.WebRequest.MyHTTPClientListener._create())
		do op:executeRequest(req, listener) end
		do op:closeConnection(nil) end
		do
			local hresp = listener:getResponse()
			if not (hresp ~= nil) then
				do _g.jk.lang.Error:throw("httpRequestError", "noResponse") end
			end
			do
				local body = listener:getBody()
				local v = _g.jk.http.client.WebRequest.Response._construct0(_g.jk.http.client.WebRequest.Response._create())
				do v:setHttpStatus(hresp:getHttpStatus()) end
				do v:setHttpStatusDescription(hresp:getHttpStatusDescription()) end
				do v:setHeaders(hresp:getRawHeaders()) end
				do v:setBody(body) end
				do return v end
			end
		end
	end
end

jk.http.client.HTTPClientOperation = _g.jk.http.client.HTTPClient._create()
jk.http.client.HTTPClientOperation.__index = jk.http.client.HTTPClientOperation
_vm:set_metatable(jk.http.client.HTTPClientOperation, {
	__index = _g.jk.http.client.HTTPClient
})

function jk.http.client.HTTPClientOperation._create()
	local v = _vm:set_metatable({}, jk.http.client.HTTPClientOperation)
	return v
end

function jk.http.client.HTTPClientOperation:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.client.HTTPClientOperation'
	self['_isType.jk.http.client.HTTPClientOperation'] = true
	self.openSocket = nil
	self.openSocketProtocol = nil
	self.openSocketAddress = nil
	self.openSocketPort = 0
	self.defaultUserAgent = nil
	self.parser = nil
	self.receiveBuffer = nil
	self.acceptInvalidCertificate = false
end

jk.http.client.HTTPClientOperation.MyResponseParser = {}
jk.http.client.HTTPClientOperation.MyResponseParser.__index = jk.http.client.HTTPClientOperation.MyResponseParser
_vm:set_metatable(jk.http.client.HTTPClientOperation.MyResponseParser, {})

function jk.http.client.HTTPClientOperation.MyResponseParser._create()
	local v = _vm:set_metatable({}, jk.http.client.HTTPClientOperation.MyResponseParser)
	return v
end

function jk.http.client.HTTPClientOperation.MyResponseParser:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.client.HTTPClientOperation.MyResponseParser'
	self['_isType.jk.http.client.HTTPClientOperation.MyResponseParser'] = true
	self.receivedData = nil
	self.headers = nil
	self.isChunked = false
	self.isStream = false
	self.contentLength = 0
	self.dataCounter = 0
	self.listener = nil
	self.endOfResponse = false
	self.aborted = false
end

function jk.http.client.HTTPClientOperation.MyResponseParser:_construct0()
	jk.http.client.HTTPClientOperation.MyResponseParser._init(self)
	return self
end

jk.http.client.HTTPClientOperation.MyResponseParser.Chunk = {}
jk.http.client.HTTPClientOperation.MyResponseParser.Chunk.__index = jk.http.client.HTTPClientOperation.MyResponseParser.Chunk
_vm:set_metatable(jk.http.client.HTTPClientOperation.MyResponseParser.Chunk, {})

function jk.http.client.HTTPClientOperation.MyResponseParser.Chunk._create()
	local v = _vm:set_metatable({}, jk.http.client.HTTPClientOperation.MyResponseParser.Chunk)
	return v
end

function jk.http.client.HTTPClientOperation.MyResponseParser.Chunk:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.client.HTTPClientOperation.MyResponseParser.Chunk'
	self['_isType.jk.http.client.HTTPClientOperation.MyResponseParser.Chunk'] = true
	self.data = nil
	self.completed = true
end

function jk.http.client.HTTPClientOperation.MyResponseParser.Chunk:_construct0()
	jk.http.client.HTTPClientOperation.MyResponseParser.Chunk._init(self)
	return self
end

function jk.http.client.HTTPClientOperation.MyResponseParser:reset()
	self.isChunked = false
	self.isStream = false
	self.headers = nil
	self.contentLength = 0
	self.dataCounter = 0
	self.endOfResponse = false
	self.aborted = false
end

function jk.http.client.HTTPClientOperation.MyResponseParser:hasEndOfHeaders(buf, size)
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

function jk.http.client.HTTPClientOperation.MyResponseParser:parseResponse(buf)
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
				v = _g.jk.http.client.HTTPClientResponse._construct0(_g.jk.http.client.HTTPClientResponse._create())
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
		if self.contentLength < 1 and (_g.jk.lang.String:equalsIgnoreCase(v:getHeader("connection"), "close") or _g.jk.lang.String:equalsIgnoreCase(v:getHttpVersion(), "HTTP/1.0")) then
			self.isStream = true
		end
		do return v end
	end
end

function jk.http.client.HTTPClientOperation.MyResponseParser:getChunk()
	local i = 0
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	while true do
		if self.receivedData == nil or #self.receivedData <= i then
			local chunk = _g.jk.http.client.HTTPClientOperation.MyResponseParser.Chunk._construct0(_g.jk.http.client.HTTPClientOperation.MyResponseParser.Chunk._create())
			chunk.completed = false
			do return chunk end
		end
		do
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
	end
	do
		local cl = -1
		local t = _g.jk.lang.String:strip(sb:toString())
		if _g.jk.lang.String:isEmpty(t) == false then
			cl = _g.jk.lang.String:toIntegerFromHex(t)
		end
		do
			local chunk = _g.jk.http.client.HTTPClientOperation.MyResponseParser.Chunk._construct0(_g.jk.http.client.HTTPClientOperation.MyResponseParser.Chunk._create())
			if cl > 0 then
				if _g.jk.lang.Buffer:getSize(self.receivedData) - i < cl then
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

function jk.http.client.HTTPClientOperation.MyResponseParser:onDataReceived(buf, size)
	if size > 0 then
		self.receivedData = _g.jk.lang.Buffer:append(self.receivedData, buf, size)
	end
	if not (self.headers ~= nil) then
		if self:hasEndOfHeaders(self.receivedData, _g.jk.lang.Buffer:getSize(self.receivedData)) then
			self.headers = self:parseResponse(self.receivedData)
			if self.headers ~= nil then
				do self:onHeadersReceived(self.headers) end
			end
		else
			do return end
		end
	end
	if self.isChunked then
		while true do
			local r = self:getChunk()
			if r ~= nil then
				if not r.completed then
					do break end
				end
				if not (r.data ~= nil) then
					do self:reset() end
					do self:onEndOfResponse() end
					do break end
				end
				do
					local sz = _g.jk.lang.Buffer:getSize(r.data)
					self.dataCounter = self.dataCounter + sz
					do self:onBodyDataReceived(r.data, sz) end
				end
			else
				do self:reset() end
				do self:onEndOfResponse() end
				do break end
			end
			if self.receivedData == nil then
				do break end
			end
		end
	elseif self.isStream then
		local sz = _g.jk.lang.Buffer:getSize(self.receivedData)
		if sz > 0 then
			local v = self.receivedData
			self.receivedData = nil
			self.dataCounter = self.dataCounter + sz
			do self:onBodyDataReceived(v, sz) end
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
			do self:reset() end
			do self:onEndOfResponse() end
		end
	else
		do self:reset() end
		do self:onEndOfResponse() end
	end
end

function jk.http.client.HTTPClientOperation.MyResponseParser:onHeadersReceived(headers)
	if self.listener ~= nil and self.listener:onResponseReceived(headers) == false then
		if self.listener ~= nil then
			do self.listener:onAborted() end
		end
		self.aborted = true
	end
end

function jk.http.client.HTTPClientOperation.MyResponseParser:onBodyDataReceived(buffer, size)
	if self.listener ~= nil and self.listener:onDataReceived(buffer) == false then
		if self.listener ~= nil then
			do self.listener:onAborted() end
		end
		self.aborted = true
	end
end

function jk.http.client.HTTPClientOperation.MyResponseParser:onEndOfResponse()
	if self.listener ~= nil then
		do self.listener:onResponseCompleted() end
	end
	self.endOfResponse = true
end

function jk.http.client.HTTPClientOperation.MyResponseParser:getListener()
	do return self.listener end
end

function jk.http.client.HTTPClientOperation.MyResponseParser:setListener(v)
	self.listener = v
	do return self end
end

function jk.http.client.HTTPClientOperation.MyResponseParser:getEndOfResponse()
	do return self.endOfResponse end
end

function jk.http.client.HTTPClientOperation.MyResponseParser:setEndOfResponse(v)
	self.endOfResponse = v
	do return self end
end

function jk.http.client.HTTPClientOperation.MyResponseParser:getAborted()
	do return self.aborted end
end

function jk.http.client.HTTPClientOperation.MyResponseParser:setAborted(v)
	self.aborted = v
	do return self end
end

function jk.http.client.HTTPClientOperation:_construct0()
	jk.http.client.HTTPClientOperation._init(self)
	do _g.jk.http.client.HTTPClient._construct0(self) end
	self.receiveBuffer = _util:allocate_buffer(64 * 1024)
	return self
end

function jk.http.client.HTTPClientOperation:openConnection1(protocol, address, aport, listener)
	do self:closeConnection(listener) end
	if _g.jk.lang.String:isEmpty(address) then
		if listener ~= nil then
			do listener:onError("No server address") end
		end
		do return false end
	end
	if not (protocol == "http") and not (protocol == "https") then
		if listener ~= nil then
			do listener:onError("Protocol is invalid: `" .. _g.jk.lang.String:safeString(protocol) .. "'. Must be http or https") end
		end
		do return false end
	end
	do
		local port = aport
		if port < 1 then
			if protocol == "https" then
				port = 443
			else
				port = 80
			end
		end
		if listener ~= nil then
			do listener:onStatus("Connecting to server `" .. _g.jk.lang.String:safeString(address) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(port)) .. "' ..") end
		end
		self.openSocket = _g.jk.socket.TCPSocket:createAndConnect(address, port)
		if listener ~= nil then
			do listener:onStatus(nil) end
		end
		if self.openSocket == nil then
			if listener ~= nil then
				do listener:onError("Connection failed: `" .. _g.jk.lang.String:safeString(address) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(port)) .. "'") end
			end
			do return false end
		end
		if protocol == "https" then
			self.openSocket = _g.jk.socket.ssl.SSLSocket:forClient(self.openSocket, address, nil, self.acceptInvalidCertificate, nil)
			if self.openSocket == nil and listener ~= nil then
				do listener:onError("FAILED to create SSL socket for HTTPS") end
				do self:closeConnection(listener) end
				do return false end
			end
		end
		self.openSocketProtocol = protocol
		self.openSocketAddress = address
		self.openSocketPort = port
		self.parser = _g.jk.http.client.HTTPClientOperation.MyResponseParser._construct0(_g.jk.http.client.HTTPClientOperation.MyResponseParser._create())
		do return true end
	end
end

function jk.http.client.HTTPClientOperation:openConnection2(request, listener)
	if request == nil then
		if listener ~= nil then
			do listener:onError("No request") end
		end
		do return false end
	end
	do return self:openConnection1(request:getProtocol(), request:getServerAddress(), request:getServerPort(), listener) end
end

function jk.http.client.HTTPClientOperation:closeConnection(listener)
	if not (self.openSocket ~= nil) then
		do return end
	end
	if listener ~= nil then
		do listener:onStatus("Closing connection") end
	end
	do self.openSocket:close() end
	self.openSocket = nil
	self.openSocketProtocol = nil
	self.openSocketAddress = nil
	self.openSocketPort = 0
	self.parser = nil
	if listener ~= nil then
		do listener:onStatus(nil) end
	end
end

function jk.http.client.HTTPClientOperation:sendRequest(request, listener)
	if request == nil then
		if listener ~= nil then
			do listener:onError("No request") end
		end
		do return false end
	end
	if listener ~= nil and listener:onStartRequest(request) == false then
		do return false end
	end
	if self.openSocket ~= nil then
		if not (request:getServerAddress() == self.openSocketAddress) or not (request:getProtocol() == self.openSocketProtocol) or request:getServerPort() ~= self.openSocketPort then
			do self:closeConnection(listener) end
		end
	end
	if self.openSocket == nil then
		do self:openConnection2(request, listener) end
		if not (self.openSocket ~= nil) then
			do return false end
		end
	end
	if listener ~= nil then
		do listener:onStatus("Sending request headers ..") end
	end
	do
		local rqs = request:toString1(self.defaultUserAgent)
		local pww = _g.jk.io.PrintWriterWrapper:forWriter(self.openSocket)
		local whr = pww:print(rqs)
		if listener ~= nil then
			do listener:onStatus(nil) end
		end
		if whr == false then
			if listener ~= nil then
				do listener:onError("Failed to send HTTP request headers") end
			end
			do self:closeConnection(listener) end
			do return false end
		end
		do
			local body = request:getBody()
			if body ~= nil then
				if listener ~= nil then
					do listener:onStatus("Sending request body ..") end
				end
				do
					local rv = true
					local bf = _util:allocate_buffer(4096 * 4)
					while true do
						local r = body:read(bf)
						if r < 1 then
							do break end
						end
						do
							local bw = self.openSocket:write(bf, r)
							if bw < r then
								if listener ~= nil then
									do listener:onError("Failed to send request body (wrote " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(bw)) .. " bytes out of a " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(r)) .. " byte packet)") end
								end
								do self:closeConnection(listener) end
								rv = false
								do break end
							end
						end
					end
					if (_vm:to_table_with_key(body, '_isType.jk.lang.Closable') ~= nil) then
						do body:close() end
					end
					if listener ~= nil then
						do listener:onStatus(nil) end
					end
					if rv == false then
						do return false end
					end
				end
			end
			do return true end
		end
	end
end

function jk.http.client.HTTPClientOperation:readResponse(listener, timeout)
	if self.openSocket == nil then
		if listener ~= nil then
			do listener:onError("No open socket") end
		end
		do return false end
	end
	if listener ~= nil then
		do listener:onStatus("Receiving response ..") end
	end
	do
		local rv = true
		do self.parser:setListener(listener) end
		while true do
			local r = 0
			if (_vm:to_table_with_key(self.openSocket, '_isType.jk.socket.ssl.SSLSocket') ~= nil) then
				r = self.openSocket:readWithTimeout(self.receiveBuffer, timeout)
			else
				r = self.openSocket:readWithTimeout(self.receiveBuffer, timeout)
			end
			if r == 0 then
				rv = false
				do break end
			end
			if r < 1 then
				if self.parser.isStream then
					do self.parser:reset() end
					do self.parser:onEndOfResponse() end
					do break end
				end
				do self:closeConnection(listener) end
				if listener ~= nil then
					do listener:onAborted() end
				end
				rv = false
				do break end
			end
			do self.parser:onDataReceived(self.receiveBuffer, r) end
			if self.parser:getAborted() then
				do self:closeConnection(listener) end
				rv = false
				do break end
			end
			if self.parser:getEndOfResponse() then
				do self.parser:reset() end
				rv = true
				do break end
			end
		end
		if self.parser ~= nil then
			do self.parser:setListener(nil) end
		end
		if listener ~= nil then
			do listener:onStatus(nil) end
			if listener:onEndRequest() == false then
				rv = false
			end
		end
		do return rv end
	end
end

function jk.http.client.HTTPClientOperation:executeRequest(request, listener)
	if not self:sendRequest(request, listener) then
		do return end
	end
	if not self:readResponse(listener, 30000) then
		do return end
	end
	if _g.jk.lang.String:equalsIgnoreCase(request:getHeader("connection"), "close") then
		do self:closeConnection(listener) end
	end
end

function jk.http.client.HTTPClientOperation:getDefaultUserAgent()
	do return self.defaultUserAgent end
end

function jk.http.client.HTTPClientOperation:setDefaultUserAgent(v)
	self.defaultUserAgent = v
	do return self end
end

function jk.http.client.HTTPClientOperation:getAcceptInvalidCertificate()
	do return self.acceptInvalidCertificate end
end

function jk.http.client.HTTPClientOperation:setAcceptInvalidCertificate(v)
	self.acceptInvalidCertificate = v
	do return self end
end

jk.http.client.CustomWebClient = _g.jk.web.WebClient._create()
jk.http.client.CustomWebClient.__index = jk.http.client.CustomWebClient
_vm:set_metatable(jk.http.client.CustomWebClient, {
	__index = _g.jk.web.WebClient
})

function jk.http.client.CustomWebClient._create()
	local v = _vm:set_metatable({}, jk.http.client.CustomWebClient)
	return v
end

function jk.http.client.CustomWebClient:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.client.CustomWebClient'
	self['_isType.jk.http.client.CustomWebClient'] = true
end

function jk.http.client.CustomWebClient:_construct0()
	jk.http.client.CustomWebClient._init(self)
	do _g.jk.web.WebClient._construct0(self) end
	return self
end

jk.http.client.CustomWebClient.MyHTTPClientListener = _g.jk.http.client.HTTPClientListener._create()
jk.http.client.CustomWebClient.MyHTTPClientListener.__index = jk.http.client.CustomWebClient.MyHTTPClientListener
_vm:set_metatable(jk.http.client.CustomWebClient.MyHTTPClientListener, {
	__index = _g.jk.http.client.HTTPClientListener
})

function jk.http.client.CustomWebClient.MyHTTPClientListener._create()
	local v = _vm:set_metatable({}, jk.http.client.CustomWebClient.MyHTTPClientListener)
	return v
end

function jk.http.client.CustomWebClient.MyHTTPClientListener:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.client.CustomWebClient.MyHTTPClientListener'
	self['_isType.jk.http.client.CustomWebClient.MyHTTPClientListener'] = true
	self.listener = nil
	self.response = nil
	self.body = nil
end

function jk.http.client.CustomWebClient.MyHTTPClientListener:_construct0()
	jk.http.client.CustomWebClient.MyHTTPClientListener._init(self)
	do _g.jk.http.client.HTTPClientListener._construct0(self) end
	return self
end

function jk.http.client.CustomWebClient.MyHTTPClientListener:onError(message)
	if self.listener ~= nil then
		do self.listener(nil, nil, _g.jk.lang.String:toUTF8Buffer(message)) end
	end
end

function jk.http.client.CustomWebClient.MyHTTPClientListener:onAborted()
	if self.listener ~= nil then
		do self.listener(nil, nil, _g.jk.lang.String:toUTF8Buffer("aborted")) end
	end
end

function jk.http.client.CustomWebClient.MyHTTPClientListener:onDataReceived(buffer)
	self.body = _g.jk.lang.Buffer:append(self.body, buffer, -1)
	do return true end
end

function jk.http.client.CustomWebClient.MyHTTPClientListener:onResponseReceived(response)
	if not (response ~= nil) then
		do return false end
	end
	self.response = response
	do return true end
end

function jk.http.client.CustomWebClient.MyHTTPClientListener:onResponseCompleted()
	do _g.jk.http.client.HTTPClientListener.onResponseCompleted(self) end
	if self.listener ~= nil then
		do self.listener(self.response:getHttpStatus(), self.response:getRawHeaders(), self.body) end
	end
end

function jk.http.client.CustomWebClient.MyHTTPClientListener:getListener()
	do return self.listener end
end

function jk.http.client.CustomWebClient.MyHTTPClientListener:setListener(v)
	self.listener = v
	do return self end
end

function jk.http.client.CustomWebClient:query(method, url, headers, body, callback)
	local contentType = nil
	if headers ~= nil then
		local array = headers:asVector()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local kvp = array[n + 1]
					if kvp ~= nil then
						if _g.jk.lang.String:equalsIgnoreCase(kvp.key, "Content-Type") then
							contentType = kvp.value
							do break end
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
	do
		local req = nil
		if _g.jk.lang.String:equalsIgnoreCase(method, "GET") then
			req = _g.jk.http.client.HTTPClientRequest:forGET(url)
		elseif _g.jk.lang.String:equalsIgnoreCase(method, "POST") then
			req = _g.jk.http.client.HTTPClientRequest:forPOST3(url, contentType, body)
		elseif _g.jk.lang.String:equalsIgnoreCase(method, "PUT") then
			req = _g.jk.http.client.HTTPClientRequest:forPUT3(url, contentType, body)
		elseif _g.jk.lang.String:equalsIgnoreCase(method, "DELETE") then
			req = _g.jk.http.client.HTTPClientRequest:forDELETE(url)
		else
			do callback(nil, nil, nil) end
			do return end
		end
		if headers ~= nil then
			local array2 = headers:asVector()
			if array2 ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(array2)
				do
					n2 = 0
					while n2 < m2 do
						local kvp = array2[n2 + 1]
						if kvp ~= nil then
							if _g.jk.lang.String:equals(kvp.key, "Content-Type") and _g.jk.lang.String:isNotEmpty(req:getHeader("content-type")) then
								goto _continue1
							end
							do req:addHeader(kvp.key, kvp.value) end
						end
						::_continue1::
						do n2 = n2 + 1 end
					end
				end
			end
		end
		do
			local op = _g.jk.http.client.HTTPClientOperation._construct0(_g.jk.http.client.HTTPClientOperation._create())
			do op:setAcceptInvalidCertificate(true) end
			do op:executeRequest(req, _g.jk.http.client.CustomWebClient.MyHTTPClientListener._construct0(_g.jk.http.client.CustomWebClient.MyHTTPClientListener._create()):setListener(callback)) end
			do op:closeConnection(nil) end
		end
	end
end
