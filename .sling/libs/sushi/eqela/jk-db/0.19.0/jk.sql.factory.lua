jk = jk or {}

jk.sql = jk.sql or {}

jk.sql.factory = jk.sql.factory or {}

jk.sql.factory.SQLDatabaseFactory = {}
jk.sql.factory.SQLDatabaseFactory.__index = jk.sql.factory.SQLDatabaseFactory
_vm:set_metatable(jk.sql.factory.SQLDatabaseFactory, {})

function jk.sql.factory.SQLDatabaseFactory._create()
	local v = _vm:set_metatable({}, jk.sql.factory.SQLDatabaseFactory)
	return v
end

function jk.sql.factory.SQLDatabaseFactory:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.sql.factory.SQLDatabaseFactory'
	self['_isType.jk.sql.factory.SQLDatabaseFactory'] = true
end

function jk.sql.factory.SQLDatabaseFactory:_construct0()
	jk.sql.factory.SQLDatabaseFactory._init(self)
	return self
end

function jk.sql.factory.SQLDatabaseFactory:getDatabase(ctx, connectionString)
	local dbtype = nil
	local dbstr = nil
	local comps = _g.jk.lang.String:split(connectionString, 58, 2)
	if comps ~= nil then
		dbtype = _g.jk.lang.Vector:get(comps, 0)
		dbstr = _g.jk.lang.Vector:get(comps, 1)
	end
	if not _g.jk.lang.String:isNotEmpty(dbtype) then
		do _g.jk.log.Log:error(ctx, "Invalid connection string: Failed to determine database type") end
		do return nil end
	end
	if dbtype == "mssql" then
		do return _g.jk.mssql.MSSQLDatabase:forConnectionStringSync(dbstr, ctx) end
	end
	if dbtype == "mysql" then
		do return _g.jk.mysql.MySQLDatabase:forConnectionStringSync(ctx, dbstr) end
	end
	if dbtype == "sqlite" then
		do return _g.jk.sqlite.SQLiteDatabase:forFile(_g.jk.fs.File:forPath(dbstr), true, ctx) end
	end
	do _g.jk.log.Log:error(ctx, "Unsupported database type: `" .. _g.jk.lang.String:safeString(dbtype) .. "'") end
	do return nil end
end

function jk.sql.factory.SQLDatabaseFactory:getDatabaseWithConfig(ctx, config)
	if not (config ~= nil) then
		do return nil end
	end
	do
		local type = config:getString("type", nil)
		if type == "mysql" then
			do return _g.jk.mysql.MySQLDatabase:forConfig(ctx, config) end
		end
		do _g.jk.log.Log:error(ctx, "Unsupported database type in getDatabaseWithConfig: `" .. _g.jk.lang.String:safeString(type) .. "'") end
		do return nil end
	end
end
