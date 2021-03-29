jk = jk or {}

jk.url = jk.url or {}

jk.url.QueryString = {}
jk.url.QueryString.__index = jk.url.QueryString
_vm:set_metatable(jk.url.QueryString, {})

function jk.url.QueryString._create()
	local v = _vm:set_metatable({}, jk.url.QueryString)
	return v
end

function jk.url.QueryString:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.url.QueryString'
	self['_isType.jk.url.QueryString'] = true
end

function jk.url.QueryString:_construct0()
	jk.url.QueryString._init(self)
	return self
end

function jk.url.QueryString:parse(queryString)
	local v = {}
	if _g.jk.lang.String:isEmpty(queryString) then
		do return v end
	end
	do
		local array = _g.jk.lang.String:split(queryString, 38, 0)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local qs = array[n + 1]
					if qs ~= nil then
						if _g.jk.lang.String:isEmpty(qs) then
							goto _continue1
						end
						if _g.jk.lang.String:getIndexOfCharacter(qs, 61, 0) < 0 then
							do _g.jk.lang.Map:set(v, qs, nil) end
							goto _continue1
						end
						do
							local qsps = _g.jk.lang.String:split(qs, 61, 2)
							local key = qsps[0 + 1]
							local val = qsps[1 + 1]
							if val == nil then
								val = ""
							end
							if _g.jk.lang.String:isEmpty(key) == false then
								do _g.jk.lang.Map:set(v, _g.jk.url.URLDecoder:decode(key), _g.jk.url.URLDecoder:decode(val)) end
							end
						end
					end
					::_continue1::
					do n = n + 1 end
				end
			end
		end
		do return v end
	end
end

function jk.url.QueryString:encode(queryString)
	local str = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local first = true
	local keys = _g.jk.lang.Map:getKeys(queryString)
	if keys ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(keys)
		do
			n = 0
			while n < m do
				local key = keys[n + 1]
				if key ~= nil then
					if _g.jk.lang.String:isEmpty(key) then
						goto _continue2
					end
					do
						local val = _g.jk.lang.Map:getValue(queryString, key)
						if not first then
							do str:appendString("&") end
						end
						do str:appendString(_g.jk.url.URLEncoder:encode(key, false, true)) end
						do str:appendCharacter(61) end
						do str:appendString(_g.jk.url.URLEncoder:encode(val, false, true)) end
						first = false
					end
				end
				::_continue2::
				do n = n + 1 end
			end
		end
	end
	do return str:toString() end
end

jk.url.URL = {}
jk.url.URL.__index = jk.url.URL
_vm:set_metatable(jk.url.URL, {})

function jk.url.URL._create()
	local v = _vm:set_metatable({}, jk.url.URL)
	return v
end

function jk.url.URL:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.url.URL'
	self['_isType.jk.url.URL'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.scheme = nil
	self.username = nil
	self.password = nil
	self.host = nil
	self.port = nil
	self.path = nil
	self.fragment = nil
	self.rawQueryParameters = nil
	self.queryParameters = nil
	self.original = nil
	self.percentOnly = false
	self.encodeUnreservedChars = true
end

function jk.url.URL:_construct0()
	jk.url.URL._init(self)
	return self
end

function jk.url.URL:forString(str, normalizePath)
	local v = _g.jk.url.URL._construct0(_g.jk.url.URL._create())
	do v:parse(str, normalizePath) end
	do return v end
end

function jk.url.URL:dup()
	local v = _g.jk.url.URL._construct0(_g.jk.url.URL._create())
	do v:setScheme(self.scheme) end
	do v:setUsername(self.username) end
	do v:setPassword(self.password) end
	do v:setHost(self.host) end
	do v:setPort(self.port) end
	do v:setPath(self.path) end
	do v:setFragment(self.fragment) end
	if self.rawQueryParameters ~= nil then
		do v:setRawQueryParameters(self.rawQueryParameters:dup()) end
	end
	if self.queryParameters ~= nil then
		do v:setQueryParameters(_g.jk.lang.Map:dup(self.queryParameters)) end
	end
	do return v end
end

function jk.url.URL:toString()
	do return self:toStringDo(true) end
end

function jk.url.URL:toStringNohost()
	do return self:toStringDo(false) end
end

function jk.url.URL:toStringDo(userhost)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if userhost then
		if self.scheme ~= nil then
			do sb:appendString(self.scheme) end
			do sb:appendString("://") end
		end
		if self.username ~= nil then
			do sb:appendString(_g.jk.url.URLEncoder:encode(self.username, false, true)) end
			if self.password ~= nil then
				do sb:appendCharacter(58) end
				do sb:appendString(_g.jk.url.URLEncoder:encode(self.password, false, true)) end
			end
			do sb:appendCharacter(64) end
		end
		if self.host ~= nil then
			do sb:appendString(self.host) end
			if self.port ~= nil then
				do sb:appendCharacter(58) end
				do sb:appendString(self.port) end
			end
		end
	end
	if self.path ~= nil then
		do sb:appendString(_g.jk.lang.String:replaceCharacter(self.path, 32, 43)) end
	end
	if self.rawQueryParameters ~= nil and self.rawQueryParameters:count() > 0 then
		local first = true
		local it = _g.jk.lang.Map:iterateKeys(self.queryParameters)
		while it ~= nil do
			local key = (function(o)
				if (_vm:get_variable_type(o) == 'string') then
					do return o end
				end
				do return nil end
			end)(it:next())
			if key == nil then
				do break end
			end
			if first then
				do sb:appendCharacter(63) end
				first = false
			else
				do sb:appendCharacter(38) end
			end
			do sb:appendString(key) end
			do
				local val = _g.jk.lang.Map:get(self.queryParameters, key)
				if val ~= nil then
					do sb:appendCharacter(61) end
					do sb:appendString(_g.jk.url.URLEncoder:encode(val, self.percentOnly, self.encodeUnreservedChars)) end
				end
			end
		end
	end
	if self.fragment ~= nil then
		do sb:appendCharacter(35) end
		do sb:appendString(self.fragment) end
	end
	do return sb:toString() end
end

function jk.url.URL:clearQueryParameters()
	self.rawQueryParameters = nil
	self.queryParameters = nil
end

function jk.url.URL:normalizePath(path)
	if not (path ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local comps = _g.jk.lang.String:split(path, 47, 0)
		if comps ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(comps)
			do
				n = 0
				while n < m do
					local comp = comps[n + 1]
					if comp ~= nil then
						if _g.jk.lang.String:isEmpty(comp) then
						elseif comp == "." then
						elseif comp == ".." then
							local str = v:toString()
							do v:clear() end
							if str ~= nil then
								local slash = _g.jk.lang.String:getLastIndexOfCharacter(str, 47, -1)
								if slash > 0 then
									do v:appendString(_g.jk.lang.String:getSubString(str, 0, slash)) end
								end
							end
						else
							do v:appendCharacter(47) end
							do v:appendString(comp) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		if v:count() < 2 then
			do return "/" end
		end
		if _g.jk.lang.String:endsWith(path, "/") then
			do v:appendCharacter(47) end
		end
		do return v:toString() end
	end
end

function jk.url.URL:parse(astr, doNormalizePath)
	do self:setOriginal(astr) end
	if not (astr ~= nil) then
		do return end
	end
	do
		local fsp = _g.jk.lang.String:split(astr, 35, 2)
		local str = _g.jk.lang.Vector:get(fsp, 0)
		self.fragment = _g.jk.lang.Vector:get(fsp, 1)
		do
			local qsplit = _g.jk.lang.String:split(str, 63, 2)
			str = _g.jk.lang.Vector:get(qsplit, 0)
			do
				local queryString = _g.jk.lang.Vector:get(qsplit, 1)
				if _g.jk.lang.String:isEmpty(queryString) == false then
					local qss = _g.jk.lang.String:split(queryString, 38, 0)
					if qss ~= nil then
						local n = 0
						local m = _g.jk.lang.Vector:getSize(qss)
						do
							n = 0
							while n < m do
								local qs = qss[n + 1]
								if qs ~= nil then
									if not (self.rawQueryParameters ~= nil) then
										self.rawQueryParameters = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
									end
									if not (self.queryParameters ~= nil) then
										self.queryParameters = {}
									end
									if _g.jk.lang.String:getIndexOfCharacter(qs, 61, 0) < 0 then
										do _g.jk.lang.Map:set(self.queryParameters, qs, nil) end
										do self.rawQueryParameters:add(qs, nil) end
										goto _continue3
									end
									do
										local qsps = _g.jk.lang.String:split(qs, 61, 2)
										local key = _g.jk.lang.Vector:get(qsps, 0)
										local val = _g.jk.lang.Vector:get(qsps, 1)
										if _g.jk.lang.String:isEmpty(key) == false then
											if not (val ~= nil) then
												val = ""
											end
											do
												local udv = _g.jk.url.URLDecoder:decode(val)
												do _g.jk.lang.Map:set(self.queryParameters, key, udv) end
												do self.rawQueryParameters:add(key, udv) end
											end
										end
									end
								end
								::_continue3::
								do n = n + 1 end
							end
						end
					end
				end
				do
					local css = _g.jk.lang.String:getIndexOfString(str, "://", 0)
					if css >= 0 then
						self.scheme = _g.jk.lang.String:getSubString(str, 0, css)
						if _g.jk.lang.String:getIndexOfCharacter(self.scheme, 58, 0) >= 0 or _g.jk.lang.String:getIndexOfCharacter(self.scheme, 47, 0) >= 0 then
							self.scheme = nil
						else
							str = _g.jk.lang.String:getEndOfString(str, css + 3)
						end
					end
					do
						local pp = nil
						if _g.jk.lang.String:getChar(str, 0) == 47 then
							pp = str
						else
							if _g.jk.lang.String:getIndexOfCharacter(str, 47, 0) >= 0 then
								local sssplit = _g.jk.lang.String:split(str, 47, 2)
								str = _g.jk.lang.Vector:get(sssplit, 0)
								pp = _g.jk.lang.Vector:get(sssplit, 1)
								if not (pp ~= nil) then
									pp = ""
								end
								if _g.jk.lang.String:getChar(pp, 0) ~= 47 then
									pp = _g.jk.lang.String:appendString("/", pp)
								end
							end
							if _g.jk.lang.String:getIndexOfCharacter(str, 64, 0) >= 0 then
								local asplit = _g.jk.lang.String:split(str, 64, 2)
								local auth = _g.jk.lang.Vector:get(asplit, 0)
								str = _g.jk.lang.Vector:get(asplit, 1)
								if _g.jk.lang.String:getIndexOfCharacter(auth, 58, 0) >= 0 then
									local acsplit = _g.jk.lang.String:split(auth, 58, 2)
									self.username = _g.jk.url.URLDecoder:decode(_g.jk.lang.Vector:get(acsplit, 0))
									self.password = _g.jk.url.URLDecoder:decode(_g.jk.lang.Vector:get(acsplit, 1))
								else
									self.username = auth
								end
							end
							if _g.jk.lang.String:getIndexOfCharacter(str, 58, 0) >= 0 then
								local hcsplit = _g.jk.lang.String:split(str, 58, 2)
								str = _g.jk.lang.Vector:get(hcsplit, 0)
								self.port = _g.jk.lang.Vector:get(hcsplit, 1)
							end
							self.host = str
						end
						if doNormalizePath then
							self.path = self:normalizePath(pp)
						else
							self.path = pp
						end
						if not (self.port ~= nil) and _g.jk.lang.String:equals("https", self.scheme) or _g.jk.lang.String:equals("wss", self.scheme) then
							self.port = "443"
						end
					end
				end
			end
		end
	end
end

function jk.url.URL:getPortInt()
	if not (self.port ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.String:toInteger(self.port) end
end

function jk.url.URL:getQueryParameter(key)
	if not (self.queryParameters ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Map:get(self.queryParameters, key) end
end

function jk.url.URL:addQueryParameter(key, value)
	if not (self.rawQueryParameters ~= nil) then
		self.rawQueryParameters = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
	end
	if not (self.queryParameters ~= nil) then
		self.queryParameters = {}
	end
	do _g.jk.lang.Map:set(self.queryParameters, key, value) end
	do self.rawQueryParameters:add(key, value) end
end

function jk.url.URL:getScheme()
	do return self.scheme end
end

function jk.url.URL:setScheme(v)
	self.scheme = v
	do return self end
end

function jk.url.URL:getUsername()
	do return self.username end
end

function jk.url.URL:setUsername(v)
	self.username = v
	do return self end
end

function jk.url.URL:getPassword()
	do return self.password end
end

function jk.url.URL:setPassword(v)
	self.password = v
	do return self end
end

function jk.url.URL:getHost()
	do return self.host end
end

function jk.url.URL:setHost(v)
	self.host = v
	do return self end
end

function jk.url.URL:getPort()
	do return self.port end
end

function jk.url.URL:setPort(v)
	self.port = v
	do return self end
end

function jk.url.URL:getPath()
	do return self.path end
end

function jk.url.URL:setPath(v)
	self.path = v
	do return self end
end

function jk.url.URL:getFragment()
	do return self.fragment end
end

function jk.url.URL:setFragment(v)
	self.fragment = v
	do return self end
end

function jk.url.URL:getRawQueryParameters()
	do return self.rawQueryParameters end
end

function jk.url.URL:setRawQueryParameters(v)
	self.rawQueryParameters = v
	do return self end
end

function jk.url.URL:getQueryParameters()
	do return self.queryParameters end
end

function jk.url.URL:setQueryParameters(v)
	self.queryParameters = v
	do return self end
end

function jk.url.URL:getOriginal()
	do return self.original end
end

function jk.url.URL:setOriginal(v)
	self.original = v
	do return self end
end

function jk.url.URL:getPercentOnly()
	do return self.percentOnly end
end

function jk.url.URL:setPercentOnly(v)
	self.percentOnly = v
	do return self end
end

function jk.url.URL:getEncodeUnreservedChars()
	do return self.encodeUnreservedChars end
end

function jk.url.URL:setEncodeUnreservedChars(v)
	self.encodeUnreservedChars = v
	do return self end
end

jk.url.URLDecoder = {}
jk.url.URLDecoder.__index = jk.url.URLDecoder
_vm:set_metatable(jk.url.URLDecoder, {})

function jk.url.URLDecoder._create()
	local v = _vm:set_metatable({}, jk.url.URLDecoder)
	return v
end

function jk.url.URLDecoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.url.URLDecoder'
	self['_isType.jk.url.URLDecoder'] = true
end

function jk.url.URLDecoder:_construct0()
	jk.url.URLDecoder._init(self)
	return self
end

function jk.url.URLDecoder:xcharToInteger(c)
	if c >= 48 and c <= 57 then
		local ci = _util:convert_to_integer(c)
		do return ci - 48 end
	elseif c >= 97 and c <= 102 then
		do return 10 + c - 97 end
	elseif c >= 65 and c <= 70 then
		do return 10 + c - 65 end
	end
	do return 0 end
end

function jk.url.URLDecoder:decode(astr)
	if not (astr ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local str = _g.jk.lang.String:strip(astr)
		local it = _g.jk.lang.String:iterate(str)
		while it ~= nil do
			local x = it:getNextChar()
			if x < 1 then
				do break end
			end
			if x == 37 then
				local x1 = it:getNextChar()
				local x2 = it:getNextChar()
				if x1 > 0 and x2 > 0 then
					do sb:appendCharacter(_g.jk.url.URLDecoder:xcharToInteger(x1) * 16 + _g.jk.url.URLDecoder:xcharToInteger(x2)) end
				else
					do break end
				end
			elseif x == 43 then
				do sb:appendCharacter(32) end
			else
				do sb:appendCharacter(x) end
			end
		end
		do return sb:toString() end
	end
end

jk.url.URLEncoder = {}
jk.url.URLEncoder.__index = jk.url.URLEncoder
_vm:set_metatable(jk.url.URLEncoder, {})

function jk.url.URLEncoder._create()
	local v = _vm:set_metatable({}, jk.url.URLEncoder)
	return v
end

function jk.url.URLEncoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.url.URLEncoder'
	self['_isType.jk.url.URLEncoder'] = true
end

function jk.url.URLEncoder:_construct0()
	jk.url.URLEncoder._init(self)
	return self
end

function jk.url.URLEncoder:encode(str, percentOnly, encodeUnreservedChars)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local buffer = _g.jk.lang.String:toUTF8Buffer(str)
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do
			local i = 0
			while i < #buffer do
				local c = _g.jk.lang.Buffer:getByte(buffer, i)
				if c < 1 then
					do break end
				end
				if c >= 97 and c <= 122 or (c >= 65 and c <= 90) or (c >= 48 and c <= 57) then
					do sb:appendCharacter(c) end
				elseif c == 45 or c == 46 or c == 95 or c == 126 and encodeUnreservedChars == false then
					do sb:appendCharacter(c) end
				elseif c == 32 and percentOnly == false then
					do sb:appendCharacter(43) end
				else
					do sb:appendCharacter(37) end
					do sb:appendString(_g.jk.lang.String:forIntegerHex(_vm:bitwise_and(_util:convert_to_integer(c), 255), 0)) end
				end
				do i = i + 1 end
			end
		end
		do return sb:toString() end
	end
end
