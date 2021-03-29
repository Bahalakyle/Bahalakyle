jk = jk or {}

jk.lang = jk.lang or {}

jk.lang.CharacterObject = {}

jk.lang.StringObject = {}

jk.lang.VariableReference = {}
jk.lang.VariableReference.__index = jk.lang.VariableReference
_vm:set_metatable(jk.lang.VariableReference, {})

function jk.lang.VariableReference._create()
	local v = _vm:set_metatable({}, jk.lang.VariableReference)
	return v
end

function jk.lang.VariableReference:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.VariableReference'
	self['_isType.jk.lang.VariableReference'] = true
	self.setter = nil
	self.getter = nil
end

function jk.lang.VariableReference:_construct0()
	jk.lang.VariableReference._init(self)
	return self
end

function jk.lang.VariableReference:_construct2(setter, getter)
	jk.lang.VariableReference._init(self)
	self.setter = setter
	self.getter = getter
	return self
end

function jk.lang.VariableReference:set(value)
	do self.setter(value) end
	do return self end
end

function jk.lang.VariableReference:get()
	do return self.getter() end
end

jk.lang.Closable = {}

jk.lang.LongIntegerIterator = {}

jk.lang.Iterator = {}

jk.lang.StringIterator = {}

jk.lang.Matrix = {}
jk.lang.Matrix.__index = jk.lang.Matrix
_vm:set_metatable(jk.lang.Matrix, {})

function jk.lang.Matrix._create()
	local v = _vm:set_metatable({}, jk.lang.Matrix)
	return v
end

function jk.lang.Matrix:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Matrix'
	self['_isType.jk.lang.Matrix'] = true
	self.vector = nil
	self.columnCount = 0
end

function jk.lang.Matrix:_construct0()
	jk.lang.Matrix._init(self)
	return self
end

function jk.lang.Matrix:_construct2(rowSize, columnSize)
	jk.lang.Matrix._init(self)
	self.vector = {}
	do self:setSize(rowSize, columnSize) end
	return self
end

function jk.lang.Matrix:set(row, column, val)
	if not (self.vector ~= nil) then
		do return end
	end
	if not (row >= 0 or column >= 0) then
		do return end
	end
	do
		local size = row * self.columnCount + column
		if not (_g.jk.lang.Vector:getSize(self.vector) > size) then
			do return end
		end
		do _g.jk.lang.Vector:set(self.vector, size, val) end
	end
end

function jk.lang.Matrix:get(row, column)
	if not (self.vector ~= nil) then
		do return nil end
	end
	if not (row >= 0 or column >= 0) then
		do return nil end
	end
	do
		local size = row * self.columnCount + column
		if not (_g.jk.lang.Vector:getSize(self.vector) > size) then
			do return nil end
		end
		do return _g.jk.lang.Vector:get(self.vector, size) end
	end
end

function jk.lang.Matrix:setSize(rowSize, colSize)
	if not (self.vector ~= nil) then
		do return nil end
	end
	self.columnCount = colSize
	do _g.jk.lang.Vector:setSize(self.vector, rowSize * colSize) end
	do return self end
end

function jk.lang.Matrix:getRowCount()
	if not (self.vector ~= nil) then
		do return 0 end
	end
	do return _g.jk.lang.Vector:getSize(self.vector) / self.columnCount end
end

function jk.lang.Matrix:getColumnCount()
	if not (self.vector ~= nil) then
		do return 0 end
	end
	do return self.columnCount end
end

jk.lang.Task = {}

jk.lang.Stack = {}
jk.lang.Stack.__index = jk.lang.Stack
_vm:set_metatable(jk.lang.Stack, {})

function jk.lang.Stack._create()
	local v = _vm:set_metatable({}, jk.lang.Stack)
	return v
end

function jk.lang.Stack:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Stack'
	self['_isType.jk.lang.Stack'] = true
	self.data = nil
end

function jk.lang.Stack:_construct0()
	jk.lang.Stack._init(self)
	self.data = {}
	return self
end

function jk.lang.Stack:push(o)
	do _g.jk.lang.Vector:append(self.data, o) end
end

function jk.lang.Stack:pop()
	local sz = _g.jk.lang.Vector:getSize(self.data)
	if sz < 1 then
		do return nil end
	end
	do
		local v = _g.jk.lang.Vector:getAt(self.data, sz - 1)
		do _g.jk.lang.Vector:remove(self.data, sz - 1) end
		do return v end
	end
end

function jk.lang.Stack:peek()
	local sz = _g.jk.lang.Vector:getSize(self.data)
	if sz < 1 then
		do return nil end
	end
	do return _g.jk.lang.Vector:getAt(self.data, sz - 1) end
end

function jk.lang.Stack:isEmpty()
	do return self:getSize() < 1 end
end

function jk.lang.Stack:getSize()
	do return _g.jk.lang.Vector:getSize(self.data) end
end

function jk.lang.Stack:dupData()
	local v = {}
	if self.data ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.data)
		do
			n = 0
			while n < m do
				local o = self.data[n + 1]
				if o ~= nil then
					do _g.jk.lang.Vector:append(v, o) end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.lang.Stack:dup()
	local v = _g.jk.lang.Stack._construct0(_g.jk.lang.Stack._create())
	do v:setData(self:dupData()) end
	do return v end
end

function jk.lang.Stack:getData()
	do return self.data end
end

function jk.lang.Stack:setData(v)
	self.data = v
	do return self end
end

jk.lang.IntegerObject = {}

jk.lang.Set = {}
jk.lang.Set.__index = jk.lang.Set
_vm:set_metatable(jk.lang.Set, {})

function jk.lang.Set._create()
	local v = _vm:set_metatable({}, jk.lang.Set)
	return v
end

function jk.lang.Set:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Set'
	self['_isType.jk.lang.Set'] = true
end

function jk.lang.Set:_construct0()
	jk.lang.Set._init(self)
	return self
end

function jk.lang.Set:add(set, value)
	if not (set ~= nil) then
		do return end
	end
	_io:write_to_stdout("[jk.lang.Set.add] (Set.sling:49:3): Not implemented" .. "\n")
end

function jk.lang.Set:remove(set, value)
	if not (set ~= nil) then
		do return end
	end
	_io:write_to_stdout("[jk.lang.Set.remove] (Set.sling:75:3): Not implemented" .. "\n")
end

function jk.lang.Set:clear(set)
	if not (set ~= nil) then
		do return end
	end
	_io:write_to_stdout("[jk.lang.Set.clear] (Set.sling:101:3): Not implemented" .. "\n")
end

function jk.lang.Set:getSize(set)
	if not (set ~= nil) then
		do return 0 end
	end
	_io:write_to_stdout("[jk.lang.Set.getSize] (Set.sling:127:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.lang.Set:contains(set, value)
	if not (set ~= nil) then
		do return false end
	end
	_io:write_to_stdout("[jk.lang.Set.contains] (Set.sling:154:3): Not implemented" .. "\n")
	do return false end
end

function jk.lang.Set:getValues(set)
	if not (set ~= nil) then
		do return nil end
	end
	_io:write_to_stdout("[jk.lang.Set.getValues] (Set.sling:213:3): Not implemented" .. "\n")
	do return nil end
end

jk.lang.LongIntegerObject = {}

jk.lang.Runnable = {}

jk.lang.StringObjectWithDebug = {}

jk.lang.DynamicMapObject = {}

jk.lang.Error = {}
jk.lang.Error.__index = jk.lang.Error
_vm:set_metatable(jk.lang.Error, {})

function jk.lang.Error._create()
	local v = _vm:set_metatable({}, jk.lang.Error)
	return v
end

function jk.lang.Error:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Error'
	self['_isType.jk.lang.Error'] = true
	self['_isType.jk.lang.StringObject'] = true
	self['_isType.jk.lang.StringObjectWithDebug'] = true
	self.code = nil
	self.detail = nil
end

function jk.lang.Error:_construct0()
	jk.lang.Error._init(self)
	return self
end

function jk.lang.Error:throw(code, detail)
	_vm:throw_error(_g.jk.lang.ExceptionWithError:forError(_g.jk.lang.Error:forCode(code, detail)))
end

function jk.lang.Error:forCode(code, detail)
	do return _g.jk.lang.Error._construct0(_g.jk.lang.Error._create()):setCode(code):setDetail(detail) end
end

function jk.lang.Error:asString(error)
	if not (error ~= nil) then
		do return "error" end
	end
	do return error:toString() end
end

function jk.lang.Error:set(error, code, detail)
	if not (error ~= nil) then
		do return nil end
	end
	do error:setCode(code) end
	do error:setDetail(detail) end
	do return error end
end

function jk.lang.Error:setErrorCode(error, code)
	do return _g.jk.lang.Error:set(error, code, nil) end
end

function jk.lang.Error:setErrorDetail(error, detail)
	do return _g.jk.lang.Error:set(error, nil, detail) end
end

function jk.lang.Error:isError(o)
	if not (o ~= nil) then
		do return false end
	end
	if not (_vm:to_table_with_key(o, '_isType.jk.lang.Error') ~= nil) then
		do return false end
	end
	do
		local e = o
		if _g.jk.lang.String:isEmpty(e:getCode()) then
			do return false end
		end
		do return true end
	end
end

function jk.lang.Error:clear()
	self.code = nil
	self.detail = nil
	do return self end
end

function jk.lang.Error:toStringWithDefault(debug, defaultError)
	local details = nil
	if (_vm:to_table_with_key(self.detail, '_isType.jk.lang.StringObjectWithDebug') ~= nil) then
		details = self.detail:toStringWithDebug(debug)
	else
		details = _g.jk.lang.String:asString(self.detail)
	end
	if _g.jk.lang.String:isEmpty(self.code) == false then
		if _g.jk.lang.String:isEmpty(details) == false then
			do return _g.jk.lang.String:safeString(self.code) .. ":" .. _g.jk.lang.String:safeString(details) end
		end
		do return self.code end
	end
	if _g.jk.lang.String:isEmpty(details) == false then
		do return "errorWithDetail:" .. _g.jk.lang.String:safeString(details) end
	end
	do return defaultError end
end

function jk.lang.Error:toStringWithDebug(debug)
	do return self:toStringWithDefault(debug, "unknownError") end
end

function jk.lang.Error:toString()
	do return self:toStringWithDebug(false) end
end

function jk.lang.Error:getCode()
	do return self.code end
end

function jk.lang.Error:setCode(v)
	self.code = v
	do return self end
end

function jk.lang.Error:getDetail()
	do return self.detail end
end

function jk.lang.Error:setDetail(v)
	self.detail = v
	do return self end
end

jk.lang.Integer = {}
jk.lang.Integer.__index = jk.lang.Integer
_vm:set_metatable(jk.lang.Integer, {})

function jk.lang.Integer._create()
	local v = _vm:set_metatable({}, jk.lang.Integer)
	return v
end

function jk.lang.Integer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Integer'
	self['_isType.jk.lang.Integer'] = true
	self['_isType.jk.lang.IntegerObject'] = true
	self.value = 0
end

function jk.lang.Integer:_construct0()
	jk.lang.Integer._init(self)
	return self
end

function jk.lang.Integer:forValue(value)
	do return _g.jk.lang.Integer:asObject(value) end
end

function jk.lang.Integer:asObject(integer)
	local v = _g.jk.lang.Integer._construct0(_g.jk.lang.Integer._create())
	do v:setValue(integer) end
	do return v end
end

function jk.lang.Integer:asInteger(obj)
	if not (obj ~= nil) then
		do return 0 end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _util:convert_to_integer(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.IntegerObject') ~= nil) then
		local oi = obj
		do return oi:toInteger() end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = _util:convert_to_integer(obj)
		do return v end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.LongIntegerObject') ~= nil) then
		local oi = obj
		do return oi:toLong() end
	end
	if (_vm:get_variable_type(obj) == 'string') then
		do return _g.jk.lang.String:toInteger(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.StringObject') ~= nil) then
		do return _g.jk.lang.String:toInteger(obj:toString()) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = obj
		do return _util:convert_to_integer(v) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.DoubleObject') ~= nil) then
		local od = obj
		do return _util:convert_to_integer(od:toDouble()) end
	end
	if (_vm:get_variable_type(obj) == 'boolean') then
		if obj == true then
			do return 1 end
		end
		do return 0 end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.BooleanObject') ~= nil) then
		if obj:toBoolean() then
			do return 1 end
		end
		do return 0 end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = obj
		do return _util:convert_to_integer(v) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.CharacterObject') ~= nil) then
		local oc = obj
		do return _util:convert_to_integer(oc:toCharacter()) end
	end
	do return 0 end
end

function jk.lang.Integer:add(amount)
	self.value = self.value + amount
end

function jk.lang.Integer:toInteger()
	do return self.value end
end

function jk.lang.Integer:getValue()
	do return self.value end
end

function jk.lang.Integer:setValue(v)
	self.value = v
	do return self end
end

jk.lang.KeyValueList = {}
jk.lang.KeyValueList.__index = jk.lang.KeyValueList
_vm:set_metatable(jk.lang.KeyValueList, {})

function jk.lang.KeyValueList._create()
	local v = _vm:set_metatable({}, jk.lang.KeyValueList)
	return v
end

function jk.lang.KeyValueList:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.KeyValueList'
	self['_isType.jk.lang.KeyValueList'] = true
	self.values = nil
end

function jk.lang.KeyValueList:_construct0()
	jk.lang.KeyValueList._init(self)
	return self
end

function jk.lang.KeyValueList:add(key, val)
	if self.values == nil then
		self.values = {}
	end
	do
		local kvp = _g.jk.lang.KeyValuePair._construct0(_g.jk.lang.KeyValuePair._create())
		kvp.key = key
		kvp.value = val
		do _g.jk.lang.Vector:append(self.values, kvp) end
	end
end

function jk.lang.KeyValueList:addPair(pair)
	if self.values == nil then
		self.values = {}
	end
	do _g.jk.lang.Vector:append(self.values, pair) end
end

function jk.lang.KeyValueList:prepend(key, val)
	if self.values == nil then
		self.values = {}
	end
	do
		local kvp = _g.jk.lang.KeyValuePair._construct0(_g.jk.lang.KeyValuePair._create())
		kvp.key = key
		kvp.value = val
		do _g.jk.lang.Vector:prepend(self.values, kvp) end
	end
end

function jk.lang.KeyValueList:prependPair(pair)
	if self.values == nil then
		self.values = {}
	end
	do _g.jk.lang.Vector:prepend(self.values, pair) end
end

function jk.lang.KeyValueList:iterate()
	local v = _g.jk.lang.Vector:iterate(self.values)
	do return v end
end

function jk.lang.KeyValueList:asVector()
	do return self.values end
end

function jk.lang.KeyValueList:dup()
	local v = _g.jk.lang.KeyValueList._construct0(_g.jk.lang.KeyValueList._create())
	local it = self:iterate()
	while true do
		local kvp = it:next()
		if kvp == nil then
			do break end
		end
		do v:add(kvp.key, kvp.value) end
	end
	do return v end
end

function jk.lang.KeyValueList:getKey(index)
	if self.values == nil then
		do return nil end
	end
	do
		local kvp = _g.jk.lang.Vector:get(self.values, index)
		if kvp == nil then
			do return nil end
		end
		do return kvp.key end
	end
end

function jk.lang.KeyValueList:getValue(index)
	if self.values == nil then
		do return nil end
	end
	do
		local kvp = _g.jk.lang.Vector:get(self.values, index)
		if kvp == nil then
			do return nil end
		end
		do return kvp.value end
	end
end

function jk.lang.KeyValueList:count()
	if self.values == nil then
		do return 0 end
	end
	do return _g.jk.lang.Vector:getSize(self.values) end
end

function jk.lang.KeyValueList:remove(index)
	do _g.jk.lang.Vector:remove(self.values, index) end
end

function jk.lang.KeyValueList:clear()
	self.values = nil
end

jk.lang.ObjectWithSize = {}

jk.lang.KeyValuePair = {}
jk.lang.KeyValuePair.__index = jk.lang.KeyValuePair
_vm:set_metatable(jk.lang.KeyValuePair, {})

function jk.lang.KeyValuePair._create()
	local v = _vm:set_metatable({}, jk.lang.KeyValuePair)
	return v
end

function jk.lang.KeyValuePair:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.KeyValuePair'
	self['_isType.jk.lang.KeyValuePair'] = true
	self.key = nil
	self.value = nil
end

function jk.lang.KeyValuePair:_construct0()
	jk.lang.KeyValuePair._init(self)
	return self
end

function jk.lang.KeyValuePair:_construct2(key, value)
	jk.lang.KeyValuePair._init(self)
	self.key = key
	self.value = value
	return self
end

jk.lang.ObjectWrapper = {}
jk.lang.ObjectWrapper.__index = jk.lang.ObjectWrapper
_vm:set_metatable(jk.lang.ObjectWrapper, {})

function jk.lang.ObjectWrapper._create()
	local v = _vm:set_metatable({}, jk.lang.ObjectWrapper)
	return v
end

function jk.lang.ObjectWrapper:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.ObjectWrapper'
	self['_isType.jk.lang.ObjectWrapper'] = true
	self.value = nil
end

function jk.lang.ObjectWrapper:_construct0()
	jk.lang.ObjectWrapper._init(self)
	return self
end

function jk.lang.ObjectWrapper:getValue()
	do return self.value end
end

function jk.lang.ObjectWrapper:setValue(v)
	self.value = v
	do return self end
end

jk.lang.ArrayObject = {}

jk.lang.Iterateable = {}

jk.lang.MapObject = {}

jk.lang.VectorObject = {}

jk.lang.BitOp = {}
jk.lang.BitOp.__index = jk.lang.BitOp
_vm:set_metatable(jk.lang.BitOp, {})

function jk.lang.BitOp._create()
	local v = _vm:set_metatable({}, jk.lang.BitOp)
	return v
end

function jk.lang.BitOp:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.BitOp'
	self['_isType.jk.lang.BitOp'] = true
end

function jk.lang.BitOp:_construct0()
	jk.lang.BitOp._init(self)
	return self
end

function jk.lang.BitOp:_or(v1, v2)
	do return _vm:bitwise_or(v1, v2) end
end

function jk.lang.BitOp:_and(v1, v2)
	do return _vm:bitwise_and(v1, v2) end
end

function jk.lang.BitOp:xor(v1, v2)
	do return _vm:bitwise_xor(v1, v2) end
end

function jk.lang.BitOp:_not(v)
	do return _vm:bitwise_not(v) end
end

jk.lang.IntegerIterator = {}

jk.lang.CharacterIterator = {}

jk.lang.LongInteger = {}
jk.lang.LongInteger.__index = jk.lang.LongInteger
_vm:set_metatable(jk.lang.LongInteger, {})

function jk.lang.LongInteger._create()
	local v = _vm:set_metatable({}, jk.lang.LongInteger)
	return v
end

function jk.lang.LongInteger:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.LongInteger'
	self['_isType.jk.lang.LongInteger'] = true
	self['_isType.jk.lang.LongIntegerObject'] = true
	self.value = 0
end

function jk.lang.LongInteger:_construct0()
	jk.lang.LongInteger._init(self)
	return self
end

function jk.lang.LongInteger:forValue(value)
	do return _g.jk.lang.LongInteger:asObject(value) end
end

function jk.lang.LongInteger:asObject(value)
	local v = _g.jk.lang.LongInteger._construct0(_g.jk.lang.LongInteger._create())
	do v:setValue(value) end
	do return v end
end

function jk.lang.LongInteger:asLong(obj)
	if not (obj ~= nil) then
		do return 0 end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _util:convert_to_integer(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.LongIntegerObject') ~= nil) then
		local oi = obj
		do return oi:toLong() end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = _util:convert_to_integer(obj)
		do return v end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.IntegerObject') ~= nil) then
		local oi = obj
		do return oi:toInteger() end
	end
	if (_vm:get_variable_type(obj) == 'string') then
		do return _g.jk.lang.String:toLong(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.StringObject') ~= nil) then
		do return _g.jk.lang.String:toLong(obj:toString()) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = obj
		do return _util:convert_to_integer(v) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.DoubleObject') ~= nil) then
		local od = obj
		do return _util:convert_to_integer(od:toDouble()) end
	end
	if (_vm:get_variable_type(obj) == 'boolean') then
		if obj == true then
			do return 1 end
		end
		do return 0 end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.BooleanObject') ~= nil) then
		if obj:toBoolean() then
			do return 1 end
		end
		do return 0 end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = obj
		do return _util:convert_to_integer(v) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.CharacterObject') ~= nil) then
		local oc = obj
		do return _util:convert_to_integer(oc:toCharacter()) end
	end
	do return 0 end
end

function jk.lang.LongInteger:add(amount)
	self.value = self.value + amount
end

function jk.lang.LongInteger:toLong()
	do return self.value end
end

function jk.lang.LongInteger:getValue()
	do return self.value end
end

function jk.lang.LongInteger:setValue(v)
	self.value = v
	do return self end
end

jk.lang.DoubleObject = {}

jk.lang.Duplicateable = {}

jk.lang.DoubleIterator = {}

jk.lang.BufferObject = {}

jk.lang.Range = {}
jk.lang.Range.__index = jk.lang.Range
_vm:set_metatable(jk.lang.Range, {})

jk.lang.Range.TYPE_NONE = 0
jk.lang.Range.TYPE_EXCLUDE_UPPER_BOUND = 1
jk.lang.Range.TYPE_EXCLUDE_LOWER_BOUND = 2
jk.lang.Range.TYPE_EXCLUDE_BOTH_BOUNDS = 3

function jk.lang.Range._create()
	local v = _vm:set_metatable({}, jk.lang.Range)
	return v
end

function jk.lang.Range:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Range'
	self['_isType.jk.lang.Range'] = true
	self['_isType.jk.lang.Iterateable'] = true
	self.lowerBound = 0.0
	self.upperBound = 0.0
	self.exclusionType = 0
end

function jk.lang.Range:forIntegerValues(lowerBound, upperBound, exclusionType)
	local v = _g.jk.lang.Range._construct0(_g.jk.lang.Range._create())
	do v:setLowerBound(lowerBound) end
	do v:setUpperBound(upperBound) end
	do v:setExclusionType(exclusionType) end
	do return v end
end

function jk.lang.Range:forDoubleValues(lowerBound, upperBound, exclusionType)
	local v = _g.jk.lang.Range._construct0(_g.jk.lang.Range._create())
	do v:setLowerBound(lowerBound) end
	do v:setUpperBound(upperBound) end
	do v:setExclusionType(exclusionType) end
	do return v end
end

function jk.lang.Range:forValues(lowerBound, upperBound, exclusionType)
	if (_vm:get_variable_type(lowerBound) == 'number') and (_vm:get_variable_type(upperBound) == 'number') then
		do return _g.jk.lang.Range:forDoubleValues(lowerBound, upperBound, exclusionType) end
	end
	if (_vm:get_variable_type(lowerBound) == 'number') and (_vm:get_variable_type(upperBound) == 'number') then
		do return _g.jk.lang.Range:forIntegerValues(_util:convert_to_integer(lowerBound), _util:convert_to_integer(upperBound), exclusionType) end
	end
	do return nil end
end

function jk.lang.Range:_construct0()
	jk.lang.Range._init(self)
	return self
end

function jk.lang.Range:setLowerBound(lowerBound)
	self.lowerBound = lowerBound
end

function jk.lang.Range:setUpperBound(upperBound)
	self.upperBound = upperBound
end

function jk.lang.Range:setExclusionType(exclusionType)
	self.exclusionType = exclusionType
end

function jk.lang.Range:getLowerBoundAsInteger()
	do return _util:convert_to_integer(self.lowerBound) end
end

function jk.lang.Range:getLowerBoundAsDouble()
	do return self.lowerBound end
end

function jk.lang.Range:getUpperBoundAsInteger()
	do return _util:convert_to_integer(self.upperBound) end
end

function jk.lang.Range:getUpperBoundAsDouble()
	do return self.upperBound end
end

function jk.lang.Range:containsIntegerValue(value)
	do return self:containsDoubleValue(value) end
end

function jk.lang.Range:containsDoubleValue(value)
	if self.exclusionType == _g.jk.lang.Range.TYPE_NONE then
		do return value >= self.lowerBound and value <= self.upperBound end
	elseif self.exclusionType == _g.jk.lang.Range.TYPE_EXCLUDE_UPPER_BOUND then
		do return value >= self.lowerBound and value < self.upperBound end
	elseif self.exclusionType == _g.jk.lang.Range.TYPE_EXCLUDE_LOWER_BOUND then
		do return value > self.lowerBound and value <= self.upperBound end
	elseif self.exclusionType == _g.jk.lang.Range.TYPE_EXCLUDE_BOTH_BOUNDS then
		do return value > self.lowerBound and value < self.upperBound end
	end
	do return false end
end

jk.lang.Range.RangeIterator = {}
jk.lang.Range.RangeIterator.__index = jk.lang.Range.RangeIterator
_vm:set_metatable(jk.lang.Range.RangeIterator, {})

function jk.lang.Range.RangeIterator._create()
	local v = _vm:set_metatable({}, jk.lang.Range.RangeIterator)
	return v
end

function jk.lang.Range.RangeIterator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Range.RangeIterator'
	self['_isType.jk.lang.Range.RangeIterator'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.lowerBound = 0
	self.upperBound = 0
	self.increment = 0
	self.current = nil
end

function jk.lang.Range.RangeIterator:_construct0()
	jk.lang.Range.RangeIterator._init(self)
	return self
end

function jk.lang.Range.RangeIterator:_construct2(lowerBound, upperBound)
	jk.lang.Range.RangeIterator._init(self)
	self.lowerBound = lowerBound
	self.upperBound = upperBound
	if lowerBound <= upperBound then
		self.increment = 1
	else
		self.increment = -1
	end
	return self
end

function jk.lang.Range.RangeIterator:next()
	if not (self.current ~= nil) then
		self.current = _g.jk.lang.Integer:forValue(self.lowerBound)
	else
		do self.current:add(self.increment) end
	end
	do return self.current:getValue() end
end

function jk.lang.Range.RangeIterator:hasNext()
	if not (self.current ~= nil) then
		do return true end
	end
	if self.increment > 0 then
		do return self.current:getValue() < self.upperBound end
	end
	do return self.current:getValue() > self.upperBound end
end

function jk.lang.Range:iterate()
	local lv = _util:convert_to_integer(self.lowerBound)
	local uv = _util:convert_to_integer(self.upperBound)
	if self.exclusionType == _g.jk.lang.Range.TYPE_NONE then
	end
	if self.exclusionType == _g.jk.lang.Range.TYPE_EXCLUDE_UPPER_BOUND then
		uv = uv - 1
	elseif self.exclusionType == _g.jk.lang.Range.TYPE_EXCLUDE_LOWER_BOUND then
		lv = lv + 1
	elseif self.exclusionType == _g.jk.lang.Range.TYPE_EXCLUDE_BOTH_BOUNDS then
		uv = uv - 1
		lv = lv + 1
	end
	do return _g.jk.lang.Range.RangeIterator._construct2(_g.jk.lang.Range.RangeIterator._create(), lv, uv) end
end

jk.lang.StringDataReceiver = {}

jk.lang.Array = {}
jk.lang.Array.__index = jk.lang.Array
_vm:set_metatable(jk.lang.Array, {})

function jk.lang.Array._create()
	local v = _vm:set_metatable({}, jk.lang.Array)
	return v
end

function jk.lang.Array:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Array'
	self['_isType.jk.lang.Array'] = true
end

function jk.lang.Array:_construct0()
	jk.lang.Array._init(self)
	return self
end

jk.lang.Array.MyArrayObject = {}
jk.lang.Array.MyArrayObject.__index = jk.lang.Array.MyArrayObject
_vm:set_metatable(jk.lang.Array.MyArrayObject, {})

function jk.lang.Array.MyArrayObject._create()
	local v = _vm:set_metatable({}, jk.lang.Array.MyArrayObject)
	return v
end

function jk.lang.Array.MyArrayObject:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Array.MyArrayObject'
	self['_isType.jk.lang.Array.MyArrayObject'] = true
	self['_isType.jk.lang.ArrayObject'] = true
	self['_isType.jk.lang.ObjectWithSize'] = true
	self.array = nil
end

function jk.lang.Array.MyArrayObject:_construct0()
	jk.lang.Array.MyArrayObject._init(self)
	return self
end

function jk.lang.Array.MyArrayObject:toArray()
	do return self.array end
end

function jk.lang.Array.MyArrayObject:getSize()
	do return #self.array end
end

function jk.lang.Array.MyArrayObject:getArray()
	do return self.array end
end

function jk.lang.Array.MyArrayObject:setArray(v)
	self.array = v
	do return self end
end

function jk.lang.Array:asObject(array)
	local v = _g.jk.lang.Array.MyArrayObject._construct0(_g.jk.lang.Array.MyArrayObject._create())
	do v:setArray(array) end
	do return v end
end

function jk.lang.Array:isEmpty(array)
	if array == nil then
		do return true end
	end
	if #array < 1 then
		do return true end
	end
	do return false end
end

function jk.lang.Array:isNotEmpty(array)
	do return not _g.jk.lang.Array:isEmpty(array) end
end

function jk.lang.Array:contains(array, element)
	if not (array ~= nil) then
		do return false end
	end
	if array ~= nil then
		local n = 0
		local m = #array
		do
			n = 0
			while n < m do
				local oo = array[n + 1]
				if oo ~= nil then
					if element == oo then
						do return true end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return false end
end

function jk.lang.Array:toVector(array)
	do return _g.jk.lang.Vector:forArray(array) end
end

function jk.lang.Array:copyFrom(array, src, soffset, doffset, size)
	if not (array ~= nil) then
		do return end
	end
	if not (src ~= nil) then
		do return end
	end
	do
		local n = 0
		while n < size do
			array[doffset + n + 1] = src[soffset + n + 1]
			do n = n + 1 end
		end
	end
end

jk.lang.DynamicVector = {}
jk.lang.DynamicVector.__index = jk.lang.DynamicVector
_vm:set_metatable(jk.lang.DynamicVector, {})

function jk.lang.DynamicVector._create()
	local v = _vm:set_metatable({}, jk.lang.DynamicVector)
	return v
end

function jk.lang.DynamicVector:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DynamicVector'
	self['_isType.jk.lang.DynamicVector'] = true
	self['_isType.jk.lang.Duplicateable'] = true
	self['_isType.jk.lang.Iterateable'] = true
	self['_isType.jk.lang.VectorObject'] = true
	self['_isType.jk.lang.ObjectWithSize'] = true
	self.vector = nil
end

function jk.lang.DynamicVector:asDynamicVector(object)
	if not (object ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(object, '_isType.jk.lang.DynamicVector') ~= nil) then
		do return object end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(object) then
		do return _g.jk.lang.DynamicVector:forArray(object) end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(object) then
		do return _g.jk.lang.DynamicVector:forObjectVector(object) end
	end
	do return nil end
end

function jk.lang.DynamicVector:forStringVector(vector)
	local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
	if vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(vector)
		do
			n = 0
			while n < m do
				local item = vector[n + 1]
				if item ~= nil then
					do v:appendObject(item) end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.lang.DynamicVector:forObjectVector(vector)
	local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
	if vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(vector)
		do
			n = 0
			while n < m do
				local item = vector[n + 1]
				if item ~= nil then
					do v:appendObject(item) end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.lang.DynamicVector:forArray(array)
	local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
	if array ~= nil then
		local n = 0
		local m = #array
		do
			n = 0
			while n < m do
				local item = array[n + 1]
				if item ~= nil then
					do v:appendObject(item) end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.lang.DynamicVector:_construct0()
	jk.lang.DynamicVector._init(self)
	self.vector = {}
	return self
end

function jk.lang.DynamicVector:toVector()
	do return self.vector end
end

function jk.lang.DynamicVector:toVectorOfStrings()
	local v = {}
	if self.vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.vector)
		do
			n = 0
			while n < m do
				local o = self.vector[n + 1]
				if o ~= nil then
					local s = _g.jk.lang.String:asString(o)
					if s ~= nil then
						do _g.jk.lang.Vector:append(v, s) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.lang.DynamicVector:toVectorOfDynamicMaps()
	local v = {}
	if self.vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(self.vector)
		do
			n = 0
			while n < m do
				local o = _vm:to_table_with_key(self.vector[n + 1], '_isType.jk.lang.DynamicMap')
				if o ~= nil then
					do _g.jk.lang.Vector:append(v, o) end
				end
				do n = n + 1 end
			end
		end
	end
	do return v end
end

function jk.lang.DynamicVector:duplicate()
	local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
	local it = self:iterate()
	while it ~= nil do
		local o = it:next()
		if o == nil then
			do break end
		end
		do v:appendObject(o) end
	end
	do return v end
end

function jk.lang.DynamicVector:mergeDynamicVector(dynamicVector)
	if not (dynamicVector ~= nil) or dynamicVector:getSize() < 1 then
		do return self end
	end
	do return self:mergeVector(dynamicVector:toVector()) end
end

function jk.lang.DynamicVector:mergeVector(vector)
	if vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(vector)
		do
			n = 0
			while n < m do
				local item = vector[n + 1]
				if item ~= nil then
					do self:appendObject(item) end
				end
				do n = n + 1 end
			end
		end
	end
	do return self end
end

function jk.lang.DynamicVector:appendObject(object)
	do _g.jk.lang.Vector:append(self.vector, object) end
	do return self end
end

function jk.lang.DynamicVector:appendString(string)
	do _g.jk.lang.Vector:append(self.vector, string) end
	do return self end
end

function jk.lang.DynamicVector:appendInteger(value)
	do _g.jk.lang.Vector:append(self.vector, _g.jk.lang.Integer:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:appendLong(value)
	do _g.jk.lang.Vector:append(self.vector, _g.jk.lang.LongInteger:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:appendBoolean(value)
	do _g.jk.lang.Vector:append(self.vector, _g.jk.lang.Boolean:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:appendDouble(value)
	do _g.jk.lang.Vector:append(self.vector, _g.jk.lang.Double:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:setObject(index, object)
	do _g.jk.lang.Vector:set(self.vector, index, object) end
	do return self end
end

function jk.lang.DynamicVector:setInteger(index, value)
	do _g.jk.lang.Vector:set(self.vector, index, _g.jk.lang.Integer:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:setLong(index, value)
	do _g.jk.lang.Vector:set(self.vector, index, _g.jk.lang.LongInteger:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:setBoolean(index, value)
	do _g.jk.lang.Vector:set(self.vector, index, _g.jk.lang.Boolean:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:setDouble(index, value)
	do _g.jk.lang.Vector:set(self.vector, index, _g.jk.lang.Double:asObject(value)) end
	do return self end
end

function jk.lang.DynamicVector:get(index)
	do return _g.jk.lang.Vector:getAt(self.vector, index) end
end

function jk.lang.DynamicVector:getString(index, defval)
	local v = _g.jk.lang.String:asString(self:get(index))
	if v == nil then
		do return defval end
	end
	do return v end
end

function jk.lang.DynamicVector:getInteger(index, defval)
	local vv = self:get(index)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.Integer:asInteger(vv) end
end

function jk.lang.DynamicVector:getLongInteger(index, defval)
	local vv = self:get(index)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.LongInteger:asLong(vv) end
end

function jk.lang.DynamicVector:getBoolean(index, defval)
	local vv = self:get(index)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.Boolean:asBoolean(vv, false) end
end

function jk.lang.DynamicVector:getDouble(index, defval)
	local vv = self:get(index)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.Double:asDouble(vv) end
end

function jk.lang.DynamicVector:getMap(index)
	do return _vm:to_table_with_key(self:get(index), '_isType.jk.lang.DynamicMap') end
end

function jk.lang.DynamicVector:getVector(index)
	do return _vm:to_table_with_key(self:get(index), '_isType.jk.lang.DynamicVector') end
end

function jk.lang.DynamicVector:iterate()
	local v = _g.jk.lang.Vector:iterate(self.vector)
	do return v end
end

function jk.lang.DynamicVector:iterateReverse()
	local v = _g.jk.lang.Vector:iterateReverse(self.vector)
	do return v end
end

function jk.lang.DynamicVector:remove(index)
	do _g.jk.lang.Vector:remove(self.vector, index) end
end

function jk.lang.DynamicVector:removeValue(value)
	do _g.jk.lang.Vector:removeValue(self.vector, value) end
end

function jk.lang.DynamicVector:clear()
	do _g.jk.lang.Vector:clear(self.vector) end
end

function jk.lang.DynamicVector:contains(object)
	do return _g.jk.lang.Vector:contains(self.vector, object) end
end

function jk.lang.DynamicVector:getSize()
	do return _g.jk.lang.Vector:getSize(self.vector) end
end

function jk.lang.DynamicVector:setCapacity(capacity)
	do _g.jk.lang.Vector:setCapacity(self.vector, capacity) end
end

function jk.lang.DynamicVector:sort()
	do _g.jk.lang.Vector:sort(self.vector, function(a, b)
		do return _g.jk.lang.String:compare(_g.jk.lang.String:asString(a), _g.jk.lang.String:asString(b)) end
	end) end
end

function jk.lang.DynamicVector:sortWithComparer(comparer)
	if comparer == nil then
		do self:sort() end
		do return end
	end
	do _g.jk.lang.Vector:sort(self.vector, comparer) end
end

function jk.lang.DynamicVector:sortReverse()
	do _g.jk.lang.Vector:sortReverse(self.vector, function(a, b)
		do return _g.jk.lang.String:compare(_g.jk.lang.String:asString(a), _g.jk.lang.String:asString(b)) end
	end) end
end

function jk.lang.DynamicVector:sortReverseWithComparer(comparer)
	if comparer == nil then
		do self:sortReverse() end
		do return end
	end
	do _g.jk.lang.Vector:sortReverse(self.vector, comparer) end
end

jk.lang.Queue = {}
jk.lang.Queue.__index = jk.lang.Queue
_vm:set_metatable(jk.lang.Queue, {})

function jk.lang.Queue._create()
	local v = _vm:set_metatable({}, jk.lang.Queue)
	return v
end

function jk.lang.Queue:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Queue'
	self['_isType.jk.lang.Queue'] = true
	self.data = nil
end

function jk.lang.Queue:_construct0()
	jk.lang.Queue._init(self)
	self.data = {}
	return self
end

function jk.lang.Queue:clear()
	self.data = {}
end

function jk.lang.Queue:push(o)
	do _g.jk.lang.Vector:append(self.data, o) end
end

function jk.lang.Queue:pop()
	local sz = _g.jk.lang.Vector:getSize(self.data)
	if sz < 1 then
		do return nil end
	end
	do
		local v = _g.jk.lang.Vector:getAt(self.data, 0)
		do _g.jk.lang.Vector:remove(self.data, 0) end
		do return v end
	end
end

function jk.lang.Queue:peek()
	local sz = _g.jk.lang.Vector:getSize(self.data)
	if sz < 1 then
		do return nil end
	end
	do return _g.jk.lang.Vector:getAt(self.data, 0) end
end

function jk.lang.Queue:isEmpty()
	do return self:getSize() < 1 end
end

function jk.lang.Queue:getSize()
	do return _g.jk.lang.Vector:getSize(self.data) end
end

function jk.lang.Queue:getData()
	do return self.data end
end

function jk.lang.Queue:setData(v)
	self.data = v
	do return self end
end

jk.lang.Vector = {}
jk.lang.Vector.__index = jk.lang.Vector
_vm:set_metatable(jk.lang.Vector, {})

function jk.lang.Vector._create()
	local v = _vm:set_metatable({}, jk.lang.Vector)
	return v
end

function jk.lang.Vector:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Vector'
	self['_isType.jk.lang.Vector'] = true
end

function jk.lang.Vector:_construct0()
	jk.lang.Vector._init(self)
	return self
end

function jk.lang.Vector:asVector(obj)
	local vo = _vm:to_table_with_key(obj, '_isType.jk.lang.VectorObject')
	if not (vo ~= nil) then
		do return nil end
	end
	do return vo:toVector() end
end

function jk.lang.Vector:asObjectVector(o)
	local it = _g.jk.lang.DynamicObject:iterate(o)
	if not (it ~= nil) then
		do return nil end
	end
	do
		local v = {}
		while true do
			local oo = it:next()
			if not (oo ~= nil) then
				do break end
			end
			do _g.jk.lang.Vector:append(v, oo) end
		end
		do return v end
	end
end

function jk.lang.Vector:forIterator(iterator)
	if not (iterator ~= nil) then
		do return nil end
	end
	do
		local v = {}
		while true do
			local o = iterator:next()
			if o == nil then
				do break end
			end
			do _g.jk.lang.Vector:append(v, o) end
		end
		do return v end
	end
end

function jk.lang.Vector:forArray(array)
	if not (array ~= nil) then
		do return nil end
	end
	do
		local v = {}
		do
			local n = 0
			while n < #array do
				do _g.jk.lang.Vector:append(v, array[n + 1]) end
				do n = n + 1 end
			end
		end
		do return v end
	end
end

function jk.lang.Vector:toVectorOfObject(collection)
	if not (collection ~= nil) then
		do return nil end
	end
	do
		local nvec = {}
		if collection ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(collection)
			do
				n = 0
				while n < m do
					local item = collection[n + 1]
					if item ~= nil then
						do _g.jk.lang.Vector:append(nvec, item) end
					end
					do n = n + 1 end
				end
			end
		end
		do return nvec end
	end
end

function jk.lang.Vector:dupObjectVector(vector)
	if not (vector ~= nil) then
		do return nil end
	end
	do
		local v = {}
		if vector ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(vector)
			do
				n = 0
				while n < m do
					local o = vector[n + 1]
					if o ~= nil then
						do _g.jk.lang.Vector:append(v, o) end
					end
					do n = n + 1 end
				end
			end
		end
		do return v end
	end
end

function jk.lang.Vector:contains(vector, object)
	if not (vector ~= nil) then
		do return false end
	end
	if vector ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(vector)
		do
			n = 0
			while n < m do
				local oo = vector[n + 1]
				if oo ~= nil then
					if object == oo then
						do return true end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return false end
end

function jk.lang.Vector:append(vector, object)
	do local sz = vector["n"] or 0 vector[sz + 1] = object vector["n"] = sz + 1 end
end

function jk.lang.Vector:prepend(vector, object)
	do _g.jk.lang.Vector:insert(vector, object, 0) end
end

function jk.lang.Vector:insert(vector, object, index)
	do local sz = vector["n"] or 0 _vm:insert_to_indexed_table(vector, index + 1, object) vector["n"] = sz + 1 end
end

function jk.lang.Vector:setCapacity(vector, capacity)
	if not (vector ~= nil) then
		do return end
	end
end

function jk.lang.Vector:setSize(vector, newSize)
	if not (vector ~= nil) then
		do return nil end
	end
	do
		local sz = newSize
		if sz < 0 then
			sz = 0
		end
		do
			local osz = _g.jk.lang.Vector:getSize(vector)
			if sz == osz then
				do return vector end
			end
			if sz < osz then
				do
					local n = osz - 1
					while n >= sz do
						do _g.jk.lang.Vector:remove(vector, n) end
						do n = n - 1 end
					end
				end
			else
				do
					local n = osz
					while n < sz do
						do _g.jk.lang.Vector:append(vector, nil) end
						do n = n + 1 end
					end
				end
			end
			do return vector end
		end
	end
end

function jk.lang.Vector:getSize(vector)
	if vector == nil then
		do return 0 end
	end
	do return vector["n"] or 0 end
end

function jk.lang.Vector:getAt(vector, index)
	do return _g.jk.lang.Vector:get(vector, index) end
end

function jk.lang.Vector:get(vector, index)
	if index < 0 or index >= _g.jk.lang.Vector:getSize(vector) then
		do return nil end
	end
	do return vector[index + 1] end
end

function jk.lang.Vector:getFirst(vector)
	do return _g.jk.lang.Vector:get(vector, 0) end
end

function jk.lang.Vector:getLast(vector)
	do return _g.jk.lang.Vector:get(vector, _g.jk.lang.Vector:getSize(vector) - 1) end
end

function jk.lang.Vector:set(vector, index, val)
	if index < 0 or index >= _g.jk.lang.Vector:getSize(vector) then
		do return end
	end
	do vector[index + 1]  = val end
end

function jk.lang.Vector:remove(vector, index)
	local sz = _g.jk.lang.Vector:getSize(vector)
	if index < 0 or index >= sz then
		do return nil end
	end
	do _vm:remove_from_indexed_table(vector, index+1) vector["n"] = sz - 1 end
end

function jk.lang.Vector:popFirst(vector)
	if vector == nil or _g.jk.lang.Vector:getSize(vector) < 1 then
		do return nil end
	end
	do
		local v = _g.jk.lang.Vector:get(vector, 0)
		do _g.jk.lang.Vector:removeFirst(vector) end
		do return v end
	end
end

function jk.lang.Vector:removeFirst(vector)
	if vector == nil or _g.jk.lang.Vector:getSize(vector) < 1 then
		do return end
	end
	do _g.jk.lang.Vector:remove(vector, 0) end
end

function jk.lang.Vector:popLast(vector)
	local sz = _g.jk.lang.Vector:getSize(vector)
	if vector == nil or sz < 1 then
		do return nil end
	end
	do
		local v = _g.jk.lang.Vector:get(vector, sz - 1)
		do _g.jk.lang.Vector:removeLast(vector) end
		do return v end
	end
end

function jk.lang.Vector:removeLast(vector)
	if vector == nil then
		do return end
	end
	do
		local sz = _g.jk.lang.Vector:getSize(vector)
		if sz < 1 then
			do return end
		end
		do _g.jk.lang.Vector:remove(vector, sz - 1) end
	end
end

function jk.lang.Vector:removeValue(vector, value)
	local n = 0
	do
		n = 0
		while n < _g.jk.lang.Vector:getSize(vector) do
			if vector[n + 1] == value then
				do _g.jk.lang.Vector:remove(vector, n) end
				do return n end
			end
			do n = n + 1 end
		end
	end
	do return -1 end
end

function jk.lang.Vector:clear(vector)
	do _vm:clear_table(vector) vector["n"] = 0 end
end

function jk.lang.Vector:isEmpty(vector)
	if vector == nil then
		do return true end
	end
	do
		local v = false
		do local sz = vector["n"] if sz == nil or sz < 1 then v = true end end
		do return v end
	end
end

function jk.lang.Vector:isNotEmpty(vector)
	do return not _g.jk.lang.Vector:isEmpty(vector) end
end

function jk.lang.Vector:removeRange(vector, index, count)
	do
		local n = 0
		while n < count do
			do _g.jk.lang.Vector:remove(vector, index) end
			do n = n + 1 end
		end
	end
end

jk.lang.Vector.VectorIterator = {}
jk.lang.Vector.VectorIterator.__index = jk.lang.Vector.VectorIterator
_vm:set_metatable(jk.lang.Vector.VectorIterator, {})

function jk.lang.Vector.VectorIterator._create()
	local v = _vm:set_metatable({}, jk.lang.Vector.VectorIterator)
	return v
end

function jk.lang.Vector.VectorIterator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Vector.VectorIterator'
	self['_isType.jk.lang.Vector.VectorIterator'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.vector = nil
	self.index = 0
	self.increment = 1
end

function jk.lang.Vector.VectorIterator:_construct0()
	jk.lang.Vector.VectorIterator._init(self)
	return self
end

function jk.lang.Vector.VectorIterator:_construct2(vector, increment)
	jk.lang.Vector.VectorIterator._init(self)
	self.vector = vector
	self.increment = increment
	if increment < 0 and vector ~= nil then
		self.index = _g.jk.lang.Vector:getSize(vector) - 1
	end
	return self
end

function jk.lang.Vector.VectorIterator:next()
	if self.vector == nil then
		do return nil end
	end
	if self.index < 0 or self.index >= _g.jk.lang.Vector:getSize(self.vector) then
		do return nil end
	end
	do
		local v = self.vector[self.index + 1]
		self.index = self.index + self.increment
		do return v end
	end
end

function jk.lang.Vector.VectorIterator:hasNext()
	if not (self.vector ~= nil) then
		do return false end
	end
	if not (self.index < _g.jk.lang.Vector:getSize(self.vector)) then
		do return false end
	end
	do return true end
end

function jk.lang.Vector:iterate(vector)
	do return _g.jk.lang.Vector.VectorIterator._construct2(_g.jk.lang.Vector.VectorIterator._create(), vector, 1) end
end

function jk.lang.Vector:iterateReverse(vector)
	do return _g.jk.lang.Vector.VectorIterator._construct2(_g.jk.lang.Vector.VectorIterator._create(), vector, -1) end
end

function jk.lang.Vector:sort(vector, comparer)
	if not (vector ~= nil) then
		do return end
	end
	do _vm:sort_table(vector, comparer) end
end

function jk.lang.Vector:sortReverse(vector, comparer)
	local cc = comparer
	do _g.jk.lang.Vector:sort(vector, function(a, b)
		do return -cc(a, b) end
	end) end
end

function jk.lang.Vector:sortAsStrings(vector)
	do _g.jk.lang.Vector:sort(vector, function(a, b)
		do return _g.jk.lang.String:compare(_g.jk.lang.String:asString(a), _g.jk.lang.String:asString(b)) end
	end) end
end

function jk.lang.Vector:sortAsStringsReverse(vector)
	do _g.jk.lang.Vector:sortReverse(vector, function(a, b)
		do return _g.jk.lang.String:compare(_g.jk.lang.String:asString(a), _g.jk.lang.String:asString(b)) end
	end) end
end

function jk.lang.Vector:reverse(vector)
	if not (vector ~= nil) then
		do return end
	end
	do
		local a = 0
		local b = _g.jk.lang.Vector:getSize(vector) - 1
		while a < b do
			local t = _g.jk.lang.Vector:getAt(vector, b)
			do _g.jk.lang.Vector:set(vector, b, _g.jk.lang.Vector:getAt(vector, a)) end
			do _g.jk.lang.Vector:set(vector, a, t) end
			do a = a + 1 end
			do b = b - 1 end
		end
	end
end

jk.lang.BooleanObject = {}

jk.lang.Boolean = {}
jk.lang.Boolean.__index = jk.lang.Boolean
_vm:set_metatable(jk.lang.Boolean, {})

function jk.lang.Boolean._create()
	local v = _vm:set_metatable({}, jk.lang.Boolean)
	return v
end

function jk.lang.Boolean:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Boolean'
	self['_isType.jk.lang.Boolean'] = true
	self['_isType.jk.lang.BooleanObject'] = true
	self.value = false
end

function jk.lang.Boolean:_construct0()
	jk.lang.Boolean._init(self)
	return self
end

function jk.lang.Boolean:asObject(value)
	local v = _g.jk.lang.Boolean._construct0(_g.jk.lang.Boolean._create())
	do v:setValue(value) end
	do return v end
end

function jk.lang.Boolean:asBoolean(obj, default)
	if obj == nil then
		do return false end
	end
	if (_vm:get_variable_type(obj) == 'boolean') then
		do return obj end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.BooleanObject') ~= nil) then
		local bo = obj
		do return bo:toBoolean() end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		if _util:convert_to_integer(obj) == 0 then
			do return false end
		end
		do return true end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.IntegerObject') ~= nil) then
		if obj:toInteger() == 0 then
			do return false end
		end
		do return true end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		if _util:convert_to_integer(obj) == 0 then
			do return false end
		end
		do return true end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.LongIntegerObject') ~= nil) then
		if obj:toLong() == 0 then
			do return false end
		end
		do return true end
	end
	if (_vm:get_variable_type(obj) == 'string') then
		local str = _g.jk.lang.String:toLowerCase(obj)
		if str == "yes" or str == "true" or str == "1" then
			do return true end
		end
		if str == "no" or str == "false" or str == "0" then
			do return false end
		end
		do return default end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.StringObject') ~= nil) then
		local str = obj:toString()
		if str ~= nil then
			str = _g.jk.lang.String:toLowerCase(str)
			if str == "yes" or str == "true" or str == "1" then
				do return true end
			end
			if str == "no" or str == "false" or str == "0" then
				do return false end
			end
		end
		do return default end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		if obj == 0.0 then
			do return false end
		end
		do return true end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.DoubleObject') ~= nil) then
		if obj:toDouble() == 0.0 then
			do return false end
		end
		do return true end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		if _util:convert_to_integer(obj) == 0 then
			do return false end
		end
		do return true end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.CharacterObject') ~= nil) then
		if _util:convert_to_integer(obj:toCharacter()) == 0 then
			do return false end
		end
		do return true end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.ObjectWithSize') ~= nil) then
		local sz = obj:getSize()
		if sz == 0 then
			do return false end
		end
		do return true end
	end
	do return default end
end

function jk.lang.Boolean:toBoolean()
	do return self.value end
end

function jk.lang.Boolean:getValue()
	do return self.value end
end

function jk.lang.Boolean:setValue(v)
	self.value = v
	do return self end
end

jk.lang.TimeValue = {}
jk.lang.TimeValue.__index = jk.lang.TimeValue
_vm:set_metatable(jk.lang.TimeValue, {})

function jk.lang.TimeValue._create()
	local v = _vm:set_metatable({}, jk.lang.TimeValue)
	return v
end

function jk.lang.TimeValue:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.TimeValue'
	self['_isType.jk.lang.TimeValue'] = true
	self.seconds = 0
	self.microSeconds = 0
end

function jk.lang.TimeValue:_construct0()
	jk.lang.TimeValue._init(self)
	return self
end

function jk.lang.TimeValue:forSeconds(seconds)
	local v = _g.jk.lang.TimeValue._construct0(_g.jk.lang.TimeValue._create())
	v.seconds = seconds
	do return v end
end

function jk.lang.TimeValue:toString()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(_g.jk.lang.String:forLongInteger(self.seconds)) end
	do sb:appendCharacter(46) end
	do sb:appendString(_g.jk.lang.String:forLongInteger(self.microSeconds)) end
	do return sb:toString() end
end

function jk.lang.TimeValue:dup()
	local v = _g.jk.lang.TimeValue._construct0(_g.jk.lang.TimeValue._create())
	do v:copyFrom(self) end
	do return v end
end

function jk.lang.TimeValue:reset()
	self.seconds = 0
	self.microSeconds = 0
end

function jk.lang.TimeValue:copyFrom(tv)
	self.seconds = tv.seconds
	self.microSeconds = tv.microSeconds
end

function jk.lang.TimeValue:set(tv)
	self.seconds = tv:getSeconds()
	self.microSeconds = tv:getMicroSeconds()
end

function jk.lang.TimeValue:setSeconds(value)
	self.seconds = value
end

function jk.lang.TimeValue:setMilliSeconds(value)
	self.microSeconds = value * 1000
end

function jk.lang.TimeValue:setMicroSeconds(value)
	self.microSeconds = value
end

function jk.lang.TimeValue:add(s, us)
	local ts = self:getSeconds() + s
	local tus = self:getMicroSeconds() + us
	if tus > 1000000 then
		ts = ts + _util:convert_to_integer(tus / 1000000)
		tus = _util:convert_to_integer(tus % 1000000)
	end
	while tus < 0 do
		do ts = ts - 1 end
		tus = tus + 1000000
	end
	do
		local v = _g.jk.lang.TimeValue._construct0(_g.jk.lang.TimeValue._create())
		v.seconds = ts
		v.microSeconds = tus
		do return v end
	end
end

function jk.lang.TimeValue:addTimeValue(tv)
	if tv == nil then
		do return self end
	end
	do return self:add(tv:getSeconds(), tv:getMicroSeconds()) end
end

function jk.lang.TimeValue:subtract(tv)
	if tv == nil then
		do return self end
	end
	do return self:add(-tv:getSeconds(), -tv:getMicroSeconds()) end
end

function jk.lang.TimeValue:asMicroSeconds()
	do return self:getSeconds() * 1000000 + self:getMicroSeconds() end
end

function jk.lang.TimeValue:diff(a, b)
	if a == nil and b == nil then
		do return 0 end
	end
	if a == nil then
		do return b:asMicroSeconds() end
	end
	if b == nil then
		do return a:asMicroSeconds() end
	end
	do
		local r = (a.seconds - b.seconds) * 1000000 + (a.microSeconds - b.microSeconds)
		do return r end
	end
end

function jk.lang.TimeValue:diffDouble(a, b)
	do return _g.jk.lang.TimeValue:diff(a, b) / 1000000.0 end
end

function jk.lang.TimeValue:getSeconds()
	do return self.seconds end
end

function jk.lang.TimeValue:getMicroSeconds()
	do return self.microSeconds end
end

jk.lang.DynamicIterator = {}

jk.lang.String = {}
jk.lang.String.__index = jk.lang.String
_vm:set_metatable(jk.lang.String, {})

function jk.lang.String._create()
	local v = _vm:set_metatable({}, jk.lang.String)
	return v
end

function jk.lang.String:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.String'
	self['_isType.jk.lang.String'] = true
end

function jk.lang.String:_construct0()
	jk.lang.String._init(self)
	return self
end

function jk.lang.String:asString(obj)
	if not (obj ~= nil) then
		do return nil end
	end
	if (_vm:get_variable_type(obj) == 'string') then
		do return obj end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.StringObject') ~= nil) then
		local os = obj
		do return os:toString() end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _g.jk.lang.String:forInteger(_util:convert_to_integer(obj)) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.IntegerObject') ~= nil) then
		do return _g.jk.lang.String:forInteger(obj:toInteger()) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _g.jk.lang.String:forLongInteger(_util:convert_to_integer(obj)) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.LongIntegerObject') ~= nil) then
		do return _g.jk.lang.String:forLongInteger(obj:toLong()) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _g.jk.lang.String:forDouble(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.DoubleObject') ~= nil) then
		do return _g.jk.lang.String:forDouble(obj:toDouble()) end
	end
	if (_vm:get_variable_type(obj) == 'boolean') then
		do return _g.jk.lang.String:forBoolean(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.BooleanObject') ~= nil) then
		do return _g.jk.lang.String:forBoolean(obj:toBoolean()) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _g.jk.lang.String:forCharacter(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.CharacterObject') ~= nil) then
		do return _g.jk.lang.String:forCharacter(obj:toCharacter()) end
	end
	if _util:is_buffer(obj) then
		do return _g.jk.lang.String:forBufferHex(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.BufferObject') ~= nil) then
		local v = obj:toBuffer()
		if not (v ~= nil) then
			do return "" end
		end
		do return _g.jk.lang.String:forBufferHex(v) end
	end
	do return nil end
end

function jk.lang.String:forObject(obj)
	do return _g.jk.lang.String:asString(obj) end
end

function jk.lang.String:safeString(str)
	if not (str ~= nil) then
		do return "" end
	end
	do return str end
end

function jk.lang.String:isEmpty(str)
	if not (str ~= nil) then
		do return true end
	end
	if _util:get_string_length(str) < 1 then
		do return true end
	end
	do return false end
end

function jk.lang.String:isNotEmpty(str)
	do return not _g.jk.lang.String:isEmpty(str) end
end

function jk.lang.String:forBuffer(data, encoding)
	if not (data ~= nil) then
		do return nil end
	end
	if _g.jk.lang.String:equalsIgnoreCase("UTF8", encoding) or _g.jk.lang.String:equalsIgnoreCase("UTF-8", encoding) then
		do return _g.jk.lang.String:forUTF8Buffer(data) end
	end
	if _g.jk.lang.String:equalsIgnoreCase("UCS2", encoding) or _g.jk.lang.String:equalsIgnoreCase("UCS-2", encoding) then
		do return _g.jk.lang.String:forUCS2Buffer(data) end
	end
	if _g.jk.lang.String:equalsIgnoreCase("ASCII", encoding) then
		do return _g.jk.lang.String:forASCIIBuffer(data) end
	end
	do return nil end
end

function jk.lang.String:forASCIIBuffer(data)
	if not (data ~= nil) then
		do return nil end
	end
	do return _util:convert_buffer_ascii_to_string(data) end
end

function jk.lang.String:forUTF8Buffer(data)
	if not (data ~= nil) then
		do return nil end
	end
	do return _util:convert_buffer_to_string(data) end
end

function jk.lang.String:forUCS2Buffer(data)
	if data == nil then
		do return nil end
	end
	_io:write_to_stdout("[jk.lang.String.forUCS2Buffer] (String.sling:311:3): Not implemented." .. "\n")
	do return nil end
end

function jk.lang.String:forCharArray(chars, offset, count)
	if not (chars ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local sz = #chars
		do
			local n = 0
			while n < count and n + offset < sz do
				do sb:appendCharacter(chars[n + offset + 1]) end
				do n = n + 1 end
			end
		end
		do return sb:toString() end
	end
end

function jk.lang.String:forBoolean(vv)
	if vv == true then
		do return "true" end
	end
	do return "false" end
end

function jk.lang.String:forInteger(vv)
	do return _util:create_decimal_string_for_integer(vv) end
end

function jk.lang.String:forLongInteger(vv)
	do return _util:create_decimal_string_for_integer(vv) end
end

function jk.lang.String:forIntegerWithPadding(vv, length, paddingString)
	local r = _g.jk.lang.String:forInteger(vv)
	if not (r ~= nil) then
		do return nil end
	end
	do
		local ll = _g.jk.lang.String:getLength(r)
		if ll >= length then
			do return r end
		end
		do
			local ps = paddingString
			if ps == nil then
				ps = "0"
			end
			do
				local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				local n = 0
				do
					n = 0
					while n < length - ll do
						do sb:appendString(ps) end
						do n = n + 1 end
					end
				end
				do sb:appendString(r) end
				do return sb:toString() end
			end
		end
	end
end

function jk.lang.String:forIntegerHex(vv, minlength)
	local v = nil
	v = _util:create_hex_string_for_integer(vv)
	if not (v ~= nil) then
		do return nil end
	end
	if minlength > 0 then
		while _g.jk.lang.String:getLength(v) < minlength do
			v = "0" .. _g.jk.lang.String:safeString(v)
		end
	end
	do return v end
end

function jk.lang.String:forLongIntegerHex(vv, minlength)
	local v = nil
	v = _util:create_hex_string_for_integer(vv)
	if not (v ~= nil) then
		do return nil end
	end
	if minlength > 0 then
		while _g.jk.lang.String:getLength(v) < minlength do
			v = "0" .. _g.jk.lang.String:safeString(v)
		end
	end
	do return v end
end

function jk.lang.String:forIntegerOctal(vv)
	local v = nil
	v = _util:create_octal_string_for_integer(vv)
	do return v end
end

function jk.lang.String:forIntegerBinary(vv)
	local v = nil
	_io:write_to_stdout("[jk.lang.String.forIntegerBinary] (String.sling:605:3): Not implemented" .. "\n")
	do return nil end
end

function jk.lang.String:forBufferHex(buffer)
	local size = _g.jk.lang.Buffer:getSize(buffer)
	if not (size ~= 0) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local p = 0
		while p < size do
			local s = _g.jk.lang.String:forIntegerHex(_g.jk.lang.Buffer:getByte(buffer, p), 0)
			if _g.jk.lang.String:getLength(s) < 2 then
				do sb:appendCharacter(48) end
			end
			do sb:appendString(s) end
			do p = p + 1 end
		end
		do return sb:toString() end
	end
end

function jk.lang.String:forCharacter(vv)
	if vv < 128 then
		do return _util:create_string_for_byte(vv) end
	end
	if vv < 2048 then
		local v1 = _vm:bitwise_or(192, _vm:bitwise_right_shift(vv, 6))
		local v2 = _vm:bitwise_or(128, _vm:bitwise_and(vv, 63))
		do return _util:create_string_for_byte(v1) .. _util:create_string_for_byte(v2) end
	end
	if vv < 65536 then
		local v1 = _vm:bitwise_or(224, _vm:bitwise_right_shift(vv, 12))
		local v2 = _vm:bitwise_or(128, _vm:bitwise_and(_vm:bitwise_right_shift(vv, 6), 63))
		local v3 = _vm:bitwise_or(128, _vm:bitwise_and(vv, 63))
		do return _util:create_string_for_byte(v1) .. _util:create_string_for_byte(v2) .. _util:create_string_for_byte(v3) end
	end
	do
		local v1 = _vm:bitwise_or(240, _vm:bitwise_right_shift(vv, 18))
		local v2 = _vm:bitwise_or(128, _vm:bitwise_and(_vm:bitwise_right_shift(vv, 12), 63))
		local v3 = _vm:bitwise_or(128, _vm:bitwise_and(_vm:bitwise_right_shift(vv, 6), 63))
		local v4 = _vm:bitwise_or(128, _vm:bitwise_and(vv, 63))
		do return _util:create_string_for_byte(v1) .. _util:create_string_for_byte(v2) .. _util:create_string_for_byte(v3) .. _util:create_string_for_byte(v4) end
	end
end

function jk.lang.String:forFloat(vv)
	do return _util:create_string_for_float(vv) end
end

function jk.lang.String:forDouble(vv)
	do return _util:create_string_for_float(vv) end
end

function jk.lang.String:toUTF8Buffer(str)
	if not (str ~= nil) then
		do return nil end
	end
	do return _util:convert_string_to_buffer(str) end
end

function jk.lang.String:toBuffer(str, charset)
	if not (str ~= nil) then
		do return nil end
	end
	if not (charset ~= nil) then
		do return nil end
	end
	if _g.jk.lang.String:equalsIgnoreCase("UTF8", charset) or _g.jk.lang.String:equalsIgnoreCase("UTF-8", charset) then
		do return _g.jk.lang.String:toUTF8Buffer(str) end
	end
	do
		local bytes = _g.jk.lang.String:getBytesUnsigned(str, charset)
		if not (bytes ~= nil) then
			do return nil end
		end
		do
			local c = #bytes
			local bb = _util:allocate_buffer(c)
			local n = 0
			do
				n = 0
				while n < c do
					do _g.jk.lang.Buffer:setByte(bb, n, bytes[n + 1]) end
					do n = n + 1 end
				end
			end
			do return bb end
		end
	end
end

function jk.lang.String:getBytesUnsignedUTF8(str)
	do return _g.jk.lang.String:getBytesUnsigned(str, "UTF-8") end
end

function jk.lang.String:getBytesUnsigned(str, charset)
	if not (str ~= nil) then
		do return nil end
	end
	if not (charset ~= nil) then
		do return nil end
	end
	_io:write_to_stdout("[jk.lang.String.getBytesUnsigned] (String.sling:937:3): Not implemented" .. "\n")
	do return nil end
end

function jk.lang.String:getBytesSignedUTF8(str)
	do return _g.jk.lang.String:getBytesSigned(str, "UTF-8") end
end

function jk.lang.String:getBytesSigned(str, charset)
	if str == nil or charset == nil then
		do return nil end
	end
	_io:write_to_stdout("[jk.lang.String.getBytesSigned] (String.sling:987:3): Not implemented" .. "\n")
	do return nil end
end

function jk.lang.String:getLength(str)
	if str == nil then
		do return 0 end
	end
	do return _util:get_utf8_character_count(str) end
end

function jk.lang.String:appendString(str1, str2)
	if str1 == nil then
		do return str2 end
	end
	if str2 == nil then
		do return str1 end
	end
	do return str1 .. str2 end
end

function jk.lang.String:appendInteger(str, intvalue)
	do return _g.jk.lang.String:appendString(str, _g.jk.lang.String:forInteger(intvalue)) end
end

function jk.lang.String:appendCharacter(str, charvalue)
	do return _g.jk.lang.String:appendString(str, _g.jk.lang.String:forCharacter(charvalue)) end
end

function jk.lang.String:appendFloat(str, floatvalue)
	do return _g.jk.lang.String:appendString(str, _g.jk.lang.String:forFloat(floatvalue)) end
end

function jk.lang.String:appendDouble(str, doublevalue)
	do return _g.jk.lang.String:appendString(str, _g.jk.lang.String:forDouble(doublevalue)) end
end

function jk.lang.String:appendBoolean(str, boolvalue)
	do return _g.jk.lang.String:appendString(str, _g.jk.lang.String:forBoolean(boolvalue)) end
end

function jk.lang.String:toLowerCase(str)
	if not (str ~= nil) then
		do return nil end
	end
	do return _util:change_string_to_lowercase(str) end
end

function jk.lang.String:toUpperCase(str)
	if not (str ~= nil) then
		do return nil end
	end
	do return _util:change_string_to_uppercase(str) end
end

function jk.lang.String:capitalize(str)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local c = _g.jk.lang.String:getChar(str, 0)
		if _g.jk.lang.Character:isLowercaseAlpha(c) == false then
			do return str end
		end
		do return _g.jk.lang.String:safeString(_g.jk.lang.String:forCharacter(_g.jk.lang.Character:toUppercase(c))) .. _g.jk.lang.String:safeString(_g.jk.lang.String:getEndOfString(str, 1)) end
	end
end

function jk.lang.String:getChar(str, index)
	if str == nil or index < 0 then
		do return 0 end
	end
	do
		local it = _g.jk.lang.String:iterate(str)
		local n = 0
		while it ~= nil do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			if n == index then
				do return c end
			end
			do n = n + 1 end
		end
		do return 0 end
	end
end

function jk.lang.String:equals(str1, str2)
	if str1 == nil and str2 == nil then
		do return true end
	end
	if not (str1 ~= nil and str2 ~= nil) then
		do return false end
	end
	do return str1 == str2 end
end

function jk.lang.String:isNotEqual(str1, str2)
	do return not _g.jk.lang.String:equals(str1, str2) end
end

function jk.lang.String:equalsIgnoreCase(str1, str2)
	if str1 == nil and str2 == nil then
		do return true end
	end
	if not (str1 ~= nil and str2 ~= nil) then
		do return false end
	end
	do return 0 == _util:compare_string_ignore_case(str1, str2) end
end

function jk.lang.String:compare(str1, str2)
	if str1 == nil or str2 == nil then
		do return 0 end
	end
	do
		local it1 = _g.jk.lang.String:iterate(str1)
		local it2 = _g.jk.lang.String:iterate(str2)
		if it1 == nil or it2 == nil then
			do return 0 end
		end
		while true do
			if it1:hasEnded() and it2:hasEnded() then
				do break end
			end
			if it1:hasEnded() then
				do return -1 end
			end
			if it2:hasEnded() then
				do return 1 end
			end
			do
				local c1 = it1:getNextChar()
				local c2 = it2:getNextChar()
				if c1 < c2 then
					do return -1 end
				end
				if c1 > c2 then
					do return 1 end
				end
			end
		end
		do return 0 end
	end
end

function jk.lang.String:compareToIgnoreCase(str1, str2)
	if str1 == nil or str2 == nil then
		do return 0 end
	end
	do
		local it1 = _g.jk.lang.String:iterate(str1)
		local it2 = _g.jk.lang.String:iterate(str2)
		if it1 == nil or it2 == nil then
			do return 0 end
		end
		while true do
			if it1:hasEnded() and it2:hasEnded() then
				do break end
			end
			if it1:hasEnded() then
				do return -1 end
			end
			if it2:hasEnded() then
				do return 1 end
			end
			do
				local c1 = _g.jk.lang.Character:toLowercase(it1:getNextChar())
				local c2 = _g.jk.lang.Character:toLowercase(it2:getNextChar())
				if c1 < c2 then
					do return -1 end
				end
				if c1 > c2 then
					do return 1 end
				end
			end
		end
		do return 0 end
	end
end

function jk.lang.String:getHashCode(str)
	if str == nil then
		do return 0 end
	end
	do
		local hash = 0
		local it = _g.jk.lang.String:iterate(str)
		while it ~= nil do
			local ch = it:getNextChar()
			if _g.jk.lang.Character:isEOF(ch) then
				do break end
			end
			hash = _vm:bitwise_left_shift(hash, 5) - hash + ch
			hash = _vm:bitwise_and(hash, hash)
		end
		do return hash end
	end
end

function jk.lang.String:getIndexOfCharacter(str, c, start)
	if str == nil or c == 0 then
		do return -1 end
	end
	do return _util:get_index_of_character(str, c, start) end
end

function jk.lang.String:getIndexOfString(str, s, start)
	if str == nil or s == nil then
		do return -1 end
	end
	if _g.jk.lang.String:isEmpty(s) then
		do return 0 end
	end
	do return _util:get_index_of_substring(str, s, start) end
end

function jk.lang.String:getLastIndexOfCharacter(str, c, start)
	if str == nil then
		do return -1 end
	end
	do
		local ss = start
		if ss < 0 then
			ss = 0
		end
		do
			local ii = _g.jk.lang.String:getIndexOfCharacter(str, c, ss)
			if ii >= 0 then
				while true do
					local ix = _g.jk.lang.String:getIndexOfCharacter(str, c, ii + 1)
					if ix < 0 then
						do break end
					end
					ii = ix
				end
			end
			do return ii end
		end
	end
end

function jk.lang.String:getLastIndexOfString(str, s, start)
	if str == nil then
		do return -1 end
	end
	do
		local ss = start
		if ss < 0 then
			ss = 0
		end
		do
			local ii = _g.jk.lang.String:getIndexOfString(str, s, ss)
			if ii >= 0 then
				while true do
					local ix = _g.jk.lang.String:getIndexOfString(str, s, ii + 1)
					if ix < 0 then
						do break end
					end
					ii = ix
				end
			end
			do return ii end
		end
	end
end

function jk.lang.String:getEndOfString(str, start)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local ss = start
		if ss < 0 then
			ss = 0
		end
		do return _util:get_substring(str, ss, #str) end
	end
end

function jk.lang.String:getSubString(str, start, length)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local ss = start
		if ss < 0 then
			ss = 0
		end
		do
			local v = _util:get_substring(str, ss, ss+length)
			if not (v ~= nil) then
				v = ""
			end
			do return v end
		end
	end
end

function jk.lang.String:contains(str1, str2)
	if not (str1 ~= nil) then
		do return false end
	end
	if not (str2 ~= nil) then
		do return false end
	end
	if _g.jk.lang.String:getIndexOfString(str1, str2, 0) >= 0 then
		do return true end
	end
	do return false end
end

function jk.lang.String:startsWith(str1, str2, offset)
	if not (str1 ~= nil) then
		do return false end
	end
	if not (str2 ~= nil) then
		do return false end
	end
	do
		local nstr = nil
		if offset > 0 then
			nstr = _g.jk.lang.String:getEndOfString(str1, offset)
		else
			nstr = str1
		end
		do return _util:string_starts_with(str1, str2, offset) end
	end
end

function jk.lang.String:startsWithAny(str, strings)
	if strings ~= nil then
		local n = 0
		local m = #strings
		do
			n = 0
			while n < m do
				local str2 = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(strings[n + 1])
				if str2 ~= nil then
					if _g.jk.lang.String:startsWith(str, str2, 0) then
						do return str2 end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return nil end
end

function jk.lang.String:startsWithIgnoreCase(str1, str2, offset)
	do return _g.jk.lang.String:startsWith(_g.jk.lang.String:toLowerCase(str1), _g.jk.lang.String:toLowerCase(str2), offset) end
end

function jk.lang.String:startsWithAnyIgnoreCase(str, strings)
	local ostr = _g.jk.lang.String:toLowerCase(str)
	if strings ~= nil then
		local n = 0
		local m = #strings
		do
			n = 0
			while n < m do
				local str2 = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(strings[n + 1])
				if str2 ~= nil then
					if _g.jk.lang.String:startsWith(ostr, _g.jk.lang.String:toLowerCase(str2), 0) then
						do return str2 end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return nil end
end

function jk.lang.String:endsWith(str1, str2)
	if not (str1 ~= nil) then
		do return false end
	end
	if not (str2 ~= nil) then
		do return false end
	end
	do
		local s1 = _util:get_utf8_character_count(str1)
		do return _util:get_substring(str1, s1 -_util:get_utf8_character_count(str2), s1) == str2 end
	end
end

function jk.lang.String:endsWithAny(str, strings)
	if strings ~= nil then
		local n = 0
		local m = #strings
		do
			n = 0
			while n < m do
				local str2 = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(strings[n + 1])
				if str2 ~= nil then
					if _g.jk.lang.String:endsWith(str, str2) then
						do return str2 end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return nil end
end

function jk.lang.String:endsWithIgnoreCase(str1, str2)
	do return _g.jk.lang.String:endsWith(_g.jk.lang.String:toLowerCase(str1), _g.jk.lang.String:toLowerCase(str2)) end
end

function jk.lang.String:endsWithAnyIgnoreCase(str, strings)
	local ostr = _g.jk.lang.String:toLowerCase(str)
	if strings ~= nil then
		local n = 0
		local m = #strings
		do
			n = 0
			while n < m do
				local str2 = (function(o)
					if (_vm:get_variable_type(o) == 'string') then
						do return o end
					end
					do return nil end
				end)(strings[n + 1])
				if str2 ~= nil then
					if _g.jk.lang.String:endsWith(ostr, _g.jk.lang.String:toLowerCase(str2)) then
						do return str2 end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return nil end
end

function jk.lang.String:strip(str)
	if not (str ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.String:stripFromStart(_g.jk.lang.String:stripFromEnd(str)) end
end

function jk.lang.String:stripFromEnd(str)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local ll = _g.jk.lang.String:getLength(str)
		if ll < 1 then
			do return str end
		end
		do
			local n = 0
			while true do
				local c = _g.jk.lang.String:getChar(str, ll - 1 - n)
				if c == 32 or c == 9 or c == 13 or c == 10 then
					do n = n + 1 end
				else
					do break end
				end
			end
			if n < 1 then
				do return str end
			end
			do return _g.jk.lang.String:getSubString(str, 0, ll - n) end
		end
	end
end

function jk.lang.String:stripFromStart(str)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local n = 0
		while true do
			local c = _g.jk.lang.String:getChar(str, n)
			if c == 32 or c == 9 or c == 13 or c == 10 then
				do n = n + 1 end
			else
				do break end
			end
		end
		if n < 1 then
			do return str end
		end
		do return _g.jk.lang.String:getEndOfString(str, n) end
	end
end

function jk.lang.String:replaceCharacter(str, oldChar, newChar)
	if not (str ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.String:replaceString(str, _g.jk.lang.String:forCharacter(oldChar), _g.jk.lang.String:forCharacter(newChar)) end
end

function jk.lang.String:replaceString(str, target, replacement)
	if not (str ~= nil) then
		do return nil end
	end
	if _g.jk.lang.String:isEmpty(target) then
		do return str end
	end
	do
		local rr = replacement
		if not (rr ~= nil) then
			rr = ""
		end
		do
			local v = str
			while true do
				local p = _g.jk.lang.String:getIndexOfString(v, target, 0)
				if p < 0 then
					do break end
				end
				do
					local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do sb:appendString(_g.jk.lang.String:getSubString(v, 0, p)) end
					do sb:appendString(rr) end
					do sb:appendString(_g.jk.lang.String:getEndOfString(v, p + _g.jk.lang.String:getLength(target))) end
					v = sb:toString()
				end
			end
			do return v end
		end
	end
end

function jk.lang.String:toCharArray(str)
	if not (str ~= nil) then
		do return nil end
	end
	do
		local it = _g.jk.lang.String:iterate(str)
		local v = nil
		do v = {} end
		do
			local n = 0
			while it ~= nil do
				local c = it:getNextChar()
				if _g.jk.lang.Character:isEOF(c) then
					do break end
				end
				do v[n + 1] = c end
				do n = n + 1 end
			end
			do return v end
		end
	end
end

function jk.lang.String:split(str, delim, max)
	local v = {}
	if str == nil then
		do return v end
	end
	do
		local it = _g.jk.lang.String:iterate(str)
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local n = 0
		while true do
			local c = it:getNextChar()
			if _g.jk.lang.Character:isEOF(c) then
				do break end
			end
			if c == delim and (max < 1 or n < max - 1) then
				local s = sb:toString()
				if not (s ~= nil) then
					s = ""
				end
				do _g.jk.lang.Vector:append(v, s) end
				do sb:clear() end
				do n = n + 1 end
			else
				do sb:appendCharacter(c) end
			end
		end
		do
			local s = sb:toString()
			if not (s ~= nil) then
				s = ""
			end
			do _g.jk.lang.Vector:append(v, s) end
			do return v end
		end
	end
end

function jk.lang.String:isInteger(str)
	if not (str ~= nil) then
		do return false end
	end
	do
		local it = _g.jk.lang.String:iterate(str)
		if not (it ~= nil) then
			do return false end
		end
		while true do
			local c = it:getNextChar()
			if c < 1 then
				do break end
			end
			if c < 48 or c > 57 then
				do return false end
			end
		end
		do return true end
	end
end

function jk.lang.String:toInteger(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return 0 end
	end
	do
		local iter = _g.jk.lang.String:iterate(str)
		if not (iter ~= nil) then
			do return 0 end
		end
		do
			local v = 0
			local first = true
			local negative = false
			while true do
				local c = iter:getNextChar()
				if first and c == 45 then
					negative = true
					first = false
					goto _continue2
				end
				if c >= 48 and c <= 57 then
					v = v * 10
					v = v + _util:convert_to_integer(c - 48)
				else
					do break end
				end
				first = false
				::_continue2::
			end
			if negative then
				v = v * -1
			end
			do return v end
		end
	end
end

function jk.lang.String:toLong(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return 0 end
	end
	do
		local iter = _g.jk.lang.String:iterate(str)
		if not (iter ~= nil) then
			do return 0 end
		end
		do
			local v = 0
			local first = true
			local negative = false
			while true do
				local c = iter:getNextChar()
				if first and c == 45 then
					negative = true
					first = false
					goto _continue3
				end
				if c >= 48 and c <= 57 then
					v = v * 10
					v = v + _util:convert_to_integer(c - 48)
				else
					do break end
				end
				first = false
				::_continue3::
			end
			if negative then
				v = v * -1
			end
			do return v end
		end
	end
end

function jk.lang.String:toIntegerFromHex(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return 0 end
	end
	do
		local iter = _g.jk.lang.String:iterate(str)
		if not (iter ~= nil) then
			do return 0 end
		end
		do
			local v = 0
			while true do
				local c = iter:getNextChar()
				if c >= 48 and c <= 57 then
					v = v * 16
					v = v + _util:convert_to_integer(c - 48)
				elseif c >= 97 and c <= 102 then
					v = v * 16
					v = v + (10 + c - 97)
				elseif c >= 65 and c <= 70 then
					v = v * 16
					v = v + (10 + c - 65)
				else
					do break end
				end
			end
			do return v end
		end
	end
end

function jk.lang.String:toLongIntegerFromHex(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return 0 end
	end
	do
		local iter = _g.jk.lang.String:iterate(str)
		if not (iter ~= nil) then
			do return 0 end
		end
		do
			local v = 0
			while true do
				local c = iter:getNextChar()
				if c >= 48 and c <= 57 then
					v = v * 16
					v = v + _util:convert_to_integer(c - 48)
				elseif c >= 97 and c <= 102 then
					v = v * 16
					v = v + (10 + c - 97)
				elseif c >= 65 and c <= 70 then
					v = v * 16
					v = v + (10 + c - 65)
				else
					do break end
				end
			end
			do return v end
		end
	end
end

function jk.lang.String:toIntegerFromOctal(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return 0 end
	end
	do
		local iter = _g.jk.lang.String:iterate(str)
		if not (iter ~= nil) then
			do return 0 end
		end
		do
			local v = 0
			while true do
				local c = iter:getNextChar()
				if c >= 48 and c <= 55 then
					v = v * 8
					v = v + _util:convert_to_integer(c - 48)
				else
					do break end
				end
			end
			do return v end
		end
	end
end

function jk.lang.String:toIntegerFromBinary(str)
	if _g.jk.lang.String:isEmpty(str) then
		do return 0 end
	end
	do
		local iter = _g.jk.lang.String:iterate(str)
		if not (iter ~= nil) then
			do return 0 end
		end
		do
			local v = 0
			while true do
				local c = iter:getNextChar()
				if c >= 48 and c <= 49 then
					v = v * 2
					v = v + _util:convert_to_integer(c - 48)
				else
					do break end
				end
			end
			do return v end
		end
	end
end

function jk.lang.String:toDouble(str)
	if str == nil then
		do return 0.0 end
	end
	do return _util:to_number(str) end
end

function jk.lang.String:iterate(string)
	do return _g.jk.lang.CharacterIteratorForString:forString(string) end
end

function jk.lang.String:reverse(string)
	if not (string ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local it = _g.jk.lang.String:iterate(string)
		local c = 0
		while (function()
			c = it:getNextChar()
			do return c end
		end)() > 0 do
			do sb:insertCharacter(0, c) end
		end
		do return sb:toString() end
	end
end

function jk.lang.String:iterateReverse(string)
	do return _g.jk.lang.String:iterate(_g.jk.lang.String:reverse(string)) end
end

jk.lang.StringSet = {}
jk.lang.StringSet.__index = jk.lang.StringSet
_vm:set_metatable(jk.lang.StringSet, {})

function jk.lang.StringSet._create()
	local v = _vm:set_metatable({}, jk.lang.StringSet)
	return v
end

function jk.lang.StringSet:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.StringSet'
	self['_isType.jk.lang.StringSet'] = true
	self.data = nil
end

function jk.lang.StringSet:_construct0()
	jk.lang.StringSet._init(self)
	self.data = {}
	return self
end

function jk.lang.StringSet:add(string)
	do _g.jk.lang.Map:setValue(self.data, string, _g.jk.lang.Boolean:asObject(true)) end
end

function jk.lang.StringSet:remove(string)
	do _g.jk.lang.Map:remove(self.data, string) end
end

function jk.lang.StringSet:count()
	do return _g.jk.lang.Map:count(self.data) end
end

function jk.lang.StringSet:contains(string)
	if _g.jk.lang.Map:getValue(self.data, string) ~= nil then
		do return true end
	end
	do return false end
end

function jk.lang.StringSet:getAll()
	local v = _g.jk.lang.Map:getKeys(self.data)
	do return v end
end

function jk.lang.StringSet:clear()
	do _g.jk.lang.Map:clear(self.data) end
end

jk.lang.Exception = {}
jk.lang.Exception.__index = jk.lang.Exception
_vm:set_metatable(jk.lang.Exception, {})

function jk.lang.Exception._create()
	local v = _vm:set_metatable({}, jk.lang.Exception)
	return v
end

function jk.lang.Exception:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Exception'
	self['_isType.jk.lang.Exception'] = true
end

function jk.lang.Exception:_construct0()
	jk.lang.Exception._init(self)
	return self
end

jk.lang.CharacterDecoder = {}
jk.lang.CharacterDecoder.__index = jk.lang.CharacterDecoder
_vm:set_metatable(jk.lang.CharacterDecoder, {})

jk.lang.CharacterDecoder.UTF8 = 0
jk.lang.CharacterDecoder.ASCII = 1
jk.lang.CharacterDecoder.UCS2 = 2

function jk.lang.CharacterDecoder._create()
	local v = _vm:set_metatable({}, jk.lang.CharacterDecoder)
	return v
end

function jk.lang.CharacterDecoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.CharacterDecoder'
	self['_isType.jk.lang.CharacterDecoder'] = true
	self['_isType.jk.lang.CharacterIterator'] = true
	self.encoding = 0
	self.current = 0
	self.surrogatePair = nil
	self.counter = 0
	self.currentSize = 0
	self.ended = false
end

function jk.lang.CharacterDecoder:_construct0()
	jk.lang.CharacterDecoder._init(self)
	return self
end

function jk.lang.CharacterDecoder:resetDecoder()
	self.current = 0
	self.surrogatePair = nil
	self.counter = 0
	self.currentSize = 0
	self.ended = false
end

function jk.lang.CharacterDecoder:copyTo(o)
	o.encoding = self.encoding
	o.current = self.current
	o.currentSize = self.currentSize
	o.ended = self.ended
end

function jk.lang.CharacterDecoder:moveToPreviousByte()
	do return false end
end

function jk.lang.CharacterDecoder:moveToNextByte()
	do return false end
end

function jk.lang.CharacterDecoder:getCurrentByte()
	do return 0 end
end

function jk.lang.CharacterDecoder:setEncoding(ee)
	if _g.jk.lang.String:equalsIgnoreCase(ee, "UTF8") or _g.jk.lang.String:equalsIgnoreCase(ee, "UTF-8") then
		self.encoding = _g.jk.lang.CharacterDecoder.UTF8
		self.currentSize = 1
		do return self end
	end
	if _g.jk.lang.String:equalsIgnoreCase(ee, "ASCII") then
		self.encoding = _g.jk.lang.CharacterDecoder.ASCII
		self.currentSize = 1
		do return self end
	end
	if _g.jk.lang.String:equalsIgnoreCase(ee, "UCS2") or _g.jk.lang.String:equalsIgnoreCase(ee, "UCS-2") then
		self.encoding = _g.jk.lang.CharacterDecoder.UCS2
		self.currentSize = 2
		do return self end
	end
	do return nil end
end

function jk.lang.CharacterDecoder:getEncoding()
	do return self.encoding end
end

function jk.lang.CharacterDecoder:moveToPreviousChar()
	local op = self:getCurrentPosition()
	local cs = self.currentSize
	if cs > 1 then
		local n = 0
		do
			n = 0
			while n < cs - 1 do
				if not self:moveToPreviousByte() then
					do return false end
				end
				do n = n + 1 end
			end
		end
	end
	do
		local v = self:doMoveToPreviousChar()
		if not v then
			do self:setCurrentPosition(op) end
		end
		if v and self.ended then
			self.ended = false
		end
		do return v end
	end
end

function jk.lang.CharacterDecoder:convertToChar(v)
	do return v end
end

function jk.lang.CharacterDecoder:getSurrogatePair()
	if not (self.surrogatePair ~= nil) then
		do return 0 end
	end
	do
		local c = self.surrogatePair[self.counter + 1]
		do self.counter = self.counter + 1 end
		if self.counter == 2 then
			self.counter = 0
			self.surrogatePair = nil
		end
		do return c end
	end
end

function jk.lang.CharacterDecoder:doMoveToPreviousChar()
	if self.encoding == _g.jk.lang.CharacterDecoder.UTF8 then
		if not self:moveToPreviousByte() then
			do return false end
		end
		do
			local c2 = self:getCurrentByte()
			if c2 <= 127 then
				self.current = c2
				self.currentSize = 1
				do return true end
			end
			if not self:moveToPreviousByte() then
				do return false end
			end
			do
				local c1 = self:getCurrentByte()
				if _vm:bitwise_and(c1, 192) == 192 then
					if not self:moveToNextByte() then
						do return false end
					end
					do
						local v = _vm:bitwise_left_shift(_vm:bitwise_and(c1, 31), 6)
						v = v + _vm:bitwise_and(c2, 63)
						self.current = self:convertToChar(v)
						self.currentSize = 2
						do return true end
					end
				end
				if not self:moveToPreviousByte() then
					do return false end
				end
				do
					local c0 = self:getCurrentByte()
					if _vm:bitwise_and(c0, 224) == 224 then
						if not self:moveToNextByte() then
							do return false end
						end
						if not self:moveToNextByte() then
							do return false end
						end
						do
							local v = _vm:bitwise_left_shift(_vm:bitwise_and(c0, 15), 12)
							v = v + _vm:bitwise_left_shift(_vm:bitwise_and(c1, 63), 6)
							v = v + _vm:bitwise_and(c2, 63)
							self.current = self:convertToChar(v)
							self.currentSize = 3
							do return true end
						end
					end
					if not self:moveToPreviousByte() then
						do return false end
					end
					do
						local cm1 = self:getCurrentByte()
						if _vm:bitwise_and(cm1, 240) == 240 then
							if not self:moveToNextByte() then
								do return false end
							end
							if not self:moveToNextByte() then
								do return false end
							end
							if not self:moveToNextByte() then
								do return false end
							end
							do
								local v = _vm:bitwise_left_shift(_vm:bitwise_and(cm1, 7), 18)
								v = v + _vm:bitwise_left_shift(_vm:bitwise_and(c0, 63), 12)
								v = v + _vm:bitwise_left_shift(_vm:bitwise_and(c1, 63), 6)
								v = v + _vm:bitwise_and(c2, 63)
								self.current = self:convertToChar(v)
								self.currentSize = 4
								do return true end
							end
						end
						do self:moveToNextByte() end
						do self:moveToNextByte() end
						do self:moveToNextByte() end
						self.current = 63
						self.currentSize = 1
						do return true end
					end
				end
			end
		end
	end
	if self.encoding == _g.jk.lang.CharacterDecoder.ASCII then
		if not self:moveToPreviousByte() then
			do return false end
		end
		self.current = self:getCurrentByte()
		do return true end
	end
	if self.encoding == _g.jk.lang.CharacterDecoder.UCS2 then
		if not self:moveToPreviousByte() then
			do return false end
		end
		do
			local c1 = self:getCurrentByte()
			if not self:moveToPreviousByte() then
				do return false end
			end
			do
				local c0 = self:getCurrentByte()
				if not self:moveToNextByte() then
					do return false end
				end
				self.current = _vm:bitwise_and(_vm:bitwise_left_shift(c0, 8), c1)
				do return true end
			end
		end
	end
	_io:write_to_stdout("Unsupported encoding in CharacterDecoder: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.encoding)) .. "\n")
	do return false end
end

function jk.lang.CharacterDecoder:moveToNextChar()
	local v = self:doMoveToNextChar()
	if v == false then
		self.current = 0
		self.ended = true
	end
	do return v end
end

function jk.lang.CharacterDecoder:doMoveToNextChar()
	if self.encoding == _g.jk.lang.CharacterDecoder.UTF8 then
		if self.surrogatePair ~= nil then
			self.current = self:getSurrogatePair()
			do return true end
		end
		if not self:moveToNextByte() then
			do return false end
		end
		do
			local b1 = self:getCurrentByte()
			local v = -1
			if b1 <= 127 then
				v = b1
				self.currentSize = 1
			elseif b1 >= 240 then
				v = _vm:bitwise_left_shift(_vm:bitwise_and(b1, 7), 18)
				if not self:moveToNextByte() then
					do return false end
				end
				do
					local b2 = self:getCurrentByte()
					v = v + _vm:bitwise_left_shift(_vm:bitwise_and(b2, 63), 12)
					if not self:moveToNextByte() then
						do return false end
					end
					do
						local b3 = self:getCurrentByte()
						v = v + _vm:bitwise_left_shift(_vm:bitwise_and(b3, 63), 6)
						if not self:moveToNextByte() then
							do return false end
						end
						do
							local b4 = self:getCurrentByte()
							v = v + _vm:bitwise_and(b4, 63)
							self.currentSize = 4
						end
					end
				end
			elseif b1 >= 224 then
				v = _vm:bitwise_left_shift(_vm:bitwise_and(b1, 15), 12)
				if not self:moveToNextByte() then
					do return false end
				end
				do
					local b2 = self:getCurrentByte()
					v = v + _vm:bitwise_left_shift(_vm:bitwise_and(b2, 63), 6)
					if not self:moveToNextByte() then
						do return false end
					end
					do
						local b3 = self:getCurrentByte()
						v = v + _vm:bitwise_and(b3, 63)
						self.currentSize = 3
					end
				end
			elseif b1 >= 192 then
				v = _vm:bitwise_left_shift(_vm:bitwise_and(b1, 31), 6)
				if not self:moveToNextByte() then
					do return false end
				end
				do
					local b2 = self:getCurrentByte()
					v = v + _vm:bitwise_and(b2, 63)
					self.currentSize = 2
				end
			else
				v = _util:convert_to_integer(63)
				self.currentSize = 1
			end
			self.current = self:convertToChar(v)
			do return true end
		end
	end
	if self.encoding == _g.jk.lang.CharacterDecoder.ASCII then
		if not self:moveToNextByte() then
			do return false end
		end
		self.current = self:getCurrentByte()
		do return true end
	end
	if self.encoding == _g.jk.lang.CharacterDecoder.UCS2 then
		if not self:moveToNextByte() then
			do return false end
		end
		do
			local c0 = self:getCurrentByte()
			if not self:moveToNextByte() then
				do return false end
			end
			do
				local c1 = self:getCurrentByte()
				self.current = _vm:bitwise_and(_vm:bitwise_left_shift(c0, 8), c1)
				do return true end
			end
		end
	end
	_io:write_to_stdout("Unsupported encoding in CharacterDecoder: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.encoding)) .. "\n")
	do return false end
end

function jk.lang.CharacterDecoder:getCurrentChar()
	do return self.current end
end

function jk.lang.CharacterDecoder:getNextChar()
	if self:moveToNextChar() == false then
		do return 0 end
	end
	do return self.current end
end

function jk.lang.CharacterDecoder:hasEnded()
	do return self.ended end
end

function jk.lang.CharacterDecoder:getCurrentPosition()
end

function jk.lang.CharacterDecoder:setCurrentPosition(position)
end

jk.lang.LogicOp = {}
jk.lang.LogicOp.__index = jk.lang.LogicOp
_vm:set_metatable(jk.lang.LogicOp, {})

function jk.lang.LogicOp._create()
	local v = _vm:set_metatable({}, jk.lang.LogicOp)
	return v
end

function jk.lang.LogicOp:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.LogicOp'
	self['_isType.jk.lang.LogicOp'] = true
end

function jk.lang.LogicOp:_construct0()
	jk.lang.LogicOp._init(self)
	return self
end

function jk.lang.LogicOp:_or(v1, v2)
	do return v1 or v2 end
end

function jk.lang.LogicOp:_and(v1, v2)
	do return v1 and v2 end
end

function jk.lang.LogicOp:_not(v)
	do return not v end
end

jk.lang.StackTrace = {}
jk.lang.StackTrace.__index = jk.lang.StackTrace
_vm:set_metatable(jk.lang.StackTrace, {})

function jk.lang.StackTrace._create()
	local v = _vm:set_metatable({}, jk.lang.StackTrace)
	return v
end

function jk.lang.StackTrace:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.StackTrace'
	self['_isType.jk.lang.StackTrace'] = true
end

function jk.lang.StackTrace:_construct0()
	jk.lang.StackTrace._init(self)
	return self
end

function jk.lang.StackTrace:generate()
	do return _vm:get_stack_trace() end
end

jk.lang.CharacterIteratorForBuffer = _g.jk.lang.CharacterDecoder._create()
jk.lang.CharacterIteratorForBuffer.__index = jk.lang.CharacterIteratorForBuffer
_vm:set_metatable(jk.lang.CharacterIteratorForBuffer, {
	__index = _g.jk.lang.CharacterDecoder
})

function jk.lang.CharacterIteratorForBuffer._create()
	local v = _vm:set_metatable({}, jk.lang.CharacterIteratorForBuffer)
	return v
end

function jk.lang.CharacterIteratorForBuffer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.CharacterIteratorForBuffer'
	self['_isType.jk.lang.CharacterIteratorForBuffer'] = true
	self['_isType.jk.lang.Duplicateable'] = true
	self.buffer = nil
	self.bufferSize = 0
	self.currentPosition = -1
end

function jk.lang.CharacterIteratorForBuffer:_construct0()
	jk.lang.CharacterIteratorForBuffer._init(self)
	do _g.jk.lang.CharacterDecoder._construct0(self) end
	return self
end

function jk.lang.CharacterIteratorForBuffer:forBuffer(buffer)
	local v = _g.jk.lang.CharacterIteratorForBuffer._construct0(_g.jk.lang.CharacterIteratorForBuffer._create())
	do v:setBuffer(buffer) end
	do return v end
end

function jk.lang.CharacterIteratorForBuffer:setBuffer(buffer)
	do self:resetDecoder() end
	self.buffer = buffer
	self.bufferSize = _g.jk.lang.Buffer:getSize(buffer)
	self.currentPosition = -1
end

function jk.lang.CharacterIteratorForBuffer:moveToPreviousByte()
	if self.currentPosition < 1 then
		do return false end
	end
	do self.currentPosition = self.currentPosition - 1 end
	do return true end
end

function jk.lang.CharacterIteratorForBuffer:moveToNextByte()
	local n = self.currentPosition + 1
	if n >= self.bufferSize then
		do return false end
	end
	self.currentPosition = n
	do return true end
end

function jk.lang.CharacterIteratorForBuffer:getCurrentByte()
	local v = _vm:bitwise_and(self.buffer[self.currentPosition + 1], 255)
	do return v end
end

function jk.lang.CharacterIteratorForBuffer:getCurrentPosition()
	do return self.currentPosition end
end

function jk.lang.CharacterIteratorForBuffer:setCurrentPosition(position)
	if position < 0 then
		self.current = 0
		self.currentPosition = -1
	else
		self.currentPosition = position + 1
		do self:doMoveToPreviousChar() end
	end
end

function jk.lang.CharacterIteratorForBuffer:duplicate()
	local v = _g.jk.lang.CharacterIteratorForBuffer._construct0(_g.jk.lang.CharacterIteratorForBuffer._create())
	do _g.jk.lang.CharacterDecoder.copyTo(self, v) end
	v.buffer = self.buffer
	v.bufferSize = self.bufferSize
	v.currentPosition = self.currentPosition
	do return v end
end

jk.lang.ExceptionWithString = _g.jk.lang.Exception._create()
jk.lang.ExceptionWithString.__index = jk.lang.ExceptionWithString
_vm:set_metatable(jk.lang.ExceptionWithString, {
	__index = _g.jk.lang.Exception
})

function jk.lang.ExceptionWithString._create()
	local v = _vm:set_metatable({}, jk.lang.ExceptionWithString)
	return v
end

function jk.lang.ExceptionWithString:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.ExceptionWithString'
	self['_isType.jk.lang.ExceptionWithString'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.exceptionMessage = nil
	self.stackTraceString = nil
end

function jk.lang.ExceptionWithString:_construct0()
	jk.lang.ExceptionWithString._init(self)
	do _g.jk.lang.Exception._construct0(self) end
	return self
end

function jk.lang.ExceptionWithString:forString(string, allowStackTrace)
	local v = _g.jk.lang.ExceptionWithString._construct0(_g.jk.lang.ExceptionWithString._create())
	do v:setExceptionMessage(string) end
	if allowStackTrace then
		do v:updateStackTrace() end
	end
	do return v end
end

function jk.lang.ExceptionWithString:updateStackTrace()
	do self:setStackTraceString(_g.jk.lang.StackTrace:generate()) end
end

function jk.lang.ExceptionWithString:toString()
	if not (self.stackTraceString ~= nil) then
		do return self.exceptionMessage end
	end
	do
		local v = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do v:appendString(self.exceptionMessage) end
		do
			local ss = self.stackTraceString
			if _g.jk.lang.String:getLength(ss) > 0 then
				if v:count() > 0 then
					do v:appendCharacter(10) end
				end
				do v:appendString(ss) end
			end
			do return v:toString() end
		end
	end
end

function jk.lang.ExceptionWithString:getExceptionMessage()
	do return self.exceptionMessage end
end

function jk.lang.ExceptionWithString:setExceptionMessage(v)
	self.exceptionMessage = v
	do return self end
end

function jk.lang.ExceptionWithString:getStackTraceString()
	do return self.stackTraceString end
end

function jk.lang.ExceptionWithString:setStackTraceString(v)
	self.stackTraceString = v
	do return self end
end

jk.lang.ExceptionWithError = _g.jk.lang.Exception._create()
jk.lang.ExceptionWithError.__index = jk.lang.ExceptionWithError
_vm:set_metatable(jk.lang.ExceptionWithError, {
	__index = _g.jk.lang.Exception
})

function jk.lang.ExceptionWithError._create()
	local v = _vm:set_metatable({}, jk.lang.ExceptionWithError)
	return v
end

function jk.lang.ExceptionWithError:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.ExceptionWithError'
	self['_isType.jk.lang.ExceptionWithError'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.error = nil
end

function jk.lang.ExceptionWithError:_construct0()
	jk.lang.ExceptionWithError._init(self)
	do _g.jk.lang.Exception._construct0(self) end
	return self
end

function jk.lang.ExceptionWithError:forError(error)
	local v = _g.jk.lang.ExceptionWithError._construct0(_g.jk.lang.ExceptionWithError._create())
	do v:setError(error) end
	do return v end
end

function jk.lang.ExceptionWithError:forCode(code, detail)
	do return _g.jk.lang.ExceptionWithError:forError(_g.jk.lang.Error:forCode(code, detail)) end
end

function jk.lang.ExceptionWithError:getErrorCode()
	if not (self.error ~= nil) then
		do return nil end
	end
	do return self.error:getCode() end
end

function jk.lang.ExceptionWithError:getErrorDetail()
	if not (self.error ~= nil) then
		do return nil end
	end
	do return self.error:getDetail() end
end

function jk.lang.ExceptionWithError:toString()
	do return _g.jk.lang.Error:asString(self.error) end
end

function jk.lang.ExceptionWithError:getError()
	do return self.error end
end

function jk.lang.ExceptionWithError:setError(v)
	self.error = v
	do return self end
end

jk.lang.Serializer = {}
jk.lang.Serializer.__index = jk.lang.Serializer
_vm:set_metatable(jk.lang.Serializer, {})

function jk.lang.Serializer._create()
	local v = _vm:set_metatable({}, jk.lang.Serializer)
	return v
end

function jk.lang.Serializer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Serializer'
	self['_isType.jk.lang.Serializer'] = true
end

function jk.lang.Serializer:_construct0()
	jk.lang.Serializer._init(self)
	return self
end

function jk.lang.Serializer:toBuffer(object)
	if not (object ~= nil) then
		do return nil end
	end
	do return _vm:serialize_object(object) end
end

function jk.lang.Serializer:fromBuffer(buffer)
	if not (buffer ~= nil) then
		do return nil end
	end
	do
		local oo = nil
		do oo = _vm:unserialize_object(buffer) end
		if not (oo ~= nil) then
			do return nil end
		end
		do _vm:set_metatable(oo, _vm:get_global(oo._qualifiedClassName)) end
		do return oo end
	end
end

jk.lang.Reflection = {}
jk.lang.Reflection.__index = jk.lang.Reflection
_vm:set_metatable(jk.lang.Reflection, {})

function jk.lang.Reflection._create()
	local v = _vm:set_metatable({}, jk.lang.Reflection)
	return v
end

function jk.lang.Reflection:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Reflection'
	self['_isType.jk.lang.Reflection'] = true
end

function jk.lang.Reflection:_construct0()
	jk.lang.Reflection._init(self)
	return self
end

function jk.lang.Reflection:createClassInstanceByName(qualifiedName)
	if not _g.jk.lang.String:isNotEmpty(qualifiedName) then
		do return nil end
	end
	do
		local code = " return _g." .. _g.jk.lang.String:safeString(qualifiedName) .. "._construct0(_g." .. _g.jk.lang.String:safeString(qualifiedName) .. "._create())"
		local ff = _vm:parse_to_function(code)
		if not (ff ~= nil) then
			do return nil end
		end
		do return ff() end
	end
end

function jk.lang.Reflection:createClassInstanceByTypeinfo(type)
	local typename = type
	if not _g.jk.lang.String:startsWith(typename, "class:", 0) then
		do return nil end
	end
	typename = _g.jk.lang.String:getEndOfString(typename, 6)
	do return _g.jk.lang.Reflection:createClassInstanceByName(typename) end
end

function jk.lang.Reflection:callMethod(object, methodName, arguments)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString("return function(object, arguments) return object:") end
	do sb:appendString(methodName) end
	do sb:appendString("(") end
	do
		local sz = #arguments
		do
			local n = 0
			while n < sz do
				if n > 0 then
					do sb:appendString(",") end
				end
				do sb:appendString("arguments[") end
				do sb:appendInteger(n + 1) end
				do sb:appendString("]") end
				do n = n + 1 end
			end
		end
		do sb:appendString(") end") end
		do
			local code = sb:toString()
			local ff = _vm:parse_to_function(code)
			if not (ff ~= nil) then
				do return nil end
			end
			do
				local ffx = ff()
				if not (ffx ~= nil) then
					do return nil end
				end
				do return ffx(object, arguments) end
			end
		end
	end
end

function jk.lang.Reflection:getDataTypeInfo(variable)
	do return _vm:get_datatype_info(variable) end
end

function jk.lang.Reflection:isSameType(primary, other)
	if primary == nil and other == nil then
		do return true end
	end
	if primary == nil or other == nil then
		do return false end
	end
	do
		local ta = _vm:get_datatype_info(primary)
		local tb = _vm:get_datatype_info(other)
		if ta == tb then
			do return true end
		end
		do return false end
	end
end

function jk.lang.Reflection:isInstanceOf(object, type)
	if not (object ~= nil) then
		do return false end
	end
	do return _vm:is_instance_of(object, type) end
end

jk.lang.BufferDataReceiver = {}

jk.lang.StringBuilder = {}
jk.lang.StringBuilder.__index = jk.lang.StringBuilder
_vm:set_metatable(jk.lang.StringBuilder, {})

function jk.lang.StringBuilder._create()
	local v = _vm:set_metatable({}, jk.lang.StringBuilder)
	return v
end

function jk.lang.StringBuilder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.StringBuilder'
	self['_isType.jk.lang.StringBuilder'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.buffer = nil
	self.position = 0
end

function jk.lang.StringBuilder:forString(initial)
	local v = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do v:appendString(initial) end
	do return v end
end

function jk.lang.StringBuilder:dup(initial)
	local v = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	if initial ~= nil then
		do v:appendString(initial:toString()) end
	end
	do return v end
end

function jk.lang.StringBuilder:resizeTo(size)
	local osz = #self.buffer
	if osz < size then
		while osz < size do
			osz = osz + 1024
		end
		self.buffer = _g.jk.lang.Buffer:resize(self.buffer, osz)
	end
end

function jk.lang.StringBuilder:_construct0()
	jk.lang.StringBuilder._init(self)
	do self:initialize() end
	return self
end

function jk.lang.StringBuilder:initialize()
	self.buffer = _util:allocate_buffer(1024)
end

function jk.lang.StringBuilder:clear()
	self.buffer = _util:allocate_buffer(1024)
	self.position = 0
end

function jk.lang.StringBuilder:count()
	do return self.position end
end

function jk.lang.StringBuilder:appendLong(c)
	do return self:appendString(_g.jk.lang.String:forLongInteger(c)) end
end

function jk.lang.StringBuilder:appendInteger(c)
	do return self:appendString(_g.jk.lang.String:forInteger(c)) end
end

function jk.lang.StringBuilder:appendDouble(c)
	do return self:appendString(_g.jk.lang.String:forDouble(c)) end
end

function jk.lang.StringBuilder:appendFloat(c)
	do return self:appendString(_g.jk.lang.String:forFloat(c)) end
end

function jk.lang.StringBuilder:appendCharacter(c)
	if c == 0 or c == -1 then
		do return self end
	end
	if c <= 127 then
		do self:resizeTo(self.position + 1) end
		self.buffer[self.position + 1] = _util:convert_to_integer(c)
		do self.position = self.position + 1 end
	else
		do self:appendString(_g.jk.lang.String:forCharacter(c)) end
	end
	do return self end
end

function jk.lang.StringBuilder:appendString(str)
	if str == nil then
		do return self end
	end
	do
		local nbuf = _g.jk.lang.String:toUTF8Buffer(str)
		if nbuf ~= nil then
			local nsz = #nbuf
			do self:resizeTo(self.position + nsz) end
			do _g.jk.lang.Buffer:copyFrom(self.buffer, nbuf, 0, self.position, nsz) end
			self.position = self.position + nsz
		end
		do return self end
	end
end

function jk.lang.StringBuilder:insertInteger(index, c)
	do return self:insertString(index, _g.jk.lang.String:forInteger(c)) end
end

function jk.lang.StringBuilder:insertCharacter(index, c)
	if c == 0 then
		do return self end
	end
	do return self:insertString(index, _g.jk.lang.String:forCharacter(c)) end
end

function jk.lang.StringBuilder:insertDouble(index, c)
	do return self:insertString(index, _g.jk.lang.String:forDouble(c)) end
end

function jk.lang.StringBuilder:insertFloat(index, c)
	do return self:insertString(index, _g.jk.lang.String:forFloat(c)) end
end

function jk.lang.StringBuilder:insertString(index, str)
	if str == nil then
		do return self end
	end
	do
		local nbuf = _g.jk.lang.String:toUTF8Buffer(str)
		if nbuf ~= nil then
			local nsz = #nbuf
			do self:resizeTo(self.position + nsz) end
			do _g.jk.lang.Buffer:copyFrom(self.buffer, self.buffer, index, index + nsz, self.position - index) end
			do _g.jk.lang.Buffer:copyFrom(self.buffer, nbuf, 0, index, nsz) end
			self.position = self.position + nsz
		end
		do return self end
	end
end

function jk.lang.StringBuilder:remove(index, length)
	if length < 1 then
		do return self end
	end
	if index < self.position then
		local ll = length
		local limit = self.position - index
		if ll > limit then
			ll = limit
		end
		do _g.jk.lang.Buffer:copyFrom(self.buffer, self.buffer, index + ll, index, self.position - index - ll) end
		self.position = self.position - ll
	end
	do return self end
end

function jk.lang.StringBuilder:removeLastCharacter()
	local c = self:count()
	if c > 0 then
		do self:remove(c - 1, 1) end
	end
	do return self end
end

function jk.lang.StringBuilder:toString()
	if not (self.buffer ~= nil) or self.position < 1 then
		do return "" end
	end
	do
		local bb = self.buffer
		if self.position < #bb then
			bb = _g.jk.lang.Buffer:getSubBuffer(bb, 0, self.position, false)
		end
		do return _g.jk.lang.String:forUTF8Buffer(bb) end
	end
end

jk.lang.CharacterIteratorForString = _g.jk.lang.CharacterDecoder._create()
jk.lang.CharacterIteratorForString.__index = jk.lang.CharacterIteratorForString
_vm:set_metatable(jk.lang.CharacterIteratorForString, {
	__index = _g.jk.lang.CharacterDecoder
})

function jk.lang.CharacterIteratorForString._create()
	local v = _vm:set_metatable({}, jk.lang.CharacterIteratorForString)
	return v
end

function jk.lang.CharacterIteratorForString:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.CharacterIteratorForString'
	self['_isType.jk.lang.CharacterIteratorForString'] = true
	self['_isType.jk.lang.Duplicateable'] = true
	self.string = nil
	self.stringSize = 0
	self.currentPosition = -1
end

function jk.lang.CharacterIteratorForString:_construct0()
	jk.lang.CharacterIteratorForString._init(self)
	do _g.jk.lang.CharacterDecoder._construct0(self) end
	return self
end

function jk.lang.CharacterIteratorForString:forString(string)
	local v = _g.jk.lang.CharacterIteratorForString._construct0(_g.jk.lang.CharacterIteratorForString._create())
	do v:setString(string) end
	do return v end
end

function jk.lang.CharacterIteratorForString:moveToPreviousByte()
	if self.currentPosition < 1 then
		do return false end
	end
	do self.currentPosition = self.currentPosition - 1 end
	do return true end
end

function jk.lang.CharacterIteratorForString:moveToNextByte()
	local n = self.currentPosition + 1
	self.currentPosition = n
	if n >= self.stringSize then
		do return false end
	end
	do return true end
end

function jk.lang.CharacterIteratorForString:getCurrentByte()
	do return _util:get_byte_from_string(self.string, self.currentPosition) end
end

function jk.lang.CharacterIteratorForString:getCurrentPosition()
	do return self.currentPosition end
end

function jk.lang.CharacterIteratorForString:setCurrentPosition(position)
	if position < 0 then
		self.current = 0
		self.currentPosition = -1
	else
		self.currentPosition = position + 1
		do self:doMoveToPreviousChar() end
	end
end

function jk.lang.CharacterIteratorForString:duplicate()
	local v = _g.jk.lang.CharacterIteratorForString._construct0(_g.jk.lang.CharacterIteratorForString._create())
	do _g.jk.lang.CharacterDecoder.copyTo(self, v) end
	v.string = self.string
	v.stringSize = self.stringSize
	v.currentPosition = self.currentPosition
	do return v end
end

function jk.lang.CharacterIteratorForString:setString(string)
	do self:resetDecoder() end
	self.string = string
	self.stringSize = _util:get_string_length(string)
	self.currentPosition = -1
end

jk.lang.Buffer = {}
jk.lang.Buffer.__index = jk.lang.Buffer
_vm:set_metatable(jk.lang.Buffer, {})

function jk.lang.Buffer._create()
	local v = _vm:set_metatable({}, jk.lang.Buffer)
	return v
end

function jk.lang.Buffer:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Buffer'
	self['_isType.jk.lang.Buffer'] = true
end

function jk.lang.Buffer:_construct0()
	jk.lang.Buffer._init(self)
	return self
end

jk.lang.Buffer.MyBufferObject = {}
jk.lang.Buffer.MyBufferObject.__index = jk.lang.Buffer.MyBufferObject
_vm:set_metatable(jk.lang.Buffer.MyBufferObject, {})

function jk.lang.Buffer.MyBufferObject._create()
	local v = _vm:set_metatable({}, jk.lang.Buffer.MyBufferObject)
	return v
end

function jk.lang.Buffer.MyBufferObject:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Buffer.MyBufferObject'
	self['_isType.jk.lang.Buffer.MyBufferObject'] = true
	self['_isType.jk.lang.BufferObject'] = true
	self.buffer = nil
end

function jk.lang.Buffer.MyBufferObject:_construct0()
	jk.lang.Buffer.MyBufferObject._init(self)
	return self
end

function jk.lang.Buffer.MyBufferObject:toBuffer()
	do return self.buffer end
end

function jk.lang.Buffer.MyBufferObject:getBuffer()
	do return self.buffer end
end

function jk.lang.Buffer.MyBufferObject:setBuffer(v)
	self.buffer = v
	do return self end
end

function jk.lang.Buffer:asObject(buffer)
	local v = _g.jk.lang.Buffer.MyBufferObject._construct0(_g.jk.lang.Buffer.MyBufferObject._create())
	do v:setBuffer(buffer) end
	do return v end
end

function jk.lang.Buffer:asBuffer(obj)
	if not (obj ~= nil) then
		do return nil end
	end
	if _util:is_buffer(obj) then
		do return obj end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.BufferObject') ~= nil) then
		local bo = obj
		do return bo:toBuffer() end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _g.jk.lang.Buffer:forInt32BE(_util:convert_to_integer(obj)) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _g.jk.lang.Buffer:forInt64BE(_util:convert_to_integer(obj)) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return _g.jk.lang.Buffer:forDouble64BE(obj) end
	end
	do return nil end
end

function jk.lang.Buffer:forInt8Array(buf)
	if not (buf ~= nil) then
		do return nil end
	end
	do
		local sz = #buf
		local v = _util:allocate_buffer(sz)
		do
			local n = 0
			while n < sz do
				v[n + 1] = buf[n + 1]
				do n = n + 1 end
			end
		end
		do return v end
	end
end

function jk.lang.Buffer:toInt8Array(buf)
	if not (buf ~= nil) then
		do return nil end
	end
	do
		local sz = #buf
		local v = _vm:allocate_array(sz)
		do
			local n = 0
			while n < sz do
				v[n + 1] = buf[n + 1]
				do n = n + 1 end
			end
		end
		do return v end
	end
end

function jk.lang.Buffer:getSubBuffer(buffer, offset, size, alwaysNewBuffer)
	if alwaysNewBuffer == false and offset == 0 and size < 0 then
		do return buffer end
	end
	do
		local bsz = _g.jk.lang.Buffer:getSize(buffer)
		local sz = size
		if sz < 0 then
			sz = bsz - offset
		end
		if alwaysNewBuffer == false and offset == 0 and sz == bsz then
			do return buffer end
		end
		if sz < 1 then
			do return nil end
		end
		do
			local v = _util:allocate_buffer(sz)
			do _g.jk.lang.Buffer:copyFrom(v, buffer, offset, 0, sz) end
			do return v end
		end
	end
end

function jk.lang.Buffer:getInt8(buffer, offset)
	if not (buffer ~= nil) then
		do return 0 end
	end
	do return buffer[offset+1] end
end

function jk.lang.Buffer:copyFrom(array, src, soffset, doffset, size)
	if not (array ~= nil) then
		do return end
	end
	if not (src ~= nil) then
		do return end
	end
	do _util:copy_buffer_bytes(src, array, soffset, doffset, size) end
end

function jk.lang.Buffer:getInt16LE(buffer, offset)
	if not (buffer ~= nil) then
		do return 0 end
	end
	do
		local b1 = buffer[offset + 1]
		local b2 = buffer[offset + 1 + 1]
		do return _util:network_bytes_to_host16(b2, b1) end
	end
end

function jk.lang.Buffer:getInt16BE(buffer, offset)
	if not (buffer ~= nil) then
		do return 0 end
	end
	do
		local b1 = buffer[offset + 1]
		local b2 = buffer[offset + 1 + 1]
		do return _util:network_bytes_to_host16(b1, b2) end
	end
end

function jk.lang.Buffer:getInt32LE(buffer, offset)
	local b1 = buffer[offset + 1]
	local b2 = buffer[offset + 1 + 1]
	local b3 = buffer[offset + 2 + 1]
	local b4 = buffer[offset + 3 + 1]
	do return _util:network_bytes_to_host32(b4, b3, b2, b1) end
end

function jk.lang.Buffer:getInt32BE(buffer, offset)
	local b1 = buffer[offset + 1]
	local b2 = buffer[offset + 1 + 1]
	local b3 = buffer[offset + 2 + 1]
	local b4 = buffer[offset + 3 + 1]
	do return _util:network_bytes_to_host32(b1, b2, b3, b4) end
end

function jk.lang.Buffer:getInt64LE(buffer, offset)
	local b1 = buffer[offset + 1]
	local b2 = buffer[offset + 1 + 1]
	local b3 = buffer[offset + 2 + 1]
	local b4 = buffer[offset + 3 + 1]
	local b5 = buffer[offset + 4 + 1]
	local b6 = buffer[offset + 5 + 1]
	local b7 = buffer[offset + 6 + 1]
	local b8 = buffer[offset + 7 + 1]
	do return _util:network_bytes_to_host64(b8, b7, b6, b5, b4, b3, b2, b1) end
end

function jk.lang.Buffer:getInt64BE(buffer, offset)
	_io:write_to_stdout("[jk.lang.Buffer.getInt64BE] (Buffer.sling:513:2): Not implemented" .. "\n")
	do return 0 end
end

function jk.lang.Buffer:getFloatLE(buffer, offset)
	_io:write_to_stdout("[jk.lang.Buffer.getFloatLE] (Buffer.sling:520:2): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.lang.Buffer:getFloatBE(buffer, offset)
	_io:write_to_stdout("[jk.lang.Buffer.getFloatBE] (Buffer.sling:527:2): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.lang.Buffer:getDoubleLE(buffer, offset)
	_io:write_to_stdout("[jk.lang.Buffer.getDoubleLE] (Buffer.sling:534:2): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.lang.Buffer:getDoubleBE(buffer, offset)
	_io:write_to_stdout("[jk.lang.Buffer.getDoubleBE] (Buffer.sling:541:2): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.lang.Buffer:forInt8(number)
	local v = _util:allocate_buffer(1)
	v[0 + 1] = _vm:bitwise_and(number, 255)
	do return v end
end

function jk.lang.Buffer:forInt16BE(number)
	do return _util:integer_to_buffer16(number, 0) end
end

function jk.lang.Buffer:forInt16LE(number)
	do return _util:integer_to_buffer16(number, 1) end
end

function jk.lang.Buffer:forInt32BE(number)
	do return _util:integer_to_buffer32(number, 0) end
end

function jk.lang.Buffer:forInt32LE(number)
	do return _util:integer_to_buffer32(number, 1) end
end

function jk.lang.Buffer:forInt64BE(number)
	do return _util:integer_to_buffer64(number, 0) end
end

function jk.lang.Buffer:forInt64LE(number)
	do return _util:integer_to_buffer64(number, 1) end
end

function jk.lang.Buffer:forFloat32BE(number)
	do return _util:float_to_buffer32(number, 0) end
end

function jk.lang.Buffer:forFloat32LE(number)
	do return _util:float_to_buffer32(number, 1) end
end

function jk.lang.Buffer:forDouble64BE(number)
	do return _util:double_to_buffer64(number, 0) end
end

function jk.lang.Buffer:forDouble64LE(number)
	do return _util:double_to_buffer64(number, 1) end
end

function jk.lang.Buffer:getSize(buffer)
	if buffer == nil then
		do return 0 end
	end
	do return #buffer end
end

function jk.lang.Buffer:getByte(buffer, offset)
	do return _g.jk.lang.Buffer:getInt8(buffer, offset) end
end

function jk.lang.Buffer:setByte(buffer, offset, value)
	if not (buffer ~= nil) then
		do return end
	end
	do buffer[offset+1] = value end
end

function jk.lang.Buffer:allocate(size)
	do return _util:allocate_buffer(size) end
end

function jk.lang.Buffer:fill(buffer, value)
	local s = _g.jk.lang.Buffer:getSize(buffer)
	do
		local i = 0
		while i < s do
			do _g.jk.lang.Buffer:setByte(buffer, i, value) end
			do i = i + 1 end
		end
	end
end

function jk.lang.Buffer:resize(buffer, newSize)
	if newSize < 1 then
		do return nil end
	end
	if not (buffer ~= nil) then
		do return _g.jk.lang.Buffer:allocate(newSize) end
	end
	if #buffer == newSize then
		do return buffer end
	end
	do
		local oldSize = 0
		if buffer ~= nil then
			oldSize = #buffer
		end
		do
			local v = _util:allocate_buffer(newSize)
			if newSize >= oldSize then
				if oldSize > 0 then
					do _g.jk.lang.Buffer:copyFrom(v, buffer, 0, 0, oldSize) end
				end
			else
				do _g.jk.lang.Buffer:copyFrom(v, buffer, 0, 0, newSize) end
			end
			do return v end
		end
	end
end

function jk.lang.Buffer:append(original, toAppend, size)
	if toAppend == nil or size == 0 then
		do return original end
	end
	do
		local sz = size
		local os = _g.jk.lang.Buffer:getSize(original)
		local oas = _g.jk.lang.Buffer:getSize(toAppend)
		if sz >= 0 then
			oas = sz
		end
		do
			local nl = os + oas
			local nb = _g.jk.lang.Buffer:resize(original, nl)
			do _g.jk.lang.Buffer:copyFrom(nb, toAppend, 0, os, oas) end
			do return nb end
		end
	end
end

function jk.lang.Buffer:forHexString(str)
	if str == nil or _util:convert_to_integer(_g.jk.lang.String:getLength(str) % 2) ~= 0 then
		do return nil end
	end
	do
		local sb = nil
		local b = _g.jk.lang.Buffer:allocate(_util:convert_to_integer(_g.jk.lang.String:getLength(str) / 2))
		local n = 0
		local it = _g.jk.lang.String:iterate(str)
		while it ~= nil do
			local c = it:getNextChar()
			if c < 1 then
				do break end
			end
			if sb == nil then
				sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			end
			if c >= 97 and c <= 102 or (c >= 65 and c <= 70) or (c >= 48 and c <= 57) then
				do sb:appendCharacter(c) end
				if sb:count() == 2 then
					do _g.jk.lang.Buffer:setByte(b, (function() local v = n n = n + 1 return v end)(), _g.jk.lang.String:toIntegerFromHex(sb:toString())) end
					do sb:clear() end
				end
			else
				do return nil end
			end
		end
		do return b end
	end
end

jk.lang.BooleanIterator = {}

jk.lang.Double = {}
jk.lang.Double.__index = jk.lang.Double
_vm:set_metatable(jk.lang.Double, {})

function jk.lang.Double._create()
	local v = _vm:set_metatable({}, jk.lang.Double)
	return v
end

function jk.lang.Double:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Double'
	self['_isType.jk.lang.Double'] = true
	self['_isType.jk.lang.DoubleObject'] = true
	self.value = 0.0
end

function jk.lang.Double:_construct0()
	jk.lang.Double._init(self)
	return self
end

function jk.lang.Double:forValue(value)
	do return _g.jk.lang.Double:asObject(value) end
end

function jk.lang.Double:asObject(value)
	local v = _g.jk.lang.Double._construct0(_g.jk.lang.Double._create())
	do v:setValue(value) end
	do return v end
end

function jk.lang.Double:asDouble(obj)
	if not (obj ~= nil) then
		do return 0.0 end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		do return obj end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.DoubleObject') ~= nil) then
		local od = obj
		do return od:toDouble() end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = _util:convert_to_integer(obj)
		do return v end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.IntegerObject') ~= nil) then
		local oi = obj
		do return oi:toInteger() end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = _util:convert_to_integer(obj)
		do return v end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.LongIntegerObject') ~= nil) then
		local oi = obj
		do return oi:toLong() end
	end
	if (_vm:get_variable_type(obj) == 'string') then
		do return _g.jk.lang.String:toDouble(obj) end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.StringObject') ~= nil) then
		do return _g.jk.lang.String:toDouble(obj:toString()) end
	end
	if (_vm:get_variable_type(obj) == 'number') then
		local v = obj
		do return v end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.CharacterObject') ~= nil) then
		local oc = obj
		do return oc:toCharacter() end
	end
	if (_vm:get_variable_type(obj) == 'boolean') then
		if obj == true then
			do return 1.0 end
		end
		do return 0.0 end
	end
	if (_vm:to_table_with_key(obj, '_isType.jk.lang.BooleanObject') ~= nil) then
		if obj:toBoolean() then
			do return 1.0 end
		end
		do return 0.0 end
	end
	do return 0.0 end
end

function jk.lang.Double:longBitsToDouble(vv)
	_io:write_to_stdout("[jk.lang.Double.longBitsToDouble] (Double.sling:97:3): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.lang.Double:doubleToLongBits(vv)
	_io:write_to_stdout("[jk.lang.Double.doubleToLongBits] (Double.sling:111:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.lang.Double:add(amount)
	self.value = self.value + amount
end

function jk.lang.Double:toDouble()
	do return self.value end
end

function jk.lang.Double:getValue()
	do return self.value end
end

function jk.lang.Double:setValue(v)
	self.value = v
	do return self end
end

jk.lang.Character = {}
jk.lang.Character.__index = jk.lang.Character
_vm:set_metatable(jk.lang.Character, {})

function jk.lang.Character._create()
	local v = _vm:set_metatable({}, jk.lang.Character)
	return v
end

function jk.lang.Character:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Character'
	self['_isType.jk.lang.Character'] = true
	self['_isType.jk.lang.CharacterObject'] = true
	self.character = 0
end

function jk.lang.Character:_construct0()
	jk.lang.Character._init(self)
	return self
end

function jk.lang.Character:asObject(character)
	local v = _g.jk.lang.Character._construct0(_g.jk.lang.Character._create())
	do v:setCharacter(character) end
	do return v end
end

function jk.lang.Character:toUppercase(c)
	if c >= 97 and c <= 122 then
		do return c - 97 + 65 end
	end
	do return c end
end

function jk.lang.Character:toLowercase(c)
	if c >= 65 and c <= 90 then
		do return c - 65 + 97 end
	end
	do return c end
end

function jk.lang.Character:isDigit(c)
	do return c >= 48 and c <= 57 end
end

function jk.lang.Character:isLowercaseAlpha(c)
	do return c >= 97 and c <= 122 end
end

function jk.lang.Character:isUppercaseAlpha(c)
	do return c >= 65 and c <= 90 end
end

function jk.lang.Character:isHexDigit(c)
	local v = c >= 97 and c <= 102 or (c >= 65 and c <= 70) or (c >= 48 and c <= 57)
	do return v end
end

function jk.lang.Character:isAlnum(c)
	local v = c >= 97 and c <= 122 or (c >= 65 and c <= 90) or (c >= 48 and c <= 57)
	do return v end
end

function jk.lang.Character:isAlpha(c)
	local v = c >= 97 and c <= 122 or (c >= 65 and c <= 90)
	do return v end
end

function jk.lang.Character:isAlphaNumeric(c)
	local v = c >= 97 and c <= 122 or (c >= 65 and c <= 90) or (c >= 48 and c <= 57)
	do return v end
end

function jk.lang.Character:isLowercaseAlphaNumeric(c)
	local v = c >= 97 and c <= 122 or (c >= 48 and c <= 57)
	do return v end
end

function jk.lang.Character:isUppercaseAlphaNumeric(c)
	local v = c >= 65 and c <= 90 or (c >= 48 and c <= 57)
	do return v end
end

function jk.lang.Character:toCharacter()
	do return self.character end
end

function jk.lang.Character:isEOF(c)
	do return c == 0 or c == -1 end
end

function jk.lang.Character:getHexDigit(c)
	local v = 0
	if c >= 48 and c <= 57 then
		v = _util:convert_to_integer(c - 48)
	elseif c >= 97 and c <= 102 then
		v = 10 + c - 97
	elseif c >= 65 and c <= 70 then
		v = 10 + c - 65
	else
		do return 0 end
	end
	do return v end
end

function jk.lang.Character:getCharacter()
	do return self.character end
end

function jk.lang.Character:setCharacter(v)
	self.character = v
	do return self end
end

jk.lang.Map = {}
jk.lang.Map.__index = jk.lang.Map
_vm:set_metatable(jk.lang.Map, {})

function jk.lang.Map._create()
	local v = _vm:set_metatable({}, jk.lang.Map)
	return v
end

function jk.lang.Map:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Map'
	self['_isType.jk.lang.Map'] = true
end

function jk.lang.Map:_construct0()
	jk.lang.Map._init(self)
	return self
end

jk.lang.Map.MyMapObject = {}
jk.lang.Map.MyMapObject.__index = jk.lang.Map.MyMapObject
_vm:set_metatable(jk.lang.Map.MyMapObject, {})

function jk.lang.Map.MyMapObject._create()
	local v = _vm:set_metatable({}, jk.lang.Map.MyMapObject)
	return v
end

function jk.lang.Map.MyMapObject:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.Map.MyMapObject'
	self['_isType.jk.lang.Map.MyMapObject'] = true
	self['_isType.jk.lang.MapObject'] = true
	self.map = nil
end

function jk.lang.Map.MyMapObject:_construct0()
	jk.lang.Map.MyMapObject._init(self)
	return self
end

function jk.lang.Map.MyMapObject:toMap()
	do return self.map end
end

function jk.lang.Map.MyMapObject:getMap()
	do return self.map end
end

function jk.lang.Map.MyMapObject:setMap(v)
	self.map = v
	do return self end
end

function jk.lang.Map:asObject(map)
	if not (map ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.lang.Map.MyMapObject._construct0(_g.jk.lang.Map.MyMapObject._create())
		do v:setMap(map) end
		do return v end
	end
end

function jk.lang.Map:asMap(o)
	if not (o ~= nil) then
		do return nil end
	end
	do return nil end
end

function jk.lang.Map:getWithDefault(map, key, ddf)
	if map == nil or key == nil then
		do return ddf end
	end
	if _g.jk.lang.Map:containsKey(map, key) == false then
		do return ddf end
	end
	do return _g.jk.lang.Map:getValue(map, key) end
end

function jk.lang.Map:get(map, key)
	do return _g.jk.lang.Map:getValue(map, key) end
end

function jk.lang.Map:getValue(map, key)
	if map == nil or key == nil then
		do return nil end
	end
	do return map[key] end
end

function jk.lang.Map:set(data, key, val)
	if not (data ~= nil) then
		do return false end
	end
	if not (key ~= nil) then
		do return false end
	end
	data[key] = val
	do return true end
end

function jk.lang.Map:setValue(data, key, val)
	do return _g.jk.lang.Map:set(data, key, val) end
end

function jk.lang.Map:remove(data, key)
	if not (data ~= nil) then
		do return end
	end
	if not (key ~= nil) then
		do return end
	end
	do data[key] = nil end
end

function jk.lang.Map:count(data)
	if data == nil then
		do return 0 end
	end
	do return _g.jk.lang.Vector:getSize(_g.jk.lang.Map:getKeys(data)) end
end

function jk.lang.Map:containsKey(data, key)
	if not (data ~= nil) then
		do return false end
	end
	if not (key ~= nil) then
		do return false end
	end
	do
		local array = _g.jk.lang.Map:getKeys(data)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local kk = array[n + 1]
					if kk ~= nil then
						if key == kk then
							do return true end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return false end
	end
end

function jk.lang.Map:containsValue(data, val)
	if not (data ~= nil) then
		do return false end
	end
	if not (val ~= nil) then
		do return false end
	end
	do
		local array = _g.jk.lang.Map:getValues(data)
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local vv = array[n + 1]
					if vv ~= nil then
						if val == vv then
							do return true end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do return false end
	end
end

function jk.lang.Map:clear(data)
	if not (data ~= nil) then
		do return end
	end
	do _vm:clear_table(data) end
end

function jk.lang.Map:dup(data)
	if not (data ~= nil) then
		do return nil end
	end
	_io:write_to_stdout("[jk.lang.Map.dup] (Map.sling:371:3): Not implemented" .. "\n")
	do return nil end
end

function jk.lang.Map:getKeys(data)
	if not (data ~= nil) then
		do return nil end
	end
	do
		local v = nil
		do v = _vm:get_table_keys(data) end
		do return v end
	end
end

function jk.lang.Map:getValues(data)
	if not (data ~= nil) then
		do return nil end
	end
	do
		local v = nil
		do v = _vm:get_table_values(data) end
		do return v end
	end
end

function jk.lang.Map:iterateKeys(data)
	do return _g.jk.lang.Vector:iterate(_g.jk.lang.Map:getKeys(data)) end
end

function jk.lang.Map:iterateValues(data)
	do return _g.jk.lang.Vector:iterate(_g.jk.lang.Map:getValues(data)) end
end

jk.lang.DynamicObject = {}
jk.lang.DynamicObject.__index = jk.lang.DynamicObject
_vm:set_metatable(jk.lang.DynamicObject, {})

function jk.lang.DynamicObject._create()
	local v = _vm:set_metatable({}, jk.lang.DynamicObject)
	return v
end

function jk.lang.DynamicObject:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DynamicObject'
	self['_isType.jk.lang.DynamicObject'] = true
end

function jk.lang.DynamicObject:_construct0()
	jk.lang.DynamicObject._init(self)
	return self
end

jk.lang.DynamicObject.StringIteratorWrapper = {}
jk.lang.DynamicObject.StringIteratorWrapper.__index = jk.lang.DynamicObject.StringIteratorWrapper
_vm:set_metatable(jk.lang.DynamicObject.StringIteratorWrapper, {})

function jk.lang.DynamicObject.StringIteratorWrapper._create()
	local v = _vm:set_metatable({}, jk.lang.DynamicObject.StringIteratorWrapper)
	return v
end

function jk.lang.DynamicObject.StringIteratorWrapper:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DynamicObject.StringIteratorWrapper'
	self['_isType.jk.lang.DynamicObject.StringIteratorWrapper'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.iterator = nil
end

function jk.lang.DynamicObject.StringIteratorWrapper:_construct0()
	jk.lang.DynamicObject.StringIteratorWrapper._init(self)
	return self
end

function jk.lang.DynamicObject.StringIteratorWrapper:next()
	if not (self.iterator ~= nil) then
		do return nil end
	end
	do
		local c = self.iterator:getNextChar()
		if _g.jk.lang.Character:isEOF(c) then
			self.iterator = nil
			do return nil end
		end
		do return c end
	end
end

function jk.lang.DynamicObject.StringIteratorWrapper:hasNext()
	if not (self.iterator ~= nil) then
		do return false end
	end
	do return not self.iterator:hasEnded() end
end

function jk.lang.DynamicObject.StringIteratorWrapper:getIterator()
	do return self.iterator end
end

function jk.lang.DynamicObject.StringIteratorWrapper:setIterator(v)
	self.iterator = v
	do return self end
end

jk.lang.DynamicObject.BufferIteratorWrapper = {}
jk.lang.DynamicObject.BufferIteratorWrapper.__index = jk.lang.DynamicObject.BufferIteratorWrapper
_vm:set_metatable(jk.lang.DynamicObject.BufferIteratorWrapper, {})

function jk.lang.DynamicObject.BufferIteratorWrapper._create()
	local v = _vm:set_metatable({}, jk.lang.DynamicObject.BufferIteratorWrapper)
	return v
end

function jk.lang.DynamicObject.BufferIteratorWrapper:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DynamicObject.BufferIteratorWrapper'
	self['_isType.jk.lang.DynamicObject.BufferIteratorWrapper'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.buffer = nil
	self.size = 0
	self.position = 0
end

function jk.lang.DynamicObject.BufferIteratorWrapper:_construct0()
	jk.lang.DynamicObject.BufferIteratorWrapper._init(self)
	return self
end

function jk.lang.DynamicObject.BufferIteratorWrapper:next()
	if not (self.buffer ~= nil) then
		do return nil end
	end
	if self.position >= self.size then
		do return nil end
	end
	do
		local v = self.buffer[self.position + 1]
		do self.position = self.position + 1 end
		do return v end
	end
end

function jk.lang.DynamicObject.BufferIteratorWrapper:hasNext()
	if not (self.buffer ~= nil) then
		do return false end
	end
	if not (self.position < self.size - 1) then
		do return false end
	end
	do return true end
end

function jk.lang.DynamicObject.BufferIteratorWrapper:getBuffer()
	do return self.buffer end
end

function jk.lang.DynamicObject.BufferIteratorWrapper:setBuffer(v)
	self.buffer = v
	do return self end
end

function jk.lang.DynamicObject.BufferIteratorWrapper:getSize()
	do return self.size end
end

function jk.lang.DynamicObject.BufferIteratorWrapper:setSize(v)
	self.size = v
	do return self end
end

jk.lang.DynamicObject.ArrayIteratorWrapper = {}
jk.lang.DynamicObject.ArrayIteratorWrapper.__index = jk.lang.DynamicObject.ArrayIteratorWrapper
_vm:set_metatable(jk.lang.DynamicObject.ArrayIteratorWrapper, {})

function jk.lang.DynamicObject.ArrayIteratorWrapper._create()
	local v = _vm:set_metatable({}, jk.lang.DynamicObject.ArrayIteratorWrapper)
	return v
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DynamicObject.ArrayIteratorWrapper'
	self['_isType.jk.lang.DynamicObject.ArrayIteratorWrapper'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.array = nil
	self.size = 0
	self.position = 0
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:_construct0()
	jk.lang.DynamicObject.ArrayIteratorWrapper._init(self)
	return self
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:next()
	if not (self.array ~= nil) then
		do return nil end
	end
	if self.position >= self.size then
		do return nil end
	end
	do
		local v = self.array[self.position + 1]
		do self.position = self.position + 1 end
		do return v end
	end
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:hasNext()
	if not (self.array ~= nil) then
		do return false end
	end
	if not (self.position < self.size - 1) then
		do return false end
	end
	do return true end
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:getArray()
	do return self.array end
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:setArray(v)
	self.array = v
	do return self end
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:getSize()
	do return self.size end
end

function jk.lang.DynamicObject.ArrayIteratorWrapper:setSize(v)
	self.size = v
	do return self end
end

jk.lang.DynamicObject.VectorIteratorWrapper = {}
jk.lang.DynamicObject.VectorIteratorWrapper.__index = jk.lang.DynamicObject.VectorIteratorWrapper
_vm:set_metatable(jk.lang.DynamicObject.VectorIteratorWrapper, {})

function jk.lang.DynamicObject.VectorIteratorWrapper._create()
	local v = _vm:set_metatable({}, jk.lang.DynamicObject.VectorIteratorWrapper)
	return v
end

function jk.lang.DynamicObject.VectorIteratorWrapper:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DynamicObject.VectorIteratorWrapper'
	self['_isType.jk.lang.DynamicObject.VectorIteratorWrapper'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.vector = nil
	self.size = 0
	self.position = 0
end

function jk.lang.DynamicObject.VectorIteratorWrapper:_construct0()
	jk.lang.DynamicObject.VectorIteratorWrapper._init(self)
	return self
end

function jk.lang.DynamicObject.VectorIteratorWrapper:next()
	if not (self.vector ~= nil) then
		do return nil end
	end
	if self.position >= self.size then
		do return nil end
	end
	do
		local v = self.vector[self.position + 1]
		do self.position = self.position + 1 end
		do return v end
	end
end

function jk.lang.DynamicObject.VectorIteratorWrapper:hasNext()
	if not (self.vector ~= nil) then
		do return false end
	end
	if not (self.position < self.size - 1) then
		do return false end
	end
	do return true end
end

function jk.lang.DynamicObject.VectorIteratorWrapper:getVector()
	do return self.vector end
end

function jk.lang.DynamicObject.VectorIteratorWrapper:setVector(v)
	self.vector = v
	do return self end
end

function jk.lang.DynamicObject.VectorIteratorWrapper:getSize()
	do return self.size end
end

function jk.lang.DynamicObject.VectorIteratorWrapper:setSize(v)
	self.size = v
	do return self end
end

function jk.lang.DynamicObject:iterate(object)
	if (_vm:get_variable_type(object) == 'string') then
		local v = _g.jk.lang.DynamicObject.StringIteratorWrapper._construct0(_g.jk.lang.DynamicObject.StringIteratorWrapper._create())
		do v:setIterator(_g.jk.lang.String:iterate(object)) end
		do return v end
	end
	if _util:is_buffer(object) then
		local v = _g.jk.lang.DynamicObject.BufferIteratorWrapper._construct0(_g.jk.lang.DynamicObject.BufferIteratorWrapper._create())
		do v:setBuffer(object) end
		do v:setSize(#object) end
		do return v end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(object) then
		local v = _g.jk.lang.DynamicObject.ArrayIteratorWrapper._construct0(_g.jk.lang.DynamicObject.ArrayIteratorWrapper._create())
		do v:setArray(object) end
		do v:setSize(#object) end
		do return v end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(object) then
		local v = _g.jk.lang.DynamicObject.VectorIteratorWrapper._construct0(_g.jk.lang.DynamicObject.VectorIteratorWrapper._create())
		do v:setVector(object) end
		do v:setSize(_g.jk.lang.Vector:getSize(object)) end
		do return v end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x < 1 end)(object) then
		do return _g.jk.lang.DynamicObject:iterate(_g.jk.lang.Map:getValues(object)) end
	end
	do return nil end
end

jk.lang.DynamicMap = {}
jk.lang.DynamicMap.__index = jk.lang.DynamicMap
_vm:set_metatable(jk.lang.DynamicMap, {})

jk.lang.DynamicMap.nullObject = "null"

function jk.lang.DynamicMap._create()
	local v = _vm:set_metatable({}, jk.lang.DynamicMap)
	return v
end

function jk.lang.DynamicMap:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DynamicMap'
	self['_isType.jk.lang.DynamicMap'] = true
	self['_isType.jk.lang.Duplicateable'] = true
	self['_isType.jk.lang.Iterateable'] = true
	self.map = nil
end

function jk.lang.DynamicMap:asDynamicMap(object)
	if not (object ~= nil) then
		do return nil end
	end
	if (_vm:to_table_with_key(object, '_isType.jk.lang.DynamicMap') ~= nil) then
		do return object end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x < 1 end)(object) then
		do return _g.jk.lang.DynamicMap:forObjectMap(object) end
	end
	do return nil end
end

function jk.lang.DynamicMap:forObjectMap(map)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	if map ~= nil then
		local it = _g.jk.lang.Map:iterateKeys(map)
		while it ~= nil do
			local key = it:next()
			if key == nil then
				do break end
			end
			if (_vm:get_variable_type(key) == 'string') == false then
				goto _continue1
			end
			do v:setObject(key, _g.jk.lang.Map:getValue(map, key)) end
			::_continue1::
		end
	end
	do return v end
end

function jk.lang.DynamicMap:forStringMap(map)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	if map ~= nil then
		local it = _g.jk.lang.Map:iterateKeys(map)
		while it ~= nil do
			local key = it:next()
			if key == nil then
				do break end
			end
			do v:setString(key, _g.jk.lang.Map:getValue(map, key)) end
		end
	end
	do return v end
end

function jk.lang.DynamicMap:forDynamicMaps(map1, map2)
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	do v:mergeFrom(map1) end
	do v:mergeFrom(map2) end
	do return v end
end

function jk.lang.DynamicMap:forDynamicMap(map)
	if not (map ~= nil) then
		do return nil end
	end
	do return map:duplicateMap() end
end

function jk.lang.DynamicMap:_construct0()
	jk.lang.DynamicMap._init(self)
	self.map = {}
	return self
end

function jk.lang.DynamicMap:asMap()
	local v = {}
	local it = self:iterateKeys()
	while it ~= nil do
		local key = it:next()
		if not (key ~= nil) then
			do break end
		end
		do _g.jk.lang.Map:set(v, key, self:get(key)) end
	end
	do return v end
end

function jk.lang.DynamicMap:asStringMap()
	do return self:toStringMap() end
end

function jk.lang.DynamicMap:toStringMap()
	local v = {}
	local it = self:iterateKeys()
	while it ~= nil do
		local key = it:next()
		if not (key ~= nil) then
			do break end
		end
		do _g.jk.lang.Map:set(v, key, self:getString(key, nil)) end
	end
	do return v end
end

function jk.lang.DynamicMap:toObjectMap()
	local v = {}
	local it = self:iterateKeys()
	while it ~= nil do
		local key = it:next()
		if not (key ~= nil) then
			do break end
		end
		do _g.jk.lang.Map:set(v, key, self:getString(key, nil)) end
	end
	do return v end
end

function jk.lang.DynamicMap:duplicate()
	do return self:duplicateMap() end
end

function jk.lang.DynamicMap:duplicateMap()
	local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	local it = self:iterateKeys()
	while it ~= nil do
		local key = it:next()
		if key == nil then
			do break end
		end
		do v:setObject(key, self:get(key)) end
	end
	do return v end
end

function jk.lang.DynamicMap:mergeFrom(other)
	if other == nil then
		do return self end
	end
	do
		local it = other:iterateKeys()
		while it ~= nil do
			local key = it:next()
			if key == nil then
				do break end
			end
			do self:setObject(key, other:get(key)) end
		end
		do return self end
	end
end

function jk.lang.DynamicMap:setObject(key, value)
	if key ~= nil then
		if value == nil then
			self.map[key] = _g.jk.lang.DynamicMap.nullObject
		else
			self.map[key] = value
		end
	end
	do return self end
end

function jk.lang.DynamicMap:setString(key, value)
	if key ~= nil then
		if value == nil then
			self.map[key] = _g.jk.lang.DynamicMap.nullObject
		else
			self.map[key] = value
		end
	end
	do return self end
end

function jk.lang.DynamicMap:setBuffer(key, value)
	if not (key == nil) and value == nil then
		self.map[key] = _g.jk.lang.DynamicMap.nullObject
		do return self end
	end
	do return self:setObject(key, _g.jk.lang.Buffer:asObject(value)) end
end

function jk.lang.DynamicMap:setInteger(key, value)
	do return self:setObject(key, _g.jk.lang.Integer:asObject(value)) end
end

function jk.lang.DynamicMap:setLong(key, value)
	do return self:setObject(key, _g.jk.lang.LongInteger:asObject(value)) end
end

function jk.lang.DynamicMap:setLongInteger(key, value)
	do return self:setObject(key, _g.jk.lang.LongInteger:asObject(value)) end
end

function jk.lang.DynamicMap:setBoolean(key, value)
	do return self:setObject(key, _g.jk.lang.Boolean:asObject(value)) end
end

function jk.lang.DynamicMap:setDouble(key, value)
	do return self:setObject(key, _g.jk.lang.Double:asObject(value)) end
end

function jk.lang.DynamicMap:get(key)
	local v = _g.jk.lang.Map:getValue(self.map, key)
	if v == _g.jk.lang.DynamicMap.nullObject then
		v = nil
	end
	do return v end
end

function jk.lang.DynamicMap:getString(key, defval)
	local v = _g.jk.lang.String:asString(self:get(key))
	if v == nil then
		do return defval end
	end
	do return v end
end

function jk.lang.DynamicMap:getInteger(key, defval)
	local vv = self:get(key)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.Integer:asInteger(vv) end
end

function jk.lang.DynamicMap:getLongInteger(key, defval)
	local vv = self:get(key)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.LongInteger:asLong(vv) end
end

function jk.lang.DynamicMap:getBoolean(key, defval)
	local vv = self:get(key)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.Boolean:asBoolean(vv, false) end
end

function jk.lang.DynamicMap:getDouble(key, defval)
	local vv = self:get(key)
	if vv == nil then
		do return defval end
	end
	do return _g.jk.lang.Double:asDouble(vv) end
end

function jk.lang.DynamicMap:getBuffer(key)
	local vv = self:get(key)
	if not (vv ~= nil) then
		do return nil end
	end
	do return _g.jk.lang.Buffer:asBuffer(vv) end
end

function jk.lang.DynamicMap:getDynamicVector(key)
	local vv = _vm:to_table_with_key(self:get(key), '_isType.jk.lang.DynamicVector')
	if vv ~= nil then
		do return vv end
	end
	do
		local v = self:getVector(key)
		if v ~= nil then
			do return _g.jk.lang.DynamicVector:forObjectVector(v) end
		end
		do return nil end
	end
end

function jk.lang.DynamicMap:getVector(key)
	local val = self:get(key)
	if not (val ~= nil) then
		do return nil end
	end
	if (function(x) return x ~= nil and _vm:get_variable_type(x) == 'table' and not x._isClassInstance == true and #x > 0 end)(val) then
		do return val end
	end
	if (_vm:to_table_with_key(val, '_isType.jk.lang.VectorObject') ~= nil) then
		local vo = val
		local vv = vo:toVector()
		do return vv end
	end
	do return nil end
end

function jk.lang.DynamicMap:getDynamicMap(key)
	do return _vm:to_table_with_key(self:get(key), '_isType.jk.lang.DynamicMap') end
end

function jk.lang.DynamicMap:getKeys()
	local v = _g.jk.lang.Map:getKeys(self.map)
	do return v end
end

function jk.lang.DynamicMap:getValues()
	local v = _g.jk.lang.Map:getValues(self.map)
	local v2 = {}
	if v ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(v)
		do
			n = 0
			while n < m do
				local o = v[n + 1]
				if o ~= nil then
					if o ~= _g.jk.lang.DynamicMap.nullObject then
						do _g.jk.lang.Vector:append(v2, o) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	v = v2
	do return v end
end

function jk.lang.DynamicMap:iterate()
	local v = _g.jk.lang.Map:iterateKeys(self.map)
	do return v end
end

function jk.lang.DynamicMap:iterateKeys()
	local v = _g.jk.lang.Map:iterateKeys(self.map)
	do return v end
end

function jk.lang.DynamicMap:iterateValues()
	do return _g.jk.lang.Vector:iterate(self:getValues()) end
end

function jk.lang.DynamicMap:remove(key)
	do _g.jk.lang.Map:remove(self.map, key) end
end

function jk.lang.DynamicMap:clear()
	do _g.jk.lang.Map:clear(self.map) end
end

function jk.lang.DynamicMap:getCount()
	do return _g.jk.lang.Map:count(self.map) end
end

function jk.lang.DynamicMap:containsKey(key)
	do return _g.jk.lang.Map:containsKey(self.map, key) end
end

function jk.lang.DynamicMap:removeNullValues()
	local keys = self:getKeys()
	if keys ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(keys)
		do
			n = 0
			while n < m do
				local key = keys[n + 1]
				if key ~= nil then
					local value = self:get(key)
					if value == nil then
						do self:remove(key) end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return self end
end

jk.lang.KeyValueListForStrings = _g.jk.lang.KeyValueList._create()
jk.lang.KeyValueListForStrings.__index = jk.lang.KeyValueListForStrings
_vm:set_metatable(jk.lang.KeyValueListForStrings, {
	__index = _g.jk.lang.KeyValueList
})

function jk.lang.KeyValueListForStrings._create()
	local v = _vm:set_metatable({}, jk.lang.KeyValueListForStrings)
	return v
end

function jk.lang.KeyValueListForStrings:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.KeyValueListForStrings'
	self['_isType.jk.lang.KeyValueListForStrings'] = true
end

function jk.lang.KeyValueListForStrings:_construct0()
	jk.lang.KeyValueListForStrings._init(self)
	do _g.jk.lang.KeyValueList._construct0(self) end
	return self
end

jk.lang.RunnableFunction = {}
jk.lang.RunnableFunction.__index = jk.lang.RunnableFunction
_vm:set_metatable(jk.lang.RunnableFunction, {})

function jk.lang.RunnableFunction._create()
	local v = _vm:set_metatable({}, jk.lang.RunnableFunction)
	return v
end

function jk.lang.RunnableFunction:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.RunnableFunction'
	self['_isType.jk.lang.RunnableFunction'] = true
	self['_isType.jk.lang.Runnable'] = true
	self._function = nil
end

function jk.lang.RunnableFunction:_construct0()
	jk.lang.RunnableFunction._init(self)
	return self
end

function jk.lang.RunnableFunction:forFunction(_function)
	local v = _g.jk.lang.RunnableFunction._construct0(_g.jk.lang.RunnableFunction._create())
	do v:setFunction(_function) end
	do return v end
end

function jk.lang.RunnableFunction:run()
	if self._function ~= nil then
		do self._function() end
	end
end

function jk.lang.RunnableFunction:getFunction()
	do return self._function end
end

function jk.lang.RunnableFunction:setFunction(v)
	self._function = v
	do return self end
end

jk.lang.DateTime = {}
jk.lang.DateTime.__index = jk.lang.DateTime
_vm:set_metatable(jk.lang.DateTime, {})

function jk.lang.DateTime._create()
	local v = _vm:set_metatable({}, jk.lang.DateTime)
	return v
end

function jk.lang.DateTime:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.DateTime'
	self['_isType.jk.lang.DateTime'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.timezoneOffset = 0
	self.weekDay = 0
	self.dayOfMonth = 0
	self.month = 0
	self.year = 0
	self.hours = 0
	self.minutes = 0
	self.seconds = 0
end

function jk.lang.DateTime:_construct0()
	jk.lang.DateTime._init(self)
	return self
end

function jk.lang.DateTime:forSeconds(seconds)
	local v = _g.jk.lang.DateTime._construct0(_g.jk.lang.DateTime._create())
	do v:updateFromTimestamp(seconds) end
	do return v end
end

function jk.lang.DateTime:forTimeValue(tv)
	if not (tv ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.lang.DateTime._construct0(_g.jk.lang.DateTime._create())
		do v:updateFromTimestamp(tv:getSeconds()) end
		do return v end
	end
end

function jk.lang.DateTime:forString(string)
	if not (string ~= nil) then
		do return nil end
	end
	do
		local comps = _g.jk.lang.String:split(string, 32, 2)
		if not (comps ~= nil) then
			do return nil end
		end
		do
			local c0 = _g.jk.lang.Vector:get(comps, 0)
			local c1 = _g.jk.lang.Vector:get(comps, 1)
			if not _g.jk.lang.String:isNotEmpty(c0) then
				do return nil end
			end
			do
				local comps2 = _g.jk.lang.String:split(c0, 45, 3)
				if not (comps2 ~= nil) then
					do return nil end
				end
				if not (_g.jk.lang.Vector:getSize(comps2) == 3) then
					do return nil end
				end
				do
					local v = _g.jk.lang.DateTime._construct0(_g.jk.lang.DateTime._create())
					do v:setYear(_g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(comps2, 0))) end
					do v:setMonth(_g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(comps2, 1))) end
					do v:setDayOfMonth(_g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(comps2, 2))) end
					if _g.jk.lang.String:isNotEmpty(c1) then
						local tcs = _g.jk.lang.String:split(c1, 58, 3)
						if _g.jk.lang.Vector:getSize(tcs) == 3 then
							do v:setHours(_g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(tcs, 0))) end
							do v:setMinutes(_g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(tcs, 1))) end
							do v:setSeconds(_g.jk.lang.String:toInteger(_g.jk.lang.Vector:get(tcs, 2))) end
						end
					end
					do return v end
				end
			end
		end
	end
end

function jk.lang.DateTime:updateFromTimestamp(seconds)
	local o = self
	do o.weekDay, o.dayOfMonth, o.month, o.year, o.hours, o.minutes, o.seconds = _os:get_timestamp_details_utc(seconds) end
end

function jk.lang.DateTime:toStringDate(delim)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(self:getYear(), 4, nil)) end
	if delim > 0 then
		do sb:appendCharacter(delim) end
	end
	do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(self:getMonth(), 2, nil)) end
	if delim > 0 then
		do sb:appendCharacter(delim) end
	end
	do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(self:getDayOfMonth(), 2, nil)) end
	do return sb:toString() end
end

function jk.lang.DateTime:toStringTime(delim)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(self:getHours(), 2, nil)) end
	if delim > 0 then
		do sb:appendCharacter(delim) end
	end
	do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(self:getMinutes(), 2, nil)) end
	if delim > 0 then
		do sb:appendCharacter(delim) end
	end
	do sb:appendString(_g.jk.lang.String:forIntegerWithPadding(self:getSeconds(), 2, nil)) end
	do return sb:toString() end
end

function jk.lang.DateTime:toStringDateTime()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(self:toStringDate(45)) end
	do sb:appendString(" ") end
	do sb:appendString(self:toStringTime(58)) end
	do return sb:toString() end
end

function jk.lang.DateTime:toString()
	do return self:toStringDateTime() end
end

function jk.lang.DateTime:getTimezoneOffset()
	do return self.timezoneOffset end
end

function jk.lang.DateTime:setTimezoneOffset(v)
	self.timezoneOffset = v
	do return self end
end

function jk.lang.DateTime:getWeekDay()
	do return self.weekDay end
end

function jk.lang.DateTime:setWeekDay(v)
	self.weekDay = v
	do return self end
end

function jk.lang.DateTime:getDayOfMonth()
	do return self.dayOfMonth end
end

function jk.lang.DateTime:setDayOfMonth(v)
	self.dayOfMonth = v
	do return self end
end

function jk.lang.DateTime:getMonth()
	do return self.month end
end

function jk.lang.DateTime:setMonth(v)
	self.month = v
	do return self end
end

function jk.lang.DateTime:getYear()
	do return self.year end
end

function jk.lang.DateTime:setYear(v)
	self.year = v
	do return self end
end

function jk.lang.DateTime:getHours()
	do return self.hours end
end

function jk.lang.DateTime:setHours(v)
	self.hours = v
	do return self end
end

function jk.lang.DateTime:getMinutes()
	do return self.minutes end
end

function jk.lang.DateTime:setMinutes(v)
	self.minutes = v
	do return self end
end

function jk.lang.DateTime:getSeconds()
	do return self.seconds end
end

function jk.lang.DateTime:setSeconds(v)
	self.seconds = v
	do return self end
end

jk.lang.EventLoop = {}

jk.lang.BufferBuilder = {}
jk.lang.BufferBuilder.__index = jk.lang.BufferBuilder
_vm:set_metatable(jk.lang.BufferBuilder, {})

function jk.lang.BufferBuilder._create()
	local v = _vm:set_metatable({}, jk.lang.BufferBuilder)
	return v
end

function jk.lang.BufferBuilder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.lang.BufferBuilder'
	self['_isType.jk.lang.BufferBuilder'] = true
	self.buffer = nil
	self.pointer = 0
end

function jk.lang.BufferBuilder:_construct0()
	jk.lang.BufferBuilder._init(self)
	return self
end

function jk.lang.BufferBuilder:allocate(sz)
	if self.buffer == nil then
		self.buffer = _util:allocate_buffer(8192)
		do return end
	end
	do
		local needed = self.pointer + sz
		local csz = _g.jk.lang.Buffer:getSize(self.buffer)
		if csz >= needed then
			do return end
		end
		do
			local nsz = csz
			while nsz < needed do
				nsz = nsz + 1024
			end
			self.buffer = _g.jk.lang.Buffer:resize(self.buffer, nsz)
		end
	end
end

function jk.lang.BufferBuilder:getSize()
	do return self.pointer end
end

function jk.lang.BufferBuilder:appendInteger(value)
	do self:allocate(self.pointer + 1) end
	do _g.jk.lang.Buffer:setByte(self.buffer, self.pointer, value) end
	do self.pointer = self.pointer + 1 end
end

function jk.lang.BufferBuilder:appendBuffer(sbuffer)
	do self:appendSubBuffer(sbuffer, 0, _g.jk.lang.Buffer:getSize(sbuffer)) end
end

function jk.lang.BufferBuilder:appendSubBuffer(sbuffer, offset, size)
	if not (sbuffer ~= nil) then
		do return end
	end
	if not (offset >= 0) then
		do return end
	end
	if not (size >= 0) then
		do return end
	end
	do self:allocate(self.pointer + size) end
	do _g.jk.lang.Buffer:copyFrom(self.buffer, sbuffer, offset, self.pointer, size) end
	self.pointer = self.pointer + size
end

function jk.lang.BufferBuilder:toBuffer()
	do return _g.jk.lang.Buffer:getSubBuffer(self.buffer, 0, self.pointer, false) end
end
