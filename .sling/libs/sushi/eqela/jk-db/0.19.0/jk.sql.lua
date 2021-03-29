jk = jk or {}

jk.sql = jk.sql or {}

jk.sql.SQLStatement = {}

jk.sql.SQLResultSetIterator = {}
jk.sql.SQLResultSetIterator.__index = jk.sql.SQLResultSetIterator
_vm:set_metatable(jk.sql.SQLResultSetIterator, {})

function jk.sql.SQLResultSetIterator._create()
	local v = _vm:set_metatable({}, jk.sql.SQLResultSetIterator)
	return v
end

function jk.sql.SQLResultSetIterator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.sql.SQLResultSetIterator'
	self['_isType.jk.sql.SQLResultSetIterator'] = true
	self['_isType.jk.lang.Iterator'] = true
end

function jk.sql.SQLResultSetIterator:_construct0()
	jk.sql.SQLResultSetIterator._init(self)
	return self
end

function jk.sql.SQLResultSetIterator:next()
end

function jk.sql.SQLResultSetIterator:hasNext()
end

function jk.sql.SQLResultSetIterator:nextValues(values)
end

function jk.sql.SQLResultSetIterator:step()
end

function jk.sql.SQLResultSetIterator:getColumnCount()
end

function jk.sql.SQLResultSetIterator:getColumnName(n)
end

function jk.sql.SQLResultSetIterator:getColumnNames()
end

function jk.sql.SQLResultSetIterator:getColumnObject(n)
end

function jk.sql.SQLResultSetIterator:getColumnInt(n)
end

function jk.sql.SQLResultSetIterator:getColumnLong(n)
end

function jk.sql.SQLResultSetIterator:getColumnDouble(n)
end

function jk.sql.SQLResultSetIterator:getColumnBuffer(n)
end

function jk.sql.SQLResultSetIterator:close()
end

function jk.sql.SQLResultSetIterator:toVectorOfMaps()
	local v = _g.jk.lang.DynamicVector._construct0(_g.jk.lang.DynamicVector._create())
	while true do
		local o = self:next()
		if o == nil then
			do break end
		end
		do v:appendObject(o) end
	end
	do return v end
end

function jk.sql.SQLResultSetIterator:toVectorList()
	local data = {}
	local cc = self:getColumnCount()
	local cols = {}
	do _g.jk.lang.Vector:setCapacity(cols, cc) end
	do
		local n = 0
		while n < cc do
			do _g.jk.lang.Vector:append(cols, self:getColumnName(n)) end
			do n = n + 1 end
		end
	end
	do _g.jk.lang.Vector:append(data, cols) end
	while true do
		if not self:step() then
			do break end
		end
		do
			local record = {}
			do _g.jk.lang.Vector:setCapacity(record, cc) end
			do
				local n = 0
				while n < cc do
					local co = self:getColumnObject(n)
					if co == nil then
						co = ""
					end
					do _g.jk.lang.Vector:append(record, co) end
					do n = n + 1 end
				end
			end
			do _g.jk.lang.Vector:append(data, record) end
		end
	end
	do return data end
end

function jk.sql.SQLResultSetIterator:headerJSON(sb)
	do sb:appendCharacter(91) end
	do
		local cc = self:getColumnCount()
		do
			local n = 0
			while n < cc do
				if n > 0 then
					do sb:appendCharacter(44) end
				end
				do _g.jk.json.JSONEncoder:encodeToBuilder(self:getColumnName(n), sb) end
				do n = n + 1 end
			end
		end
		do sb:appendCharacter(93) end
	end
end

function jk.sql.SQLResultSetIterator:nextJSON(sb)
	if not self:step() then
		do return false end
	end
	do
		local cc = self:getColumnCount()
		do sb:appendString(",[") end
		do
			local n = 0
			while n < cc do
				if n > 0 then
					do sb:appendCharacter(44) end
				end
				do _g.jk.json.JSONEncoder:encodeToBuilder(self:getColumnObject(n), sb) end
				do n = n + 1 end
			end
		end
		do sb:appendCharacter(93) end
		do return true end
	end
end

function jk.sql.SQLResultSetIterator:toVectorListJSON()
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendCharacter(91) end
	do self:headerJSON(sb) end
	while true do
		if not self:nextJSON(sb) then
			do break end
		end
	end
	do sb:appendCharacter(93) end
	do return sb:toString() end
end

jk.sql.SQLResultSetSingleColumnIterator = {}
jk.sql.SQLResultSetSingleColumnIterator.__index = jk.sql.SQLResultSetSingleColumnIterator
_vm:set_metatable(jk.sql.SQLResultSetSingleColumnIterator, {})

function jk.sql.SQLResultSetSingleColumnIterator._create()
	local v = _vm:set_metatable({}, jk.sql.SQLResultSetSingleColumnIterator)
	return v
end

function jk.sql.SQLResultSetSingleColumnIterator:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.sql.SQLResultSetSingleColumnIterator'
	self['_isType.jk.sql.SQLResultSetSingleColumnIterator'] = true
	self['_isType.jk.lang.DynamicIterator'] = true
	self['_isType.jk.lang.StringIterator'] = true
	self['_isType.jk.lang.IntegerIterator'] = true
	self['_isType.jk.lang.LongIntegerIterator'] = true
	self['_isType.jk.lang.DoubleIterator'] = true
	self['_isType.jk.lang.BooleanIterator'] = true
	self['_isType.jk.lang.Iterator'] = true
	self.iterator = nil
	self.columnName = nil
end

function jk.sql.SQLResultSetSingleColumnIterator:_construct0()
	jk.sql.SQLResultSetSingleColumnIterator._init(self)
	return self
end

function jk.sql.SQLResultSetSingleColumnIterator:nextMap()
	if not (self.iterator ~= nil) then
		do return nil end
	end
	do
		local r = self.iterator:next()
		if not (r ~= nil) then
			do return nil end
		end
		do return r end
	end
end

function jk.sql.SQLResultSetSingleColumnIterator:next()
	local m = self:nextMap()
	if not (m ~= nil) then
		do return nil end
	end
	do return m:get(self.columnName) end
end

function jk.sql.SQLResultSetSingleColumnIterator:hasNext()
	if not (self.iterator ~= nil) then
		do return false end
	end
	do return true end
end

function jk.sql.SQLResultSetSingleColumnIterator:nextString()
	local m = self:nextMap()
	if not (m ~= nil) then
		do return nil end
	end
	do return m:getString(self.columnName, nil) end
end

function jk.sql.SQLResultSetSingleColumnIterator:nextInteger()
	local m = self:nextMap()
	if m == nil then
		do return 0 end
	end
	do return m:getInteger(self.columnName, 0) end
end

function jk.sql.SQLResultSetSingleColumnIterator:nextLong()
	local m = self:nextMap()
	if m == nil then
		do return 0 end
	end
	do return m:getLongInteger(self.columnName, 0) end
end

function jk.sql.SQLResultSetSingleColumnIterator:nextDouble()
	local m = self:nextMap()
	if m == nil then
		do return 0.0 end
	end
	do return m:getDouble(self.columnName, 0.0) end
end

function jk.sql.SQLResultSetSingleColumnIterator:nextBoolean()
	local m = self:nextMap()
	if m == nil then
		do return false end
	end
	do return m:getBoolean(self.columnName, false) end
end

function jk.sql.SQLResultSetSingleColumnIterator:getIterator()
	do return self.iterator end
end

function jk.sql.SQLResultSetSingleColumnIterator:setIterator(v)
	self.iterator = v
	do return self end
end

function jk.sql.SQLResultSetSingleColumnIterator:getColumnName()
	do return self.columnName end
end

function jk.sql.SQLResultSetSingleColumnIterator:setColumnName(v)
	self.columnName = v
	do return self end
end

jk.sql.SQLTableColumnIndexInfo = {}
jk.sql.SQLTableColumnIndexInfo.__index = jk.sql.SQLTableColumnIndexInfo
_vm:set_metatable(jk.sql.SQLTableColumnIndexInfo, {})

function jk.sql.SQLTableColumnIndexInfo._create()
	local v = _vm:set_metatable({}, jk.sql.SQLTableColumnIndexInfo)
	return v
end

function jk.sql.SQLTableColumnIndexInfo:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.sql.SQLTableColumnIndexInfo'
	self['_isType.jk.sql.SQLTableColumnIndexInfo'] = true
	self.columns = nil
	self.unique = false
end

function jk.sql.SQLTableColumnIndexInfo:_construct0()
	jk.sql.SQLTableColumnIndexInfo._init(self)
	return self
end

function jk.sql.SQLTableColumnIndexInfo:addColumn(column)
	if _g.jk.lang.String:isNotEmpty(column) then
		if not (self.columns ~= nil) then
			self.columns = {}
		end
		do _g.jk.lang.Vector:append(self.columns, column) end
	end
	do return self end
end

function jk.sql.SQLTableColumnIndexInfo:getColumns()
	do return self.columns end
end

function jk.sql.SQLTableColumnIndexInfo:setColumns(v)
	self.columns = v
	do return self end
end

function jk.sql.SQLTableColumnIndexInfo:getUnique()
	do return self.unique end
end

function jk.sql.SQLTableColumnIndexInfo:setUnique(v)
	self.unique = v
	do return self end
end

jk.sql.SQLTableInfo = {}
jk.sql.SQLTableInfo.__index = jk.sql.SQLTableInfo
_vm:set_metatable(jk.sql.SQLTableInfo, {})

function jk.sql.SQLTableInfo._create()
	local v = _vm:set_metatable({}, jk.sql.SQLTableInfo)
	return v
end

function jk.sql.SQLTableInfo:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.sql.SQLTableInfo'
	self['_isType.jk.sql.SQLTableInfo'] = true
	self.name = nil
	self.columns = nil
	self.indexes = nil
end

function jk.sql.SQLTableInfo:_construct0()
	jk.sql.SQLTableInfo._init(self)
	return self
end

function jk.sql.SQLTableInfo:forName(name)
	do return _g.jk.sql.SQLTableInfo._construct0(_g.jk.sql.SQLTableInfo._create()):setName(name) end
end

function jk.sql.SQLTableInfo:forDetails(name, columns, indexes, uniqueIndexes)
	local v = _g.jk.sql.SQLTableInfo._construct0(_g.jk.sql.SQLTableInfo._create())
	do v:setName(name) end
	if columns ~= nil then
		local n = 0
		local m = #columns
		do
			n = 0
			while n < m do
				local column = columns[n + 1]
				if column ~= nil then
					do v:addColumn(column) end
				end
				do n = n + 1 end
			end
		end
	end
	if indexes ~= nil then
		local n2 = 0
		local m2 = #indexes
		do
			n2 = 0
			while n2 < m2 do
				local index = indexes[n2 + 1]
				if index ~= nil then
					do v:addIndex(index) end
				end
				do n2 = n2 + 1 end
			end
		end
	end
	if uniqueIndexes ~= nil then
		local n3 = 0
		local m3 = #uniqueIndexes
		do
			n3 = 0
			while n3 < m3 do
				local uniqueIndex = uniqueIndexes[n3 + 1]
				if uniqueIndex ~= nil then
					do v:addUniqueIndex(uniqueIndex) end
				end
				do n3 = n3 + 1 end
			end
		end
	end
	do return v end
end

function jk.sql.SQLTableInfo:forDynamicModel(tableName, model)
	if not (model ~= nil) then
		do return nil end
	end
	do
		local table = tableName
		if _g.jk.lang.String:isEmpty(table) then
			local meta = _vm:to_table_with_key(_g.jk.json.JSONParser:parseString(model:getModelMetadata()), '_isType.jk.lang.DynamicMap')
			if meta ~= nil then
				table = meta:getString("table", nil)
			end
		end
		if not _g.jk.lang.String:isNotEmpty(table) then
			do return nil end
		end
		do
			local v = _g.jk.sql.SQLTableInfo:forName(table)
			local array = model:getFields()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local field = array[n + 1]
						if field ~= nil then
							local fieldName = field:getEncodedName()
							if _g.jk.lang.String:isEmpty(fieldName) then
								fieldName = field:getName()
							end
							if field:getType() == _g.jk.model.DynamicModelField.TYPE_STRING then
								if field:hasTag("key") then
									do v:addStringKeyColumn(fieldName) end
								elseif field:hasTag("index") then
									do v:addStringColumn(fieldName) end
								else
									do v:addTextColumn(fieldName) end
								end
							elseif field:getType() == _g.jk.model.DynamicModelField.TYPE_INTEGER then
								if field:hasTag("key") then
									do v:addIntegerKeyColumn(fieldName) end
								else
									do v:addIntegerColumn(fieldName) end
								end
							elseif field:getType() == _g.jk.model.DynamicModelField.TYPE_LONG_INTEGER then
								if field:hasTag("key") then
									do v:addLongKeyColumn(fieldName) end
								else
									do v:addLongColumn(fieldName) end
								end
							elseif field:getType() == _g.jk.model.DynamicModelField.TYPE_BOOLEAN then
								do v:addIntegerColumn(fieldName) end
							elseif field:getType() == _g.jk.model.DynamicModelField.TYPE_DOUBLE then
								do v:addDoubleColumn(fieldName) end
							elseif field:getType() == _g.jk.model.DynamicModelField.TYPE_BUFFER then
								do v:addBlobColumn(fieldName) end
							elseif field:getType() == _g.jk.model.DynamicModelField.TYPE_VECTOR then
								do v:addTextColumn(fieldName) end
							elseif field:getType() == _g.jk.model.DynamicModelField.TYPE_MAP then
								do v:addTextColumn(fieldName) end
							elseif field:getType() == _g.jk.model.DynamicModelField.TYPE_OBJECT then
								do v:addTextColumn(fieldName) end
							else
								do _g.jk.lang.Error:throw("unsupportedFieldType", _g.jk.lang.String:forInteger(field:getType())) end
							end
							if field:hasTag("index") then
								do v:addIndex(fieldName) end
							end
							if field:hasTag("uniqueIndex") then
								do v:addUniqueIndex(fieldName) end
							end
						end
						do n = n + 1 end
					end
				end
			end
			do return v end
		end
	end
end

function jk.sql.SQLTableInfo:addColumn(info)
	if info == nil then
		do return self end
	end
	if self.columns == nil then
		self.columns = {}
	end
	do _g.jk.lang.Vector:append(self.columns, info) end
	do return self end
end

function jk.sql.SQLTableInfo:addIntegerColumn(name)
	do return self:addColumn(_g.jk.sql.SQLTableColumnInfo:forInteger(name)) end
end

function jk.sql.SQLTableInfo:addLongColumn(name)
	do return self:addColumn(_g.jk.sql.SQLTableColumnInfo:forLongInteger(name)) end
end

function jk.sql.SQLTableInfo:addStringColumn(name)
	do return self:addColumn(_g.jk.sql.SQLTableColumnInfo:forString(name)) end
end

function jk.sql.SQLTableInfo:addStringKeyColumn(name)
	do return self:addColumn(_g.jk.sql.SQLTableColumnInfo:forStringKey(name)) end
end

function jk.sql.SQLTableInfo:addTextColumn(name)
	do return self:addColumn(_g.jk.sql.SQLTableColumnInfo:forText(name)) end
end

function jk.sql.SQLTableInfo:addIntegerKeyColumn(name)
	do return self:addColumn(_g.jk.sql.SQLTableColumnInfo:forIntegerKey(name)) end
end

function jk.sql.SQLTableInfo:addLongKeyColumn(name)
	do return self:addColumn(_g.jk.sql.SQLTableColumnInfo:forLongIntegerKey(name)) end
end

function jk.sql.SQLTableInfo:addDoubleColumn(name)
	do return self:addColumn(_g.jk.sql.SQLTableColumnInfo:forDouble(name)) end
end

function jk.sql.SQLTableInfo:addBlobColumn(name)
	do return self:addColumn(_g.jk.sql.SQLTableColumnInfo:forBlob(name)) end
end

function jk.sql.SQLTableInfo:addIndex(column)
	if _g.jk.lang.String:isEmpty(column) == false then
		if self.indexes == nil then
			self.indexes = {}
		end
		do _g.jk.lang.Vector:append(self.indexes, _g.jk.sql.SQLTableColumnIndexInfo._construct0(_g.jk.sql.SQLTableColumnIndexInfo._create()):addColumn(column):setUnique(false)) end
	end
	do return self end
end

function jk.sql.SQLTableInfo:addMultiColumnIndex(columns)
	if columns ~= nil and #columns > 0 then
		if self.indexes == nil then
			self.indexes = {}
		end
		do
			local index = _g.jk.sql.SQLTableColumnIndexInfo._construct0(_g.jk.sql.SQLTableColumnIndexInfo._create())
			do index:setUnique(false) end
			if columns ~= nil then
				local n = 0
				local m = #columns
				do
					n = 0
					while n < m do
						local column = columns[n + 1]
						if column ~= nil then
							do index:addColumn(_g.jk.lang.String:asString(column)) end
						end
						do n = n + 1 end
					end
				end
			end
			do _g.jk.lang.Vector:append(self.indexes, index) end
		end
	end
	do return self end
end

function jk.sql.SQLTableInfo:addUniqueIndex(column)
	if _g.jk.lang.String:isEmpty(column) == false then
		if self.indexes == nil then
			self.indexes = {}
		end
		do _g.jk.lang.Vector:append(self.indexes, _g.jk.sql.SQLTableColumnIndexInfo._construct0(_g.jk.sql.SQLTableColumnIndexInfo._create()):addColumn(column):setUnique(true)) end
	end
	do return self end
end

function jk.sql.SQLTableInfo:addUniqueMultiColumnIndex(columns)
	if columns ~= nil and #columns > 0 then
		if self.indexes == nil then
			self.indexes = {}
		end
		do
			local index = _g.jk.sql.SQLTableColumnIndexInfo._construct0(_g.jk.sql.SQLTableColumnIndexInfo._create())
			do index:setUnique(true) end
			if columns ~= nil then
				local n = 0
				local m = #columns
				do
					n = 0
					while n < m do
						local column = columns[n + 1]
						if column ~= nil then
							do index:addColumn(_g.jk.lang.String:asString(column)) end
						end
						do n = n + 1 end
					end
				end
			end
			do _g.jk.lang.Vector:append(self.indexes, index) end
		end
	end
	do return self end
end

function jk.sql.SQLTableInfo:getName()
	do return self.name end
end

function jk.sql.SQLTableInfo:setName(v)
	self.name = v
	do return self end
end

function jk.sql.SQLTableInfo:getColumns()
	do return self.columns end
end

function jk.sql.SQLTableInfo:setColumns(v)
	self.columns = v
	do return self end
end

function jk.sql.SQLTableInfo:getIndexes()
	do return self.indexes end
end

function jk.sql.SQLTableInfo:setIndexes(v)
	self.indexes = v
	do return self end
end

jk.sql.SQLDatabase = {}
jk.sql.SQLDatabase.__index = jk.sql.SQLDatabase
_vm:set_metatable(jk.sql.SQLDatabase, {})

function jk.sql.SQLDatabase._create()
	local v = _vm:set_metatable({}, jk.sql.SQLDatabase)
	return v
end

function jk.sql.SQLDatabase:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.sql.SQLDatabase'
	self['_isType.jk.sql.SQLDatabase'] = true
	self.logger = nil
end

function jk.sql.SQLDatabase:_construct0()
	jk.sql.SQLDatabase._init(self)
	return self
end

function jk.sql.SQLDatabase:logDebug(message)
	do _g.jk.log.Log:debug(self.logger, message) end
end

function jk.sql.SQLDatabase:logInfo(message)
	do _g.jk.log.Log:info(self.logger, message) end
end

function jk.sql.SQLDatabase:logWarning(message)
	do _g.jk.log.Log:warning(self.logger, message) end
end

function jk.sql.SQLDatabase:logError(message)
	do _g.jk.log.Log:error(self.logger, message) end
end

function jk.sql.SQLDatabase:getDatabaseTypeId()
end

function jk.sql.SQLDatabase:prepareSync(sql)
end

function jk.sql.SQLDatabase:prepareCreateTableStatementSync(table, columns)
end

function jk.sql.SQLDatabase:prepareDeleteTableStatementSync(table)
end

function jk.sql.SQLDatabase:prepareCreateIndexStatementSync(table, columns, unique)
	if not (_g.jk.lang.String:isNotEmpty(table) and _g.jk.lang.Vector:isNotEmpty(columns)) then
		do return nil end
	end
	do
		local namesb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do namesb:appendString(table) end
		if columns ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(columns)
			do
				n = 0
				while n < m do
					local column = columns[n + 1]
					if column ~= nil then
						do namesb:appendCharacter(95) end
						do namesb:appendString(column) end
					end
					do n = n + 1 end
				end
			end
		end
		do
			local idxname = namesb:toString()
			local unq = ""
			if unique then
				unq = "UNIQUE "
			end
			do
				local sqlsb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
				do sqlsb:appendString("CREATE ") end
				do sqlsb:appendString(unq) end
				do sqlsb:appendString("INDEX ") end
				do sqlsb:appendString(idxname) end
				do sqlsb:appendString(" ON ") end
				do sqlsb:appendString(table) end
				do sqlsb:appendString(" (") end
				do
					local first = true
					if columns ~= nil then
						local n2 = 0
						local m2 = _g.jk.lang.Vector:getSize(columns)
						do
							n2 = 0
							while n2 < m2 do
								local column = columns[n2 + 1]
								if column ~= nil then
									if first then
										do sqlsb:appendString(" ") end
									else
										do sqlsb:appendString(", ") end
									end
									first = false
									do sqlsb:appendString(column) end
								end
								do n2 = n2 + 1 end
							end
						end
					end
					do sqlsb:appendString(" )") end
					do return self:prepareSync(sqlsb:toString()) end
				end
			end
		end
	end
end

function jk.sql.SQLDatabase:prepareCreateColumnStatementSync(table, column)
end

function jk.sql.SQLDatabase:prepareUpdateColumnTypeStatementSync(table, column)
end

function jk.sql.SQLDatabase:getLastInsertIdSync(table)
end

function jk.sql.SQLDatabase:getIdentityColumnNameSync(table)
end

function jk.sql.SQLDatabase:getPrimaryKeyColumnNameSync(table)
end

function jk.sql.SQLDatabase:columnExistsSync(table, name)
end

function jk.sql.SQLDatabase:isColumnTypeSameSync(table, column)
end

function jk.sql.SQLDatabase:closeSync()
end

function jk.sql.SQLDatabase:executeSync(stmt)
end

function jk.sql.SQLDatabase:executeUpdateDeleteSync(stmt)
end

function jk.sql.SQLDatabase:querySync(stmt)
end

function jk.sql.SQLDatabase:querySingleRowSync(stmt)
end

function jk.sql.SQLDatabase:tableExistsSync(table)
end

function jk.sql.SQLDatabase:queryAllTableNamesSync()
end

function jk.sql.SQLDatabase:close(callback)
end

function jk.sql.SQLDatabase:execute(stmt, callback)
end

function jk.sql.SQLDatabase:executeUpdateDelete(stmt, callback)
end

function jk.sql.SQLDatabase:query(stmt, callback)
end

function jk.sql.SQLDatabase:querySingleRow(stmt, callback)
end

function jk.sql.SQLDatabase:tableExists(table, callback)
end

function jk.sql.SQLDatabase:queryAllTableNames(callback)
end

function jk.sql.SQLDatabase:ensureColumnsExistsSync(tableName, columns)
	if columns ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(columns)
		do
			n = 0
			while n < m do
				local column = columns[n + 1]
				if column ~= nil then
					if self:columnExistsSync(tableName, column:getName()) then
						if not self:isColumnTypeSameSync(tableName, column) then
							if not self:executeSync(self:prepareUpdateColumnTypeStatementSync(tableName, column)) then
								do return false end
							end
						end
					elseif not self:executeSync(self:prepareCreateColumnStatementSync(tableName, column)) then
						do return false end
					end
				end
				do n = n + 1 end
			end
		end
	end
	do return true end
end

function jk.sql.SQLDatabase:ensureTableExistsSync(table)
	if not (table ~= nil) then
		do return false end
	end
	do
		local name = table:getName()
		if not _g.jk.lang.String:isNotEmpty(name) then
			do return false end
		end
		if self:tableExistsSync(name) then
			local v = self:ensureColumnsExistsSync(name, table:getColumns())
			if v then
				do return true end
			end
			do return false end
		end
		if not self:executeSync(self:prepareCreateTableStatementSync(name, table:getColumns())) then
			do return false end
		end
		do
			local array = table:getIndexes()
			if array ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(array)
				do
					n = 0
					while n < m do
						local cii = array[n + 1]
						if cii ~= nil then
							if not self:executeSync(self:prepareCreateIndexStatementSync(name, cii:getColumns(), cii:getUnique())) then
								do self:executeSync(self:prepareDeleteTableStatementSync(name)) end
							end
						end
						do n = n + 1 end
					end
				end
			end
			do return true end
		end
	end
end

function jk.sql.SQLDatabase:ensureTableExists(table, callback)
	local v = self:ensureTableExistsSync(table)
	if callback ~= nil then
		do callback(v) end
	end
end

function jk.sql.SQLDatabase:createColumnSelectionString(columns)
	if not (columns ~= nil) or #columns < 1 then
		do return "*" end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		local first = true
		if columns ~= nil then
			local n = 0
			local m = #columns
			do
				n = 0
				while n < m do
					local column = (function(o)
						if (_vm:get_variable_type(o) == 'string') then
							do return o end
						end
						do return nil end
					end)(columns[n + 1])
					if column ~= nil then
						if not first then
							do sb:appendString(", ") end
						end
						do sb:appendString(column) end
						first = false
					end
					do n = n + 1 end
				end
			end
		end
		do return sb:toString() end
	end
end

function jk.sql.SQLDatabase:createOrderByString(order)
	if not (order ~= nil and #order > 0) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString(" ORDER BY ") end
		do
			local first = true
			if order ~= nil then
				local n = 0
				local m = #order
				do
					n = 0
					while n < m do
						local rule = order[n + 1]
						if rule ~= nil then
							if not first then
								do sb:appendString(", ") end
							end
							if (_vm:to_table_with_key(rule, '_isType.jk.sql.SQLOrderingRule') ~= nil) then
								local sr = rule
								do sb:appendString(sr:getColumn()) end
								do sb:appendCharacter(32) end
								if sr:getDescending() then
									do sb:appendString("DESC") end
								else
									do sb:appendString("ASC") end
								end
							else
								local str = _g.jk.lang.String:asString(rule)
								if not (str ~= nil) then
									str = "unknown"
								end
								do sb:appendString(str) end
								do sb:appendString(" DESC") end
							end
							first = false
						end
						do n = n + 1 end
					end
				end
			end
			do return sb:toString() end
		end
	end
end

function jk.sql.SQLDatabase:prepareQueryAllStatementSync(table, columns, order)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString("SELECT ") end
	do sb:appendString(self:createColumnSelectionString(columns)) end
	do sb:appendString(" FROM ") end
	do sb:appendString(table) end
	do sb:appendString(self:createOrderByString(order)) end
	do sb:appendString(";") end
	do return self:prepareSync(sb:toString()) end
end

function jk.sql.SQLDatabase:prepareCountRecordsStatementSync(table, criteria, likeOperator)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString("SELECT COUNT(*) AS count FROM ") end
	do sb:appendString(table) end
	do
		local first = true
		local keys = nil
		if criteria ~= nil then
			keys = criteria:getKeys()
			if keys ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(keys)
				do
					n = 0
					while n < m do
						local key = keys[n + 1]
						if key ~= nil then
							if first then
								do sb:appendString(" WHERE ") end
								first = false
							else
								do sb:appendString(" AND ") end
							end
							do sb:appendString(key) end
							do
								local value = criteria:getString(key, nil)
								if value == nil then
									do sb:appendString(" IS NULL") end
								elseif likeOperator then
									do sb:appendString(" LIKE ?") end
								else
									do sb:appendString(" = ?") end
								end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
		do sb:appendCharacter(59) end
		do
			local stmt = self:prepareSync(sb:toString())
			if not (stmt ~= nil) then
				do return nil end
			end
			if keys ~= nil then
				if keys ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(keys)
					do
						n2 = 0
						while n2 < m2 do
							local key = keys[n2 + 1]
							if key ~= nil then
								local val = criteria:getString(key, nil)
								if val == nil then
									goto _continue1
								end
								if likeOperator then
									do stmt:addParamString("%" .. _g.jk.lang.String:safeString(val) .. "%") end
								else
									do stmt:addParamString(val) end
								end
							end
							::_continue1::
							do n2 = n2 + 1 end
						end
					end
				end
			end
			do return stmt end
		end
	end
end

function jk.sql.SQLDatabase:prepareQueryWithCriteriaStatementSync(table, criteria, limit, offset, columns, order, likeOperator)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString("SELECT ") end
	do sb:appendString(self:createColumnSelectionString(columns)) end
	do sb:appendString(" FROM ") end
	do sb:appendString(table) end
	do
		local first = true
		local keys = nil
		if criteria ~= nil then
			keys = criteria:getKeys()
			if keys ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(keys)
				do
					n = 0
					while n < m do
						local key = keys[n + 1]
						if key ~= nil then
							if first then
								do sb:appendString(" WHERE ") end
								first = false
							else
								do sb:appendString(" AND ") end
							end
							do sb:appendString(key) end
							do
								local value = criteria:getString(key, nil)
								if value == nil then
									do sb:appendString(" IS NULL") end
								elseif likeOperator then
									do sb:appendString(" LIKE ?") end
								else
									do sb:appendString(" = ?") end
								end
							end
						end
						do n = n + 1 end
					end
				end
			end
		end
		do sb:appendString(self:createOrderByString(order)) end
		if limit > 0 then
			do sb:appendString(" LIMIT ") end
			do sb:appendString(_g.jk.lang.String:forInteger(limit)) end
		end
		if offset > 0 then
			do sb:appendString(" OFFSET ") end
			do sb:appendString(_g.jk.lang.String:forInteger(offset)) end
		end
		do sb:appendCharacter(59) end
		do
			local sql = sb:toString()
			local stmt = self:prepareSync(sql)
			if not (stmt ~= nil) then
				do return nil end
			end
			if keys ~= nil then
				if keys ~= nil then
					local n2 = 0
					local m2 = _g.jk.lang.Vector:getSize(keys)
					do
						n2 = 0
						while n2 < m2 do
							local key = keys[n2 + 1]
							if key ~= nil then
								local val = criteria:getString(key, nil)
								if val == nil then
									goto _continue2
								end
								if likeOperator then
									do stmt:addParamString("%" .. _g.jk.lang.String:safeString(val) .. "%") end
								else
									do stmt:addParamString(val) end
								end
							end
							::_continue2::
							do n2 = n2 + 1 end
						end
					end
				end
			end
			do return stmt end
		end
	end
end

function jk.sql.SQLDatabase:prepareQueryDistinctValuesStatementSync(table, column)
	if not (_g.jk.lang.String:isNotEmpty(table) and _g.jk.lang.String:isNotEmpty(column)) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("SELECT DISTINCT ") end
		do sb:appendString(column) end
		do sb:appendString(" FROM ") end
		do sb:appendString(table) end
		do sb:appendString(";") end
		do return self:prepareSync(sb:toString()) end
	end
end

function jk.sql.SQLDatabase:prepareSelectStatementSync(table, criteria)
	do return self:prepareQueryWithCriteriaStatementSync(table, criteria, 0, 0, nil, nil, false) end
end

function jk.sql.SQLDatabase:prepareInsertStatementSync(table, data)
	if not (_g.jk.lang.String:isNotEmpty(table) and data ~= nil and data:getCount() > 0) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("INSERT INTO ") end
		do sb:appendString(table) end
		do sb:appendString(" ( ") end
		do
			local first = true
			local keys = data:getKeys()
			if keys ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(keys)
				do
					n = 0
					while n < m do
						local key = keys[n + 1]
						if key ~= nil then
							if not first then
								do sb:appendCharacter(44) end
							end
							do sb:appendString((function(o)
								if (_vm:get_variable_type(o) == 'string') then
									do return o end
								end
								do return nil end
							end)(key)) end
							first = false
						end
						do n = n + 1 end
					end
				end
			end
			do sb:appendString(" ) VALUES ( ") end
			first = true
			if keys ~= nil then
				local n2 = 0
				local m2 = _g.jk.lang.Vector:getSize(keys)
				do
					n2 = 0
					while n2 < m2 do
						local key = keys[n2 + 1]
						if key ~= nil then
							if not first then
								do sb:appendCharacter(44) end
							end
							if data:get(key) == nil then
								do sb:appendString("NULL") end
							else
								do sb:appendCharacter(63) end
							end
							first = false
						end
						do n2 = n2 + 1 end
					end
				end
			end
			do sb:appendString(" );") end
			do
				local stmt = self:prepareSync(sb:toString())
				if not (stmt ~= nil) then
					do return nil end
				end
				if keys ~= nil then
					local n3 = 0
					local m3 = _g.jk.lang.Vector:getSize(keys)
					do
						n3 = 0
						while n3 < m3 do
							local key = keys[n3 + 1]
							if key ~= nil then
								local o = data:get(key)
								if o == nil then
									goto _continue3
								end
								if (_vm:get_variable_type(o) == 'string') or (_vm:to_table_with_key(o, '_isType.jk.lang.StringObject') ~= nil) then
									do stmt:addParamString(_g.jk.lang.String:asString(o)) end
								elseif (_vm:to_table_with_key(o, '_isType.jk.lang.IntegerObject') ~= nil) then
									do stmt:addParamInteger(_g.jk.lang.Integer:asInteger(o)) end
								elseif (_vm:to_table_with_key(o, '_isType.jk.lang.LongIntegerObject') ~= nil) then
									do stmt:addParamLongInteger(_g.jk.lang.LongInteger:asLong(o)) end
								elseif (_vm:to_table_with_key(o, '_isType.jk.lang.DoubleObject') ~= nil) then
									do stmt:addParamDouble(_g.jk.lang.Double:asDouble(o)) end
								elseif (_vm:to_table_with_key(o, '_isType.jk.lang.BufferObject') ~= nil) then
									do stmt:addParamBlob(o:toBuffer()) end
								elseif _util:is_buffer(o) then
									do stmt:addParamBlob((function(o)
										if _util:is_buffer(o) then
											do return o end
										end
										do return nil end
									end)(o)) end
								elseif (_vm:to_table_with_key(o, '_isType.jk.lang.BooleanObject') ~= nil) then
									do stmt:addParamInteger((function(a, b, c)
										if a then
											do return b() end
										end
										do return c() end
									end)(o:toBoolean(), function()
										do return 1 end
									end, function()
										do return 0 end
									end)) end
								else
									local s = _g.jk.lang.String:asString(o)
									if not (s ~= nil) then
										s = ""
									end
									do stmt:addParamString(s) end
								end
							end
							::_continue3::
							do n3 = n3 + 1 end
						end
					end
				end
				do return stmt end
			end
		end
	end
end

function jk.sql.SQLDatabase:prepareUpdateStatementSync(table, criteria, data)
	if not (_g.jk.lang.String:isNotEmpty(table) and data ~= nil and data:getCount() > 0) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("UPDATE ") end
		do sb:appendString(table) end
		do sb:appendString(" SET ") end
		do
			local params = {}
			local first = true
			local keys = data:iterateKeys()
			while keys ~= nil do
				local key = keys:next()
				if not (key ~= nil) then
					do break end
				end
				if not first then
					do sb:appendString(", ") end
				end
				do sb:appendString(key) end
				do
					local value = data:get(key)
					if value == nil then
						do sb:appendString(" = NULL") end
					else
						do sb:appendString(" = ?") end
						do _g.jk.lang.Vector:append(params, value) end
					end
					first = false
				end
			end
			if criteria ~= nil and criteria:getCount() > 0 then
				do sb:appendString(" WHERE ") end
				first = true
				do
					local criterias = criteria:iterateKeys()
					while criterias ~= nil do
						local criterium = criterias:next()
						if not (criterium ~= nil) then
							do break end
						end
						if not first then
							do sb:appendString(" AND ") end
						end
						do sb:appendString(criterium) end
						do
							local value = criteria:get(criterium)
							if value == nil then
								do sb:appendString(" IS NULL") end
							else
								do sb:appendString(" = ?") end
								do _g.jk.lang.Vector:append(params, value) end
							end
							first = false
						end
					end
				end
			end
			do sb:appendCharacter(59) end
			do
				local stmt = self:prepareSync(sb:toString())
				if not (stmt ~= nil) then
					do return nil end
				end
				if params ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(params)
					do
						n = 0
						while n < m do
							local o = params[n + 1]
							if o ~= nil then
								if (_vm:to_table_with_key(o, '_isType.jk.lang.BufferObject') ~= nil) then
									do stmt:addParamBlob(o:toBuffer()) end
								elseif _util:is_buffer(o) then
									do stmt:addParamBlob(o) end
								elseif (_vm:to_table_with_key(o, '_isType.jk.lang.BooleanObject') ~= nil) then
									do stmt:addParamInteger((function(a, b, c)
										if a then
											do return b() end
										end
										do return c() end
									end)(o:toBoolean(), function()
										do return 1 end
									end, function()
										do return 0 end
									end)) end
								else
									local s = _g.jk.lang.String:asString(o)
									if not (s ~= nil) then
										s = ""
									end
									do stmt:addParamString(s) end
								end
							end
							do n = n + 1 end
						end
					end
				end
				do return stmt end
			end
		end
	end
end

function jk.sql.SQLDatabase:prepareDeleteStatementSync(table, criteria)
	if not _g.jk.lang.String:isNotEmpty(table) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("DELETE FROM ") end
		do sb:appendString(table) end
		do
			local params = {}
			if criteria ~= nil and criteria:getCount() > 0 then
				do sb:appendString(" WHERE ") end
				do
					local first = true
					local criterias = criteria:iterateKeys()
					while criterias ~= nil do
						local criterium = criterias:next()
						if not (criterium ~= nil) then
							do break end
						end
						if not first then
							do sb:appendString(" AND ") end
						end
						do sb:appendString(criterium) end
						do sb:appendString(" = ?") end
						first = false
						do _g.jk.lang.Vector:append(params, criteria:get(criterium)) end
					end
				end
			end
			do sb:appendCharacter(59) end
			do
				local stmt = self:prepareSync(sb:toString())
				if not (stmt ~= nil) then
					do return nil end
				end
				if params ~= nil then
					local n = 0
					local m = _g.jk.lang.Vector:getSize(params)
					do
						n = 0
						while n < m do
							local o = params[n + 1]
							if o ~= nil then
								if (_vm:to_table_with_key(o, '_isType.jk.lang.BufferObject') ~= nil) then
									do stmt:addParamBlob(o:toBuffer()) end
								elseif _util:is_buffer(o) then
									do stmt:addParamBlob(o) end
								elseif (_vm:to_table_with_key(o, '_isType.jk.lang.BooleanObject') ~= nil) then
									do stmt:addParamInteger((function(a, b, c)
										if a then
											do return b() end
										end
										do return c() end
									end)(o:toBoolean(), function()
										do return 1 end
									end, function()
										do return 0 end
									end)) end
								else
									local s = _g.jk.lang.String:asString(o)
									if not (s ~= nil) then
										s = ""
									end
									do stmt:addParamString(s) end
								end
							end
							do n = n + 1 end
						end
					end
				end
				do return stmt end
			end
		end
	end
end

function jk.sql.SQLDatabase:getLogger()
	do return self.logger end
end

function jk.sql.SQLDatabase:setLogger(v)
	self.logger = v
	do return self end
end

jk.sql.SQLTableColumnInfo = {}
jk.sql.SQLTableColumnInfo.__index = jk.sql.SQLTableColumnInfo
_vm:set_metatable(jk.sql.SQLTableColumnInfo, {})

jk.sql.SQLTableColumnInfo.TYPE_INTEGER = 0
jk.sql.SQLTableColumnInfo.TYPE_STRING = 1
jk.sql.SQLTableColumnInfo.TYPE_TEXT = 2
jk.sql.SQLTableColumnInfo.TYPE_INTEGER_KEY = 3
jk.sql.SQLTableColumnInfo.TYPE_DOUBLE = 4
jk.sql.SQLTableColumnInfo.TYPE_BLOB = 5
jk.sql.SQLTableColumnInfo.TYPE_STRING_KEY = 6
jk.sql.SQLTableColumnInfo.TYPE_LONG = 7
jk.sql.SQLTableColumnInfo.TYPE_LONG_KEY = 8

function jk.sql.SQLTableColumnInfo._create()
	local v = _vm:set_metatable({}, jk.sql.SQLTableColumnInfo)
	return v
end

function jk.sql.SQLTableColumnInfo:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.sql.SQLTableColumnInfo'
	self['_isType.jk.sql.SQLTableColumnInfo'] = true
	self.name = nil
	self.type = 0
end

function jk.sql.SQLTableColumnInfo:_construct0()
	jk.sql.SQLTableColumnInfo._init(self)
	return self
end

function jk.sql.SQLTableColumnInfo:instance(name, type)
	do return _g.jk.sql.SQLTableColumnInfo._construct0(_g.jk.sql.SQLTableColumnInfo._create()):setName(name):setType(type) end
end

function jk.sql.SQLTableColumnInfo:forInteger(name)
	do return _g.jk.sql.SQLTableColumnInfo._construct0(_g.jk.sql.SQLTableColumnInfo._create()):setName(name):setType(_g.jk.sql.SQLTableColumnInfo.TYPE_INTEGER) end
end

function jk.sql.SQLTableColumnInfo:forString(name)
	do return _g.jk.sql.SQLTableColumnInfo._construct0(_g.jk.sql.SQLTableColumnInfo._create()):setName(name):setType(_g.jk.sql.SQLTableColumnInfo.TYPE_STRING) end
end

function jk.sql.SQLTableColumnInfo:forStringKey(name)
	do return _g.jk.sql.SQLTableColumnInfo._construct0(_g.jk.sql.SQLTableColumnInfo._create()):setName(name):setType(_g.jk.sql.SQLTableColumnInfo.TYPE_STRING_KEY) end
end

function jk.sql.SQLTableColumnInfo:forText(name)
	do return _g.jk.sql.SQLTableColumnInfo._construct0(_g.jk.sql.SQLTableColumnInfo._create()):setName(name):setType(_g.jk.sql.SQLTableColumnInfo.TYPE_TEXT) end
end

function jk.sql.SQLTableColumnInfo:forIntegerKey(name)
	do return _g.jk.sql.SQLTableColumnInfo._construct0(_g.jk.sql.SQLTableColumnInfo._create()):setName(name):setType(_g.jk.sql.SQLTableColumnInfo.TYPE_INTEGER_KEY) end
end

function jk.sql.SQLTableColumnInfo:forLongIntegerKey(name)
	do return _g.jk.sql.SQLTableColumnInfo._construct0(_g.jk.sql.SQLTableColumnInfo._create()):setName(name):setType(_g.jk.sql.SQLTableColumnInfo.TYPE_LONG_KEY) end
end

function jk.sql.SQLTableColumnInfo:forLongInteger(name)
	do return _g.jk.sql.SQLTableColumnInfo._construct0(_g.jk.sql.SQLTableColumnInfo._create()):setName(name):setType(_g.jk.sql.SQLTableColumnInfo.TYPE_LONG) end
end

function jk.sql.SQLTableColumnInfo:forDouble(name)
	do return _g.jk.sql.SQLTableColumnInfo._construct0(_g.jk.sql.SQLTableColumnInfo._create()):setName(name):setType(_g.jk.sql.SQLTableColumnInfo.TYPE_DOUBLE) end
end

function jk.sql.SQLTableColumnInfo:forBlob(name)
	do return _g.jk.sql.SQLTableColumnInfo._construct0(_g.jk.sql.SQLTableColumnInfo._create()):setName(name):setType(_g.jk.sql.SQLTableColumnInfo.TYPE_BLOB) end
end

function jk.sql.SQLTableColumnInfo:getName()
	do return self.name end
end

function jk.sql.SQLTableColumnInfo:setName(v)
	self.name = v
	do return self end
end

function jk.sql.SQLTableColumnInfo:getType()
	do return self.type end
end

function jk.sql.SQLTableColumnInfo:setType(v)
	self.type = v
	do return self end
end

jk.sql.SQLOrderingRule = {}
jk.sql.SQLOrderingRule.__index = jk.sql.SQLOrderingRule
_vm:set_metatable(jk.sql.SQLOrderingRule, {})

function jk.sql.SQLOrderingRule._create()
	local v = _vm:set_metatable({}, jk.sql.SQLOrderingRule)
	return v
end

function jk.sql.SQLOrderingRule:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.sql.SQLOrderingRule'
	self['_isType.jk.sql.SQLOrderingRule'] = true
	self.column = nil
	self.descending = false
end

function jk.sql.SQLOrderingRule:_construct0()
	jk.sql.SQLOrderingRule._init(self)
	return self
end

function jk.sql.SQLOrderingRule:forDescending(column)
	local v = _g.jk.sql.SQLOrderingRule._construct0(_g.jk.sql.SQLOrderingRule._create())
	do v:setColumn(column) end
	do v:setDescending(true) end
	do return v end
end

function jk.sql.SQLOrderingRule:forAscending(column)
	local v = _g.jk.sql.SQLOrderingRule._construct0(_g.jk.sql.SQLOrderingRule._create())
	do v:setColumn(column) end
	do v:setDescending(false) end
	do return v end
end

function jk.sql.SQLOrderingRule:getColumn()
	do return self.column end
end

function jk.sql.SQLOrderingRule:setColumn(v)
	self.column = v
	do return self end
end

function jk.sql.SQLOrderingRule:getDescending()
	do return self.descending end
end

function jk.sql.SQLOrderingRule:setDescending(v)
	self.descending = v
	do return self end
end
