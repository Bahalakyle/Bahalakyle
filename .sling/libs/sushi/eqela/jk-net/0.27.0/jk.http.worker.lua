jk = jk or {}

jk.http = jk.http or {}

jk.http.worker = jk.http.worker or {}

jk.http.worker.HTTPWorkerRequest = {}
jk.http.worker.HTTPWorkerRequest.__index = jk.http.worker.HTTPWorkerRequest
_vm:set_metatable(jk.http.worker.HTTPWorkerRequest, {})

function jk.http.worker.HTTPWorkerRequest._create()
	local v = _vm:set_metatable({}, jk.http.worker.HTTPWorkerRequest)
	return v
end

function jk.http.worker.HTTPWorkerRequest:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.worker.HTTPWorkerRequest'
	self['_isType.jk.http.worker.HTTPWorkerRequest'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.method = nil
	self.path = nil
	self.body = nil
	self.session = nil
	self.rawHeaders = nil
	self.headers = nil
	self.url = nil
	self.cookies = nil
end

function jk.http.worker.HTTPWorkerRequest:_construct0()
	jk.http.worker.HTTPWorkerRequest._init(self)
	return self
end

function jk.http.worker.HTTPWorkerRequest:instance()
	local v = _g.jk.http.worker.HTTPWorkerRequest._construct0(_g.jk.http.worker.HTTPWorkerRequest._create())
	do v:parseWorkerInput() end
	do return v end
end

function jk.http.worker.HTTPWorkerRequest:parseWorkerInput()
	local parser = _g.jk.mypacket.MyPacketParser:forBuffer(_g.jk.worker.Worker:getInputBuffer())
	do self:setMethod(parser:getLengthEncodedString()) end
	do self:setPath(parser:getLengthEncodedString()) end
	do
		local nheaders = parser:getLengthEncodedInteger()
		do
			local n = 0
			while n < nheaders do
				local key = parser:getLengthEncodedString()
				local val = parser:getLengthEncodedString()
				if key ~= nil then
					do self:addToHeaders(key, val) end
				end
				do n = n + 1 end
			end
		end
		do self:setBody(parser:getLengthEncodedBuffer()) end
	end
end

function jk.http.worker.HTTPWorkerRequest:getBodyString()
	do return _g.jk.lang.String:forUTF8Buffer(self.body) end
end

function jk.http.worker.HTTPWorkerRequest:getBodyJSONObject()
	do return _g.jk.json.JSONParser:parseBuffer(self.body) end
end

function jk.http.worker.HTTPWorkerRequest:getBodyJSONMap()
	do return _vm:to_table_with_key(self:getBodyJSONObject(), '_isType.jk.lang.DynamicMap') end
end

function jk.http.worker.HTTPWorkerRequest:addToHeaders(key, value)
	if not (key ~= nil) then
		do return end
	end
	do
		local vv = value
		if not (vv ~= nil) then
			vv = ""
		end
		if not (self.rawHeaders ~= nil) then
			self.rawHeaders = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
		end
		if not (self.headers ~= nil) then
			self.headers = {}
		end
		do self.rawHeaders:add(key, vv) end
		self.headers[_g.jk.lang.String:toLowerCase(key)] = value
	end
end

function jk.http.worker.HTTPWorkerRequest:getRawHeaders()
	do return self.rawHeaders end
end

function jk.http.worker.HTTPWorkerRequest:getHeaders()
	do return self.headers end
end

function jk.http.worker.HTTPWorkerRequest:removeFromHeaders(key)
	if not (self.rawHeaders ~= nil) then
		do return end
	end
	if not (key ~= nil) then
		do return end
	end
	do
		local n = 0
		local klow = _g.jk.lang.String:toLowerCase(key)
		while n < self.rawHeaders:count() do
			local kk = _g.jk.lang.String:toLowerCase(self.rawHeaders:getKey(n))
			if kk ~= nil and kk == klow then
				do self.rawHeaders:remove(n) end
			else
				do n = n + 1 end
			end
		end
		if self.headers ~= nil then
			do _g.jk.lang.Map:remove(self.headers, key) end
		end
	end
end

function jk.http.worker.HTTPWorkerRequest:getHeaderValue(name)
	if not _g.jk.lang.String:isNotEmpty(name) then
		do return nil end
	end
	if not (self.headers ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(self.headers, name) end
end

function jk.http.worker.HTTPWorkerRequest:getURL()
	if not (self.url ~= nil) then
		self.url = _g.jk.url.URL:forString(self.path, true)
	end
	do return self.url end
end

function jk.http.worker.HTTPWorkerRequest:getQueryParameters()
	local url = self:getURL()
	if not (url ~= nil) then
		do return nil end
	end
	do return url:getQueryParameters() end
end

function jk.http.worker.HTTPWorkerRequest:getQueryParameter(key)
	local url = self:getURL()
	if not (url ~= nil) then
		do return nil end
	end
	do return url:getQueryParameter(key) end
end

function jk.http.worker.HTTPWorkerRequest:getURLPath()
	local url = self:getURL()
	if not (url ~= nil) then
		do return nil end
	end
	do return url:getPath() end
end

function jk.http.worker.HTTPWorkerRequest:getCookieValues()
	if not (self.cookies ~= nil) then
		local v = {}
		local cvals = self:getHeaderValue("cookie")
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
								goto _continue1
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
						::_continue1::
						do n = n + 1 end
					end
				end
			end
		end
		self.cookies = v
	end
	do return self.cookies end
end

function jk.http.worker.HTTPWorkerRequest:getCookieValue(name)
	local c = self:getCookieValues()
	if not (c ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(c, name) end
end

function jk.http.worker.HTTPWorkerRequest:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if self.method ~= nil then
		do sb:appendString(self.method) end
	else
		do sb:appendString("NOMETHOD") end
	end
	do sb:appendCharacter(32) end
	if self.path ~= nil then
		do sb:appendString(self.path) end
	else
		do sb:appendString("NOPATH") end
	end
	do sb:appendString(" HTTP/1.1\n") end
	if self.rawHeaders ~= nil then
		local it = self.rawHeaders:iterate()
		while it ~= nil do
			local pair = it:next()
			if not (pair ~= nil) then
				do break end
			end
			do sb:appendString(pair.key) end
			do sb:appendString(": ") end
			do sb:appendString(pair.value) end
			do sb:appendCharacter(10) end
		end
	end
	do sb:appendCharacter(10) end
	do sb:appendString(self:getBodyString()) end
	do return sb:toString() end
end

function jk.http.worker.HTTPWorkerRequest:getMethod()
	do return self.method end
end

function jk.http.worker.HTTPWorkerRequest:setMethod(v)
	self.method = v
	do return self end
end

function jk.http.worker.HTTPWorkerRequest:getPath()
	do return self.path end
end

function jk.http.worker.HTTPWorkerRequest:setPath(v)
	self.path = v
	do return self end
end

function jk.http.worker.HTTPWorkerRequest:getBody()
	do return self.body end
end

function jk.http.worker.HTTPWorkerRequest:setBody(v)
	self.body = v
	do return self end
end

function jk.http.worker.HTTPWorkerRequest:getSession()
	do return self.session end
end

function jk.http.worker.HTTPWorkerRequest:setSession(v)
	self.session = v
	do return self end
end

jk.http.worker.HTTPWorkerHandler = {}
jk.http.worker.HTTPWorkerHandler.__index = jk.http.worker.HTTPWorkerHandler
_vm:set_metatable(jk.http.worker.HTTPWorkerHandler, {})

function jk.http.worker.HTTPWorkerHandler._create()
	local v = _vm:set_metatable({}, jk.http.worker.HTTPWorkerHandler)
	return v
end

function jk.http.worker.HTTPWorkerHandler:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.worker.HTTPWorkerHandler'
	self['_isType.jk.http.worker.HTTPWorkerHandler'] = true
	self['_isType.jk.lang.Runnable'] = true
	self.ctx = nil
end

function jk.http.worker.HTTPWorkerHandler:_construct0()
	jk.http.worker.HTTPWorkerHandler._init(self)
	self.ctx = _g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create())
	return self
end

function jk.http.worker.HTTPWorkerHandler:handleRequest(req, resp)
end

function jk.http.worker.HTTPWorkerHandler:onStartRequest()
end

function jk.http.worker.HTTPWorkerHandler:onEndRequest()
end

function jk.http.worker.HTTPWorkerHandler:preProcess(req, resp)
end

function jk.http.worker.HTTPWorkerHandler:postProcess(req, resp)
end

function jk.http.worker.HTTPWorkerHandler:generateNotFound(resp)
	do resp:setStatus("404") end
	do resp:setHeaders(nil) end
	do resp:setContentType("text/plain") end
	do resp:setBody(_g.jk.lang.String:toUTF8Buffer("Not found")) end
end

function jk.http.worker.HTTPWorkerHandler:generateInternalServerError(resp)
	do resp:setStatus("500") end
	do resp:setHeaders(nil) end
	do resp:setContentType("text/plain") end
	do resp:setBody(_g.jk.lang.String:toUTF8Buffer("Internal server error")) end
end

function jk.http.worker.HTTPWorkerHandler:run()
	do self:onStartRequest() end
	do
		local req = _g.jk.http.worker.HTTPWorkerRequest:instance()
		local resp = _g.jk.http.worker.HTTPWorkerResponse._construct0(_g.jk.http.worker.HTTPWorkerResponse._create())
		do
			local _status, _err = _vm:execute_protected_call(function()
				do self:preProcess(req, resp) end
				if _g.jk.lang.String:isEmpty(resp:getStatus()) then
					do self:handleRequest(req, resp) end
				end
			end)
			if _err then
				local e = _err
				do _g.jk.log.Log:error(self.ctx, "Exception while processing request: " .. _g.jk.lang.String:safeString(_g.jk.log.Log:asString(self.ctx, e))) end
				do self:generateInternalServerError(resp) end
			end
		end
		if _g.jk.lang.String:isEmpty(resp:getStatus()) then
			do self:generateNotFound(resp) end
		end
		do self:postProcess(req, resp) end
		do resp:send() end
		do self:onEndRequest() end
	end
end

function jk.http.worker.HTTPWorkerHandler:getCtx()
	do return self.ctx end
end

function jk.http.worker.HTTPWorkerHandler:setCtx(v)
	self.ctx = v
	do return self end
end

jk.http.worker.HTTPWorkerResponse = {}
jk.http.worker.HTTPWorkerResponse.__index = jk.http.worker.HTTPWorkerResponse
_vm:set_metatable(jk.http.worker.HTTPWorkerResponse, {})

function jk.http.worker.HTTPWorkerResponse._create()
	local v = _vm:set_metatable({}, jk.http.worker.HTTPWorkerResponse)
	return v
end

function jk.http.worker.HTTPWorkerResponse:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.worker.HTTPWorkerResponse'
	self['_isType.jk.http.worker.HTTPWorkerResponse'] = true
	self.status = nil
	self.headers = nil
	self.body = nil
end

function jk.http.worker.HTTPWorkerResponse:_construct0()
	jk.http.worker.HTTPWorkerResponse._init(self)
	do self:setStatus(nil) end
	do self:setHeaders(nil) end
	do self:setBody(nil) end
	return self
end

function jk.http.worker.HTTPWorkerResponse:setContentType(type)
	do self:addHeader("Content-Type", type) end
end

function jk.http.worker.HTTPWorkerResponse:setResponseBuffer(type, buffer)
	do self:setContentType(type) end
	do self:setBody(buffer) end
end

function jk.http.worker.HTTPWorkerResponse:setResponseString(type, resp)
	do self:setContentType(type) end
	do self:setBody(_g.jk.lang.String:toUTF8Buffer(resp)) end
end

function jk.http.worker.HTTPWorkerResponse:setResponseHtml(html)
	do self:setResponseString("text/html", html) end
end

function jk.http.worker.HTTPWorkerResponse:setResponseText(text)
	do self:setResponseString("text/plain", text) end
end

function jk.http.worker.HTTPWorkerResponse:setResponseJson(text)
	do self:setResponseString("application/json", text) end
end

function jk.http.worker.HTTPWorkerResponse:setResponseBinary(data)
	do self:setResponseBuffer("application/octet-stream", data) end
end

function jk.http.worker.HTTPWorkerResponse:addHeader(key, value)
	if not (key ~= nil) then
		do return end
	end
	if not (self.headers ~= nil) then
		self.headers = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
	end
	do self.headers:add(key, value) end
end

function jk.http.worker.HTTPWorkerResponse:getHeaderValue(name)
	if not (name ~= nil) then
		do return nil end
	end
	if not (self.headers ~= nil) then
		do return nil end
	end
	do
		local it = self.headers:iterate()
		while it ~= nil do
			local vv = it:next()
			if not (vv ~= nil) then
				do break end
			end
			if name == _g.jk.lang.String:toLowerCase(vv.key) then
				do return vv.value end
			end
		end
		do return nil end
	end
end

function jk.http.worker.HTTPWorkerResponse:addCookie(cookie)
	if not (cookie ~= nil) then
		do return end
	end
	do self:addHeader("Set-Cookie", cookie:toString()) end
end

function jk.http.worker.HTTPWorkerResponse:send()
	local writer = _g.jk.worker.Worker:getOutputWriter()
	local builder = _g.jk.mypacket.MyPacketBuilder._construct0(_g.jk.mypacket.MyPacketBuilder._create())
	do builder:appendLengthEncodedString(self.status) end
	if self.headers ~= nil then
		local count = self.headers:count()
		do builder:appendLengthEncodedInteger(count) end
		do
			local n = 0
			while n < count do
				local key = self.headers:getKey(n)
				local val = self.headers:getValue(n)
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
	else
		do builder:appendLengthEncodedInteger(0) end
	end
	do builder:appendLengthEncodedBuffer(self.body) end
	do writer:write(builder:finalize(), -1) end
end

function jk.http.worker.HTTPWorkerResponse:getStatus()
	do return self.status end
end

function jk.http.worker.HTTPWorkerResponse:setStatus(v)
	self.status = v
	do return self end
end

function jk.http.worker.HTTPWorkerResponse:getHeaders()
	do return self.headers end
end

function jk.http.worker.HTTPWorkerResponse:setHeaders(v)
	self.headers = v
	do return self end
end

function jk.http.worker.HTTPWorkerResponse:getBody()
	do return self.body end
end

function jk.http.worker.HTTPWorkerResponse:setBody(v)
	self.body = v
	do return self end
end

jk.http.worker.HTTPWorkerRouter = _g.jk.http.worker.HTTPWorkerHandler._create()
jk.http.worker.HTTPWorkerRouter.__index = jk.http.worker.HTTPWorkerRouter
_vm:set_metatable(jk.http.worker.HTTPWorkerRouter, {
	__index = _g.jk.http.worker.HTTPWorkerHandler
})

function jk.http.worker.HTTPWorkerRouter._create()
	local v = _vm:set_metatable({}, jk.http.worker.HTTPWorkerRouter)
	return v
end

function jk.http.worker.HTTPWorkerRouter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.worker.HTTPWorkerRouter'
	self['_isType.jk.http.worker.HTTPWorkerRouter'] = true
	self.routes = {}
end

function jk.http.worker.HTTPWorkerRouter:_construct0()
	jk.http.worker.HTTPWorkerRouter._init(self)
	do _g.jk.http.worker.HTTPWorkerHandler._construct0(self) end
	do self:initRoutes() end
	return self
end

function jk.http.worker.HTTPWorkerRouter:initRoutes()
end

function jk.http.worker.HTTPWorkerRouter:addRoute(method, pattern, handler)
	if not _g.jk.lang.String:isNotEmpty(method) then
		do return end
	end
	if not _g.jk.lang.String:isNotEmpty(pattern) then
		do return end
	end
	do
		local id = _g.jk.lang.String:safeString(_g.jk.lang.String:toUpperCase(method)) .. _g.jk.lang.String:safeString(pattern)
		self.routes[id] = handler
	end
end

function jk.http.worker.HTTPWorkerRouter:handleRequest(req, resp)
	local match = nil
	local matchVars = nil
	local method = _g.jk.lang.String:toUpperCase(req:getMethod())
	if _g.jk.lang.String:isEmpty(method) then
		method = "GET"
	end
	do
		local path = req:getURLPath()
		if _g.jk.lang.String:isEmpty(path) then
			path = "/"
		end
		do
			local comps = _g.jk.lang.String:split(path, 47, 0)
			local ccount = _g.jk.lang.Vector:getSize(comps)
			local array = _g.jk.lang.Map:getKeys(self.routes)
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local route = array[n + 1]
						if route ~= nil then
							if not _g.jk.lang.String:startsWith(route, method, 0) then
								goto _continue2
							end
							do
								local vars = nil
								local pattern = _g.jk.lang.String:getEndOfString(route, _g.jk.lang.String:getLength(method))
								local pcomps = _g.jk.lang.String:split(pattern, 47, 0)
								local plen = _g.jk.lang.Vector:getSize(pcomps)
								local n1 = 0
								local n2 = 0
								while true do
									local s1 = nil
									local s2 = nil
									while _g.jk.lang.String:isEmpty(s1) and n1 < ccount do
										s1 = _g.jk.lang.Vector:get(comps, (function() local v = n1 n1 = n1 + 1 return v end)())
									end
									while _g.jk.lang.String:isEmpty(s2) and n2 < plen do
										s2 = _g.jk.lang.Vector:get(pcomps, (function() local v = n2 n2 = n2 + 1 return v end)())
									end
									if _g.jk.lang.String:isEmpty(s1) then
										s1 = nil
									end
									if _g.jk.lang.String:isEmpty(s2) then
										s2 = nil
									end
									if s1 == nil and s2 == nil then
										match = route
										matchVars = vars
										do break end
									end
									if s1 ~= nil and _g.jk.lang.String:startsWith(s2, ":", 0) then
										if not (vars ~= nil) then
											vars = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
										end
										do vars:setString(_g.jk.lang.String:getEndOfString(s2, 1), s1) end
										goto _continue3
									end
									if s1 == s2 then
										goto _continue3
									end
									do break end
									::_continue3::
								end
								if match ~= nil then
									do break end
								end
							end
						end
						::_continue2::
						do n = n + 1 end
					end
				end
			end
			if match ~= nil then
				local handler = _g.jk.lang.Map:get(self.routes, match)
				if handler ~= nil then
					if not (matchVars ~= nil) then
						matchVars = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
					end
					do resp:setStatus("200") end
					do handler(req, resp, matchVars) end
				end
			end
		end
	end
end

function jk.http.worker.HTTPWorkerRouter:setErrorResponse(resp, errorCode, statusCode)
	if not (resp ~= nil) then
		do return end
	end
	do resp:setStatus(statusCode) end
	do resp:setHeaders(nil) end
	do resp:setContentType("application/json") end
	do
		local error = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do error:setString("status", "error") end
		do error:setString("error", errorCode) end
		do resp:setBody(_g.jk.lang.String:toUTF8Buffer(_g.jk.json.JSONEncoder:encode(error, true, false))) end
	end
end

function jk.http.worker.HTTPWorkerRouter:setJsonObjectResponse(resp, o, cookie)
	do resp:setStatus("200") end
	do resp:setHeaders(nil) end
	do resp:setContentType("application/json") end
	if cookie ~= nil then
		do resp:addCookie(cookie) end
	end
	do resp:setBody(_g.jk.lang.String:toUTF8Buffer(_g.jk.json.JSONEncoder:encode(o, true, false))) end
end

function jk.http.worker.HTTPWorkerRouter:setOkResponse(resp, data)
	if not (resp ~= nil) then
		do return end
	end
	do
		local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		do v:setString("status", "ok") end
		if data ~= nil then
			do v:setObject("data", data) end
		end
		do self:setJsonObjectResponse(resp, v, nil) end
	end
end

function jk.http.worker.HTTPWorkerRouter:setNotAuthenticated(resp)
	do self:setErrorResponse(resp, "invalidRequest", "401") end
end

function jk.http.worker.HTTPWorkerRouter:setInvalidRequest(resp)
	do self:setErrorResponse(resp, "invalidRequest", "400") end
end

jk.http.worker.HTTPRPCRouter = _g.jk.http.worker.HTTPWorkerRouter._create()
jk.http.worker.HTTPRPCRouter.__index = jk.http.worker.HTTPRPCRouter
_vm:set_metatable(jk.http.worker.HTTPRPCRouter, {
	__index = _g.jk.http.worker.HTTPWorkerRouter
})

function jk.http.worker.HTTPRPCRouter._create()
	local v = _vm:set_metatable({}, jk.http.worker.HTTPRPCRouter)
	return v
end

function jk.http.worker.HTTPRPCRouter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.worker.HTTPRPCRouter'
	self['_isType.jk.http.worker.HTTPRPCRouter'] = true
end

function jk.http.worker.HTTPRPCRouter:_construct0()
	jk.http.worker.HTTPRPCRouter._init(self)
	do _g.jk.http.worker.HTTPWorkerRouter._construct0(self) end
	return self
end

function jk.http.worker.HTTPRPCRouter:addFunction(name, handler)
	do self:addRoute("POST", "/func/" .. _g.jk.lang.String:safeString(name), function(req, resp, vars)
		do
			local _status, _err = _vm:execute_protected_call(function()
				local bodyString = req:getBodyString()
				local data = _vm:to_table_with_key(_g.jk.json.JSONParser:parseString(bodyString), '_isType.jk.lang.DynamicMap')
				if not (data ~= nil) then
					local ctx = self:getCtx()
					if ctx ~= nil and ctx:isInDebugMode() then
						do _g.jk.log.Log:debug(ctx, "Invalid body: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(req)) .. "'") end
					end
					do _g.jk.lang.Error:throw("invalidBody", nil) end
				end
				do
					local v = handler(data)
					local r = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
					do r:setString("status", "ok") end
					do r:setObject("data", v) end
					do resp:setStatus("200") end
					do resp:setBody(_g.jk.lang.String:toUTF8Buffer(_g.jk.json.JSONEncoder:toString(r))) end
				end
			end)
			if _err then
				if (_vm:to_table_with_key(_err, '_isType.jk.lang.ExceptionWithError') ~= nil) then
					local e = _err
					do _g.jk.log.Log:error(self:getCtx(), _g.jk.lang.String:asString(e)) end
					do resp:setStatus("500") end
					do
						local r = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
						do r:setString("status", "error") end
						do r:setString("errorCode", e:getErrorCode()) end
						do r:setString("errorDetail", _g.jk.lang.String:asString(e:getErrorDetail())) end
						do resp:setBody(_g.jk.lang.String:toUTF8Buffer(_g.jk.json.JSONEncoder:toString(r))) end
					end
				else
					local e = _err
					do _g.jk.log.Log:error(self:getCtx(), _g.jk.lang.String:asString(e)) end
					do resp:setStatus("500") end
					do
						local r = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
						do r:setString("status", "error") end
						do resp:setBody(_g.jk.lang.String:toUTF8Buffer(_g.jk.json.JSONEncoder:toString(r))) end
					end
				end
			end
		end
		do resp:setHeaders(nil) end
		do resp:setContentType("application/json") end
	end) end
end
