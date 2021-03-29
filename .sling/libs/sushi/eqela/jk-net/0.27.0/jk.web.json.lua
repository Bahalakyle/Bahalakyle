jk = jk or {}

jk.web = jk.web or {}

jk.web.json = jk.web.json or {}

jk.web.json.JSONAPIClient = {}
jk.web.json.JSONAPIClient.__index = jk.web.json.JSONAPIClient
_vm:set_metatable(jk.web.json.JSONAPIClient, {})

function jk.web.json.JSONAPIClient._create()
	local v = _vm:set_metatable({}, jk.web.json.JSONAPIClient)
	return v
end

function jk.web.json.JSONAPIClient:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.web.json.JSONAPIClient'
	self['_isType.jk.web.json.JSONAPIClient'] = true
	self.credentialsEnabled = false
	self.redirectionEnabled = false
	self.redirectionLimit = 5
	self.apiUrl = nil
	self.webClient = nil
	self.debugCallback = nil
end

function jk.web.json.JSONAPIClient:_construct0()
	jk.web.json.JSONAPIClient._init(self)
	return self
end

function jk.web.json.JSONAPIClient:getFullURL(api)
	local url = self.apiUrl
	if _g.jk.lang.String:isEmpty(url) then
		url = "/"
	end
	if url == "/" then
		if _g.jk.lang.String:startsWith(api, "/", 0) then
			do return api end
		end
		do return _g.jk.lang.String:safeString(url) .. _g.jk.lang.String:safeString(api) end
	end
	if _g.jk.lang.String:endsWith(url, "/") then
		if _g.jk.lang.String:startsWith(api, "/", 0) then
			do return _g.jk.lang.String:safeString(url) .. _g.jk.lang.String:safeString(_g.jk.lang.String:getEndOfString(api, 1)) end
		end
		do return _g.jk.lang.String:safeString(url) .. _g.jk.lang.String:safeString(api) end
	end
	if _g.jk.lang.String:startsWith(api, "/", 0) then
		do return _g.jk.lang.String:safeString(url) .. _g.jk.lang.String:safeString(api) end
	end
	do return _g.jk.lang.String:safeString(url) .. "/" .. _g.jk.lang.String:safeString(api) end
end

function jk.web.json.JSONAPIClient:toUTF8Buffer(data)
	if not (data ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.String:toUTF8Buffer(_g.jk.json.JSONEncoder:encode(data, true, false)) end
end

function jk.web.json.JSONAPIClient:customizeRequestHeaders(headers)
end

function jk.web.json.JSONAPIClient:onStartSendRequest()
end

function jk.web.json.JSONAPIClient:onEndSendRequest()
end

function jk.web.json.JSONAPIClient:onDefaultErrorHandler(error)
end

function jk.web.json.JSONAPIClient:handleAsError(response, callback)
	local error = self:toError(response)
	if error ~= nil then
		do self:onError1(error, callback) end
		do return true end
	end
	do return false end
end

function jk.web.json.JSONAPIClient:toError(response)
	if not (response ~= nil) then
		do return _g.jk.lang.Error:forCode("noServerResponse", nil) end
	end
	if response:getString("status", nil) == "error" then
		local v = _g.jk.lang.Error._construct0(_g.jk.lang.Error._create())
		local code = response:getString("code", nil)
		if _g.jk.lang.String:isEmpty(code) then
			code = response:getString("error", nil)
		end
		do v:setCode(code) end
		do
			local detail = response:getString("detail", nil)
			if _g.jk.lang.String:isEmpty(detail) then
				detail = response:getString("message", nil)
			end
			do v:setDetail(detail) end
			do return v end
		end
	end
	do return nil end
end

function jk.web.json.JSONAPIClient:onError1(error, callback)
	if not (callback ~= nil) then
		do self:onDefaultErrorHandler(error) end
		do return end
	end
	do callback(error) end
end

function jk.web.json.JSONAPIClient:onError2(error)
	do self:onError1(error, nil) end
end

function jk.web.json.JSONAPIClient:sendRequest(method, url, headers, data, callback, errorCallback)
	if not (callback ~= nil) then
		do return end
	end
	do
		local ll = callback
		local ecb = errorCallback
		do self:doSendRequest(method, url, headers, data, function(responseHeaders, body)
			if not (body ~= nil and _g.jk.lang.Buffer:getSize(body) > 0) then
				do self:onError1(_g.jk.lang.Error:forCode("requestFailed", nil), ecb) end
				do return end
			end
			do
				local responseString = _g.jk.lang.String:forUTF8Buffer(body)
				if self.debugCallback ~= nil then
					do self.debugCallback("Received response: `" .. _g.jk.lang.String:safeString(responseString) .. "'") end
				end
				do
					local jsonResponseBody = _vm:to_table_with_key(_g.jk.json.JSONParser:parseString(responseString), '_isType.jk.lang.DynamicMap')
					if not (jsonResponseBody ~= nil) then
						do self:onError1(_g.jk.lang.Error:forCode("invalidServerResponse", nil), ecb) end
						do return end
					end
					if not self:handleAsError(jsonResponseBody, ecb) then
						do ll(jsonResponseBody) end
					end
				end
			end
		end, ecb, 0) end
	end
end

function jk.web.json.JSONAPIClient:doSendRequest(method, url, headers, data, callback, errorCallback, redirectCount)
	if not (callback ~= nil) then
		do return end
	end
	if not (redirectCount <= self.redirectionLimit) then
		do self:onError1(_g.jk.lang.Error:forCode("tooManyRedirections", nil), errorCallback) end
		do return end
	end
	do
		local hrs = headers
		if not (hrs ~= nil) then
			hrs = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
			do hrs:add("Content-Type", "application/json") end
		end
		if not (self.webClient ~= nil) then
			self.webClient = _g.jk.web.NativeWebClient:instance()
		end
		if not (self.webClient ~= nil) then
			do self:onError1(_g.jk.lang.Error:forCode("noWebClient", nil), errorCallback) end
			do return end
		end
		do self.webClient:setCredentialsEnabled(self.credentialsEnabled) end
		do self:customizeRequestHeaders(hrs) end
		do
			local hrsf = hrs
			local cb = callback
			local ecb = errorCallback
			local urlf = url
			local dataf = data
			local methodf = method
			do self:onStartSendRequest() end
			if self.debugCallback ~= nil then
				do self.debugCallback("Sending request: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forUTF8Buffer(data)) .. "'") end
			end
			do
				local rdc = redirectCount
				do self.webClient:query(methodf, urlf, hrsf, dataf, function(statusCode, responseHeaders, body)
					do self:onEndSendRequest() end
					if self.redirectionEnabled then
						local code = _g.jk.lang.String:toInteger(statusCode)
						if code >= 300 and code <= 399 and responseHeaders ~= nil then
							local location = nil
							local rhs = responseHeaders:asVector()
							if rhs ~= nil then
								local n2 = 0
								local m = _g.jk.lang.Vector:getSize(rhs)
								do
									n2 = 0
									while n2 < m do
										local kvp = rhs[n2 + 1]
										if kvp ~= nil then
											if _g.jk.lang.String:equalsIgnoreCase(kvp.key, "Location") then
												location = kvp.value
												do break end
											end
										end
										do n2 = n2 + 1 end
									end
								end
							end
							if _g.jk.lang.String:isNotEmpty(location) then
								if not _g.jk.lang.String:startsWith(location, "http", 0) then
									location = self:getFullURL(location)
								end
								do
									local o = _g.jk.url.URL:forString(urlf, false)
									local n = _g.jk.url.URL:forString(location, false)
									if o ~= nil and n ~= nil and _g.jk.lang.String:equalsIgnoreCase(o:getHost(), n:getHost()) and not (o:getPort() == n:getPort()) then
										do n:setPort(o:getPort()) end
										location = n:toString()
									end
									do self:doSendRequest(methodf, location, hrsf, dataf, cb, ecb, rdc + 1) end
									do return end
								end
							end
						end
					end
					if not (body ~= nil and _g.jk.lang.Buffer:getSize(body) > 0) then
						do self:onError1(_g.jk.lang.Error:forCode("failedToConnect", nil), ecb) end
						do return end
					end
					do cb(responseHeaders, body) end
				end) end
			end
		end
	end
end

function jk.web.json.JSONAPIClient:doGetFile(url, callback, errorCallback)
	do self:doSendRequest("GET", self:getFullURL(url), nil, nil, callback, errorCallback, 0) end
end

function jk.web.json.JSONAPIClient:doGet(url, callback, errorCallback)
	do self:sendRequest("GET", self:getFullURL(url), nil, nil, callback, errorCallback) end
end

function jk.web.json.JSONAPIClient:doPost(url, data, callback, errorCallback)
	do self:sendRequest("POST", self:getFullURL(url), nil, self:toUTF8Buffer(data), callback, errorCallback) end
end

function jk.web.json.JSONAPIClient:doPut(url, data, callback, errorCallback)
	do self:sendRequest("PUT", self:getFullURL(url), nil, self:toUTF8Buffer(data), callback, errorCallback) end
end

function jk.web.json.JSONAPIClient:doDelete(url, callback, errorCallback)
	do self:sendRequest("DELETE", self:getFullURL(url), nil, nil, callback, errorCallback) end
end

function jk.web.json.JSONAPIClient:uploadFile(url, data, mimeType, callback, errorCallback)
	local mt = mimeType
	if _g.jk.lang.String:isEmpty(mt) then
		mt = "application/octet-stream"
	end
	do
		local hdrs = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
		do hdrs:add("content-type", mt) end
		do self:sendRequest("POST", self:getFullURL(url), hdrs, data, callback, errorCallback) end
	end
end

function jk.web.json.JSONAPIClient:getWithStatus(url, callback)
	local cb = callback
	local okcb = function(v)
		local data = v:getDynamicMap("data")
		if data == nil then
			data = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		end
		do cb(data, nil) end
	end
	local errcb = function(err)
		do cb(nil, err) end
	end
	do self:sendRequest("GET", self:getFullURL(url), nil, nil, okcb, errcb) end
end

function jk.web.json.JSONAPIClient:postWithStatus(url, data, headers, callback)
	local cb = callback
	local okcb = function(v)
		local data = v:getDynamicMap("data")
		if data == nil then
			data = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		end
		do cb(data, nil) end
	end
	local errcb = function(err)
		do cb(nil, err) end
	end
	do self:sendRequest("POST", self:getFullURL(url), headers, self:toUTF8Buffer(data), okcb, errcb) end
end

function jk.web.json.JSONAPIClient:getCredentialsEnabled()
	do return self.credentialsEnabled end
end

function jk.web.json.JSONAPIClient:setCredentialsEnabled(v)
	self.credentialsEnabled = v
	do return self end
end

function jk.web.json.JSONAPIClient:getRedirectionEnabled()
	do return self.redirectionEnabled end
end

function jk.web.json.JSONAPIClient:setRedirectionEnabled(v)
	self.redirectionEnabled = v
	do return self end
end

function jk.web.json.JSONAPIClient:getRedirectionLimit()
	do return self.redirectionLimit end
end

function jk.web.json.JSONAPIClient:setRedirectionLimit(v)
	self.redirectionLimit = v
	do return self end
end

function jk.web.json.JSONAPIClient:getApiUrl()
	do return self.apiUrl end
end

function jk.web.json.JSONAPIClient:setApiUrl(v)
	self.apiUrl = v
	do return self end
end

function jk.web.json.JSONAPIClient:getWebClient()
	do return self.webClient end
end

function jk.web.json.JSONAPIClient:setWebClient(v)
	self.webClient = v
	do return self end
end

function jk.web.json.JSONAPIClient:getDebugCallback()
	do return self.debugCallback end
end

function jk.web.json.JSONAPIClient:setDebugCallback(v)
	self.debugCallback = v
	do return self end
end
