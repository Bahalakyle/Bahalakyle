let JkUiGuiApplicationContextTimerObject = {};

JkUiGuiApplicationContextTimerObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiGuiApplicationContextTimerObject"] === true;
};

let JkUiGuiApplicationContext = function() {
	this.styles = null;
	this.errorCounter = 0;
	this.warningCounter = 0;
	this.infoCounter = 0;
	this.debugCounter = 0;
};

JkUiGuiApplicationContext.prototype._t = {
	"JkLogLoggingContext" : true,
	"JkLangEventLoop" : true,
	"JkUiGuiApplicationContext" : true,
	"JkAppApplicationContext" : true
};
JkUiGuiApplicationContext.prototype._tobj = JkUiGuiApplicationContext;

JkUiGuiApplicationContext.NEW = function() {
	var v = new JkUiGuiApplicationContext;
	return v.CTOR_JkUiGuiApplicationContext();
};

JkUiGuiApplicationContext.prototype.CTOR_JkUiGuiApplicationContext = function() {
	this.debugCounter = 0;
	this.infoCounter = 0;
	this.warningCounter = 0;
	this.errorCounter = 0;
	this.styles = null;
	return this;
};

JkUiGuiApplicationContext.prototype.setStyle = function(id, style) {
	if(!(this.styles != null)) {
		this.styles = new Map;
	}
	this.styles.set(id, style);
};

JkUiGuiApplicationContext.prototype.getStyle = function(id) {
	if(!(this.styles != null)) {
		return null;
	}
	if(!(id != null)) {
		return null;
	}
	return this.styles.get(id);
};

JkUiGuiApplicationContext.prototype.getStyleObject = function(id, style) {
	var ss = JkLangMap.getValue(this.styles, id);
	if(!(ss != null)) {
		return null;
	}
	return JkLangMap.getValue(ss, style);
};

JkUiGuiApplicationContext.prototype.getStyleString = function(id, style, defval) {
	var v = JkLangString.asString((this.getStyleObject(id, style)));
	if(JkLangString.isEmpty(v)) {
		v = defval;
	}
	return v;
};

JkUiGuiApplicationContext.prototype.getStyleColor = function(id, style, defval) {
	var v = JkGfxColor.asColor((this.getStyleObject(id, style)));
	if(!(v != null) && defval != null) {
		v = JkGfxColor.instance(defval);
	}
	return v;
};

JkUiGuiApplicationContext.prototype.getStylePixels = function(id, style, defval) {
	var ss = this.getStyleString(id, style, null);
	if(JkLangString.isEmpty(ss)) {
		ss = defval;
	}
	return this.getHeightValue(ss);
};

JkUiGuiApplicationContext.prototype.getApplicationDataDirectory = function() {};

JkUiGuiApplicationContext.prototype.getResourceImage = function(id) {};

JkUiGuiApplicationContext.prototype.getImageForBufferSync = function(buffer, mimeType) {};

JkUiGuiApplicationContext.prototype.getImageForBuffer = function(buffer, mimeType, callback) {};

JkUiGuiApplicationContext.prototype.showMessageDialog = function(title, message, callback) {};

JkUiGuiApplicationContext.prototype.showConfirmDialog = function(title, message, okcallback, cancelcallback) {};

JkUiGuiApplicationContext.prototype.showErrorDialog = function(message, callback) {};

JkUiGuiApplicationContext.prototype.getScreenTopMargin = function() {};

JkUiGuiApplicationContext.prototype.getScreenWidth = function() {};

JkUiGuiApplicationContext.prototype.getScreenHeight = function() {};

JkUiGuiApplicationContext.prototype.getScreenDensity = function() {};

JkUiGuiApplicationContext.prototype.getHeightValue = function(spec) {};

JkUiGuiApplicationContext.prototype.getWidthValue = function(spec) {};

JkUiGuiApplicationContext.prototype.startTimer = function(timeout, callback) {};

JkUiGuiApplicationContext.prototype.enableKeepAwakeMode = function() {};

JkUiGuiApplicationContext.prototype.disableKeepAwakeMode = function() {};

JkUiGuiApplicationContext.prototype.px = function(spec) {
	return this.getHeightValue(spec);
};

JkUiGuiApplicationContext.prototype.logError = function(message) {
	console.log("[ERROR] " + (JkLangString.safeString(message)));
	this.errorCounter++;
};

JkUiGuiApplicationContext.prototype.logWarning = function(message) {
	console.log("[WARNING] " + (JkLangString.safeString(message)));
	this.warningCounter++;
};

JkUiGuiApplicationContext.prototype.logInfo = function(message) {
	console.log("[INFO] " + (JkLangString.safeString(message)));
	this.infoCounter++;
};

JkUiGuiApplicationContext.prototype.logDebug = function(message) {
	console.log("[DEBUG] " + (JkLangString.safeString(message)));
	this.debugCounter++;
};

JkUiGuiApplicationContext.prototype.logStatus = function(message) {
	console.log("[STATUS] " + (JkLangString.safeString(message)));
};

JkUiGuiApplicationContext.prototype.isInDebugMode = function() {
	return false;
};

JkUiGuiApplicationContext.prototype.getErrorCount = function() {
	return this.errorCounter;
};

JkUiGuiApplicationContext.prototype.getWarningCount = function() {
	return this.warningCounter;
};

JkUiGuiApplicationContext.prototype.getInfoCount = function() {
	return this.infoCounter;
};

JkUiGuiApplicationContext.prototype.getDebugCount = function() {
	return this.debugCounter;
};

JkUiGuiApplicationContext.prototype.resetCounters = function() {
	this.errorCounter = 0;
	this.warningCounter = 0;
	this.infoCounter = 0;
	this.debugCounter = 0;
};

JkUiGuiApplicationContext.prototype.runScheduled = function(timeout, runnable) {
	if(!(timeout >= 0)) {
		return;
	}
	var rr = runnable;
	if(!(rr != null)) {
		return;
	}
	this.startTimer(timeout, (function() {
		rr.run();
	}.bind(this)));
};

JkUiGuiApplicationContext.prototype.runInBackground = function(runnable) {
	if(!(runnable != null)) {
		return;
	}
	JkThreadThread.start(runnable);
};

JkUiGuiApplicationContext.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiGuiApplicationContext"] === true;
};

let JkUiGuiApplicationContextForBrowserMyTimerObject = function() {
	this.timerID = 0;
};

JkUiGuiApplicationContextForBrowserMyTimerObject.prototype._t = {
	"JkUiGuiApplicationContextForBrowserMyTimerObject" : true,
	"JkUiGuiApplicationContextTimerObject" : true
};
JkUiGuiApplicationContextForBrowserMyTimerObject.prototype._tobj = JkUiGuiApplicationContextForBrowserMyTimerObject;

JkUiGuiApplicationContextForBrowserMyTimerObject.NEW = function() {
	var v = new JkUiGuiApplicationContextForBrowserMyTimerObject;
	return v.CTOR_JkUiGuiApplicationContextForBrowserMyTimerObject();
};

JkUiGuiApplicationContextForBrowserMyTimerObject.prototype.CTOR_JkUiGuiApplicationContextForBrowserMyTimerObject = function() {
	this.timerID = 0;
	return this;
};

JkUiGuiApplicationContextForBrowserMyTimerObject.prototype.cancel = function() {
	clearTimeout(this.timerID);
	;
};

JkUiGuiApplicationContextForBrowserMyTimerObject.prototype.getTimerID = function() {
	return this.timerID;
};

JkUiGuiApplicationContextForBrowserMyTimerObject.prototype.setTimerID = function(v) {
	this.timerID = v;
	return this;
};

JkUiGuiApplicationContextForBrowserMyTimerObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiGuiApplicationContextForBrowserMyTimerObject"] === true;
};

let JkUiGuiApplicationContextForBrowser = function() {
	JkUiGuiApplicationContext.call(this);
	this.imageCache = new Map;
	this.screenDensity = 0;
};

JkUiGuiApplicationContextForBrowser.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkUiGuiApplicationContext.prototype);
JkUiGuiApplicationContextForBrowser.prototype.constructor = JkUiGuiApplicationContextForBrowser;
JkUiGuiApplicationContextForBrowser.prototype._t = {
	"JkLogLoggingContext" : true,
	"JkAppApplicationContext" : true,
	"JkUiGuiApplicationContextForBrowser" : true,
	"JkLangEventLoop" : true,
	"JkUiGuiApplicationContext" : true
};
JkUiGuiApplicationContextForBrowser.prototype._tobj = JkUiGuiApplicationContextForBrowser;

JkUiGuiApplicationContextForBrowser.NEW = function() {
	var v = new JkUiGuiApplicationContextForBrowser;
	return v.CTOR_JkUiGuiApplicationContextForBrowser();
};

JkUiGuiApplicationContextForBrowser.prototype.CTOR_JkUiGuiApplicationContextForBrowser = function() {
	this.screenDensity = 0;
	this.imageCache = new Map;
	if(JkUiGuiApplicationContext.prototype.CTOR_JkUiGuiApplicationContext.call(this) == null) {
		return null;
	}
	return this;
};

JkUiGuiApplicationContextForBrowser.getInstance = function() {
	if(!(JkUiGuiApplicationContextForBrowser.instance != null)) {
		JkUiGuiApplicationContextForBrowser.instance = JkUiGuiApplicationContextForBrowser.NEW();
	}
	return JkUiGuiApplicationContextForBrowser.instance;
};

JkUiGuiApplicationContextForBrowser.prototype.clearResources = function() {
	this.imageCache = new Map;
};

JkUiGuiApplicationContextForBrowser.prototype.prepareResources = function(resources, callback) {
	if(resources == null || resources.length < 1) {
		if(callback != null) {
			callback();
		}
		return;
	}
	var loadedResources = 0;
	var numberOfFonts = 0;
	var totalResources = resources.length;
	var onResourceLoadingComplete = function() {
		loadedResources++;
		if(loadedResources >= totalResources) {
			this.logInfo("All resources have been loaded");
			if(callback != null) {
				callback();
			}
		}
	}.bind(this);
	var onLoad = function() {
		this.logDebug("Resource loaded");
		onResourceLoadingComplete();
	}.bind(this);
	var onError = function() {
		this.logError("Failed to load resource");
		onResourceLoadingComplete();
	}.bind(this);
	var onFontLoad = function() {
		for(var i = 0 ; i < numberOfFonts ; i++) {
			this.logDebug("Resource loaded");
			onResourceLoadingComplete();
		}
		numberOfFonts = 0;
	}.bind(this);
	var onFontError = function() {
		for(var i1 = 0 ; i1 < numberOfFonts ; i1++) {
			this.logError("Failed to load resource");
			onResourceLoadingComplete();
		}
		numberOfFonts = 0;
	}.bind(this);
	var style = null;
	if(resources != null) {
		var n = 0;
		var m = resources.length;
		for(n = 0 ; n < m ; n++) {
			var path = resources[n];
			if(path != null) {
				var pp = path;
				var slash = JkLangString.getLastIndexOfCharacter(pp, '/'.charCodeAt(), (-1));
				if(slash >= 0) {
					pp = JkLangString.getEndOfString(pp, (slash + 1));
				}
				var dot = JkLangString.getLastIndexOfCharacter(pp, '.'.charCodeAt(), (-1));
				if(dot < 0) {
					onResourceLoadingComplete();
					continue;
				}
				var ext = JkLangString.getEndOfString(pp, (dot + 1));
				pp = JkLangString.getSubString(pp, 0, dot);
				if(JkLangString.equalsIgnoreCase(ext, "png") || JkLangString.equalsIgnoreCase(ext, "jpg") || JkLangString.equalsIgnoreCase(ext, "gif")) {
					this.logDebug("Start loading resource: `" + (JkLangString.safeString(pp)) + (": `") + (JkLangString.safeString(path)) + ("'"));
					var imgo = JkUiImageForBrowser.NEW();
					var image = null;
					image = new Image();
					image.onload = onLoad;
					image.onerror = onError;
					image.src = path;
					;
					imgo.image = image;
					this.imageCache.set(pp, imgo);
				}
				else if(JkLangString.equalsIgnoreCase(ext, "otf") || JkLangString.equalsIgnoreCase(ext, "ttf") || JkLangString.equalsIgnoreCase(ext, "woff")) {
					this.logDebug("Start loading resource: `" + (JkLangString.safeString(pp)) + (": `") + (JkLangString.safeString(path)) + ("'"));
					var head = JkUiHTMLDOM.getDocumentHead();
					if(style == null) {
						style = JkUiHTMLDOM.createElement("style");
						JkUiHTMLDOM.appendChild(head, style);
					}
					JkUiHTMLDOM.appendChild(style, (JkUiHTMLDOM.createTextNode("@font-face { font-family: " + (JkLangString.safeString(pp)) + ("; src: url('") + (JkLangString.safeString(path)) + ("')}"))));
					if(JkUiHTMLDOM.isInternetExplorer() || JkUiHTMLDOM.isEdge()) {
						numberOfFonts++;
						onResourceLoadingComplete();
					}
					else if(JkUiHTMLDOM.doesBrowserSupportFontLoading()) {
						numberOfFonts++;
						document.fonts.load("12px " + pp).then(onFontLoad, onFontError);
						;
					}
					else {
						this.logWarning("Browser does not support font loading: `" + (JkLangString.safeString(path)) + ("'"));
						onResourceLoadingComplete();
					}
				}
				else {
					this.logWarning("Unsupported resource file type `" + (JkLangString.safeString(ext)) + ("': `") + (JkLangString.safeString(path)) + ("'"));
					onResourceLoadingComplete();
				}
			}
		}
	}
};

JkUiGuiApplicationContextForBrowser.prototype.getResourceImage = function(id) {
	return JkLangMap.getValue(this.imageCache, id);
};

JkUiGuiApplicationContextForBrowser.prototype.getImageForBufferSync = function(buffer, mimeType) {
	if(!this.validateBufferAndMimeType(buffer, mimeType)) {
		return null;
	}
	var b64str = JkBase64Base64Encoder.encode(buffer);
	var imgo = JkUiImageForBrowser.NEW();
	var image = null;
	image = new Image();
	image.src = "data:" + mimeType + ";base64," + b64str;
	;
	imgo.image = image;
	return imgo;
};

JkUiGuiApplicationContextForBrowser.prototype.getImageForBuffer = function(buffer, mimeType, callback) {
	if(!(callback != null)) {
		return;
	}
	if(!this.validateBufferAndMimeType(buffer, mimeType)) {
		callback(null);
		return;
	}
	var b64str = JkBase64Base64Encoder.encode(buffer);
	var image = new Image();
	image.onload = function() {
		var imgo = JkUiImageForBrowser.NEW();
		imgo.image = image;
		callback(imgo);
	};
	image.onerror = function() {
		callback(null);
	};
	image.src = "data:" + mimeType + ";base64," + b64str;
	;
};

JkUiGuiApplicationContextForBrowser.prototype.validateBufferAndMimeType = function(buffer, mimeType) {
	if(!(buffer != null && JkLangBuffer.getSize(buffer) > 0)) {
		return false;
	}
	if(!(JkLangString.isNotEmpty(mimeType) && JkLangString.contains(mimeType, "image"))) {
		return false;
	}
	return true;
};

JkUiGuiApplicationContextForBrowser.prototype.showConfirmDialog = function(title, message, okcallback, cancelcallback) {
	var result = false;
	result = confirm(message);
	;
	if(result) {
		if(okcallback != null) {
			okcallback();
		}
	}
	else if(cancelcallback != null) {
		cancelcallback();
	}
};

JkUiGuiApplicationContextForBrowser.prototype.showMessageDialog = function(title, message, callback) {
	window.alert(message);
	;
	if(callback != null) {
		callback();
	}
};

JkUiGuiApplicationContextForBrowser.prototype.showErrorDialog = function(message, callback) {
	window.alert(message);
	;
	if(callback != null) {
		callback();
	}
};

JkUiGuiApplicationContextForBrowser.prototype.getScreenTopMargin = function() {
	return 0;
};

JkUiGuiApplicationContextForBrowser.prototype.getScreenWidth = function() {
	var v = 0;
	v = window.screen.availWidth;
	;
	return v;
};

JkUiGuiApplicationContextForBrowser.prototype.getScreenHeight = function() {
	var v = 0;
	v = window.screen.availHeight;
	;
	return v;
};

JkUiGuiApplicationContextForBrowser.prototype.getScreenDensity = function() {
	if(this.screenDensity < 1) {
		var ppi = 0;
		var div = document.createElement("div");
		div.setAttribute("style", "width: 1.3in; padding: 0; visibility: hidden; position: fixed; left: 0; top: 0;");
		var bodys = document.getElementsByTagName("body");
		bodys[0].appendChild(div);
		ppi = div.offsetWidth;
		if(ppi < 1) {
			ppi = 1;
		}
		bodys[0].removeChild(div);
		;
		var qs = JkUiWebBrowserContext.getQueryString();
		if(JkLangString.isEmpty(qs) == false) {
			var array = JkLangString.split(qs, '&'.charCodeAt(), 0);
			if(array != null) {
				var n = 0;
				var m = array.length;
				for(n = 0 ; n < m ; n++) {
					var q = array[n];
					if(q != null) {
						if(JkLangString.startsWith(q, "jkopDpi=", 0) == false) {
							continue;
						}
						var val = JkLangString.getEndOfString(q, 8);
						if(JkLangString.isEmpty(val) == false) {
							ppi = JkLangString.toInteger(val);
						}
						break;
					}
				}
			}
		}
		this.screenDensity = ppi;
	}
	return this.screenDensity;
};

JkUiGuiApplicationContextForBrowser.prototype.getHeightValue = function(spec) {
	return JkGfxLength.asPoints(spec, (this.getScreenDensity()));
};

JkUiGuiApplicationContextForBrowser.prototype.getWidthValue = function(spec) {
	return JkGfxLength.asPoints(spec, (this.getScreenDensity()));
};

JkUiGuiApplicationContextForBrowser.prototype.startTimer = function(timeout, callback) {
	var timer = JkUiGuiApplicationContextForBrowserMyTimerObject.NEW();
	timer.setTimerID(setTimeout(callback, timeout));
	;
	return timer;
};

JkUiGuiApplicationContextForBrowser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiGuiApplicationContextForBrowser"] === true;
};

JkUiGuiApplicationContextForBrowser.instance = null;
let JkUiKeyListener = {};

JkUiKeyListener.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiKeyListener"] === true;
};

let JkUiPointerListener = {};

JkUiPointerListener.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiPointerListener"] === true;
};

let JkUiImageForBrowser = function() {
	JkGfxImage.call(this);
	this.image = null;
};

JkUiImageForBrowser.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkGfxImage.prototype);
JkUiImageForBrowser.prototype.constructor = JkUiImageForBrowser;
JkUiImageForBrowser.prototype._t = {
	"JkGfxImage" : true,
	"JkUiImageForBrowser" : true
};
JkUiImageForBrowser.prototype._tobj = JkUiImageForBrowser;

JkUiImageForBrowser.NEW = function() {
	var v = new JkUiImageForBrowser;
	return v.CTOR_JkUiImageForBrowser();
};

JkUiImageForBrowser.prototype.CTOR_JkUiImageForBrowser = function() {
	this.image = null;
	if(JkGfxImage.prototype.CTOR_JkGfxImage.call(this) == null) {
		return null;
	}
	return this;
};

JkUiImageForBrowser.prototype.getSource = function() {
	if(this.image != null) {
		return this.image.src;
	}
	return null;
};

JkUiImageForBrowser.prototype.getPixelWidth = function() {
	if(this.image == null) {
		return 0;
	}
	return this.image.width;
};

JkUiImageForBrowser.prototype.getPixelHeight = function() {
	if(this.image == null) {
		return 0;
	}
	return this.image.height;
};

JkUiImageForBrowser.prototype.scaleToSizeSync = function(w, h) {
	if(!(this.image != null)) {
		return null;
	}
	return this.createImageSync((this.getScaleImageSrc(w, h, null)));
};

JkUiImageForBrowser.prototype.scaleToSize = function(w, h, callback) {
	if(!(callback != null)) {
		return;
	}
	if(!(this.image != null)) {
		callback(null);
		return;
	}
	this.createImage((this.getScaleImageSrc(w, h, null)), callback);
};

JkUiImageForBrowser.prototype.getScaleImageSrc = function(w, h, mimetype) {
	var src = null;
	var cnv = document.createElement("canvas");
	cnv.width = w;
	cnv.height = h;
	var ctx = cnv.getContext("2d");
	ctx.save();
	try {
		ctx.drawImage(this.image, 0, 0, w, h);
	}
	catch(err) {
		return(null);
	}
	ctx.restore();
	if(mimetype != null) {
		src = cnv.toDataURL(mimetype);
	}
	else {
		src = cnv.toDataURL();
	}
	;
	return src;
};

JkUiImageForBrowser.prototype.scaleToWidthSync = function(w) {
	return this.scaleToSizeSync(w, (this.getProportionalHeight(w)));
};

JkUiImageForBrowser.prototype.scaleToWidth = function(w, callback) {
	if(!(callback != null)) {
		return;
	}
	this.scaleToSize(w, (this.getProportionalHeight(w)), callback);
};

JkUiImageForBrowser.prototype.scaleToHeightSync = function(h) {
	return this.scaleToSizeSync((this.getProportionalWidth(h)), h);
};

JkUiImageForBrowser.prototype.scaleToHeight = function(h, callback) {
	if(!(callback != null)) {
		return;
	}
	this.scaleToSize((this.getProportionalWidth(h)), h, callback);
};

JkUiImageForBrowser.prototype.cropSync = function(x, y, w, h) {
	if(!(this.image != null)) {
		return null;
	}
	return this.createImageSync((this.getCropImageSrc(x, y, w, h)));
};

JkUiImageForBrowser.prototype.crop = function(x, y, w, h, callback) {
	if(!(callback != null)) {
		return;
	}
	if(!(this.image != null)) {
		callback(null);
		return;
	}
	this.createImage((this.getCropImageSrc(x, y, w, h)), callback);
};

JkUiImageForBrowser.prototype.getCropImageSrc = function(x, y, w, h) {
	var src = null;
	var cnv = document.createElement("canvas");
	cnv.width = w;
	cnv.height = h;
	var ctx = cnv.getContext("2d");
	ctx.save();
	try {
		ctx.drawImage(this.image, x, y, w, h, 0, 0, w, h);
	}
	catch(err) {
		return(null);
	}
	ctx.restore();
	src = cnv.toDataURL();
	;
	return src;
};

JkUiImageForBrowser.prototype.createImageSync = function(src) {
	if(!JkLangString.isNotEmpty(src)) {
		return null;
	}
	var imo = null;
	imo = new Image();
	imo.src = src;
	;
	var img = JkUiImageForBrowser.NEW();
	img.image = imo;
	return img;
};

JkUiImageForBrowser.prototype.createImage = function(src, callback) {
	if(!JkLangString.isNotEmpty(src)) {
		callback(null);
		return;
	}
	var imo = new Image();
	imo.onload = function() {
		var img = JkUiImageForBrowser.NEW();
		img.image = imo;
		callback(img);
	};
	imo.onerror = function() {
		callback(null);
	};
	imo.src = src;
	;
};

JkUiImageForBrowser.prototype.toJPGData = function() {
	var source = this.getSource();
	var jpgData = null;
	if(JkLangString.contains(source, "image/jpeg")) {
		jpgData = source;
	}
	else {
		jpgData = this.getScaleImageSrc((this.getPixelWidth()), (this.getPixelHeight()), "image/jpeg");
	}
	return this.getBase64Buffer(jpgData);
};

JkUiImageForBrowser.prototype.toPNGData = function() {
	var source = this.getSource();
	var pngData = null;
	if(JkLangString.contains(source, "image/png")) {
		pngData = source;
	}
	else {
		pngData = this.getScaleImageSrc((this.getPixelWidth()), (this.getPixelHeight()), "image/png");
	}
	return this.getBase64Buffer(pngData);
};

JkUiImageForBrowser.prototype.toRGBAData = function() {
	console.log("[jk.ui.ImageForBrowser.toRGBAData] (ImageForBrowser@target_browser.sling:204:2): Not implemented");
	return null;
};

JkUiImageForBrowser.prototype.getBase64Buffer = function(data) {
	if(!JkLangString.isNotEmpty(data)) {
		return null;
	}
	var simc = JkLangString.getIndexOfString(data, ";base64,", 0);
	if(!(simc > -1)) {
		return null;
	}
	var nsrc = JkLangString.getEndOfString(data, (simc + 8));
	if(!JkLangString.isNotEmpty(nsrc)) {
		return null;
	}
	return JkBase64Base64Decoder.decode(nsrc);
};

JkUiImageForBrowser.prototype.releaseImage = function() {
	console.log("[jk.ui.ImageForBrowser.releaseImage] (ImageForBrowser@target_browser.sling:220:2): Not implemented");
};

JkUiImageForBrowser.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiImageForBrowser"] === true;
};

let JkUiRouter = function() {};

JkUiRouter.prototype._t = { "JkUiRouter" : true };
JkUiRouter.prototype._tobj = JkUiRouter;

JkUiRouter.NEW = function() {
	var v = new JkUiRouter;
	return v.CTOR_JkUiRouter();
};

JkUiRouter.prototype.CTOR_JkUiRouter = function() {
	return this;
};

JkUiRouter.onHashChanged = function() {
	var hash = JkUiWebBrowserContext.getPageHash();
	var route = JkLangString.getSubString(hash, 1, (JkLangString.getLength(hash) - 1));
	if(JkLangString.isEmpty(route)) {
		route = "/";
	}
	var url = JkUrlURL.forString(route, false);
	if(url != null) {
		route = url.getPath();
	}
	if(!(JkUiRouter.listener != null)) {
		return;
	}
	JkUiRouter.listener.onRouteChanged(route);
};

JkUiRouter.initialize = function(l) {
	if(!(l != null)) {
		return;
	}
	JkUiRouter.listener = l;
	window.onhashchange = function(event) {
		JkUiRouter.onHashChanged();
	}
	;
};

JkUiRouter.goToDefault = function() {
	JkUiRouter.onHashChanged();
};

JkUiRouter.go = function(route) {
	var r = route;
	window.location.hash = "#" + r;
	;
};

JkUiRouter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiRouter"] === true;
};

JkUiRouter.listener = null;

let JkUiKeyEvent = function() {
	this.action = 0;
	this.keyCode = 0;
	this.stringValue = null;
	this.shift = false;
	this.control = false;
	this.command = false;
	this.alt = false;
	this.isConsumed = false;
};

JkUiKeyEvent.prototype._t = { "JkUiKeyEvent" : true };
JkUiKeyEvent.prototype._tobj = JkUiKeyEvent;

JkUiKeyEvent.NEW = function() {
	var v = new JkUiKeyEvent;
	return v.CTOR_JkUiKeyEvent();
};

JkUiKeyEvent.prototype.CTOR_JkUiKeyEvent = function() {
	this.isConsumed = false;
	this.alt = false;
	this.command = false;
	this.control = false;
	this.shift = false;
	this.stringValue = null;
	this.keyCode = 0;
	this.action = 0;
	return this;
};

JkUiKeyEvent.prototype.consume = function() {
	this.isConsumed = true;
};

JkUiKeyEvent.prototype.isKeyPress = function(key) {
	if(this.action == JkUiKeyEvent.ACTION_DOWN && this.keyCode == key) {
		return true;
	}
	return false;
};

JkUiKeyEvent.prototype.isKey = function(key) {
	if(this.keyCode == key) {
		return true;
	}
	return false;
};

JkUiKeyEvent.prototype.isString = function(value) {
	if(value == this.stringValue) {
		return true;
	}
	return false;
};

JkUiKeyEvent.prototype.isCharacter = function(value) {
	if(!(this.stringValue == null) && JkLangString.getChar(this.stringValue, 0) == value) {
		return true;
	}
	return false;
};

JkUiKeyEvent.prototype.clear = function() {
	this.action = 0;
	this.keyCode = 0;
	this.stringValue = null;
	this.isConsumed = false;
};

JkUiKeyEvent.prototype.getAction = function() {
	return this.action;
};

JkUiKeyEvent.prototype.setAction = function(v) {
	this.action = v;
	return this;
};

JkUiKeyEvent.prototype.getKeyCode = function() {
	return this.keyCode;
};

JkUiKeyEvent.prototype.setKeyCode = function(v) {
	this.keyCode = v;
	return this;
};

JkUiKeyEvent.prototype.getStringValue = function() {
	return this.stringValue;
};

JkUiKeyEvent.prototype.setStringValue = function(v) {
	this.stringValue = v;
	return this;
};

JkUiKeyEvent.prototype.getShift = function() {
	return this.shift;
};

JkUiKeyEvent.prototype.setShift = function(v) {
	this.shift = v;
	return this;
};

JkUiKeyEvent.prototype.getControl = function() {
	return this.control;
};

JkUiKeyEvent.prototype.setControl = function(v) {
	this.control = v;
	return this;
};

JkUiKeyEvent.prototype.getCommand = function() {
	return this.command;
};

JkUiKeyEvent.prototype.setCommand = function(v) {
	this.command = v;
	return this;
};

JkUiKeyEvent.prototype.getAlt = function() {
	return this.alt;
};

JkUiKeyEvent.prototype.setAlt = function(v) {
	this.alt = v;
	return this;
};

JkUiKeyEvent.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiKeyEvent"] === true;
};

JkUiKeyEvent.ACTION_NONE = 0;
JkUiKeyEvent.ACTION_DOWN = 1;
JkUiKeyEvent.ACTION_UP = 2;
JkUiKeyEvent.KEY_NONE = 0;
JkUiKeyEvent.KEY_SPACE = 1;
JkUiKeyEvent.KEY_ENTER = 2;
JkUiKeyEvent.KEY_TAB = 3;
JkUiKeyEvent.KEY_ESCAPE = 4;
JkUiKeyEvent.KEY_BACKSPACE = 5;
JkUiKeyEvent.KEY_SHIFT = 6;
JkUiKeyEvent.KEY_CONTROL = 7;
JkUiKeyEvent.KEY_ALT = 8;
JkUiKeyEvent.KEY_CAPSLOCK = 9;
JkUiKeyEvent.KEY_NUMLOCK = 10;
JkUiKeyEvent.KEY_LEFT = 11;
JkUiKeyEvent.KEY_UP = 12;
JkUiKeyEvent.KEY_RIGHT = 13;
JkUiKeyEvent.KEY_DOWN = 14;
JkUiKeyEvent.KEY_INSERT = 15;
JkUiKeyEvent.KEY_DELETE = 16;
JkUiKeyEvent.KEY_HOME = 17;
JkUiKeyEvent.KEY_END = 18;
JkUiKeyEvent.KEY_PAGEUP = 19;
JkUiKeyEvent.KEY_PAGEDOWN = 20;
JkUiKeyEvent.KEY_F1 = 21;
JkUiKeyEvent.KEY_F2 = 22;
JkUiKeyEvent.KEY_F3 = 23;
JkUiKeyEvent.KEY_F4 = 24;
JkUiKeyEvent.KEY_F5 = 25;
JkUiKeyEvent.KEY_F6 = 26;
JkUiKeyEvent.KEY_F7 = 27;
JkUiKeyEvent.KEY_F8 = 28;
JkUiKeyEvent.KEY_F9 = 29;
JkUiKeyEvent.KEY_F10 = 30;
JkUiKeyEvent.KEY_F11 = 31;
JkUiKeyEvent.KEY_F12 = 32;
JkUiKeyEvent.KEY_SUPER = 33;
JkUiKeyEvent.KEY_BACK = 34;

let JkUiGuiApplicationContextForHTML = function() {
	JkUiGuiApplicationContextForBrowser.call(this);
};

JkUiGuiApplicationContextForHTML.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkUiGuiApplicationContextForBrowser.prototype);
JkUiGuiApplicationContextForHTML.prototype.constructor = JkUiGuiApplicationContextForHTML;
JkUiGuiApplicationContextForHTML.prototype._t = {
	"JkLogLoggingContext" : true,
	"JkAppApplicationContext" : true,
	"JkLangEventLoop" : true,
	"JkUiGuiApplicationContextForBrowser" : true,
	"JkUiGuiApplicationContextForHTML" : true,
	"JkUiGuiApplicationContext" : true
};
JkUiGuiApplicationContextForHTML.prototype._tobj = JkUiGuiApplicationContextForHTML;

JkUiGuiApplicationContextForHTML.NEW = function() {
	var v = new JkUiGuiApplicationContextForHTML;
	return v.CTOR_JkUiGuiApplicationContextForHTML();
};

JkUiGuiApplicationContextForHTML.prototype.CTOR_JkUiGuiApplicationContextForHTML = function() {
	if(JkUiGuiApplicationContextForBrowser.prototype.CTOR_JkUiGuiApplicationContextForBrowser.call(this) == null) {
		return null;
	}
	return this;
};

JkUiGuiApplicationContextForHTML.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiGuiApplicationContextForHTML"] === true;
};

let JkUiRouterListener = {};

JkUiRouterListener.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiRouterListener"] === true;
};

let JkUiRenderingContextForHTMLCanvas = function() {
	JkRenderRenderingContext.call(this);
	this.ctx = null;
};

JkUiRenderingContextForHTMLCanvas.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkRenderRenderingContext.prototype);
JkUiRenderingContextForHTMLCanvas.prototype.constructor = JkUiRenderingContextForHTMLCanvas;
JkUiRenderingContextForHTMLCanvas.prototype._t = {
	"JkRenderRenderingContext" : true,
	"JkUiRenderingContextForHTMLCanvas" : true
};
JkUiRenderingContextForHTMLCanvas.prototype._tobj = JkUiRenderingContextForHTMLCanvas;

JkUiRenderingContextForHTMLCanvas.NEW = function() {
	var v = new JkUiRenderingContextForHTMLCanvas;
	return v.CTOR_JkUiRenderingContextForHTMLCanvas();
};

JkUiRenderingContextForHTMLCanvas.prototype.CTOR_JkUiRenderingContextForHTMLCanvas = function() {
	this.ctx = null;
	if(JkRenderRenderingContext.prototype.CTOR_JkRenderRenderingContext.call(this) == null) {
		return null;
	}
	return this;
};

JkUiRenderingContextForHTMLCanvas.forElement = function(element) {
	if(!(element != null)) {
		return null;
	}
	return JkUiRenderingContextForHTMLCanvas.forContext(element.getContext("2d"));
};

JkUiRenderingContextForHTMLCanvas.forContext = function(ctx) {
	if(!(ctx != null)) {
		return null;
	}
	var v = JkUiRenderingContextForHTMLCanvas.NEW();
	v.setCtx(ctx);
	return v;
};

JkUiRenderingContextForHTMLCanvas.prototype.setFillStyle = function(style) {
	var fs = style;
	if(fs != null) {
		if(typeof(fs) === 'string') {
			fs = JkGfxColor.forString(fs);
		}
		if(JkGfxColor.IS_INSTANCE && JkGfxColor.IS_INSTANCE(fs)) {
			fs = fs.toHtmlCompatibleString();
		}
	}
	this.ctx.fillStyle = fs;
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.setStrokeStyle = function(style) {
	var fs = style;
	if(fs != null) {
		if(typeof(fs) === 'string') {
			fs = JkGfxColor.forString(fs);
		}
		if(JkGfxColor.IS_INSTANCE && JkGfxColor.IS_INSTANCE(fs)) {
			fs = fs.toHtmlCompatibleString();
		}
	}
	this.ctx.strokeStyle = fs;
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.setShadowColor = function(color) {
	var ccs = null;
	if(color != null) {
		ccs = color.toHtmlCompatibleString();
	}
	this.ctx.shadowColor = ccs;
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.setShadowBlur = function(blur) {
	this.ctx.shadowBlur = blur;
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.setShadowOffsetX = function(offset) {
	this.ctx.shadowOffsetX = offset;
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.setShadowOffsetY = function(offset) {
	this.ctx.shadowOffsetY = offset;
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.createLinearGradient = function(x0, y0, x1, y1) {
	return this.ctx.createLinearGradient(x0, y0, x1, y1);
};

JkUiRenderingContextForHTMLCanvas.prototype.createPattern = function(image, repeat) {
	var himg = null;
	var browserImage = (function(o) {
		if(JkUiImageForBrowser.IS_INSTANCE && JkUiImageForBrowser.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(image);
	if(browserImage != null) {
		himg = browserImage.image;
	}
	var rpts = null;
	if(repeat == JkRenderRenderingContext.REPEAT_NONE) {
		rpts = "no-repeat";
	}
	else if(repeat == JkRenderRenderingContext.REPEAT_X) {
		rpts = "repeat-x";
	}
	else if(repeat == JkRenderRenderingContext.REPEAT_Y) {
		rpts = "repeat-y";
	}
	else {
		rpts = "repeat";
	}
	return this.ctx.createPattern(himg, rpts);
};

JkUiRenderingContextForHTMLCanvas.prototype.createRadialGradient = function(x0, y0, r0, x1, y1, r1) {
	return this.ctx.createRadialGradient(x0, y0, r0, x1, y1, r1);
};

JkUiRenderingContextForHTMLCanvas.prototype.addColorStop = function(gradient, index, color) {
	if(!(gradient != null)) {
		return;
	}
	var ccs = null;
	if(color != null) {
		ccs = color.toHtmlCompatibleString();
	}
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.setLineCap = function(cap) {
	var v = null;
	if(cap == JkRenderRenderingContext.LINE_CAP_SQUARE) {
		v = "square";
	}
	else if(cap == JkRenderRenderingContext.LINE_CAP_ROUND) {
		v = "round";
	}
	else {
		v = "butt";
	}
	this.ctx.lineCap = v;
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.setLineJoin = function(join) {
	var v = null;
	if(join == JkRenderRenderingContext.LINE_JOIN_BEVEL) {
		v = "bevel";
	}
	else if(join == JkRenderRenderingContext.LINE_JOIN_ROUND) {
		v = "round";
	}
	else {
		v = "miter";
	}
	this.ctx.lineJoin = v;
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.setLineWidth = function(width) {
	this.ctx.lineWidth = width;
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.setMiterLimit = function(limit) {
	this.ctx.miterLimit = limit;
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.rect = function(x, y, width, height) {
	this.ctx.rect(x, y, width, height);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.fillRect = function(x, y, width, height) {
	this.ctx.fillRect(x, y, width, height);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.strokeRect = function(x, y, width, height) {
	this.ctx.strokeRect(x, y, width, height);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.clearRect = function(x, y, width, height) {
	this.ctx.clearRect(x, y, width, height);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.fill = function() {
	this.ctx.fill();
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.stroke = function() {
	this.ctx.stroke();
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.beginPath = function() {
	this.ctx.beginPath();
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.moveTo = function(x, y) {
	this.ctx.moveTo(x, y);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.closePath = function() {
	this.ctx.closePath();
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.lineTo = function(x, y) {
	this.ctx.lineTo(x, y);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.clip = function() {
	this.ctx.clip();
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.quadraticCurveTo = function(cpx, cpy, x, y) {
	this.ctx.quadraticCurveTo(cpx, cpy, x, y);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.bezierCurveTo = function(cp1x, cp1y, cp2x, cp2y, x, y) {
	this.ctx.bezierCurveTo(cp1x, cp1y, cp2x, cp2y, x, y);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.arc = function(x, y, r, sAngle, eAngle, counterclockwise) {
	this.ctx.arc(x, y, r, sAngle, eAngle, counterclockwise);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.arcTo = function(x1, y1, x2, y2, r) {
	this.ctx.arcTo(x1, y1, x2, y2, r);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.isPointInPath = function(x, y) {
	return this.ctx.isPointInPath(x, y);
};

JkUiRenderingContextForHTMLCanvas.prototype.scale = function(scalewidth, scaleheight) {
	this.ctx.scale(scalewidth, scaleheight);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.rotate = function(angle) {
	this.ctx.rotate(angle);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.translate = function(x, y) {
	this.ctx.translate(x, y);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.transform = function(a, b, c, d, e, f) {
	this.ctx.transform(a, b, c, d, e, f);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.setTransform = function(a, b, c, d, e, f) {
	this.ctx.setTransform(a, b, c, d, e, f);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.toCssCompatibleString = function(font) {
	if(!(font != null)) {
		return null;
	}
	var sb = JkLangStringBuilder.NEW();
	if(font.getItalic()) {
		sb.appendString("italic");
	}
	if(font.getBold()) {
		if(sb.count() > 0) {
			sb.appendCharacter(' '.charCodeAt());
		}
		sb.appendString("bold");
	}
	var size = font.getSize();
	if(size != null) {
		if(sb.count() > 0) {
			sb.appendCharacter(' '.charCodeAt());
		}
		sb.appendString((JkLangString.forInteger((size.toPoints(96)))));
		sb.appendString("px");
	}
	var name = font.getName();
	if(JkLangString.isNotEmpty(name)) {
		if(sb.count() > 0) {
			sb.appendCharacter(' '.charCodeAt());
		}
		sb.appendString(name);
	}
	return sb.toString();
};

JkUiRenderingContextForHTMLCanvas.prototype.setFont = function(font) {
	var fonts = null;
	if(font != null) {
		fonts = this.toCssCompatibleString(font);
	}
	this.ctx.font = fonts;
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.setTextAlign = function(align) {
	var v = null;
	if(align == JkRenderRenderingContext.ALIGN_END) {
		v = "end";
	}
	else if(align == JkRenderRenderingContext.ALIGN_CENTER) {
		v = "center";
	}
	else if(align == JkRenderRenderingContext.ALIGN_LEFT) {
		v = "left";
	}
	else if(align == JkRenderRenderingContext.ALIGN_RIGHT) {
		v = "right";
	}
	else {
		v = "start";
	}
	this.ctx.textAlign = v;
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.setTextBaseline = function(baseline) {
	var v = null;
	if(baseline == JkRenderRenderingContext.BASELINE_TOP) {
		v = "top";
	}
	else if(baseline == JkRenderRenderingContext.BASELINE_HANGING) {
		v = "hanging";
	}
	else if(baseline == JkRenderRenderingContext.BASELINE_MIDDLE) {
		v = "middle";
	}
	else if(baseline == JkRenderRenderingContext.BASELINE_IDEOGRAPHIC) {
		v = "ideographic";
	}
	else if(baseline == JkRenderRenderingContext.BASELINE_BOTTOM) {
		v = "bottom";
	}
	else {
		v = "alphabetic";
	}
	this.ctx.textBaseline = v;
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.fillText = function(text, x, y, maxWidth) {
	var mw = maxWidth;
	if(mw <= 0) {
		mw = undefined;
	}
	this.ctx.fillText(text, x, y, mw);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.strokeText = function(text, x, y, maxWidth) {
	var mw = maxWidth;
	if(mw <= 0) {
		mw = undefined;
	}
	this.ctx.strokeText(text, x, y, mw);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.measureTextHeight = function(text) {
	if(text == null) {
		return 0.0;
	}
	var sz = this.ctx.measureText(text);
	if(sz == null) {
		return 0.0;
	}
	var v = 0.0;
	if(sz.fontBoundingBoxAscent && sz.fontBoundingBoxDescent) {
		v = sz.fontBoundingBoxAscent + sz.fontBoundingBoxDescent;
	}
	else {
		var e = document.createElement('div');
		e.style.position = 'fixed';
		e.style.font = this.ctx.font;
		e.style.padding = '0';
		e.style.margin = '0';
		e.textContent = text;
		var b = document.getElementsByTagName('body')[0];
		b.appendChild(e);
		var cs = window.getComputedStyle(e);
		v = parseFloat(cs.getPropertyValue('height'), 10);
		b.removeChild(e);
	}
	;
	return v;
};

JkUiRenderingContextForHTMLCanvas.prototype.measureTextWidth = function(text) {
	if(text == null) {
		return 0.0;
	}
	var sz = this.ctx.measureText(text);
	if(sz == null) {
		return 0.0;
	}
	var v = 0.0;
	v = sz.width;
	;
	return v;
};

JkUiRenderingContextForHTMLCanvas.prototype.drawImage = function(img, x, y) {
	var bimg = (function(o) {
		if(JkUiImageForBrowser.IS_INSTANCE && JkUiImageForBrowser.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(img);
	if(!(bimg != null)) {
		return;
	}
	var himg = bimg.image;
	if(!(himg != null)) {
		return;
	}
	this.ctx.drawImage(himg, x, y);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.drawAndScaleImage = function(img, x, y, width, height) {
	var bimg = (function(o) {
		if(JkUiImageForBrowser.IS_INSTANCE && JkUiImageForBrowser.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(img);
	if(!(bimg != null)) {
		return;
	}
	var himg = bimg.image;
	if(!(himg != null)) {
		return;
	}
	this.ctx.drawImage(himg, x, y, width, height);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.drawAndProcessImage = function(img, sx, sy, swidth, sheight, x, y, width, height) {
	var bimg = (function(o) {
		if(JkUiImageForBrowser.IS_INSTANCE && JkUiImageForBrowser.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(img);
	if(!(bimg != null)) {
		return;
	}
	var himg = bimg.image;
	if(!(himg != null)) {
		return;
	}
	this.ctx.drawImage(himg, sx, sy, swidth, sheight, x, y, width, height);
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.setGlobalAlpha = function(alpha) {
	this.ctx.globalAlpha = alpha;
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.save = function() {
	this.ctx.save();
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.restore = function() {
	this.ctx.restore();
	;
};

JkUiRenderingContextForHTMLCanvas.prototype.getCtx = function() {
	return this.ctx;
};

JkUiRenderingContextForHTMLCanvas.prototype.setCtx = function(v) {
	this.ctx = v;
	return this;
};

JkUiRenderingContextForHTMLCanvas.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiRenderingContextForHTMLCanvas"] === true;
};

let JkUiIOSDeviceInfo = function() {
	this.id = null;
	this.name = null;
	this.dpi = 0;
	this.scale = 0.0;
	this.screenWidth = 0;
	this.screenHeight = 0;
};

JkUiIOSDeviceInfo.prototype._t = { "JkUiIOSDeviceInfo" : true };
JkUiIOSDeviceInfo.prototype._tobj = JkUiIOSDeviceInfo;

JkUiIOSDeviceInfo.NEW = function() {
	var v = new JkUiIOSDeviceInfo;
	return v.CTOR_JkUiIOSDeviceInfo();
};

JkUiIOSDeviceInfo.prototype.CTOR_JkUiIOSDeviceInfo = function() {
	this.screenHeight = 0;
	this.screenWidth = 0;
	this.scale = 0.0;
	this.dpi = 0;
	this.name = null;
	this.id = null;
	return this;
};

JkUiIOSDeviceInfo.forDetails = function(id, name, dpi) {
	var v = JkUiIOSDeviceInfo.NEW();
	v.setId(id);
	v.setName(name);
	v.setDpi(dpi);
	return v;
};

JkUiIOSDeviceInfo.prototype.toString = function() {
	return (JkLangString.safeString(this.name)) + (" (") + (JkLangString.safeString(this.id)) + (") ") + (JkLangString.safeString((JkLangString.forInteger(this.screenWidth)))) + ("x") + (JkLangString.safeString((JkLangString.forInteger(this.screenHeight)))) + (" (") + (JkLangString.safeString((JkLangString.forDouble(this.scale)))) + ("x) @ ") + (JkLangString.safeString((JkLangString.forInteger(this.dpi)))) + ("DPI");
};

JkUiIOSDeviceInfo.prototype.getId = function() {
	return this.id;
};

JkUiIOSDeviceInfo.prototype.setId = function(v) {
	this.id = v;
	return this;
};

JkUiIOSDeviceInfo.prototype.getName = function() {
	return this.name;
};

JkUiIOSDeviceInfo.prototype.setName = function(v) {
	this.name = v;
	return this;
};

JkUiIOSDeviceInfo.prototype.getDpi = function() {
	return this.dpi;
};

JkUiIOSDeviceInfo.prototype.setDpi = function(v) {
	this.dpi = v;
	return this;
};

JkUiIOSDeviceInfo.prototype.getScale = function() {
	return this.scale;
};

JkUiIOSDeviceInfo.prototype.setScale = function(v) {
	this.scale = v;
	return this;
};

JkUiIOSDeviceInfo.prototype.getScreenWidth = function() {
	return this.screenWidth;
};

JkUiIOSDeviceInfo.prototype.setScreenWidth = function(v) {
	this.screenWidth = v;
	return this;
};

JkUiIOSDeviceInfo.prototype.getScreenHeight = function() {
	return this.screenHeight;
};

JkUiIOSDeviceInfo.prototype.setScreenHeight = function(v) {
	this.screenHeight = v;
	return this;
};

JkUiIOSDeviceInfo.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiIOSDeviceInfo"] === true;
};

let JkUiHTMLDOM = function() {};

JkUiHTMLDOM.prototype._t = { "JkUiHTMLDOM" : true };
JkUiHTMLDOM.prototype._tobj = JkUiHTMLDOM;

JkUiHTMLDOM.NEW = function() {
	var v = new JkUiHTMLDOM;
	return v.CTOR_JkUiHTMLDOM();
};

JkUiHTMLDOM.prototype.CTOR_JkUiHTMLDOM = function() {
	return this;
};

JkUiHTMLDOM.colorToRGBA = function(color) {
	if(!(color != null)) {
		return null;
	}
	return color.toHtmlRgbaString();
};

JkUiHTMLDOM.isBrowser = function(id) {
	var v = false;
	v = navigator.userAgent.toLowerCase().indexOf(id) > -1;
	;
	return v;
};

JkUiHTMLDOM.isInternetExplorer = function() {
	return JkUiHTMLDOM.isBrowser("msie ") || JkUiHTMLDOM.isBrowser("trident/");
};

JkUiHTMLDOM.isWebKit = function() {
	return JkUiHTMLDOM.isBrowser("webkit");
};

JkUiHTMLDOM.isFirefox = function() {
	return JkUiHTMLDOM.isBrowser("firefox");
};

JkUiHTMLDOM.isMobile = function() {
	return JkUiHTMLDOM.isBrowser("mobile");
};

JkUiHTMLDOM.isChrome = function() {
	return JkUiHTMLDOM.isBrowser("chrome");
};

JkUiHTMLDOM.isEdge = function() {
	return JkUiHTMLDOM.isBrowser("edge");
};

JkUiHTMLDOM.isSafari = function() {
	return JkUiHTMLDOM.isBrowser("safari") && !JkUiHTMLDOM.isBrowser("chrome");
};

JkUiHTMLDOM.createElement = function(type) {
	return document.createElement(type);
};

JkUiHTMLDOM.getDocument = function() {
	return document;
};

JkUiHTMLDOM.getDocumentBody = function() {
	return JkUiHTMLDOM.getElementsByTagName((JkUiHTMLDOM.getDocument()), "body")[0];
};

JkUiHTMLDOM.getDocumentHead = function() {
	return JkUiHTMLDOM.getElementsByTagName((JkUiHTMLDOM.getDocument()), "head")[0];
};

JkUiHTMLDOM.getParentElement = function(element) {
	if(!(element != null)) {
		return null;
	}
	return element.parentElement;
};

JkUiHTMLDOM.getElementById1 = function(id) {
	return JkUiHTMLDOM.getElementById2((JkUiHTMLDOM.getDocument()), id);
};

JkUiHTMLDOM.getElementById2 = function(element, id) {
	if(!(element != null)) {
		return null;
	}
	if(!(id != null)) {
		return null;
	}
	return element.getElementById(id);
};

JkUiHTMLDOM.getElementsByClassName = function(element, classname) {
	if(!(element != null)) {
		return null;
	}
	if(!(classname != null)) {
		return null;
	}
	return element.getElementsByClassName(classname);
};

JkUiHTMLDOM.getElementsByTagName = function(element, tagname) {
	if(!(element != null)) {
		return null;
	}
	if(!(tagname != null)) {
		return null;
	}
	return element.getElementsByTagName(tagname);
};

JkUiHTMLDOM.appendChild = function(element, child) {
	if(!(element != null)) {
		return;
	}
	if(!(child != null)) {
		return;
	}
	element.appendChild(child);
	;
};

JkUiHTMLDOM.appendToBody = function(element) {
	JkUiHTMLDOM.appendChild((JkUiHTMLDOM.getDocumentBody()), element);
};

JkUiHTMLDOM.remove = function(element) {
	if(!(element != null)) {
		return;
	}
	var parent = JkUiHTMLDOM.getParentElement(element);
	if(!(parent != null)) {
		return;
	}
	parent.removeChild(element);
	;
};

JkUiHTMLDOM.getFirstChild = function(element) {
	if(!(element != null)) {
		return null;
	}
	return element.firstChild;
};

JkUiHTMLDOM.getChild = function(element, index) {
	if(!(element != null)) {
		return null;
	}
	return element.childNodes[index];
};

JkUiHTMLDOM.getAttribute = function(element, attr) {
	if(!(element != null)) {
		return null;
	}
	if(!JkLangString.isNotEmpty(attr)) {
		return null;
	}
	return element.getAttribute(attr);
};

JkUiHTMLDOM.setAttribute = function(element, attr, val) {
	if(!(element != null)) {
		return;
	}
	if(!(attr != null)) {
		return;
	}
	if(val == null) {
		element.removeAttribute(attr);
		;
	}
	else {
		element.setAttribute(attr, val);
		;
	}
};

JkUiHTMLDOM.getInnerHTML = function(element) {
	if(!(element != null)) {
		return null;
	}
	return element.innerHTML;
};

JkUiHTMLDOM.setInnerHTML = function(element, text) {
	if(!(element != null)) {
		return;
	}
	element.innerHTML = text;
	;
};

JkUiHTMLDOM.getTextContent = function(element) {
	if(!(element != null)) {
		return null;
	}
	return element.textContent;
};

JkUiHTMLDOM.setTextContent = function(element, text) {
	if(!(element != null)) {
		return;
	}
	element.textContent = text;
	;
};

JkUiHTMLDOM.prototype.setValue = function(element, val) {
	if(!(element != null)) {
		return;
	}
	element.value = val;
	;
};

JkUiHTMLDOM.getValue = function(element) {
	if(!(element != null)) {
		return null;
	}
	return element.value;
};

JkUiHTMLDOM.setStyle = function(element, key, val) {
	if(!(element != null)) {
		return;
	}
	if(!JkLangString.isNotEmpty(key)) {
		return;
	}
	var v = val;
	if(JkLangString.isEmpty(val)) {
		v = "";
	}
	element.style[key] = v;
	;
};

JkUiHTMLDOM.getStyle = function(element, key) {
	if(!(element != null)) {
		return null;
	}
	if(!JkLangString.isNotEmpty(key)) {
		return null;
	}
	return element.style[key];
};

JkUiHTMLDOM.removeStyle = function(element, key) {
	if(!(element != null)) {
		return;
	}
	if(!JkLangString.isNotEmpty(key)) {
		return;
	}
	element.style[key] = "";
	;
};

JkUiHTMLDOM.addEventListener = function(element, event, listener) {
	if(!(element != null)) {
		return;
	}
	if(!JkLangString.isNotEmpty(event)) {
		return;
	}
	if(!(listener != null)) {
		return;
	}
	element.addEventListener(event, listener);
	;
};

JkUiHTMLDOM.addEventListenerWithParameterInCallback = function(element, event, listener) {
	if(!(element != null)) {
		return;
	}
	if(!JkLangString.isNotEmpty(event)) {
		return;
	}
	if(!(listener != null)) {
		return;
	}
	element.addEventListener(event, listener);
	;
};

JkUiHTMLDOM.getClassList = function(element) {
	if(!(element != null)) {
		return null;
	}
	return element.classList;
};

JkUiHTMLDOM.addToClassList = function(element, xclass) {
	if(!(element != null)) {
		return;
	}
	if(!(xclass != null)) {
		return;
	}
	element.classList.add(xclass);
	;
};

JkUiHTMLDOM.removeFromClassList = function(element, xclass) {
	if(!(element != null)) {
		return;
	}
	if(!(xclass != null)) {
		return;
	}
	element.classList.remove(xclass);
	;
};

JkUiHTMLDOM.setFocus = function(element) {
	if(!(element != null)) {
		return;
	}
	element.focus();
	;
};

JkUiHTMLDOM.createTextNode = function(text) {
	if(!(text != null)) {
		return null;
	}
	return document.createTextNode(text);
};

JkUiHTMLDOM.doesBrowserSupportFontLoading = function() {
	var v = false;
	if(document["fonts"]) {
		v = true;
	}
	;
	return v;
};

JkUiHTMLDOM.setFontFamily = function(element, fontFamily) {
	if(!(element != null)) {
		return;
	}
	if(!(fontFamily != null)) {
		return;
	}
	JkUiHTMLDOM.setStyle(element, "font-family", fontFamily);
};

JkUiHTMLDOM.isFontStandard = function(fontFamily) {
	if(fontFamily == "Arial" || fontFamily == "Times New Roman" || fontFamily == "serif" || fontFamily == "sans-serif" || fontFamily == "Helvetica" || fontFamily == "Courier New" || fontFamily == "Courier" || fontFamily == "monospace" || fontFamily == "Verdana") {
		return true;
	}
	return false;
};

JkUiHTMLDOM.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiHTMLDOM"] === true;
};

let JkUiScreen = function() {};

JkUiScreen.prototype._t = { "JkUiScreen" : true };
JkUiScreen.prototype._tobj = JkUiScreen;

JkUiScreen.NEW = function() {
	var v = new JkUiScreen;
	return v.CTOR_JkUiScreen();
};

JkUiScreen.prototype.CTOR_JkUiScreen = function() {
	return this;
};

JkUiScreen.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiScreen"] === true;
};

let JkUiScreenWithContext = {};

JkUiScreenWithContext.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiScreenWithContext"] === true;
};

let JkUiImageUtil = function() {};

JkUiImageUtil.prototype._t = { "JkUiImageUtil" : true };
JkUiImageUtil.prototype._tobj = JkUiImageUtil;

JkUiImageUtil.NEW = function() {
	var v = new JkUiImageUtil;
	return v.CTOR_JkUiImageUtil();
};

JkUiImageUtil.prototype.CTOR_JkUiImageUtil = function() {
	return this;
};

JkUiImageUtil.createCircularImageSync = function(m) {
	if(!(m != null)) {
		return null;
	}
	var image = m;
	var minSize = ~(~JkMathMath.min((image.getPixelWidth()), (image.getPixelHeight())));
	image = image.cropSync(0, 0, minSize, minSize);
	console.log("[jk.ui.ImageUtil.createCircularImageSync] (ImageUtil.sling:113:3): Not implemented");
	return null;
};

JkUiImageUtil.createCircularImage = function(oimage, callback) {
	if(!(callback != null)) {
		return;
	}
	if(!(oimage != null)) {
		callback(null);
		return;
	}
	var minSize = ~(~JkMathMath.min((oimage.getPixelWidth()), (oimage.getPixelHeight())));
	oimage.crop(0, 0, minSize, minSize, (function(image1) {
		if(!(image1 != null)) {
			callback(null);
			return;
		}
		var iiw = oimage.image.width;
		var iih = oimage.image.height;
		var whr = iiw/2;
		var cnv = document.createElement("canvas");
		cnv.width = iiw;
		cnv.height = iih;
		var ctx = cnv.getContext("2d");
		ctx.save();
		ctx.beginPath();
		ctx.arc(whr, whr, whr, 0, 2 * Math.PI);
		ctx.clip();
		try {
			ctx.drawImage(oimage.image, 0, 0);
		}
		catch(err) {
			return(null);
		}
		ctx.closePath();
		ctx.restore();
		var src = cnv.toDataURL();
		var imo = new Image();
		imo.onload = function() {
			var img = JkUiImageForBrowser.NEW();
			img.image = imo;
			callback(img);
		};
		imo.src = src;
		;
	}.bind(this)));
};

JkUiImageUtil.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiImageUtil"] === true;
};

let JkUiPointerEvent = function() {
	this.pointerId = 0;
	this.action = 0;
	this.x = 0.0;
	this.y = 0.0;
	this.isConsumed = false;
};

JkUiPointerEvent.prototype._t = { "JkUiPointerEvent" : true };
JkUiPointerEvent.prototype._tobj = JkUiPointerEvent;

JkUiPointerEvent.NEW = function() {
	var v = new JkUiPointerEvent;
	return v.CTOR_JkUiPointerEvent();
};

JkUiPointerEvent.prototype.CTOR_JkUiPointerEvent = function() {
	this.isConsumed = false;
	this.y = 0.0;
	this.x = 0.0;
	this.action = 0;
	this.pointerId = 0;
	return this;
};

JkUiPointerEvent.prototype.consume = function() {
	this.isConsumed = true;
};

JkUiPointerEvent.prototype.getPointerId = function() {
	return this.pointerId;
};

JkUiPointerEvent.prototype.setPointerId = function(value) {
	this.pointerId = value;
	return this;
};

JkUiPointerEvent.prototype.getAction = function() {
	return this.action;
};

JkUiPointerEvent.prototype.setAction = function(value) {
	this.action = value;
	return this;
};

JkUiPointerEvent.prototype.getX = function() {
	return this.x;
};

JkUiPointerEvent.prototype.setX = function(value) {
	this.x = value;
	return this;
};

JkUiPointerEvent.prototype.getY = function() {
	return this.y;
};

JkUiPointerEvent.prototype.setY = function(value) {
	this.y = value;
	return this;
};

JkUiPointerEvent.prototype.isInside = function(xc, yc, width, height) {
	if(this.x >= xc && this.x < xc + width && this.y >= yc && this.y < yc + height) {
		return true;
	}
	return false;
};

JkUiPointerEvent.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiPointerEvent"] === true;
};

JkUiPointerEvent.DOWN = 0;
JkUiPointerEvent.MOVE = 1;
JkUiPointerEvent.CANCEL = 2;
JkUiPointerEvent.UP = 3;

let JkUiWebBrowserContext = function() {};

JkUiWebBrowserContext.prototype._t = { "JkUiWebBrowserContext" : true };
JkUiWebBrowserContext.prototype._tobj = JkUiWebBrowserContext;

JkUiWebBrowserContext.NEW = function() {
	var v = new JkUiWebBrowserContext;
	return v.CTOR_JkUiWebBrowserContext();
};

JkUiWebBrowserContext.prototype.CTOR_JkUiWebBrowserContext = function() {
	return this;
};

JkUiWebBrowserContext.getPageURL = function() {
	var url = null;
	url = window.location.href;
	;
	return url;
};

JkUiWebBrowserContext.getPageHash = function() {
	var hash = null;
	hash = window.location.hash;
	;
	return hash;
};

JkUiWebBrowserContext.getQueryString = function() {
	var url = null;
	url = window.location.href;
	;
	if(JkLangString.isEmpty(url)) {
		return null;
	}
	var q = JkLangString.getIndexOfCharacter(url, '?'.charCodeAt(), 0);
	if(q < 0) {
		return null;
	}
	var v = JkLangString.getEndOfString(url, (q + 1));
	var hash = JkLangString.getIndexOfCharacter(v, '#'.charCodeAt(), 0);
	if(hash >= 0) {
		v = JkLangString.getSubString(v, 0, hash);
	}
	return v;
};

JkUiWebBrowserContext.getQueryStringValue = function(key) {
	if(!JkLangString.isNotEmpty(key)) {
		return null;
	}
	var qss = JkUiWebBrowserContext.getQueryString();
	if(!JkLangString.isNotEmpty(qss)) {
		return null;
	}
	var qs = JkUrlQueryString.parse(qss);
	if(!(qs != null)) {
		return null;
	}
	return JkLangMap.get(qs, key);
};

JkUiWebBrowserContext.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiWebBrowserContext"] === true;
};

let JkUiApplicationData = function() {};

JkUiApplicationData.prototype._t = { "JkUiApplicationData" : true };
JkUiApplicationData.prototype._tobj = JkUiApplicationData;

JkUiApplicationData.NEW = function() {
	var v = new JkUiApplicationData;
	return v.CTOR_JkUiApplicationData();
};

JkUiApplicationData.prototype.CTOR_JkUiApplicationData = function() {
	return this;
};

JkUiApplicationData.getApplicationData = function(ctx) {
	if(!(ctx != null)) {
		return null;
	}
	console.log("[jk.ui.ApplicationData.getApplicationData] (ApplicationData.sling:63:3): Not implemented.");
	return null;
};

JkUiApplicationData.retrieveFile = function(ctx, filename) {
	console.log("[jk.ui.ApplicationData.retrieveFile] (ApplicationData.sling:87:3): Not implemented.");
	return null;
};

JkUiApplicationData.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkUiApplicationData"] === true;
};
