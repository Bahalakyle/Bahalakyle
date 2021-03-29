jk = jk or {}

jk.mssql = jk.mssql or {}

jk.mssql.MSSQLDatabase = _g.jk.sql.SQLDatabase._create()
jk.mssql.MSSQLDatabase.__index = jk.mssql.MSSQLDatabase
_vm:set_metatable(jk.mssql.MSSQLDatabase, {
	__index = _g.jk.sql.SQLDatabase
})

function jk.mssql.MSSQLDatabase._create()
	local v = _vm:set_metatable({}, jk.mssql.MSSQLDatabase)
	return v
end

function jk.mssql.MSSQLDatabase:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mssql.MSSQLDatabase'
	self['_isType.jk.mssql.MSSQLDatabase'] = true
	self.databaseName = nil
end

function jk.mssql.MSSQLDatabase:_construct0()
	jk.mssql.MSSQLDatabase._init(self)
	do _g.jk.sql.SQLDatabase._construct0(self) end
	return self
end

function jk.mssql.MSSQLDatabase:instance()
	_io:write_to_stdout("[jk.mssql.MSSQLDatabase.instance] (MSSQLDatabase.sling:39:3): Not implemented" .. "\n")
	do return nil end
end

function jk.mssql.MSSQLDatabase:forConnectionStringSync(connectionString, logContext)
	if not _g.jk.lang.String:isNotEmpty(connectionString) then
		do return nil end
	end
	do
		local ss = _g.jk.lang.String:split(connectionString, 58, 4)
		if not (ss ~= nil and _g.jk.lang.Vector:getSize(ss) == 4) then
			do return nil end
		end
		do return _g.jk.mssql.MSSQLDatabase:connectSync(ss[0 + 1], ss[1 + 1], ss[2 + 1], ss[3 + 1], logContext) end
	end
end

function jk.mssql.MSSQLDatabase:connectSync(serverAddress, username, password, database, logger)
	if not (_g.jk.lang.String:isNotEmpty(serverAddress) and _g.jk.lang.String:isNotEmpty(username) and _g.jk.lang.String:isNotEmpty(password) and _g.jk.lang.String:isNotEmpty(database)) then
		do return nil end
	end
	do
		local v = _g.jk.mssql.MSSQLDatabase:instance()
		if not (v ~= nil) then
			do return nil end
		end
		do v:setLogger(logger) end
		if not v:initializeSync(serverAddress, username, password, database) then
			do return nil end
		end
		do return v end
	end
end

function jk.mssql.MSSQLDatabase:getDatabaseTypeId()
	do return "mssql" end
end

function jk.mssql.MSSQLDatabase:initializeSync(serverAddress, username, password, database)
	do return true end
end

function jk.mssql.MSSQLDatabase:querySingleRowSync(stmt)
	local it = self:querySync(stmt)
	if not (it ~= nil) then
		do return nil end
	end
	do
		local v = it:next()
		do it:close() end
		do return v end
	end
end

function jk.mssql.MSSQLDatabase:tableExistsSync(table)
	if not (_g.jk.lang.String:isNotEmpty(table) and _g.jk.lang.String:isNotEmpty(self.databaseName)) then
		do return false end
	end
	do
		local stmt = self:prepareSync("SELECT TABLE_NAME FROM information_schema.tables WHERE table_type = 'BASE TABLE' AND table_name = ? LIMIT 1;")
		if not (stmt ~= nil) then
			do return false end
		end
		do stmt:addParamString(self.databaseName) end
		do stmt:addParamString(table) end
		do
			local sr = self:querySingleRowSync(stmt)
			if not (sr ~= nil) then
				do return false end
			end
			do return _g.jk.lang.String:equals(table, sr:getString("TABLE_NAME", nil)) end
		end
	end
end

function jk.mssql.MSSQLDatabase:queryAllTableNames(callback)
	local stmt = self:prepareSync("SELECT TABLE_NAME FROM information_schema.tables WHERE table_type = 'BASE TABLE';")
	if not (stmt ~= nil) then
		do callback(nil) end
		do return end
	end
	do self:query(stmt, function(it)
		if not (it ~= nil) then
			do callback(nil) end
			do return end
		end
		do
			local v = {}
			while true do
				local vv = it:next()
				if not (vv ~= nil) then
					do break end
				end
				do _g.jk.lang.Vector:append(v, vv:getString("TABLE_NAME", nil)) end
			end
			do it:close() end
			do callback(v) end
		end
	end) end
end

function jk.mssql.MSSQLDatabase:queryAllTableNamesSync()
	if not _g.jk.lang.String:isNotEmpty(self.databaseName) then
		do return nil end
	end
	do
		local stmt = self:prepareSync("SELECT TABLE_NAME FROM information_schema.tables WHERE table_type = 'BASE TABLE';")
		if not (stmt ~= nil) then
			do return nil end
		end
		do
			local it = self:querySync(stmt)
			if not (it ~= nil) then
				do return nil end
			end
			do
				local v = {}
				while true do
					local vv = it:next()
					if not (vv ~= nil) then
						do break end
					end
					do _g.jk.lang.Vector:append(v, vv:getString("TABLE_NAME", nil)) end
				end
				do it:close() end
				do return v end
			end
		end
	end
end

function jk.mssql.MSSQLDatabase:columnToCreateString(cc)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local columnName = cc:getName()
	do sb:appendString(columnName) end
	do sb:appendCharacter(32) end
	do
		local tt = cc:getType()
		if tt == _g.jk.sql.SQLTableColumnInfo.TYPE_INTEGER_KEY then
			do sb:appendString("INTEGER AUTO_INCREMENT, PRIMARY KEY (" .. _g.jk.lang.String:safeString(columnName) .. ")") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_INTEGER then
			do sb:appendString("INTEGER") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_LONG_KEY then
			do sb:appendString("BIGINT AUTO_INCREMENT, PRIMARY KEY (" .. _g.jk.lang.String:safeString(columnName) .. ")") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_LONG then
			do sb:appendString("BIGINT") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_STRING then
			do sb:appendString("VARCHAR(255)") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_STRING_KEY then
			do sb:appendString("VARCHAR(255), PRIMARY KEY (" .. _g.jk.lang.String:safeString(columnName) .. ")") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_TEXT then
			do sb:appendString("LONGTEXT") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_BLOB then
			do sb:appendString("LONGBLOB") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_DOUBLE then
			do sb:appendString("REAL") end
		else
			do _g.jk.log.Log:error(self:getLogger(), "Unknown column type: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(tt))) end
			do sb:appendString("UNKNOWN") end
		end
		do return sb:toString() end
	end
end

function jk.mssql.MSSQLDatabase:prepareCreateTableStatementSync(table, columns)
	if not (_g.jk.lang.String:isNotEmpty(table) and columns ~= nil) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("CREATE TABLE ") end
		do sb:appendString(table) end
		do sb:appendString(" (") end
		do
			local first = true
			if columns ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(columns)
				do
					n = 0
					while n < m do
						local column = columns[n + 1]
						if column ~= nil then
							if not first then
								do sb:appendCharacter(44) end
							end
							do sb:appendCharacter(32) end
							do sb:appendString(self:columnToCreateString(column)) end
							first = false
						end
						do n = n + 1 end
					end
				end
			end
			do sb:appendString(" );") end
			do return self:prepareSync(sb:toString()) end
		end
	end
end

function jk.mssql.MSSQLDatabase:prepareDeleteTableStatementSync(table)
	if not _g.jk.lang.String:isNotEmpty(table) then
		do return nil end
	end
	do
		local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
		do sb:appendString("DROP TABLE ") end
		do sb:appendString(table) end
		do sb:appendString(";") end
		do return self:prepareSync(sb:toString()) end
	end
end

function jk.mssql.MSSQLDatabase:getLastInsertIdSync(table)
	local v = self:querySingleRowSync(self:prepareSync("SELECT IDENT_CURRENT('" .. _g.jk.lang.String:safeString(table) .. "') AS id;"))
	if not (v ~= nil) then
		do return 0 end
	end
	do return v:getLongInteger("id", 0) end
end

function jk.mssql.MSSQLDatabase:getPrimaryKeyColumnNameSync(table)
	local v = self:querySingleRowSync(self:prepareSync("SELECT COLUMN_NAME FROM information_schema.KEY_COLUMN_USAGE WHERE CONSTRAINT_NAME LIKE 'PK_%' AND TABLE_NAME='" .. _g.jk.lang.String:safeString(table) .. "';"))
	if not (v ~= nil) then
		do return nil end
	end
	do return v:getString("COLUMN_NAME", nil) end
end

function jk.mssql.MSSQLDatabase:getIdentityColumnNameSync(table)
	local v = self:querySingleRowSync(self:prepareSync("SELECT name FROM sys.columns WHERE object_id = object_id('" .. _g.jk.lang.String:safeString(table) .. "') AND is_identity=1;"))
	if not (v ~= nil) then
		do return nil end
	end
	do return v:getString("name", nil) end
end

function jk.mssql.MSSQLDatabase:prepareCreateColumnStatementSync(table, column)
	_io:write_to_stdout("--- stub --- jk.mssql.MSSQLDatabase :: prepareCreateColumnStatementSync" .. "\n")
	do return nil end
end

function jk.mssql.MSSQLDatabase:prepareUpdateColumnTypeStatementSync(table, column)
	_io:write_to_stdout("--- stub --- jk.mssql.MSSQLDatabase :: prepareUpdateColumnTypeStatementSync" .. "\n")
	do return nil end
end

function jk.mssql.MSSQLDatabase:columnExistsSync(table, name)
	_io:write_to_stdout("--- stub --- jk.mssql.MSSQLDatabase :: columnExistsSync" .. "\n")
	do return false end
end

function jk.mssql.MSSQLDatabase:isColumnTypeSameSync(table, column)
	_io:write_to_stdout("--- stub --- jk.mssql.MSSQLDatabase :: isColumnTypeSameSync" .. "\n")
	do return false end
end

function jk.mssql.MSSQLDatabase:getDatabaseName()
	do return self.databaseName end
end

function jk.mssql.MSSQLDatabase:setDatabaseName(v)
	self.databaseName = v
	do return self end
end
