jk = jk or {}

jk.appdb = jk.appdb or {}

jk.appdb.ApplicationDatabase = {}
jk.appdb.ApplicationDatabase.__index = jk.appdb.ApplicationDatabase
_vm:set_metatable(jk.appdb.ApplicationDatabase, {})

function jk.appdb.ApplicationDatabase._create()
	local v = _vm:set_metatable({}, jk.appdb.ApplicationDatabase)
	return v
end

function jk.appdb.ApplicationDatabase:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.appdb.ApplicationDatabase'
	self['_isType.jk.appdb.ApplicationDatabase'] = true
	self._db = nil
	self._ctx = nil
	self._destructWrapper = _vm:create_destructor(function() self:_destruct() end)
end

function jk.appdb.ApplicationDatabase:_construct0()
	jk.appdb.ApplicationDatabase._init(self)
	do self:initialize(nil, _g.jk.env.EnvironmentVariable:get("DATABASE")) end
	return self
end

function jk.appdb.ApplicationDatabase:_construct1(ctx)
	jk.appdb.ApplicationDatabase._init(self)
	do self:initialize(ctx, _g.jk.env.EnvironmentVariable:get("DATABASE")) end
	return self
end

function jk.appdb.ApplicationDatabase:_construct2(ctx, connectionString)
	jk.appdb.ApplicationDatabase._init(self)
	do self:initialize(ctx, connectionString) end
	return self
end

function jk.appdb.ApplicationDatabase:_destruct()
	do self:close() end
end

function jk.appdb.ApplicationDatabase:initialize(ctx, connectionString)
	if _g.jk.lang.String:isEmpty(connectionString) then
		do _g.jk.lang.Error:throw("configurationValueMissing", "DATABASE") end
	end
	do _g.jk.log.Log:debug(ctx, "Connecting to database: `" .. _g.jk.lang.String:safeString(connectionString) .. "' .. ") end
	do
		local db = _g.jk.sql.factory.SQLDatabaseFactory:getDatabase(ctx, connectionString)
		if not (db ~= nil) then
			do _g.jk.lang.Error:throw("failedToConnectToDatabase", connectionString) end
		end
		do self:setCtx(ctx) end
		do self:setDb(db) end
	end
end

function jk.appdb.ApplicationDatabase:close()
	local db = self:getDb()
	do self:setDb(nil) end
	if db ~= nil then
		do db:closeSync() end
	end
end

function jk.appdb.ApplicationDatabase:updateTable(table)
	do _g.jk.log.Log:info(self:getCtx(), "Updating table: `" .. _g.jk.lang.String:safeString(table:getName()) .. "' ..") end
	if not self:getDb():ensureTableExistsSync(table) then
		do _g.jk.lang.Error:throw("failedToUpdateTable", table:getName()) end
	end
end

function jk.appdb.ApplicationDatabase:getTableDefinitions(tables)
end

function jk.appdb.ApplicationDatabase:updateTables()
	local tables = {}
	do self:getTableDefinitions(tables) end
	if tables ~= nil then
		local n = 0
		local m = _g.jk.lang.Vector:getSize(tables)
		do
			n = 0
			while n < m do
				local table = tables[n + 1]
				if table ~= nil then
					do self:updateTable(table) end
				end
				do n = n + 1 end
			end
		end
	end
end

function jk.appdb.ApplicationDatabase:getDb()
	do return self._db end
end

function jk.appdb.ApplicationDatabase:doSetDb(value)
	self._db = value
end

function jk.appdb.ApplicationDatabase:setDb(v)
	do self:doSetDb(v) end
	do return v end
end

function jk.appdb.ApplicationDatabase:getCtx()
	do return self._ctx end
end

function jk.appdb.ApplicationDatabase:doSetCtx(value)
	self._ctx = value
end

function jk.appdb.ApplicationDatabase:setCtx(v)
	do self:doSetCtx(v) end
	do return v end
end
