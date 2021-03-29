let JkWidgetSignatureSignatureWidget = function() {
	JkWidgetWidget.call(this);
	this.strokeColor = null;
	this.strokeWidth = 0.0;
};

JkWidgetSignatureSignatureWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetSignatureSignatureWidget.prototype.constructor = JkWidgetSignatureSignatureWidget;
JkWidgetSignatureSignatureWidget.prototype._t = {
	"JkWidgetSignatureSignatureWidget" : true,
	"JkWidgetWidget" : true
};
JkWidgetSignatureSignatureWidget.prototype._tobj = JkWidgetSignatureSignatureWidget;

JkWidgetSignatureSignatureWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetSignatureSignatureWidget;
	return v.CTOR_JkWidgetSignatureSignatureWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetSignatureSignatureWidget.prototype.CTOR_JkWidgetSignatureSignatureWidget_JkUiGuiApplicationContext = function(ctx) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.strokeWidth = 0.0;
	this.strokeColor = null;
	this.setStrokeColor((JkGfxColor.black()));
	this.setStrokeWidth(2.0);
	return this;
};

JkWidgetSignatureSignatureWidget.prototype.prepareElement = function(element) {
	JkWidgetWidget.prototype.prepareElement.call(this, element);
	JkUiHTMLDOM.setStyle(element, "box-sizing", "border-box");
};

JkWidgetSignatureSignatureWidget.prototype.setStrokeColor = function(color) {
	this.strokeColor = color;
	console.log("[jk.widget.signature.SignatureWidget.setStrokeColor] (SignatureWidget.sling:450:3): Not implemented.");
};

JkWidgetSignatureSignatureWidget.prototype.setStrokeWidth = function(width) {
	this.strokeWidth = width;
	console.log("[jk.widget.signature.SignatureWidget.setStrokeWidth] (SignatureWidget.sling:470:3): Not implemented.");
};

JkWidgetSignatureSignatureWidget.prototype.clear = function() {
	console.log("[jk.widget.signature.SignatureWidget.clear] (SignatureWidget.sling:505:3): Not implemented.");
};

JkWidgetSignatureSignatureWidget.prototype.getSignatureAsImage = function() {
	var byteArray = null;
	console.log("[jk.widget.signature.SignatureWidget.getSignatureAsImage] (SignatureWidget.sling:540:3): Not implemented.");
	return null;
};

JkWidgetSignatureSignatureWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetSignatureSignatureWidget"] === true;
};
