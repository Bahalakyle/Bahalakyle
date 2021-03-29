jk = jk or {}

jk.http = jk.http or {}

jk.http.server = jk.http.server or {}

jk.http.server.cors = jk.http.server.cors or {}

jk.http.server.cors.HTTPServerCORSUtil = {}
jk.http.server.cors.HTTPServerCORSUtil.__index = jk.http.server.cors.HTTPServerCORSUtil
_vm:set_metatable(jk.http.server.cors.HTTPServerCORSUtil, {})

function jk.http.server.cors.HTTPServerCORSUtil._create()
	local v = _vm:set_metatable({}, jk.http.server.cors.HTTPServerCORSUtil)
	return v
end

function jk.http.server.cors.HTTPServerCORSUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.cors.HTTPServerCORSUtil'
	self['_isType.jk.http.server.cors.HTTPServerCORSUtil'] = true
	self.whitelist = nil
end

function jk.http.server.cors.HTTPServerCORSUtil:_construct0()
	jk.http.server.cors.HTTPServerCORSUtil._init(self)
	return self
end

function jk.http.server.cors.HTTPServerCORSUtil:forWhitelist(list)
	local v = _g.jk.http.server.cors.HTTPServerCORSUtil._construct0(_g.jk.http.server.cors.HTTPServerCORSUtil._create())
	do v:setWhitelist(list) end
	do return v end
end

function jk.http.server.cors.HTTPServerCORSUtil:handlePreflightRequest(req)
	local origin = req:getHeader("origin")
	local response = _g.jk.http.server.HTTPServerResponse._construct0(_g.jk.http.server.HTTPServerResponse._create())
	do response:setStatus("200") end
	do response:addHeader("Content-Length", "0") end
	if not _g.jk.lang.Vector:contains(self.whitelist, origin) then
		do return response end
	end
	do
		local headers = self:createResponseHeaders(origin, req:getHeaders())
		if not (headers ~= nil) then
			do return nil end
		end
		do
			local it = headers:iterate()
			while it ~= nil do
				local vv = it:next()
				if not (vv ~= nil) then
					do break end
				end
				do response:addHeader(vv.key, vv.value) end
			end
			do return response end
		end
	end
end

function jk.http.server.cors.HTTPServerCORSUtil:handleWorkerRequest(req, resp)
	local origin = req:getHeaderValue("origin")
	if not _g.jk.lang.Vector:contains(self.whitelist, origin) then
		do return end
	end
	do
		local headers = self:createResponseHeaders(origin, req:getHeaders())
		if not (headers ~= nil) then
			do return end
		end
		do
			local it = headers:iterate()
			while it ~= nil do
				local vv = it:next()
				if not (vv ~= nil) then
					do break end
				end
				do resp:addHeader(vv.key, vv.value) end
			end
		end
	end
end

function jk.http.server.cors.HTTPServerCORSUtil:createResponseHeaders(origin, requestHeaders)
	if not (requestHeaders ~= nil) then
		do return nil end
	end
	do
		local kv = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
		do kv:add("Access-Control-Allow-Origin", origin) end
		do kv:add("Access-Control-Allow-Credentials", "true") end
		do
			local rqm = _g.jk.lang.Map:getValue(requestHeaders, "access-control-request-method")
			if _g.jk.lang.String:isNotEmpty(rqm) then
				do kv:add("Access-Control-Allow-Methods", rqm) end
			end
			do
				local rqh = _g.jk.lang.Map:getValue(requestHeaders, "access-control-request-headers")
				if _g.jk.lang.String:isNotEmpty(rqh) then
					do kv:add("Access-Control-Allow-Headers", rqh) end
				end
				do return kv end
			end
		end
	end
end

function jk.http.server.cors.HTTPServerCORSUtil:getWhitelist()
	do return self.whitelist end
end

function jk.http.server.cors.HTTPServerCORSUtil:setWhitelist(v)
	self.whitelist = v
	do return self end
end
