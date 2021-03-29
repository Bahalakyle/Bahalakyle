jk = jk or {}

jk.dns = jk.dns or {}

jk.dns.DNSRecord = {}
jk.dns.DNSRecord.__index = jk.dns.DNSRecord
_vm:set_metatable(jk.dns.DNSRecord, {})

function jk.dns.DNSRecord._create()
	local v = _vm:set_metatable({}, jk.dns.DNSRecord)
	return v
end

function jk.dns.DNSRecord:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.dns.DNSRecord'
	self['_isType.jk.dns.DNSRecord'] = true
	self['_isType.jk.lang.StringObject'] = true
	self.ttl = 0
	self.address = nil
end

function jk.dns.DNSRecord:_construct0()
	jk.dns.DNSRecord._init(self)
	return self
end

function jk.dns.DNSRecord:getType()
	do return "UNKNOWN" end
end

function jk.dns.DNSRecord:toString()
	do return "type=" .. _g.jk.lang.String:safeString(self:getType()) .. " ttl=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.ttl)) .. " address=`" .. _g.jk.lang.String:safeString(self.address) .. "'" end
end

function jk.dns.DNSRecord:getTtl()
	do return self.ttl end
end

function jk.dns.DNSRecord:setTtl(v)
	self.ttl = v
	do return self end
end

function jk.dns.DNSRecord:getAddress()
	do return self.address end
end

function jk.dns.DNSRecord:setAddress(v)
	self.address = v
	do return self end
end

jk.dns.DNSRecordA = _g.jk.dns.DNSRecord._create()
jk.dns.DNSRecordA.__index = jk.dns.DNSRecordA
_vm:set_metatable(jk.dns.DNSRecordA, {
	__index = _g.jk.dns.DNSRecord
})

function jk.dns.DNSRecordA._create()
	local v = _vm:set_metatable({}, jk.dns.DNSRecordA)
	return v
end

function jk.dns.DNSRecordA:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.dns.DNSRecordA'
	self['_isType.jk.dns.DNSRecordA'] = true
end

function jk.dns.DNSRecordA:_construct0()
	jk.dns.DNSRecordA._init(self)
	do _g.jk.dns.DNSRecord._construct0(self) end
	return self
end

function jk.dns.DNSRecordA:getType()
	do return "A" end
end

jk.dns.DNSCache = {}
jk.dns.DNSCache.__index = jk.dns.DNSCache
_vm:set_metatable(jk.dns.DNSCache, {})

jk.dns.DNSCache.cc = nil

function jk.dns.DNSCache._create()
	local v = _vm:set_metatable({}, jk.dns.DNSCache)
	return v
end

function jk.dns.DNSCache:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.dns.DNSCache'
	self['_isType.jk.dns.DNSCache'] = true
end

function jk.dns.DNSCache:_construct0()
	jk.dns.DNSCache._init(self)
	return self
end

jk.dns.DNSCache.DNSCacheEntry = {}
jk.dns.DNSCache.DNSCacheEntry.__index = jk.dns.DNSCache.DNSCacheEntry
_vm:set_metatable(jk.dns.DNSCache.DNSCacheEntry, {})

function jk.dns.DNSCache.DNSCacheEntry._create()
	local v = _vm:set_metatable({}, jk.dns.DNSCache.DNSCacheEntry)
	return v
end

function jk.dns.DNSCache.DNSCacheEntry:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.dns.DNSCache.DNSCacheEntry'
	self['_isType.jk.dns.DNSCache.DNSCacheEntry'] = true
	self.ip = nil
	self.timestamp = 0
end

function jk.dns.DNSCache.DNSCacheEntry:_construct0()
	jk.dns.DNSCache.DNSCacheEntry._init(self)
	return self
end

function jk.dns.DNSCache.DNSCacheEntry:create(ip)
	local v = _g.jk.dns.DNSCache.DNSCacheEntry._construct0(_g.jk.dns.DNSCache.DNSCacheEntry._create())
	do v:setIp(ip) end
	do v:setTimestamp(_g.jk.time.SystemClock:asSeconds()) end
	do return v end
end

function jk.dns.DNSCache.DNSCacheEntry:getIp()
	do return self.ip end
end

function jk.dns.DNSCache.DNSCacheEntry:setIp(v)
	self.ip = v
	do return self end
end

function jk.dns.DNSCache.DNSCacheEntry:getTimestamp()
	do return self.timestamp end
end

function jk.dns.DNSCache.DNSCacheEntry:setTimestamp(v)
	self.timestamp = v
	do return self end
end

jk.dns.DNSCache.DNSCacheImpl = {}
jk.dns.DNSCache.DNSCacheImpl.__index = jk.dns.DNSCache.DNSCacheImpl
_vm:set_metatable(jk.dns.DNSCache.DNSCacheImpl, {})

function jk.dns.DNSCache.DNSCacheImpl._create()
	local v = _vm:set_metatable({}, jk.dns.DNSCache.DNSCacheImpl)
	return v
end

function jk.dns.DNSCache.DNSCacheImpl:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.dns.DNSCache.DNSCacheImpl'
	self['_isType.jk.dns.DNSCache.DNSCacheImpl'] = true
	self.entries = nil
	self.mutex = nil
end

function jk.dns.DNSCache.DNSCacheImpl:_construct0()
	jk.dns.DNSCache.DNSCacheImpl._init(self)
	self.entries = _g.jk.lang.DynamicMap._construct0(_g.jk.lang.DynamicMap._create())
	self.mutex = _g.jk.thread.Mutex:create()
	return self
end

function jk.dns.DNSCache.DNSCacheImpl:add(hostname, ip)
	if self.mutex ~= nil then
		do self.mutex:lockMutex() end
	end
	do self.entries:setObject(hostname, _g.jk.dns.DNSCache.DNSCacheEntry:create(ip)) end
	if self.mutex ~= nil then
		do self.mutex:unlockMutex() end
	end
end

function jk.dns.DNSCache.DNSCacheImpl:getCachedEntry(hostname)
	local v = nil
	if self.mutex ~= nil then
		do self.mutex:lockMutex() end
	end
	v = _vm:to_table_with_key(self.entries:get(hostname), '_isType.jk.dns.DNSCache.DNSCacheEntry')
	if self.mutex ~= nil then
		do self.mutex:unlockMutex() end
	end
	if v ~= nil then
		if _g.jk.time.SystemClock:asSeconds() - v:getTimestamp() > 60 * 60 then
			if self.mutex ~= nil then
				do self.mutex:lockMutex() end
			end
			do self.entries:remove(hostname) end
			if self.mutex ~= nil then
				do self.mutex:unlockMutex() end
			end
			v = nil
		end
	end
	if v ~= nil then
		do return v:getIp() end
	end
	do return nil end
end

function jk.dns.DNSCache.DNSCacheImpl:resolve(hostname)
	local v = self:getCachedEntry(hostname)
	if v ~= nil then
		do return v end
	end
	do
		local dr = _g.jk.dns.DNSResolver:create()
		if not (dr ~= nil) then
			do return nil end
		end
		v = dr:getIPAddress(hostname, nil)
		if v ~= nil then
			do self:add(hostname, v) end
		end
		do return v end
	end
end

function jk.dns.DNSCache:resolve(hostname)
	if _g.jk.dns.DNSCache.cc == nil then
		_g.jk.dns.DNSCache.cc = _g.jk.dns.DNSCache.DNSCacheImpl._construct0(_g.jk.dns.DNSCache.DNSCacheImpl._create())
	end
	do return _g.jk.dns.DNSCache.cc:resolve(hostname) end
end

jk.dns.DNSRecordCNAME = _g.jk.dns.DNSRecord._create()
jk.dns.DNSRecordCNAME.__index = jk.dns.DNSRecordCNAME
_vm:set_metatable(jk.dns.DNSRecordCNAME, {
	__index = _g.jk.dns.DNSRecord
})

function jk.dns.DNSRecordCNAME._create()
	local v = _vm:set_metatable({}, jk.dns.DNSRecordCNAME)
	return v
end

function jk.dns.DNSRecordCNAME:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.dns.DNSRecordCNAME'
	self['_isType.jk.dns.DNSRecordCNAME'] = true
end

function jk.dns.DNSRecordCNAME:_construct0()
	jk.dns.DNSRecordCNAME._init(self)
	do _g.jk.dns.DNSRecord._construct0(self) end
	return self
end

function jk.dns.DNSRecordCNAME:getType()
	do return "CNAME" end
end

jk.dns.DNSRecordNS = _g.jk.dns.DNSRecord._create()
jk.dns.DNSRecordNS.__index = jk.dns.DNSRecordNS
_vm:set_metatable(jk.dns.DNSRecordNS, {
	__index = _g.jk.dns.DNSRecord
})

function jk.dns.DNSRecordNS._create()
	local v = _vm:set_metatable({}, jk.dns.DNSRecordNS)
	return v
end

function jk.dns.DNSRecordNS:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.dns.DNSRecordNS'
	self['_isType.jk.dns.DNSRecordNS'] = true
end

function jk.dns.DNSRecordNS:_construct0()
	jk.dns.DNSRecordNS._init(self)
	do _g.jk.dns.DNSRecord._construct0(self) end
	return self
end

function jk.dns.DNSRecordNS:getType()
	do return "NS" end
end

jk.dns.DNSRecordMX = _g.jk.dns.DNSRecord._create()
jk.dns.DNSRecordMX.__index = jk.dns.DNSRecordMX
_vm:set_metatable(jk.dns.DNSRecordMX, {
	__index = _g.jk.dns.DNSRecord
})

function jk.dns.DNSRecordMX._create()
	local v = _vm:set_metatable({}, jk.dns.DNSRecordMX)
	return v
end

function jk.dns.DNSRecordMX:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.dns.DNSRecordMX'
	self['_isType.jk.dns.DNSRecordMX'] = true
	self.priority = 0
end

function jk.dns.DNSRecordMX:_construct0()
	jk.dns.DNSRecordMX._init(self)
	do _g.jk.dns.DNSRecord._construct0(self) end
	return self
end

function jk.dns.DNSRecordMX:getType()
	do return "MX" end
end

function jk.dns.DNSRecordMX:toString()
	do return _g.jk.lang.String:safeString(_g.jk.dns.DNSRecord.toString(self)) .. " priority=" .. _g.jk.lang.String:safeString(_g.jk.lang.String:forInteger(self.priority)) .. " " end
end

function jk.dns.DNSRecordMX:getPriority()
	do return self.priority end
end

function jk.dns.DNSRecordMX:setPriority(v)
	self.priority = v
	do return self end
end

jk.dns.DNSResolver = {}
jk.dns.DNSResolver.__index = jk.dns.DNSResolver
_vm:set_metatable(jk.dns.DNSResolver, {})

function jk.dns.DNSResolver._create()
	local v = _vm:set_metatable({}, jk.dns.DNSResolver)
	return v
end

function jk.dns.DNSResolver:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.dns.DNSResolver'
	self['_isType.jk.dns.DNSResolver'] = true
end

function jk.dns.DNSResolver:_construct0()
	jk.dns.DNSResolver._init(self)
	return self
end

function jk.dns.DNSResolver:create()
	do return nil end
end

function jk.dns.DNSResolver:instance()
	do return _g.jk.dns.DNSResolver:create() end
end

function jk.dns.DNSResolver:getNSRecords(host, type, ctx)
end

function jk.dns.DNSResolver:getIPAddress(hostname, ctx)
end

function jk.dns.DNSResolver:getIPAddresses(hostname, ctx)
end
