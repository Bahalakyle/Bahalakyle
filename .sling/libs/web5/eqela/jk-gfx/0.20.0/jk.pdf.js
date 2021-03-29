let JkPdfPaperOrientation = function() {
	this.value = 0;
};

JkPdfPaperOrientation.prototype._t = {
	"JkPdfPaperOrientation" : true,
	"JkLangStringObject" : true
};
JkPdfPaperOrientation.prototype._tobj = JkPdfPaperOrientation;

JkPdfPaperOrientation.NEW = function() {
	var v = new JkPdfPaperOrientation;
	return v.CTOR_JkPdfPaperOrientation();
};

JkPdfPaperOrientation.prototype.CTOR_JkPdfPaperOrientation = function() {
	this.value = 0;
	return this;
};

JkPdfPaperOrientation.getAll = function() {
	var v = new Array;
	var n = 0;
	for(n = 0 ; n < JkPdfPaperOrientation.COUNT ; n++) {
		JkLangVector.append(v, (JkPdfPaperOrientation.forValue(n)));
	}
	return v;
};

JkPdfPaperOrientation.matches = function(oo, value) {
	if(oo != null && oo.getValue() == value) {
		return true;
	}
	return false;
};

JkPdfPaperOrientation.forValue = function(value) {
	return JkPdfPaperOrientation.NEW().setValue(value);
};

JkPdfPaperOrientation.prototype.toString = function() {
	if(this.value == JkPdfPaperOrientation.LANDSCAPE) {
		return "Landscape";
	}
	if(this.value == JkPdfPaperOrientation.PORTRAIT) {
		return "Portrait";
	}
	return "Unknown orientation";
};

JkPdfPaperOrientation.prototype.getValue = function() {
	return this.value;
};

JkPdfPaperOrientation.prototype.setValue = function(v) {
	this.value = v;
	return this;
};

JkPdfPaperOrientation.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkPdfPaperOrientation"] === true;
};

JkPdfPaperOrientation.LANDSCAPE = 0;
JkPdfPaperOrientation.PORTRAIT = 1;
JkPdfPaperOrientation.COUNT = 2;

let JkPdfPaperConfigurationSize = function() {
	this.width = 0.0;
	this.height = 0.0;
};

JkPdfPaperConfigurationSize.prototype._t = { "JkPdfPaperConfigurationSize" : true };
JkPdfPaperConfigurationSize.prototype._tobj = JkPdfPaperConfigurationSize;

JkPdfPaperConfigurationSize.NEW_DoubleDouble = function(w, h) {
	var v = new JkPdfPaperConfigurationSize;
	return v.CTOR_JkPdfPaperConfigurationSize_DoubleDouble(w, h);
};

JkPdfPaperConfigurationSize.prototype.CTOR_JkPdfPaperConfigurationSize_DoubleDouble = function(w, h) {
	this.height = 0.0;
	this.width = 0.0;
	this.width = w;
	this.height = h;
	return this;
};

JkPdfPaperConfigurationSize.NEW = function() {
	var v = new JkPdfPaperConfigurationSize;
	return v.CTOR_JkPdfPaperConfigurationSize();
};

JkPdfPaperConfigurationSize.prototype.CTOR_JkPdfPaperConfigurationSize = function() {
	this.height = 0.0;
	this.width = 0.0;
	this.width = 0.0;
	this.height = 0.0;
	return this;
};

JkPdfPaperConfigurationSize.prototype.getHeight = function() {
	return this.height;
};

JkPdfPaperConfigurationSize.prototype.getWidth = function() {
	return this.width;
};

JkPdfPaperConfigurationSize.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkPdfPaperConfigurationSize"] === true;
};

let JkPdfPaperConfiguration = function() {
	this.size = null;
	this.orientation = null;
};

JkPdfPaperConfiguration.prototype._t = { "JkPdfPaperConfiguration" : true };
JkPdfPaperConfiguration.prototype._tobj = JkPdfPaperConfiguration;

JkPdfPaperConfiguration.NEW = function() {
	var v = new JkPdfPaperConfiguration;
	return v.CTOR_JkPdfPaperConfiguration();
};

JkPdfPaperConfiguration.prototype.CTOR_JkPdfPaperConfiguration = function() {
	this.orientation = null;
	this.size = null;
	return this;
};

JkPdfPaperConfiguration.forDefault = function() {
	return JkPdfPaperConfiguration.forA4Portrait();
};

JkPdfPaperConfiguration.forA4Portrait = function() {
	var v = JkPdfPaperConfiguration.NEW();
	v.setSize((JkPdfPaperSize.forValue(JkPdfPaperSize.A4)));
	v.setOrientation((JkPdfPaperOrientation.forValue(JkPdfPaperOrientation.PORTRAIT)));
	return v;
};

JkPdfPaperConfiguration.forA4Landscape = function() {
	var v = JkPdfPaperConfiguration.NEW();
	v.setSize((JkPdfPaperSize.forValue(JkPdfPaperSize.A4)));
	v.setOrientation((JkPdfPaperOrientation.forValue(JkPdfPaperOrientation.LANDSCAPE)));
	return v;
};

JkPdfPaperConfiguration.prototype.getSizeInches = function() {
	var sz = this.getRawSizeInches();
	if(JkPdfPaperOrientation.matches(this.orientation, JkPdfPaperOrientation.LANDSCAPE)) {
		return JkPdfPaperConfigurationSize.NEW_DoubleDouble((sz.getHeight()), (sz.getWidth()));
	}
	return sz;
};

JkPdfPaperConfiguration.prototype.getRawSizeInches = function() {
	if(JkPdfPaperSize.matches(this.size, JkPdfPaperSize.LETTER)) {
		return JkPdfPaperConfigurationSize.NEW_DoubleDouble(8.5, 11.0);
	}
	if(JkPdfPaperSize.matches(this.size, JkPdfPaperSize.LEGAL)) {
		return JkPdfPaperConfigurationSize.NEW_DoubleDouble(8.5, 14.0);
	}
	if(JkPdfPaperSize.matches(this.size, JkPdfPaperSize.A3)) {
		return JkPdfPaperConfigurationSize.NEW_DoubleDouble(11.7, 16.5);
	}
	if(JkPdfPaperSize.matches(this.size, JkPdfPaperSize.A4)) {
		return JkPdfPaperConfigurationSize.NEW_DoubleDouble(8.27, 11.7);
	}
	if(JkPdfPaperSize.matches(this.size, JkPdfPaperSize.A5)) {
		return JkPdfPaperConfigurationSize.NEW_DoubleDouble(5.8, 8.3);
	}
	if(JkPdfPaperSize.matches(this.size, JkPdfPaperSize.B4)) {
		return JkPdfPaperConfigurationSize.NEW_DoubleDouble(9.8, 13.9);
	}
	if(JkPdfPaperSize.matches(this.size, JkPdfPaperSize.B5)) {
		return JkPdfPaperConfigurationSize.NEW_DoubleDouble(6.9, 9.8);
	}
	return JkPdfPaperConfigurationSize.NEW_DoubleDouble(8.27, 11.7);
};

JkPdfPaperConfiguration.prototype.getSizeDots = function(dpi) {
	var szi = this.getSizeInches();
	return JkPdfPaperConfigurationSize.NEW_DoubleDouble((szi.getWidth() * dpi), (szi.getHeight() * dpi));
};

JkPdfPaperConfiguration.prototype.getSize = function() {
	return this.size;
};

JkPdfPaperConfiguration.prototype.setSize = function(v) {
	this.size = v;
	return this;
};

JkPdfPaperConfiguration.prototype.getOrientation = function() {
	return this.orientation;
};

JkPdfPaperConfiguration.prototype.setOrientation = function(v) {
	this.orientation = v;
	return this;
};

JkPdfPaperConfiguration.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkPdfPaperConfiguration"] === true;
};

let JkPdfPdfMaker = function() {
	this.ctx = null;
};

JkPdfPdfMaker.prototype._t = { "JkPdfPdfMaker" : true };
JkPdfPdfMaker.prototype._tobj = JkPdfPdfMaker;

JkPdfPdfMaker.NEW = function() {
	var v = new JkPdfPdfMaker;
	return v.CTOR_JkPdfPdfMaker();
};

JkPdfPdfMaker.prototype.CTOR_JkPdfPdfMaker = function() {
	this.ctx = null;
	return this;
};

JkPdfPdfMaker.instance = function(ctx) {
	console.log("[jk.pdf.PdfMaker.instance] (PdfMaker.sling:39:3): Not implemented.");
	return null;
};

JkPdfPdfMaker.prototype.createDocument = function() {};

JkPdfPdfMaker.prototype.prepareImageForFile = function(file) {};

JkPdfPdfMaker.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkPdfPdfMaker"] === true;
};

let JkPdfPdfMakerPage = function() {
	JkRenderRenderingContext.call(this);
};

JkPdfPdfMakerPage.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkRenderRenderingContext.prototype);
JkPdfPdfMakerPage.prototype.constructor = JkPdfPdfMakerPage;
JkPdfPdfMakerPage.prototype._t = {
	"JkRenderRenderingContext" : true,
	"JkPdfPdfMakerPage" : true
};
JkPdfPdfMakerPage.prototype._tobj = JkPdfPdfMakerPage;

JkPdfPdfMakerPage.NEW = function() {
	var v = new JkPdfPdfMakerPage;
	return v.CTOR_JkPdfPdfMakerPage();
};

JkPdfPdfMakerPage.prototype.CTOR_JkPdfPdfMakerPage = function() {
	if(JkRenderRenderingContext.prototype.CTOR_JkRenderRenderingContext.call(this) == null) {
		return null;
	}
	return this;
};

JkPdfPdfMakerPage.prototype.getSize = function(size) {
	return this.lengthToPoints((JkGfxLength.forString(size, 0.0)));
};

JkPdfPdfMakerPage.prototype.lengthToPoints = function(_length) {
	if(!(_length != null)) {
		return 0.0;
	}
	return _length.getValueAsPointsWithPpi((this.getPpi()));
};

JkPdfPdfMakerPage.prototype.pointsToLength = function(points) {
	return JkGfxLength.forPoints(points, (this.getPpi()));
};

JkPdfPdfMakerPage.prototype.getPpi = function() {};

JkPdfPdfMakerPage.prototype.getWidth = function() {};

JkPdfPdfMakerPage.prototype.getHeight = function() {};

JkPdfPdfMakerPage.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkPdfPdfMakerPage"] === true;
};

let JkPdfPaperSize = function() {
	this.value = 0;
};

JkPdfPaperSize.prototype._t = {
	"JkPdfPaperSize" : true,
	"JkLangStringObject" : true
};
JkPdfPaperSize.prototype._tobj = JkPdfPaperSize;

JkPdfPaperSize.NEW = function() {
	var v = new JkPdfPaperSize;
	return v.CTOR_JkPdfPaperSize();
};

JkPdfPaperSize.prototype.CTOR_JkPdfPaperSize = function() {
	this.value = 0;
	return this;
};

JkPdfPaperSize.getAll = function() {
	var v = new Array;
	var n = 0;
	for(n = 0 ; n < JkPdfPaperSize.COUNT ; n++) {
		JkLangVector.append(v, (JkPdfPaperSize.forValue(n)));
	}
	return v;
};

JkPdfPaperSize.matches = function(sz, value) {
	if(sz != null && sz.getValue() == value) {
		return true;
	}
	return false;
};

JkPdfPaperSize.forValue = function(value) {
	return JkPdfPaperSize.NEW().setValue(value);
};

JkPdfPaperSize.forLetter = function() {
	return JkPdfPaperSize.NEW().setValue(JkPdfPaperSize.LETTER);
};

JkPdfPaperSize.forLegal = function() {
	return JkPdfPaperSize.NEW().setValue(JkPdfPaperSize.LEGAL);
};

JkPdfPaperSize.forA3 = function() {
	return JkPdfPaperSize.NEW().setValue(JkPdfPaperSize.A3);
};

JkPdfPaperSize.forA4 = function() {
	return JkPdfPaperSize.NEW().setValue(JkPdfPaperSize.A4);
};

JkPdfPaperSize.forA5 = function() {
	return JkPdfPaperSize.NEW().setValue(JkPdfPaperSize.A5);
};

JkPdfPaperSize.forB4 = function() {
	return JkPdfPaperSize.NEW().setValue(JkPdfPaperSize.B4);
};

JkPdfPaperSize.forB5 = function() {
	return JkPdfPaperSize.NEW().setValue(JkPdfPaperSize.B5);
};

JkPdfPaperSize.prototype.toString = function() {
	if(this.value == JkPdfPaperSize.LETTER) {
		return "US Letter";
	}
	if(this.value == JkPdfPaperSize.LEGAL) {
		return "US Legal";
	}
	if(this.value == JkPdfPaperSize.A3) {
		return "A3";
	}
	if(this.value == JkPdfPaperSize.A4) {
		return "A4";
	}
	if(this.value == JkPdfPaperSize.A5) {
		return "A5";
	}
	if(this.value == JkPdfPaperSize.B4) {
		return "B4";
	}
	if(this.value == JkPdfPaperSize.B5) {
		return "B5";
	}
	return "Unknown paper size";
};

JkPdfPaperSize.prototype.getValue = function() {
	return this.value;
};

JkPdfPaperSize.prototype.setValue = function(v) {
	this.value = v;
	return this;
};

JkPdfPaperSize.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkPdfPaperSize"] === true;
};

JkPdfPaperSize.LETTER = 0;
JkPdfPaperSize.LEGAL = 1;
JkPdfPaperSize.A3 = 2;
JkPdfPaperSize.A4 = 3;
JkPdfPaperSize.A5 = 4;
JkPdfPaperSize.B4 = 5;
JkPdfPaperSize.B5 = 6;
JkPdfPaperSize.COUNT = 7;

let JkPdfPdfMakerDocument = function() {};

JkPdfPdfMakerDocument.prototype._t = { "JkPdfPdfMakerDocument" : true };
JkPdfPdfMakerDocument.prototype._tobj = JkPdfPdfMakerDocument;

JkPdfPdfMakerDocument.NEW = function() {
	var v = new JkPdfPdfMakerDocument;
	return v.CTOR_JkPdfPdfMakerDocument();
};

JkPdfPdfMakerDocument.prototype.CTOR_JkPdfPdfMakerDocument = function() {
	return this;
};

JkPdfPdfMakerDocument.prototype.addPage = function() {
	return this.addPageWithSize((JkPdfPaperSize.forA4()));
};

JkPdfPdfMakerDocument.prototype.setTitle = function(title) {};

JkPdfPdfMakerDocument.prototype.addPageWithSize = function(size) {};

JkPdfPdfMakerDocument.prototype.saveToFile = function(file) {};

JkPdfPdfMakerDocument.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkPdfPdfMakerDocument"] === true;
};
