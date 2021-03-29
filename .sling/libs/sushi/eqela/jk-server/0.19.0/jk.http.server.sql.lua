jk = jk or {}

jk.http = jk.http or {}

jk.http.server = jk.http.server or {}

jk.http.server.sql = jk.http.server.sql or {}

jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker = _g.jk.http.server.HTTPServerResponseWorker._create()
jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker.__index = jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker
_vm:set_metatable(jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker, {
	__index = _g.jk.http.server.HTTPServerResponseWorker
})

function jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker._create()
	local v = _vm:set_metatable({}, jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker)
	return v
end

function jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker'
	self['_isType.jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker'] = true
	self.resultSet = nil
	self.recordsPerPacket = 100
	self.sb = nil
	self.totalRecords = 0
end

function jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker:_construct0()
	jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker._init(self)
	do _g.jk.http.server.HTTPServerResponseWorker._construct0(self) end
	return self
end

function jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker:forResultSet(results)
	local v = _g.jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker._construct0(_g.jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker._create())
	do v:setResultSet(results) end
	do return v end
end

function jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker:getMimeType()
	do return "application/json; charset=\"UTF-8\"" end
end

function jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker:getWorkerDescription()
	do return "HTTPServerSQLResultSetToJSONResponseWorker" end
end

function jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker:onStart()
	do _g.jk.http.server.HTTPServerResponseWorker.onStart(self) end
	do self.session:writeData(_g.jk.lang.String:toUTF8Buffer("["), -1) end
	self.sb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
	do self.resultSet:headerJSON(self.sb) end
	do self.session:writeData(_g.jk.lang.String:toUTF8Buffer(self.sb:toString()), -1) end
end

function jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker:tick()
	local v = true
	do self.sb:clear() end
	do
		local n = 0
		while n < self.recordsPerPacket do
			if not self.resultSet:nextJSON(self.sb) then
				v = false
				do break end
			end
			do self.totalRecords = self.totalRecords + 1 end
			do n = n + 1 end
		end
	end
	do
		local ss = self.sb:toString()
		if _g.jk.lang.String:getLength(ss) > 0 then
			if not self.session:writeData(_g.jk.lang.String:toUTF8Buffer(ss), -1) then
				do _g.jk.log.Log:debug(self.context, "Remote connection closed. " .. "HTTPServerSQLResultSetToJSONResponseWorker" .. " aborted.") end
				v = false
			end
		end
		do return v end
	end
end

function jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker:onEnd()
	do self.session:writeData(_g.jk.lang.String:toUTF8Buffer("]"), -1) end
	do _g.jk.log.Log:debug(self.context, "HTTPServerSQLResultSetToJSONResponseWorker" .. " ended. " .. _g.jk.lang.String:safeString(_g.jk.text.StringUtil:formatLongInteger(self.totalRecords, 44)) .. " records were sent.") end
	do _g.jk.http.server.HTTPServerResponseWorker.onEnd(self) end
end

function jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker:getResultSet()
	do return self.resultSet end
end

function jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker:setResultSet(v)
	self.resultSet = v
	do return self end
end

function jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker:getRecordsPerPacket()
	do return self.recordsPerPacket end
end

function jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker:setRecordsPerPacket(v)
	self.recordsPerPacket = v
	do return self end
end

jk.http.server.sql.HTTPServerSQLUtil = {}
jk.http.server.sql.HTTPServerSQLUtil.__index = jk.http.server.sql.HTTPServerSQLUtil
_vm:set_metatable(jk.http.server.sql.HTTPServerSQLUtil, {})

function jk.http.server.sql.HTTPServerSQLUtil._create()
	local v = _vm:set_metatable({}, jk.http.server.sql.HTTPServerSQLUtil)
	return v
end

function jk.http.server.sql.HTTPServerSQLUtil:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.http.server.sql.HTTPServerSQLUtil'
	self['_isType.jk.http.server.sql.HTTPServerSQLUtil'] = true
end

function jk.http.server.sql.HTTPServerSQLUtil:_construct0()
	jk.http.server.sql.HTTPServerSQLUtil._init(self)
	return self
end

function jk.http.server.sql.HTTPServerSQLUtil:getSQLParameterVectorFromQuery(req)
	local v = nil
	local n = 0
	while true do
		local vn = "p" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(n))
		local pv = req:getQueryParameter(vn)
		if not (pv ~= nil) then
			do break end
		end
		if not (v ~= nil) then
			v = {}
		end
		do _g.jk.lang.Vector:append(v, pv) end
		do n = n + 1 end
	end
	do return v end
end

function jk.http.server.sql.HTTPServerSQLUtil:getSQLParameterVectorFromBody(req)
	if not (req ~= nil) then
		do return nil end
	end
	do
		local vec = req:getBodyJSONVector()
		if not (vec ~= nil) then
			do return nil end
		end
		do return vec:toVector() end
	end
end

function jk.http.server.sql.HTTPServerSQLUtil:sendSQLReadResponse(req, db, sql, params)
	if not (req ~= nil and db ~= nil and sql ~= nil) then
		do return end
	end
	do
		local stmt = db:prepareSync(sql)
		if not (stmt ~= nil) then
			do req:sendJSONObject(_g.jk.http.server.HTTPServerJSONResponse:forInternalError(nil)) end
			do return end
		end
		if params ~= nil then
			if params ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(params)
				do
					n = 0
					while n < m do
						local param = params[n + 1]
						if param ~= nil then
							local ps = _g.jk.lang.String:asString(param)
							if not (ps ~= nil) then
								goto _continue1
							end
							do stmt:addParamString(ps) end
						end
						::_continue1::
						do n = n + 1 end
					end
				end
			end
		end
		do
			local rq = req
			do db:query(stmt, function(rs)
				if rs == nil then
					do rq:sendJSONObject(_g.jk.http.server.HTTPServerJSONResponse:forInternalError(nil)) end
				else
					do rq:startResponseWorker(_g.jk.http.server.sql.HTTPServerSQLResultSetToJSONResponseWorker:forResultSet(rs)) end
				end
			end) end
		end
	end
end

function jk.http.server.sql.HTTPServerSQLUtil:sendSQLOperationResponse(req, db, sql, params)
	if not (req ~= nil and db ~= nil and sql ~= nil) then
		do return end
	end
	do
		local stmt = db:prepareSync(sql)
		if not (stmt ~= nil) then
			do req:sendJSONObject(_g.jk.http.server.HTTPServerJSONResponse:forInternalError(nil)) end
			do return end
		end
		if params ~= nil then
			if params ~= nil then
				local n = 0
				local m = _g.jk.lang.Vector:getSize(params)
				do
					n = 0
					while n < m do
						local param = params[n + 1]
						if param ~= nil then
							local ps = _g.jk.lang.String:asString(param)
							if not (ps ~= nil) then
								goto _continue2
							end
							do stmt:addParamString(ps) end
						end
						::_continue2::
						do n = n + 1 end
					end
				end
			end
		end
		do
			local rq = req
			do db:execute(stmt, function(status)
				if status == false then
					do rq:sendJSONObject(_g.jk.http.server.HTTPServerJSONResponse:forInternalError(nil)) end
				else
					do rq:sendJSONObject(_g.jk.http.server.HTTPServerJSONResponse:forOk(nil)) end
				end
			end) end
		end
	end
end

function jk.http.server.sql.HTTPServerSQLUtil:addWildCards(params, index)
	if not (params ~= nil and _g.jk.lang.Vector:getSize(params) > index) then
		do return end
	end
	params[index + 1] = "%" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(params[index + 1])) .. "%"
end

function jk.http.server.sql.HTTPServerSQLUtil:addLeftWildCard(params, index)
	if not (params ~= nil and _g.jk.lang.Vector:getSize(params) > index) then
		do return end
	end
	params[index + 1] = "%" .. _g.jk.lang.String:safeString(_g.jk.lang.String:asString(params[index + 1]))
end

function jk.http.server.sql.HTTPServerSQLUtil:addRightWildCard(params, index)
	if not (params ~= nil and _g.jk.lang.Vector:getSize(params) > index) then
		do return end
	end
	params[index + 1] = _g.jk.lang.String:safeString(_g.jk.lang.String:asString(params[index + 1])) .. "%"
end
