let JkGfxUtilImageSheet = function() {
	this.sheet = null;
	this.cols = -1;
	this.rows = -1;
	this.sourceSkipX = 0;
	this.sourceSkipY = 0;
	this.sourceImageWidth = -1;
	this.sourceImageHeight = -1;
	this.maxImages = -1;
};

JkGfxUtilImageSheet.prototype._t = { "JkGfxUtilImageSheet" : true };
JkGfxUtilImageSheet.prototype._tobj = JkGfxUtilImageSheet;

JkGfxUtilImageSheet.NEW = function() {
	var v = new JkGfxUtilImageSheet;
	return v.CTOR_JkGfxUtilImageSheet();
};

JkGfxUtilImageSheet.prototype.CTOR_JkGfxUtilImageSheet = function() {
	this.maxImages = -1;
	this.sourceImageHeight = -1;
	this.sourceImageWidth = -1;
	this.sourceSkipY = 0;
	this.sourceSkipX = 0;
	this.rows = -1;
	this.cols = -1;
	this.sheet = null;
	return this;
};

JkGfxUtilImageSheet.prototype.toImages = function(resizeToWidth, resizeToHeight) {
	if(!(this.sheet != null)) {
		return null;
	}
	var cols = this.cols;
	var rows = this.rows;
	var fwidth = this.sourceImageWidth;
	if(fwidth < 1) {
		fwidth = (this.sheet.getPixelWidth() - this.sourceSkipX) / cols;
	}
	else {
		cols = (this.sheet.getPixelWidth() - this.sourceSkipX) / fwidth;
	}
	var fheight = this.sourceImageHeight;
	if(fheight < 1) {
		fheight = (this.sheet.getPixelHeight() - this.sourceSkipY) / rows;
	}
	else {
		rows = (this.sheet.getPixelHeight() - this.sourceSkipY) / fheight;
	}
	var frames = new Array;
	var x = 0;
	var y = 0;
	for(y = 0 ; y < rows ; y++) {
		for(x = 0 ; x < cols ; x++) {
			var img = this.sheet.cropSync((x * fwidth), (y * fheight), fwidth, fheight);
			if(resizeToWidth > 0) {
				img = img.scaleToSizeSync(resizeToWidth, resizeToHeight);
			}
			frames.push(img);
			if(this.maxImages > 0 && JkLangVector.getSize(frames) >= this.maxImages) {
				return frames;
			}
		}
	}
	return frames;
};

JkGfxUtilImageSheet.prototype.getSheet = function() {
	return this.sheet;
};

JkGfxUtilImageSheet.prototype.setSheet = function(v) {
	this.sheet = v;
	return this;
};

JkGfxUtilImageSheet.prototype.getCols = function() {
	return this.cols;
};

JkGfxUtilImageSheet.prototype.setCols = function(v) {
	this.cols = v;
	return this;
};

JkGfxUtilImageSheet.prototype.getRows = function() {
	return this.rows;
};

JkGfxUtilImageSheet.prototype.setRows = function(v) {
	this.rows = v;
	return this;
};

JkGfxUtilImageSheet.prototype.getSourceSkipX = function() {
	return this.sourceSkipX;
};

JkGfxUtilImageSheet.prototype.setSourceSkipX = function(v) {
	this.sourceSkipX = v;
	return this;
};

JkGfxUtilImageSheet.prototype.getSourceSkipY = function() {
	return this.sourceSkipY;
};

JkGfxUtilImageSheet.prototype.setSourceSkipY = function(v) {
	this.sourceSkipY = v;
	return this;
};

JkGfxUtilImageSheet.prototype.getSourceImageWidth = function() {
	return this.sourceImageWidth;
};

JkGfxUtilImageSheet.prototype.setSourceImageWidth = function(v) {
	this.sourceImageWidth = v;
	return this;
};

JkGfxUtilImageSheet.prototype.getSourceImageHeight = function() {
	return this.sourceImageHeight;
};

JkGfxUtilImageSheet.prototype.setSourceImageHeight = function(v) {
	this.sourceImageHeight = v;
	return this;
};

JkGfxUtilImageSheet.prototype.getMaxImages = function() {
	return this.maxImages;
};

JkGfxUtilImageSheet.prototype.setMaxImages = function(v) {
	this.maxImages = v;
	return this;
};

JkGfxUtilImageSheet.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGfxUtilImageSheet"] === true;
};
