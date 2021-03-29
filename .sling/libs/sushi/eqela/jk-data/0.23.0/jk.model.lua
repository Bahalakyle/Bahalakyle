jk = jk or {}

jk.model = jk.model or {}

jk.model.DynamicModel = {}
jk.model.DynamicModel.__index = jk.model.DynamicModel
_vm:set_metatable(jk.model.DynamicModel, {})

function jk.model.DynamicModel._create()
	local v = _vm:set_metatable({}, jk.model.DynamicModel)
	return v
end

function jk.model.DynamicModel:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.model.DynamicModel'
	self['_isType.jk.model.DynamicModel'] = true
	self['_isType.jk.json.JSONObject'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.dataValue = nil
	self.fieldsValue = nil
end

function jk.model.DynamicModel:asDynamicMap(object)
	if not (object ~= nil) then
		do return nil end
	end
	do return object:toDynamicMap() end
end

function jk.model.DynamicModel:_construct0()
	jk.model.DynamicModel._init(self)
	do self:setData(nil) end
	return self
end

function jk.model.DynamicModel:_construct1(data)
	jk.model.DynamicModel._init(self)
	do self:setData(data) end
	return self
end

function jk.model.DynamicModel:_construct2(data, mapping)
	jk.model.DynamicModel._init(self)
	do self:setData(nil) end
	do self:copyFrom(data, mapping) end
	return self
end

function jk.model.DynamicModel:toString()
	do return _g.jk.json.JSONEncoder:toString(self:toDynamicMap()) end
end

function jk.model.DynamicModel:toDynamicMap()
	do return self:getData() end
end

function jk.model.DynamicModel:fromDynamicMap(data)
	do self:setData(data) end
end

function jk.model.DynamicModel:toJsonObject()
	do return self:toDynamicMap() end
end

function jk.model.DynamicModel:setField(name, value)
	do self:getData():setObject(name, value) end
end

function jk.model.DynamicModel:getField(name)
	do return self:getData():get(name) end
end

function jk.model.DynamicModel:getOrCreateFieldAsDynamicVector(name)
	local v = self:getData():getDynamicVector(name)
	if not (v ~= nil) then
		v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
		do self:getData():setObject(name, v) end
	end
	do return v end
end

function jk.model.DynamicModel:getFieldAsDynamicVector(name)
	do return self:getData():getDynamicVector(name) end
end

function jk.model.DynamicModel:getFieldAsStringVector(name)
	local v = self:getFieldAsDynamicVector(name)
	if not (v ~= nil) then
		do return nil end
	end
	do return v:toVectorOfStrings() end
end

function jk.model.DynamicModel:getFieldAsIntegerVector(name)
	local vector = self:getFieldAsDynamicVector(name)
	if not (vector ~= nil) then
		do return nil end
	end
	do
		local v = {}
		do
			local _vl = vector
			if _vl ~= nil then
				local _it = _vl:iterate()
				while _it ~= nil and _it:hasNext() do
					local o = _it:next()
					if o ~= nil then
						goto _continue1
					end
					do _g.jk.lang.Vector:append(v, _g.jk.lang.Integer:asInteger(o)) end
					::_continue1::
				end
			end
		end
		do return v end
	end
end

function jk.model.DynamicModel:getFieldAsLongIntegerVector(name)
	local vector = self:getFieldAsDynamicVector(name)
	if not (vector ~= nil) then
		do return nil end
	end
	do
		local v = {}
		do
			local _vl = vector
			if _vl ~= nil then
				local _it = _vl:iterate()
				while _it ~= nil and _it:hasNext() do
					local o = _it:next()
					if o ~= nil then
						goto _continue2
					end
					do _g.jk.lang.Vector:append(v, _g.jk.lang.LongInteger:asLong(o)) end
					::_continue2::
				end
			end
		end
		do return v end
	end
end

function jk.model.DynamicModel:getFieldAsDoubleVector(name)
	local vector = self:getFieldAsDynamicVector(name)
	if not (vector ~= nil) then
		do return nil end
	end
	do
		local v = {}
		do
			local _vl = vector
			if _vl ~= nil then
				local _it = _vl:iterate()
				while _it ~= nil and _it:hasNext() do
					local o = _it:next()
					if o ~= nil then
						goto _continue3
					end
					do _g.jk.lang.Vector:append(v, _g.jk.lang.Double:asDouble(o)) end
					::_continue3::
				end
			end
		end
		do return v end
	end
end

function jk.model.DynamicModel:getFieldAsBooleanVector(name)
	local vector = self:getFieldAsDynamicVector(name)
	if not (vector ~= nil) then
		do return nil end
	end
	do
		local v = {}
		do
			local _vl = vector
			if _vl ~= nil then
				local _it = _vl:iterate()
				while _it ~= nil and _it:hasNext() do
					local o = _it:next()
					if o ~= nil then
						goto _continue4
					end
					do _g.jk.lang.Vector:append(v, _g.jk.lang.Boolean:asBoolean(o, false)) end
					::_continue4::
				end
			end
		end
		do return v end
	end
end

function jk.model.DynamicModel:addStringToVectorField(field, value)
	do self:getOrCreateFieldAsDynamicVector(field):appendString(value) end
end

function jk.model.DynamicModel:addIntegerToVectorField(field, value)
	do self:getOrCreateFieldAsDynamicVector(field):appendInteger(value) end
end

function jk.model.DynamicModel:addLongIntegerToVectorField(field, value)
	do self:getOrCreateFieldAsDynamicVector(field):appendLong(value) end
end

function jk.model.DynamicModel:addDoubleToVectorField(field, value)
	do self:getOrCreateFieldAsDynamicVector(field):appendDouble(value) end
end

function jk.model.DynamicModel:addBooleanToVectorField(field, value)
	do self:getOrCreateFieldAsDynamicVector(field):appendBoolean(value) end
end

function jk.model.DynamicModel:addBufferToVectorField(field, value)
	do self:getOrCreateFieldAsDynamicVector(field):appendObject(value) end
end

function jk.model.DynamicModel:addObjectToVectorField(field, value)
	do self:getOrCreateFieldAsDynamicVector(field):appendObject(value) end
end

function jk.model.DynamicModel:fromJsonObject(o)
	local data = _vm:to_table_with_key(o, '_isType.jk.lang.DynamicMap')
	if data ~= nil then
		do self:fromDynamicMap(data) end
	else
		do self:clear() end
	end
	do return true end
end

function jk.model.DynamicModel:containsField(field)
	if not (field ~= nil) then
		do return false end
	end
	do
		local array = self:getFields()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local ff = array[n + 1]
					if ff ~= nil then
						if ff == field then
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

function jk.model.DynamicModel:hasValue(key)
	if not (key ~= nil) then
		do return false end
	end
	do return self:getData():containsKey(key) end
end

function jk.model.DynamicModel:removeNullValues()
	if self.dataValue ~= nil then
		do self.dataValue:removeNullValues() end
	end
end

function jk.model.DynamicModel:clear()
	self.dataValue = nil
end

function jk.model.DynamicModel:setAllFields()
	local array = self:getFields()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local field = array[n + 1]
				if field ~= nil then
					if not self:getData():containsKey(field:getName()) then
						do self:getData():setObject(field:getName(), nil) end
					end
				end
				do n = n + 1 end
			end
		end
	end
end

function jk.model.DynamicModel:getModelMetadata()
	do return nil end
end

function jk.model.DynamicModel:getFieldInformation()
	do return nil end
end

function jk.model.DynamicModel:copyFrom(other, mapping)
	if not (other ~= nil) then
		do return end
	end
	do
		local array = self:getFields()
		if array ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(array)
			do
				n = 0
				while n < m do
					local field = array[n + 1]
					if field ~= nil then
						local fname = field:getName()
						local oname = nil
						if mapping ~= nil and mapping:containsKey(fname) then
							oname = mapping:getString(fname, nil)
						else
							oname = fname
						end
						if oname ~= nil and other:hasValue(oname) then
							do self:setField(fname, other:getField(oname)) end
						end
					end
					do n = n + 1 end
				end
			end
		end
	end
end

function jk.model.DynamicModel:getData()
	if not (self.dataValue ~= nil) then
		self.dataValue = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	end
	do return self.dataValue end
end

function jk.model.DynamicModel:doSetData(value)
	self.dataValue = value
end

function jk.model.DynamicModel:setData(v)
	do self:doSetData(v) end
	do return v end
end

function jk.model.DynamicModel:getFields()
	if not (self.fieldsValue ~= nil) then
		self.fieldsValue = {}
		do
			local array = self:getFieldInformation()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local name = array[n + 1]
						if name ~= nil then
							do _g.jk.lang.Vector:append(self.fieldsValue, name) end
						end
						do n = n + 1 end
					end
				end
			end
		end
	end
	do return self.fieldsValue end
end

function jk.model.DynamicModel:doSetFields(value)
	self.fieldsValue = value
end

function jk.model.DynamicModel:setFields(v)
	do self:doSetFields(v) end
	do return v end
end

jk.model.DynamicModelField = {}
jk.model.DynamicModelField.__index = jk.model.DynamicModelField
_vm:set_metatable(jk.model.DynamicModelField, {})

jk.model.DynamicModelField.TYPE_UNKNOWN = 0
jk.model.DynamicModelField.TYPE_OBJECT = 1
jk.model.DynamicModelField.TYPE_STRING = 2
jk.model.DynamicModelField.TYPE_BUFFER = 3
jk.model.DynamicModelField.TYPE_INTEGER = 4
jk.model.DynamicModelField.TYPE_LONG_INTEGER = 5
jk.model.DynamicModelField.TYPE_DOUBLE = 6
jk.model.DynamicModelField.TYPE_BOOLEAN = 7
jk.model.DynamicModelField.TYPE_VECTOR = 8
jk.model.DynamicModelField.TYPE_MAP = 9

function jk.model.DynamicModelField._create()
	local v = _vm:set_metatable({}, jk.model.DynamicModelField)
	return v
end

function jk.model.DynamicModelField:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.model.DynamicModelField'
	self['_isType.jk.model.DynamicModelField'] = true
	self._name = nil
	self._encodedName = nil
	self._type = 0
	self._description = nil
	self._tags = nil
end

function jk.model.DynamicModelField:_construct0()
	jk.model.DynamicModelField._init(self)
	return self
end

function jk.model.DynamicModelField:hasTag(tag)
	local array = self:getTags()
	if array ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(array)
		do
			n = 0
			while n < m do
				local tt = array[n + 1]
				if tt ~= nil then
					if tt == tag then
						do return true end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return false end
end

function jk.model.DynamicModelField:addToTags(tag)
	if not (tag ~= nil) then
		do return end
	end
	if not (self:getTags() ~= nil) then
		do self:setTags({}) end
	end
	do _g.jk.lang.Vector:append(self:getTags(), tag) end
end

function jk.model.DynamicModelField:getName()
	do return self._name end
end

function jk.model.DynamicModelField:doSetName(value)
	self._name = value
end

function jk.model.DynamicModelField:setName(v)
	do self:doSetName(v) end
	do return v end
end

function jk.model.DynamicModelField:getEncodedName()
	do return self._encodedName end
end

function jk.model.DynamicModelField:doSetEncodedName(value)
	self._encodedName = value
end

function jk.model.DynamicModelField:setEncodedName(v)
	do self:doSetEncodedName(v) end
	do return v end
end

function jk.model.DynamicModelField:getType()
	do return self._type end
end

function jk.model.DynamicModelField:doSetType(value)
	self._type = value
end

function jk.model.DynamicModelField:setType(v)
	do self:doSetType(v) end
	do return v end
end

function jk.model.DynamicModelField:getDescription()
	do return self._description end
end

function jk.model.DynamicModelField:doSetDescription(value)
	self._description = value
end

function jk.model.DynamicModelField:setDescription(v)
	do self:doSetDescription(v) end
	do return v end
end

function jk.model.DynamicModelField:getTags()
	do return self._tags end
end

function jk.model.DynamicModelField:doSetTags(value)
	self._tags = value
end

function jk.model.DynamicModelField:setTags(v)
	do self:doSetTags(v) end
	do return v end
end
