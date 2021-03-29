let JkDnsDNSResolver = function() {};

JkDnsDNSResolver.prototype._t = { "JkDnsDNSResolver" : true };
JkDnsDNSResolver.prototype._tobj = JkDnsDNSResolver;

JkDnsDNSResolver.NEW = function() {
	var v = new JkDnsDNSResolver;
	return v.CTOR_JkDnsDNSResolver();
};

JkDnsDNSResolver.prototype.CTOR_JkDnsDNSResolver = function() {
	return this;
};

JkDnsDNSResolver.create = function() {
	return null;
};

JkDnsDNSResolver.instance = function() {
	return JkDnsDNSResolver.create();
};

JkDnsDNSResolver.prototype.getNSRecords = function(host, type, ctx) {};

JkDnsDNSResolver.prototype.getIPAddress = function(hostname, ctx) {};

JkDnsDNSResolver.prototype.getIPAddresses = function(hostname, ctx) {};

JkDnsDNSResolver.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDnsDNSResolver"] === true;
};

let JkDnsDNSRecord = function() {
	this.ttl = 0;
	this.address = null;
};

JkDnsDNSRecord.prototype._t = {
	"JkLangStringObject" : true,
	"JkDnsDNSRecord" : true
};
JkDnsDNSRecord.prototype._tobj = JkDnsDNSRecord;

JkDnsDNSRecord.NEW = function() {
	var v = new JkDnsDNSRecord;
	return v.CTOR_JkDnsDNSRecord();
};

JkDnsDNSRecord.prototype.CTOR_JkDnsDNSRecord = function() {
	this.address = null;
	this.ttl = 0;
	return this;
};

JkDnsDNSRecord.prototype.getType = function() {
	return "UNKNOWN";
};

JkDnsDNSRecord.prototype.toString = function() {
	return "type=" + (JkLangString.safeString((this.getType()))) + (" ttl=") + (JkLangString.safeString((JkLangString.forInteger(this.ttl)))) + (" address=`") + (JkLangString.safeString(this.address)) + ("'");
};

JkDnsDNSRecord.prototype.getTtl = function() {
	return this.ttl;
};

JkDnsDNSRecord.prototype.setTtl = function(v) {
	this.ttl = v;
	return this;
};

JkDnsDNSRecord.prototype.getAddress = function() {
	return this.address;
};

JkDnsDNSRecord.prototype.setAddress = function(v) {
	this.address = v;
	return this;
};

JkDnsDNSRecord.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDnsDNSRecord"] === true;
};

let JkDnsDNSRecordNS = function() {
	JkDnsDNSRecord.call(this);
};

JkDnsDNSRecordNS.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkDnsDNSRecord.prototype);
JkDnsDNSRecordNS.prototype.constructor = JkDnsDNSRecordNS;
JkDnsDNSRecordNS.prototype._t = {
	"JkDnsDNSRecordNS" : true,
	"JkLangStringObject" : true,
	"JkDnsDNSRecord" : true
};
JkDnsDNSRecordNS.prototype._tobj = JkDnsDNSRecordNS;

JkDnsDNSRecordNS.NEW = function() {
	var v = new JkDnsDNSRecordNS;
	return v.CTOR_JkDnsDNSRecordNS();
};

JkDnsDNSRecordNS.prototype.CTOR_JkDnsDNSRecordNS = function() {
	if(JkDnsDNSRecord.prototype.CTOR_JkDnsDNSRecord.call(this) == null) {
		return null;
	}
	return this;
};

JkDnsDNSRecordNS.prototype.getType = function() {
	return "NS";
};

JkDnsDNSRecordNS.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDnsDNSRecordNS"] === true;
};

let JkDnsDNSRecordMX = function() {
	JkDnsDNSRecord.call(this);
	this.priority = 0;
};

JkDnsDNSRecordMX.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkDnsDNSRecord.prototype);
JkDnsDNSRecordMX.prototype.constructor = JkDnsDNSRecordMX;
JkDnsDNSRecordMX.prototype._t = {
	"JkDnsDNSRecordMX" : true,
	"JkLangStringObject" : true,
	"JkDnsDNSRecord" : true
};
JkDnsDNSRecordMX.prototype._tobj = JkDnsDNSRecordMX;

JkDnsDNSRecordMX.NEW = function() {
	var v = new JkDnsDNSRecordMX;
	return v.CTOR_JkDnsDNSRecordMX();
};

JkDnsDNSRecordMX.prototype.CTOR_JkDnsDNSRecordMX = function() {
	this.priority = 0;
	if(JkDnsDNSRecord.prototype.CTOR_JkDnsDNSRecord.call(this) == null) {
		return null;
	}
	return this;
};

JkDnsDNSRecordMX.prototype.getType = function() {
	return "MX";
};

JkDnsDNSRecordMX.prototype.toString = function() {
	return (JkLangString.safeString((JkDnsDNSRecord.prototype.toString.call(this)))) + (" priority=") + (JkLangString.safeString((JkLangString.forInteger(this.priority)))) + (" ");
};

JkDnsDNSRecordMX.prototype.getPriority = function() {
	return this.priority;
};

JkDnsDNSRecordMX.prototype.setPriority = function(v) {
	this.priority = v;
	return this;
};

JkDnsDNSRecordMX.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDnsDNSRecordMX"] === true;
};

let JkDnsDNSRecordA = function() {
	JkDnsDNSRecord.call(this);
};

JkDnsDNSRecordA.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkDnsDNSRecord.prototype);
JkDnsDNSRecordA.prototype.constructor = JkDnsDNSRecordA;
JkDnsDNSRecordA.prototype._t = {
	"JkLangStringObject" : true,
	"JkDnsDNSRecordA" : true,
	"JkDnsDNSRecord" : true
};
JkDnsDNSRecordA.prototype._tobj = JkDnsDNSRecordA;

JkDnsDNSRecordA.NEW = function() {
	var v = new JkDnsDNSRecordA;
	return v.CTOR_JkDnsDNSRecordA();
};

JkDnsDNSRecordA.prototype.CTOR_JkDnsDNSRecordA = function() {
	if(JkDnsDNSRecord.prototype.CTOR_JkDnsDNSRecord.call(this) == null) {
		return null;
	}
	return this;
};

JkDnsDNSRecordA.prototype.getType = function() {
	return "A";
};

JkDnsDNSRecordA.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDnsDNSRecordA"] === true;
};

let JkDnsDNSCacheDNSCacheImpl = function() {
	this.entries = null;
	this.mutex = null;
};

JkDnsDNSCacheDNSCacheImpl.prototype._t = { "JkDnsDNSCacheDNSCacheImpl" : true };
JkDnsDNSCacheDNSCacheImpl.prototype._tobj = JkDnsDNSCacheDNSCacheImpl;

JkDnsDNSCacheDNSCacheImpl.NEW = function() {
	var v = new JkDnsDNSCacheDNSCacheImpl;
	return v.CTOR_JkDnsDNSCacheDNSCacheImpl();
};

JkDnsDNSCacheDNSCacheImpl.prototype.CTOR_JkDnsDNSCacheDNSCacheImpl = function() {
	this.mutex = null;
	this.entries = null;
	this.entries = JkLangDynamicMap.NEW();
	this.mutex = JkThreadMutex.create();
	return this;
};

JkDnsDNSCacheDNSCacheImpl.prototype.add = function(hostname, ip) {
	if(this.mutex != null) {
		this.mutex.lockMutex();
	}
	this.entries.setObject(hostname, (JkDnsDNSCacheDNSCacheEntry.create(ip)));
	if(this.mutex != null) {
		this.mutex.unlockMutex();
	}
};

JkDnsDNSCacheDNSCacheImpl.prototype.getCachedEntry = function(hostname) {
	var v = null;
	if(this.mutex != null) {
		this.mutex.lockMutex();
	}
	v = (function(o) {
		if(JkDnsDNSCacheDNSCacheEntry.IS_INSTANCE && JkDnsDNSCacheDNSCacheEntry.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((this.entries.get(hostname)));
	if(this.mutex != null) {
		this.mutex.unlockMutex();
	}
	if(v != null) {
		if(JkTimeSystemClock.asSeconds() - v.getTimestamp() > 60 * 60) {
			if(this.mutex != null) {
				this.mutex.lockMutex();
			}
			this.entries.remove(hostname);
			if(this.mutex != null) {
				this.mutex.unlockMutex();
			}
			v = null;
		}
	}
	if(v != null) {
		return v.getIp();
	}
	return null;
};

JkDnsDNSCacheDNSCacheImpl.prototype.resolve = function(hostname) {
	var v = this.getCachedEntry(hostname);
	if(v != null) {
		return v;
	}
	var dr = JkDnsDNSResolver.create();
	if(!(dr != null)) {
		return null;
	}
	v = dr.getIPAddress(hostname, null);
	if(v != null) {
		this.add(hostname, v);
	}
	return v;
};

JkDnsDNSCacheDNSCacheImpl.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDnsDNSCacheDNSCacheImpl"] === true;
};

let JkDnsDNSCacheDNSCacheEntry = function() {
	this.ip = null;
	this.timestamp = 0;
};

JkDnsDNSCacheDNSCacheEntry.prototype._t = { "JkDnsDNSCacheDNSCacheEntry" : true };
JkDnsDNSCacheDNSCacheEntry.prototype._tobj = JkDnsDNSCacheDNSCacheEntry;

JkDnsDNSCacheDNSCacheEntry.NEW = function() {
	var v = new JkDnsDNSCacheDNSCacheEntry;
	return v.CTOR_JkDnsDNSCacheDNSCacheEntry();
};

JkDnsDNSCacheDNSCacheEntry.prototype.CTOR_JkDnsDNSCacheDNSCacheEntry = function() {
	this.timestamp = 0;
	this.ip = null;
	return this;
};

JkDnsDNSCacheDNSCacheEntry.create = function(ip) {
	var v = JkDnsDNSCacheDNSCacheEntry.NEW();
	v.setIp(ip);
	v.setTimestamp((JkTimeSystemClock.asSeconds()));
	return v;
};

JkDnsDNSCacheDNSCacheEntry.prototype.getIp = function() {
	return this.ip;
};

JkDnsDNSCacheDNSCacheEntry.prototype.setIp = function(v) {
	this.ip = v;
	return this;
};

JkDnsDNSCacheDNSCacheEntry.prototype.getTimestamp = function() {
	return this.timestamp;
};

JkDnsDNSCacheDNSCacheEntry.prototype.setTimestamp = function(v) {
	this.timestamp = v;
	return this;
};

JkDnsDNSCacheDNSCacheEntry.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDnsDNSCacheDNSCacheEntry"] === true;
};

let JkDnsDNSCache = function() {};

JkDnsDNSCache.prototype._t = { "JkDnsDNSCache" : true };
JkDnsDNSCache.prototype._tobj = JkDnsDNSCache;

JkDnsDNSCache.NEW = function() {
	var v = new JkDnsDNSCache;
	return v.CTOR_JkDnsDNSCache();
};

JkDnsDNSCache.prototype.CTOR_JkDnsDNSCache = function() {
	return this;
};

JkDnsDNSCache.resolve = function(hostname) {
	if(JkDnsDNSCache.cc == null) {
		JkDnsDNSCache.cc = JkDnsDNSCacheDNSCacheImpl.NEW();
	}
	return JkDnsDNSCache.cc.resolve(hostname);
};

JkDnsDNSCache.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDnsDNSCache"] === true;
};

JkDnsDNSCache.cc = null;

let JkDnsDNSRecordCNAME = function() {
	JkDnsDNSRecord.call(this);
};

JkDnsDNSRecordCNAME.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkDnsDNSRecord.prototype);
JkDnsDNSRecordCNAME.prototype.constructor = JkDnsDNSRecordCNAME;
JkDnsDNSRecordCNAME.prototype._t = {
	"JkDnsDNSRecordCNAME" : true,
	"JkLangStringObject" : true,
	"JkDnsDNSRecord" : true
};
JkDnsDNSRecordCNAME.prototype._tobj = JkDnsDNSRecordCNAME;

JkDnsDNSRecordCNAME.NEW = function() {
	var v = new JkDnsDNSRecordCNAME;
	return v.CTOR_JkDnsDNSRecordCNAME();
};

JkDnsDNSRecordCNAME.prototype.CTOR_JkDnsDNSRecordCNAME = function() {
	if(JkDnsDNSRecord.prototype.CTOR_JkDnsDNSRecord.call(this) == null) {
		return null;
	}
	return this;
};

JkDnsDNSRecordCNAME.prototype.getType = function() {
	return "CNAME";
};

JkDnsDNSRecordCNAME.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDnsDNSRecordCNAME"] === true;
};
