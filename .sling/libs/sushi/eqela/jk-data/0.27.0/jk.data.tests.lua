jk = jk or {}

jk.data = jk.data or {}

jk.data.tests = jk.data.tests or {}

jk.data.tests.TestMain = {}
jk.data.tests.TestMain.__index = jk.data.tests.TestMain
_vm:set_metatable(jk.data.tests.TestMain, {})

function jk.data.tests.TestMain._create()
	local v = _vm:set_metatable({}, jk.data.tests.TestMain)
	return v
end

function jk.data.tests.TestMain:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.data.tests.TestMain'
	self['_isType.jk.data.tests.TestMain'] = true
end

function jk.data.tests.TestMain:_construct0()
	jk.data.tests.TestMain._init(self)
	return self
end

function jk.data.tests.TestMain:_main(args)
	do _g.jk.data.tests.SHAEncoderTests._construct0(_g.jk.data.tests.SHAEncoderTests._create()):execute() end
	do _g.jk.data.tests.MD5EncoderTests._construct0(_g.jk.data.tests.MD5EncoderTests._create()):execute() end
	do _g.jk.data.tests.Base64Tests._construct0(_g.jk.data.tests.Base64Tests._create()):execute() end
	do _g.jk.data.tests.CharacterDecoderTests._construct0(_g.jk.data.tests.CharacterDecoderTests._create()):execute() end
	do return 0 end
end

jk.data.tests.MD5EncoderTests = _g.jk.test.UnitTest._create()
jk.data.tests.MD5EncoderTests.__index = jk.data.tests.MD5EncoderTests
_vm:set_metatable(jk.data.tests.MD5EncoderTests, {
	__index = _g.jk.test.UnitTest
})

function jk.data.tests.MD5EncoderTests._create()
	local v = _vm:set_metatable({}, jk.data.tests.MD5EncoderTests)
	return v
end

function jk.data.tests.MD5EncoderTests:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.data.tests.MD5EncoderTests'
	self['_isType.jk.data.tests.MD5EncoderTests'] = true
end

function jk.data.tests.MD5EncoderTests:_construct0()
	jk.data.tests.MD5EncoderTests._init(self)
	do _g.jk.test.UnitTest._construct0(self) end
	return self
end

function jk.data.tests.MD5EncoderTests:testMD5Encoder()
	if not (_g.jk.md5.MD5Encoder:encodeBuffer(_g.jk.lang.String:toUTF8Buffer("helloWorld")) == "1a833da63a6b7e20098dae06d06602e1") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.data.tests.MD5EncoderTests:execute()
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "MD5Encoder Method") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testMD5Encoder() end
		end)
		if _err then
			if (_vm:to_table_with_key(_err, '_isType.jk.test.FailedAssertionException') ~= nil) then
				local e = _err
				do _g.jk.log.Log:error(self.ctx, e:toString()) end
			else
				_vm:throw_error(_err)
			end
		end
	end
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "MD5Encoder Method") end
end

jk.data.tests.Base64Tests = _g.jk.test.UnitTest._create()
jk.data.tests.Base64Tests.__index = jk.data.tests.Base64Tests
_vm:set_metatable(jk.data.tests.Base64Tests, {
	__index = _g.jk.test.UnitTest
})

function jk.data.tests.Base64Tests._create()
	local v = _vm:set_metatable({}, jk.data.tests.Base64Tests)
	return v
end

function jk.data.tests.Base64Tests:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.data.tests.Base64Tests'
	self['_isType.jk.data.tests.Base64Tests'] = true
end

function jk.data.tests.Base64Tests:_construct0()
	jk.data.tests.Base64Tests._init(self)
	do _g.jk.test.UnitTest._construct0(self) end
	return self
end

function jk.data.tests.Base64Tests:testBase64Encoding()
	local str = "Hello World"
	if not (_g.jk.base64.Base64Encoder:encodeString(str) == "SGVsbG8gV29ybGQ=") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.data.tests.Base64Tests:testBase64Decoding()
	local str = "Hello World"
	local encodedStr = _g.jk.base64.Base64Encoder:encodeString(str)
	local decodedStr = _g.jk.base64.Base64Decoder:decode(encodedStr)
	if not (_g.jk.lang.String:forUTF8Buffer(decodedStr) == "Hello World") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.data.tests.Base64Tests:execute()
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "encode string") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testBase64Encoding() end
		end)
		if _err then
			if (_vm:to_table_with_key(_err, '_isType.jk.test.FailedAssertionException') ~= nil) then
				local e = _err
				do _g.jk.log.Log:error(self.ctx, e:toString()) end
			else
				_vm:throw_error(_err)
			end
		end
	end
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "encode string") end
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "decode string") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testBase64Encoding() end
		end)
		if _err then
			if (_vm:to_table_with_key(_err, '_isType.jk.test.FailedAssertionException') ~= nil) then
				local e = _err
				do _g.jk.log.Log:error(self.ctx, e:toString()) end
			else
				_vm:throw_error(_err)
			end
		end
	end
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "decode string") end
end

jk.data.tests.CharacterDecoderTests = _g.jk.test.UnitTest._create()
jk.data.tests.CharacterDecoderTests.__index = jk.data.tests.CharacterDecoderTests
_vm:set_metatable(jk.data.tests.CharacterDecoderTests, {
	__index = _g.jk.test.UnitTest
})

function jk.data.tests.CharacterDecoderTests._create()
	local v = _vm:set_metatable({}, jk.data.tests.CharacterDecoderTests)
	return v
end

function jk.data.tests.CharacterDecoderTests:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.data.tests.CharacterDecoderTests'
	self['_isType.jk.data.tests.CharacterDecoderTests'] = true
end

function jk.data.tests.CharacterDecoderTests:_construct0()
	jk.data.tests.CharacterDecoderTests._init(self)
	do _g.jk.test.UnitTest._construct0(self) end
	return self
end

function jk.data.tests.CharacterDecoderTests:testCharacterDecoderMethods()
	local dmap = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do dmap:setString("data", "😀 Smile") end
	do
		local str = _g.jk.json.JSONEncoder:encode(dmap, true, false)
		local parse = _vm:to_table_with_key(_g.jk.json.JSONParser:parseBuffer(_g.jk.lang.String:toUTF8Buffer(str)), '_isType.jk.lang.DynamicMap')
		if not (dmap:getString("data", nil) == parse:getString("data", nil)) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
	end
end

function jk.data.tests.CharacterDecoderTests:execute()
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "CharacterDecoder Methods") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testCharacterDecoderMethods() end
		end)
		if _err then
			if (_vm:to_table_with_key(_err, '_isType.jk.test.FailedAssertionException') ~= nil) then
				local e = _err
				do _g.jk.log.Log:error(self.ctx, e:toString()) end
			else
				_vm:throw_error(_err)
			end
		end
	end
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "CharacterDecoder Methods") end
end

jk.data.tests.SHAEncoderTests = _g.jk.test.UnitTest._create()
jk.data.tests.SHAEncoderTests.__index = jk.data.tests.SHAEncoderTests
_vm:set_metatable(jk.data.tests.SHAEncoderTests, {
	__index = _g.jk.test.UnitTest
})

function jk.data.tests.SHAEncoderTests._create()
	local v = _vm:set_metatable({}, jk.data.tests.SHAEncoderTests)
	return v
end

function jk.data.tests.SHAEncoderTests:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.data.tests.SHAEncoderTests'
	self['_isType.jk.data.tests.SHAEncoderTests'] = true
end

function jk.data.tests.SHAEncoderTests:_construct0()
	jk.data.tests.SHAEncoderTests._init(self)
	do _g.jk.test.UnitTest._construct0(self) end
	return self
end

function jk.data.tests.SHAEncoderTests:testSHAEncoder()
	local shaEncoder = _g.jk.sha.SHAEncoder:create()
	if not (shaEncoder ~= nil) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Buffer:getSize(shaEncoder:encodeAsBuffer(_g.jk.lang.String:toUTF8Buffer("Hello World"), _g.jk.sha.SHAEncoder.SHA1)) == 20) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Buffer:getSize(shaEncoder:encodeAsBuffer(_g.jk.lang.String:toUTF8Buffer("Hello World"), _g.jk.sha.SHAEncoder.SHA256)) == 32) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Buffer:getSize(shaEncoder:encodeAsBuffer(_g.jk.lang.String:toUTF8Buffer("Hello World"), _g.jk.sha.SHAEncoder.SHA384)) == 48) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Buffer:getSize(shaEncoder:encodeAsBuffer(_g.jk.lang.String:toUTF8Buffer("Hello World"), _g.jk.sha.SHAEncoder.SHA512)) == 64) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (shaEncoder:encodeAsString(_g.jk.lang.String:toUTF8Buffer("Hello World"), _g.jk.sha.SHAEncoder.SHA1) == "0a4d55a8d778e5022fab701977c5d840bbc486d0") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (shaEncoder:encodeAsString(_g.jk.lang.String:toUTF8Buffer("Hello World"), _g.jk.sha.SHAEncoder.SHA256) == "a591a6d40bf420404a011733cfb7b190d62c65bf0bcda32b57b277d9ad9f146e") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (shaEncoder:encodeAsString(_g.jk.lang.String:toUTF8Buffer("Hello World"), _g.jk.sha.SHAEncoder.SHA384) == "99514329186b2f6ae4a1329e7ee6c610a729636335174ac6b740f9028396fcc803d0e93863a7c3d90f86beee782f4f3f") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (shaEncoder:encodeAsString(_g.jk.lang.String:toUTF8Buffer("Hello World"), _g.jk.sha.SHAEncoder.SHA512) == "2c74fd17edafd80e8447b0d46741ee243b7eb74dd2149a0ab1b9246fb30382f27e853d8585719e0e67cbda0daa8f51671064615d645ae27acb15bfb1447f459b") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.data.tests.SHAEncoderTests:execute()
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "SHAEncoder functions") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testSHAEncoder() end
		end)
		if _err then
			if (_vm:to_table_with_key(_err, '_isType.jk.test.FailedAssertionException') ~= nil) then
				local e = _err
				do _g.jk.log.Log:error(self.ctx, e:toString()) end
			else
				_vm:throw_error(_err)
			end
		end
	end
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "SHAEncoder functions") end
end

function _main(args)
	do return jk.data.tests.TestMain:_main(args) end
end
