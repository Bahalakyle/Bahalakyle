jk = jk or {}

jk.web = jk.web or {}

jk.web.WebClient = {}
jk.web.WebClient.__index = jk.web.WebClient
_vm:set_metatable(jk.web.WebClient, {})

function jk.web.WebClient._create()
	local v = _vm:set_metatable({}, jk.web.WebClient)
	return v
end

function jk.web.WebClient:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.web.WebClient'
	self['_isType.jk.web.WebClient'] = true
	self.followRedirects = true
	self.credentialsEnabled = false
end

function jk.web.WebClient:_construct0()
	jk.web.WebClient._init(self)
	return self
end

function jk.web.WebClient:query(method, url, headers, body, callback)
end

function jk.web.WebClient:getFollowRedirects()
	do return self.followRedirects end
end

function jk.web.WebClient:setFollowRedirects(v)
	self.followRedirects = v
	do return self end
end

function jk.web.WebClient:getCredentialsEnabled()
	do return self.credentialsEnabled end
end

function jk.web.WebClient:setCredentialsEnabled(v)
	self.credentialsEnabled = v
	do return self end
end

jk.web.NativeWebClient = {}
jk.web.NativeWebClient.__index = jk.web.NativeWebClient
_vm:set_metatable(jk.web.NativeWebClient, {})

function jk.web.NativeWebClient._create()
	local v = _vm:set_metatable({}, jk.web.NativeWebClient)
	return v
end

function jk.web.NativeWebClient:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.web.NativeWebClient'
	self['_isType.jk.web.NativeWebClient'] = true
end

function jk.web.NativeWebClient:_construct0()
	jk.web.NativeWebClient._init(self)
	return self
end

function jk.web.NativeWebClient:instance()
	_io:write_to_stdout("[jk.web.NativeWebClient.instance] (NativeWebClient.sling:51:3): Not implemented." .. "\n")
	do return nil end
end
