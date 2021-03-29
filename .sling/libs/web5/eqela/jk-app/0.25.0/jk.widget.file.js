let JkWidgetFileFileSelector = function() {
	this.inputElement = null;
	this.context = null;
};

JkWidgetFileFileSelector.prototype._t = { "JkWidgetFileFileSelector" : true };
JkWidgetFileFileSelector.prototype._tobj = JkWidgetFileFileSelector;

JkWidgetFileFileSelector.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetFileFileSelector;
	return v.CTOR_JkWidgetFileFileSelector_JkUiGuiApplicationContext(context);
};

JkWidgetFileFileSelector.prototype.CTOR_JkWidgetFileFileSelector_JkUiGuiApplicationContext = function(context) {
	this.context = null;
	this.inputElement = null;
	this.context = context;
	this.inputElement = JkUiHTMLDOM.createElement("input");
	JkUiHTMLDOM.setAttribute(this.inputElement, "type", "file");
	return this;
};

JkWidgetFileFileSelector.prototype.openFileDialog = function(widget, type, callback) {
	var cb = callback;
	JkUiHTMLDOM.setAttribute(this.inputElement, "accept", type);
	var elm = this.inputElement;
	var fileHandler = function() {
		var files = elm.files;
		if(typeof files === "undefined" || files === null) {
			console.log("undefined files");
			return;
		}
		var file = files[0];
		if(typeof file === "undefined" || file === null) {
			console.log("undefined file");
			return;
		}
		var mimeType = file.type;
		var path = elm.value;
		var filename = path.substring(path.lastIndexOf("\\")+1);
		var reader = new FileReader();
		reader.onload = function(res) {
			if(reader.readyState === 2) {
				var result = res.target.result;
				if(cb != null) {
					JkUiHTMLDOM.remove(elm);
					if(result === null) {
						cb(null, null, Error.forCode("noFileData"));
					}
					else {
						cb(result, filename, mimeType, null);
					}
					elm.removeEventListener("change", fileHandler);
				}
			}
		};
		reader.readAsArrayBuffer(file);
	};
	elm.addEventListener("change", fileHandler);
	elm.click();
	;
};

JkWidgetFileFileSelector.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetFileFileSelector"] === true;
};

let JkWidgetFileFileInputWidget = function() {
	JkWidgetWidget.call(this);
	this.widgetContext = null;
	this.widgetType = null;
	this.widgetListener = null;
};

JkWidgetFileFileInputWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetFileFileInputWidget.prototype.constructor = JkWidgetFileFileInputWidget;
JkWidgetFileFileInputWidget.prototype._t = {
	"JkWidgetWidget" : true,
	"JkWidgetFileFileInputWidget" : true
};
JkWidgetFileFileInputWidget.prototype._tobj = JkWidgetFileFileInputWidget;

JkWidgetFileFileInputWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetFileFileInputWidget;
	return v.CTOR_JkWidgetFileFileInputWidget_JkUiGuiApplicationContext(context);
};

JkWidgetFileFileInputWidget.prototype.CTOR_JkWidgetFileFileInputWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.widgetListener = null;
	this.widgetType = null;
	this.widgetContext = null;
	this.widgetContext = context;
	return this;
};

JkWidgetFileFileInputWidget.forType = function(context, type) {
	var v = JkWidgetFileFileInputWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetType(type);
	return v;
};

JkWidgetFileFileInputWidget.prototype.createElement = function() {
	return JkUiHTMLDOM.createElement("input");
};

JkWidgetFileFileInputWidget.prototype.prepareElement = function(v) {
	JkWidgetWidget.prototype.prepareElement.call(this, v);
	JkUiHTMLDOM.setAttribute(v, "type", "file");
};

JkWidgetFileFileInputWidget.prototype.setWidgetType = function(type) {
	this.widgetType = type;
	JkUiHTMLDOM.setAttribute(this.element, "accept", (JkLangString.safeString(type)) + ("/*"));
};

JkWidgetFileFileInputWidget.prototype.getWidgetType = function() {
	return this.widgetType;
};

JkWidgetFileFileInputWidget.prototype.setWidgetListener = function(event, listener) {
	this.widgetListener = listener;
	JkUiHTMLDOM.addEventListener(this.element, event, listener);
};

JkWidgetFileFileInputWidget.prototype.getWidgetFileName = function() {
	var str = JkUiHTMLDOM.getValue(this.element);
	var x = JkLangString.getLastIndexOfString(str, "\\", (JkLangString.getLength(str)));
	var fileName = JkLangString.getEndOfString(str, (x + 1));
	return fileName;
};

JkWidgetFileFileInputWidget.prototype.getWidgetFileMimeType = function() {
	console.log("[jk.widget.file.FileInputWidget.getWidgetFileMimeType] (FileInputWidget.sling:126:2): Not implemented");
	return null;
};

JkWidgetFileFileInputWidget.prototype.getWidgetFileContents = function() {
	console.log("[jk.widget.file.FileInputWidget.getWidgetFileContents] (FileInputWidget.sling:132:2): Not implemented");
	return null;
};

JkWidgetFileFileInputWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetFileFileInputWidget"] === true;
};
