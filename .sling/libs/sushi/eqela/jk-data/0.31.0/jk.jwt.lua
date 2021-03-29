jk = jk or {}

jk.jwt = jk.jwt or {}

jk.jwt.RS256 = {}
jk.jwt.RS256.__index = jk.jwt.RS256
_vm:set_metatable(jk.jwt.RS256, {})

function jk.jwt.RS256._create()
	local v = _vm:set_metatable({}, jk.jwt.RS256)
	return v
end

function jk.jwt.RS256:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.jwt.RS256'
	self['_isType.jk.jwt.RS256'] = true
	self.lastErrorDescription = nil
end

function jk.jwt.RS256:_construct0()
	jk.jwt.RS256._init(self)
	return self
end

function jk.jwt.RS256:instance()
	do return _g.jk.jwt.RS256ForSushi._construct0(_g.jk.jwt.RS256ForSushi._create()) end
end

function jk.jwt.RS256:generate(data, privateKey)
end

function jk.jwt.RS256:validate(data, signature, publicKey)
end

function jk.jwt.RS256:getLastErrorDescription()
	do return self.lastErrorDescription end
end

function jk.jwt.RS256:setLastErrorDescription(v)
	self.lastErrorDescription = v
	do return self end
end

jk.jwt.JWKToPEMConverter = {}
jk.jwt.JWKToPEMConverter.__index = jk.jwt.JWKToPEMConverter
_vm:set_metatable(jk.jwt.JWKToPEMConverter, {})

function jk.jwt.JWKToPEMConverter._create()
	local v = _vm:set_metatable({}, jk.jwt.JWKToPEMConverter)
	return v
end

function jk.jwt.JWKToPEMConverter:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.jwt.JWKToPEMConverter'
	self['_isType.jk.jwt.JWKToPEMConverter'] = true
end

function jk.jwt.JWKToPEMConverter:_construct0()
	jk.jwt.JWKToPEMConverter._init(self)
	return self
end

function jk.jwt.JWKToPEMConverter:convertString(data)
	if not (data ~= nil) then
		do return nil end
	end
	do return _g.jk.jwt.JWKToPEMConverter:convertMap(_vm:to_table_with_key(_g.jk.json.JSONParser:parseString(data), '_isType.jk.lang.DynamicMap')) end
end

function jk.jwt.JWKToPEMConverter:convertMap(dm)
	if not (dm ~= nil) then
		do return nil end
	end
	do
		local str = nil
		local n = _g.jk.base64.Base64Decoder:fromUrlSafeFormat(dm:getString("n", nil))
		local e = _g.jk.base64.Base64Decoder:fromUrlSafeFormat(dm:getString("e", nil))
		do return str end
	end
end

jk.jwt.JWT = {}
jk.jwt.JWT.__index = jk.jwt.JWT
_vm:set_metatable(jk.jwt.JWT, {})

function jk.jwt.JWT._create()
	local v = _vm:set_metatable({}, jk.jwt.JWT)
	return v
end

function jk.jwt.JWT:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.jwt.JWT'
	self['_isType.jk.jwt.JWT'] = true
	self.claims = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
end

function jk.jwt.JWT:_construct0()
	jk.jwt.JWT._init(self)
	return self
end

function jk.jwt.JWT:decode(token, keys)
	if not (token ~= nil) then
		do return nil end
	end
	do
		local comps = _g.jk.lang.String:split(token, 46, 3)
		if not (_g.jk.lang.Vector:getSize(comps) == 3) then
			do return nil end
		end
		do
			local headerBuffer = _g.jk.base64.Base64Decoder:decode(_g.jk.base64.Base64Decoder:fromUrlSafeFormat(_g.jk.lang.Vector:get(comps, 0)))
			if not (headerBuffer ~= nil) then
				do return nil end
			end
			do
				local headerJson = _g.jk.lang.String:forUTF8Buffer(headerBuffer)
				if not (headerJson ~= nil) then
					do return nil end
				end
				do
					local header = _vm:to_table_with_key(_g.jk.json.JSONParser:parseString(headerJson), '_isType.jk.lang.DynamicMap')
					if not (header ~= nil) then
						do return nil end
					end
					do
						local claimsBuffer = _g.jk.base64.Base64Decoder:decode(_g.jk.base64.Base64Decoder:fromUrlSafeFormat(_g.jk.lang.Vector:get(comps, 1)))
						if not (claimsBuffer ~= nil) then
							do return nil end
						end
						do
							local claimsJson = _g.jk.lang.String:forUTF8Buffer(claimsBuffer)
							if not (claimsJson ~= nil) then
								do return nil end
							end
							do
								local claims = _vm:to_table_with_key(_g.jk.json.JSONParser:parseString(claimsJson), '_isType.jk.lang.DynamicMap')
								if not (claims ~= nil) then
									do return nil end
								end
								do
									local signature = _g.jk.base64.Base64Decoder:decode(_g.jk.base64.Base64Decoder:fromUrlSafeFormat(_g.jk.lang.Vector:get(comps, 2)))
									local alg = header:getString("alg", nil)
									if _g.jk.lang.String:isEmpty(alg) or _g.jk.lang.String:equalsIgnoreCase(alg, "none") then
									elseif keys ~= nil then
										if _g.jk.lang.String:equalsIgnoreCase(alg, "HS256") then
											local key = _g.jk.lang.String:asString(_g.jk.lang.Map:get(keys, "hs256"))
											if not (key ~= nil) then
												do return nil end
											end
											do return nil end
										elseif _g.jk.lang.String:equalsIgnoreCase(alg, "RS256") then
											local rsa = _g.jk.jwt.RS256:instance()
											if not (rsa ~= nil) then
												do return nil end
											end
											do
												local key = _g.jk.lang.String:asString(_g.jk.lang.Map:get(keys, "rs256"))
												if not (key ~= nil) then
													do return nil end
												end
												do
													local data = _g.jk.lang.String:safeString(_g.jk.lang.Vector:get(comps, 0)) .. "." .. _g.jk.lang.String:safeString(_g.jk.lang.Vector:get(comps, 1))
													if not rsa:validate(_g.jk.lang.String:toUTF8Buffer(data), signature, key) then
														do return nil end
													end
												end
											end
										else
											do return nil end
										end
									else
									end
									do
										local v = _g.jk.jwt.JWT._construct0(_g.jk.jwt.JWT._create())
										do v:setClaims(claims) end
										do return v end
									end
								end
							end
						end
					end
				end
			end
		end
	end
end

function jk.jwt.JWT:setClaims(v)
	if not (v ~= nil) then
		self.claims = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	else
		self.claims = v
	end
end

function jk.jwt.JWT:getClaims()
	do return self.claims end
end

function jk.jwt.JWT:setIssuer(v)
	do self.claims:setString("iss", v) end
end

function jk.jwt.JWT:getIssuer()
	do return self.claims:getString("iss", nil) end
end

function jk.jwt.JWT:setSubject(v)
	do self.claims:setString("sub", v) end
end

function jk.jwt.JWT:getSubject()
	do return self.claims:getString("sub", nil) end
end

function jk.jwt.JWT:setAudience(v)
	do self.claims:setString("aud", v) end
end

function jk.jwt.JWT:getAudience()
	do return self.claims:getString("aud", nil) end
end

function jk.jwt.JWT:setExpirationTime(v)
	do self.claims:setString("exp", _g.jk.lang.String:forLongInteger(v)) end
end

function jk.jwt.JWT:getExpirationTime()
	do return self.claims:getLongInteger("exp", 0) end
end

function jk.jwt.JWT:setNotBefore(v)
	do self.claims:setString("nbf", _g.jk.lang.String:forLongInteger(v)) end
end

function jk.jwt.JWT:getNotBefore()
	do return self.claims:getLongInteger("nbf", 0) end
end

function jk.jwt.JWT:setIssuedAt(v)
	do self.claims:setString("iat", _g.jk.lang.String:forLongInteger(v)) end
end

function jk.jwt.JWT:getIssuedAt()
	do return self.claims:getLongInteger("iat", 0) end
end

function jk.jwt.JWT:setJwtId(v)
	do self.claims:setString("jti", v) end
end

function jk.jwt.JWT:getJwtId()
	do return self.claims:getString("jti", nil) end
end

function jk.jwt.JWT:setClaim(key, value)
	do self.claims:setString(key, value) end
end

function jk.jwt.JWT:getClaim(key)
	do return self.claims:getString(key, nil) end
end

function jk.jwt.JWT:validate(issuer, audience)
	if not self:isActive() then
		do return false end
	end
	if issuer ~= nil then
		if not self:isIssuer(issuer) then
			do return false end
		end
	end
	if audience ~= nil then
		if not self:isAudience(audience) then
			do return false end
		end
	end
	do return true end
end

function jk.jwt.JWT:isIssuer(value)
	do return _g.jk.lang.String:equals(self.claims:getString("iss", nil), value) end
end

function jk.jwt.JWT:isAudience(value)
	do return _g.jk.lang.String:equals(self.claims:getString("aud", nil), value) end
end

function jk.jwt.JWT:isActive()
	if not (self:isExpired() == false) then
		do return false end
	end
	do
		local nbf = self.claims:getLongInteger("nbf", 0)
		if nbf < 1 then
			do return true end
		end
		if _g.jk.time.SystemClock:asUTCSeconds() < nbf then
			do return false end
		end
		do return true end
	end
end

function jk.jwt.JWT:isExpired()
	local exp = self.claims:getLongInteger("exp", 0)
	if exp < 1 then
		do return false end
	end
	if _g.jk.time.SystemClock:asUTCSeconds() < exp then
		do return false end
	end
	do return true end
end

function jk.jwt.JWT:encodeUrlSafe(buff)
	if not (buff ~= nil) then
		do return nil end
	end
	do return _g.jk.base64.Base64Encoder:toUrlSafeFormat(_g.jk.base64.Base64Encoder:encode(buff)) end
end

function jk.jwt.JWT:generateHeaderContent(alg)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:setString("alg", alg) end
	do v:setString("typ", "JWT") end
	do return _g.jk.json.JSONEncoder:encode(v, false, false) end
end

function jk.jwt.JWT:generateClaimsContent()
	do return _g.jk.json.JSONEncoder:encode(self.claims, false, false) end
end

function jk.jwt.JWT:generateTokenWithRS256(privateKey)
	local rsa = _g.jk.jwt.RS256:instance()
	if not (rsa ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString(self:encodeUrlSafe(_g.jk.lang.String:toUTF8Buffer(self:generateHeaderContent("RS256")))) end
		do sb:appendCharacter(46) end
		do sb:appendString(self:encodeUrlSafe(_g.jk.lang.String:toUTF8Buffer(self:generateClaimsContent()))) end
		do
			local data = sb:toString()
			local sigdata = rsa:generate(_g.jk.lang.String:toUTF8Buffer(data), privateKey)
			local sb2 = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			do sb2:appendString(data) end
			do sb2:appendCharacter(46) end
			do sb2:appendString(self:encodeUrlSafe(sigdata)) end
			do return sb2:toString() end
		end
	end
end

jk.jwt.RS256ForSushi = _g.jk.jwt.RS256._create()
jk.jwt.RS256ForSushi.__index = jk.jwt.RS256ForSushi
_vm:set_metatable(jk.jwt.RS256ForSushi, {
	__index = _g.jk.jwt.RS256
})

function jk.jwt.RS256ForSushi._create()
	local v = _vm:set_metatable({}, jk.jwt.RS256ForSushi)
	return v
end

function jk.jwt.RS256ForSushi:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.jwt.RS256ForSushi'
	self['_isType.jk.jwt.RS256ForSushi'] = true
end

function jk.jwt.RS256ForSushi:_construct0()
	jk.jwt.RS256ForSushi._init(self)
	do _g.jk.jwt.RS256._construct0(self) end
	return self
end

function jk.jwt.RS256ForSushi:generate(data, key)
	if not (data ~= nil) then
		do return nil end
	end
	if not _g.jk.lang.String:isNotEmpty(key) then
		do return nil end
	end
	do
		local v = nil
		local error = nil
		do v, error = _crypto:rs256_sign(data, key) end
		if _g.jk.lang.String:isNotEmpty(error) then
			do self:setLastErrorDescription(error) end
		end
		do return v end
	end
end

function jk.jwt.RS256ForSushi:validate(data, signature, key)
	if not (data ~= nil) then
		do return false end
	end
	if not _g.jk.lang.String:isNotEmpty(key) then
		do return false end
	end
	do
		local result = 0
		local error = nil
		do result, error = _crypto:rs256_verify(data, signature, key) end
		if result == 1 then
			do return true end
		end
		if _g.jk.lang.String:isNotEmpty(error) then
			do self:setLastErrorDescription(error) end
		end
		do return false end
	end
end
