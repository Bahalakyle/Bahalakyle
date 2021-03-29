jk = jk or {}

jk.http = jk.http or {}

jk.http.server = jk.http.server or {}

jk.http.server.cookie = jk.http.server.cookie or {}

jk.http.server.cookie.HTTPServerCookie = {}
jk.http.server.cookie.HTTPServerCookie.__index = jk.http.server.cookie.HTTPServerCookie
_vm:set_metatable(jk.http.server.cookie.HTTPServerCookie, {})

function jk.http.server.cookie.HTTPServerCookie._create()
	local v = _vm:set_metatable({}, jk.http.server.cookie.HTTPServerCookie)
	return v
end

function jk.http.server.cookie.HTTPServerCookie:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.cookie.HTTPServerCookie'
	self['_isType.jk.http.server.cookie.HTTPServerCookie'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.key = nil
	self.value = nil
	self.maxAge = -1
	self.expires = nil
	self.path = nil
	self.domain = nil
	self.secure = false
	self.httpOnly = false
	self.sameSite = nil
end

function jk.http.server.cookie.HTTPServerCookie:forKeyValue(key, value)
	local v = _g.jk.http.server.cookie.HTTPServerCookie._construct0(_g.jk.http.server.cookie.HTTPServerCookie._create())
	do v:setKey(key) end
	do v:setValue(value) end
	do return v end
end

function jk.http.server.cookie.HTTPServerCookie:forDeleteKey(key)
	local v = _g.jk.http.server.cookie.HTTPServerCookie._construct0(_g.jk.http.server.cookie.HTTPServerCookie._create())
	do v:setKey(key) end
	do v:setExpires("Thu, 01 Jan 1970 00:00:00 GMT") end
	do return v end
end

function jk.http.server.cookie.HTTPServerCookie:_construct0()
	jk.http.server.cookie.HTTPServerCookie._init(self)
	return self
end

function jk.http.server.cookie.HTTPServerCookie:_construct2(key, value)
	jk.http.server.cookie.HTTPServerCookie._init(self)
	self.key = key
	self.value = value
	return self
end

function jk.http.server.cookie.HTTPServerCookie:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(self.key) end
	do sb:appendCharacter(61) end
	if self.value ~= nil then
		do sb:appendString(self.value) end
	end
	if self.maxAge >= 0 then
		do sb:appendString("; Max-Age=") end
		do sb:appendString(_g.jk.lang.String:forInteger(self.maxAge)) end
	end
	if _g.jk.lang.String:isNotEmpty(self.expires) then
		do sb:appendString("; Expires=") end
		do sb:appendString(self.expires) end
	end
	if _g.jk.lang.String:isNotEmpty(self.path) then
		do sb:appendString("; Path=") end
		do sb:appendString(self.path) end
	end
	if _g.jk.lang.String:isNotEmpty(self.domain) then
		do sb:appendString("; Domain=") end
		do sb:appendString(self.domain) end
	end
	if self.secure then
		do sb:appendString("; Secure") end
	end
	if self.httpOnly then
		do sb:appendString("; HttpOnly") end
	end
	if _g.jk.lang.String:isNotEmpty(self.sameSite) then
		do sb:appendString("; SameSite=") end
		do sb:appendString(self.sameSite) end
	end
	do return sb:toString() end
end

function jk.http.server.cookie.HTTPServerCookie:getKey()
	do return self.key end
end

function jk.http.server.cookie.HTTPServerCookie:setKey(v)
	self.key = v
	do return self end
end

function jk.http.server.cookie.HTTPServerCookie:getValue()
	do return self.value end
end

function jk.http.server.cookie.HTTPServerCookie:setValue(v)
	self.value = v
	do return self end
end

function jk.http.server.cookie.HTTPServerCookie:getMaxAge()
	do return self.maxAge end
end

function jk.http.server.cookie.HTTPServerCookie:setMaxAge(v)
	self.maxAge = v
	do return self end
end

function jk.http.server.cookie.HTTPServerCookie:getExpires()
	do return self.expires end
end

function jk.http.server.cookie.HTTPServerCookie:setExpires(v)
	self.expires = v
	do return self end
end

function jk.http.server.cookie.HTTPServerCookie:getPath()
	do return self.path end
end

function jk.http.server.cookie.HTTPServerCookie:setPath(v)
	self.path = v
	do return self end
end

function jk.http.server.cookie.HTTPServerCookie:getDomain()
	do return self.domain end
end

function jk.http.server.cookie.HTTPServerCookie:setDomain(v)
	self.domain = v
	do return self end
end

function jk.http.server.cookie.HTTPServerCookie:getSecure()
	do return self.secure end
end

function jk.http.server.cookie.HTTPServerCookie:setSecure(v)
	self.secure = v
	do return self end
end

function jk.http.server.cookie.HTTPServerCookie:getHttpOnly()
	do return self.httpOnly end
end

function jk.http.server.cookie.HTTPServerCookie:setHttpOnly(v)
	self.httpOnly = v
	do return self end
end

function jk.http.server.cookie.HTTPServerCookie:getSameSite()
	do return self.sameSite end
end

function jk.http.server.cookie.HTTPServerCookie:setSameSite(v)
	self.sameSite = v
	do return self end
end
