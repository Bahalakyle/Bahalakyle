jk = jk or {}

jk.sqlite = jk.sqlite or {}

jk.sqlite.SQLiteDatabase = _g.jk.sql.SQLDatabase._create()
jk.sqlite.SQLiteDatabase.__index = jk.sqlite.SQLiteDatabase
_vm:set_metatable(jk.sqlite.SQLiteDatabase, {
	__index = _g.jk.sql.SQLDatabase
})

function jk.sqlite.SQLiteDatabase._create()
	local v = _vm:set_metatable({}, jk.sqlite.SQLiteDatabase)
	return v
end

function jk.sqlite.SQLiteDatabase:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.sqlite.SQLiteDatabase'
	self['_isType.jk.sqlite.SQLiteDatabase'] = true
end

function jk.sqlite.SQLiteDatabase:_construct0()
	jk.sqlite.SQLiteDatabase._init(self)
	do _g.jk.sql.SQLDatabase._construct0(self) end
	return self
end

function jk.sqlite.SQLiteDatabase:instance()
	_io:write_to_stdout("[jk.sqlite.SQLiteDatabase.instance] (SQLiteDatabase.sling:54:3): Not implemented" .. "\n")
	do return nil end
end

function jk.sqlite.SQLiteDatabase:forFile(file, allowCreate, logger)
	if not (file ~= nil) then
		do return nil end
	end
	do
		local v = _g.jk.sqlite.SQLiteDatabase:instance()
		if not (v ~= nil) then
			do return nil end
		end
		if logger ~= nil then
			do v:setLogger(logger) end
		end
		if not file:isFile() then
			if allowCreate == false then
				do return nil end
			end
			do
				local pp = file:getParent()
				if pp:isDirectory() == false then
					if pp:createDirectoryRecursive() == false then
						do _g.jk.log.Log:error(_vm:to_table_with_key(v:getLogger(), '_isType.jk.log.LoggingContext'), "Failed to create directory: " .. _g.jk.lang.String:safeString(pp:getPath())) end
					end
				end
				if v:initialize(file, true) == false then
					v = nil
				end
			end
		elseif v:initialize(file, false) == false then
			v = nil
		end
		do return v end
	end
end

function jk.sqlite.SQLiteDatabase:getDatabaseTypeId()
	do return "sqlite" end
end

function jk.sqlite.SQLiteDatabase:initialize(file, create)
	do return true end
end

function jk.sqlite.SQLiteDatabase:querySingleRowSync(stmt)
	local it = self:querySync(stmt)
	if not (it ~= nil) then
		do return nil end
	end
	do
		local v = it:next()
		do return v end
	end
end

function jk.sqlite.SQLiteDatabase:tableExistsSync(table)
	if not (table ~= nil) then
		do return false end
	end
	do
		local stmt = self:prepareSync("SELECT name FROM sqlite_master WHERE type='table' AND name=?;")
		if not (stmt ~= nil) then
			do return false end
		end
		do stmt:addParamString(table) end
		do
			local sr = self:querySingleRowSync(stmt)
			if not (sr ~= nil) then
				do return false end
			end
			if not _g.jk.lang.String:equals(table, sr:getString("name", nil)) then
				do return false end
			end
			do return true end
		end
	end
end

function jk.sqlite.SQLiteDatabase:queryAllTableNames(callback)
	local v = self:queryAllTableNamesSync()
	if callback ~= nil then
		do callback(v) end
	end
end

function jk.sqlite.SQLiteDatabase:queryAllTableNamesSync()
	local stmt = self:prepareSync("SELECT name FROM sqlite_master WHERE type='table';")
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
				local o = it:next()
				if o == nil then
					do break end
				end
				do
					local name = o:getString("name", nil)
					if _g.jk.lang.String:isEmpty(name) == false then
						do _g.jk.lang.Vector:append(v, name) end
					end
				end
			end
			do return v end
		end
	end
end

function jk.sqlite.SQLiteDatabase:columnToCreateString(cc)
	local sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do sb:appendString(cc:getName()) end
	do sb:appendCharacter(32) end
	do
		local tt = cc:getType()
		if tt == _g.jk.sql.SQLTableColumnInfo.TYPE_INTEGER_KEY then
			do sb:appendString("INTEGER PRIMARY KEY AUTOINCREMENT") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_LONG_KEY then
			do sb:appendString("BIGINT PRIMARY KEY AUTOINCREMENT") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_STRING_KEY then
			do sb:appendString("TEXT PRIMARY KEY") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_INTEGER then
			do sb:appendString("INTEGER") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_LONG then
			do sb:appendString("BIGINT") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_STRING then
			do sb:appendString("VARCHAR(255)") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_TEXT then
			do sb:appendString("TEXT") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_BLOB then
			do sb:appendString("BLOB") end
		elseif tt == _g.jk.sql.SQLTableColumnInfo.TYPE_DOUBLE then
			do sb:appendString("REAL") end
		else
			do _g.jk.log.Log:error(self:getLogger(), "Unknown column type: " .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(tt))) end
			do sb:appendString("UNKNOWN") end
		end
		do return sb:toString() end
	end
end

function jk.sqlite.SQLiteDatabase:prepareCreateTableStatementSync(table, columns)
	if not (table ~= nil) then
		do return nil end
	end
	if not (columns ~= nil) then
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
							if first == false then
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

function jk.sqlite.SQLiteDatabase:prepareDeleteTableStatementSync(table)
	if not (table ~= nil) then
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

function jk.sqlite.SQLiteDatabase:getLastInsertIdSync(table)
	local v = self:querySingleRowSync(self:prepareSync("SELECT ROWID AS id FROM " .. _g.jk.lang.String:safeString(table) .. " ORDER BY ROWID DESC LIMIT 1;"))
	if not (v ~= nil) then
		do return 0 end
	end
	do return v:getLongInteger("id", 0) end
end

function jk.sqlite.SQLiteDatabase:getIdentityColumnNameSync(table)
	_io:write_to_stdout("--- stub --- jk.sqlite.SQLiteDatabase :: getIdentityColumnNameSync" .. "\n")
	do return nil end
end

function jk.sqlite.SQLiteDatabase:getPrimaryKeyColumnNameSync(table)
	_io:write_to_stdout("--- stub --- jk.sqlite.SQLiteDatabase :: getPrimaryKeyColumnNameSync" .. "\n")
	do return nil end
end

function jk.sqlite.SQLiteDatabase:columnExistsSync(table, name)
	_io:write_to_stdout("--- stub --- jk.sqlite.SQLiteDatabase :: columnExistsSync" .. "\n")
	do return false end
end

function jk.sqlite.SQLiteDatabase:isColumnTypeSameSync(table, column)
	_io:write_to_stdout("--- stub --- jk.sqlite.SQLiteDatabase :: isColumnTypeSameSync" .. "\n")
	do return false end
end

function jk.sqlite.SQLiteDatabase:prepareCreateColumnStatementSync(table, column)
	_io:write_to_stdout("--- stub --- jk.sqlite.SQLiteDatabase :: prepareCreateColumnStatementSync" .. "\n")
	do return nil end
end

function jk.sqlite.SQLiteDatabase:prepareUpdateColumnTypeStatementSync(table, column)
	_io:write_to_stdout("--- stub --- jk.sqlite.SQLiteDatabase :: prepareUpdateColumnTypeStatementSync" .. "\n")
	do return nil end
end
