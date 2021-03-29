let JkWidgetWebAsynchronousImageWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.overlay = null;
	this.widgetImageWidth = 0;
	this.widgetImageHeight = 0;
	this.widgetImageScaleMethod = 0;
	this.widgetPlaceholderImage = null;
};

JkWidgetWebAsynchronousImageWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetWebAsynchronousImageWidget.prototype.constructor = JkWidgetWebAsynchronousImageWidget;
JkWidgetWebAsynchronousImageWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWebAsynchronousImageWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetWebAsynchronousImageWidget.prototype._tobj = JkWidgetWebAsynchronousImageWidget;

JkWidgetWebAsynchronousImageWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetWebAsynchronousImageWidget;
	return v.CTOR_JkWidgetWebAsynchronousImageWidget_JkUiGuiApplicationContext(context);
};

JkWidgetWebAsynchronousImageWidget.prototype.CTOR_JkWidgetWebAsynchronousImageWidget_JkUiGuiApplicationContext = function(context) {
	this.widgetPlaceholderImage = null;
	this.widgetImageScaleMethod = 0;
	this.widgetImageHeight = 0;
	this.widgetImageWidth = 0;
	this.overlay = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetWebAsynchronousImageWidget.prototype.configureImageWidgetProperties = function(imageWidget) {
	imageWidget.setWidgetImageWidth(this.widgetImageWidth);
	imageWidget.setWidgetImageHeight(this.widgetImageHeight);
	imageWidget.setWidgetImageScaleMethod(this.widgetImageScaleMethod);
};

JkWidgetWebAsynchronousImageWidget.prototype.onStartLoading = function(useOverlay) {
	this.removeAllChildren();
	var v = JkWidgetImageWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.configureImageWidgetProperties(v);
	if(this.widgetPlaceholderImage != null) {
		v.setWidgetImage(this.widgetPlaceholderImage);
	}
	this.addWidget(v);
	if(useOverlay) {
		this.overlay = JkWidgetCanvasWidget.forColor(this.context, (JkGfxColor.forRGBA(0, 0, 0, 200)));
		this.addWidget(this.overlay);
	}
	return v;
};

JkWidgetWebAsynchronousImageWidget.prototype.onEndLoading = function() {
	if(this.overlay != null) {
		JkWidgetWidget.removeFromParent(this.overlay);
		this.overlay = null;
	}
};

JkWidgetWebAsynchronousImageWidget.prototype.getWidgetImageWidth = function() {
	return this.widgetImageWidth;
};

JkWidgetWebAsynchronousImageWidget.prototype.setWidgetImageWidth = function(v) {
	this.widgetImageWidth = v;
	return this;
};

JkWidgetWebAsynchronousImageWidget.prototype.getWidgetImageHeight = function() {
	return this.widgetImageHeight;
};

JkWidgetWebAsynchronousImageWidget.prototype.setWidgetImageHeight = function(v) {
	this.widgetImageHeight = v;
	return this;
};

JkWidgetWebAsynchronousImageWidget.prototype.getWidgetImageScaleMethod = function() {
	return this.widgetImageScaleMethod;
};

JkWidgetWebAsynchronousImageWidget.prototype.setWidgetImageScaleMethod = function(v) {
	this.widgetImageScaleMethod = v;
	return this;
};

JkWidgetWebAsynchronousImageWidget.prototype.getWidgetPlaceholderImage = function() {
	return this.widgetPlaceholderImage;
};

JkWidgetWebAsynchronousImageWidget.prototype.setWidgetPlaceholderImage = function(v) {
	this.widgetPlaceholderImage = v;
	return this;
};

JkWidgetWebAsynchronousImageWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetWebAsynchronousImageWidget"] === true;
};

let JkWidgetWebCachingWebImageWidgetCachedImage = function() {
	this.image = null;
	this.timeStamp = 0;
	this.ttl = 0;
	this.queue = null;
};

JkWidgetWebCachingWebImageWidgetCachedImage.prototype._t = { "JkWidgetWebCachingWebImageWidgetCachedImage" : true };
JkWidgetWebCachingWebImageWidgetCachedImage.prototype._tobj = JkWidgetWebCachingWebImageWidgetCachedImage;

JkWidgetWebCachingWebImageWidgetCachedImage.NEW = function() {
	var v = new JkWidgetWebCachingWebImageWidgetCachedImage;
	return v.CTOR_JkWidgetWebCachingWebImageWidgetCachedImage();
};

JkWidgetWebCachingWebImageWidgetCachedImage.prototype.CTOR_JkWidgetWebCachingWebImageWidgetCachedImage = function() {
	this.queue = null;
	this.ttl = 0;
	this.timeStamp = 0;
	this.image = null;
	this.queue = new Array;
	this.timeStamp = JkTimeSystemClock.asSeconds();
	return this;
};

JkWidgetWebCachingWebImageWidgetCachedImage.prototype.isAvailable = function() {
	return this.image != null && JkTimeSystemClock.asSeconds() - this.timeStamp < this.ttl;
};

JkWidgetWebCachingWebImageWidgetCachedImage.prototype.push = function(callback) {
	JkLangVector.append(this.queue, callback);
};

JkWidgetWebCachingWebImageWidgetCachedImage.prototype.pop = function() {
	return JkLangVector.popFirst(this.queue);
};

JkWidgetWebCachingWebImageWidgetCachedImage.prototype.checkTTL = function() {
	if(JkTimeSystemClock.asSeconds() - this.timeStamp >= this.ttl) {
		this.timeStamp = JkTimeSystemClock.asSeconds();
		this.image = null;
	}
};

JkWidgetWebCachingWebImageWidgetCachedImage.prototype.getImage = function() {
	return this.image;
};

JkWidgetWebCachingWebImageWidgetCachedImage.prototype.setImage = function(v) {
	this.image = v;
	return this;
};

JkWidgetWebCachingWebImageWidgetCachedImage.prototype.getTimeStamp = function() {
	return this.timeStamp;
};

JkWidgetWebCachingWebImageWidgetCachedImage.prototype.setTimeStamp = function(v) {
	this.timeStamp = v;
	return this;
};

JkWidgetWebCachingWebImageWidgetCachedImage.prototype.getTtl = function() {
	return this.ttl;
};

JkWidgetWebCachingWebImageWidgetCachedImage.prototype.setTtl = function(v) {
	this.ttl = v;
	return this;
};

JkWidgetWebCachingWebImageWidgetCachedImage.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetWebCachingWebImageWidgetCachedImage"] === true;
};

let JkWidgetWebWebImageWidget = function() {
	JkWidgetWebAsynchronousImageWidget.call(this);
	this.widgetImage = null;
	this.widgetUseOverlay = false;
};

JkWidgetWebWebImageWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWebAsynchronousImageWidget.prototype);
JkWidgetWebWebImageWidget.prototype.constructor = JkWidgetWebWebImageWidget;
JkWidgetWebWebImageWidget.prototype._t = {
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetWebAsynchronousImageWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWebWebImageWidget" : true
};
JkWidgetWebWebImageWidget.prototype._tobj = JkWidgetWebWebImageWidget;

JkWidgetWebWebImageWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetWebWebImageWidget;
	return v.CTOR_JkWidgetWebWebImageWidget_JkUiGuiApplicationContext(context);
};

JkWidgetWebWebImageWidget.prototype.CTOR_JkWidgetWebWebImageWidget_JkUiGuiApplicationContext = function(context) {
	this.widgetUseOverlay = false;
	this.widgetImage = null;
	if(JkWidgetWebAsynchronousImageWidget.prototype.CTOR_JkWidgetWebAsynchronousImageWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetWebWebImageWidget.forPlaceholderImage = function(context, image) {
	var v = JkWidgetWebWebImageWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetPlaceholderImage(image);
	return v;
};

JkWidgetWebWebImageWidget.prototype.setWidgetImageResource = function(resName) {
	var img = this.onStartLoading(false);
	if(img != null) {
		img.setWidgetImageResource(resName);
	}
	this.onEndLoading();
};

JkWidgetWebWebImageWidget.prototype.getWidgetImage = function() {
	return this.widgetImage;
};

JkWidgetWebWebImageWidget.prototype.setWidgetImage = function(image) {
	var img = this.onStartLoading(false);
	this.widgetImage = image;
	if(img != null) {
		img.setWidgetImage(image);
	}
	this.onEndLoading();
};

JkWidgetWebWebImageWidget.prototype.setWidgetImageUrl1 = function(url, callback) {
	this.setWidgetImageUrl2(url, null, null, callback);
};

JkWidgetWebWebImageWidget.prototype.setWidgetImageUrl2 = function(url, headers, body, callback) {
	JkLogLog.debug(this.context, "WebImageWidget" + (": Start loading image: `") + (JkLangString.safeString(url)) + ("'"));
	var img = this.onStartLoading(this.widgetUseOverlay);
	if(!(headers != null)) {
		var path = url;
		var imgo = JkUiImageForBrowser.NEW();
		var image = null;
		image = new Image();
		image.src = path;
		;
		imgo.image = image;
		img.setWidgetImage(imgo);
		this.widgetImage = imgo;
		return;
	}
	JkWidgetWebWebImageWidget.doQueryImage(this.context, url, headers, body, (function(imgo2) {
		this.onEndLoading();
		this.widgetImage = imgo2;
		img.setWidgetImage(imgo2);
	}.bind(this)), callback);
};

JkWidgetWebWebImageWidget.doQueryImage = function(context, url, headers, body, callback, errorCallback) {
	var client = JkWebNativeWebClient.instance();
	if(!(client != null)) {
		JkLogLog.error(context, "Failed to create web client.");
		if(errorCallback != null) {
			errorCallback((JkLangError.forCode("noWebClient", null)));
		}
		return;
	}
	var uu = url;
	var cb = callback;
	var ecb = errorCallback;
	var contextf = context;
	client.query("GET", url, headers, body, (function(rcode1, rheaders1, rbody1) {
		if(rbody1 == null || JkLangBuffer.getSize(rbody1) < 1) {
			JkLogLog.error(contextf, "WebImageWidget" + (": FAILED loading image: `") + (JkLangString.safeString(uu)) + ("'"));
			if(ecb != null) {
				ecb((JkLangError.forCode("failedToDownload", null)));
			}
			return;
		}
		var mimeType = null;
		var hdrv = rheaders1.asVector();
		if(hdrv != null) {
			var n = 0;
			var m = hdrv.length;
			for(n = 0 ; n < m ; n++) {
				var hdr = hdrv[n];
				if(hdr != null) {
					if(JkLangString.equalsIgnoreCase(hdr.key, "content-type")) {
						var vv = hdr.value;
						if(vv != null) {
							var sc = JkLangString.getIndexOfCharacter(vv, ';'.charCodeAt(), 0);
							if(sc < 0) {
								mimeType = vv;
							}
							else {
								mimeType = JkLangString.getEndOfString(vv, sc);
							}
						}
					}
				}
			}
		}
		contextf.getImageForBuffer(rbody1, mimeType, (function(imgo1) {
			if(!(imgo1 != null)) {
				JkLogLog.error(contextf, "WebImageWidget" + (": Failed to create image from the returned data"));
				if(ecb != null) {
					ecb((JkLangError.forCode("failedToCreateImage", null)));
				}
				return;
			}
			cb(imgo1);
		}.bind(this)));
	}.bind(this)));
};

JkWidgetWebWebImageWidget.prototype.getWidgetUseOverlay = function() {
	return this.widgetUseOverlay;
};

JkWidgetWebWebImageWidget.prototype.setWidgetUseOverlay = function(v) {
	this.widgetUseOverlay = v;
	return this;
};

JkWidgetWebWebImageWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetWebWebImageWidget"] === true;
};

let JkWidgetWebWebWidget = function() {
	JkWidgetWidget.call(this);
	this.widgetContext = null;
	this.widgetUrl = null;
	this.widgetHtmlString = null;
	this.customUrlHandler = null;
};

JkWidgetWebWebWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetWebWebWidget.prototype.constructor = JkWidgetWebWebWidget;
JkWidgetWebWebWidget.prototype._t = {
	"JkWidgetWidget" : true,
	"JkWidgetWebWebWidget" : true
};
JkWidgetWebWebWidget.prototype._tobj = JkWidgetWebWebWidget;

JkWidgetWebWebWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetWebWebWidget;
	return v.CTOR_JkWidgetWebWebWidget_JkUiGuiApplicationContext(context);
};

JkWidgetWebWebWidget.prototype.CTOR_JkWidgetWebWebWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.customUrlHandler = null;
	this.widgetHtmlString = null;
	this.widgetUrl = null;
	this.widgetContext = null;
	this.widgetContext = context;
	return this;
};

JkWidgetWebWebWidget.forUrl = function(context, url) {
	var v = JkWidgetWebWebWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetUrl(url);
	return v;
};

JkWidgetWebWebWidget.forHtmlString = function(context, html) {
	var v = JkWidgetWebWebWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetHtmlString(html);
	return v;
};

JkWidgetWebWebWidget.prototype.createElement = function() {
	var v = JkUiHTMLDOM.createElement("iframe");
	JkUiHTMLDOM.setAttribute(v, "sandbox", "allow-forms allow-scripts allow-modals allow-popups allow-same-origin");
	return v;
};

JkWidgetWebWebWidget.prototype.overrideWidgetUrlLoading = function(url) {
	if(this.customUrlHandler != null) {
		return this.customUrlHandler(url);
	}
	return false;
};

JkWidgetWebWebWidget.prototype.setWebCustomUserAgent = function(customUserAgent) {
	var cua = customUserAgent;
	var web = this;
	return this;
};

JkWidgetWebWebWidget.prototype.setWidgetHtmlString = function(html) {
	this.widgetHtmlString = html;
	this.widgetUrl = null;
	this.updateWidgetContent();
	return this;
};

JkWidgetWebWebWidget.prototype.getWidgetHtmlString = function() {
	return this.widgetHtmlString;
};

JkWidgetWebWebWidget.prototype.setWidgetUrl = function(url) {
	this.widgetUrl = url;
	this.widgetHtmlString = null;
	this.updateWidgetContent();
	return this;
};

JkWidgetWebWebWidget.prototype.getWidgetUrl = function() {
	return this.widgetUrl;
};

JkWidgetWebWebWidget.prototype.updateWidgetContent = function() {
	var url = this.widgetUrl;
	if(url != null) {
		this.element.src = url;
		;
	}
	else {
		var htmlString = this.widgetHtmlString;
		this.element.srcdoc = htmlString;
		if(!this.element.hasAttribute("srcdoc")) {
			this.element.setAttribute("htmlDoc", htmlString);
			var jsUrl = "javascript: window.frameElement.getAttribute('htmlDoc')";
			this.element.setAttribute("src", jsUrl);
		}
		;
	}
};

JkWidgetWebWebWidget.prototype.getCustomUrlHandler = function() {
	return this.customUrlHandler;
};

JkWidgetWebWebWidget.prototype.setCustomUrlHandler = function(v) {
	this.customUrlHandler = v;
	return this;
};

JkWidgetWebWebWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetWebWebWidget"] === true;
};

let JkWidgetWebJSONAPIClientWithGui = function() {
	JkWebJsonJSONAPIClient.call(this);
	this.context = null;
	this.parentWidget = null;
	this.loadingWidget = null;
	this.requestCounter = 0;
};

JkWidgetWebJSONAPIClientWithGui.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWebJsonJSONAPIClient.prototype);
JkWidgetWebJSONAPIClientWithGui.prototype.constructor = JkWidgetWebJSONAPIClientWithGui;
JkWidgetWebJSONAPIClientWithGui.prototype._t = {
	"JkWebJsonJSONAPIClient" : true,
	"JkWidgetWebJSONAPIClientWithGui" : true
};
JkWidgetWebJSONAPIClientWithGui.prototype._tobj = JkWidgetWebJSONAPIClientWithGui;

JkWidgetWebJSONAPIClientWithGui.NEW = function() {
	var v = new JkWidgetWebJSONAPIClientWithGui;
	return v.CTOR_JkWidgetWebJSONAPIClientWithGui();
};

JkWidgetWebJSONAPIClientWithGui.prototype.CTOR_JkWidgetWebJSONAPIClientWithGui = function() {
	this.requestCounter = 0;
	this.loadingWidget = null;
	this.parentWidget = null;
	this.context = null;
	if(JkWebJsonJSONAPIClient.prototype.CTOR_JkWebJsonJSONAPIClient.call(this) == null) {
		return null;
	}
	return this;
};

JkWidgetWebJSONAPIClientWithGui.prototype.onStartSendRequest = function() {
	JkWebJsonJSONAPIClient.prototype.onStartSendRequest.call(this);
	if(this.loadingWidget == null) {
		this.loadingWidget = JkWidgetCommonLoadingWidget.openPopup(this.context, this.parentWidget);
	}
	this.requestCounter++;
};

JkWidgetWebJSONAPIClientWithGui.prototype.onEndSendRequest = function() {
	JkWebJsonJSONAPIClient.prototype.onEndSendRequest.call(this);
	this.requestCounter--;
	if(this.requestCounter < 1) {
		this.loadingWidget = JkWidgetCommonLoadingWidget.closePopup(this.loadingWidget);
	}
};

JkWidgetWebJSONAPIClientWithGui.prototype.onDefaultErrorHandler = function(error) {
	if(error == null || this.context == null) {
		return;
	}
	this.context.showErrorDialog((error.toString()), null);
};

JkWidgetWebJSONAPIClientWithGui.prototype.getContext = function() {
	return this.context;
};

JkWidgetWebJSONAPIClientWithGui.prototype.setContext = function(v) {
	this.context = v;
	return this;
};

JkWidgetWebJSONAPIClientWithGui.prototype.getParentWidget = function() {
	return this.parentWidget;
};

JkWidgetWebJSONAPIClientWithGui.prototype.setParentWidget = function(v) {
	this.parentWidget = v;
	return this;
};

JkWidgetWebJSONAPIClientWithGui.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetWebJSONAPIClientWithGui"] === true;
};

let JkWidgetWebCachingWebImageWidget = function() {
	JkWidgetWebWebImageWidget.call(this);
	this.widgetImageRounded = false;
};

JkWidgetWebCachingWebImageWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWebWebImageWidget.prototype);
JkWidgetWebCachingWebImageWidget.prototype.constructor = JkWidgetWebCachingWebImageWidget;
JkWidgetWebCachingWebImageWidget.prototype._t = {
	"JkWidgetWebCachingWebImageWidget" : true,
	"JkWidgetWebAsynchronousImageWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWebWebImageWidget" : true
};
JkWidgetWebCachingWebImageWidget.prototype._tobj = JkWidgetWebCachingWebImageWidget;

JkWidgetWebCachingWebImageWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetWebCachingWebImageWidget;
	return v.CTOR_JkWidgetWebCachingWebImageWidget_JkUiGuiApplicationContext(context);
};

JkWidgetWebCachingWebImageWidget.prototype.CTOR_JkWidgetWebCachingWebImageWidget_JkUiGuiApplicationContext = function(context) {
	this.widgetImageRounded = false;
	if(JkWidgetWebWebImageWidget.prototype.CTOR_JkWidgetWebWebImageWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetWebCachingWebImageWidget.setTTL = function(seconds) {
	if(!(seconds >= 60)) {
		return;
	}
	JkWidgetWebCachingWebImageWidget.ttl = seconds;
};

JkWidgetWebCachingWebImageWidget.removeCachedImage = function(url, rounded) {
	if(!(JkWidgetWebCachingWebImageWidget.cacheMap != null && JkLangString.isNotEmpty(url))) {
		return;
	}
	var key = rounded ? (JkLangString.safeString(url)) + ("_rounded") : (JkLangString.safeString(url)) + ("_raw");
	JkWidgetWebCachingWebImageWidget.cacheMap.remove(key);
};

JkWidgetWebCachingWebImageWidget.queryImage = function(context, url, headers, body, rounded, callback, errorCallback) {
	if(!(JkWidgetWebCachingWebImageWidget.cacheMap != null)) {
		JkWidgetWebCachingWebImageWidget.cacheMap = JkLangDynamicMap.NEW();
	}
	var key = rounded ? (JkLangString.safeString(url)) + ("_rounded") : (JkLangString.safeString(url)) + ("_raw");
	var cachedImage = (function(o) {
		if(JkWidgetWebCachingWebImageWidgetCachedImage.IS_INSTANCE && JkWidgetWebCachingWebImageWidgetCachedImage.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkWidgetWebCachingWebImageWidget.cacheMap.get(key)));
	if(!(cachedImage != null)) {
		cachedImage = JkWidgetWebCachingWebImageWidgetCachedImage.NEW();
		cachedImage.setTtl(JkWidgetWebCachingWebImageWidget.ttl);
		JkWidgetWebCachingWebImageWidget.cacheMap.setObject(key, cachedImage);
	}
	cachedImage.checkTTL();
	if(cachedImage.isAvailable()) {
		callback((cachedImage.getImage()));
		return;
	}
	cachedImage.push(callback);
	var client = JkWebNativeWebClient.instance();
	if(!(client != null)) {
		JkLogLog.error(context, "Failed to create web client.");
		if(errorCallback != null) {
			errorCallback((JkLangError.forCode("noWebClient", null)));
		}
		return;
	}
	JkLogLog.debug(context, "CachingWebImageWidget" + (": Start loading image: `") + (JkLangString.safeString(url)) + ("'"));
	var cif = cachedImage;
	var roundedf = rounded;
	var invokeCallback = function(cache1) {
		if(!(cache1 != null)) {
			return;
		}
		while(true){
			var cb = cache1.pop();
			if(!(cb != null)) {
				break;
			}
			cb((cache1.getImage()));
		}
	}.bind(this);
	JkWidgetWebWebImageWidget.doQueryImage(context, url, headers, body, (function(image1) {
		if(roundedf) {
			JkUiImageUtil.createCircularImage(image1, (function(newImage1) {
				cif.setImage(newImage1);
				invokeCallback(cif);
			}.bind(this)));
		}
		else {
			cif.setImage(image1);
			invokeCallback(cif);
		}
	}.bind(this)), errorCallback);
};

JkWidgetWebCachingWebImageWidget.prototype.setWidgetImageUrl2 = function(url, headers, body, callback) {
	var img = this.onStartLoading((this.getWidgetUseOverlay()));
	var cb = callback;
	JkWidgetWebCachingWebImageWidget.queryImage(this.context, url, headers, body, this.widgetImageRounded, (function(imgo1) {
		this.onEndLoading();
		img.setWidgetImage(imgo1);
	}.bind(this)), (function(error1) {
		this.onEndLoading();
		if(cb != null) {
			cb(error1);
		}
	}.bind(this)));
};

JkWidgetWebCachingWebImageWidget.prototype.getWidgetImageRounded = function() {
	return this.widgetImageRounded;
};

JkWidgetWebCachingWebImageWidget.prototype.setWidgetImageRounded = function(v) {
	this.widgetImageRounded = v;
	return this;
};

JkWidgetWebCachingWebImageWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetWebCachingWebImageWidget"] === true;
};

JkWidgetWebCachingWebImageWidget.cacheMap = null;
JkWidgetWebCachingWebImageWidget.ttl = 60 * 5;
