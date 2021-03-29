let JkDataTestsSHAEncoderTests = function() {
	JkTestUnitTest.call(this);
};

JkDataTestsSHAEncoderTests.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTestUnitTest.prototype);
JkDataTestsSHAEncoderTests.prototype.constructor = JkDataTestsSHAEncoderTests;
JkDataTestsSHAEncoderTests.prototype._t = {
	"JkDataTestsSHAEncoderTests" : true,
	"JkTestUnitTest" : true
};
JkDataTestsSHAEncoderTests.prototype._tobj = JkDataTestsSHAEncoderTests;

JkDataTestsSHAEncoderTests.NEW = function() {
	var v = new JkDataTestsSHAEncoderTests;
	return v.CTOR_JkDataTestsSHAEncoderTests();
};

JkDataTestsSHAEncoderTests.prototype.CTOR_JkDataTestsSHAEncoderTests = function() {
	if(JkTestUnitTest.prototype.CTOR_JkTestUnitTest.call(this) == null) {
		return null;
	}
	return this;
};

JkDataTestsSHAEncoderTests.prototype.testSHAEncoder = function() {
	var shaEncoder = JkShaSHAEncoder.create();
	if(!(shaEncoder != null)) {
		throw JkTestFailedAssertionException.instance("SHAEncoderTests.sling", "34", "2", null);
	}
	if(!(JkLangBuffer.getSize((shaEncoder.encodeAsBuffer((JkLangString.toUTF8Buffer("Hello World")), JkShaSHAEncoder.SHA1))) == 20)) {
		throw JkTestFailedAssertionException.instance("SHAEncoderTests.sling", "35", "2", null);
	}
	if(!(JkLangBuffer.getSize((shaEncoder.encodeAsBuffer((JkLangString.toUTF8Buffer("Hello World")), JkShaSHAEncoder.SHA256))) == 32)) {
		throw JkTestFailedAssertionException.instance("SHAEncoderTests.sling", "36", "2", null);
	}
	if(!(JkLangBuffer.getSize((shaEncoder.encodeAsBuffer((JkLangString.toUTF8Buffer("Hello World")), JkShaSHAEncoder.SHA384))) == 48)) {
		throw JkTestFailedAssertionException.instance("SHAEncoderTests.sling", "37", "2", null);
	}
	if(!(JkLangBuffer.getSize((shaEncoder.encodeAsBuffer((JkLangString.toUTF8Buffer("Hello World")), JkShaSHAEncoder.SHA512))) == 64)) {
		throw JkTestFailedAssertionException.instance("SHAEncoderTests.sling", "38", "2", null);
	}
	if(!(shaEncoder.encodeAsString((JkLangString.toUTF8Buffer("Hello World")), JkShaSHAEncoder.SHA1) == "0a4d55a8d778e5022fab701977c5d840bbc486d0")) {
		throw JkTestFailedAssertionException.instance("SHAEncoderTests.sling", "39", "2", null);
	}
	if(!(shaEncoder.encodeAsString((JkLangString.toUTF8Buffer("Hello World")), JkShaSHAEncoder.SHA256) == "a591a6d40bf420404a011733cfb7b190d62c65bf0bcda32b57b277d9ad9f146e")) {
		throw JkTestFailedAssertionException.instance("SHAEncoderTests.sling", "40", "2", null);
	}
	if(!(shaEncoder.encodeAsString((JkLangString.toUTF8Buffer("Hello World")), JkShaSHAEncoder.SHA384) == "99514329186b2f6ae4a1329e7ee6c610a729636335174ac6b740f9028396fcc803d0e93863a7c3d90f86beee782f4f3f")) {
		throw JkTestFailedAssertionException.instance("SHAEncoderTests.sling", "41", "2", null);
	}
	if(!(shaEncoder.encodeAsString((JkLangString.toUTF8Buffer("Hello World")), JkShaSHAEncoder.SHA512) == "2c74fd17edafd80e8447b0d46741ee243b7eb74dd2149a0ab1b9246fb30382f27e853d8585719e0e67cbda0daa8f51671064615d645ae27acb15bfb1447f459b")) {
		throw JkTestFailedAssertionException.instance("SHAEncoderTests.sling", "42", "2", null);
	}
};

JkDataTestsSHAEncoderTests.prototype.execute = function() {
	var v = true;
	JkLogLog.debug(this.ctx, "Executing test: " + ("SHAEncoderTests") + (" / ") + ("SHAEncoder functions"));
	try {
		this.testSHAEncoder();
	}
	catch(e) {
		JkLogLog.error(this.ctx, (e.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("SHAEncoderTests") + (" / ") + ("SHAEncoder functions"));
	return v;
};

JkDataTestsSHAEncoderTests.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDataTestsSHAEncoderTests"] === true;
};

let JkDataTestsCharacterDecoderTests = function() {
	JkTestUnitTest.call(this);
};

JkDataTestsCharacterDecoderTests.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTestUnitTest.prototype);
JkDataTestsCharacterDecoderTests.prototype.constructor = JkDataTestsCharacterDecoderTests;
JkDataTestsCharacterDecoderTests.prototype._t = {
	"JkTestUnitTest" : true,
	"JkDataTestsCharacterDecoderTests" : true
};
JkDataTestsCharacterDecoderTests.prototype._tobj = JkDataTestsCharacterDecoderTests;

JkDataTestsCharacterDecoderTests.NEW = function() {
	var v = new JkDataTestsCharacterDecoderTests;
	return v.CTOR_JkDataTestsCharacterDecoderTests();
};

JkDataTestsCharacterDecoderTests.prototype.CTOR_JkDataTestsCharacterDecoderTests = function() {
	if(JkTestUnitTest.prototype.CTOR_JkTestUnitTest.call(this) == null) {
		return null;
	}
	return this;
};

JkDataTestsCharacterDecoderTests.prototype.testCharacterDecoderMethods = function() {
	var dmap = JkLangDynamicMap.NEW();
	dmap.setString("data", "😀 Smile");
	var str = JkJsonJSONEncoder.encode(dmap, true, false);
	var parse = (function(o) {
		if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkJsonJSONParser.parseBuffer((JkLangString.toUTF8Buffer(str)))));
	if(!(dmap.getString("data", null) == parse.getString("data", null))) {
		throw JkTestFailedAssertionException.instance("CharacterDecoderTests.sling", "37", "2", null);
	}
};

JkDataTestsCharacterDecoderTests.prototype.execute = function() {
	var v = true;
	JkLogLog.debug(this.ctx, "Executing test: " + ("CharacterDecoderTests") + (" / ") + ("CharacterDecoder Methods"));
	try {
		this.testCharacterDecoderMethods();
	}
	catch(e) {
		JkLogLog.error(this.ctx, (e.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("CharacterDecoderTests") + (" / ") + ("CharacterDecoder Methods"));
	return v;
};

JkDataTestsCharacterDecoderTests.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDataTestsCharacterDecoderTests"] === true;
};

let JkDataTestsBase64Tests = function() {
	JkTestUnitTest.call(this);
};

JkDataTestsBase64Tests.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTestUnitTest.prototype);
JkDataTestsBase64Tests.prototype.constructor = JkDataTestsBase64Tests;
JkDataTestsBase64Tests.prototype._t = {
	"JkDataTestsBase64Tests" : true,
	"JkTestUnitTest" : true
};
JkDataTestsBase64Tests.prototype._tobj = JkDataTestsBase64Tests;

JkDataTestsBase64Tests.NEW = function() {
	var v = new JkDataTestsBase64Tests;
	return v.CTOR_JkDataTestsBase64Tests();
};

JkDataTestsBase64Tests.prototype.CTOR_JkDataTestsBase64Tests = function() {
	if(JkTestUnitTest.prototype.CTOR_JkTestUnitTest.call(this) == null) {
		return null;
	}
	return this;
};

JkDataTestsBase64Tests.prototype.testBase64Encoding = function() {
	var str = "Hello World";
	if(!(JkBase64Base64Encoder.encodeString(str) == "SGVsbG8gV29ybGQ=")) {
		throw JkTestFailedAssertionException.instance("Base64Tests.sling", "34", "2", null);
	}
};

JkDataTestsBase64Tests.prototype.testBase64Decoding = function() {
	var str = "Hello World";
	var encodedStr = JkBase64Base64Encoder.encodeString(str);
	var decodedStr = JkBase64Base64Decoder.decode(encodedStr);
	if(!(JkLangString.forUTF8Buffer(decodedStr) == "Hello World")) {
		throw JkTestFailedAssertionException.instance("Base64Tests.sling", "42", "2", null);
	}
};

JkDataTestsBase64Tests.prototype.execute = function() {
	var v = true;
	JkLogLog.debug(this.ctx, "Executing test: " + ("Base64Tests") + (" / ") + ("encode string"));
	try {
		this.testBase64Encoding();
	}
	catch(e) {
		JkLogLog.error(this.ctx, (e.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("Base64Tests") + (" / ") + ("encode string"));
	JkLogLog.debug(this.ctx, "Executing test: " + ("Base64Tests") + (" / ") + ("decode string"));
	try {
		this.testBase64Encoding();
	}
	catch(e1) {
		JkLogLog.error(this.ctx, (e1.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("Base64Tests") + (" / ") + ("decode string"));
	return v;
};

JkDataTestsBase64Tests.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDataTestsBase64Tests"] === true;
};

let JkDataTestsMD5EncoderTests = function() {
	JkTestUnitTest.call(this);
};

JkDataTestsMD5EncoderTests.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkTestUnitTest.prototype);
JkDataTestsMD5EncoderTests.prototype.constructor = JkDataTestsMD5EncoderTests;
JkDataTestsMD5EncoderTests.prototype._t = {
	"JkDataTestsMD5EncoderTests" : true,
	"JkTestUnitTest" : true
};
JkDataTestsMD5EncoderTests.prototype._tobj = JkDataTestsMD5EncoderTests;

JkDataTestsMD5EncoderTests.NEW = function() {
	var v = new JkDataTestsMD5EncoderTests;
	return v.CTOR_JkDataTestsMD5EncoderTests();
};

JkDataTestsMD5EncoderTests.prototype.CTOR_JkDataTestsMD5EncoderTests = function() {
	if(JkTestUnitTest.prototype.CTOR_JkTestUnitTest.call(this) == null) {
		return null;
	}
	return this;
};

JkDataTestsMD5EncoderTests.prototype.testMD5Encoder = function() {
	if(!(JkMd5MD5Encoder.encodeBuffer((JkLangString.toUTF8Buffer("helloWorld"))) == "1a833da63a6b7e20098dae06d06602e1")) {
		throw JkTestFailedAssertionException.instance("MD5EncoderTests.sling", "33", "2", null);
	}
};

JkDataTestsMD5EncoderTests.prototype.execute = function() {
	var v = true;
	JkLogLog.debug(this.ctx, "Executing test: " + ("MD5EncoderTests") + (" / ") + ("MD5Encoder Method"));
	try {
		this.testMD5Encoder();
	}
	catch(e) {
		JkLogLog.error(this.ctx, (e.toString()));
		v = false;
	}
	JkLogLog.debug(this.ctx, "Done executing test: " + ("MD5EncoderTests") + (" / ") + ("MD5Encoder Method"));
	return v;
};

JkDataTestsMD5EncoderTests.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDataTestsMD5EncoderTests"] === true;
};

let JkDataTestsTestMain = function() {};

JkDataTestsTestMain.prototype._t = { "JkDataTestsTestMain" : true };
JkDataTestsTestMain.prototype._tobj = JkDataTestsTestMain;

JkDataTestsTestMain.NEW = function() {
	var v = new JkDataTestsTestMain;
	return v.CTOR_JkDataTestsTestMain();
};

JkDataTestsTestMain.prototype.CTOR_JkDataTestsTestMain = function() {
	return this;
};

JkDataTestsTestMain._main = function(args) {
	var v = true;
	v = v && JkDataTestsSHAEncoderTests.NEW().execute();
	v = v && JkDataTestsMD5EncoderTests.NEW().execute();
	v = v && JkDataTestsBase64Tests.NEW().execute();
	v = v && JkDataTestsCharacterDecoderTests.NEW().execute();
	return v ? 0 : 1;
};

JkDataTestsTestMain._main();

JkDataTestsTestMain.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDataTestsTestMain"] === true;
};
