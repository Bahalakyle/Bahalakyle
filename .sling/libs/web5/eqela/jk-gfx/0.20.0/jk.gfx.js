let JkGfxLength = function() {
	this.value = 0.0;
	this.unit = 0;
	this.ppi = 96.0;
};

JkGfxLength.prototype._t = {
	"JkGfxLength" : true,
	"JkLangStringObject" : true
};
JkGfxLength.prototype._tobj = JkGfxLength;

JkGfxLength.NEW = function() {
	var v = new JkGfxLength;
	return v.CTOR_JkGfxLength();
};

JkGfxLength.prototype.CTOR_JkGfxLength = function() {
	this.ppi = 96.0;
	this.unit = 0;
	this.value = 0.0;
	return this;
};

JkGfxLength.asPoints = function(value, ppi) {
	return JkGfxLength.forString(value, 0.0).toPoints(ppi);
};

JkGfxLength.asPointsWithPpi = function(value, ppi) {
	return JkGfxLength.forString(value, 0.0).getValueAsPointsWithPpi(ppi);
};

JkGfxLength.unitToString = function(unit) {
	if(unit == JkGfxLength.UNIT_POINT) {
		return "pt";
	}
	if(unit == JkGfxLength.UNIT_MILLIMETER) {
		return "mm";
	}
	if(unit == JkGfxLength.UNIT_MICROMETER) {
		return "um";
	}
	if(unit == JkGfxLength.UNIT_NANOMETER) {
		return "nm";
	}
	if(unit == JkGfxLength.UNIT_INCH) {
		return "in";
	}
	return null;
};

JkGfxLength.asStringWithUnit = function(_length, unit) {
	var v = 0.0;
	if(!(_length != null)) {
		v = 0.0;
	}
	else {
		v = _length.getValueAsUnit(unit);
	}
	return (JkLangString.safeString((JkLangString.forDouble(v)))) + (JkLangString.safeString((JkGfxLength.unitToString(unit))));
};

JkGfxLength.asString = function(_length) {
	if(!(_length != null)) {
		return "0px";
	}
	return JkGfxLength.asStringWithUnit(_length, (_length.getUnit()));
};

JkGfxLength.forString = function(value, ppi) {
	var v = JkGfxLength.NEW();
	v.parse(value);
	if(ppi > 0.0) {
		v.setPpi(ppi);
	}
	return v;
};

JkGfxLength.forPoints = function(value, ppi) {
	var v = JkGfxLength.NEW();
	v.setValue(value);
	v.setUnit(JkGfxLength.UNIT_POINT);
	if(ppi > 0.0) {
		v.setPpi(ppi);
	}
	return v;
};

JkGfxLength.forMilliMeters = function(value, ppi) {
	var v = JkGfxLength.NEW();
	v.setValue(value);
	v.setUnit(JkGfxLength.UNIT_MILLIMETER);
	if(ppi > 0.0) {
		v.setPpi(ppi);
	}
	return v;
};

JkGfxLength.forMicroMeters = function(value, ppi) {
	var v = JkGfxLength.NEW();
	v.setValue(value);
	v.setUnit(JkGfxLength.UNIT_MICROMETER);
	if(ppi > 0.0) {
		v.setPpi(ppi);
	}
	return v;
};

JkGfxLength.forNanoMeters = function(value, ppi) {
	var v = JkGfxLength.NEW();
	v.setValue(value);
	v.setUnit(JkGfxLength.UNIT_NANOMETER);
	if(ppi > 0.0) {
		v.setPpi(ppi);
	}
	return v;
};

JkGfxLength.forInches = function(value, ppi) {
	var v = JkGfxLength.NEW();
	v.setValue(value);
	v.setUnit(JkGfxLength.UNIT_INCH);
	if(ppi > 0.0) {
		v.setPpi(ppi);
	}
	return v;
};

JkGfxLength.forValue = function(value, unit, ppi) {
	var v = JkGfxLength.NEW();
	v.setValue(value);
	v.setUnit(unit);
	if(ppi > 0.0) {
		v.setPpi(ppi);
	}
	return v;
};

JkGfxLength.forStringAsPoints = function(value, ppi) {
	var v = JkGfxLength.NEW();
	v.parse(value);
	v.setValue((v.toPoints(ppi)));
	v.setUnit(JkGfxLength.UNIT_POINT);
	v.setPpi(ppi);
	return v;
};

JkGfxLength.prototype.parse = function(value) {
	if(value == null) {
		this.value = 0;
		this.unit = JkGfxLength.UNIT_POINT;
		return;
	}
	var i = 0;
	var n = 0;
	var it = JkLangString.iterate(value);
	while(true){
		var c = it.getNextChar();
		if(c < 1) {
			break;
		}
		else if(c >= '0'.charCodeAt() && c <= '9'.charCodeAt()) {
			i *= 10;
			i += c - ~(~'0'.charCodeAt());
		}
		else {
			break;
		}
		n++;
	}
	this.value = i;
	var suffix = JkLangString.getEndOfString(value, n);
	if(JkLangString.isEmpty(suffix)) {
		this.unit = JkGfxLength.UNIT_POINT;
	}
	else if(suffix == "pt" || suffix == "px") {
		this.unit = JkGfxLength.UNIT_POINT;
	}
	else if(suffix == "mm") {
		this.unit = JkGfxLength.UNIT_MILLIMETER;
	}
	else if(suffix == "um") {
		this.unit = JkGfxLength.UNIT_MICROMETER;
	}
	else if(suffix == "nm") {
		this.unit = JkGfxLength.UNIT_NANOMETER;
	}
	else if(suffix == "in") {
		this.unit = JkGfxLength.UNIT_INCH;
	}
	else {
		this.unit = JkGfxLength.UNIT_POINT;
	}
};

JkGfxLength.prototype.toPoints = function(customPpi) {
	return ~(~this.getValueAsPointsWithPpi(customPpi));
};

JkGfxLength.prototype.getValueAsPointsWithPpi = function(customPpi) {
	if(this.unit == JkGfxLength.UNIT_POINT) {
		if(this.ppi == customPpi) {
			return this.value;
		}
		if(this.ppi == 0.0) {
			return 0.0;
		}
		return customPpi * this.value / this.ppi;
	}
	if(this.unit == JkGfxLength.UNIT_MILLIMETER) {
		var v = this.value * customPpi / 25;
		if(this.value > 0 && v < 1) {
			v = 1.0;
		}
		return v;
	}
	if(this.unit == JkGfxLength.UNIT_MICROMETER) {
		var v1 = this.value * customPpi / 25000;
		if(this.value > 0 && v1 < 1) {
			v1 = 1.0;
		}
		return v1;
	}
	if(this.unit == JkGfxLength.UNIT_NANOMETER) {
		var v2 = this.value * customPpi / 25000000;
		if(this.value > 0 && v2 < 1) {
			v2 = 1.0;
		}
		return v2;
	}
	if(this.unit == JkGfxLength.UNIT_INCH) {
		var v3 = this.value * customPpi;
		if(this.value > 0 && v3 < 1) {
			v3 = 1.0;
		}
		return v3;
	}
	return 0.0;
};

JkGfxLength.prototype.getValueAsPoints = function() {
	return this.getValueAsPointsWithPpi(this.ppi);
};

JkGfxLength.prototype.getValueAsMilliMeters = function() {
	if(!(this.ppi != 0.0)) {
		return 0.0;
	}
	return 25 * this.getValueAsPoints() / this.ppi;
};

JkGfxLength.prototype.getValueAsMicroMeters = function() {
	if(!(this.ppi != 0.0)) {
		return 0.0;
	}
	return 25000 * this.getValueAsPoints() / this.ppi;
};

JkGfxLength.prototype.getValueAsNanoMeters = function() {
	if(!(this.ppi != 0.0)) {
		return 0.0;
	}
	return 25000000 * this.getValueAsPoints() / this.ppi;
};

JkGfxLength.prototype.getValueAsInches = function() {
	if(!(this.ppi != 0.0)) {
		return 0.0;
	}
	return this.getValueAsPoints() / this.ppi;
};

JkGfxLength.prototype.getValueAsUnit = function(unit) {
	if(unit == JkGfxLength.UNIT_POINT) {
		return this.getValueAsPoints();
	}
	if(unit == JkGfxLength.UNIT_MILLIMETER) {
		return this.getValueAsMilliMeters();
	}
	if(unit == JkGfxLength.UNIT_MICROMETER) {
		return this.getValueAsMicroMeters();
	}
	if(unit == JkGfxLength.UNIT_NANOMETER) {
		return this.getValueAsNanoMeters();
	}
	if(unit == JkGfxLength.UNIT_INCH) {
		return this.getValueAsInches();
	}
	return this.value;
};

JkGfxLength.prototype.toString = function() {
	return JkGfxLength.asString(this);
};

JkGfxLength.prototype.getValue = function() {
	return this.value;
};

JkGfxLength.prototype.setValue = function(v) {
	this.value = v;
	return this;
};

JkGfxLength.prototype.getUnit = function() {
	return this.unit;
};

JkGfxLength.prototype.setUnit = function(v) {
	this.unit = v;
	return this;
};

JkGfxLength.prototype.getPpi = function() {
	return this.ppi;
};

JkGfxLength.prototype.setPpi = function(v) {
	this.ppi = v;
	return this;
};

JkGfxLength.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGfxLength"] === true;
};

JkGfxLength.UNIT_POINT = 0;
JkGfxLength.UNIT_MILLIMETER = 1;
JkGfxLength.UNIT_MICROMETER = 2;
JkGfxLength.UNIT_NANOMETER = 3;
JkGfxLength.UNIT_INCH = 4;

let JkGfxSize = function() {
	this.width = 0.0;
	this.height = 0.0;
};

JkGfxSize.prototype._t = { "JkGfxSize" : true };
JkGfxSize.prototype._tobj = JkGfxSize;

JkGfxSize.NEW = function() {
	var v = new JkGfxSize;
	return v.CTOR_JkGfxSize();
};

JkGfxSize.prototype.CTOR_JkGfxSize = function() {
	this.height = 0.0;
	this.width = 0.0;
	return this;
};

JkGfxSize.prototype.getWidth = function() {
	return this.width;
};

JkGfxSize.prototype.setWidth = function(v) {
	this.width = v;
	return this;
};

JkGfxSize.prototype.getHeight = function() {
	return this.height;
};

JkGfxSize.prototype.setHeight = function(v) {
	this.height = v;
	return this;
};

JkGfxSize.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGfxSize"] === true;
};

let JkGfxImage = function() {};

JkGfxImage.prototype._t = { "JkGfxImage" : true };
JkGfxImage.prototype._tobj = JkGfxImage;

JkGfxImage.NEW = function() {
	var v = new JkGfxImage;
	return v.CTOR_JkGfxImage();
};

JkGfxImage.prototype.CTOR_JkGfxImage = function() {
	return this;
};

JkGfxImage.prototype.getPixelWidth = function() {};

JkGfxImage.prototype.getPixelHeight = function() {};

JkGfxImage.prototype.scaleToSizeSync = function(w, h) {};

JkGfxImage.prototype.scaleToSize = function(w, h, callback) {};

JkGfxImage.prototype.scaleToWidthSync = function(w) {};

JkGfxImage.prototype.scaleToWidth = function(w, callback) {};

JkGfxImage.prototype.scaleToHeightSync = function(h) {};

JkGfxImage.prototype.scaleToHeight = function(h, callback) {};

JkGfxImage.prototype.cropSync = function(x, y, w, h) {};

JkGfxImage.prototype.crop = function(x, y, w, h, callback) {};

JkGfxImage.prototype.toJPGData = function() {};

JkGfxImage.prototype.toPNGData = function() {};

JkGfxImage.prototype.toRGBAData = function() {};

JkGfxImage.prototype.releaseImage = function() {};

JkGfxImage.prototype.getProportionalWidth = function(h) {
	var width = h / this.getPixelHeight() * ~(~this.getPixelWidth());
	return ~(~width);
};

JkGfxImage.prototype.getProportionalHeight = function(w) {
	var height = w / this.getPixelWidth() * ~(~this.getPixelHeight());
	return ~(~height);
};

JkGfxImage.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGfxImage"] === true;
};

let JkGfxPosition = function() {
	this.x = 0.0;
	this.y = 0.0;
};

JkGfxPosition.prototype._t = { "JkGfxPosition" : true };
JkGfxPosition.prototype._tobj = JkGfxPosition;

JkGfxPosition.NEW = function() {
	var v = new JkGfxPosition;
	return v.CTOR_JkGfxPosition();
};

JkGfxPosition.prototype.CTOR_JkGfxPosition = function() {
	this.y = 0.0;
	this.x = 0.0;
	return this;
};

JkGfxPosition.prototype.getX = function() {
	return this.x;
};

JkGfxPosition.prototype.setX = function(v) {
	this.x = v;
	return this;
};

JkGfxPosition.prototype.getY = function() {
	return this.y;
};

JkGfxPosition.prototype.setY = function(v) {
	this.y = v;
	return this;
};

JkGfxPosition.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGfxPosition"] === true;
};

let JkGfxFontDescription = function() {
	this.file = null;
	this.name = null;
	this.bold = false;
	this.italic = false;
	this.underline = false;
	this.size = null;
};

JkGfxFontDescription.prototype._t = {
	"JkGfxFontDescription" : true,
	"JkLangStringObject" : true
};
JkGfxFontDescription.prototype._tobj = JkGfxFontDescription;

JkGfxFontDescription.NEW = function() {
	var v = new JkGfxFontDescription;
	return v.CTOR_JkGfxFontDescription();
};

JkGfxFontDescription.prototype.CTOR_JkGfxFontDescription = function() {
	this.size = null;
	this.underline = false;
	this.italic = false;
	this.bold = false;
	this.name = null;
	this.file = null;
	this.file = null;
	this.name = "Sans";
	this.size = JkGfxLength.forMicroMeters(2500, 0.0);
	this.bold = false;
	this.italic = false;
	this.underline = false;
	return this;
};

JkGfxFontDescription.forDefault = function() {
	return JkGfxFontDescription.NEW();
};

JkGfxFontDescription.forFile = function(file, size) {
	var v = JkGfxFontDescription.NEW();
	v.setFile(file);
	if(size != null) {
		v.setSize(size);
	}
	return v;
};

JkGfxFontDescription.forName = function(name, size) {
	var v = JkGfxFontDescription.NEW();
	v.setName(name);
	if(size != null) {
		v.setSize(size);
	}
	return v;
};

JkGfxFontDescription.prototype.dup = function() {
	var v = JkGfxFontDescription.NEW();
	v.file = this.file;
	v.name = this.name;
	v.bold = this.bold;
	v.italic = this.italic;
	v.underline = this.underline;
	v.size = this.size;
	return v;
};

JkGfxFontDescription.prototype.toString = function() {
	var v = JkLangDynamicMap.NEW();
	v.setObject("file", this.file);
	v.setString("name", this.name);
	v.setBoolean("bold", this.bold);
	v.setBoolean("italic", this.italic);
	v.setBoolean("underline", this.underline);
	v.setObject("size", this.size);
	return JkJsonJSONEncoder.encode(v, true, false);
};

JkGfxFontDescription.prototype.getFile = function() {
	return this.file;
};

JkGfxFontDescription.prototype.setFile = function(v) {
	this.file = v;
	return this;
};

JkGfxFontDescription.prototype.getName = function() {
	return this.name;
};

JkGfxFontDescription.prototype.setName = function(v) {
	this.name = v;
	return this;
};

JkGfxFontDescription.prototype.getBold = function() {
	return this.bold;
};

JkGfxFontDescription.prototype.setBold = function(v) {
	this.bold = v;
	return this;
};

JkGfxFontDescription.prototype.getItalic = function() {
	return this.italic;
};

JkGfxFontDescription.prototype.setItalic = function(v) {
	this.italic = v;
	return this;
};

JkGfxFontDescription.prototype.getUnderline = function() {
	return this.underline;
};

JkGfxFontDescription.prototype.setUnderline = function(v) {
	this.underline = v;
	return this;
};

JkGfxFontDescription.prototype.getSize = function() {
	return this.size;
};

JkGfxFontDescription.prototype.setSize = function(v) {
	this.size = v;
	return this;
};

JkGfxFontDescription.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGfxFontDescription"] === true;
};

let JkGfxColor = function() {
	this.red = 0.0;
	this.green = 0.0;
	this.blue = 0.0;
	this.alpha = 0.0;
};

JkGfxColor.prototype._t = { "JkGfxColor" : true };
JkGfxColor.prototype._tobj = JkGfxColor;

JkGfxColor.NEW_String = function(str) {
	var v = new JkGfxColor;
	return v.CTOR_JkGfxColor_String(str);
};

JkGfxColor.prototype.CTOR_JkGfxColor_String = function(str) {
	this.alpha = 0.0;
	this.blue = 0.0;
	this.green = 0.0;
	this.red = 0.0;
	this.parse(str);
	return this;
};

JkGfxColor.NEW = function() {
	var v = new JkGfxColor;
	return v.CTOR_JkGfxColor();
};

JkGfxColor.prototype.CTOR_JkGfxColor = function() {
	this.alpha = 0.0;
	this.blue = 0.0;
	this.green = 0.0;
	this.red = 0.0;
	return this;
};

JkGfxColor.black = function() {
	if(!(JkGfxColor.colorBlack != null)) {
		JkGfxColor.colorBlack = JkGfxColor.instance("black");
	}
	return JkGfxColor.colorBlack;
};

JkGfxColor.white = function() {
	if(!(JkGfxColor.colorWhite != null)) {
		JkGfxColor.colorWhite = JkGfxColor.instance("white");
	}
	return JkGfxColor.colorWhite;
};

JkGfxColor.asColor = function(o) {
	if(!(o != null)) {
		return null;
	}
	if(JkGfxColor.IS_INSTANCE && JkGfxColor.IS_INSTANCE(o)) {
		return o;
	}
	if(typeof(o) === 'string') {
		return JkGfxColor.instance(o);
	}
	return null;
};

JkGfxColor.instance = function(str) {
	if(str == "none") {
		return null;
	}
	var v = JkGfxColor.NEW();
	if(str != null) {
		if(v.parse(str) == false) {
			v = null;
		}
	}
	return v;
};

JkGfxColor.forString = function(str) {
	if(str == "none") {
		return null;
	}
	var v = JkGfxColor.NEW();
	if(str != null) {
		if(v.parse(str) == false) {
			v = null;
		}
	}
	return v;
};

JkGfxColor.forRGBDouble = function(r, g, b) {
	var v = JkGfxColor.NEW();
	v.setRed(r);
	v.setGreen(g);
	v.setBlue(b);
	v.setAlpha(1.0);
	return v;
};

JkGfxColor.forRGBADouble = function(r, g, b, a) {
	var v = JkGfxColor.NEW();
	v.setRed(r);
	v.setGreen(g);
	v.setBlue(b);
	v.setAlpha(a);
	return v;
};

JkGfxColor.forRGB = function(r, g, b) {
	var v = JkGfxColor.NEW();
	v.setRed((r / 255.0));
	v.setGreen((g / 255.0));
	v.setBlue((b / 255.0));
	v.setAlpha(1.0);
	return v;
};

JkGfxColor.forRGBA = function(r, g, b, a) {
	var v = JkGfxColor.NEW();
	v.setRed((r / 255.0));
	v.setGreen((g / 255.0));
	v.setBlue((b / 255.0));
	v.setAlpha((a / 255.0));
	return v;
};

JkGfxColor.forRGBAInteger = function(value) {
	var v = JkGfxColor.NEW();
	v.setRed(((value >> 24 & 0xff) / 255.0));
	v.setGreen(((value >> 16 & 0xff) / 255.0));
	v.setBlue(((value >> 8 & 0xff) / 255.0));
	v.setAlpha(((value & 0xff) / 255.0));
	return v;
};

JkGfxColor.forARGBInteger = function(value) {
	var v = JkGfxColor.NEW();
	v.setAlpha(((value >> 24 & 0xff) / 255.0));
	v.setRed(((value >> 16 & 0xff) / 255.0));
	v.setGreen(((value >> 8 & 0xff) / 255.0));
	v.setBlue(((value & 0xff) / 255.0));
	return v;
};

JkGfxColor.forRGBInteger = function(value) {
	var v = JkGfxColor.NEW();
	v.setRed(((value >> 16 & 0xff) / 255.0));
	v.setGreen(((value >> 8 & 0xff) / 255.0));
	v.setBlue(((value & 0xff) / 255.0));
	v.setAlpha(1.0);
	return v;
};

JkGfxColor.prototype.getRedInt = function() {
	var v = ~(~(this.red * 255));
	return v;
};

JkGfxColor.prototype.getGreenInt = function() {
	var v = ~(~(this.green * 255));
	return v;
};

JkGfxColor.prototype.getBlueInt = function() {
	var v = ~(~(this.blue * 255));
	return v;
};

JkGfxColor.prototype.getAlphaInt = function() {
	var v = ~(~(this.alpha * 255));
	return v;
};

JkGfxColor.prototype.isWhite = function() {
	if(this.red + this.green + this.blue >= 3.0) {
		return true;
	}
	return false;
};

JkGfxColor.prototype.isBlack = function() {
	if(this.red + this.green + this.blue <= 0) {
		return true;
	}
	return false;
};

JkGfxColor.prototype.isLightColor = function() {
	if(this.red + this.green + this.blue >= 1.5) {
		return true;
	}
	return false;
};

JkGfxColor.prototype.isDarkColor = function() {
	return !this.isLightColor();
};

JkGfxColor.prototype.hexCharToInt = function(c) {
	if(c >= '0'.charCodeAt() && c <= '9'.charCodeAt()) {
		var v = ~(~c) - ~(~'0'.charCodeAt());
		return v;
	}
	if(c >= 'a'.charCodeAt() && c <= 'f'.charCodeAt()) {
		return 10 + c - 'a'.charCodeAt();
	}
	if(c >= 'A'.charCodeAt() && c <= 'F'.charCodeAt()) {
		return 10 + c - 'A'.charCodeAt();
	}
	return 0;
};

JkGfxColor.prototype.hexDigitToInt = function(hx) {
	if(JkLangString.isEmpty(hx)) {
		return 0;
	}
	var c0 = this.hexCharToInt((JkLangString.getChar(hx, 0)));
	if(JkLangString.getLength(hx) < 2) {
		return c0;
	}
	return c0 * 16 + this.hexCharToInt((JkLangString.getChar(hx, 1)));
};

JkGfxColor.prototype.parse = function(s) {
	if(s == null) {
		this.red = 0.0;
		this.green = 0.0;
		this.blue = 0.0;
		this.alpha = 1.0;
		return true;
	}
	var v = true;
	this.alpha = 1.0;
	if(JkLangString.getChar(s, 0) == '#'.charCodeAt()) {
		var slength = JkLangString.getLength(s);
		if(slength == 7 || slength == 9) {
			this.red = this.hexDigitToInt((JkLangString.getSubString(s, 1, 2))) / 255.0;
			this.green = this.hexDigitToInt((JkLangString.getSubString(s, 3, 2))) / 255.0;
			this.blue = this.hexDigitToInt((JkLangString.getSubString(s, 5, 2))) / 255.0;
			if(slength == 9) {
				this.alpha = this.hexDigitToInt((JkLangString.getSubString(s, 7, 2))) / 255.0;
			}
			v = true;
		}
		else {
			this.red = 0.0;
			this.blue = 0.0;
			this.green = 0.0;
			v = false;
		}
	}
	else if(s == "black") {
		this.red = 0.0;
		this.green = 0.0;
		this.blue = 0.0;
	}
	else if(s == "white") {
		this.red = 1.0;
		this.green = 1.0;
		this.blue = 1.0;
	}
	else if(s == "red") {
		this.red = 1.0;
		this.green = 0.0;
		this.blue = 0.0;
	}
	else if(s == "green") {
		this.red = 0.0;
		this.green = 1.0;
		this.blue = 0.0;
	}
	else if(s == "blue") {
		this.red = 0.0;
		this.green = 0.0;
		this.blue = 1.0;
	}
	else if(s == "lightred") {
		this.red = 0.6;
		this.green = 0.4;
		this.blue = 0.4;
	}
	else if(s == "lightgreen") {
		this.red = 0.4;
		this.green = 0.6;
		this.blue = 0.4;
	}
	else if(s == "lightblue") {
		this.red = 0.4;
		this.green = 0.4;
		this.blue = 0.6;
	}
	else if(s == "yellow") {
		this.red = 1.0;
		this.green = 1.0;
		this.blue = 0.0;
	}
	else if(s == "cyan") {
		this.red = 0.0;
		this.green = 1.0;
		this.blue = 1.0;
	}
	else if(s == "orange") {
		this.red = 1.0;
		this.green = 0.5;
		this.blue = 0.0;
	}
	else {
		v = false;
	}
	return v;
};

JkGfxColor.prototype.decimalStringToInteger = function(str) {
	if(JkLangString.isEmpty(str)) {
		return 0;
	}
	var v = 0;
	var m = JkLangString.getLength(str);
	var n = 0;
	for(n = 0 ; n < m ; n++) {
		var c = JkLangString.getChar(str, n);
		if(c >= '0'.charCodeAt() && c <= '9'.charCodeAt()) {
			v = v * 10;
			v += c - ~(~'0'.charCodeAt());
		}
		else {
			break;
		}
	}
	return v;
};

JkGfxColor.prototype.dup = function(arg) {
	var f = 1.0;
	if(arg != null) {
		if(arg == "light") {
			f = 1.2;
		}
		else if(arg == "dark") {
			f = 0.8;
		}
		else if(JkLangString.endsWith(arg, "%")) {
			f = this.decimalStringToInteger(arg) / 100.0;
		}
	}
	var v = JkGfxColor.NEW();
	if(f > 1.0) {
		v.setRed((this.red + (1.0 - this.red) * (f - 1.0)));
		v.setGreen((this.green + (1.0 - this.green) * (f - 1.0)));
		v.setBlue((this.blue + (1.0 - this.blue) * (f - 1.0)));
	}
	else if(f < 1.0) {
		v.setRed((this.red * f));
		v.setGreen((this.green * f));
		v.setBlue((this.blue * f));
	}
	else {
		v.setRed(this.red);
		v.setGreen(this.green);
		v.setBlue(this.blue);
	}
	v.setAlpha(this.alpha);
	return v;
};

JkGfxColor.prototype.toRGBAInt32 = function() {
	var v = 0;
	v |= ~(~(~(~(this.red * 255)) & 0xff)) << 24;
	v |= ~(~(~(~(this.green * 255)) & 0xff)) << 16;
	v |= ~(~(~(~(this.blue * 255)) & 0xff)) << 8;
	v |= ~(~(~(~(this.alpha * 255)) & 0xff));
	return v;
};

JkGfxColor.prototype.toARGBInt32 = function() {
	var v = 0;
	v |= ~(~(~(~(this.alpha * 255)) & 0xff)) << 24;
	v |= ~(~(~(~(this.red * 255)) & 0xff)) << 16;
	v |= ~(~(~(~(this.green * 255)) & 0xff)) << 8;
	v |= ~(~(~(~(this.blue * 255)) & 0xff));
	return v;
};

JkGfxColor.prototype.toString = function() {
	return this.toRgbaString();
};

JkGfxColor.prototype.toRgbString = function() {
	var r = JkLangString.forIntegerHex((~(~(this.red * 255))), 0);
	var g = JkLangString.forIntegerHex((~(~(this.green * 255))), 0);
	var b = JkLangString.forIntegerHex((~(~(this.blue * 255))), 0);
	var sb = JkLangStringBuilder.NEW();
	sb.appendCharacter('#'.charCodeAt());
	this.to2Digits(r, sb);
	this.to2Digits(g, sb);
	this.to2Digits(b, sb);
	return sb.toString();
};

JkGfxColor.prototype.toRgbaString = function() {
	var a = JkLangString.forIntegerHex((~(~(this.alpha * 255))), 0);
	return (JkLangString.safeString((this.toRgbString()))) + (JkLangString.safeString(a));
};

JkGfxColor.prototype.toHtmlRgbaString = function() {
	var sb = JkLangStringBuilder.NEW();
	sb.appendString("rgba(");
	sb.appendString((JkLangString.forInteger((~(~(this.red * 255))))));
	sb.appendCharacter(','.charCodeAt());
	sb.appendString((JkLangString.forInteger((~(~(this.green * 255))))));
	sb.appendCharacter(','.charCodeAt());
	sb.appendString((JkLangString.forInteger((~(~(this.blue * 255))))));
	sb.appendCharacter(','.charCodeAt());
	sb.appendString((JkLangString.forDouble(this.alpha)));
	sb.appendCharacter(')'.charCodeAt());
	return sb.toString();
};

JkGfxColor.prototype.toHtmlCompatibleString = function() {
	if(this.alpha >= 1.0) {
		return this.toRgbString();
	}
	return this.toHtmlRgbaString();
};

JkGfxColor.prototype.toRGBInteger = function() {
	var v = ~(~(this.blue * 255));
	v |= ~(~(this.green * 255)) << 8;
	v |= ~(~(this.red * 255)) << 16;
	return v;
};

JkGfxColor.prototype.to2Digits = function(val, sb) {
	if(JkLangString.getLength(val) == 1) {
		sb.appendCharacter('0'.charCodeAt());
	}
	sb.appendString(val);
};

JkGfxColor.prototype.getRed = function() {
	return this.red;
};

JkGfxColor.prototype.setRed = function(v) {
	this.red = v;
	return this;
};

JkGfxColor.prototype.getGreen = function() {
	return this.green;
};

JkGfxColor.prototype.setGreen = function(v) {
	this.green = v;
	return this;
};

JkGfxColor.prototype.getBlue = function() {
	return this.blue;
};

JkGfxColor.prototype.setBlue = function(v) {
	this.blue = v;
	return this;
};

JkGfxColor.prototype.getAlpha = function() {
	return this.alpha;
};

JkGfxColor.prototype.setAlpha = function(v) {
	this.alpha = v;
	return this;
};

JkGfxColor.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGfxColor"] === true;
};

JkGfxColor.colorBlack = null;
JkGfxColor.colorWhite = null;
