jk = jk or {}

jk.server = jk.server or {}

jk.server.web = jk.server.web or {}

jk.server.web.db = jk.server.web.db or {}

jk.server.web.db.WebServerWithDatabase = _g.jk.server.web.WebServer._create()
jk.server.web.db.WebServerWithDatabase.__index = jk.server.web.db.WebServerWithDatabase
_vm:set_metatable(jk.server.web.db.WebServerWithDatabase, {
	__index = _g.jk.server.web.WebServer
})

function jk.server.web.db.WebServerWithDatabase._create()
	local v = _vm:set_metatable({}, jk.server.web.db.WebServerWithDatabase)
	return v
end

function jk.server.web.db.WebServerWithDatabase:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.server.web.db.WebServerWithDatabase'
	self['_isType.jk.server.web.db.WebServerWithDatabase'] = true
	self.dbstring = nil
	self.dbConfig = nil
	self.db = nil
end

function jk.server.web.db.WebServerWithDatabase:_construct0()
	jk.server.web.db.WebServerWithDatabase._init(self)
	do _g.jk.server.web.WebServer._construct0(self) end
	return self
end

function jk.server.web.db.WebServerWithDatabase:configure(key, value, relativeTo, error)
	if key == "dbConfig" then
		self.dbConfig = _vm:to_table_with_key(_g.jk.json.JSONParser:parseString(value), '_isType.jk.lang.DynamicMap')
		do return true end
	end
	if key == "db" then
		self.dbstring = value
		do return true end
	end
	do return _g.jk.server.web.WebServer.configure(self, key, value, relativeTo, error) end
end

function jk.server.web.db.WebServerWithDatabase:ensureTableExists(table)
	if not (table ~= nil) then
		do _g.jk.log.Log:error(self.ctx, "null table object") end
		do return false end
	end
	if not self.db:ensureTableExistsSync(table) then
		do _g.jk.log.Log:error(self.ctx, "Failed to create table: `" .. _g.jk.lang.String:safeString(table:getName()) .. "'") end
		do return false end
	end
	do return true end
end

function jk.server.web.db.WebServerWithDatabase:initializeServer(server)
	if not _g.jk.server.web.WebServer.initializeServer(self, server) then
		do return false end
	end
	if _g.jk.lang.String:isNotEmpty(self.dbstring) then
		if not ((function()
			self.db = self:initializeSQLDatabase1(self.dbstring)
			do return self.db end
		end)() ~= nil) then
			do _g.jk.log.Log:error(self.ctx, "Unable to connect to database: `" .. _g.jk.lang.String:safeString(self.dbstring) .. "'") end
			do return false end
		end
	elseif self.dbConfig ~= nil then
		if not ((function()
			self.db = self:initializeSQLDatabase2(self.dbConfig)
			do return self.db end
		end)() ~= nil) then
			do _g.jk.log.Log:error(self.ctx, "Unable to connect to database: `" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(self.dbConfig)) .. "'") end
			do return false end
		end
	else
		do _g.jk.log.Log:error(self.ctx, "No database configured.") end
		do return false end
	end
	do return true end
end

function jk.server.web.db.WebServerWithDatabase:initializeSQLDatabase1(dbstring)
	do return _g.jk.sql.factory.SQLDatabaseFactory:getDatabase(self.ctx, dbstring) end
end

function jk.server.web.db.WebServerWithDatabase:initializeSQLDatabase2(config)
	do return _g.jk.sql.factory.SQLDatabaseFactory:getDatabaseWithConfig(self.ctx, config) end
end

function jk.server.web.db.WebServerWithDatabase:getDb()
	do return self.db end
end

function jk.server.web.db.WebServerWithDatabase:setDb(v)
	self.db = v
	do return self end
end
