jk = jk or {}

jk.core = jk.core or {}

jk.core.tests = jk.core.tests or {}

jk.core.tests.TestMain = {}
jk.core.tests.TestMain.__index = jk.core.tests.TestMain
_vm:set_metatable(jk.core.tests.TestMain, {})

function jk.core.tests.TestMain._create()
	local v = _vm:set_metatable({}, jk.core.tests.TestMain)
	return v
end

function jk.core.tests.TestMain:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.core.tests.TestMain'
	self['_isType.jk.core.tests.TestMain'] = true
end

function jk.core.tests.TestMain:_construct0()
	jk.core.tests.TestMain._init(self)
	return self
end

function jk.core.tests.TestMain:_main(args)
	do _g.jk.core.tests.StringTests._construct0(_g.jk.core.tests.StringTests._create()):execute() end
	do _g.jk.core.tests.VectorTests._construct0(_g.jk.core.tests.VectorTests._create()):execute() end
	do _g.jk.core.tests.MapTests._construct0(_g.jk.core.tests.MapTests._create()):execute() end
	do _g.jk.core.tests.StringBuilderTests._construct0(_g.jk.core.tests.StringBuilderTests._create()):execute() end
	do _g.jk.core.tests.BufferTests._construct0(_g.jk.core.tests.BufferTests._create()):execute() end
	do _g.jk.core.tests.StackTraceTests._construct0(_g.jk.core.tests.StackTraceTests._create()):execute() end
	do _g.jk.core.tests.SystemClockTests._construct0(_g.jk.core.tests.SystemClockTests._create()):execute() end
	do _g.jk.core.tests.VariableReferenceTests._construct0(_g.jk.core.tests.VariableReferenceTests._create()):execute() end
	do _g.jk.core.tests.FileSystemTests._construct0(_g.jk.core.tests.FileSystemTests._create()):execute() end
	do return 0 end
end

jk.core.tests.MapTests = _g.jk.test.UnitTest._create()
jk.core.tests.MapTests.__index = jk.core.tests.MapTests
_vm:set_metatable(jk.core.tests.MapTests, {
	__index = _g.jk.test.UnitTest
})

function jk.core.tests.MapTests._create()
	local v = _vm:set_metatable({}, jk.core.tests.MapTests)
	return v
end

function jk.core.tests.MapTests:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.core.tests.MapTests'
	self['_isType.jk.core.tests.MapTests'] = true
end

function jk.core.tests.MapTests:_construct0()
	jk.core.tests.MapTests._init(self)
	do _g.jk.test.UnitTest._construct0(self) end
	return self
end

function jk.core.tests.MapTests:testMapMethods()
	local map = {}
	do _g.jk.lang.Map:set(map, "key", "value") end
	if not (_g.jk.lang.Map:count(map) == 1) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do _g.jk.lang.Map:set(map, "secondKey", "secondValue") end
	if not (_g.jk.lang.Map:count(map) == 2) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not _g.jk.lang.Map:containsKey(map, "key") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not _g.jk.lang.Map:containsKey(map, "secondKey") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Map:containsKey(map, "thirdKey") == false) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not _g.jk.lang.Map:containsValue(map, "value") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not _g.jk.lang.Map:containsValue(map, "secondValue") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Map:containsValue(map, "thirdValue") == false) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Map:getValue(map, "key") == "value") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Map:getValue(map, "secondKey") == "secondValue") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do _g.jk.lang.Map:remove(map, "key") end
	if not (_g.jk.lang.Map:count(map) == 1) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Map:containsKey(map, "key") == false) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Map:containsValue(map, "value") == false) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Map:getValue(map, "key") == nil) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do _g.jk.lang.Map:clear(map) end
	if not (_g.jk.lang.Map:count(map) == 0) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.MapTests:execute()
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "Map Methods") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testMapMethods() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "Map Methods") end
end

jk.core.tests.VectorTests = _g.jk.test.UnitTest._create()
jk.core.tests.VectorTests.__index = jk.core.tests.VectorTests
_vm:set_metatable(jk.core.tests.VectorTests, {
	__index = _g.jk.test.UnitTest
})

function jk.core.tests.VectorTests._create()
	local v = _vm:set_metatable({}, jk.core.tests.VectorTests)
	return v
end

function jk.core.tests.VectorTests:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.core.tests.VectorTests'
	self['_isType.jk.core.tests.VectorTests'] = true
end

function jk.core.tests.VectorTests:_construct0()
	jk.core.tests.VectorTests._init(self)
	do _g.jk.test.UnitTest._construct0(self) end
	return self
end

function jk.core.tests.VectorTests:testVectorMethods()
	local vc = {}
	local astr = "a"
	do _g.jk.lang.Vector:append(vc, astr) end
	if not (_g.jk.lang.Vector:getSize(vc) == 1) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not _g.jk.lang.Vector:contains(vc, astr) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Vector:get(vc, 0) == astr) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do _g.jk.lang.Vector:insert(vc, "b", 1) end
	if not (_g.jk.lang.Vector:getSize(vc) == 2) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Vector:get(vc, 1) == "b") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do _g.jk.lang.Vector:set(vc, 1, "c") end
	if not (_g.jk.lang.Vector:get(vc, 1) == "c") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do _g.jk.lang.Vector:remove(vc, 0) end
	if not (_g.jk.lang.Vector:getSize(vc) == 1) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Vector:get(vc, 0) == "c") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Vector:isEmpty(vc) == false) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do _g.jk.lang.Vector:clear(vc) end
	if not _g.jk.lang.Vector:isEmpty(vc) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do _g.jk.lang.Vector:append(vc, "a") end
	do _g.jk.lang.Vector:append(vc, "b") end
	do _g.jk.lang.Vector:append(vc, "c") end
	do _g.jk.lang.Vector:append(vc, "d") end
	do _g.jk.lang.Vector:removeRange(vc, 1, 2) end
	if not (_g.jk.lang.Vector:getSize(vc) == 2) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Vector:get(vc, 0) == "a") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Vector:get(vc, 1) == "d") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do _g.jk.lang.Vector:clear(vc) end
	do _g.jk.lang.Vector:append(vc, "d") end
	do _g.jk.lang.Vector:append(vc, "a") end
	do _g.jk.lang.Vector:append(vc, "c") end
	do _g.jk.lang.Vector:append(vc, "b") end
	do _g.jk.lang.Vector:sortAsStrings(vc) end
	if not (_g.jk.lang.Vector:get(vc, 0) == "a") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Vector:get(vc, 1) == "b") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Vector:get(vc, 2) == "c") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Vector:get(vc, 3) == "d") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.VectorTests:execute()
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "Vector Methods") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testVectorMethods() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "Vector Methods") end
end

jk.core.tests.StringTests = _g.jk.test.UnitTest._create()
jk.core.tests.StringTests.__index = jk.core.tests.StringTests
_vm:set_metatable(jk.core.tests.StringTests, {
	__index = _g.jk.test.UnitTest
})

function jk.core.tests.StringTests._create()
	local v = _vm:set_metatable({}, jk.core.tests.StringTests)
	return v
end

function jk.core.tests.StringTests:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.core.tests.StringTests'
	self['_isType.jk.core.tests.StringTests'] = true
end

function jk.core.tests.StringTests:_construct0()
	jk.core.tests.StringTests._init(self)
	do _g.jk.test.UnitTest._construct0(self) end
	return self
end

function jk.core.tests.StringTests:testStringOperations()
	local str = "My Test String"
	if not (_g.jk.lang.String:forInteger(12345) == "12345") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:forLongInteger(1550113105) == "1550113105") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:forIntegerHex(6869, 0) == "1ad5") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:forIntegerOctal(6869) == "15325") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:forCharacter(104) == "h") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:forFloat(3.01) == "3.01") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:forDouble(3.22) == "3.22") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:getLength(str) == 14) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:appendString(str, ": AA") == "My Test String: AA") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:toUpperCase(str) == "MY TEST STRING") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:toLowerCase(str) == "my test string") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:getChar(str, 1) == 121) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not _g.jk.lang.String:equals(str, "My Test String") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not _g.jk.lang.String:equalsIgnoreCase(str, "my test string") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:compare("aa", "bb") == -1) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:compare("aaa", "aa") == 1) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:compareToIgnoreCase("aa", "BB") == -1) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:getHashCode(str) ~= 0) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:getHashCode(str) == _g.jk.lang.String:getHashCode(str)) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:getHashCode("aaa") ~= _g.jk.lang.String:getHashCode("bbb")) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:getIndexOfCharacter(str, 77, 0) == 0) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:getIndexOfString(str, "M", 0) == 0) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:getLastIndexOfCharacter(str, 84, -1) == 3) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:getLastIndexOfString(str, "g", -1) == 13) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:getEndOfString(str, 3) == "Test String") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:getSubString(str, 3, 4) == "Test") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not _g.jk.lang.String:contains(str, "My") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:contains(str, "MyX") == false) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not _g.jk.lang.String:startsWith(str, "My", 0) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not _g.jk.lang.String:endsWith(str, "ing") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:strip(" A ") == "A") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:replaceCharacter(str, 77, 109) == "my Test String") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:replaceString(str, "My", "mY") == "mY Test String") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do
		local chars = _g.jk.lang.String:toCharArray(str)
		if not (#chars == 14) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:toDouble("4.001") == 4.001) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:forUTF8Buffer(_g.jk.lang.String:toUTF8Buffer(str)) == str) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:forCharArray(chars, 0, 14) == str) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:forCharArray(chars, 1, 12) == "y Test Strin") then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:getIndexOfString(nil, "Hello World", 0) == -1) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:getIndexOfString("", "Hello World", 0) == -1) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:getIndexOfString("Hello World", "Hello World", 0) == 0) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:getIndexOfString("xHello World", "Hello World", 0) == 1) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:getIndexOfString("Hello", "", 0) == 0) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:getIndexOfString("Hello", nil, 0) == -1) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:getIndexOfString("", "", 0) == 0) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:getIndexOfString(nil, "", 0) == -1) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:getIndexOfCharacter(nil, 99, 0) == -1) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:getIndexOfCharacter("", 99, 0) == -1) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:getIndexOfCharacter("Hello World", 72, 0) == 0) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:getIndexOfCharacter("xHello World", 72, 0) == 1) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:getIndexOfCharacter("Hello", 0, 0) == -1) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (_g.jk.lang.String:getIndexOfCharacter(nil, 0, 0) == -1) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
	end
end

function jk.core.tests.StringTests:testCodeString()
	local str = "\n/* xxx\n * testing\n */\n"
	local it = _g.jk.lang.String:iterate(str)
	local start = it:getCurrentPosition()
	if not (it:getCurrentChar() < 1) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getNextChar() == 10) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getCurrentChar() == 10) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do
		local pos = it:getCurrentPosition()
		if not (it:getNextChar() == 47) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (it:getNextChar() == 42) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		do it:setCurrentPosition(pos) end
		if not (it:getCurrentChar() == 10) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (it:getNextChar() == 47) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (it:getNextChar() == 42) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (it:getNextChar() == 32) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (it:getNextChar() == 120) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (it:getNextChar() == 120) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (it:getNextChar() == 120) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (it:getNextChar() == 10) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (it:getNextChar() == 32) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		do it:setCurrentPosition(start) end
		if not (it:getCurrentChar() < 1) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (it:getNextChar() == 10) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
	end
end

function jk.core.tests.StringTests:testSimpleString()
	local str = "Simple Test"
	local it = _g.jk.lang.String:iterate(str)
	if not (it:getNextChar() == 83) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getNextChar() == 105) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getNextChar() == 109) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getNextChar() == 112) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getCurrentChar() == 112) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do it:moveToPreviousChar() end
	if not (it:getCurrentChar() == 109) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do it:moveToPreviousChar() end
	if not (it:getCurrentChar() == 105) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getNextChar() == 109) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getNextChar() == 112) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getNextChar() == 108) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getNextChar() == 101) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getNextChar() == 32) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getNextChar() == 84) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getNextChar() == 101) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getNextChar() == 115) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getNextChar() == 116) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (it:getNextChar() < 1) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.StringTests:testMultibyteString()
	local str = "Häviääkö?"
	if not (_g.jk.lang.String:getLength(str) == 9) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:getChar(str, 0) == 72) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:getChar(str, 1) == 228) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.String:getChar(str, 2) == 118) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do
		local it = _g.jk.lang.String:iterate(str)
		if not (it:getNextChar() == 72) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (it:getNextChar() == 228) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (it:getNextChar() == 118) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (it:getNextChar() == 105) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		do
			local pos = it:getCurrentPosition()
			if not (it:getNextChar() == 228) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			if not (it:getNextChar() == 228) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			if not (it:getCurrentChar() == 228) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			do it:moveToPreviousChar() end
			if not (it:getCurrentChar() == 228) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			do it:moveToPreviousChar() end
			if not (it:getCurrentChar() == 105) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			do it:moveToPreviousChar() end
			if not (it:getNextChar() == 105) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			if not (it:getNextChar() == 228) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			if not (it:getNextChar() == 228) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			if not (it:getNextChar() == 107) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			if not (it:getNextChar() == 246) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			if not (it:getNextChar() == 63) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			if not (it:getNextChar() < 1) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			do it:setCurrentPosition(pos) end
			if not (it:getNextChar() == 228) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			if not (it:getNextChar() == 228) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			if not (it:getNextChar() == 107) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			if not (it:getNextChar() == 246) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			if not (it:getNextChar() == 63) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
			if not (it:getNextChar() < 1) then
				_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
			end
		end
	end
end

function jk.core.tests.StringTests:execute()
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "string operations") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testStringOperations() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "string operations") end
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "code string") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testCodeString() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "code string") end
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "simple string") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testSimpleString() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "simple string") end
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "multibyte string") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testMultibyteString() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "multibyte string") end
end

jk.core.tests.BufferTests = _g.jk.test.UnitTest._create()
jk.core.tests.BufferTests.__index = jk.core.tests.BufferTests
_vm:set_metatable(jk.core.tests.BufferTests, {
	__index = _g.jk.test.UnitTest
})

function jk.core.tests.BufferTests._create()
	local v = _vm:set_metatable({}, jk.core.tests.BufferTests)
	return v
end

function jk.core.tests.BufferTests:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.core.tests.BufferTests'
	self['_isType.jk.core.tests.BufferTests'] = true
end

function jk.core.tests.BufferTests:_construct0()
	jk.core.tests.BufferTests._init(self)
	do _g.jk.test.UnitTest._construct0(self) end
	return self
end

function jk.core.tests.BufferTests:testGettingOfBufferSize()
	local str = "Hello World"
	local buff = _g.jk.lang.String:toUTF8Buffer(str)
	if not (_g.jk.lang.Buffer:getSize(buff) == 11) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.BufferTests:testGettingOfInt8OnBuffer()
	local str = "Hello World"
	local buff = _g.jk.lang.String:toUTF8Buffer(str)
	if not (_g.jk.lang.Buffer:getInt8(buff, 2) == 108) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.BufferTests:testSettingOfByteOnBuffer()
	local str = "Hello World"
	local buff = _g.jk.lang.String:toUTF8Buffer(str)
	local byteOn4thIndexBefore = _g.jk.lang.Buffer:getInt8(buff, 4)
	do _g.jk.lang.Buffer:setByte(buff, 4, 100) end
	do
		local byteOn4thIndexAfter = _g.jk.lang.Buffer:getInt8(buff, 4)
		if not (byteOn4thIndexBefore == 111 and byteOn4thIndexAfter == 100) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
	end
end

function jk.core.tests.BufferTests:testResizingOfBuffer()
	local str = "Hello World"
	local buff = _g.jk.lang.String:toUTF8Buffer(str)
	local strSizeBefore = _g.jk.lang.Buffer:getSize(buff)
	local strResized = _g.jk.lang.Buffer:resize(buff, 5)
	local strSizeAfter = _g.jk.lang.Buffer:getSize(strResized)
	if not (strSizeBefore == 11 and strSizeAfter == 5) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.BufferTests:testCopyingOfBuffer()
	local strA = "Hello World"
	local strABuffer = _g.jk.lang.String:toUTF8Buffer(strA)
	local byteInIndex1Before = _g.jk.lang.Buffer:getInt8(strABuffer, 1)
	local strB = "Testing Copy Form Func"
	local strBBuffer = _g.jk.lang.String:toUTF8Buffer(strB)
	local byteInIndex3 = _g.jk.lang.Buffer:getInt8(strBBuffer, 3)
	do _g.jk.lang.Buffer:copyFrom(strABuffer, strBBuffer, 3, 1, 1) end
	do
		local byteInIndex1After = _g.jk.lang.Buffer:getInt8(strABuffer, 1)
		if not (byteInIndex1Before == 101 and byteInIndex3 == 116 and byteInIndex1After == 116) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
	end
end

function jk.core.tests.BufferTests:testGettingOfInt16LEOnBuffer()
	local str = "Hello World"
	local buff = _g.jk.lang.String:toUTF8Buffer(str)
	if not (_g.jk.lang.Buffer:getInt16LE(buff, 4) == 8303) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.BufferTests:testGettingOfInt16BEOnBuffer()
	local str = "Hello World"
	local buff = _g.jk.lang.String:toUTF8Buffer(str)
	if not (_g.jk.lang.Buffer:getInt16BE(buff, 4) == 28448) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.BufferTests:testGettingOfInt32LEOnBuffer()
	local str = "Hello World"
	local buff = _g.jk.lang.String:toUTF8Buffer(str)
	if not (_g.jk.lang.Buffer:getInt32LE(buff, 4) == 1867980911) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.BufferTests:testGettingOfInt32BEOnBuffer()
	local str = "Hello World"
	local buff = _g.jk.lang.String:toUTF8Buffer(str)
	if not (_g.jk.lang.Buffer:getInt32BE(buff, 4) == 1864390511) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.BufferTests:testBufferLiterals()
	local buffer = _util:create_buffer({ 0,1,2,3,4 })
	if not (_g.jk.lang.Buffer:getSize(buffer) == 5) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Buffer:getInt8(buffer, 0) == 0) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Buffer:getInt8(buffer, 1) == 1) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.lang.Buffer:getInt8(buffer, 2) == 2) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (buffer[0 + 1] == 0) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (buffer[1 + 1] == 1) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (buffer[2 + 1] == 2) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (buffer[3 + 1] == 3) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (buffer[4 + 1] == 4) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.BufferTests:execute()
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "get the size of the buffer") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testGettingOfBufferSize() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "get the size of the buffer") end
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "get Int8 value on the given index") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testGettingOfInt8OnBuffer() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "get Int8 value on the given index") end
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "set value of byte on the give index") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testSettingOfByteOnBuffer() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "set value of byte on the give index") end
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "resize buffer") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testResizingOfBuffer() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "resize buffer") end
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "copy buffer") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testCopyingOfBuffer() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "copy buffer") end
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "get Int16LE value on the given index") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testGettingOfInt16LEOnBuffer() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "get Int16LE value on the given index") end
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "get Int16BE value on the given index") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testGettingOfInt16BEOnBuffer() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "get Int16BE value on the given index") end
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "get Int32LE value on the given index") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testGettingOfInt32LEOnBuffer() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "get Int32LE value on the given index") end
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "get Int32BE value on the given index") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testGettingOfInt32BEOnBuffer() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "get Int32BE value on the given index") end
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "buffer literals") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testBufferLiterals() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "buffer literals") end
end

jk.core.tests.StackTraceTests = _g.jk.test.UnitTest._create()
jk.core.tests.StackTraceTests.__index = jk.core.tests.StackTraceTests
_vm:set_metatable(jk.core.tests.StackTraceTests, {
	__index = _g.jk.test.UnitTest
})

function jk.core.tests.StackTraceTests._create()
	local v = _vm:set_metatable({}, jk.core.tests.StackTraceTests)
	return v
end

function jk.core.tests.StackTraceTests:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.core.tests.StackTraceTests'
	self['_isType.jk.core.tests.StackTraceTests'] = true
end

function jk.core.tests.StackTraceTests:_construct0()
	jk.core.tests.StackTraceTests._init(self)
	do _g.jk.test.UnitTest._construct0(self) end
	return self
end

function jk.core.tests.StackTraceTests:testStackTrace()
	do
		local _status, _err = _vm:execute_protected_call(function()
			do _g.jk.core.tests.StackTraceTests:process("bb") end
		end)
		if _err then
			if (_vm:to_table_with_key(_err, '_isType.jk.core.tests.StackTraceTests.MyException') ~= nil) then
				local e = _err
				local str = e:toString()
				if not not (str == nil) then
					_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
				end
			else
				_vm:throw_error(_err)
			end
		end
	end
end

function jk.core.tests.StackTraceTests:execute()
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "StackTrace Tests") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testStackTrace() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "StackTrace Tests") end
end

function jk.core.tests.StackTraceTests:process(str)
	if not (str == "AA") then
		local excp = _g.jk.core.tests.StackTraceTests.MyException:instance("StackTraceTests.sling", "48", "71")
		if excp ~= nil then
			_vm:throw_error(excp)
		end
	end
end

jk.core.tests.StackTraceTests.MyException = _g.jk.lang.Exception._create()
jk.core.tests.StackTraceTests.MyException.__index = jk.core.tests.StackTraceTests.MyException
_vm:set_metatable(jk.core.tests.StackTraceTests.MyException, {
	__index = _g.jk.lang.Exception
})

function jk.core.tests.StackTraceTests.MyException._create()
	local v = _vm:set_metatable({}, jk.core.tests.StackTraceTests.MyException)
	return v
end

function jk.core.tests.StackTraceTests.MyException:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.core.tests.StackTraceTests.MyException'
	self['_isType.jk.core.tests.StackTraceTests.MyException'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.file = nil
	self.line = nil
	self.column = nil
end

function jk.core.tests.StackTraceTests.MyException:_construct0()
	jk.core.tests.StackTraceTests.MyException._init(self)
	do _g.jk.lang.Exception._construct0(self) end
	return self
end

function jk.core.tests.StackTraceTests.MyException:instance(file, line, column)
	local v = _g.jk.core.tests.StackTraceTests.MyException._construct0(_g.jk.core.tests.StackTraceTests.MyException._create())
	do v:setFile(file) end
	do v:setLine(line) end
	do v:setColumn(column) end
	do return v end
end

function jk.core.tests.StackTraceTests.MyException:toString()
	local sb = _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(self.file)) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(self.line)) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:safeString(self.column)) .. ": " .. "MyException"
	do return sb end
end

function jk.core.tests.StackTraceTests.MyException:getFile()
	do return self.file end
end

function jk.core.tests.StackTraceTests.MyException:setFile(v)
	self.file = v
	do return self end
end

function jk.core.tests.StackTraceTests.MyException:getLine()
	do return self.line end
end

function jk.core.tests.StackTraceTests.MyException:setLine(v)
	self.line = v
	do return self end
end

function jk.core.tests.StackTraceTests.MyException:getColumn()
	do return self.column end
end

function jk.core.tests.StackTraceTests.MyException:setColumn(v)
	self.column = v
	do return self end
end

jk.core.tests.StringBuilderTests = _g.jk.test.UnitTest._create()
jk.core.tests.StringBuilderTests.__index = jk.core.tests.StringBuilderTests
_vm:set_metatable(jk.core.tests.StringBuilderTests, {
	__index = _g.jk.test.UnitTest
})

function jk.core.tests.StringBuilderTests._create()
	local v = _vm:set_metatable({}, jk.core.tests.StringBuilderTests)
	return v
end

function jk.core.tests.StringBuilderTests:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.core.tests.StringBuilderTests'
	self['_isType.jk.core.tests.StringBuilderTests'] = true
end

function jk.core.tests.StringBuilderTests:_construct0()
	jk.core.tests.StringBuilderTests._init(self)
	do _g.jk.test.UnitTest._construct0(self) end
	return self
end

function jk.core.tests.StringBuilderTests:testStringBuilderMethods()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendInteger(1) end
	do sb:appendCharacter(97) end
	do sb:appendDouble(1.01) end
	do sb:appendFloat(1.01) end
	do sb:clear() end
	if not (sb:count() == 0) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do sb:appendString("My Test String") end
	if not (sb:count() == 14) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do sb:remove(0, 3) end
	if not (sb:toString() == "Test String") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (sb:count() == 11) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do sb:remove(11, 4) end
	if not (sb:count() == 11) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do sb:remove(1, 2) end
	if not (sb:toString() == "Tt String") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (sb:count() == 9) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do sb:removeLastCharacter() end
	if not (sb:toString() == "Tt Strin") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (sb:count() == 8) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do sb:insertString(0, "A ") end
	if not (sb:toString() == "A Tt Strin") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do sb:insertString(1, "b") end
	if not (sb:toString() == "Ab Tt Strin") then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.StringBuilderTests:execute()
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "StringBuilder Methods") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testStringBuilderMethods() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "StringBuilder Methods") end
end

jk.core.tests.SystemClockTests = _g.jk.test.UnitTest._create()
jk.core.tests.SystemClockTests.__index = jk.core.tests.SystemClockTests
_vm:set_metatable(jk.core.tests.SystemClockTests, {
	__index = _g.jk.test.UnitTest
})

function jk.core.tests.SystemClockTests._create()
	local v = _vm:set_metatable({}, jk.core.tests.SystemClockTests)
	return v
end

function jk.core.tests.SystemClockTests:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.core.tests.SystemClockTests'
	self['_isType.jk.core.tests.SystemClockTests'] = true
end

function jk.core.tests.SystemClockTests:_construct0()
	jk.core.tests.SystemClockTests._init(self)
	do _g.jk.test.UnitTest._construct0(self) end
	return self
end

function jk.core.tests.SystemClockTests:testSystemClockMethods()
	if not (_g.jk.time.SystemClock:asSeconds() > 0) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.time.SystemClock:asUTCSeconds() > 0) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (_g.jk.time.SystemClock:asTimeValue() ~= nil) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.SystemClockTests:execute()
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "SystemClock Methods") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testSystemClockMethods() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "SystemClock Methods") end
end

jk.core.tests.VariableReferenceTests = _g.jk.test.UnitTest._create()
jk.core.tests.VariableReferenceTests.__index = jk.core.tests.VariableReferenceTests
_vm:set_metatable(jk.core.tests.VariableReferenceTests, {
	__index = _g.jk.test.UnitTest
})

function jk.core.tests.VariableReferenceTests._create()
	local v = _vm:set_metatable({}, jk.core.tests.VariableReferenceTests)
	return v
end

function jk.core.tests.VariableReferenceTests:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.core.tests.VariableReferenceTests'
	self['_isType.jk.core.tests.VariableReferenceTests'] = true
end

function jk.core.tests.VariableReferenceTests:_construct0()
	jk.core.tests.VariableReferenceTests._init(self)
	do _g.jk.test.UnitTest._construct0(self) end
	return self
end

function jk.core.tests.VariableReferenceTests:testVariableReferences()
	local n = 10
	local setter = function(value)
		n = value
	end
	local getter = function()
		do return n end
	end
	local vr = _g.jk.lang.VariableReference._construct2(_g.jk.lang.VariableReference._create(), setter, getter)
	if not (vr:get() == 10) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do vr:set(999) end
	if not (vr:get() == 999) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.VariableReferenceTests:execute()
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "Variable references") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testVariableReferences() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "Variable references") end
end

jk.core.tests.FileSystemTests = _g.jk.test.UnitTest._create()
jk.core.tests.FileSystemTests.__index = jk.core.tests.FileSystemTests
_vm:set_metatable(jk.core.tests.FileSystemTests, {
	__index = _g.jk.test.UnitTest
})

function jk.core.tests.FileSystemTests._create()
	local v = _vm:set_metatable({}, jk.core.tests.FileSystemTests)
	return v
end

function jk.core.tests.FileSystemTests:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.core.tests.FileSystemTests'
	self['_isType.jk.core.tests.FileSystemTests'] = true
end

function jk.core.tests.FileSystemTests:_construct0()
	jk.core.tests.FileSystemTests._init(self)
	do _g.jk.test.UnitTest._construct0(self) end
	return self
end

function jk.core.tests.FileSystemTests:testMoveFile()
	local tf1 = _g.jk.env.TemporaryFile:create(nil)
	local tf2 = _g.jk.env.TemporaryFile:create(nil)
	if not (tf1 ~= nil and tf1:isFile()) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (tf2 ~= nil and tf2:isFile()) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (tf1:move(tf2, false) == false) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (tf1:move(tf2, true) == true) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (tf1:isFile() == false) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	if not (tf2:isFile() == true) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do tf2:remove() end
	if not (tf2:isFile() == false) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
end

function jk.core.tests.FileSystemTests:testRenameFile()
	local td = _g.jk.env.TemporaryDirectory:create()
	if not (td:isDirectory() == true) then
		_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
	end
	do
		local tf1 = td:entry("file1")
		local tf2 = td:entry("file2")
		local tf3 = td:entry("file3")
		do tf1:setContentsUTF8("data") end
		if not (tf1:getContentsUTF8() == "data") then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (tf1:rename("file2", false) == true) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (tf1:isFile() == false) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (tf2:isFile() == true) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (tf2:getContentsUTF8() == "data") then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		do tf3:touch() end
		if not (tf3:isFile() == true) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (tf3:getContentsUTF8() == "") then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (tf2:rename("file3", false) == false) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (tf2:isFile() == true) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (tf3:isFile() == true) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (tf3:getContentsUTF8() == "") then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (tf2:rename("file3", true) == true) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (tf2:isFile() == false) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (tf3:isFile() == true) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (tf3:getContentsUTF8() == "data") then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		do td:removeRecursive() end
		if not (tf3:isFile() == false) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
		if not (td:isDirectory() == false) then
			_vm:throw_error(_g.jk.test.FailedAssertionException:instance("UnitTest.sling", "40", "79", nil))
		end
	end
end

function jk.core.tests.FileSystemTests:execute()
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "Move file") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testMoveFile() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "Move file") end
	do _g.jk.log.Log:debug(self.ctx, "Executing test: " .. "UnitTest" .. " / " .. "Rename file") end
	do
		local _status, _err = _vm:execute_protected_call(function()
			do self:testRenameFile() end
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
	do _g.jk.log.Log:debug(self.ctx, "Done executing test: " .. "UnitTest" .. " / " .. "Rename file") end
end

function _main(args)
	do return jk.core.tests.TestMain:_main(args) end
end
