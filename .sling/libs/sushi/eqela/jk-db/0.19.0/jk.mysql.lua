jk = jk or {}

jk.mysql = jk.mysql or {}

jk.mysql.MySQLDatabase = _g.jk.sql.SQLDatabase._create()
jk.mysql.MySQLDatabase.__index = jk.mysql.MySQLDatabase
_vm:set_metatable(jk.mysql.MySQLDatabase, {
	__index = _g.jk.sql.SQLDatabase
})

jk.mysql.MySQLDatabase.SSL_MODE_PREFERRED = "Preferred"
jk.mysql.MySQLDatabase.SSL_MODE_NONE = "None"
jk.mysql.MySQLDatabase.SSL_MODE_REQUIRED = "Required"
jk.mysql.MySQLDatabase.SSL_MODE_VERIFYCA = "VerifyCA"
jk.mysql.MySQLDatabase.SSL_MODE_VERIFYFULL = "VerifyFull"
jk.mysql.MySQLDatabase.PROTOCOL_SOCKET = "socket"
jk.mysql.MySQLDatabase.PROTOCOL_UNIX = "unix"
jk.mysql.MySQLDatabase.PROTOCOL_PIPE = "pipe"
jk.mysql.MySQLDatabase.PROCOL_MEMORY = "memory"

function jk.mysql.MySQLDatabase._create()
	local v = _vm:set_metatable({}, jk.mysql.MySQLDatabase)
	return v
end

function jk.mysql.MySQLDatabase:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mysql.MySQLDatabase'
	self['_isType.jk.mysql.MySQLDatabase'] = true
	self.databaseName = nil
end

function jk.mysql.MySQLDatabase:_construct0()
	jk.mysql.MySQLDatabase._init(self)
	do _g.jk.sql.SQLDatabase._construct0(self) end
	return self
end

function jk.mysql.MySQLDatabase:instance()
	do return _g.jk.mysql.MySQLDatabaseGeneric._construct0(_g.jk.mysql.MySQLDatabaseGeneric._create()) end
end

function jk.mysql.MySQLDatabase:forConnectionStringSync(ctx, connectionString)
	if not _g.jk.lang.String:isNotEmpty(connectionString) then
		do _g.jk.log.Log:error(ctx, "Empty connection string given to MySQLDatabase") end
		do return nil end
	end
	do
		local ss = _g.jk.lang.String:split(connectionString, 58, 0)
		local paramc = _g.jk.lang.Vector:getSize(ss)
		if not (ss ~= nil and paramc >= 4) then
			do _g.jk.log.Log:error(ctx, "MySQLDatabase connection string has less than 4 fields: `" .. _g.jk.lang.String:safeString(connectionString) .. "'") end
			do return nil end
		end
		do
			local address = ss[0 + 1]
			local username = ss[1 + 1]
			local password = ss[2 + 1]
			local database = ss[3 + 1]
			local sslMode = _g.jk.mysql.MySQLDatabase.SSL_MODE_NONE
			local enableUTF8 = false
			do
				local n = 4
				while n < paramc do
					local param = ss[n + 1]
					if _g.jk.lang.String:startsWith(param, "sslmode=", 0) then
						sslMode = _g.jk.lang.String:getEndOfString(param, 8)
					elseif param == "ssl" then
						sslMode = _g.jk.mysql.MySQLDatabase.SSL_MODE_REQUIRED
					elseif _g.jk.lang.String:startsWith(param, "enableutf8=", 0) then
						enableUTF8 = _g.jk.lang.Boolean:asBoolean(_g.jk.lang.String:getEndOfString(param, 11), false)
					elseif param == "utf8" then
						enableUTF8 = true
					end
					do n = n + 1 end
				end
			end
			do return _g.jk.mysql.MySQLDatabase:connectSync(ctx, address, username, password, database, sslMode, enableUTF8) end
		end
	end
end

function jk.mysql.MySQLDatabase:connectSync(ctx, serverAddress, username, password, database, sslMode, enableUTF8)
	if not (_g.jk.lang.String:isNotEmpty(serverAddress) and _g.jk.lang.String:isNotEmpty(username) and _g.jk.lang.String:isNotEmpty(password) and _g.jk.lang.String:isNotEmpty(database) and _g.jk.lang.String:isNotEmpty(sslMode)) then
		do return nil end
	end
	do
		local v = _g.jk.mysql.MySQLDatabase:instance()
		if not (v ~= nil) then
			do return nil end
		end
		do v:setLogger(ctx) end
		if not v:initializeSync(serverAddress, username, password, database, sslMode, _g.jk.mysql.MySQLDatabase.PROTOCOL_SOCKET, enableUTF8) then
			do return nil end
		end
		do return v end
	end
end

function jk.mysql.MySQLDatabase:forConfig(logContext, config)
	if not (config ~= nil) then
		do return nil end
	end
	do
		local serverAddress = config:getString("serverAddress", nil)
		if not (serverAddress ~= nil) then
			do return nil end
		end
		do
			local username = config:getString("username", nil)
			if not (username ~= nil) then
				do return nil end
			end
			do
				local password = config:getString("password", nil)
				if not (password ~= nil) then
					do return nil end
				end
				do
					local database = config:getString("database", nil)
					if not (database ~= nil) then
						do return nil end
					end
					do
						local enableUTF8 = config:getBoolean("enableUTF8", false)
						local sslMode = config:getString("sslMode", nil)
						if _g.jk.lang.String:isEmpty(sslMode) then
							sslMode = _g.jk.mysql.MySQLDatabase.SSL_MODE_NONE
						end
						do
							local protocol = config:getString("protocol", nil)
							if _g.jk.lang.String:isEmpty(protocol) then
								protocol = _g.jk.mysql.MySQLDatabase.PROTOCOL_SOCKET
							end
							do
								local v = _g.jk.mysql.MySQLDatabase:instance()
								if not (v ~= nil) then
									do return nil end
								end
								do v:setLogger(logContext) end
								if not v:initializeSync(serverAddress, username, password, database, sslMode, protocol, enableUTF8) then
									do return nil end
								end
								do return v end
							end
						end
					end
				end
			end
		end
	end
end

function jk.mysql.MySQLDatabase:getDatabaseTypeId()
	do return "mysql" end
end

function jk.mysql.MySQLDatabase:initializeSync(serverAddress, username, password, database, sslMode, protocol, enableUTF8)
	do self:logDebug("MySQLDatabase: Connecting to database host=`" .. _g.jk.lang.String:safeString(serverAddress) .. "', username=`" .. _g.jk.lang.String:safeString(username) .. "', database=`" .. _g.jk.lang.String:safeString(database) .. "', sslMode=`" .. _g.jk.lang.String:safeString(sslMode) .. "', protocol=`" .. _g.jk.lang.String:safeString(protocol) .. "'") end
	if not self:doInitialize(serverAddress, username, password, database, sslMode, protocol, enableUTF8) then
		do return false end
	end
	do self:setDatabaseName(database) end
	do return true end
end

function jk.mysql.MySQLDatabase:doInitialize(serverAddress, username, password, database, sslMode, protocol, enableUTF8)
	do return true end
end

function jk.mysql.MySQLDatabase:querySingleRowSync(stmt)
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

function jk.mysql.MySQLDatabase:tableExistsSync(table)
	if not (_g.jk.lang.String:isNotEmpty(table) and _g.jk.lang.String:isNotEmpty(self.databaseName)) then
		do return false end
	end
	do
		local stmt = self:prepareSync("SELECT TABLE_NAME FROM information_schema.tables WHERE table_schema = ? AND table_name = ? LIMIT 1;")
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
			do return _g.jk.lang.String:equalsIgnoreCase(table, sr:getString("TABLE_NAME", nil)) end
		end
	end
end

function jk.mysql.MySQLDatabase:tableExists(table, callback)
	if not (_g.jk.lang.String:isNotEmpty(table) and _g.jk.lang.String:isNotEmpty(self.databaseName)) then
		do callback(false) end
		do return end
	end
	do
		local stmt = self:prepareSync("SELECT TABLE_NAME FROM information_schema.tables WHERE table_schema = ? AND table_name = ? LIMIT 1;")
		if not (stmt ~= nil) then
			do callback(false) end
			do return end
		end
		do stmt:addParamString(self.databaseName) end
		do stmt:addParamString(table) end
		do self:querySingleRow(stmt, function(sr)
			if not (sr ~= nil) then
				do callback(false) end
				do return end
			end
			do callback(_g.jk.lang.String:equalsIgnoreCase(table, sr:getString("TABLE_NAME", nil))) end
		end) end
	end
end

function jk.mysql.MySQLDatabase:queryAllTableNames(callback)
	local stmt = self:prepareSync("SELECT TABLE_NAME FROM information_schema.tables WHERE table_schema = ?;")
	if not (stmt ~= nil) then
		do callback(nil) end
		do return end
	end
	do stmt:addParamString(self.databaseName) end
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
			do callback(v) end
		end
	end) end
end

function jk.mysql.MySQLDatabase:queryAllTableNamesSync()
	if not _g.jk.lang.String:isNotEmpty(self.databaseName) then
		do return nil end
	end
	do
		local stmt = self:prepareSync("SELECT TABLE_NAME FROM information_schema.tables WHERE table_schema = ?;")
		if not (stmt ~= nil) then
			do return nil end
		end
		do stmt:addParamString(self.databaseName) end
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
				do return v end
			end
		end
	end
end

function jk.mysql.MySQLDatabase:columnToCreateString(cc)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	local columnName = cc:getName()
	do sb:appendString(columnName) end
	do sb:appendCharacter(32) end
	do
		local tt = cc:getType()
		do sb:appendString(self:prepareTypeAsString(tt, columnName, false)) end
		do return sb:toString() end
	end
end

function jk.mysql.MySQLDatabase:prepareTypeAsString(tt, columnName, forDataTypeChecking)
	if tt == _g.jk.sql.SQLTableColumnInfo.TYPE_INTEGER_KEY then
		if forDataTypeChecking then
			do return "INTEGER" end
		end
		do return "INTEGER AUTO_INCREMENT, PRIMARY KEY (" .. _g.jk.lang.String:safeString(columnName) .. ")" end
	elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_INTEGER then
		do return "INTEGER" end
	elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_LONG_KEY then
		if forDataTypeChecking then
			do return "BIGINT" end
		end
		do return "BIGINT AUTO_INCREMENT, PRIMARY KEY (" .. _g.jk.lang.String:safeString(columnName) .. ")" end
	elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_LONG then
		do return "BIGINT" end
	elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_STRING then
		if forDataTypeChecking then
			do return "VARCHAR(255)" end
		end
		do return "VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci" end
	elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_STRING_KEY then
		if forDataTypeChecking then
			do return "VARCHAR(255)" end
		end
		do return "VARCHAR(255) CHARACTER SET utf8 COLLATE utf8_general_ci, PRIMARY KEY (" .. _g.jk.lang.String:safeString(columnName) .. ")" end
	elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_TEXT then
		if forDataTypeChecking then
			do return "LONGTEXT" end
		end
		do return "LONGTEXT CHARACTER SET utf8 COLLATE utf8_general_ci" end
	elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_BLOB then
		do return "LONGBLOB" end
	elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_DOUBLE then
		do return "REAL" end
	end
	do _g.jk.log.Log:error(self:getLogger(), "Unknown column type: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(tt))) end
	do return "UNKNOWN" end
end

function jk.mysql.MySQLDatabase:prepareCreateTableStatementSync(table, columns)
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
			do sb:appendString(" ) CHARACTER SET utf8 COLLATE utf8_general_ci;") end
			do return self:prepareSync(sb:toString()) end
		end
	end
end

function jk.mysql.MySQLDatabase:prepareDeleteTableStatementSync(table)
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

function jk.mysql.MySQLDatabase:prepareCreateColumnStatementSync(table, column)
	if not (_g.jk.lang.String:isNotEmpty(table) and column ~= nil) then
		do return nil end
	end
	do
		local sql = "ALTER TABLE " .. _g.jk.lang.String:safeString(table) .. " ADD COLUMN " .. _g.jk.lang.String:safeString(column:getName()) .. " " .. _g.jk.lang.String:safeString(self:prepareTypeAsString(column:getType(), column:getName(), false)) .. ";"
		do return self:prepareSync(sql) end
	end
end

function jk.mysql.MySQLDatabase:prepareUpdateColumnTypeStatementSync(table, column)
	if not (_g.jk.lang.String:isNotEmpty(table) and column ~= nil) then
		do return nil end
	end
	do
		local sql = "ALTER TABLE " .. _g.jk.lang.String:safeString(table) .. " CHANGE " .. _g.jk.lang.String:safeString(column:getName()) .. " " .. _g.jk.lang.String:safeString(column:getName()) .. " " .. _g.jk.lang.String:safeString(self:prepareTypeAsString(column:getType(), column:getName(), true)) .. ";"
		do return self:prepareSync(sql) end
	end
end

function jk.mysql.MySQLDatabase:getLastInsertIdSync(table)
	local v = self:querySingleRowSync(self:prepareSync("SELECT LAST_INSERT_ID() AS id;"))
	if not (v ~= nil) then
		do return 0 end
	end
	do return v:getLongInteger("id", 0) end
end

function jk.mysql.MySQLDatabase:getPrimaryKeyColumnNameSync(table)
	local v = self:querySingleRowSync(self:prepareSync("SELECT COLUMN_NAME FROM information_schema.KEY_COLUMN_USAGE WHERE CONSTRAINT_NAME LIKE 'PRIMARY%' AND TABLE_NAME='" .. _g.jk.lang.String:safeString(table) .. "';"))
	if not (v ~= nil) then
		do return nil end
	end
	do return v:getString("COLUMN_NAME", nil) end
end

function jk.mysql.MySQLDatabase:getIdentityColumnNameSync(table)
	local v = self:querySingleRowSync(self:prepareSync("SELECT COLUMN_NAME FROM information_schema.columns WHERE TABLE_NAME='" .. _g.jk.lang.String:safeString(table) .. "' AND IS_NULLABLE='NO' AND EXTRA LIKE '%auto_increment%';"))
	if not (v ~= nil) then
		do return nil end
	end
	do return v:getString("COLUMN_NAME", nil) end
end

function jk.mysql.MySQLDatabase:columnExistsSync(table, column)
	if not (_g.jk.lang.String:isNotEmpty(table) and _g.jk.lang.String:isNotEmpty(self.databaseName) and _g.jk.lang.String:isNotEmpty(column)) then
		do return false end
	end
	do
		local stmt = self:prepareSync("SELECT COLUMN_NAME FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ? LIMIT 1;")
		if not (stmt ~= nil) then
			do return false end
		end
		do stmt:addParamString(self.databaseName) end
		do stmt:addParamString(table) end
		do stmt:addParamString(column) end
		do
			local sr = self:querySingleRowSync(stmt)
			if not (sr ~= nil) then
				do return false end
			end
			do return _g.jk.lang.String:equalsIgnoreCase(column, sr:getString("COLUMN_NAME", nil)) end
		end
	end
end

function jk.mysql.MySQLDatabase:isColumnTypeSameSync(table, column)
	if not (_g.jk.lang.String:isNotEmpty(table) and _g.jk.lang.String:isNotEmpty(self.databaseName) and column ~= nil) then
		do return false end
	end
	do
		local stmt = self:prepareSync("SELECT COLUMN_TYPE FROM information_schema.columns WHERE table_schema = ? AND table_name = ? AND column_name = ? LIMIT 1;")
		if not (stmt ~= nil) then
			do return false end
		end
		do stmt:addParamString(self.databaseName) end
		do stmt:addParamString(table) end
		do stmt:addParamString(column:getName()) end
		do
			local sr = self:querySingleRowSync(stmt)
			if not (sr ~= nil) then
				do return false end
			end
			do
				local type = self:prepareTypeAsString(column:getType(), column:getName(), true)
				local ctype = sr:getString("COLUMN_TYPE", nil)
				if _g.jk.lang.String:equalsIgnoreCase(type, ctype) then
					do return true end
				end
				if type == "INTEGER" and _g.jk.lang.String:equalsIgnoreCase("int", ctype) then
					do return true end
				end
				do return false end
			end
		end
	end
end

function jk.mysql.MySQLDatabase:getDatabaseName()
	do return self.databaseName end
end

function jk.mysql.MySQLDatabase:setDatabaseName(v)
	self.databaseName = v
	do return self end
end

jk.mysql.MySQLDatabaseGeneric = _g.jk.mysql.MySQLDatabase._create()
jk.mysql.MySQLDatabaseGeneric.__index = jk.mysql.MySQLDatabaseGeneric
_vm:set_metatable(jk.mysql.MySQLDatabaseGeneric, {
	__index = _g.jk.mysql.MySQLDatabase
})

function jk.mysql.MySQLDatabaseGeneric._create()
	local v = _vm:set_metatable({}, jk.mysql.MySQLDatabaseGeneric)
	return v
end

function jk.mysql.MySQLDatabaseGeneric:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mysql.MySQLDatabaseGeneric'
	self['_isType.jk.mysql.MySQLDatabaseGeneric'] = true
	self.authenticationPlugin = nil
	self.socket = nil
	self.receiveBuffer = _util:allocate_buffer(1024 * 1024)
	self.sequence = 0
	self.connectionState = _g.jk.mysql.MySQLDatabaseGeneric.ConnectionState.DISCONNECTED
	self.reconnectTime = 0
	self.serverAddress = nil
	self.username = nil
	self.password = nil
	self.database = nil
	self.sslMode = nil
	self.protocol = nil
	self.enableUTF8 = true
	self.serverCapabilityFlags = 0
	self.sslEnabled = false
	self.overflowBuffer = nil
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.mysql.MySQLDatabaseGeneric:_construct0()
	jk.mysql.MySQLDatabaseGeneric._init(self)
	do _g.jk.mysql.MySQLDatabase._construct0(self) end
	return self
end

jk.mysql.MySQLDatabaseGeneric.MyStatement = {}
jk.mysql.MySQLDatabaseGeneric.MyStatement.__index = jk.mysql.MySQLDatabaseGeneric.MyStatement
_vm:set_metatable(jk.mysql.MySQLDatabaseGeneric.MyStatement, {})

function jk.mysql.MySQLDatabaseGeneric.MyStatement._create()
	local v = _vm:set_metatable({}, jk.mysql.MySQLDatabaseGeneric.MyStatement)
	return v
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mysql.MySQLDatabaseGeneric.MyStatement'
	self['_isType.jk.mysql.MySQLDatabaseGeneric.MyStatement'] = true
	self['_isType.jk.sql.SQLStatement'] = true
	self.id = -1
	self.db = nil
	self.params = nil
	self.columns = nil
	self.isStoredProcedure = false
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:_construct0()
	jk.mysql.MySQLDatabaseGeneric.MyStatement._init(self)
	return self
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:forStatementId(id, columns, db)
	local v = _g.jk.mysql.MySQLDatabaseGeneric.MyStatement._construct0(_g.jk.mysql.MySQLDatabaseGeneric.MyStatement._create())
	do v:setId(id) end
	do v:setColumns(columns) end
	do v:setDb(db) end
	do return v end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:_destruct()
	do self:close() end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:addToParams(param)
	if not (param ~= nil) then
		do return end
	end
	if not (self.params ~= nil) then
		self.params = {}
	end
	do _g.jk.lang.Vector:append(self.params, param) end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:setIsStoredProcedure(v)
	self.isStoredProcedure = v
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:getIsStoredProcedure()
	do return self.isStoredProcedure end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:addParamString(val)
	do self:addToParams(val) end
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:addParamInteger(val)
	do self:addToParams(_g.jk.lang.Integer:asObject(val)) end
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:addParamLongInteger(val)
	do self:addToParams(_g.jk.lang.LongInteger:asObject(val)) end
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:addParamDouble(val)
	do self:addToParams(_g.jk.lang.Double:asObject(val)) end
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:addParamBlob(val)
	do self:addToParams(val) end
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:setParamString(name, val)
	do self:addToParams(val) end
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:setParamInteger(name, val)
	do self:addToParams(_g.jk.lang.Integer:asObject(val)) end
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:setParamLongInteger(name, val)
	do self:addToParams(_g.jk.lang.LongInteger:asObject(val)) end
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:setParamDouble(name, val)
	do self:addToParams(_g.jk.lang.Double:asObject(val)) end
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:setParamBlob(name, val)
	do self:addToParams(val) end
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:resetStatement()
	if self.db ~= nil then
		do self.db:resetStatement(self) end
	end
	self.params = nil
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:getError()
	do return nil end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:close()
	if self.db ~= nil then
		do self.db:closeStatementSync(self) end
	end
	self.db = nil
	self.id = -1
	self.params = nil
	self.isStoredProcedure = false
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:getId()
	do return self.id end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:setId(v)
	self.id = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:getDb()
	do return self.db end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:setDb(v)
	self.db = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:getParams()
	do return self.params end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:setParams(v)
	self.params = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:getColumns()
	do return self.columns end
end

function jk.mysql.MySQLDatabaseGeneric.MyStatement:setColumns(v)
	self.columns = v
	do return self end
end

jk.mysql.MySQLDatabaseGeneric.ResultSet = _g.jk.sql.SQLResultSetIterator._create()
jk.mysql.MySQLDatabaseGeneric.ResultSet.__index = jk.mysql.MySQLDatabaseGeneric.ResultSet
_vm:set_metatable(jk.mysql.MySQLDatabaseGeneric.ResultSet, {
	__index = _g.jk.sql.SQLResultSetIterator
})

function jk.mysql.MySQLDatabaseGeneric.ResultSet._create()
	local v = _vm:set_metatable({}, jk.mysql.MySQLDatabaseGeneric.ResultSet)
	return v
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mysql.MySQLDatabaseGeneric.ResultSet'
	self['_isType.jk.mysql.MySQLDatabaseGeneric.ResultSet'] = true
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:_construct0()
	jk.mysql.MySQLDatabaseGeneric.ResultSet._init(self)
	do _g.jk.sql.SQLResultSetIterator._construct0(self) end
	return self
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:next()
	_io:write_to_stdout("--- stub --- jk.mysql.MySQLDatabaseGeneric.ResultSet :: next" .. "\n")
	do return nil end
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:hasNext()
	_io:write_to_stdout("--- stub --- jk.mysql.MySQLDatabaseGeneric.ResultSet :: hasNext" .. "\n")
	do return false end
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:nextValues(values)
	_io:write_to_stdout("--- stub --- jk.mysql.MySQLDatabaseGeneric.ResultSet :: nextValues" .. "\n")
	do return false end
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:step()
	_io:write_to_stdout("--- stub --- jk.mysql.MySQLDatabaseGeneric.ResultSet :: step" .. "\n")
	do return false end
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:getColumnCount()
	_io:write_to_stdout("--- stub --- jk.mysql.MySQLDatabaseGeneric.ResultSet :: getColumnCount" .. "\n")
	do return 0 end
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:getColumnName(n)
	_io:write_to_stdout("--- stub --- jk.mysql.MySQLDatabaseGeneric.ResultSet :: getColumnName" .. "\n")
	do return nil end
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:getColumnNames()
	_io:write_to_stdout("--- stub --- jk.mysql.MySQLDatabaseGeneric.ResultSet :: getColumnNames" .. "\n")
	do return nil end
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:getColumnObject(n)
	_io:write_to_stdout("--- stub --- jk.mysql.MySQLDatabaseGeneric.ResultSet :: getColumnObject" .. "\n")
	do return nil end
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:getColumnInt(n)
	_io:write_to_stdout("--- stub --- jk.mysql.MySQLDatabaseGeneric.ResultSet :: getColumnInt" .. "\n")
	do return 0 end
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:getColumnLong(n)
	_io:write_to_stdout("--- stub --- jk.mysql.MySQLDatabaseGeneric.ResultSet :: getColumnLong" .. "\n")
	do return 0 end
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:getColumnDouble(n)
	_io:write_to_stdout("--- stub --- jk.mysql.MySQLDatabaseGeneric.ResultSet :: getColumnDouble" .. "\n")
	do return 0.0 end
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:getColumnBuffer(n)
	_io:write_to_stdout("--- stub --- jk.mysql.MySQLDatabaseGeneric.ResultSet :: getColumnBuffer" .. "\n")
	do return nil end
end

function jk.mysql.MySQLDatabaseGeneric.ResultSet:close()
	_io:write_to_stdout("--- stub --- jk.mysql.MySQLDatabaseGeneric.ResultSet :: close" .. "\n")
end

jk.mysql.MySQLDatabaseGeneric.CapabilityFlags = {}
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.__index = jk.mysql.MySQLDatabaseGeneric.CapabilityFlags
_vm:set_metatable(jk.mysql.MySQLDatabaseGeneric.CapabilityFlags, {})

jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_LONG_PASSWORD = 1
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_FOUND_ROWS = 2
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_LONG_FLAG = 4
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_CONNECT_WITH_DB = 8
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_NO_SCHEMA = 16
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_COMPRESS = 32
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_ODBC = 64
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_LOCAL_FILES = 128
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_IGNORE_SPACE = 256
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_PROTOCOL_41 = 512
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_INTERACTIVE = 1024
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_SSL = 2048
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_IGNORE_SIGPIPE = 4096
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_TRANSACTIONS = 8192
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_RESERVED = 16384
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_SECURE_CONNECTION = 32768
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_MULTI_STATEMENTS = 65536
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_MULTI_RESULTS = 131072
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_PS_MULTI_RESULTS = 262144
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_PLUGIN_AUTH = 524288
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_CONNECT_ATTRS = 1048576
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_PLUGIN_AUTH_LENENC_CLIENT_DATA = 2097152
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_CAN_HANDLE_EXPIRED_PASSWORDS = 4194304
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_SESSION_TRACK = 8388608
jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_DEPRECATE_EOF = 16777216

function jk.mysql.MySQLDatabaseGeneric.CapabilityFlags._create()
	local v = _vm:set_metatable({}, jk.mysql.MySQLDatabaseGeneric.CapabilityFlags)
	return v
end

function jk.mysql.MySQLDatabaseGeneric.CapabilityFlags:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mysql.MySQLDatabaseGeneric.CapabilityFlags'
	self['_isType.jk.mysql.MySQLDatabaseGeneric.CapabilityFlags'] = true
end

function jk.mysql.MySQLDatabaseGeneric.CapabilityFlags:_construct0()
	jk.mysql.MySQLDatabaseGeneric.CapabilityFlags._init(self)
	return self
end

jk.mysql.MySQLDatabaseGeneric.ConnectionState = {}
jk.mysql.MySQLDatabaseGeneric.ConnectionState.__index = jk.mysql.MySQLDatabaseGeneric.ConnectionState
_vm:set_metatable(jk.mysql.MySQLDatabaseGeneric.ConnectionState, {})

jk.mysql.MySQLDatabaseGeneric.ConnectionState.DISCONNECTED = 0
jk.mysql.MySQLDatabaseGeneric.ConnectionState.CONNECTION = 1
jk.mysql.MySQLDatabaseGeneric.ConnectionState.COMMAND = 2
jk.mysql.MySQLDatabaseGeneric.ConnectionState.DISCONNECTING = 3

function jk.mysql.MySQLDatabaseGeneric.ConnectionState._create()
	local v = _vm:set_metatable({}, jk.mysql.MySQLDatabaseGeneric.ConnectionState)
	return v
end

function jk.mysql.MySQLDatabaseGeneric.ConnectionState:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mysql.MySQLDatabaseGeneric.ConnectionState'
	self['_isType.jk.mysql.MySQLDatabaseGeneric.ConnectionState'] = true
end

function jk.mysql.MySQLDatabaseGeneric.ConnectionState:_construct0()
	jk.mysql.MySQLDatabaseGeneric.ConnectionState._init(self)
	return self
end

jk.mysql.MySQLDatabaseGeneric.FieldType = {}
jk.mysql.MySQLDatabaseGeneric.FieldType.__index = jk.mysql.MySQLDatabaseGeneric.FieldType
_vm:set_metatable(jk.mysql.MySQLDatabaseGeneric.FieldType, {})

jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_DECIMAL = 0
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_TINY = 1
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_TINYINT = 1
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_BOOL = 1
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_SHORT = 2
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_SMALLINT = 2
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_LONG = 3
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_INTEGER = 3
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_FLOAT = 4
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_DOUBLE = 5
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_NULL = 6
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_TIMESTAMP = 7
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_LONGLONG = 8
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_BIGINT = 8
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_SERIAL = 8
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_INT24 = 9
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_MEDIUMINT = 9
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_DATE = 10
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_TIME = 11
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_DATETIME = 12
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_YEAR = 13
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_NEWDATE = 14
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_VARCHAR = 15
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_BIT = 16
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_TIMESTAMP2 = 17
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_DATETIME2 = 18
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_TIME2 = 19
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_JSON = 245
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_NEWDECIMAL = 246
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_ENUM = 247
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_SET = 248
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_TINY_BLOB = 249
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_MEDIUM_BLOB = 250
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_LONG_BLOB = 251
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_BLOB = 252
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_VAR_STRING = 253
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_STRING = 254
jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_GEOMETRY = 255

function jk.mysql.MySQLDatabaseGeneric.FieldType._create()
	local v = _vm:set_metatable({}, jk.mysql.MySQLDatabaseGeneric.FieldType)
	return v
end

function jk.mysql.MySQLDatabaseGeneric.FieldType:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mysql.MySQLDatabaseGeneric.FieldType'
	self['_isType.jk.mysql.MySQLDatabaseGeneric.FieldType'] = true
end

function jk.mysql.MySQLDatabaseGeneric.FieldType:_construct0()
	jk.mysql.MySQLDatabaseGeneric.FieldType._init(self)
	return self
end

jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake = {}
jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake.__index = jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake
_vm:set_metatable(jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake, {})

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake._create()
	local v = _vm:set_metatable({}, jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake)
	return v
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake'
	self['_isType.jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake'] = true
	self.protocolVersion = 0
	self.serverVersion = nil
	self.connectionId = 0
	self.capabilityFlags = 0
	self.characterSet = 0
	self.statusFlags = 0
	self.capabilityFlagsLower = 0
	self.capabilityFlagsUpper = 0
	self.authPluginName = nil
	self.authPluginData = nil
	self.authPluginDataPart1 = nil
	self.authPluginDataPart2 = nil
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:_construct0()
	jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake._init(self)
	return self
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:getProtocolVersion()
	do return self.protocolVersion end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:setProtocolVersion(v)
	self.protocolVersion = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:getServerVersion()
	do return self.serverVersion end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:setServerVersion(v)
	self.serverVersion = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:getConnectionId()
	do return self.connectionId end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:setConnectionId(v)
	self.connectionId = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:getCapabilityFlags()
	do return self.capabilityFlags end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:setCapabilityFlags(v)
	self.capabilityFlags = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:getCharacterSet()
	do return self.characterSet end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:setCharacterSet(v)
	self.characterSet = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:getStatusFlags()
	do return self.statusFlags end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:setStatusFlags(v)
	self.statusFlags = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:getCapabilityFlagsLower()
	do return self.capabilityFlagsLower end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:setCapabilityFlagsLower(v)
	self.capabilityFlagsLower = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:getCapabilityFlagsUpper()
	do return self.capabilityFlagsUpper end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:setCapabilityFlagsUpper(v)
	self.capabilityFlagsUpper = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:getAuthPluginName()
	do return self.authPluginName end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:setAuthPluginName(v)
	self.authPluginName = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:getAuthPluginData()
	do return self.authPluginData end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:setAuthPluginData(v)
	self.authPluginData = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:getAuthPluginDataPart1()
	do return self.authPluginDataPart1 end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:setAuthPluginDataPart1(v)
	self.authPluginDataPart1 = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:getAuthPluginDataPart2()
	do return self.authPluginDataPart2 end
end

function jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake:setAuthPluginDataPart2(v)
	self.authPluginDataPart2 = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric:_destruct()
	do self:closeSocket() end
end

function jk.mysql.MySQLDatabaseGeneric:isSecureConnection()
	do return self.sslEnabled end
end

function jk.mysql.MySQLDatabaseGeneric:getMyCapabilityFlags()
	local v = 0
	if self:serverSupportsSSL() then
		v = _vm:bitwise_or(v, _g.jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_SSL)
	end
	v = _vm:bitwise_or(v, _g.jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_PROTOCOL_41)
	v = _vm:bitwise_or(v, _g.jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_SECURE_CONNECTION)
	v = _vm:bitwise_or(v, _g.jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_PLUGIN_AUTH)
	do return v end
end

function jk.mysql.MySQLDatabaseGeneric:createPacket()
	local v = _g.jk.mypacket.MyPacketBuilder._construct0(_g.jk.mypacket.MyPacketBuilder._create())
	do v:appendMultipleBytes(0, 4) end
	do return v end
end

function jk.mysql.MySQLDatabaseGeneric:finalizePacket(packet, seqnum)
	if not (packet ~= nil) then
		do return nil end
	end
	do
		local v = packet:finalize()
		do _g.jk.lang.Buffer:copyFrom(v, _g.jk.lang.Buffer:forInt32LE(#v - 4), 0, 0, 4) end
		v[3 + 1] = _vm:bitwise_and(seqnum, 255)
		do return v end
	end
end

function jk.mysql.MySQLDatabaseGeneric:doInitialize(serverAddress, username, password, database, sslMode, protocol, enableUTF8)
	if not (protocol == _g.jk.mysql.MySQLDatabase.PROTOCOL_SOCKET) then
		do self:logError("Unsupported protocol in MySQLDatabaseGeneric: `" .. _g.jk.lang.String:safeString(protocol) .. "'") end
		do return false end
	end
	self.serverAddress = serverAddress
	self.username = username
	self.password = password
	self.database = database
	self.sslMode = sslMode
	self.protocol = protocol
	self.enableUTF8 = enableUTF8
	self.reconnectTime = 0
	do return self:reconnectSync() end
end

function jk.mysql.MySQLDatabaseGeneric:serverSupportsSSL()
	if _vm:bitwise_and(self.serverCapabilityFlags, _g.jk.mysql.MySQLDatabaseGeneric.CapabilityFlags.CLIENT_SSL) ~= 0 then
		do return true end
	end
	do return false end
end

function jk.mysql.MySQLDatabaseGeneric:openSocketForAddress(address)
	if not (address ~= nil) then
		do return nil end
	end
	do
		local host = address
		local port = 3306
		if _g.jk.lang.String:getIndexOfCharacter(host, 58, 0) >= 0 then
			local comps = _g.jk.lang.String:split(host, 58, 2)
			host = comps[0 + 1]
			port = _g.jk.lang.String:toInteger(comps[1 + 1])
		end
		do self:logDebug("Connecting to MySQL server `" .. _g.jk.lang.String:safeString(host) .. ":" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(port)) .. "' ..") end
		do return _g.jk.socket.TCPSocket:createAndConnect(host, port) end
	end
end

function jk.mysql.MySQLDatabaseGeneric:getHostName(address)
	local colon = _g.jk.lang.String:getIndexOfCharacter(address, 58, 0)
	if colon >= 0 then
		do return _g.jk.lang.String:getSubString(address, 0, colon) end
	end
	do return address end
end

function jk.mysql.MySQLDatabaseGeneric:parseProtocolHandshake(buffer)
	if not (buffer ~= nil) then
		do return nil end
	end
	do
		local walker = _g.jk.mypacket.MyPacketParser:forBuffer(buffer)
		local v = _g.jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake._construct0(_g.jk.mysql.MySQLDatabaseGeneric.ProtocolHandshake._create())
		do v:setProtocolVersion(walker:getInt8()) end
		do v:setServerVersion(walker:getNullTerminatedString()) end
		do v:setConnectionId(walker:getInt32()) end
		if v:getProtocolVersion() >= 10 then
			do v:setAuthPluginDataPart1(walker:getStaticLengthString(8)) end
			do walker:skipBytes(1) end
			do v:setCapabilityFlagsLower(walker:getInt16()) end
			do v:setCharacterSet(walker:getInt8()) end
			do v:setStatusFlags(walker:getInt16()) end
			do v:setCapabilityFlagsUpper(walker:getInt16()) end
			do
				local apdatalen = walker:getInt8()
				do walker:skipBytes(10) end
				apdatalen = apdatalen - 8
				if apdatalen > 13 then
					apdatalen = 13
				end
				do v:setAuthPluginDataPart2(walker:getStaticLengthString(apdatalen)) end
				do v:setAuthPluginName(walker:getNullTerminatedString()) end
				do v:setAuthPluginData(_g.jk.lang.String:appendString(v:getAuthPluginDataPart1(), v:getAuthPluginDataPart2())) end
			end
		end
		do return v end
	end
end

jk.mysql.MySQLDatabaseGeneric.OkPacket = {}
jk.mysql.MySQLDatabaseGeneric.OkPacket.__index = jk.mysql.MySQLDatabaseGeneric.OkPacket
_vm:set_metatable(jk.mysql.MySQLDatabaseGeneric.OkPacket, {})

function jk.mysql.MySQLDatabaseGeneric.OkPacket._create()
	local v = _vm:set_metatable({}, jk.mysql.MySQLDatabaseGeneric.OkPacket)
	return v
end

function jk.mysql.MySQLDatabaseGeneric.OkPacket:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mysql.MySQLDatabaseGeneric.OkPacket'
	self['_isType.jk.mysql.MySQLDatabaseGeneric.OkPacket'] = true
	self.affectedRows = 0
	self.lastInsertId = 0
	self.statusFlags = 0
	self.warningCount = 0
end

function jk.mysql.MySQLDatabaseGeneric.OkPacket:_construct0()
	jk.mysql.MySQLDatabaseGeneric.OkPacket._init(self)
	return self
end

function jk.mysql.MySQLDatabaseGeneric.OkPacket:getAffectedRows()
	do return self.affectedRows end
end

function jk.mysql.MySQLDatabaseGeneric.OkPacket:setAffectedRows(v)
	self.affectedRows = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.OkPacket:getLastInsertId()
	do return self.lastInsertId end
end

function jk.mysql.MySQLDatabaseGeneric.OkPacket:setLastInsertId(v)
	self.lastInsertId = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.OkPacket:getStatusFlags()
	do return self.statusFlags end
end

function jk.mysql.MySQLDatabaseGeneric.OkPacket:setStatusFlags(v)
	self.statusFlags = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.OkPacket:getWarningCount()
	do return self.warningCount end
end

function jk.mysql.MySQLDatabaseGeneric.OkPacket:setWarningCount(v)
	self.warningCount = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric:isOkPacket(packet)
	if not (packet ~= nil) then
		do return false end
	end
	if packet[0 + 1] == 0 then
		do return true end
	end
	do return false end
end

function jk.mysql.MySQLDatabaseGeneric:parseOkPacket(packet)
	if not (packet ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.mysql.MySQLDatabaseGeneric.OkPacket._construct0(_g.jk.mysql.MySQLDatabaseGeneric.OkPacket._create())
		local walker = _g.jk.mypacket.MyPacketParser:forBuffer(packet)
		local header = walker:getInt8()
		do v:setAffectedRows(walker:getLengthEncodedInteger()) end
		do v:setLastInsertId(walker:getLengthEncodedInteger()) end
		do v:setStatusFlags(walker:getInt16()) end
		do v:setWarningCount(walker:getInt16()) end
		do return v end
	end
end

function jk.mysql.MySQLDatabaseGeneric:logOkPacket(v)
	if not (v ~= nil) then
		do return end
	end
	do self:logDebug("MySQL server responded with OK status: affectedRows=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(v:getAffectedRows())) .. ", lastInsertId=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(v:getLastInsertId())) .. ", statusFlags=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(v:getStatusFlags())) .. ", warningCount=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(v:getWarningCount()))) end
end

function jk.mysql.MySQLDatabaseGeneric:handleAsErrorPacket(packet)
	if not (packet ~= nil) then
		do return false end
	end
	if packet[0 + 1] == 255 then
		do self:logErrorPacket(packet) end
		do return true end
	end
	do return false end
end

function jk.mysql.MySQLDatabaseGeneric:logErrorPacket(packet)
	local walker = _g.jk.mypacket.MyPacketParser:forBuffer(packet)
	local header = walker:getInt8()
	local errorCode = walker:getInt16()
	local sqlStateMarker = walker:getStaticLengthString(1)
	local sqlState = walker:getStaticLengthString(5)
	local errorMessage = walker:getEofTerminatedString()
	do self:logError("MySQL server sent error: errorCode=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(errorCode)) .. ", errorMessage=`" .. _g.jk.lang.String:safeString(errorMessage) .. "'") end
end

function jk.mysql.MySQLDatabaseGeneric:reconnectSync()
	do self:closeSocket() end
	do
		local now = _g.jk.time.SystemClock:asSeconds()
		if now - self.reconnectTime < 5 then
			do self:logDebug("Reconnecting too fast. Waiting for 5 seconds..") end
			do _g.jk.thread.CurrentThread:sleepSeconds(5) end
		end
		self.reconnectTime = _g.jk.time.SystemClock:asSeconds()
		do
			local osocket = self:openSocketForAddress(self.serverAddress)
			if not (osocket ~= nil) then
				do self:logError("Failed to connect to MySQL server: `" .. _g.jk.lang.String:safeString(self.serverAddress) .. "'") end
				do return false end
			end
			self.connectionState = _g.jk.mysql.MySQLDatabaseGeneric.ConnectionState.CONNECTION
			self.socket = osocket
			do
				local header = self:receivePacketDataSync()
				if not (header ~= nil) then
					do return false end
				end
				do
					local hs = self:parseProtocolHandshake(header)
					if not (hs ~= nil) then
						do self:logWarning("Failed to parse protocol handshake") end
					else
						do self:logDebug("protocolVersion: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(hs:getProtocolVersion()))) end
						do self:logDebug("serverVersion: " .. _g.jk.lang.String:safeString(hs:getServerVersion())) end
						do self:logDebug("connectionId: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(hs:getConnectionId()))) end
						do self:logDebug("authPluginData: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(_g.jk.lang.String:getLength(hs:getAuthPluginData()))) .. " bytes") end
						do self:logDebug("authPluginName: " .. _g.jk.lang.String:safeString(hs:getAuthPluginName())) end
						do self:logDebug("capabilityFlags: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(hs:getCapabilityFlags()))) end
						do self:logDebug("characterSet: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(hs:getCharacterSet()))) end
						do self:logDebug("statusFlags: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(hs:getStatusFlags()))) end
						do self:logDebug("capabilityFlagsLower: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(hs:getCapabilityFlagsLower()))) end
						do self:logDebug("capabilityFlagsUpper: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(hs:getCapabilityFlagsUpper()))) end
						self.serverCapabilityFlags = _vm:bitwise_or(_vm:bitwise_left_shift(hs:getCapabilityFlagsUpper(), 16), hs:getCapabilityFlagsLower())
					end
					if not (self.sslMode == _g.jk.mysql.MySQLDatabase.SSL_MODE_NONE) then
						if not self:serverSupportsSSL() then
							do self:logWarning("Server does not support SSL. Trying to initialize it anyway...") end
						else
							do self:logDebug("Server supports SSL") end
						end
						do self:sendSync(self:createSSLRequest()) end
						do
							local sslsocket = _g.jk.socket.ssl.SSLSocket:forClient(osocket, self:getHostName(self.serverAddress), self:getLogger(), true, nil)
							if not (sslsocket ~= nil) then
								do self:logError("SSL handshake with MySQL server failed") end
								do return false end
							end
							do self:logDebug("SSL connection successfully established.") end
							self.socket = sslsocket
							self.sslEnabled = true
						end
					else
						do self:logDebug("SSL disabled as requested") end
					end
					do
						local ap = self.authenticationPlugin
						if _g.jk.lang.String:isEmpty(ap) then
							ap = hs:getAuthPluginName()
						end
						if not self:handleAuthenticationSync(ap, hs:getAuthPluginData(), false) then
							do self:logError("Authentication failed.") end
							do self:closeSocket() end
							do return false end
						end
						if not self:executePacketSync(self:createComInitDb(self.database)) then
							do self:closeSocket() end
							do return false end
						end
						self.connectionState = _g.jk.mysql.MySQLDatabaseGeneric.ConnectionState.COMMAND
						do self:logDebug("Successfully connected and authenticated to MySQL server.") end
						do return true end
					end
				end
			end
		end
	end
end

function jk.mysql.MySQLDatabaseGeneric:getNextSequence()
	if self.connectionState == _g.jk.mysql.MySQLDatabaseGeneric.ConnectionState.COMMAND then
		do return 0 end
	end
	do
		local v = _vm:bitwise_and(self.sequence, 255)
		do self.sequence = self.sequence + 1 end
		if self.sequence > 255 then
			self.sequence = 0
		end
		do return v end
	end
end

function jk.mysql.MySQLDatabaseGeneric:onSequenceReceived(number)
	self.sequence = number + 1
	if self.sequence > 255 then
		self.sequence = 0
	end
end

function jk.mysql.MySQLDatabaseGeneric:createSSLRequest()
	local pm = self:createPacket()
	do pm:appendInt32(self:getMyCapabilityFlags()) end
	do pm:appendInt32(4294967295) end
	do pm:appendByte(255) end
	do pm:appendMultipleBytes(0, 23) end
	do return self:finalizePacket(pm, self:getNextSequence()) end
end

function jk.mysql.MySQLDatabaseGeneric:createComQuit()
	local pm = self:createPacket()
	do pm:appendByte(1) end
	do return self:finalizePacket(pm, self:getNextSequence()) end
end

function jk.mysql.MySQLDatabaseGeneric:createComInitDb(dbname)
	local pm = self:createPacket()
	do pm:appendByte(2) end
	do pm:appendEofTerminatedString(dbname) end
	do return self:finalizePacket(pm, self:getNextSequence()) end
end

function jk.mysql.MySQLDatabaseGeneric:createComQuery(query)
	local pm = self:createPacket()
	do pm:appendByte(3) end
	do pm:appendEofTerminatedString(query) end
	do return self:finalizePacket(pm, self:getNextSequence()) end
end

function jk.mysql.MySQLDatabaseGeneric:createAuthenticationPacket(authPlugin, authData, forAuthSwitch)
	local pm = self:createPacket()
	if not forAuthSwitch then
		do pm:appendInt32(self:getMyCapabilityFlags()) end
		do pm:appendInt32(4294967295) end
		do pm:appendByte(255) end
		do pm:appendMultipleBytes(0, 23) end
		do pm:appendNullTerminatedString(self.username) end
	end
	if authPlugin == "mysql_clear_password" then
		if not forAuthSwitch then
			do pm:appendByte(_g.jk.lang.String:getLength(self.password)) end
			do pm:appendBuffer(_g.jk.lang.String:toUTF8Buffer(self.password)) end
			do pm:appendNullTerminatedString("mysql_clear_password") end
		else
			do pm:appendBuffer(_g.jk.lang.String:toUTF8Buffer(self.password)) end
		end
	elseif authPlugin == "mysql_native_password" then
		local bpassword = _g.jk.lang.String:toUTF8Buffer(self.password)
		local bdata = _g.jk.lang.String:toUTF8Buffer(authData)
		local encoder = _g.jk.sha.SHAEncoder:create()
		if not (encoder ~= nil) then
			do self:logError("Failed to create a SHA encoder!") end
			do return nil end
		end
		do
			local h1 = encoder:encodeAsBuffer(bpassword, _g.jk.sha.SHAEncoder.SHA1)
			local hpw2 = encoder:encodeAsBuffer(h1, _g.jk.sha.SHAEncoder.SHA1)
			local concat = _g.jk.lang.Buffer:append(bdata, hpw2, -1)
			local h2 = encoder:encodeAsBuffer(concat, _g.jk.sha.SHAEncoder.SHA1)
			if not (#h1 == 20 and #h2 == 20) then
				do self:logError("SHA1 encoder returned buffers that are not 20 bytes!") end
				do return nil end
			end
			do
				local n = 0
				while n < 20 do
					h1[n + 1] = _vm:bitwise_xor(h1[n + 1], h2[n + 1])
					do n = n + 1 end
				end
			end
			if not forAuthSwitch then
				do pm:appendByte(20) end
				do pm:appendBuffer(h1) end
				do pm:appendNullTerminatedString("mysql_native_password") end
			else
				do pm:appendBuffer(h1) end
			end
		end
	elseif authPlugin == "caching_sha2_password" or authPlugin == "sha256_password" then
		local bpassword = _g.jk.lang.String:toUTF8Buffer(self.password)
		local bdata = _g.jk.lang.String:toUTF8Buffer(authData)
		local encoder = _g.jk.sha.SHAEncoder:create()
		if not (encoder ~= nil) then
			do self:logError("Failed to create a SHA encoder!") end
			do return nil end
		end
		do
			local h1 = encoder:encodeAsBuffer(bpassword, _g.jk.sha.SHAEncoder.SHA256)
			local hpw2 = encoder:encodeAsBuffer(h1, _g.jk.sha.SHAEncoder.SHA256)
			local concat = _g.jk.lang.Buffer:append(hpw2, bdata, -1)
			local h2 = encoder:encodeAsBuffer(concat, _g.jk.sha.SHAEncoder.SHA256)
			local sz = #h1
			local sz2 = #h2
			if not (sz == sz2) then
				do self:logError("SHA256 encoder returned different size buffers " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(sz)) .. " and " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(sz2)) .. "!") end
				do return nil end
			end
			do
				local n = 0
				while n < sz do
					h1[n + 1] = _vm:bitwise_xor(h1[n + 1], h2[n + 1])
					do n = n + 1 end
				end
			end
			if not forAuthSwitch then
				do pm:appendByte(sz) end
				do pm:appendBuffer(h1) end
				do pm:appendNullTerminatedString("caching_sha2_password") end
			else
				do pm:appendBuffer(h1) end
			end
		end
	else
		do self:logError("Unsupported authentication plugin requested by server: `" .. _g.jk.lang.String:safeString(authPlugin) .. "'") end
		do return nil end
	end
	do return self:finalizePacket(pm, self:getNextSequence()) end
end

function jk.mysql.MySQLDatabaseGeneric:handleAuthenticationSync(authPlugin, authData, forAuthSwitch)
	local response = self:sendAndReceive(self:createAuthenticationPacket(authPlugin, authData, forAuthSwitch))
	if not (response ~= nil) then
		do return false end
	end
	if authPlugin == "caching_sha2_password" then
		if #response == 2 and response[0 + 1] == 1 and response[1 + 1] == 4 then
			if self:isSecureConnection() then
				local pm = self:createPacket()
				do pm:appendNullTerminatedString(self.password) end
				response = self:sendAndReceive(self:finalizePacket(pm, self:getNextSequence()))
			else
				do self:logError("Using caching_sha2_password over unsecure connection is not supported.") end
				do return false end
			end
		elseif #response == 2 and response[0 + 1] == 1 and response[1 + 1] == 3 then
			local packet = self:receivePacketDataSync()
			if self:isOkPacket(packet) then
				do self:logDebug("Received a fast_auth_success message from MySQL server.") end
				do self:logOkPacket(self:parseOkPacket(packet)) end
				self.sequence = 0
				do return true end
			end
			do self:logError("Received an unexpected (non-ok) packet from MySQL server.") end
			do self:closeSocket() end
			do return false end
		end
	end
	if self:handleAsErrorPacket(response) then
		do self:closeSocket() end
		do return false end
	end
	if self:isOkPacket(response) then
		do self:logOkPacket(self:parseOkPacket(response)) end
		self.sequence = 0
		do return true end
	end
	if response[0 + 1] == 254 then
		local walker = _g.jk.mypacket.MyPacketParser:forBuffer(response)
		do walker:getInt8() end
		do
			local pluginName = walker:getNullTerminatedString()
			local authPluginData = walker:getEofTerminatedString()
			if _g.jk.lang.String:isNotEmpty(pluginName) then
				do self:logDebug("Server responded with auth switch request. Plugin name=`" .. _g.jk.lang.String:safeString(pluginName) .. "'") end
				if pluginName == authPlugin then
					do self:logError("Auth switch request to plugin `" .. _g.jk.lang.String:safeString(pluginName) .. "' received from server, but already using that plugin! Aborting.") end
					do self:closeSocket() end
					do return false end
				end
				do return self:handleAuthenticationSync(pluginName, authPluginData, true) end
			end
		end
	end
	do self:logError("Unknown packet received from MySQL server as response to handshake response.") end
	do self:closeSocket() end
	do return false end
end

function jk.mysql.MySQLDatabaseGeneric:asCompletePacket(buffer)
	if not (buffer ~= nil and #buffer > 4) then
		do return nil end
	end
	do
		local nb = _util:allocate_buffer(4)
		nb[0 + 1] = buffer[0 + 1]
		nb[1 + 1] = buffer[1 + 1]
		nb[2 + 1] = buffer[2 + 1]
		nb[3 + 1] = 0
		do
			local psize = _g.jk.lang.Buffer:getInt32LE(nb, 0)
			local bsize = #buffer
			if bsize == psize + 4 then
				self.overflowBuffer = nil
				do self:onSequenceReceived(buffer[3 + 1]) end
				do return buffer end
			end
			if bsize > psize + 4 then
				local v = _g.jk.lang.Buffer:getSubBuffer(buffer, 0, psize + 4, false)
				self.overflowBuffer = _g.jk.lang.Buffer:getSubBuffer(buffer, psize + 4, -1, false)
				do self:onSequenceReceived(v[3 + 1]) end
				do return v end
			end
			do return nil end
		end
	end
end

function jk.mysql.MySQLDatabaseGeneric:receivePacketSync()
	if not (self.socket ~= nil) then
		do return nil end
	end
	do
		local v = self:asCompletePacket(self.overflowBuffer)
		if not (v ~= nil) then
			local data = self.overflowBuffer
			self.overflowBuffer = nil
			while true do
				local n = self.socket:read(self.receiveBuffer)
				if n < 1 then
					if self.connectionState == _g.jk.mysql.MySQLDatabaseGeneric.ConnectionState.COMMAND then
						do self:logWarning("Failed to receive packet. Reconnecting.") end
						do self:reconnectSync() end
					end
					do return nil end
				end
				data = _g.jk.lang.Buffer:append(data, self.receiveBuffer, n)
				v = self:asCompletePacket(data)
				if v ~= nil then
					do break end
				end
			end
		end
		do self:logDebug("Received packet: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forBufferHex(v))) end
		do return v end
	end
end

function jk.mysql.MySQLDatabaseGeneric:receivePacketsSync()
	local v = nil
	while true do
		local packet = self:receivePacketSync()
		if not (packet ~= nil) then
			do return nil end
		end
		if packet[0 + 1] == 0 and packet[1 + 1] == 0 and packet[2 + 1] == 0 then
			do break end
		end
		if not (v ~= nil) then
			v = {}
		end
		do _g.jk.lang.Vector:append(v, packet) end
		if packet[0 + 1] == 255 and packet[1 + 1] == 255 and packet[2 + 1] == 255 then
			goto _continue1
		end
		do break end
		::_continue1::
	end
	do return v end
end

function jk.mysql.MySQLDatabaseGeneric:receivePacketDataSync()
	local packets = self:receivePacketsSync()
	if not (packets ~= nil) then
		do return nil end
	end
	if _g.jk.lang.Vector:getSize(packets) == 1 then
		local packet = packets[0 + 1]
		if not (packet ~= nil) then
			do return nil end
		end
		if not (#packet > 4) then
			do return nil end
		end
		do return _g.jk.lang.Buffer:getSubBuffer(packet, 4, -1, false) end
	end
	do
		local v = nil
		if packets ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(packets)
			do
				n = 0
				while n < m do
					local packet = packets[n + 1]
					if packet ~= nil then
						if packet == nil or #packet < 4 then
							goto _continue2
						end
						v = _g.jk.lang.Buffer:append(v, _g.jk.lang.Buffer:getSubBuffer(packet, 4, -1, false), -1)
					end
					::_continue2::
					do n = n + 1 end
				end
			end
		end
		do return v end
	end
end

function jk.mysql.MySQLDatabaseGeneric:sendSync(packet)
	if not (self.socket ~= nil and packet ~= nil) then
		do return false end
	end
	if not (self.socket:write(packet, -1) > 0) then
		if self.connectionState == _g.jk.mysql.MySQLDatabaseGeneric.ConnectionState.COMMAND then
			do self:logWarning("Failed to send packet of " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(#packet)) .. " bytes. Reconnecting.") end
			do self:reconnectSync() end
		end
		do return false end
	end
	do self:logDebug("Sent packet: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forBufferHex(packet))) end
	do return true end
end

function jk.mysql.MySQLDatabaseGeneric:sendAndReceive(packet)
	if not self:sendSync(packet) then
		do return nil end
	end
	do return self:receivePacketDataSync() end
end

function jk.mysql.MySQLDatabaseGeneric:executePacketSync(packet)
	local result = self:sendAndReceive(packet)
	if not (result ~= nil) then
		do return false end
	end
	if self:isOkPacket(result) then
		do self:logOkPacket(self:parseOkPacket(result)) end
		do return true end
	end
	if self:handleAsErrorPacket(result) then
		do return false end
	end
	do self:logWarning("Received an unexpected (non-error, non-ok) packet from MySQL server.") end
	do return false end
end

function jk.mysql.MySQLDatabaseGeneric:closeSocket()
	if self.socket ~= nil then
		do self:logDebug("Closing MySQL socket") end
		do self.socket:close() end
		self.socket = nil
		self.connectionState = _g.jk.mysql.MySQLDatabaseGeneric.ConnectionState.DISCONNECTED
		self.sslEnabled = false
		self.overflowBuffer = nil
	end
end

function jk.mysql.MySQLDatabaseGeneric:closeSync()
	self.connectionState = _g.jk.mysql.MySQLDatabaseGeneric.ConnectionState.DISCONNECTING
	do self:sendAndReceive(self:createComQuit()) end
	do self:closeSocket() end
end

function jk.mysql.MySQLDatabaseGeneric:receiveColumnsSync(numColumns)
	local columns = nil
	if numColumns > 0 then
		columns = {}
		do
			local n = 0
			while true do
				local packet = self:receivePacketDataSync()
				if not (packet ~= nil) then
					do self:closeSocket() end
					do return nil end
				end
				if self:isEofPacket(packet) then
					do break end
				end
				do
					local column = self:parseColumnDefinition(packet)
					if not (column ~= nil) then
						do self:logWarning("Invalid column packet received.") end
						goto _continue3
					end
					do self:logDebug("Column: `" .. _g.jk.lang.String:safeString(column:getName()) .. "'") end
					do _g.jk.lang.Vector:append(columns, column) end
					do n = n + 1 end
				end
				::_continue3::
			end
			do self:logDebug("Received " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(n)) .. " columns") end
		end
	end
	do return columns end
end

function jk.mysql.MySQLDatabaseGeneric:prepareSync(sql)
	if not _g.jk.lang.String:isNotEmpty(sql) then
		do self:logWarning("Empty string given as statement to prepare") end
		do return nil end
	end
	do
		local prep = self:createPacket()
		do prep:appendByte(22) end
		do prep:appendEofTerminatedString(sql) end
		do self:logDebug("Preparing query: `" .. _g.jk.lang.String:safeString(sql) .. "'") end
		do
			local prepresp = self:sendAndReceive(self:finalizePacket(prep, self:getNextSequence()))
			if self:handleAsErrorPacket(prepresp) then
				do return nil end
			end
			do
				local walker = _g.jk.mypacket.MyPacketParser:forBuffer(prepresp)
				local status = walker:getInt8()
				if status ~= 0 then
					do self:logError("Prepare statement returned non-zero status") end
					do return nil end
				end
				do
					local statementId = walker:getInt32()
					local numColumns = walker:getInt16()
					local numParams = walker:getInt16()
					do walker:skipBytes(1) end
					do
						local warningCount = walker:getInt16()
						do self:logDebug("Query prepared as statement id " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(statementId))) end
						if numParams > 0 then
							local n = 0
							while true do
								local packet = self:receivePacketDataSync()
								if not (packet ~= nil) then
									do self:closeSocket() end
									do return nil end
								end
								if self:isEofPacket(packet) then
									do break end
								end
								do n = n + 1 end
							end
							do self:logDebug("Query has " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(n)) .. " parameter(s)") end
						end
						do
							local columns = self:receiveColumnsSync(numColumns)
							do return _g.jk.mysql.MySQLDatabaseGeneric.MyStatement:forStatementId(statementId, columns, self) end
						end
					end
				end
			end
		end
	end
end

function jk.mysql.MySQLDatabaseGeneric:isEofPacket(packet)
	if not (packet ~= nil) then
		do return false end
	end
	if packet[0 + 1] == 254 and #packet <= 5 then
		do return true end
	end
	do return false end
end

jk.mysql.MySQLDatabaseGeneric.ColumnDefinition = {}
jk.mysql.MySQLDatabaseGeneric.ColumnDefinition.__index = jk.mysql.MySQLDatabaseGeneric.ColumnDefinition
_vm:set_metatable(jk.mysql.MySQLDatabaseGeneric.ColumnDefinition, {})

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition._create()
	local v = _vm:set_metatable({}, jk.mysql.MySQLDatabaseGeneric.ColumnDefinition)
	return v
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mysql.MySQLDatabaseGeneric.ColumnDefinition'
	self['_isType.jk.mysql.MySQLDatabaseGeneric.ColumnDefinition'] = true
	self.catalog = nil
	self.schema = nil
	self.table = nil
	self.orgTable = nil
	self.name = nil
	self.orgName = nil
	self.nextLength = 0
	self.characterSet = 0
	self.columnLength = 0
	self.type = 0
	self.flags = 0
	self.decimals = 0
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:_construct0()
	jk.mysql.MySQLDatabaseGeneric.ColumnDefinition._init(self)
	return self
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:getCatalog()
	do return self.catalog end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:setCatalog(v)
	self.catalog = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:getSchema()
	do return self.schema end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:setSchema(v)
	self.schema = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:getTable()
	do return self.table end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:setTable(v)
	self.table = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:getOrgTable()
	do return self.orgTable end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:setOrgTable(v)
	self.orgTable = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:getName()
	do return self.name end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:setName(v)
	self.name = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:getOrgName()
	do return self.orgName end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:setOrgName(v)
	self.orgName = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:getNextLength()
	do return self.nextLength end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:setNextLength(v)
	self.nextLength = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:getCharacterSet()
	do return self.characterSet end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:setCharacterSet(v)
	self.characterSet = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:getColumnLength()
	do return self.columnLength end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:setColumnLength(v)
	self.columnLength = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:getType()
	do return self.type end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:setType(v)
	self.type = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:getFlags()
	do return self.flags end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:setFlags(v)
	self.flags = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:getDecimals()
	do return self.decimals end
end

function jk.mysql.MySQLDatabaseGeneric.ColumnDefinition:setDecimals(v)
	self.decimals = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric:parseColumnDefinition(packet)
	if not (packet ~= nil) then
		do return nil end
	end
	do
		local walker = _g.jk.mypacket.MyPacketParser:forBuffer(packet)
		local v = _g.jk.mysql.MySQLDatabaseGeneric.ColumnDefinition._construct0(_g.jk.mysql.MySQLDatabaseGeneric.ColumnDefinition._create())
		do v:setCatalog(walker:getLengthEncodedString()) end
		do v:setSchema(walker:getLengthEncodedString()) end
		do v:setTable(walker:getLengthEncodedString()) end
		do v:setOrgTable(walker:getLengthEncodedString()) end
		do v:setName(walker:getLengthEncodedString()) end
		do v:setOrgName(walker:getLengthEncodedString()) end
		do v:setNextLength(walker:getLengthEncodedInteger()) end
		do v:setCharacterSet(walker:getInt16()) end
		do v:setColumnLength(walker:getInt32()) end
		do v:setType(walker:getInt8()) end
		do v:setFlags(walker:getInt16()) end
		do v:setDecimals(walker:getInt8()) end
		do return v end
	end
end

jk.mysql.MySQLDatabaseGeneric.MyResultSet = _g.jk.sql.SQLResultSetIterator._create()
jk.mysql.MySQLDatabaseGeneric.MyResultSet.__index = jk.mysql.MySQLDatabaseGeneric.MyResultSet
_vm:set_metatable(jk.mysql.MySQLDatabaseGeneric.MyResultSet, {
	__index = _g.jk.sql.SQLResultSetIterator
})

function jk.mysql.MySQLDatabaseGeneric.MyResultSet._create()
	local v = _vm:set_metatable({}, jk.mysql.MySQLDatabaseGeneric.MyResultSet)
	return v
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mysql.MySQLDatabaseGeneric.MyResultSet'
	self['_isType.jk.mysql.MySQLDatabaseGeneric.MyResultSet'] = true
	self.columns = nil
	self.rowData = nil
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:_construct0()
	jk.mysql.MySQLDatabaseGeneric.MyResultSet._init(self)
	do _g.jk.sql.SQLResultSetIterator._construct0(self) end
	return self
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:getColumnCount()
	do return _g.jk.lang.Vector:getSize(self.columns) end
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:getColumnName(n)
	local v = _g.jk.lang.Vector:get(self.columns, n)
	if not (v ~= nil) then
		do return nil end
	end
	do return v:getName() end
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:getColumnNames()
	local v = {}
	local cc = self:getColumnCount()
	do
		local n = 0
		while n < cc do
			do _g.jk.lang.Vector:append(v, self:getColumnName(n)) end
			do n = n + 1 end
		end
	end
	do return v end
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:nextValues(values)
	do _g.jk.lang.Vector:clear(values) end
	if not self:step() then
		do return false end
	end
	do
		local cc = self:getColumnCount()
		do
			local n = 0
			while n < cc do
				do _g.jk.lang.Vector:append(values, self:getColumnObject(n)) end
				do n = n + 1 end
			end
		end
		do return true end
	end
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:next()
	if not self:step() then
		do return nil end
	end
	do
		local v = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
		local cc = self:getColumnCount()
		do
			local n = 0
			while n < cc do
				local kk = self:getColumnName(n)
				if kk ~= nil then
					do v:setObject(kk, self:getColumnObject(n)) end
				end
				do n = n + 1 end
			end
		end
		do return v end
	end
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:getColumnObject(n)
	do return _g.jk.lang.Vector:get(self.rowData, n) end
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:getColumnInt(n)
	do return _g.jk.lang.Integer:asInteger(self:getColumnObject(n)) end
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:getColumnLong(n)
	do return _g.jk.lang.LongInteger:asLong(self:getColumnObject(n)) end
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:getColumnDouble(n)
	do return _g.jk.lang.Double:asDouble(self:getColumnObject(n)) end
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:getColumnBuffer(n)
	do return (function(o)
		if _util:is_buffer(o) then
			do return o end
		end
		do return nil end
	end)(self:getColumnObject(n)) end
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:getColumns()
	do return self.columns end
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:setColumns(v)
	self.columns = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:getRowData()
	do return self.rowData end
end

function jk.mysql.MySQLDatabaseGeneric.MyResultSet:setRowData(v)
	self.rowData = v
	do return self end
end

jk.mysql.MySQLDatabaseGeneric.StaticResultSet = _g.jk.mysql.MySQLDatabaseGeneric.MyResultSet._create()
jk.mysql.MySQLDatabaseGeneric.StaticResultSet.__index = jk.mysql.MySQLDatabaseGeneric.StaticResultSet
_vm:set_metatable(jk.mysql.MySQLDatabaseGeneric.StaticResultSet, {
	__index = _g.jk.mysql.MySQLDatabaseGeneric.MyResultSet
})

function jk.mysql.MySQLDatabaseGeneric.StaticResultSet._create()
	local v = _vm:set_metatable({}, jk.mysql.MySQLDatabaseGeneric.StaticResultSet)
	return v
end

function jk.mysql.MySQLDatabaseGeneric.StaticResultSet:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mysql.MySQLDatabaseGeneric.StaticResultSet'
	self['_isType.jk.mysql.MySQLDatabaseGeneric.StaticResultSet'] = true
	self.data = nil
	self.current = 0
end

function jk.mysql.MySQLDatabaseGeneric.StaticResultSet:_construct0()
	jk.mysql.MySQLDatabaseGeneric.StaticResultSet._init(self)
	do _g.jk.mysql.MySQLDatabaseGeneric.MyResultSet._construct0(self) end
	return self
end

function jk.mysql.MySQLDatabaseGeneric.StaticResultSet:hasNext()
	do return self.current + 1 < _g.jk.lang.Vector:getSize(self.data) end
end

function jk.mysql.MySQLDatabaseGeneric.StaticResultSet:step()
	if not self:hasNext() then
		do self:setRowData(nil) end
		do return false end
	end
	do self:setRowData(_g.jk.lang.Vector:get(self.data, (function() local v = self.current self.current = self.current + 1 return v end)())) end
	do return true end
end

function jk.mysql.MySQLDatabaseGeneric.StaticResultSet:getData()
	do return self.data end
end

function jk.mysql.MySQLDatabaseGeneric.StaticResultSet:setData(v)
	self.data = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.StaticResultSet:getCurrent()
	do return self.current end
end

function jk.mysql.MySQLDatabaseGeneric.StaticResultSet:setCurrent(v)
	self.current = v
	do return self end
end

jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet = _g.jk.mysql.MySQLDatabaseGeneric.MyResultSet._create()
jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet.__index = jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet
_vm:set_metatable(jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet, {
	__index = _g.jk.mysql.MySQLDatabaseGeneric.MyResultSet
})

function jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet._create()
	local v = _vm:set_metatable({}, jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet)
	return v
end

function jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet'
	self['_isType.jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet'] = true
	self.statement = nil
	self.db = nil
	self.nextStored = nil
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet:_construct0()
	jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet._init(self)
	do _g.jk.mysql.MySQLDatabaseGeneric.MyResultSet._construct0(self) end
	return self
end

function jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet:_destruct()
	do self:close() end
end

function jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet:getNext()
	local v = self.nextStored
	if v ~= nil then
		self.nextStored = nil
		do return self.nextStored end
	end
	if not (self.db ~= nil) or not (self.statement ~= nil) then
		do return nil end
	end
	v = self.db:fetchNext(self.statement, self:getColumns())
	if not (v ~= nil) then
		do self:close() end
	end
	do return v end
end

function jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet:hasNext()
	if self.nextStored ~= nil then
		do return true end
	end
	self.nextStored = self:getNext()
	if self.nextStored ~= nil then
		do return true end
	end
	do return false end
end

function jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet:step()
	local v = self:getNext()
	do self:setRowData(v) end
	if not (v ~= nil) then
		do return false end
	end
	do return true end
end

function jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet:close()
	if self.statement ~= nil then
		do self.statement:resetStatement() end
	end
	self.statement = nil
	self.db = nil
end

function jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet:getStatement()
	do return self.statement end
end

function jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet:setStatement(v)
	self.statement = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet:getDb()
	do return self.db end
end

function jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet:setDb(v)
	self.db = v
	do return self end
end

jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse = {}
jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse.__index = jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse
_vm:set_metatable(jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse, {})

function jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse._create()
	local v = _vm:set_metatable({}, jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse)
	return v
end

function jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse'
	self['_isType.jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse'] = true
	self.status = false
	self.affectedRows = 0
	self.results = nil
end

function jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:_construct0()
	jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse._init(self)
	return self
end

function jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:forOk()
	local v = _g.jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse._construct0(_g.jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse._create())
	do v:setStatus(true) end
	do v:setAffectedRows(0) end
	do v:setResults(nil) end
	do return v end
end

function jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:forError()
	local v = _g.jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse._construct0(_g.jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse._create())
	do v:setStatus(false) end
	do v:setAffectedRows(0) end
	do v:setResults(nil) end
	do return v end
end

function jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:forAffectedRows(n)
	local v = _g.jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse._construct0(_g.jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse._create())
	do v:setStatus(true) end
	do v:setAffectedRows(n) end
	do v:setResults(nil) end
	do return v end
end

function jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:forResults(results)
	local v = _g.jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse._construct0(_g.jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse._create())
	do v:setStatus(true) end
	do v:setAffectedRows(0) end
	do v:setResults(results) end
	do return v end
end

function jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:closeResults()
	if self.results ~= nil then
		do self.results:close() end
		self.results = nil
	end
end

function jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:getStatus()
	do return self.status end
end

function jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:setStatus(v)
	self.status = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:getAffectedRows()
	do return self.affectedRows end
end

function jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:setAffectedRows(v)
	self.affectedRows = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:getResults()
	do return self.results end
end

function jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:setResults(v)
	self.results = v
	do return self end
end

function jk.mysql.MySQLDatabaseGeneric:executeSync(stmt)
	local v = self:executeStatementSync(stmt, false)
	if not (v ~= nil) then
		do return false end
	end
	do v:closeResults() end
	do return v:getStatus() end
end

function jk.mysql.MySQLDatabaseGeneric:executeUpdateDeleteSync(stmt)
	local v = self:executeStatementSync(stmt, false)
	if not (v ~= nil) then
		do return 0 end
	end
	do v:closeResults() end
	do return v:getAffectedRows() end
end

function jk.mysql.MySQLDatabaseGeneric:querySync(stmt)
	local v = self:executeStatementSync(stmt, true)
	if not (v ~= nil) then
		do return nil end
	end
	do return v:getResults() end
end

function jk.mysql.MySQLDatabaseGeneric:closeStatementSync(statement)
	if not (statement ~= nil) then
		do return end
	end
	do
		local id = statement:getId()
		do self:logDebug("Closing statement " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forLongInteger(id))) end
		do
			local close = self:createPacket()
			do close:appendByte(25) end
			do close:appendInt32(id) end
			do self:sendSync(self:finalizePacket(close, self:getNextSequence())) end
		end
	end
end

function jk.mysql.MySQLDatabaseGeneric:resetStatement(statement)
	if not (statement ~= nil) then
		do return false end
	end
	do
		local id = statement:getId()
		do self:logDebug("Resetting statement " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forLongInteger(id))) end
		do
			local close = self:createPacket()
			do close:appendByte(26) end
			do close:appendInt32(id) end
			do
				local resp = self:sendAndReceive(self:finalizePacket(close, self:getNextSequence()))
				if self:handleAsErrorPacket(resp) then
					do return false end
				end
				if self:isOkPacket(resp) then
					do self:logOkPacket(self:parseOkPacket(resp)) end
					do return true end
				end
				do self:logError("Unknown response to resetStatement") end
				do return false end
			end
		end
	end
end

function jk.mysql.MySQLDatabaseGeneric:isNullInBitmap(bitmap, index)
	if not (bitmap ~= nil) then
		do return false end
	end
	if not (index > 0) then
		do return false end
	end
	do
		local idx = index + 2
		local byte = _util:convert_to_integer(idx / 8)
		local bit = _util:convert_to_integer(idx % 8)
		if not (byte < #bitmap) then
			do return false end
		end
		do
			local n = 1
			n = _vm:bitwise_left_shift(n, bit)
			if _vm:bitwise_and(bitmap[byte + 1], n) ~= 0 then
				do return true end
			end
			do return false end
		end
	end
end

function jk.mysql.MySQLDatabaseGeneric:parseRecord(packet, columns)
	if not (packet ~= nil) then
		do self:logWarning("Null packet given to parseRecord") end
		do return nil end
	end
	do
		local walker = _g.jk.mypacket.MyPacketParser:forBuffer(packet)
		if not (walker:getInt8() == 0) then
			do self:logWarning("Record buffer has invalid header") end
			do return nil end
		end
		do
			local columnCount = _g.jk.lang.Vector:getSize(columns)
			local nullBytes = _util:convert_to_integer((columnCount + 9) / 8)
			local nullBitmap = walker:getBuffer(nullBytes)
			local v = {}
			do _g.jk.lang.Vector:setSize(v, columnCount) end
			do
				local n = 0
				if columns ~= nil then
					local n2 = 0
					local m = _g.jk.lang.Vector:getSize(columns)
					do
						n2 = 0
						while n2 < m do
							local column = columns[n2 + 1]
							if column ~= nil then
								local type = column:getType()
								local o = nil
								if self:isNullInBitmap(nullBitmap, n) then
									o = nil
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_FLOAT then
									o = _g.jk.lang.Double:asObject(walker:getFloat())
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_DOUBLE then
									o = _g.jk.lang.Double:asObject(walker:getDouble())
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_LONGLONG then
									o = _g.jk.lang.Integer:asObject(walker:getInt64())
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_INTEGER then
									o = _g.jk.lang.Integer:asObject(walker:getInt32())
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_MEDIUMINT then
									o = _g.jk.lang.Integer:asObject(walker:getInt24())
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_SMALLINT then
									o = _g.jk.lang.Integer:asObject(walker:getInt16())
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_YEAR then
									o = _g.jk.lang.Integer:asObject(walker:getInt16())
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_TINYINT then
									o = _g.jk.lang.Integer:asObject(walker:getInt8())
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_DATE then
									local length = walker:getInt8()
									if length ~= 4 then
										do self:logError("Unsupported length for date field: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(length))) end
										do return nil end
									end
									do
										local year = walker:getInt16()
										local month = walker:getInt8()
										local day = walker:getInt8()
										local dt = _g.jk.lang.DateTime._construct0(_g.jk.lang.DateTime._create())
										do dt:setYear(year) end
										do dt:setMonth(month) end
										do dt:setDayOfMonth(day) end
										o = dt
									end
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_TIMESTAMP or type == type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_DATETIME then
									local length = walker:getInt8()
									local year = walker:getInt16()
									local month = walker:getInt8()
									local days = walker:getInt8()
									local hours = walker:getInt8()
									local minutes = walker:getInt8()
									local seconds = walker:getInt8()
									local microseconds = 0
									if length == 11 then
										microseconds = walker:getInt32()
									elseif length == 7 then
									else
										do self:logError("Unsupported length for datetime field: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(length))) end
										do return nil end
									end
									do
										local dt = _g.jk.lang.DateTime._construct0(_g.jk.lang.DateTime._create())
										do dt:setYear(year) end
										do dt:setMonth(month) end
										do dt:setDayOfMonth(days) end
										do dt:setHours(hours) end
										do dt:setMinutes(minutes) end
										do dt:setSeconds(seconds) end
										o = dt
									end
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_TIME then
									local length = walker:getInt8()
									local isNegative = walker:getInt8()
									local date = walker:getInt32()
									local hours = walker:getInt8()
									local minutes = walker:getInt8()
									local seconds = walker:getInt8()
									local microseconds = 0
									if length == 8 then
									elseif length == 12 then
										microseconds = walker:getInt32()
									else
										do self:logError("Unsupported length for time field: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(length))) end
										do return nil end
									end
									do
										local dt = _g.jk.lang.DateTime._construct0(_g.jk.lang.DateTime._create())
										do dt:setHours(hours) end
										do dt:setMinutes(minutes) end
										do dt:setSeconds(seconds) end
										o = dt
									end
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_DECIMAL or type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_NEWDECIMAL then
									o = walker:getLengthEncodedString()
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_TINY_BLOB or type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_MEDIUM_BLOB or type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_LONG_BLOB or type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_BLOB then
									local cs = column:getCharacterSet()
									if cs == 63 then
										o = walker:getLengthEncodedBuffer()
									elseif cs == 255 or cs == 45 or cs == 33 then
										o = walker:getLengthEncodedString()
									elseif cs == 11 then
										o = _g.jk.lang.String:forASCIIBuffer(walker:getLengthEncodedBuffer())
									else
										do self:logWarning("Unsupported character set " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(cs)) .. " encountered. Assuming binary.") end
										o = walker:getLengthEncodedBuffer()
									end
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_GEOMETRY then
									o = walker:getLengthEncodedString()
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_STRING or type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_VARCHAR or type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_VAR_STRING then
									o = walker:getLengthEncodedString()
								elseif type == _g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_JSON then
									o = walker:getLengthEncodedString()
								else
									do self:logError("Unsupported field type " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(type)) .. " encountered in response.") end
									do return nil end
								end
								do self:logDebug("Field " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(n)) .. " or `" .. _g.jk.lang.String:safeString(column:getName()) .. "' type=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(type)) .. ", value=`" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(o)) .. "'") end
								v[n + 1] = o
								do n = n + 1 end
							end
							do n2 = n2 + 1 end
						end
					end
				end
				do return v end
			end
		end
	end
end

function jk.mysql.MySQLDatabaseGeneric:fetchNext(statement, columns)
	if not (statement ~= nil) then
		do self:logWarning("null statement given to fetchNext") end
		do return nil end
	end
	do
		local statementId = statement:getId()
		do self:logDebug("Fetching next record for statement " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forLongInteger(statementId))) end
		do
			local req = self:createPacket()
			do req:appendByte(28) end
			do req:appendInt32(statementId) end
			do req:appendInt32(1) end
			do self:sendSync(self:finalizePacket(req, self:getNextSequence())) end
			do
				local v = nil
				while true do
					local resp = self:receivePacketDataSync()
					if self:handleAsErrorPacket(resp) then
						do return nil end
					end
					if not (resp ~= nil) or self:isEofPacket(resp) then
						do break end
					end
					do
						local rr = self:parseRecord(resp, columns)
						if rr ~= nil then
							if v ~= nil then
								do self:logWarning("Multiple records received in response to a single fetch statement!") end
							end
							v = rr
						end
					end
				end
				do return v end
			end
		end
	end
end

function jk.mysql.MySQLDatabaseGeneric:executeStatementSync(stmt, withCursor)
	local ms = _vm:to_table_with_key(stmt, '_isType.jk.mysql.MySQLDatabaseGeneric.MyStatement')
	if not (ms ~= nil) then
		do self:logError("Invalid statement object given to executeStatementSync") end
		do return nil end
	end
	do
		local statementId = ms:getId()
		do self:logDebug("Executing prepared statement with id " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forLongInteger(statementId))) end
		do
			local xx = self:createPacket()
			do xx:appendByte(23) end
			do xx:appendInt32(statementId) end
			if withCursor then
				do xx:appendByte(1) end
			else
				do xx:appendByte(0) end
			end
			do xx:appendInt32(1) end
			do
				local params = ms:getParams()
				local pc = _g.jk.lang.Vector:getSize(params)
				if pc > 0 then
					local nullbytes = _util:convert_to_integer((pc + 7) / 8)
					local bb = _util:allocate_buffer(nullbytes)
					do
						local n = 0
						while n < nullbytes do
							bb[n + 1] = 0
							do n = n + 1 end
						end
					end
					do
						local n = 0
						while n < pc do
							if _g.jk.lang.Vector:get(params, n) == nil then
								local by = _util:convert_to_integer(n / 8)
								local bi = _util:convert_to_integer(n % 8)
								local x = 1
								if bi > 0 then
									do _vm:bitwise_left_shift(x, bi) end
								end
								bb[by + 1] = _vm:bitwise_or(bb[by + 1], x)
							end
							do n = n + 1 end
						end
					end
					do xx:appendBuffer(bb) end
					do xx:appendByte(1) end
					do
						local n = 0
						while n < pc do
							local param = _g.jk.lang.Vector:get(params, n)
							if (_vm:get_variable_type(param) == 'string') then
								do xx:appendByte(_g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_VARCHAR) end
								do xx:appendByte(0) end
							elseif (_vm:to_table_with_key(param, '_isType.jk.lang.IntegerObject') ~= nil) then
								do xx:appendByte(_g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_LONG) end
								do xx:appendByte(0) end
							elseif (_vm:to_table_with_key(param, '_isType.jk.lang.LongIntegerObject') ~= nil) then
								do xx:appendByte(_g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_LONGLONG) end
								do xx:appendByte(0) end
							elseif (_vm:to_table_with_key(param, '_isType.jk.lang.DoubleObject') ~= nil) then
								do xx:appendByte(_g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_DOUBLE) end
								do xx:appendByte(0) end
							elseif _util:is_buffer(param) then
								do xx:appendByte(_g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_BLOB) end
								do xx:appendByte(0) end
							else
								do self:logWarning("Unsupported parameter type encountered.") end
								do xx:appendByte(_g.jk.mysql.MySQLDatabaseGeneric.FieldType.MYSQL_TYPE_BLOB) end
								do xx:appendByte(0) end
							end
							do n = n + 1 end
						end
					end
					do
						local n = 0
						while n < pc do
							local param = _g.jk.lang.Vector:get(params, n)
							if (_vm:get_variable_type(param) == 'string') then
								do xx:appendLengthEncodedString(param) end
							elseif (_vm:to_table_with_key(param, '_isType.jk.lang.IntegerObject') ~= nil) then
								local value = param:toInteger()
								do xx:appendInt32(value) end
							elseif (_vm:to_table_with_key(param, '_isType.jk.lang.LongIntegerObject') ~= nil) then
								local value = param:toLong()
								do xx:appendInt64(value) end
							elseif (_vm:to_table_with_key(param, '_isType.jk.lang.DoubleObject') ~= nil) then
								local value = param:toDouble()
								do xx:appendDouble(value) end
							elseif _util:is_buffer(param) then
								do xx:appendLengthEncodedBuffer(param) end
							else
								do self:logWarning("Unsupported parameter type encountered.") end
								do xx:appendLengthEncodedInteger(0) end
							end
							do n = n + 1 end
						end
					end
				end
				do
					local execresp = self:sendAndReceive(self:finalizePacket(xx, self:getNextSequence()))
					local v = nil
					if self:handleAsErrorPacket(execresp) then
						v = nil
					elseif self:isOkPacket(execresp) then
						local pp = self:parseOkPacket(execresp)
						do self:logOkPacket(pp) end
						if pp ~= nil then
							v = _g.jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:forAffectedRows(pp:getAffectedRows())
						else
							v = _g.jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:forOk()
						end
					else
						local walker = _g.jk.mypacket.MyPacketParser:forBuffer(execresp)
						local numColumns = walker:getLengthEncodedInteger()
						local columns = self:receiveColumnsSync(numColumns)
						local rs = _g.jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet._construct0(_g.jk.mysql.MySQLDatabaseGeneric.SyncFetchResultSet._create())
						do rs:setDb(self) end
						do rs:setStatement(ms) end
						do rs:setColumns(columns) end
						v = _g.jk.mysql.MySQLDatabaseGeneric.ExecuteStatementSyncResponse:forResults(rs)
					end
					do return v end
				end
			end
		end
	end
end

function jk.mysql.MySQLDatabaseGeneric:close(callback)
	do self:closeSync() end
	if callback ~= nil then
		do callback() end
	end
end

function jk.mysql.MySQLDatabaseGeneric:execute(stmt, callback)
	local v = self:executeSync(stmt)
	if callback ~= nil then
		do callback(v) end
	end
end

function jk.mysql.MySQLDatabaseGeneric:executeUpdateDelete(stmt, callback)
	local v = self:executeUpdateDeleteSync(stmt)
	if callback ~= nil then
		do callback(v) end
	end
end

function jk.mysql.MySQLDatabaseGeneric:query(stmt, callback)
	local v = self:querySync(stmt)
	if callback ~= nil then
		do callback(v) end
	end
end

function jk.mysql.MySQLDatabaseGeneric:querySingleRow(stmt, callback)
	local v = self:querySingleRowSync(stmt)
	if callback ~= nil then
		do callback(v) end
	end
end

function jk.mysql.MySQLDatabaseGeneric:getAuthenticationPlugin()
	do return self.authenticationPlugin end
end

function jk.mysql.MySQLDatabaseGeneric:setAuthenticationPlugin(v)
	self.authenticationPlugin = v
	do return self end
end
