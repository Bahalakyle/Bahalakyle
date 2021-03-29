jk = jk or {}

jk.test = jk.test or {}

jk.test.UnitTest = {}
jk.test.UnitTest.__index = jk.test.UnitTest
_vm:set_metatable(jk.test.UnitTest, {})

function jk.test.UnitTest._create()
	local v = _vm:set_metatable({}, jk.test.UnitTest)
	return v
end

function jk.test.UnitTest:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.test.UnitTest'
	self['_isType.jk.test.UnitTest'] = true
	self.ctx = _g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create())
end

function jk.test.UnitTest:_construct0()
	jk.test.UnitTest._init(self)
	do self.ctx:setEnableDebugMessages(true) end
	return self
end

function jk.test.UnitTest:execute()
end

jk.test.FailedAssertionException = _g.jk.lang.Exception._create()
jk.test.FailedAssertionException.__index = jk.test.FailedAssertionException
_vm:set_metatable(jk.test.FailedAssertionException, {
	__index = _g.jk.lang.Exception
})

function jk.test.FailedAssertionException._create()
	local v = _vm:set_metatable({}, jk.test.FailedAssertionException)
	return v
end

function jk.test.FailedAssertionException:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.test.FailedAssertionException'
	self['_isType.jk.test.FailedAssertionException'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.file = nil
	self.line = nil
	self.column = nil
	self.assertionErrorMessage = nil
end

function jk.test.FailedAssertionException:_construct0()
	jk.test.FailedAssertionException._init(self)
	do _g.jk.lang.Exception._construct0(self) end
	return self
end

function jk.test.FailedAssertionException:instance(file, line, column, message)
	local v = _g.jk.test.FailedAssertionException._construct0(_g.jk.test.FailedAssertionException._create())
	do v:setFile(file) end
	do v:setLine(line) end
	do v:setColumn(column) end
	do v:setAssertionErrorMessage(message) end
	do return v end
end

function jk.test.FailedAssertionException:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(_g.jk.lang.String:safeString(self.file) .. ":" .. _g.jk.lang.String:safeString(self.line) .. ":" .. _g.jk.lang.String:safeString(self.column) .. ": " .. "FailedAssertionException") end
	if self.assertionErrorMessage ~= nil then
		do sb:appendString(": ") end
		do sb:appendString(self.assertionErrorMessage) end
	end
	do return sb:toString() end
end

function jk.test.FailedAssertionException:getFile()
	do return self.file end
end

function jk.test.FailedAssertionException:setFile(v)
	self.file = v
	do return self end
end

function jk.test.FailedAssertionException:getLine()
	do return self.line end
end

function jk.test.FailedAssertionException:setLine(v)
	self.line = v
	do return self end
end

function jk.test.FailedAssertionException:getColumn()
	do return self.column end
end

function jk.test.FailedAssertionException:setColumn(v)
	self.column = v
	do return self end
end

function jk.test.FailedAssertionException:getAssertionErrorMessage()
	do return self.assertionErrorMessage end
end

function jk.test.FailedAssertionException:setAssertionErrorMessage(v)
	self.assertionErrorMessage = v
	do return self end
end

jk.test.TestSet = {}
jk.test.TestSet.__index = jk.test.TestSet
_vm:set_metatable(jk.test.TestSet, {})

function jk.test.TestSet._create()
	local v = _vm:set_metatable({}, jk.test.TestSet)
	return v
end

function jk.test.TestSet:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.test.TestSet'
	self['_isType.jk.test.TestSet'] = true
	self.ctx = _g.jk.console.ConsoleApplicationContext._construct0(_g.jk.console.ConsoleApplicationContext._create())
	self.total = 0
	self.failed = 0
end

function jk.test.TestSet:_construct0()
	jk.test.TestSet._init(self)
	return self
end

function jk.test.TestSet:test()
end

function jk.test.TestSet:execute()
	do self:test() end
	if self.failed > 0 then
		do return 1 end
	end
	do return 0 end
end

function jk.test.TestSet:getTotal()
	do return self.total end
end

function jk.test.TestSet:setTotal(v)
	self.total = v
	do return self end
end

function jk.test.TestSet:getFailed()
	do return self.failed end
end

function jk.test.TestSet:setFailed(v)
	self.failed = v
	do return self end
end
