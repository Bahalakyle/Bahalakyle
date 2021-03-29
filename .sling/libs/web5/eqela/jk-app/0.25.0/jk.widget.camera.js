let JkWidgetCameraBarcodeObject = function() {
	this.rawValue = null;
	this.displayValue = null;
	this.format = 0;
	this.valueFormat = 0;
};

JkWidgetCameraBarcodeObject.prototype._t = { "JkWidgetCameraBarcodeObject" : true };
JkWidgetCameraBarcodeObject.prototype._tobj = JkWidgetCameraBarcodeObject;

JkWidgetCameraBarcodeObject.NEW = function() {
	var v = new JkWidgetCameraBarcodeObject;
	return v.CTOR_JkWidgetCameraBarcodeObject();
};

JkWidgetCameraBarcodeObject.prototype.CTOR_JkWidgetCameraBarcodeObject = function() {
	this.valueFormat = 0;
	this.format = 0;
	this.displayValue = null;
	this.rawValue = null;
	return this;
};

JkWidgetCameraBarcodeObject.prototype.getRawValue = function() {
	return this.rawValue;
};

JkWidgetCameraBarcodeObject.prototype.setRawValue = function(v) {
	this.rawValue = v;
	return this;
};

JkWidgetCameraBarcodeObject.prototype.getDisplayValue = function() {
	return this.displayValue;
};

JkWidgetCameraBarcodeObject.prototype.setDisplayValue = function(v) {
	this.displayValue = v;
	return this;
};

JkWidgetCameraBarcodeObject.prototype.getFormat = function() {
	return this.format;
};

JkWidgetCameraBarcodeObject.prototype.setFormat = function(v) {
	this.format = v;
	return this;
};

JkWidgetCameraBarcodeObject.prototype.getValueFormat = function() {
	return this.valueFormat;
};

JkWidgetCameraBarcodeObject.prototype.setValueFormat = function(v) {
	this.valueFormat = v;
	return this;
};

JkWidgetCameraBarcodeObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCameraBarcodeObject"] === true;
};

let JkWidgetCameraBarcodeScannerWidget = function() {
	JkWidgetWidget.call(this);
	this.widgetOnBarcodesDetectedHandler = null;
	this.widgetPrimaryCamera = 0;
	this.widgetFormat = JkWidgetCameraBarcodeScannerWidget.FORMAT_ALL;
	this.widgetContext = null;
};

JkWidgetCameraBarcodeScannerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetCameraBarcodeScannerWidget.prototype.constructor = JkWidgetCameraBarcodeScannerWidget;
JkWidgetCameraBarcodeScannerWidget.prototype._t = {
	"JkWidgetWidget" : true,
	"JkWidgetCameraBarcodeScannerWidget" : true,
	"JkWidgetScreenAwareWidget" : true
};
JkWidgetCameraBarcodeScannerWidget.prototype._tobj = JkWidgetCameraBarcodeScannerWidget;

JkWidgetCameraBarcodeScannerWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCameraBarcodeScannerWidget;
	return v.CTOR_JkWidgetCameraBarcodeScannerWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCameraBarcodeScannerWidget.prototype.CTOR_JkWidgetCameraBarcodeScannerWidget_JkUiGuiApplicationContext = function(ctx) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.widgetContext = null;
	this.widgetFormat = JkWidgetCameraBarcodeScannerWidget.FORMAT_ALL;
	this.widgetPrimaryCamera = 0;
	this.widgetOnBarcodesDetectedHandler = null;
	this.widgetContext = ctx;
	return this;
};

JkWidgetCameraBarcodeScannerWidget.prototype.cleanUp = function() {
};

JkWidgetCameraBarcodeScannerWidget.prototype.onWidgetAddedToScreen = function(screen) {
	console.log("[jk.widget.camera.BarcodeScannerWidget.onWidgetAddedToScreen] (BarcodeScannerWidget.sling:504:3): Not implemented");
};

JkWidgetCameraBarcodeScannerWidget.prototype.onWidgetRemovedFromScreen = function(screen) {
	this.cleanUp();
};

JkWidgetCameraBarcodeScannerWidget.prototype.tryCameraPreview = function() {
};

JkWidgetCameraBarcodeScannerWidget.prototype.onReceiveDetection = function(bcobj) {
	if(!(bcobj != null)) {
		return;
	}
	if(this.widgetOnBarcodesDetectedHandler != null) {
		this.widgetOnBarcodesDetectedHandler(bcobj);
	}
};

JkWidgetCameraBarcodeScannerWidget.prototype.isBarcodeScanningAllowed = function() {
	return true;
};

JkWidgetCameraBarcodeScannerWidget.prototype.getWidgetOnBarcodesDetectedHandler = function() {
	return this.widgetOnBarcodesDetectedHandler;
};

JkWidgetCameraBarcodeScannerWidget.prototype.setWidgetOnBarcodesDetectedHandler = function(v) {
	this.widgetOnBarcodesDetectedHandler = v;
	return this;
};

JkWidgetCameraBarcodeScannerWidget.prototype.getWidgetPrimaryCamera = function() {
	return this.widgetPrimaryCamera;
};

JkWidgetCameraBarcodeScannerWidget.prototype.setWidgetPrimaryCamera = function(v) {
	this.widgetPrimaryCamera = v;
	return this;
};

JkWidgetCameraBarcodeScannerWidget.prototype.getWidgetFormat = function() {
	return this.widgetFormat;
};

JkWidgetCameraBarcodeScannerWidget.prototype.setWidgetFormat = function(v) {
	this.widgetFormat = v;
	return this;
};

JkWidgetCameraBarcodeScannerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCameraBarcodeScannerWidget"] === true;
};

JkWidgetCameraBarcodeScannerWidget.CAMERA_BACK = 0;
JkWidgetCameraBarcodeScannerWidget.CAMERA_FRONT = 1;
JkWidgetCameraBarcodeScannerWidget.FORMAT_ALL = 0;
JkWidgetCameraBarcodeScannerWidget.FORMAT_QRCODE = 1;
JkWidgetCameraBarcodeScannerWidget.FORMAT_EAN13 = 2;
JkWidgetCameraBarcodeScannerWidget.FORMAT_UPCA = 3;

let JkWidgetCameraCamera = function() {
	this.context = null;
};

JkWidgetCameraCamera.prototype._t = { "JkWidgetCameraCamera" : true };
JkWidgetCameraCamera.prototype._tobj = JkWidgetCameraCamera;

JkWidgetCameraCamera.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCameraCamera;
	return v.CTOR_JkWidgetCameraCamera_JkUiGuiApplicationContext(context);
};

JkWidgetCameraCamera.prototype.CTOR_JkWidgetCameraCamera_JkUiGuiApplicationContext = function(context) {
	this.context = null;
	this.context = context;
	return this;
};

JkWidgetCameraCamera.isSupported = function() {
	return false;
};

JkWidgetCameraCamera.prototype.takePicture = function(widget, callback) {
	var cb = callback;
	console.log("[jk.widget.camera.Camera.takePicture] (Camera.sling:252:3): Not implemented");
	if(cb != null) {
		cb(null, (JkLangError.forCode("not_supported", null)));
	}
};

JkWidgetCameraCamera.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCameraCamera"] === true;
};
