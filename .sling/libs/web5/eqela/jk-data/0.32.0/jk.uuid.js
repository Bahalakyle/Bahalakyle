let JkUuidUUIDGenerator = function() {};

JkUuidUUIDGenerator.prototype._t = { "JkUuidUUIDGenerator" : true };
JkUuidUUIDGenerator.prototype._tobj = JkUuidUUIDGenerator;

JkUuidUUIDGenerator.NEW = function() {
	var v = new JkUuidUUIDGenerator;
	return v.CTOR_JkUuidUUIDGenerator();
};

JkUuidUUIDGenerator.prototype.CTOR_JkUuidUUIDGenerator = function() {
	return this;
};

JkUuidUUIDGenerator.generate = function() {
	var random = JkRandomRandom.getSharedInstance();
	var bytes = new ArrayBuffer(16);
	for(var n = 0 ; n < 16 ; n++) {
		bytes[n] = ~(~random.nextInt2(0xff));
	}
	bytes[6] = 0x40 | bytes[6] & 0xf;
	bytes[8] = 0x80 | bytes[8] & 0x3f;
	var hex = JkLangString.forBufferHex(bytes);
	return (JkLangString.safeString((JkLangString.getSubString(hex, 0, 8)))) + ("-") + (JkLangString.safeString((JkLangString.getSubString(hex, 8, 4)))) + ("-") + (JkLangString.safeString((JkLangString.getSubString(hex, 12, 4)))) + ("-") + (JkLangString.safeString((JkLangString.getSubString(hex, 16, 4)))) + ("-") + (JkLangString.safeString((JkLangString.getSubString(hex, 20, 12))));
};

JkUuidUUIDGenerator.forString = function(value) {
	console.log("[jk.uuid.UUIDGenerator.forString] (UUIDGenerator.sling:96:3): Not implemented.");
	return null;
};

JkUuidUUIDGenerator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUuidUUIDGenerator"] === true;
};
