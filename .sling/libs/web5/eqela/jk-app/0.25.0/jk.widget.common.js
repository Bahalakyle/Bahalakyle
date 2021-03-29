let JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget = function() {
	JkWidgetContainerWidget.call(this);
	this.widget = null;
};

JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetContainerWidget.prototype);
JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget.prototype.constructor = JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget;
JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget.prototype._tobj = JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget;

JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget;
	return v.CTOR_JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget.prototype.CTOR_JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget_JkUiGuiApplicationContext = function(context) {
	this.widget = null;
	if(JkWidgetContainerWidget.prototype.CTOR_JkWidgetContainerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget.prototype.onWidgetHeightChanged = function(height) {
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.move(child, (JkWidgetWidget.getAbsoluteX(this.widget)), (JkWidgetWidget.getAbsoluteY(this.widget)));
			}
		}
	}
};

JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.layout(child, (JkWidgetWidget.getWidth(this.widget)), false);
				JkWidgetWidget.move(child, (JkWidgetWidget.getAbsoluteX(this.widget)), (JkWidgetWidget.getAbsoluteY(this.widget)));
			}
		}
	}
	JkWidgetWidget.setLayoutSize(this, widthConstraint, (JkWidgetWidget.getHeight(this)));
};

JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget.prototype.getWidget = function() {
	return this.widget;
};

JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget.prototype.setWidget = function(v) {
	this.widget = v;
	return this;
};

JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget"] === true;
};

let JkWidgetCommonTextInputWidget = function() {
	JkWidgetWidget.call(this);
	this.widgetContext = null;
	this.widgetType = 0;
	this.widgetPlaceholder = null;
	this.widgetText = null;
	this.widgetFontUnderline = false;
	this.widgetFontItalic = false;
	this.widgetFontBold = false;
	this.widgetTextAlign = 0;
	this.widgetPaddingLeft = 0;
	this.widgetPaddingTop = 0;
	this.widgetPaddingRight = 0;
	this.widgetPaddingBottom = 0;
	this.widgetFontFamily = null;
	this.widgetFontResource = null;
	this.widgetFontSize = 0.0;
	this.widgetTextColor = null;
	this.widgetBackgroundColor = null;
	this.widgetIsEnabled = true;
	this.widgetTextChangeHandler = null;
	this.widgetOnEnterKeyPressed = null;
	this.widgetOnArrowUpKeyPressed = null;
	this.widgetOnArrowDownKeyPressed = null;
	this.widgetOnFocusHandler = null;
	this.widgetOnLoseFocusHandler = null;
};

JkWidgetCommonTextInputWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetCommonTextInputWidget.prototype.constructor = JkWidgetCommonTextInputWidget;
JkWidgetCommonTextInputWidget.prototype._t = {
	"JkWidgetWidgetWithValue" : true,
	"JkWidgetCommonTextInputWidget" : true,
	"JkWidgetWidget" : true
};
JkWidgetCommonTextInputWidget.prototype._tobj = JkWidgetCommonTextInputWidget;

JkWidgetCommonTextInputWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonTextInputWidget;
	return v.CTOR_JkWidgetCommonTextInputWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonTextInputWidget.prototype.CTOR_JkWidgetCommonTextInputWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.widgetOnLoseFocusHandler = null;
	this.widgetOnFocusHandler = null;
	this.widgetOnArrowDownKeyPressed = null;
	this.widgetOnArrowUpKeyPressed = null;
	this.widgetOnEnterKeyPressed = null;
	this.widgetTextChangeHandler = null;
	this.widgetIsEnabled = true;
	this.widgetBackgroundColor = null;
	this.widgetTextColor = null;
	this.widgetFontSize = 0.0;
	this.widgetFontResource = null;
	this.widgetFontFamily = null;
	this.widgetPaddingBottom = 0;
	this.widgetPaddingRight = 0;
	this.widgetPaddingTop = 0;
	this.widgetPaddingLeft = 0;
	this.widgetTextAlign = 0;
	this.widgetFontBold = false;
	this.widgetFontItalic = false;
	this.widgetFontUnderline = false;
	this.widgetText = null;
	this.widgetPlaceholder = null;
	this.widgetType = 0;
	this.widgetContext = null;
	JkUiHTMLDOM.setStyle(this.element, "outline-width", "0");
	this.widgetContext = context;
	this.setWidgetStyle("TextInputWidget");
	return this;
};

JkWidgetCommonTextInputWidget.forType = function(context, type, placeholder) {
	var v = JkWidgetCommonTextInputWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetType(type);
	v.setWidgetPlaceholder(placeholder);
	return v;
};

JkWidgetCommonTextInputWidget.prototype.createElement = function() {
	return JkUiHTMLDOM.createElement("input");
};

JkWidgetCommonTextInputWidget.prototype.prepareElement = function(v) {
	JkWidgetWidget.prototype.prepareElement.call(this, v);
	JkUiHTMLDOM.setStyle(v, "box-sizing", "border-box");
	JkUiHTMLDOM.setStyle(v, "border", "0");
	JkUiHTMLDOM.addEventListener(this.element, "input", (function() {
		this.onChangeListener();
	}.bind(this)));
	JkUiHTMLDOM.addEventListener(this.element, "focus", (function() {
		this.onFocusListener();
	}.bind(this)));
	JkUiHTMLDOM.addEventListener(this.element, "blur", (function() {
		this.onLoseFocusListener();
	}.bind(this)));
	this.element.addEventListener("keydown", function(e) {
		var k = e.which || e.keyCode;
		if(k == 13) {
			this.onEnterKeyListener();
		}
		else if(k == 38) {
			this.onArrowUpKeyListener();
		}
		else if(k == 40) {
			this.onArrowDownKeyListener();
		}
	}.bind(this));
	;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetStyle = function(style) {
	this.widgetFontFamily = this.widgetContext.getStyleString(style, "fontFamily", null);
	if(JkLangString.isEmpty(this.widgetFontFamily)) {
		this.widgetFontFamily = "Arial";
	}
	this.widgetFontSize = this.widgetContext.getStylePixels(style, "fontSize", null);
	if(this.widgetFontSize < 1.0) {
		this.widgetFontSize = this.widgetContext.getHeightValue("3mm");
	}
	var fr = this.widgetContext.getStyleString(style, "fontResource", null);
	if(JkLangString.isNotEmpty(fr)) {
		this.setWidgetFontResource(fr);
	}
	this.widgetTextColor = this.widgetContext.getStyleColor(style, "textColor", null);
	this.widgetBackgroundColor = this.widgetContext.getStyleColor(style, "backgroundColor", null);
	this.setWidgetPadding1((this.widgetContext.getStylePixels(style, "padding", null)));
	this.updateWidgetFont();
	this.updateWidgetColors();
	return this;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetTextColor = function(color) {
	this.widgetTextColor = color;
	this.updateWidgetColors();
	return this;
};

JkWidgetCommonTextInputWidget.prototype.getWidgetTextColor = function() {
	return this.widgetTextColor;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetBackgroundColor = function(color) {
	this.widgetBackgroundColor = color;
	this.updateWidgetColors();
	return this;
};

JkWidgetCommonTextInputWidget.prototype.getWidgetBackgroundColor = function() {
	return this.widgetBackgroundColor;
};

JkWidgetCommonTextInputWidget.prototype.updateWidgetColors = function() {
	var textColor = this.widgetTextColor;
	if(textColor == null) {
		if(this.widgetBackgroundColor != null) {
			if(this.widgetBackgroundColor.isLightColor()) {
				textColor = JkGfxColor.black();
			}
			else {
				textColor = JkGfxColor.white();
			}
		}
		else {
			textColor = JkGfxColor.black();
		}
	}
	if(this.widgetBackgroundColor == null) {
		JkUiHTMLDOM.setStyle(this.element, "background-color", "rgba(0,0,0,0)");
	}
	else {
		JkUiHTMLDOM.setStyle(this.element, "background-color", (JkUiHTMLDOM.colorToRGBA(this.widgetBackgroundColor)));
	}
	JkUiHTMLDOM.setStyle(this.element, "color", (JkUiHTMLDOM.colorToRGBA(textColor)));
};

JkWidgetCommonTextInputWidget.prototype.setWidgetType = function(type) {
	this.widgetType = type;
	if(this.widgetType == JkWidgetCommonTextInputWidget.TYPE_DEFAULT) {
		JkUiHTMLDOM.setAttribute(this.element, "type", "text");
	}
	else if(this.widgetType == JkWidgetCommonTextInputWidget.TYPE_NONASSISTED) {
		JkUiHTMLDOM.setAttribute(this.element, "type", "text");
	}
	else if(this.widgetType == JkWidgetCommonTextInputWidget.TYPE_NAME) {
		JkUiHTMLDOM.setAttribute(this.element, "type", "text");
	}
	else if(this.widgetType == JkWidgetCommonTextInputWidget.TYPE_EMAIL_ADDRESS) {
		JkUiHTMLDOM.setAttribute(this.element, "type", "email");
	}
	else if(this.widgetType == JkWidgetCommonTextInputWidget.TYPE_URL) {
		JkUiHTMLDOM.setAttribute(this.element, "type", "url");
	}
	else if(this.widgetType == JkWidgetCommonTextInputWidget.TYPE_PHONE_NUMBER) {
		JkUiHTMLDOM.setAttribute(this.element, "type", "tel");
	}
	else if(this.widgetType == JkWidgetCommonTextInputWidget.TYPE_PASSWORD) {
		JkUiHTMLDOM.setAttribute(this.element, "type", "password");
	}
	else if(this.widgetType == JkWidgetCommonTextInputWidget.TYPE_INTEGER) {
		JkUiHTMLDOM.setAttribute(this.element, "type", "number");
	}
	else if(this.widgetType == JkWidgetCommonTextInputWidget.TYPE_FLOAT) {
		JkUiHTMLDOM.setAttribute(this.element, "type", "text");
	}
	else if(this.widgetType == JkWidgetCommonTextInputWidget.TYPE_STREET_ADDRESS) {
		JkUiHTMLDOM.setAttribute(this.element, "type", "text");
	}
	else {
		JkUiHTMLDOM.setAttribute(this.element, "type", "text");
	}
	this.updateWidgetFont();
	return this;
};

JkWidgetCommonTextInputWidget.prototype.getWidgetType = function() {
	return this.widgetType;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetText = function(text) {
	this.widgetText = text;
	this.element.value = text;
	;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonTextInputWidget.prototype.getWidgetText = function() {
	return JkUiHTMLDOM.getValue(this.element);
};

JkWidgetCommonTextInputWidget.prototype.setWidgetPlaceholder = function(placeholder) {
	this.widgetPlaceholder = placeholder;
	JkUiHTMLDOM.setAttribute(this.element, "placeholder", placeholder);
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonTextInputWidget.prototype.getWidgetPlaceholder = function() {
	return this.widgetPlaceholder;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetFontBold = function(bold) {
	this.widgetFontBold = bold;
	this.updateWidgetFont();
};

JkWidgetCommonTextInputWidget.prototype.setWidgetFontUnderline = function(underline) {
	this.widgetFontUnderline = underline;
	this.updateWidgetFont();
};

JkWidgetCommonTextInputWidget.prototype.setWidgetFontItalic = function(italic) {
	this.widgetFontItalic = italic;
	this.updateWidgetFont();
};

JkWidgetCommonTextInputWidget.prototype.getWidgetFontUnderline = function() {
	return this.widgetFontUnderline;
};

JkWidgetCommonTextInputWidget.prototype.getWidgetFontItalic = function() {
	return this.widgetFontItalic;
};

JkWidgetCommonTextInputWidget.prototype.getWidgetFontBold = function() {
	return this.widgetFontBold;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetPadding1 = function(padding) {
	this.setWidgetPadding3(padding, padding, padding, padding);
};

JkWidgetCommonTextInputWidget.prototype.setWidgetPadding2 = function(x, y) {
	this.setWidgetPadding3(x, y, x, y);
};

JkWidgetCommonTextInputWidget.prototype.setWidgetPadding3 = function(l, t, r, b) {
	if(l < 0 || t < 0 || r < 0 || b < 0) {
		return this;
	}
	if(this.widgetPaddingLeft == l && this.widgetPaddingTop == t && this.widgetPaddingRight == r && this.widgetPaddingBottom == b) {
		return this;
	}
	this.widgetPaddingLeft = l;
	this.widgetPaddingTop = t;
	this.widgetPaddingRight = r;
	this.widgetPaddingBottom = b;
	this.updateWidgetPadding();
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonTextInputWidget.prototype.updateWidgetPadding = function() {
	JkUiHTMLDOM.setStyle(this.element, "padding", (JkLangString.safeString((JkLangString.forInteger(this.widgetPaddingTop)))) + ("px ") + (JkLangString.safeString((JkLangString.forInteger(this.widgetPaddingRight)))) + ("px ") + (JkLangString.safeString((JkLangString.forInteger(this.widgetPaddingBottom)))) + ("px ") + (JkLangString.safeString((JkLangString.forInteger(this.widgetPaddingLeft)))) + ("px"));
};

JkWidgetCommonTextInputWidget.prototype.setWidgetFontFamily = function(family) {
	this.widgetFontFamily = family;
	this.updateWidgetFont();
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetFontResource = function(res) {
	this.widgetFontResource = res;
	this.updateWidgetFont();
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetFontSize = function(fontSize) {
	this.widgetFontSize = fontSize;
	this.updateWidgetFont();
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonTextInputWidget.prototype.updateWidgetFont = function() {
	JkUiHTMLDOM.setFontFamily(this.element, this.widgetFontFamily);
	JkUiHTMLDOM.setStyle(this.element, "font-size", (JkLangString.safeString((JkLangString.forDouble(this.widgetFontSize)))) + ("px"));
	if(this.widgetFontBold) {
		JkUiHTMLDOM.setStyle(this.element, "font-weight", "bold");
	}
	if(this.widgetFontItalic) {
		JkUiHTMLDOM.setStyle(this.element, "font-style", "italic");
	}
	if(this.widgetFontUnderline) {
		JkUiHTMLDOM.setStyle(this.element, "text-decoration", "underline");
	}
};

JkWidgetCommonTextInputWidget.prototype.setWidgetIsEnabled = function(v) {
	this.widgetIsEnabled = v;
	if(this.widgetIsEnabled) {
		JkUiHTMLDOM.setAttribute(this.element, "disabled", null);
	}
	else {
		JkUiHTMLDOM.setAttribute(this.element, "disabled", "disabled");
	}
};

JkWidgetCommonTextInputWidget.prototype.getWidgetIsEnabled = function() {
	return this.widgetIsEnabled;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetValue = function(value) {
	var v = JkLangString.asString(value);
	if(!(v != null)) {
		v = "";
	}
	this.setWidgetText(v);
};

JkWidgetCommonTextInputWidget.prototype.getWidgetValue = function() {
	return this.getWidgetText();
};

JkWidgetCommonTextInputWidget.prototype.onChangeListener = function() {
	if(this.widgetTextChangeHandler != null) {
		this.widgetTextChangeHandler();
	}
};

JkWidgetCommonTextInputWidget.prototype.onEnterKeyListener = function() {
	if(this.widgetOnEnterKeyPressed != null) {
		this.widgetOnEnterKeyPressed();
	}
};

JkWidgetCommonTextInputWidget.prototype.onArrowUpKeyListener = function() {
	if(this.widgetOnArrowUpKeyPressed != null) {
		this.widgetOnArrowUpKeyPressed();
	}
};

JkWidgetCommonTextInputWidget.prototype.onArrowDownKeyListener = function() {
	if(this.widgetOnArrowDownKeyPressed != null) {
		this.widgetOnArrowDownKeyPressed();
	}
};

JkWidgetCommonTextInputWidget.prototype.onFocusListener = function() {
	if(this.widgetOnFocusHandler != null) {
		this.widgetOnFocusHandler();
	}
};

JkWidgetCommonTextInputWidget.prototype.onLoseFocusListener = function() {
	if(this.widgetOnLoseFocusHandler != null) {
		this.widgetOnLoseFocusHandler();
	}
};

JkWidgetCommonTextInputWidget.prototype.focus = function() {
	JkUiHTMLDOM.setFocus(this.element);
};

JkWidgetCommonTextInputWidget.prototype.setWidgetTextAlign = function(align) {
	this.widgetTextAlign = align;
	if(align == JkWidgetCommonTextInputWidget.ALIGN_LEFT) {
		JkUiHTMLDOM.setStyle(this.element, "text-align", "left");
	}
	else if(align == JkWidgetCommonTextInputWidget.ALIGN_RIGHT) {
		JkUiHTMLDOM.setStyle(this.element, "text-align", "right");
	}
	else {
		JkUiHTMLDOM.setStyle(this.element, "text-align", "left");
	}
	return this;
};

JkWidgetCommonTextInputWidget.prototype.getWidgetTextAlign = function() {
	return this.widgetTextAlign;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetMaxLength = function(v) {
	JkUiHTMLDOM.setAttribute(this.element, "maxlength", (JkLangString.forInteger(v)));
	return this;
};

JkWidgetCommonTextInputWidget.prototype.getWidgetTextChangeHandler = function() {
	return this.widgetTextChangeHandler;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetTextChangeHandler = function(v) {
	this.widgetTextChangeHandler = v;
	return this;
};

JkWidgetCommonTextInputWidget.prototype.getWidgetOnEnterKeyPressed = function() {
	return this.widgetOnEnterKeyPressed;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetOnEnterKeyPressed = function(v) {
	this.widgetOnEnterKeyPressed = v;
	return this;
};

JkWidgetCommonTextInputWidget.prototype.getWidgetOnArrowUpKeyPressed = function() {
	return this.widgetOnArrowUpKeyPressed;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetOnArrowUpKeyPressed = function(v) {
	this.widgetOnArrowUpKeyPressed = v;
	return this;
};

JkWidgetCommonTextInputWidget.prototype.getWidgetOnArrowDownKeyPressed = function() {
	return this.widgetOnArrowDownKeyPressed;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetOnArrowDownKeyPressed = function(v) {
	this.widgetOnArrowDownKeyPressed = v;
	return this;
};

JkWidgetCommonTextInputWidget.prototype.getWidgetOnFocusHandler = function() {
	return this.widgetOnFocusHandler;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetOnFocusHandler = function(v) {
	this.widgetOnFocusHandler = v;
	return this;
};

JkWidgetCommonTextInputWidget.prototype.getWidgetOnLoseFocusHandler = function() {
	return this.widgetOnLoseFocusHandler;
};

JkWidgetCommonTextInputWidget.prototype.setWidgetOnLoseFocusHandler = function(v) {
	this.widgetOnLoseFocusHandler = v;
	return this;
};

JkWidgetCommonTextInputWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonTextInputWidget"] === true;
};

JkWidgetCommonTextInputWidget.TYPE_DEFAULT = 0;
JkWidgetCommonTextInputWidget.TYPE_NONASSISTED = 1;
JkWidgetCommonTextInputWidget.TYPE_NAME = 2;
JkWidgetCommonTextInputWidget.TYPE_EMAIL_ADDRESS = 3;
JkWidgetCommonTextInputWidget.TYPE_URL = 4;
JkWidgetCommonTextInputWidget.TYPE_PHONE_NUMBER = 5;
JkWidgetCommonTextInputWidget.TYPE_PASSWORD = 6;
JkWidgetCommonTextInputWidget.TYPE_INTEGER = 7;
JkWidgetCommonTextInputWidget.TYPE_FLOAT = 8;
JkWidgetCommonTextInputWidget.TYPE_STREET_ADDRESS = 9;
JkWidgetCommonTextInputWidget.ALIGN_LEFT = 0;
JkWidgetCommonTextInputWidget.ALIGN_RIGHT = 1;
JkWidgetCommonTextInputWidget.ALIGN_CENTER = 2;

let JkWidgetCommonVerticalScrollerWithToolbarWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.autohideToolbar = false;
	this.widgetContent = null;
	this.widgetToolbar = null;
	this.shown = true;
};

JkWidgetCommonVerticalScrollerWithToolbarWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonVerticalScrollerWithToolbarWidget.prototype.constructor = JkWidgetCommonVerticalScrollerWithToolbarWidget;
JkWidgetCommonVerticalScrollerWithToolbarWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCommonVerticalScrollerWithToolbarWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonVerticalScrollerWithToolbarWidget.prototype._tobj = JkWidgetCommonVerticalScrollerWithToolbarWidget;

JkWidgetCommonVerticalScrollerWithToolbarWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonVerticalScrollerWithToolbarWidget;
	return v.CTOR_JkWidgetCommonVerticalScrollerWithToolbarWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonVerticalScrollerWithToolbarWidget.prototype.CTOR_JkWidgetCommonVerticalScrollerWithToolbarWidget_JkUiGuiApplicationContext = function(context) {
	this.shown = true;
	this.widgetToolbar = null;
	this.widgetContent = null;
	this.autohideToolbar = false;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonVerticalScrollerWithToolbarWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	var scroller = JkWidgetVerticalScrollerWidget.forWidget(this.context, this.widgetContent);
	scroller.setOnScrolledHandler((function(direction1) {
		if(this.autohideToolbar) {
			if(direction1 == 0 && this.shown == true) {
				this.hideToolbar();
				this.shown = false;
			}
			else if(direction1 == 1 && this.shown == false) {
				this.showToolbar();
				this.shown = true;
			}
		}
	}.bind(this)));
	if(this.autohideToolbar) {
		this.addWidget(scroller);
		var align = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(this.context);
		align.addWidget1(this.widgetToolbar, 0, 1.0, true);
		this.addWidget(align);
	}
	else {
		var vbox = JkWidgetVerticalBoxWidget.forContext(this.context, 0, 0);
		vbox.addWidget1(scroller, 1.0);
		vbox.addWidget(this.widgetToolbar);
		this.addWidget(vbox);
	}
};

JkWidgetCommonVerticalScrollerWithToolbarWidget.prototype.showToolbar = function() {
	var sy = JkWidgetWidget.getHeight(this.widgetToolbar);
	var y = JkWidgetWidget.getY(this.widgetToolbar);
	var targety = JkWidgetWidget.getHeight(this) - sy;
	var anim = JkWidgetWidgetAnimation.forDuration(this.context, 250);
	anim.addCallback((function(completion1) {
		var dy = y - ~(~(completion1 * sy));
		if(dy < targety) {
			dy = targety;
		}
		JkWidgetWidget.move(this.widgetToolbar, 0, dy);
	}.bind(this)));
	anim.setEndListener((function() {
		this.shown = true;
	}.bind(this)));
	anim.start();
};

JkWidgetCommonVerticalScrollerWithToolbarWidget.prototype.hideToolbar = function() {
	var sy = JkWidgetWidget.getHeight(this.widgetToolbar);
	var y = JkWidgetWidget.getY(this.widgetToolbar);
	var targety = JkWidgetWidget.getHeight(this);
	var anim = JkWidgetWidgetAnimation.forDuration(this.context, 250);
	anim.addCallback((function(completion1) {
		var dy = y + ~(~(completion1 * sy));
		if(dy > targety) {
			dy = targety;
		}
		JkWidgetWidget.move(this.widgetToolbar, 0, dy);
	}.bind(this)));
	anim.setEndListener((function() {
		this.shown = false;
	}.bind(this)));
	anim.start();
};

JkWidgetCommonVerticalScrollerWithToolbarWidget.prototype.getAutohideToolbar = function() {
	return this.autohideToolbar;
};

JkWidgetCommonVerticalScrollerWithToolbarWidget.prototype.setAutohideToolbar = function(v) {
	this.autohideToolbar = v;
	return this;
};

JkWidgetCommonVerticalScrollerWithToolbarWidget.prototype.getWidgetContent = function() {
	return this.widgetContent;
};

JkWidgetCommonVerticalScrollerWithToolbarWidget.prototype.setWidgetContent = function(v) {
	this.widgetContent = v;
	return this;
};

JkWidgetCommonVerticalScrollerWithToolbarWidget.prototype.getWidgetToolbar = function() {
	return this.widgetToolbar;
};

JkWidgetCommonVerticalScrollerWithToolbarWidget.prototype.setWidgetToolbar = function(v) {
	this.widgetToolbar = v;
	return this;
};

JkWidgetCommonVerticalScrollerWithToolbarWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonVerticalScrollerWithToolbarWidget"] === true;
};

let JkWidgetCommonTopMarginLayerWidget = function() {
	JkWidgetLayerWidget.call(this);
};

JkWidgetCommonTopMarginLayerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonTopMarginLayerWidget.prototype.constructor = JkWidgetCommonTopMarginLayerWidget;
JkWidgetCommonTopMarginLayerWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetCommonTopMarginLayerWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonTopMarginLayerWidget.prototype._tobj = JkWidgetCommonTopMarginLayerWidget;

JkWidgetCommonTopMarginLayerWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonTopMarginLayerWidget;
	return v.CTOR_JkWidgetCommonTopMarginLayerWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonTopMarginLayerWidget.prototype.CTOR_JkWidgetCommonTopMarginLayerWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonTopMarginLayerWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	this.widgetMarginTop = this.context.getScreenTopMargin();
	JkWidgetLayerWidget.prototype.computeWidgetLayout.call(this, widthConstraint);
};

JkWidgetCommonTopMarginLayerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonTopMarginLayerWidget"] === true;
};

let JkWidgetCommonSidebarWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetBackgroundColor = null;
	this.defaultActionItemWidgetBackgroundColor = null;
	this.defaultActionItemWidgetTextColor = null;
	this.defaultLabelItemWidgetBackgroundColor = null;
	this.defaultLabelItemWidgetTextColor = null;
	this.widgetItems = null;
	this.widgetScrollEnabled = true;
};

JkWidgetCommonSidebarWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonSidebarWidget.prototype.constructor = JkWidgetCommonSidebarWidget;
JkWidgetCommonSidebarWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetCommonSidebarWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonSidebarWidget.prototype._tobj = JkWidgetCommonSidebarWidget;

JkWidgetCommonSidebarWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonSidebarWidget;
	return v.CTOR_JkWidgetCommonSidebarWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonSidebarWidget.prototype.CTOR_JkWidgetCommonSidebarWidget_JkUiGuiApplicationContext = function(context) {
	this.widgetScrollEnabled = true;
	this.widgetItems = null;
	this.defaultLabelItemWidgetTextColor = null;
	this.defaultLabelItemWidgetBackgroundColor = null;
	this.defaultActionItemWidgetTextColor = null;
	this.defaultActionItemWidgetBackgroundColor = null;
	this.widgetBackgroundColor = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonSidebarWidget.forItems = function(ctx, items, color) {
	var v = JkWidgetCommonSidebarWidget.NEW_JkUiGuiApplicationContext(ctx);
	v.setWidgetBackgroundColor(color);
	v.setWidgetItems(items);
	return v;
};

JkWidgetCommonSidebarWidget.prototype.addToWidgetItems = function(widget) {
	if(!(widget != null)) {
		return;
	}
	if(this.widgetItems == null) {
		this.widgetItems = new Array;
	}
	this.widgetItems.push(widget);
};

JkWidgetCommonSidebarWidget.prototype.determineBackgroundColor = function() {
	var wc = this.widgetBackgroundColor;
	if(wc == null) {
		wc = JkGfxColor.white();
	}
	return wc;
};

JkWidgetCommonSidebarWidget.prototype.determineTextColor = function(backgroundColor, textColor, defaultTextColor, lowerBackgroundColor) {
	var tc = textColor;
	if(tc == null) {
		tc = defaultTextColor;
	}
	if(tc == null) {
		var cc = lowerBackgroundColor;
		if(cc == null) {
			cc = this.determineBackgroundColor();
		}
		if(cc.isDarkColor()) {
			tc = JkGfxColor.white();
		}
		else {
			tc = JkGfxColor.black();
		}
	}
	return tc;
};

JkWidgetCommonSidebarWidget.prototype.addLabelItem = function(text, bold, backgroundColor, textColor) {
	var v = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	var bgc = backgroundColor;
	if(bgc == null) {
		bgc = this.defaultLabelItemWidgetBackgroundColor;
	}
	var tc = this.determineTextColor(backgroundColor, textColor, this.defaultLabelItemWidgetTextColor, bgc);
	if(bgc != null) {
		v.addWidget((JkWidgetCanvasWidget.forColor(this.context, bgc)));
	}
	var mm3 = this.context.getHeightValue("3mm");
	var lbl = JkWidgetLabelWidget.forText(this.context, text);
	lbl.setWidgetFontSize(mm3);
	lbl.setWidgetTextColor(tc);
	lbl.setWidgetFontBold(bold);
	v.addWidget((JkWidgetLayerWidget.forWidget(this.context, lbl, mm3)));
	this.addToWidgetItems(v);
	return this;
};

JkWidgetCommonSidebarWidget.prototype.addActionItem = function(text, handler, bold, backgroundColor, textColor) {
	var v = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	var bgc = backgroundColor;
	if(bgc == null) {
		bgc = this.defaultActionItemWidgetBackgroundColor;
	}
	var tc = this.determineTextColor(backgroundColor, textColor, this.defaultActionItemWidgetTextColor, bgc);
	if(bgc != null) {
		v.addWidget((JkWidgetCanvasWidget.forColor(this.context, bgc)));
	}
	var mm3 = this.context.getHeightValue("3mm");
	var lbl = JkWidgetLabelWidget.forText(this.context, text);
	lbl.setWidgetFontSize(mm3);
	lbl.setWidgetTextColor(tc);
	lbl.setWidgetFontBold(bold);
	v.addWidget((JkWidgetLayerWidget.forWidget(this.context, lbl, mm3)));
	if(handler != null) {
		JkWidgetWidget.setWidgetClickHandler(v, handler);
	}
	JkUiHTMLDOM.setStyle(v.element, "cursor", "pointer");
	this.addToWidgetItems(v);
	return this;
};

JkWidgetCommonSidebarWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	var wc = this.determineBackgroundColor();
	this.addWidget((JkWidgetCanvasWidget.forColor(this.context, wc)));
	var vbox = JkWidgetVerticalBoxWidget.forContext(this.context, 0, 0);
	if(JkLangVector.isEmpty(this.widgetItems) == false) {
		if(this.widgetItems != null) {
			var n = 0;
			var m = this.widgetItems.length;
			for(n = 0 ; n < m ; n++) {
				var item = this.widgetItems[n];
				if(item != null) {
					vbox.addWidget(item);
				}
			}
		}
	}
	this.applyScroller((JkWidgetLayerWidget.forWidgetAndWidth(this.context, vbox, (this.context.getWidthValue("50mm")))));
};

JkWidgetCommonSidebarWidget.prototype.applyScroller = function(widget) {
	if(!(widget != null)) {
		return;
	}
	if(!this.widgetScrollEnabled) {
		this.addWidget(widget);
	}
	else {
		var scroller = JkWidgetVerticalScrollerWidget.forWidget(this.context, widget);
		scroller.setWidgetScrollBarDisabled(true);
		this.addWidget(scroller);
	}
};

JkWidgetCommonSidebarWidget.prototype.getWidgetBackgroundColor = function() {
	return this.widgetBackgroundColor;
};

JkWidgetCommonSidebarWidget.prototype.setWidgetBackgroundColor = function(v) {
	this.widgetBackgroundColor = v;
	return this;
};

JkWidgetCommonSidebarWidget.prototype.getDefaultActionItemWidgetBackgroundColor = function() {
	return this.defaultActionItemWidgetBackgroundColor;
};

JkWidgetCommonSidebarWidget.prototype.setDefaultActionItemWidgetBackgroundColor = function(v) {
	this.defaultActionItemWidgetBackgroundColor = v;
	return this;
};

JkWidgetCommonSidebarWidget.prototype.getDefaultActionItemWidgetTextColor = function() {
	return this.defaultActionItemWidgetTextColor;
};

JkWidgetCommonSidebarWidget.prototype.setDefaultActionItemWidgetTextColor = function(v) {
	this.defaultActionItemWidgetTextColor = v;
	return this;
};

JkWidgetCommonSidebarWidget.prototype.getDefaultLabelItemWidgetBackgroundColor = function() {
	return this.defaultLabelItemWidgetBackgroundColor;
};

JkWidgetCommonSidebarWidget.prototype.setDefaultLabelItemWidgetBackgroundColor = function(v) {
	this.defaultLabelItemWidgetBackgroundColor = v;
	return this;
};

JkWidgetCommonSidebarWidget.prototype.getDefaultLabelItemWidgetTextColor = function() {
	return this.defaultLabelItemWidgetTextColor;
};

JkWidgetCommonSidebarWidget.prototype.setDefaultLabelItemWidgetTextColor = function(v) {
	this.defaultLabelItemWidgetTextColor = v;
	return this;
};

JkWidgetCommonSidebarWidget.prototype.getWidgetItems = function() {
	return this.widgetItems;
};

JkWidgetCommonSidebarWidget.prototype.setWidgetItems = function(v) {
	this.widgetItems = v;
	return this;
};

JkWidgetCommonSidebarWidget.prototype.getWidgetScrollEnabled = function() {
	return this.widgetScrollEnabled;
};

JkWidgetCommonSidebarWidget.prototype.setWidgetScrollEnabled = function(v) {
	this.widgetScrollEnabled = v;
	return this;
};

JkWidgetCommonSidebarWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonSidebarWidget"] === true;
};

let JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget = function() {
	JkWidgetHorizontalBoxWidget.call(this);
	this.widgetIndex = 0;
	this.widgetContainer = null;
	this.widgetColor = null;
	this.widgetOutLineColor = null;
	this.widgetText = null;
	this.widgetFontSize = 0;
	this.widgetFontResource = null;
	this.widgetFontFamily = null;
	this.widgetFontBold = false;
	this.widgetTextColor = null;
	this.enabled = true;
	this.radio = null;
	this.outline = null;
	this.canvas = null;
	this.label = null;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetHorizontalBoxWidget.prototype);
JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.constructor = JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget;
JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetHorizontalBoxWidget" : true
};
JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype._tobj = JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget;

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget;
	return v.CTOR_JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.CTOR_JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget_JkUiGuiApplicationContext = function(context) {
	this.label = null;
	this.canvas = null;
	this.outline = null;
	this.radio = null;
	this.enabled = true;
	this.widgetTextColor = null;
	this.widgetFontBold = false;
	this.widgetFontFamily = null;
	this.widgetFontResource = null;
	this.widgetFontSize = 0;
	this.widgetText = null;
	this.widgetOutLineColor = null;
	this.widgetColor = null;
	this.widgetContainer = null;
	this.widgetIndex = 0;
	if(JkWidgetHorizontalBoxWidget.prototype.CTOR_JkWidgetHorizontalBoxWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.initializeWidget = function() {
	JkWidgetHorizontalBoxWidget.prototype.initializeWidget.call(this);
	this.label.setWidgetText(this.widgetText);
	this.label.setWidgetFontSize(this.widgetFontSize);
	if(this.widgetFontResource != null) {
		this.label.setWidgetFontResource(this.widgetFontResource);
	}
	if(this.widgetFontFamily != null) {
		this.label.setWidgetFontFamily(this.widgetFontFamily);
	}
	if(this.widgetFontBold) {
		this.label.setWidgetFontBold(true);
	}
	if(this.widgetTextColor != null) {
		this.label.setWidgetTextColor(this.widgetTextColor);
	}
	if(!(this.widgetOutLineColor != null)) {
		this.widgetOutLineColor = JkGfxColor.black();
	}
	this.outline.setWidgetColor(this.widgetOutLineColor);
	this.outline.setWidgetRoundingRadius1((this.context.getHeightValue("2000um")));
	this.canvas.setWidgetColor((JkGfxColor.white()));
	this.canvas.setWidgetRoundingRadius1((this.context.getHeightValue("1500um")));
	JkWidgetWidget.setWidgetClickHandler(this.radio, (function() {
		if(this.enabled) {
			this.widgetContainer.updateSelectedWidget(this.widgetIndex);
		}
	}.bind(this)));
	JkWidgetWidget.setWidgetClickHandler(this.label, (function() {
		if(this.enabled) {
			this.widgetContainer.updateSelectedWidget(this.widgetIndex);
		}
	}.bind(this)));
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.setWidgetEnabled = function(v) {
	this.enabled = v;
	if(!this.enabled) {
		JkWidgetWidget.setAlpha(this, 0.5);
	}
	else {
		JkWidgetWidget.setAlpha(this, 1.0);
	}
	return this;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.onSelected = function() {
	if(!(this.widgetColor != null)) {
		this.widgetColor = JkGfxColor.black();
	}
	this.canvas.setWidgetColor(this.widgetColor);
	this.canvas.setWidgetRoundingRadius1((this.context.getHeightValue("1500um")));
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.onDeSelected = function() {
	this.canvas.setWidgetColor((JkGfxColor.white()));
	this.canvas.setWidgetRoundingRadius1((this.context.getHeightValue("1500um")));
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.createWidget = function() {
	JkWidgetHorizontalBoxWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.setWidgetSpacing((this.context.getHeightValue("2000um")));
	var widget = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.radio = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.radio.setWidgetHeightRequest((this.context.getHeightValue("4000um")));
	this.radio.setWidgetWidthRequest((this.context.getHeightValue("4000um")));
	this.outline = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.radio.addWidget(this.outline);
	var widget2 = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget2.setWidgetMargin((this.context.getHeightValue("500um")));
	this.canvas = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget2.addWidget(this.canvas);
	this.radio.addWidget(widget2);
	widget.addWidget(this.radio);
	this.addWidget(widget);
	this.label = JkWidgetLabelWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.addWidget(this.label);
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.getWidgetIndex = function() {
	return this.widgetIndex;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.setWidgetIndex = function(v) {
	this.widgetIndex = v;
	return this;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.getWidgetContainer = function() {
	return this.widgetContainer;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.setWidgetContainer = function(v) {
	this.widgetContainer = v;
	return this;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.getWidgetColor = function() {
	return this.widgetColor;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.setWidgetColor = function(v) {
	this.widgetColor = v;
	return this;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.getWidgetOutLineColor = function() {
	return this.widgetOutLineColor;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.setWidgetOutLineColor = function(v) {
	this.widgetOutLineColor = v;
	return this;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.getWidgetText = function() {
	return this.widgetText;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.setWidgetText = function(v) {
	this.widgetText = v;
	return this;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.getWidgetFontSize = function() {
	return this.widgetFontSize;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.setWidgetFontSize = function(v) {
	this.widgetFontSize = v;
	return this;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.getWidgetFontResource = function() {
	return this.widgetFontResource;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.setWidgetFontResource = function(v) {
	this.widgetFontResource = v;
	return this;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.getWidgetFontFamily = function() {
	return this.widgetFontFamily;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.setWidgetFontFamily = function(v) {
	this.widgetFontFamily = v;
	return this;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.getWidgetFontBold = function() {
	return this.widgetFontBold;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.setWidgetFontBold = function(v) {
	this.widgetFontBold = v;
	return this;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.getWidgetTextColor = function() {
	return this.widgetTextColor;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.prototype.setWidgetTextColor = function(v) {
	this.widgetTextColor = v;
	return this;
};

JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget"] === true;
};

let JkWidgetCommonRadioButtonWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.selectedWidgetIndex = -1;
	this.vrb = null;
	this.widgetItems = null;
	this.widgetFontSize = 0;
	this.widgetFontResource = null;
	this.widgetFontFamily = null;
	this.widgetTextColor = null;
	this.widgetFontBold = false;
	this.widgetOnSelectedColor = null;
	this.widgetOutlineColor = null;
	this.widgetOrientation = JkWidgetCommonRadioButtonWidget.VERTICAL;
	this.widgetClickHandler = null;
};

JkWidgetCommonRadioButtonWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonRadioButtonWidget.prototype.constructor = JkWidgetCommonRadioButtonWidget;
JkWidgetCommonRadioButtonWidget.prototype._t = {
	"JkWidgetCommonRadioButtonWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWidgetWithValue" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonRadioButtonWidget.prototype._tobj = JkWidgetCommonRadioButtonWidget;

JkWidgetCommonRadioButtonWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonRadioButtonWidget;
	return v.CTOR_JkWidgetCommonRadioButtonWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonRadioButtonWidget.prototype.CTOR_JkWidgetCommonRadioButtonWidget_JkUiGuiApplicationContext = function(context) {
	this.widgetClickHandler = null;
	this.widgetOrientation = JkWidgetCommonRadioButtonWidget.VERTICAL;
	this.widgetOutlineColor = null;
	this.widgetOnSelectedColor = null;
	this.widgetFontBold = false;
	this.widgetTextColor = null;
	this.widgetFontFamily = null;
	this.widgetFontResource = null;
	this.widgetFontSize = 0;
	this.widgetItems = null;
	this.vrb = null;
	this.selectedWidgetIndex = -1;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonRadioButtonWidget.forGroup = function(context, items) {
	var v = JkWidgetCommonRadioButtonWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetItems(items);
	return v;
};

JkWidgetCommonRadioButtonWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	this.vrb = new Array;
	var box = null;
	if(this.widgetOrientation == JkWidgetCommonRadioButtonWidget.HORIZONTAL) {
		box = JkWidgetHorizontalBoxWidget.forContext(this.context, (this.context.getHeightValue("2500um")), (this.context.getHeightValue("1500um")));
	}
	else {
		box = JkWidgetVerticalBoxWidget.forContext(this.context, (this.context.getHeightValue("2500um")), (this.context.getHeightValue("1500um")));
	}
	for(var i = 0 ; i < JkLangVector.getSize(this.widgetItems) ; i++) {
		var d = JkLangVector.get(this.widgetItems, i);
		if(!(d != null)) {
			continue;
		}
		var rb = JkWidgetCommonRadioButtonWidgetMyRadioButtonWidget.NEW_JkUiGuiApplicationContext(this.context);
		rb.setWidgetText(d);
		rb.setWidgetIndex(i);
		rb.setWidgetContainer(this);
		rb.setWidgetFontSize(this.widgetFontSize);
		rb.setWidgetFontResource(this.widgetFontResource);
		rb.setWidgetFontFamily(this.widgetFontFamily);
		rb.setWidgetFontBold(this.widgetFontBold);
		rb.setWidgetTextColor(this.widgetTextColor);
		rb.setWidgetColor(this.widgetOnSelectedColor);
		rb.setWidgetOutLineColor(this.widgetOutlineColor);
		this.vrb.push(rb);
		if(this.widgetOrientation == JkWidgetCommonRadioButtonWidget.HORIZONTAL) {
			box.addWidget1(rb, 1.0);
		}
		else {
			box.addWidget(rb);
		}
	}
	this.addWidget(box);
};

JkWidgetCommonRadioButtonWidget.prototype.setWidgetEnabled = function(v) {
	if(this.vrb != null) {
		var n = 0;
		var m = this.vrb.length;
		for(n = 0 ; n < m ; n++) {
			var rb = this.vrb[n];
			if(rb != null) {
				rb.setWidgetEnabled(v);
			}
		}
	}
	return this;
};

JkWidgetCommonRadioButtonWidget.prototype.setWidgetValue = function(value) {
	this.setSelectWidgetValue((JkLangString.asString(value)));
};

JkWidgetCommonRadioButtonWidget.prototype.getWidgetValue = function() {
	var index = this.getSelectedWidgetIndex();
	if(!(this.widgetItems != null) || index < 0) {
		return null;
	}
	return JkLangVector.get(this.widgetItems, index);
};

JkWidgetCommonRadioButtonWidget.prototype.getSelectedWidgetIndex = function() {
	return this.selectedWidgetIndex;
};

JkWidgetCommonRadioButtonWidget.prototype.setSelectWidgetValue = function(selectedWidget) {
	this.updateSelectedWidget((this.findIndexForWidgetValue(selectedWidget)));
};

JkWidgetCommonRadioButtonWidget.prototype.setSelectedWidgetIndex = function(index) {
	this.updateSelectedWidget(index);
};

JkWidgetCommonRadioButtonWidget.prototype.updateSelectedWidget = function(index) {
	if(this.selectedWidgetIndex > -1) {
		var widget = JkLangVector.get(this.vrb, this.selectedWidgetIndex);
		if(widget != null) {
			widget.onDeSelected();
		}
	}
	var ww = JkLangVector.get(this.vrb, index);
	if(ww != null) {
		ww.onSelected();
	}
	this.selectedWidgetIndex = index;
	if(this.widgetClickHandler != null) {
		this.widgetClickHandler(index);
	}
};

JkWidgetCommonRadioButtonWidget.prototype.findIndexForWidgetValue = function(id) {
	var v = -1;
	if(this.widgetItems != null) {
		var n = 0;
		var it = JkLangVector.iterate(this.widgetItems);
		while(it != null){
			var item = it.next();
			if(item == null) {
				break;
			}
			if(item == id) {
				v = n;
				break;
			}
			n++;
		}
	}
	return v;
};

JkWidgetCommonRadioButtonWidget.prototype.getWidgetItems = function() {
	return this.widgetItems;
};

JkWidgetCommonRadioButtonWidget.prototype.setWidgetItems = function(v) {
	this.widgetItems = v;
	return this;
};

JkWidgetCommonRadioButtonWidget.prototype.getWidgetFontSize = function() {
	return this.widgetFontSize;
};

JkWidgetCommonRadioButtonWidget.prototype.setWidgetFontSize = function(v) {
	this.widgetFontSize = v;
	return this;
};

JkWidgetCommonRadioButtonWidget.prototype.getWidgetFontResource = function() {
	return this.widgetFontResource;
};

JkWidgetCommonRadioButtonWidget.prototype.setWidgetFontResource = function(v) {
	this.widgetFontResource = v;
	return this;
};

JkWidgetCommonRadioButtonWidget.prototype.getWidgetFontFamily = function() {
	return this.widgetFontFamily;
};

JkWidgetCommonRadioButtonWidget.prototype.setWidgetFontFamily = function(v) {
	this.widgetFontFamily = v;
	return this;
};

JkWidgetCommonRadioButtonWidget.prototype.getWidgetTextColor = function() {
	return this.widgetTextColor;
};

JkWidgetCommonRadioButtonWidget.prototype.setWidgetTextColor = function(v) {
	this.widgetTextColor = v;
	return this;
};

JkWidgetCommonRadioButtonWidget.prototype.getWidgetFontBold = function() {
	return this.widgetFontBold;
};

JkWidgetCommonRadioButtonWidget.prototype.setWidgetFontBold = function(v) {
	this.widgetFontBold = v;
	return this;
};

JkWidgetCommonRadioButtonWidget.prototype.getWidgetOnSelectedColor = function() {
	return this.widgetOnSelectedColor;
};

JkWidgetCommonRadioButtonWidget.prototype.setWidgetOnSelectedColor = function(v) {
	this.widgetOnSelectedColor = v;
	return this;
};

JkWidgetCommonRadioButtonWidget.prototype.getWidgetOutlineColor = function() {
	return this.widgetOutlineColor;
};

JkWidgetCommonRadioButtonWidget.prototype.setWidgetOutlineColor = function(v) {
	this.widgetOutlineColor = v;
	return this;
};

JkWidgetCommonRadioButtonWidget.prototype.getWidgetOrientation = function() {
	return this.widgetOrientation;
};

JkWidgetCommonRadioButtonWidget.prototype.setWidgetOrientation = function(v) {
	this.widgetOrientation = v;
	return this;
};

JkWidgetCommonRadioButtonWidget.prototype.getWidgetClickHandler = function() {
	return this.widgetClickHandler;
};

JkWidgetCommonRadioButtonWidget.prototype.setWidgetClickHandler = function(v) {
	this.widgetClickHandler = v;
	return this;
};

JkWidgetCommonRadioButtonWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonRadioButtonWidget"] === true;
};

JkWidgetCommonRadioButtonWidget.HORIZONTAL = 0;
JkWidgetCommonRadioButtonWidget.VERTICAL = 1;

let JkWidgetCommonTextAreaWidget = function() {
	JkWidgetWidget.call(this);
	this.widgetTextChangeHandler = null;
	this.widgetOnFocusHandler = null;
	this.widgetOnLoseFocusHandler = null;
	this.widgetOnEnterKeyPressed = null;
	this.widgetContext = null;
	this.widgetPlaceholder = null;
	this.widgetPaddingLeft = 0;
	this.widgetPaddingTop = 0;
	this.widgetPaddingRight = 0;
	this.widgetPaddingBottom = 0;
	this.widgetRows = 0;
	this.widgetTextColor = null;
	this.widgetBackgroundColor = null;
	this.widgetFontFamily = null;
	this.widgetFontResource = null;
	this.widgetFontSize = 0.0;
};

JkWidgetCommonTextAreaWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetCommonTextAreaWidget.prototype.constructor = JkWidgetCommonTextAreaWidget;
JkWidgetCommonTextAreaWidget.prototype._t = {
	"JkWidgetCommonTextAreaWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWidgetWithValue" : true
};
JkWidgetCommonTextAreaWidget.prototype._tobj = JkWidgetCommonTextAreaWidget;

JkWidgetCommonTextAreaWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonTextAreaWidget;
	return v.CTOR_JkWidgetCommonTextAreaWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonTextAreaWidget.prototype.CTOR_JkWidgetCommonTextAreaWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.widgetFontSize = 0.0;
	this.widgetFontResource = null;
	this.widgetFontFamily = null;
	this.widgetBackgroundColor = null;
	this.widgetTextColor = null;
	this.widgetRows = 0;
	this.widgetPaddingBottom = 0;
	this.widgetPaddingRight = 0;
	this.widgetPaddingTop = 0;
	this.widgetPaddingLeft = 0;
	this.widgetPlaceholder = null;
	this.widgetContext = null;
	this.widgetOnEnterKeyPressed = null;
	this.widgetOnLoseFocusHandler = null;
	this.widgetOnFocusHandler = null;
	this.widgetTextChangeHandler = null;
	JkUiHTMLDOM.setStyle(this.element, "outline-width", "0");
	this.widgetContext = context;
	this.setWidgetStyle("TextAreaWidget");
	return this;
};

JkWidgetCommonTextAreaWidget.forPlaceholder = function(context, placeholder, rows) {
	var v = JkWidgetCommonTextAreaWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetPlaceholder(placeholder);
	v.setWidgetRows(rows);
	return v;
};

JkWidgetCommonTextAreaWidget.prototype.createElement = function() {
	return JkUiHTMLDOM.createElement("textarea");
};

JkWidgetCommonTextAreaWidget.prototype.prepareElement = function(element) {
	JkWidgetWidget.prototype.prepareElement.call(this, element);
	JkUiHTMLDOM.setStyle(element, "box-sizing", "border-box");
	JkUiHTMLDOM.setStyle(element, "resize", "none");
	JkUiHTMLDOM.setStyle(element, "border", "none");
	JkUiHTMLDOM.removeStyle(element, "overflow");
	JkUiHTMLDOM.addEventListener(element, "input", (function() {
		this.onChangeListener();
	}.bind(this)));
	JkUiHTMLDOM.addEventListener(element, "focus", (function() {
		this.onFocusListener();
	}.bind(this)));
	JkUiHTMLDOM.addEventListener(element, "blur", (function() {
		this.onLoseFocusListener();
	}.bind(this)));
	this.element.addEventListener("keypress", function(e) {
		var k = e.which || e.keyCode;
		if(k == 13 && !(e.shiftKey)) {
			this.onEnterKeyListener();
		}
	}.bind(this));
	;
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetStyle = function(style) {
	this.widgetFontFamily = this.widgetContext.getStyleString(style, "fontFamily", null);
	if(JkLangString.isEmpty(this.widgetFontFamily)) {
		this.widgetFontFamily = "Arial";
	}
	this.widgetFontSize = this.widgetContext.getStylePixels(style, "fontSize", null);
	if(this.widgetFontSize < 1.0) {
		this.widgetFontSize = this.widgetContext.getHeightValue("3mm");
	}
	this.widgetTextColor = this.widgetContext.getStyleColor(style, "textColor", null);
	this.widgetBackgroundColor = this.widgetContext.getStyleColor(style, "backgroundColor", null);
	this.setWidgetPadding1((this.widgetContext.getStylePixels(style, "padding", null)));
	this.updateWidgetFont();
	this.updateWidgetColors();
	return this;
};

JkWidgetCommonTextAreaWidget.prototype.configureMonospaceFont = function() {
	this.setWidgetFontFamily("monospace");
};

JkWidgetCommonTextAreaWidget.prototype.updateWidgetColors = function() {
	var textColor = this.widgetTextColor;
	if(!(textColor != null)) {
		if(this.widgetBackgroundColor != null) {
			if(this.widgetBackgroundColor.isLightColor()) {
				textColor = JkGfxColor.black();
			}
			else {
				textColor = JkGfxColor.white();
			}
		}
		else {
			textColor = JkGfxColor.black();
		}
	}
	if(!(this.widgetBackgroundColor != null)) {
		JkUiHTMLDOM.setStyle(this.element, "background-color", "rgba(0,0,0,0)");
	}
	else {
		JkUiHTMLDOM.setStyle(this.element, "background-color", (JkUiHTMLDOM.colorToRGBA(this.widgetBackgroundColor)));
	}
	JkUiHTMLDOM.setStyle(this.element, "color", (JkUiHTMLDOM.colorToRGBA(textColor)));
};

JkWidgetCommonTextAreaWidget.prototype.updateWidgetFont = function() {
	JkUiHTMLDOM.setFontFamily(this.element, this.widgetFontFamily);
	JkUiHTMLDOM.setStyle(this.element, "font-size", (JkLangString.safeString((JkLangString.forDouble(this.widgetFontSize)))) + ("px"));
};

JkWidgetCommonTextAreaWidget.prototype.focus = function() {
	console.log("[jk.widget.common.TextAreaWidget.focus] (TextAreaWidget.sling:560:3): Not implemented");
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetFontFamily = function(family) {
	this.widgetFontFamily = family;
	this.updateWidgetFont();
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetFontResource = function(res) {
	this.widgetFontResource = res;
	this.updateWidgetFont();
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetFontSize = function(fontSize) {
	this.widgetFontSize = fontSize;
	this.updateWidgetFont();
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetTextColor = function(color) {
	this.widgetTextColor = color;
	this.updateWidgetColors();
	return this;
};

JkWidgetCommonTextAreaWidget.prototype.getWidgetTextColor = function() {
	return this.widgetTextColor;
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetBackgroundColor = function(color) {
	this.widgetBackgroundColor = color;
	this.updateWidgetColors();
	return this;
};

JkWidgetCommonTextAreaWidget.prototype.getWidgetBackgroundColor = function() {
	return this.widgetBackgroundColor;
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetRows = function(row) {
	this.widgetRows = row;
	JkUiHTMLDOM.setAttribute(this.element, "rows", (JkLangString.forInteger(row)));
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetText = function(text) {
	this.element.value = text;
	;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonTextAreaWidget.prototype.onEnterKeyListener = function() {
	if(this.widgetOnEnterKeyPressed != null) {
		this.widgetOnEnterKeyPressed();
	}
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetPlaceholder = function(placeholder) {
	this.widgetPlaceholder = placeholder;
	JkUiHTMLDOM.setAttribute(this.element, "placeholder", placeholder);
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetPadding1 = function(padding) {
	return this.setWidgetPadding3(padding, padding, padding, padding);
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetPadding2 = function(lr, tb) {
	return this.setWidgetPadding3(lr, tb, lr, tb);
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetPadding3 = function(l, t, r, b) {
	if(l < 0 || t < 0 || r < 0 || b < 0) {
		return this;
	}
	if(this.widgetPaddingLeft == l && this.widgetPaddingTop == t && this.widgetPaddingRight == r && this.widgetPaddingBottom == b) {
		return this;
	}
	this.widgetPaddingLeft = l;
	this.widgetPaddingTop = t;
	this.widgetPaddingRight = r;
	this.widgetPaddingBottom = b;
	this.updateWidgetPadding();
	return this;
};

JkWidgetCommonTextAreaWidget.prototype.updateWidgetPadding = function() {
	JkUiHTMLDOM.setStyle(this.element, "padding", (JkLangString.safeString((JkLangString.forInteger(this.widgetPaddingTop)))) + ("px") + (" ") + (JkLangString.safeString((JkLangString.forInteger(this.widgetPaddingRight)))) + ("px") + (" ") + (JkLangString.safeString((JkLangString.forInteger(this.widgetPaddingBottom)))) + ("px") + (" ") + (JkLangString.safeString((JkLangString.forInteger(this.widgetPaddingLeft)))) + ("px"));
};

JkWidgetCommonTextAreaWidget.prototype.getWidgetText = function() {
	return this.element.value;
};

JkWidgetCommonTextAreaWidget.prototype.getWidgetPlaceholder = function() {
	return this.widgetPlaceholder;
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetValue = function(value) {
	this.setWidgetText((JkLangString.asString(value)));
};

JkWidgetCommonTextAreaWidget.prototype.getWidgetValue = function() {
	return this.getWidgetText();
};

JkWidgetCommonTextAreaWidget.prototype.onChangeListener = function() {
	if(this.widgetTextChangeHandler != null) {
		this.widgetTextChangeHandler();
	}
};

JkWidgetCommonTextAreaWidget.prototype.onFocusListener = function() {
	if(this.widgetOnFocusHandler != null) {
		this.widgetOnFocusHandler();
	}
};

JkWidgetCommonTextAreaWidget.prototype.onLoseFocusListener = function() {
	if(this.widgetOnLoseFocusHandler != null) {
		this.widgetOnLoseFocusHandler();
	}
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetMaxLength = function(v) {
	JkUiHTMLDOM.setAttribute(this.element, "maxlength", (JkLangString.forInteger(v)));
	return this;
};

JkWidgetCommonTextAreaWidget.prototype.getWidgetTextChangeHandler = function() {
	return this.widgetTextChangeHandler;
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetTextChangeHandler = function(v) {
	this.widgetTextChangeHandler = v;
	return this;
};

JkWidgetCommonTextAreaWidget.prototype.getWidgetOnFocusHandler = function() {
	return this.widgetOnFocusHandler;
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetOnFocusHandler = function(v) {
	this.widgetOnFocusHandler = v;
	return this;
};

JkWidgetCommonTextAreaWidget.prototype.getWidgetOnLoseFocusHandler = function() {
	return this.widgetOnLoseFocusHandler;
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetOnLoseFocusHandler = function(v) {
	this.widgetOnLoseFocusHandler = v;
	return this;
};

JkWidgetCommonTextAreaWidget.prototype.getWidgetOnEnterKeyPressed = function() {
	return this.widgetOnEnterKeyPressed;
};

JkWidgetCommonTextAreaWidget.prototype.setWidgetOnEnterKeyPressed = function(v) {
	this.widgetOnEnterKeyPressed = v;
	return this;
};

JkWidgetCommonTextAreaWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonTextAreaWidget"] === true;
};

let JkWidgetCommonSpinnerWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.image = null;
	this.rotation = 0.0;
	this.active = false;
	this.imageWidget = null;
};

JkWidgetCommonSpinnerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonSpinnerWidget.prototype.constructor = JkWidgetCommonSpinnerWidget;
JkWidgetCommonSpinnerWidget.prototype._t = {
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetScreenAwareWidget" : true,
	"JkWidgetCommonSpinnerWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonSpinnerWidget.prototype._tobj = JkWidgetCommonSpinnerWidget;

JkWidgetCommonSpinnerWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonSpinnerWidget;
	return v.CTOR_JkWidgetCommonSpinnerWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonSpinnerWidget.prototype.CTOR_JkWidgetCommonSpinnerWidget_JkUiGuiApplicationContext = function(context) {
	this.imageWidget = null;
	this.active = false;
	this.rotation = 0.0;
	this.image = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonSpinnerWidget.forImage = function(ctx, image) {
	var v = JkWidgetCommonSpinnerWidget.NEW_JkUiGuiApplicationContext(ctx);
	v.setImage(image);
	return v;
};

JkWidgetCommonSpinnerWidget.prototype.onWidgetRemovedFromScreen = function(screen) {
	this.active = false;
};

JkWidgetCommonSpinnerWidget.prototype.onWidgetAddedToScreen = function(screen) {
	this.imageWidget.setWidgetImage(this.image);
	this.active = true;
	this.doSpin();
};

JkWidgetCommonSpinnerWidget.prototype.doSpin = function() {
	if(!this.active) {
		return;
	}
	JkWidgetWidget.setRotation(this.imageWidget, this.rotation);
	this.rotation += JkMathMath.M_PI / 50.0;
	this.context.startTimer(100, (function() {
		this.doSpin();
	}.bind(this)));
};

JkWidgetCommonSpinnerWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.imageWidget = JkWidgetImageWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.imageWidget.setWidgetImageWidth((this.context.getWidthValue("15mm")));
	this.imageWidget.setWidgetImageHeight((this.context.getHeightValue("15mm")));
	this.addWidget(this.imageWidget);
};

JkWidgetCommonSpinnerWidget.prototype.getImage = function() {
	return this.image;
};

JkWidgetCommonSpinnerWidget.prototype.setImage = function(v) {
	this.image = v;
	return this;
};

JkWidgetCommonSpinnerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonSpinnerWidget"] === true;
};

let JkWidgetCommonRangePickerWidgetSelectedControl = function() {
	this.widget = null;
	this.control = 0;
};

JkWidgetCommonRangePickerWidgetSelectedControl.prototype._t = { "JkWidgetCommonRangePickerWidgetSelectedControl" : true };
JkWidgetCommonRangePickerWidgetSelectedControl.prototype._tobj = JkWidgetCommonRangePickerWidgetSelectedControl;

JkWidgetCommonRangePickerWidgetSelectedControl.NEW = function() {
	var v = new JkWidgetCommonRangePickerWidgetSelectedControl;
	return v.CTOR_JkWidgetCommonRangePickerWidgetSelectedControl();
};

JkWidgetCommonRangePickerWidgetSelectedControl.prototype.CTOR_JkWidgetCommonRangePickerWidgetSelectedControl = function() {
	this.control = 0;
	this.widget = null;
	return this;
};

JkWidgetCommonRangePickerWidgetSelectedControl.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonRangePickerWidgetSelectedControl"] === true;
};

let JkWidgetCommonRangePickerWidgetRangeControlWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.outline = null;
	this.main = null;
};

JkWidgetCommonRangePickerWidgetRangeControlWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonRangePickerWidgetRangeControlWidget.prototype.constructor = JkWidgetCommonRangePickerWidgetRangeControlWidget;
JkWidgetCommonRangePickerWidgetRangeControlWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetCommonRangePickerWidgetRangeControlWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonRangePickerWidgetRangeControlWidget.prototype._tobj = JkWidgetCommonRangePickerWidgetRangeControlWidget;

JkWidgetCommonRangePickerWidgetRangeControlWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonRangePickerWidgetRangeControlWidget;
	return v.CTOR_JkWidgetCommonRangePickerWidgetRangeControlWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonRangePickerWidgetRangeControlWidget.prototype.CTOR_JkWidgetCommonRangePickerWidgetRangeControlWidget_JkUiGuiApplicationContext = function(context) {
	this.main = null;
	this.outline = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonRangePickerWidgetRangeControlWidget.prototype.setWidgetColor = function(color) {
	this.main.setWidgetColor(color);
};

JkWidgetCommonRangePickerWidgetRangeControlWidget.prototype.setWidgetRoundingRadius = function(radius) {
	this.outline.setWidgetRoundingRadius1(radius);
	this.main.setWidgetRoundingRadius1(radius);
};

JkWidgetCommonRangePickerWidgetRangeControlWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.setWidgetWidthRequest((this.context.getHeightValue("4mm")));
	this.setWidgetHeightRequest((this.context.getHeightValue("4mm")));
	this.outline = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.outline.setWidgetColor((JkGfxColor.instance("#C0C0C0")));
	this.outline.setWidgetRoundingRadius1((this.context.getHeightValue("800um")));
	this.addWidget(this.outline);
	var widget = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget.setWidgetMargin((this.context.getHeightValue("10um")));
	this.main = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.main.setWidgetColor((JkGfxColor.instance("#ffffff")));
	this.main.setWidgetRoundingRadius1((this.context.getHeightValue("800um")));
	widget.addWidget(this.main);
	this.addWidget(widget);
};

JkWidgetCommonRangePickerWidgetRangeControlWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonRangePickerWidgetRangeControlWidget"] === true;
};

let JkWidgetCommonRangePickerWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetMaximumValue = 100;
	this.widgetLeftControlChangeListener = null;
	this.widgetRightControlChangeListener = null;
	this.widgetDisableLeftControl = false;
	this.selectedControl = null;
	this.refX = 0.0;
	this.firstLayoutDone = false;
	this.rangeValue = 0;
	this.leftValue = -1.0;
	this.rightValue = -1.0;
	this.con = null;
	this.background = null;
	this.range = null;
	this.outOfRangeColor = null;
	this.insideOfRangeColor = null;
	this.leftControl = null;
	this.rightControl = null;
};

JkWidgetCommonRangePickerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonRangePickerWidget.prototype.constructor = JkWidgetCommonRangePickerWidget;
JkWidgetCommonRangePickerWidget.prototype._t = {
	"JkWidgetResizeAwareWidget" : true,
	"JkWidgetWidgetWithValue" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetCommonRangePickerWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetParentAwareWidget" : true
};
JkWidgetCommonRangePickerWidget.prototype._tobj = JkWidgetCommonRangePickerWidget;

JkWidgetCommonRangePickerWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCommonRangePickerWidget;
	return v.CTOR_JkWidgetCommonRangePickerWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCommonRangePickerWidget.prototype.CTOR_JkWidgetCommonRangePickerWidget_JkUiGuiApplicationContext = function(ctx) {
	this.rightControl = null;
	this.leftControl = null;
	this.insideOfRangeColor = null;
	this.outOfRangeColor = null;
	this.range = null;
	this.background = null;
	this.con = null;
	this.rightValue = -1.0;
	this.leftValue = -1.0;
	this.rangeValue = 0;
	this.firstLayoutDone = false;
	this.refX = 0.0;
	this.selectedControl = null;
	this.widgetDisableLeftControl = false;
	this.widgetRightControlChangeListener = null;
	this.widgetLeftControlChangeListener = null;
	this.widgetMaximumValue = 100;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.forceCreateWidget();
	return this;
};

JkWidgetCommonRangePickerWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	if(this.widgetDisableLeftControl) {
		JkWidgetWidget.removeFromParent(this.leftControl);
	}
	JkWidgetWidget.setWidgetPointerHandlers(this.con, (function(x1, y1) {
		this.onStartHandler(x1, y1);
	}.bind(this)), (function(x3, y3) {
		this.onTouchHandler(x3, y3);
	}.bind(this)), (function(x5, y5) {
		this.onEndHandler(x5, y5);
	}.bind(this)));
};

JkWidgetCommonRangePickerWidget.prototype.isInside = function(x, y, widget) {
	var wx = JkWidgetWidget.getX(widget);
	var wy = JkWidgetWidget.getY(widget);
	return x >= wx && y >= wy && x <= wx + JkWidgetWidget.getWidth(widget) && y <= wy + JkWidgetWidget.getHeight(widget);
};

JkWidgetCommonRangePickerWidget.prototype.onStartHandler = function(x, y) {
	this.resetSelectedControl();
	if(this.isInside(x, y, this.leftControl)) {
		this.selectedControl.widget = this.leftControl;
		this.selectedControl.control = JkWidgetCommonRangePickerWidget.LEFT_CONTROL;
		this.refX = x;
	}
	else if(this.isInside(x, y, this.rightControl)) {
		this.selectedControl.widget = this.rightControl;
		this.selectedControl.control = JkWidgetCommonRangePickerWidget.RIGHT_CONTROL;
		this.refX = x;
	}
};

JkWidgetCommonRangePickerWidget.prototype.onTouchHandler = function(x, y) {
	if(!(this.selectedControl != null)) {
		return;
	}
	var dx = JkWidgetWidget.getX(this.selectedControl.widget) + ~(~(x - this.refX));
	this.moveControl(dx, this.selectedControl.control);
	this.refX = x;
};

JkWidgetCommonRangePickerWidget.prototype.onEndHandler = function(x, y) {
	this.resetSelectedControl();
};

JkWidgetCommonRangePickerWidget.prototype.calculateValueForX = function(x) {
	var y = x / this.rangeValue;
	return JkMathMath.round((y * this.widgetMaximumValue * 100)) / 100;
};

JkWidgetCommonRangePickerWidget.prototype.calculateXForValue = function(value) {
	var x = value / this.widgetMaximumValue;
	return x * this.rangeValue;
};

JkWidgetCommonRangePickerWidget.prototype.updateInsideOfRangeCanvas = function() {
	var x = JkWidgetWidget.getX(this.leftControl) + JkWidgetWidget.getWidth(this.leftControl) / 2;
	var width = JkWidgetWidget.getX(this.rightControl) + JkWidgetWidget.getWidth(this.rightControl) / 2 - x;
	JkWidgetWidget.setLayoutSize(this.insideOfRangeColor, width, (JkWidgetWidget.getHeight(this.insideOfRangeColor)));
	JkWidgetWidget.move(this.insideOfRangeColor, x, (JkWidgetWidget.getY(this.insideOfRangeColor)));
};

JkWidgetCommonRangePickerWidget.prototype.resetSelectedControl = function() {
	if(!(this.selectedControl != null)) {
		this.selectedControl = JkWidgetCommonRangePickerWidgetSelectedControl.NEW();
	}
	this.selectedControl.widget = null;
	this.selectedControl.control = -1;
};

JkWidgetCommonRangePickerWidget.prototype.moveLeftControlTo = function(value) {
	this.moveControl((this.calculateXForValue(value)), JkWidgetCommonRangePickerWidget.LEFT_CONTROL);
};

JkWidgetCommonRangePickerWidget.prototype.moveRightControlTo = function(value) {
	this.moveControl((this.calculateXForValue(value)), JkWidgetCommonRangePickerWidget.RIGHT_CONTROL);
};

JkWidgetCommonRangePickerWidget.prototype.moveControl = function(value, control) {
	if(!(control == JkWidgetCommonRangePickerWidget.LEFT_CONTROL || control == JkWidgetCommonRangePickerWidget.RIGHT_CONTROL)) {
		return;
	}
	this.resetSelectedControl();
	this.selectedControl.control = control;
	var x = value;
	if(control == JkWidgetCommonRangePickerWidget.LEFT_CONTROL) {
		this.selectedControl.widget = this.leftControl;
		var rx = JkWidgetWidget.getX(this.rightControl);
		x = x < 0 ? 0.0 : x;
		x = x > rx ? rx : x;
		if(this.widgetLeftControlChangeListener != null) {
			this.leftValue = this.calculateValueForX(x);
			this.widgetLeftControlChangeListener(this.leftValue);
		}
	}
	else if(control == JkWidgetCommonRangePickerWidget.RIGHT_CONTROL) {
		this.selectedControl.widget = this.rightControl;
		var mx = this.rangeValue;
		var lx = JkWidgetWidget.getX(this.leftControl);
		x = x > mx ? mx : x;
		x = x < lx ? lx : x;
		if(this.widgetRightControlChangeListener != null) {
			this.rightValue = this.calculateValueForX(x);
			this.widgetRightControlChangeListener(this.rightValue);
		}
	}
	JkWidgetWidget.move(this.selectedControl.widget, (~(~x)), (JkWidgetWidget.getY(this.selectedControl.widget)));
	this.updateInsideOfRangeCanvas();
};

JkWidgetCommonRangePickerWidget.prototype.setWidgetStyle = function(style) {
	this.setWidgetControlColor((this.context.getStyleColor(style, "controlColor", null)));
	this.setWidgetBackgroundColor((this.context.getStyleColor(style, "backgroundColor", null)));
	this.setWidgetOutOfRangeColor((this.context.getStyleColor(style, "outOfRangeColor", null)));
	this.setWidgetInsideOfRangeColor((this.context.getStyleColor(style, "insideOfRangeColor", null)));
	return this;
};

JkWidgetCommonRangePickerWidget.prototype.setWidgetBackgroundColor = function(color) {
	this.background.setWidgetColor(color);
};

JkWidgetCommonRangePickerWidget.prototype.setWidgetOutOfRangeColor = function(color) {
	this.outOfRangeColor.setWidgetColor(color);
};

JkWidgetCommonRangePickerWidget.prototype.setWidgetInsideOfRangeColor = function(color) {
	this.insideOfRangeColor.setWidgetColor(color);
};

JkWidgetCommonRangePickerWidget.prototype.setWidgetControlColor = function(color) {
	this.leftControl.setWidgetColor(color);
	this.rightControl.setWidgetColor(color);
};

JkWidgetCommonRangePickerWidget.prototype.setWidgetRoundingRadius = function(radius) {
	this.leftControl.setWidgetRoundingRadius(radius);
	this.rightControl.setWidgetRoundingRadius(radius);
};

JkWidgetCommonRangePickerWidget.prototype.onWidgetResized = function() {
	this.rangeValue = JkWidgetWidget.getWidth(this.range) - JkWidgetWidget.getWidth(this.rightControl);
	if(!this.firstLayoutDone) {
		this.firstLayoutDone = true;
	}
	if(this.leftValue < 0 || this.rightValue < 0) {
		return;
	}
	if(!this.widgetDisableLeftControl) {
		this.moveLeftControlTo(this.leftValue);
	}
	this.moveRightControlTo(this.rightValue);
};

JkWidgetCommonRangePickerWidget.prototype.setWidgetValue = function(value) {
	if(!(value != null)) {
		return;
	}
	if(!(typeof(value) === 'string')) {
		return;
	}
	var v = JkLangString.split(value, '-'.charCodeAt(), 2);
	if(!this.firstLayoutDone) {
		this.leftValue = JkLangString.toDouble(v[0]);
		this.rightValue = JkLangString.toDouble(v[1]);
	}
	else {
		if(!this.widgetDisableLeftControl) {
			this.moveLeftControlTo((JkLangString.toDouble(v[0])));
		}
		this.moveRightControlTo((JkLangString.toDouble(v[1])));
	}
};

JkWidgetCommonRangePickerWidget.prototype.setWidgetValueForDynamicMap = function(value) {
	if(!(value != null)) {
		return;
	}
	this.moveLeftControlTo((value.getDouble("from", 0.0)));
	this.moveRightControlTo((value.getDouble("to", 0.0)));
};

JkWidgetCommonRangePickerWidget.prototype.setWidgetFromValue = function(fvalue) {
	this.moveLeftControlTo(fvalue);
};

JkWidgetCommonRangePickerWidget.prototype.setWidgetToValue = function(tvalue) {
	this.moveRightControlTo(tvalue);
};

JkWidgetCommonRangePickerWidget.prototype.getWidgetValue = function() {
	return (JkLangString.safeString((JkLangString.forDouble(this.leftValue)))) + ("-") + (JkLangString.safeString((JkLangString.forDouble(this.rightValue))));
};

JkWidgetCommonRangePickerWidget.prototype.getWidgetValueAsDynamicMap = function() {
	var v = JkLangDynamicMap.NEW();
	v.setDouble("from", this.leftValue);
	v.setDouble("to", this.rightValue);
	return v;
};

JkWidgetCommonRangePickerWidget.prototype.getWidgetFromValue = function() {
	return this.leftValue;
};

JkWidgetCommonRangePickerWidget.prototype.getWidgetToValue = function() {
	return this.rightValue;
};

JkWidgetCommonRangePickerWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.setWidgetHeightRequest((this.context.getHeightValue("4mm")));
	this.con = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.background = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.con.addWidget(this.background);
	var widget = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.range = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.range.setWidgetMarginLeft((this.context.getHeightValue("2mm")));
	this.range.setWidgetMarginRight((this.context.getHeightValue("2mm")));
	this.range.setWidgetHeightRequest((this.context.getHeightValue("1mm")));
	this.outOfRangeColor = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.outOfRangeColor.setWidgetColor((JkGfxColor.instance("#A9A9A9")));
	this.range.addWidget(this.outOfRangeColor);
	this.insideOfRangeColor = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.insideOfRangeColor.setWidgetColor((JkGfxColor.instance("#FF8C00")));
	this.range.addWidget(this.insideOfRangeColor);
	widget.addWidget1(this.range, 0.5, 0.5, true);
	this.leftControl = JkWidgetCommonRangePickerWidgetRangeControlWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget.addWidget1(this.leftControl, 0.0, 0.5, false);
	this.rightControl = JkWidgetCommonRangePickerWidgetRangeControlWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget.addWidget1(this.rightControl, 1.0, 0.5, false);
	this.con.addWidget(widget);
	this.addWidget(this.con);
};

JkWidgetCommonRangePickerWidget.prototype.getWidgetMaximumValue = function() {
	return this.widgetMaximumValue;
};

JkWidgetCommonRangePickerWidget.prototype.setWidgetMaximumValue = function(v) {
	this.widgetMaximumValue = v;
	return this;
};

JkWidgetCommonRangePickerWidget.prototype.getWidgetLeftControlChangeListener = function() {
	return this.widgetLeftControlChangeListener;
};

JkWidgetCommonRangePickerWidget.prototype.setWidgetLeftControlChangeListener = function(v) {
	this.widgetLeftControlChangeListener = v;
	return this;
};

JkWidgetCommonRangePickerWidget.prototype.getWidgetRightControlChangeListener = function() {
	return this.widgetRightControlChangeListener;
};

JkWidgetCommonRangePickerWidget.prototype.setWidgetRightControlChangeListener = function(v) {
	this.widgetRightControlChangeListener = v;
	return this;
};

JkWidgetCommonRangePickerWidget.prototype.getWidgetDisableLeftControl = function() {
	return this.widgetDisableLeftControl;
};

JkWidgetCommonRangePickerWidget.prototype.setWidgetDisableLeftControl = function(v) {
	this.widgetDisableLeftControl = v;
	return this;
};

JkWidgetCommonRangePickerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonRangePickerWidget"] === true;
};

JkWidgetCommonRangePickerWidget.LEFT_CONTROL = 0;
JkWidgetCommonRangePickerWidget.RIGHT_CONTROL = 1;

let JkWidgetCommonPopupMenuMyContainerWidget = function() {
	JkWidgetContainerWidget.call(this);
	this.widget = null;
	this.menuWidth = 0;
};

JkWidgetCommonPopupMenuMyContainerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetContainerWidget.prototype);
JkWidgetCommonPopupMenuMyContainerWidget.prototype.constructor = JkWidgetCommonPopupMenuMyContainerWidget;
JkWidgetCommonPopupMenuMyContainerWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetCommonPopupMenuMyContainerWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonPopupMenuMyContainerWidget.prototype._tobj = JkWidgetCommonPopupMenuMyContainerWidget;

JkWidgetCommonPopupMenuMyContainerWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonPopupMenuMyContainerWidget;
	return v.CTOR_JkWidgetCommonPopupMenuMyContainerWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonPopupMenuMyContainerWidget.prototype.CTOR_JkWidgetCommonPopupMenuMyContainerWidget_JkUiGuiApplicationContext = function(context) {
	this.menuWidth = 0;
	this.widget = null;
	if(JkWidgetContainerWidget.prototype.CTOR_JkWidgetContainerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonPopupMenuMyContainerWidget.prototype.onWidgetHeightChanged = function(height) {
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.move(child, (JkWidgetWidget.getAbsoluteX(this.widget)), (JkWidgetWidget.getAbsoluteY(this.widget)));
			}
		}
	}
};

JkWidgetCommonPopupMenuMyContainerWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	var w = this.menuWidth;
	if(w == 0) {
		w = widthConstraint;
	}
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.layout(child, w, false);
				JkWidgetWidget.move(child, (JkWidgetWidget.getAbsoluteX(this.widget)), (JkWidgetWidget.getAbsoluteY(this.widget)));
			}
		}
	}
	JkWidgetWidget.setLayoutSize(this, widthConstraint, (JkWidgetWidget.getHeight(this)));
};

JkWidgetCommonPopupMenuMyContainerWidget.prototype.getWidget = function() {
	return this.widget;
};

JkWidgetCommonPopupMenuMyContainerWidget.prototype.setWidget = function(v) {
	this.widget = v;
	return this;
};

JkWidgetCommonPopupMenuMyContainerWidget.prototype.getMenuWidth = function() {
	return this.menuWidth;
};

JkWidgetCommonPopupMenuMyContainerWidget.prototype.setMenuWidth = function(v) {
	this.menuWidth = v;
	return this;
};

JkWidgetCommonPopupMenuMyContainerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonPopupMenuMyContainerWidget"] === true;
};

let JkWidgetCommonPopupMenu = function() {};

JkWidgetCommonPopupMenu.prototype._t = { "JkWidgetCommonPopupMenu" : true };
JkWidgetCommonPopupMenu.prototype._tobj = JkWidgetCommonPopupMenu;

JkWidgetCommonPopupMenu.NEW = function() {
	var v = new JkWidgetCommonPopupMenu;
	return v.CTOR_JkWidgetCommonPopupMenu();
};

JkWidgetCommonPopupMenu.prototype.CTOR_JkWidgetCommonPopupMenu = function() {
	return this;
};

JkWidgetCommonPopupMenu.showBelow = function(ctx, w, menu, menuWidth, align) {
	if(!(w != null)) {
		return;
	}
	if(!(menu != null)) {
		return;
	}
	var widget = w;
	var context = ctx;
	var parentLayer = JkWidgetCommonPopupMenu.getParentLayer(context, widget);
	var vbox = JkWidgetCommonPopupMenu.initializeMenus(context, menu);
	var container = JkWidgetCommonPopupMenuMyContainerWidget.NEW_JkUiGuiApplicationContext(context);
	container.setWidget(widget);
	container.setMenuWidth(menuWidth);
	container.addWidget(vbox);
	parentLayer.addWidget(container);
	JkWidgetWidget.setWidgetClickHandler(parentLayer, (function() {
		var anim = JkWidgetWidgetAnimation.forDuration(context, 300);
		anim.addFadeOut(container, true);
		var parent = JkUiHTMLDOM.getParentElement((JkUiHTMLDOM.getParentElement(container.element)));
		anim.setEndListener((function() {
			JkUiHTMLDOM.remove(parent);
		}.bind(this)));
		anim.start();
	}.bind(this)));
	var destX = JkWidgetWidget.getAbsoluteX(widget);
	if(menuWidth > 0) {
		var mwidth = menuWidth;
		if(align == 0) {
			if(mwidth > 0) {
				destX -= mwidth / 2 - JkWidgetWidget.getWidth(widget) / 2;
			}
		}
		else if(align > 0) {
			if(mwidth > 0) {
				destX -= mwidth - JkWidgetWidget.getWidth(widget);
			}
		}
		else {
			;
		}
	}
	var dx = destX;
	var animationDestY = JkWidgetWidget.getAbsoluteY(widget);
	var ay = context.getHeightValue("3mm");
	JkWidgetWidget.move(vbox, destX, (~(~(animationDestY + ay))));
	var anim1 = JkWidgetWidgetAnimation.forDuration(context, 300);
	anim1.addCallback((function(completion1) {
		var bgf = completion1 * 1.5;
		if(bgf > 1.0) {
			bgf = 1.0;
		}
		JkWidgetWidget.move(vbox, dx, (~(~(animationDestY + ~(~((1.0 - completion1) * ay))))));
	}.bind(this)));
	anim1.start();
};

JkWidgetCommonPopupMenu.showBeside = function(ctx, w, menu) {
	if(!(w != null)) {
		return;
	}
	if(!(menu != null)) {
		return;
	}
	var widget = w;
	var context = ctx;
	var parentLayer = JkWidgetCommonPopupMenu.getParentLayer(context, widget);
	var vbox = JkWidgetCommonPopupMenu.initializeMenus(context, menu);
	var container = JkWidgetCommonPopupMenuMyContainerWidget.NEW_JkUiGuiApplicationContext(context);
	container.setWidget(widget);
	container.addWidget(vbox);
	parentLayer.addWidget(container);
	JkWidgetWidget.setWidgetClickHandler(parentLayer, (function() {
		var anim = JkWidgetWidgetAnimation.forDuration(context, 300);
		anim.addFadeOut(container, true);
		var parent = JkUiHTMLDOM.getParentElement((JkUiHTMLDOM.getParentElement(container.element)));
		anim.setEndListener((function() {
			JkUiHTMLDOM.remove(parent);
		}.bind(this)));
		anim.start();
	}.bind(this)));
	var animationDestY = JkWidgetWidget.getAbsoluteY(widget) - JkWidgetWidget.getHeight(widget);
	var ay = context.getHeightValue("3mm");
	JkWidgetWidget.move(vbox, (JkWidgetWidget.getAbsoluteX(widget)), (~(~(animationDestY + ay))));
	var anim1 = JkWidgetWidgetAnimation.forDuration(context, 300);
	anim1.addCallback((function(completion1) {
		var bgf = completion1 * 1.5;
		if(bgf > 1.0) {
			bgf = 1.0;
		}
		JkWidgetWidget.move(vbox, (JkWidgetWidget.getAbsoluteX(widget) + JkWidgetWidget.getWidth(widget)), (~(~(animationDestY + ~(~((1.0 - completion1) * ay))))));
	}.bind(this)));
	anim1.start();
};

JkWidgetCommonPopupMenu.getParentLayer = function(context, widget) {
	var parentLayer = null;
	var div = JkUiHTMLDOM.createElement("div");
	JkUiHTMLDOM.setStyle(div, "position", "fixed");
	JkUiHTMLDOM.setStyle(div, "bottom", "0px");
	JkUiHTMLDOM.setStyle(div, "top", "0px");
	JkUiHTMLDOM.setStyle(div, "left", "0px");
	JkUiHTMLDOM.setStyle(div, "right", "0px");
	JkUiHTMLDOM.setStyle(div, "width", "100%");
	JkUiHTMLDOM.setStyle(div, "height", "100%");
	JkUiHTMLDOM.setStyle(div, "z-index", "999");
	JkUiHTMLDOM.appendToBody(div);
	parentLayer = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(context);
	JkWidgetWidget.addToDomElement(parentLayer, div);
	return parentLayer;
};

JkWidgetCommonPopupMenu.initializeMenus = function(context, menu) {
	var textColor = context.getStyleColor("PopupMenu", "textColor", null);
	if(!(textColor != null)) {
		textColor = JkGfxColor.black();
	}
	var backgroundColor = context.getStyleColor("PopupMenu", "backgroundColor", null);
	if(!(backgroundColor != null)) {
		backgroundColor = JkGfxColor.white();
	}
	var padding = context.getStylePixels("PopupMenu", "padding", null);
	if(padding < 1) {
		padding = context.getHeightValue("1000um");
	}
	var fontSize = context.getStylePixels("PopupMenu", "fontSize", null);
	if(fontSize < 1) {
		fontSize = context.getHeightValue("2mm");
	}
	var vbox = JkWidgetVerticalBoxWidget.forContext(context, 0, 0);
	var array = menu.getEntries();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var entry = array[n];
			if(entry != null) {
				var lbl = JkWidgetLabelWidget.forText(context, entry.title);
				lbl.setWidgetTextColor(textColor);
				var layer = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(context);
				layer.addWidget((JkWidgetCanvasWidget.forColor(context, backgroundColor)));
				layer.addWidget((JkWidgetLayerWidget.forWidget(context, lbl, padding)));
				JkWidgetWidget.setWidgetClickHandler(layer, entry.handler);
				vbox.addWidget(layer);
			}
		}
	}
	return vbox;
};

JkWidgetCommonPopupMenu.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonPopupMenu"] === true;
};

let JkWidgetCommonTextButtonWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetContext = null;
	this.widgetClickHandler = null;
	this.widgetText = null;
	this.widgetRoundingRadius = 0.0;
	this.widgetBackgroundColor = null;
	this.widgetPressedBackgroundColor = null;
	this.widgetTextColor = null;
	this.widgetFontSize = 0;
	this.widgetFontFamily = "Arial";
	this.widgetFontResource = null;
	this.widgetPadding = -1;
	this.widgetPaddingHorizontal = -1;
};

JkWidgetCommonTextButtonWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonTextButtonWidget.prototype.constructor = JkWidgetCommonTextButtonWidget;
JkWidgetCommonTextButtonWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetCommonTextButtonWidget" : true
};
JkWidgetCommonTextButtonWidget.prototype._tobj = JkWidgetCommonTextButtonWidget;

JkWidgetCommonTextButtonWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCommonTextButtonWidget;
	return v.CTOR_JkWidgetCommonTextButtonWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCommonTextButtonWidget.prototype.CTOR_JkWidgetCommonTextButtonWidget_JkUiGuiApplicationContext = function(ctx) {
	this.widgetPaddingHorizontal = -1;
	this.widgetPadding = -1;
	this.widgetFontResource = null;
	this.widgetFontFamily = "Arial";
	this.widgetFontSize = 0;
	this.widgetTextColor = null;
	this.widgetPressedBackgroundColor = null;
	this.widgetBackgroundColor = null;
	this.widgetRoundingRadius = 0.0;
	this.widgetText = null;
	this.widgetClickHandler = null;
	this.widgetContext = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.widgetContext = ctx;
	this.setWidgetStyle("TextButtonWidget");
	return this;
};

JkWidgetCommonTextButtonWidget.forText = function(context, text, handler) {
	var v = JkWidgetCommonTextButtonWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetText(text);
	if(handler != null) {
		v.setWidgetClickHandler(handler);
	}
	return v;
};

JkWidgetCommonTextButtonWidget.prototype.setWidgetClickHandler = function(handler) {
	this.widgetClickHandler = handler;
	return this;
};

JkWidgetCommonTextButtonWidget.prototype.getWidgetClickHandler = function() {
	return this.widgetClickHandler;
};

JkWidgetCommonTextButtonWidget.prototype.setWidgetStyle = function(style) {
	this.widgetRoundingRadius = this.context.getStylePixels(style, "roundingRadius", null);
	this.widgetBackgroundColor = this.context.getStyleColor(style, "backgroundColor", null);
	this.widgetPressedBackgroundColor = this.context.getStyleColor(style, "pressedColor", null);
	this.widgetTextColor = this.context.getStyleColor(style, "textColor", null);
	this.widgetFontSize = this.context.getStylePixels(style, "fontSize", null);
	this.widgetFontFamily = this.context.getStyleString(style, "fontFamily", null);
	this.widgetFontResource = this.context.getStyleString(style, "fontResource", null);
	this.widgetPadding = this.context.getStylePixels(style, "padding", null);
	return this;
};

JkWidgetCommonTextButtonWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	var bgc = this.widgetBackgroundColor;
	if(!(bgc != null)) {
		bgc = JkGfxColor.forRGBDouble(0.6, 0.6, 0.6);
	}
	var canvas = JkWidgetCanvasWidget.forColor(this.context, bgc);
	canvas.setWidgetRoundingRadius1(this.widgetRoundingRadius);
	this.addWidget(canvas);
	var pbgc = this.widgetPressedBackgroundColor;
	if(!(pbgc != null)) {
		pbgc = this.createDefaultPressColor(bgc);
	}
	var cvn = canvas;
	var c1 = bgc;
	var c2 = pbgc;
	var thisWidget = this;
	JkWidgetWidget.setWidgetPointerHandlers(this, (function(x1, y1) {
		cvn.setWidgetColor(c2);
	}.bind(this)), null, (function(x3, y3) {
		if(this.widgetClickHandler != null && x3 <= JkWidgetWidget.getWidth(thisWidget) && y3 <= JkWidgetWidget.getHeight(thisWidget) && x3 >= 0 && y3 >= 0) {
			this.widgetClickHandler();
		}
		cvn.setWidgetColor(c1);
	}.bind(this)));
	var fgc = this.widgetTextColor;
	if(!(fgc != null)) {
		if(bgc.isLightColor()) {
			fgc = JkGfxColor.forRGB(0, 0, 0);
		}
		else {
			fgc = JkGfxColor.forRGB(0xff, 0xff, 0xff);
		}
	}
	var padding = this.widgetPadding;
	if(padding < 0) {
		padding = this.context.getHeightValue("2mm");
	}
	var label = JkWidgetLabelWidget.forText(this.context, this.widgetText);
	label.setWidgetTextColor(fgc);
	if(this.widgetFontResource != null) {
		label.setWidgetFontResource(this.widgetFontResource);
	}
	label.setWidgetFontFamily(this.widgetFontFamily);
	if(this.widgetFontSize > 0) {
		label.setWidgetFontSize(this.widgetFontSize);
	}
	var aw = JkWidgetAlignWidget.forWidget(this.context, label, 0.5, 0.5, padding);
	if(this.widgetPaddingHorizontal >= 0) {
		aw.setWidgetMarginLeft(this.widgetPaddingHorizontal);
		aw.setWidgetMarginRight(this.widgetPaddingHorizontal);
	}
	this.addWidget(aw);
	JkUiHTMLDOM.setStyle(this.element, "cursor", "pointer");
};

JkWidgetCommonTextButtonWidget.prototype.createDefaultPressColor = function(bg) {
	if(!(bg != null)) {
		return null;
	}
	var r = bg.getRedInt() * ~(~(1 - ~(~0.25)));
	var g = bg.getGreenInt() * ~(~(1 - ~(~0.25)));
	var b = bg.getBlueInt() * ~(~(1 - ~(~0.25)));
	return JkGfxColor.forRGB(r, g, b);
};

JkWidgetCommonTextButtonWidget.prototype.getWidgetText = function() {
	return this.widgetText;
};

JkWidgetCommonTextButtonWidget.prototype.setWidgetText = function(v) {
	this.widgetText = v;
	return this;
};

JkWidgetCommonTextButtonWidget.prototype.getWidgetRoundingRadius = function() {
	return this.widgetRoundingRadius;
};

JkWidgetCommonTextButtonWidget.prototype.setWidgetRoundingRadius = function(v) {
	this.widgetRoundingRadius = v;
	return this;
};

JkWidgetCommonTextButtonWidget.prototype.getWidgetBackgroundColor = function() {
	return this.widgetBackgroundColor;
};

JkWidgetCommonTextButtonWidget.prototype.setWidgetBackgroundColor = function(v) {
	this.widgetBackgroundColor = v;
	return this;
};

JkWidgetCommonTextButtonWidget.prototype.getWidgetPressedBackgroundColor = function() {
	return this.widgetPressedBackgroundColor;
};

JkWidgetCommonTextButtonWidget.prototype.setWidgetPressedBackgroundColor = function(v) {
	this.widgetPressedBackgroundColor = v;
	return this;
};

JkWidgetCommonTextButtonWidget.prototype.getWidgetTextColor = function() {
	return this.widgetTextColor;
};

JkWidgetCommonTextButtonWidget.prototype.setWidgetTextColor = function(v) {
	this.widgetTextColor = v;
	return this;
};

JkWidgetCommonTextButtonWidget.prototype.getWidgetFontSize = function() {
	return this.widgetFontSize;
};

JkWidgetCommonTextButtonWidget.prototype.setWidgetFontSize = function(v) {
	this.widgetFontSize = v;
	return this;
};

JkWidgetCommonTextButtonWidget.prototype.getWidgetFontFamily = function() {
	return this.widgetFontFamily;
};

JkWidgetCommonTextButtonWidget.prototype.setWidgetFontFamily = function(v) {
	this.widgetFontFamily = v;
	return this;
};

JkWidgetCommonTextButtonWidget.prototype.getWidgetFontResource = function() {
	return this.widgetFontResource;
};

JkWidgetCommonTextButtonWidget.prototype.setWidgetFontResource = function(v) {
	this.widgetFontResource = v;
	return this;
};

JkWidgetCommonTextButtonWidget.prototype.getWidgetPadding = function() {
	return this.widgetPadding;
};

JkWidgetCommonTextButtonWidget.prototype.setWidgetPadding = function(v) {
	this.widgetPadding = v;
	return this;
};

JkWidgetCommonTextButtonWidget.prototype.getWidgetPaddingHorizontal = function() {
	return this.widgetPaddingHorizontal;
};

JkWidgetCommonTextButtonWidget.prototype.setWidgetPaddingHorizontal = function(v) {
	this.widgetPaddingHorizontal = v;
	return this;
};

JkWidgetCommonTextButtonWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonTextButtonWidget"] === true;
};

let JkWidgetCommonNavigationFrameWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.contentArea = null;
	this.actionBar = null;
	this.dimWidget = null;
	this.sidebarWidget = null;
	this.sidebarSlotLeft = null;
	this.sidebarIsFixed = false;
	this.sidebarIsDisplayed = false;
	this.widgetEnableSidebar = true;
	this.widgetEnableActionBar = true;
	this.widgetActionBarIsFloating = false;
	this.widgetActionBarBackgroundColor = null;
	this.widgetActionBarTextColor = null;
	this.widgetActionBarMenuItemSpacing = 0;
	this.widgetBackgroundColor = null;
	this.widgetBurgerMenuImageResourceName = "burger";
};

JkWidgetCommonNavigationFrameWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonNavigationFrameWidget.prototype.constructor = JkWidgetCommonNavigationFrameWidget;
JkWidgetCommonNavigationFrameWidget.prototype._t = {
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetCommonNavigationFrameWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetTitleContainerWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonNavigationFrameWidget.prototype._tobj = JkWidgetCommonNavigationFrameWidget;

JkWidgetCommonNavigationFrameWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCommonNavigationFrameWidget;
	return v.CTOR_JkWidgetCommonNavigationFrameWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCommonNavigationFrameWidget.prototype.CTOR_JkWidgetCommonNavigationFrameWidget_JkUiGuiApplicationContext = function(ctx) {
	this.widgetBurgerMenuImageResourceName = "burger";
	this.widgetBackgroundColor = null;
	this.widgetActionBarMenuItemSpacing = 0;
	this.widgetActionBarTextColor = null;
	this.widgetActionBarBackgroundColor = null;
	this.widgetActionBarIsFloating = false;
	this.widgetEnableActionBar = true;
	this.widgetEnableSidebar = true;
	this.sidebarIsDisplayed = false;
	this.sidebarIsFixed = false;
	this.sidebarSlotLeft = null;
	this.sidebarWidget = null;
	this.dimWidget = null;
	this.actionBar = null;
	this.contentArea = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.widgetActionBarBackgroundColor = JkGfxColor.black();
	this.widgetActionBarTextColor = JkGfxColor.white();
	return this;
};

JkWidgetCommonNavigationFrameWidget.prototype.getActionBarMenuItems = function() {
	return null;
};

JkWidgetCommonNavigationFrameWidget.prototype.getMenuHandler = function() {
	return null;
};

JkWidgetCommonNavigationFrameWidget.prototype.getAppIconResource = function() {
	return null;
};

JkWidgetCommonNavigationFrameWidget.prototype.getAppMenuHandler = function() {
	return null;
};

JkWidgetCommonNavigationFrameWidget.prototype.getAppMenu = function() {
	return null;
};

JkWidgetCommonNavigationFrameWidget.prototype.defaultLeftButtonConfiguration = function() {
	if(!(this.actionBar != null)) {
		return;
	}
	var handler = this.getMenuHandler();
	if(this.widgetEnableSidebar == false) {
		this.actionBar.configureLeftButton(null, null);
	}
	else if(handler == null) {
		if(this.sidebarIsFixed == false) {
			this.actionBar.configureLeftButton(this.widgetBurgerMenuImageResourceName, (function() {
				this.displaySidebarWidget(true);
			}.bind(this)));
		}
		else {
			this.actionBar.configureLeftButton(null, null);
		}
	}
	else {
		this.actionBar.configureLeftButton(this.widgetBurgerMenuImageResourceName, handler);
	}
};

JkWidgetCommonNavigationFrameWidget.prototype.updateMenuButton = function() {
	this.defaultLeftButtonConfiguration();
};

JkWidgetCommonNavigationFrameWidget.prototype.createSidebarWidget = function() {
	return null;
};

JkWidgetCommonNavigationFrameWidget.prototype.enableFixedSidebar = function() {
	if(this.sidebarWidget == null || this.sidebarSlotLeft == null || this.sidebarIsFixed) {
		return;
	}
	this.hideSidebarWidget(false);
	this.sidebarIsFixed = true;
	this.sidebarSlotLeft.addWidget(this.sidebarWidget);
	this.updateMenuButton();
};

JkWidgetCommonNavigationFrameWidget.prototype.disableFixedSidebar = function() {
	if(this.sidebarIsDisplayed || this.sidebarIsFixed == false) {
		return;
	}
	JkWidgetWidget.removeFromParent(this.sidebarWidget);
	this.sidebarIsFixed = false;
	this.updateMenuButton();
};

JkWidgetCommonNavigationFrameWidget.prototype.updateSidebarWidthRequest = function(sz) {
	var v = 0;
	if(this.sidebarIsFixed == false && this.sidebarIsDisplayed && this.sidebarWidget != null) {
		var layer = (function(o) {
			if(JkWidgetLayerWidget.IS_INSTANCE && JkWidgetLayerWidget.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))((JkWidgetWidget.getParent(this.sidebarWidget)));
		if(layer != null) {
			v = ~(~(0.8 * ~(~sz)));
			layer.setWidgetMaximumWidthRequest(v);
		}
	}
	return v;
};

JkWidgetCommonNavigationFrameWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	if(widthConstraint > this.context.getWidthValue("200mm")) {
		this.enableFixedSidebar();
	}
	else {
		this.disableFixedSidebar();
	}
	JkWidgetLayerWidget.prototype.computeWidgetLayout.call(this, widthConstraint);
};

JkWidgetCommonNavigationFrameWidget.prototype.displaySidebarWidget = function(animated) {
	if(this.sidebarIsFixed || this.sidebarIsDisplayed || this.sidebarWidget == null) {
		return;
	}
	if(this.dimWidget == null) {
		this.dimWidget = JkWidgetCanvasWidget.forColor(this.context, (JkGfxColor.forRGBADouble(0.0, 0.0, 0.0, 0.8)));
	}
	this.addWidget(this.dimWidget);
	this.sidebarIsDisplayed = true;
	var box = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	box.addWidget((JkWidgetLayerWidget.forWidget(this.context, this.sidebarWidget, 0)));
	var filler = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	JkWidgetWidget.setWidgetClickHandler(filler, (function() {
		this.hideSidebarWidget(true);
	}.bind(this)));
	box.addWidget1(filler, 1);
	var sidebarWidthRequest = this.updateSidebarWidthRequest((JkWidgetWidget.getWidth(this)));
	this.addWidget(box);
	if(animated) {
		JkWidgetWidget.setAlpha(box, 0.0);
		var sx = -sidebarWidthRequest;
		JkWidgetWidget.move(box, sx, (JkWidgetWidget.getY(box)));
		JkWidgetWidget.setAlpha(this.dimWidget, 0.0);
		var anim = JkWidgetWidgetAnimation.forDuration(this.context, 250);
		anim.addCallback((function(completion1) {
			var dx = ~(~(sx + ~(~((0 - sx) * completion1))));
			if(dx > 0) {
				dx = 0;
			}
			JkWidgetWidget.move(box, dx, (JkWidgetWidget.getY(box)));
			JkWidgetWidget.setAlpha(this.dimWidget, completion1);
			JkWidgetWidget.setAlpha(box, completion1);
		}.bind(this)));
		anim.start();
	}
};

JkWidgetCommonNavigationFrameWidget.prototype.hideSidebarWidget = function(animated) {
	if(this.sidebarIsDisplayed == false) {
		return;
	}
	this.sidebarIsDisplayed = false;
	var box = JkWidgetWidget.getParent((JkWidgetWidget.getParent(this.sidebarWidget)));
	if(animated) {
		var fx = -JkWidgetWidget.getWidth(this.sidebarWidget);
		var anim = JkWidgetWidgetAnimation.forDuration(this.context, 250);
		anim.addCallback((function(completion1) {
			var dx = ~(~(fx * completion1));
			JkWidgetWidget.move(box, dx, (JkWidgetWidget.getY(box)));
			JkWidgetWidget.setAlpha(this.dimWidget, (1.0 - completion1));
		}.bind(this)));
		anim.setEndListener((function() {
			JkWidgetWidget.removeFromParent(this.sidebarWidget);
			JkWidgetWidget.removeFromParent(box);
			JkWidgetWidget.removeFromParent(this.dimWidget);
		}.bind(this)));
		anim.start();
	}
	else {
		JkWidgetWidget.removeFromParent(this.sidebarWidget);
		JkWidgetWidget.removeFromParent(box);
		JkWidgetWidget.removeFromParent(this.dimWidget);
	}
};

JkWidgetCommonNavigationFrameWidget.prototype.createBackground = function() {
	var bgc = this.getWidgetBackgroundColor();
	if(bgc != null) {
		this.addWidget((JkWidgetCanvasWidget.forColor(this.context, bgc)));
	}
};

JkWidgetCommonNavigationFrameWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	this.createBackground();
	var mainContainer = JkWidgetVerticalBoxWidget.forContext(this.context, 0, 0);
	if(this.widgetEnableActionBar) {
		this.actionBar = JkWidgetCommonActionBarWidget.NEW_JkUiGuiApplicationContext(this.context);
		this.actionBar.setWidgetBackgroundColor(this.widgetActionBarBackgroundColor);
		this.actionBar.setWidgetTextColor(this.widgetActionBarTextColor);
		this.actionBar.setWidgetMenuItemSpacing(this.widgetActionBarMenuItemSpacing);
		var appIcon = this.getAppIconResource();
		if(JkLangString.isEmpty(appIcon) == false) {
			var menu = this.getAppMenu();
			if(menu != null) {
				this.actionBar.configureRightButtonMenu(appIcon, menu);
			}
			else {
				var handler = this.getAppMenuHandler();
				if(handler != null) {
					this.actionBar.configureRightButton(appIcon, handler);
				}
			}
		}
	}
	if(this.actionBar != null && this.widgetActionBarIsFloating == false) {
		mainContainer.addWidget(this.actionBar);
	}
	this.contentArea = JkWidgetCommonSwitcherLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	if(this.actionBar != null && this.widgetActionBarIsFloating == true) {
		var ll = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
		ll.addWidget(this.contentArea);
		ll.addWidget((JkWidgetVerticalBoxWidget.forContext(this.context, 0, 0).addWidget1(this.actionBar, 0.0).addWidget1((JkWidgetContainerWidget.NEW_JkUiGuiApplicationContext(this.context)), 1.0)));
		mainContainer.addWidget1(ll, 1.0);
	}
	else {
		mainContainer.addWidget1(this.contentArea, 1.0);
	}
	var superMainContainer = JkWidgetHorizontalBoxWidget.forContext(this.context, 0, 0);
	this.sidebarSlotLeft = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	superMainContainer.addWidget(this.sidebarSlotLeft);
	superMainContainer.addWidget1(mainContainer, 1);
	this.addWidget(superMainContainer);
	this.sidebarWidget = this.createSidebarWidget();
	this.updateMenuButton();
};

JkWidgetCommonNavigationFrameWidget.prototype.updateWidgetTitle = function(title) {
	if(this.actionBar != null) {
		this.actionBar.setWidgetTitle(title);
	}
};

JkWidgetCommonNavigationFrameWidget.prototype.onCurrentWidgetChanged = function() {
	if(!(this.contentArea != null)) {
		return;
	}
	var widget = null;
	var widgets = JkWidgetWidget.getChildren(this.contentArea);
	if(widgets != null && JkLangVector.getSize(widgets) > 0) {
		widget = JkLangVector.get(widgets, (JkLangVector.getSize(widgets) - 1));
	}
	if(widget != null && (JkWidgetDisplayAwareWidget.IS_INSTANCE && JkWidgetDisplayAwareWidget.IS_INSTANCE(widget))) {
		widget.onWidgetDisplayed();
	}
	if(widget != null && (JkWidgetTitledWidget.IS_INSTANCE && JkWidgetTitledWidget.IS_INSTANCE(widget))) {
		this.updateWidgetTitle((widget.getWidgetTitle()));
	}
	else {
		this.updateWidgetTitle("");
	}
	if(widget != null && (JkWidgetCommonActionBarControlWidget.IS_INSTANCE && JkWidgetCommonActionBarControlWidget.IS_INSTANCE(widget))) {
		if(!(this.actionBar != null)) {
			return;
		}
		this.actionBar.removeOverlay();
		var customBar = widget.createActionBarOverlay(this.actionBar);
		if(customBar != null) {
			this.actionBar.addOverlay(customBar);
		}
		this.actionBar.clearMenuItems();
		var menuItems = widget.getActionBarItems();
		if(menuItems != null) {
			this.actionBar.configureMenuItems(menuItems);
		}
		widget.setActionBarBackgroundColor(this.actionBar);
	}
	else {
		if(this.actionBar != null) {
			this.actionBar.removeOverlay();
			this.actionBar.clearMenuItems();
			this.actionBar.setActionBarBackgroundColor(this.widgetActionBarBackgroundColor);
		}
		var menuItems1 = this.getActionBarMenuItems();
		if(menuItems1 != null) {
			this.actionBar.configureMenuItems(menuItems1);
		}
	}
	this.updateMenuButton();
};

JkWidgetCommonNavigationFrameWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
};

JkWidgetCommonNavigationFrameWidget.prototype.getWidgetEnableSidebar = function() {
	return this.widgetEnableSidebar;
};

JkWidgetCommonNavigationFrameWidget.prototype.setWidgetEnableSidebar = function(v) {
	this.widgetEnableSidebar = v;
	return this;
};

JkWidgetCommonNavigationFrameWidget.prototype.getWidgetEnableActionBar = function() {
	return this.widgetEnableActionBar;
};

JkWidgetCommonNavigationFrameWidget.prototype.setWidgetEnableActionBar = function(v) {
	this.widgetEnableActionBar = v;
	return this;
};

JkWidgetCommonNavigationFrameWidget.prototype.getWidgetActionBarIsFloating = function() {
	return this.widgetActionBarIsFloating;
};

JkWidgetCommonNavigationFrameWidget.prototype.setWidgetActionBarIsFloating = function(v) {
	this.widgetActionBarIsFloating = v;
	return this;
};

JkWidgetCommonNavigationFrameWidget.prototype.getWidgetActionBarBackgroundColor = function() {
	return this.widgetActionBarBackgroundColor;
};

JkWidgetCommonNavigationFrameWidget.prototype.setWidgetActionBarBackgroundColor = function(v) {
	this.widgetActionBarBackgroundColor = v;
	return this;
};

JkWidgetCommonNavigationFrameWidget.prototype.getWidgetActionBarTextColor = function() {
	return this.widgetActionBarTextColor;
};

JkWidgetCommonNavigationFrameWidget.prototype.setWidgetActionBarTextColor = function(v) {
	this.widgetActionBarTextColor = v;
	return this;
};

JkWidgetCommonNavigationFrameWidget.prototype.getWidgetActionBarMenuItemSpacing = function() {
	return this.widgetActionBarMenuItemSpacing;
};

JkWidgetCommonNavigationFrameWidget.prototype.setWidgetActionBarMenuItemSpacing = function(v) {
	this.widgetActionBarMenuItemSpacing = v;
	return this;
};

JkWidgetCommonNavigationFrameWidget.prototype.getWidgetBackgroundColor = function() {
	return this.widgetBackgroundColor;
};

JkWidgetCommonNavigationFrameWidget.prototype.setWidgetBackgroundColor = function(v) {
	this.widgetBackgroundColor = v;
	return this;
};

JkWidgetCommonNavigationFrameWidget.prototype.getWidgetBurgerMenuImageResourceName = function() {
	return this.widgetBurgerMenuImageResourceName;
};

JkWidgetCommonNavigationFrameWidget.prototype.setWidgetBurgerMenuImageResourceName = function(v) {
	this.widgetBurgerMenuImageResourceName = v;
	return this;
};

JkWidgetCommonNavigationFrameWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonNavigationFrameWidget"] === true;
};

let JkWidgetCommonActionBarControlWidget = {};

JkWidgetCommonActionBarControlWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonActionBarControlWidget"] === true;
};

let JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget = function() {
	JkWidgetVerticalBoxWidget.call(this);
	this.widgetHeightChangeListener = null;
};

JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetVerticalBoxWidget.prototype);
JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget.prototype.constructor = JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget;
JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget" : true,
	"JkWidgetVerticalBoxWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget.prototype._tobj = JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget;

JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget;
	return v.CTOR_JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget.prototype.CTOR_JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget_JkUiGuiApplicationContext = function(context) {
	this.widgetHeightChangeListener = null;
	if(JkWidgetVerticalBoxWidget.prototype.CTOR_JkWidgetVerticalBoxWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget.prototype.onWidgetHeightChanged = function(height) {
	JkWidgetVerticalBoxWidget.prototype.onWidgetHeightChanged.call(this, height);
	if(this.widgetHeightChangeListener != null) {
		this.widgetHeightChangeListener(height);
	}
};

JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget.prototype.clear = function() {
	JkWidgetWidget.removeChildrenOf(this);
};

JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget.prototype.createWidget = function() {
	JkWidgetVerticalBoxWidget.prototype.createWidget.call(this);
	var thisWidget = this;
};

JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget.prototype.getWidgetHeightChangeListener = function() {
	return this.widgetHeightChangeListener;
};

JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget.prototype.setWidgetHeightChangeListener = function(v) {
	this.widgetHeightChangeListener = v;
	return this;
};

JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget"] === true;
};

let JkWidgetCommonDynamicVerticalScrollerWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetProviderHandler = null;
	this.widgetProvider = null;
	this.widgetItemAddCount = 5;
	this.lastContainerHeight = -1;
	this.onScrollNearEndEventRaised = false;
	this.isAdding = false;
	this.scroller = null;
	this.container = null;
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonDynamicVerticalScrollerWidget.prototype.constructor = JkWidgetCommonDynamicVerticalScrollerWidget;
JkWidgetCommonDynamicVerticalScrollerWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCommonDynamicVerticalScrollerWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonDynamicVerticalScrollerWidget.prototype._tobj = JkWidgetCommonDynamicVerticalScrollerWidget;

JkWidgetCommonDynamicVerticalScrollerWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonDynamicVerticalScrollerWidget;
	return v.CTOR_JkWidgetCommonDynamicVerticalScrollerWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.CTOR_JkWidgetCommonDynamicVerticalScrollerWidget_JkUiGuiApplicationContext = function(context) {
	this.container = null;
	this.scroller = null;
	this.isAdding = false;
	this.onScrollNearEndEventRaised = false;
	this.lastContainerHeight = -1;
	this.widgetItemAddCount = 5;
	this.widgetProvider = null;
	this.widgetProviderHandler = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonDynamicVerticalScrollerWidget.forHandler = function(context, handler) {
	var v = JkWidgetCommonDynamicVerticalScrollerWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetProviderHandler(handler);
	return v;
};

JkWidgetCommonDynamicVerticalScrollerWidget.forProvider = function(context, provider) {
	var v = JkWidgetCommonDynamicVerticalScrollerWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetProvider(provider);
	return v;
};

JkWidgetCommonDynamicVerticalScrollerWidget.forWidgets = function(context, widgets) {
	var v = JkWidgetCommonDynamicVerticalScrollerWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetProvider((JkWidgetStaticWidgetProvider.forWidgets(widgets)));
	return v;
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.setWidgetContainerSpacing = function(height) {
	if(!(this.container != null)) {
		this.forceCreateWidget();
	}
	this.container.setWidgetSpacing(height);
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.setWidgetContainerMargin = function(height) {
	if(!(this.container != null)) {
		this.forceCreateWidget();
	}
	this.container.setWidgetMargin(height);
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	this.scroller.setOnScrolledHandler((function(direction1) {
		this.onScroll(direction1);
	}.bind(this)));
	this.onAddWidget(this.container);
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.onScroll = function(direction) {
	if(!(this.scroller.isNearEnd() && !this.onScrollNearEndEventRaised)) {
		return;
	}
	this.onScrollNearEndEventRaised = true;
	var containerHeight = JkWidgetWidget.getHeight(this.container);
	if(!(containerHeight > JkWidgetWidget.getHeight(this.scroller) && this.lastContainerHeight != containerHeight)) {
		this.onScrollNearEndEventRaised = false;
		return;
	}
	this.lastContainerHeight = containerHeight;
	this.onScrollNearEnd();
	this.onScrollNearEndEventRaised = false;
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.onContainerHeightChanged = function(newHeight) {
	if(JkWidgetWidget.getHeight(this.scroller) * 2 > newHeight) {
		this.showNextWidgets();
	}
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.onScrollNearEnd = function() {
	this.showNextWidgets();
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.showNextWidgets = function() {
	if(!(!this.isAdding)) {
		return;
	}
	this.isAdding = true;
	var count = this.widgetItemAddCount;
	while(count > 0){
		this.onAddWidget(this.container);
		count--;
	}
	this.isAdding = false;
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.onAddWidget = function(container) {
	var widget = null;
	if(this.widgetProvider != null) {
		widget = this.widgetProvider.getNextWidget();
	}
	else if(this.widgetProviderHandler != null) {
		widget = this.widgetProviderHandler();
	}
	if(widget != null) {
		container.addWidget(widget);
	}
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.clear = function() {
	this.container.clear();
	if(this.widgetProvider != null) {
		this.widgetProvider.reset();
	}
	this.showNextWidgets();
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.scroller = JkWidgetVerticalScrollerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.scroller.setWidgetScrollBarDisabled(true);
	this.container = JkWidgetCommonDynamicVerticalScrollerWidgetMyContainerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.container.setWidgetHeightChangeListener((function(height1) {
		this.onContainerHeightChanged(height1);
	}.bind(this)));
	this.scroller.addWidget(this.container);
	this.addWidget(this.scroller);
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.getWidgetProviderHandler = function() {
	return this.widgetProviderHandler;
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.setWidgetProviderHandler = function(v) {
	this.widgetProviderHandler = v;
	return this;
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.getWidgetProvider = function() {
	return this.widgetProvider;
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.setWidgetProvider = function(v) {
	this.widgetProvider = v;
	return this;
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.getWidgetItemAddCount = function() {
	return this.widgetItemAddCount;
};

JkWidgetCommonDynamicVerticalScrollerWidget.prototype.setWidgetItemAddCount = function(v) {
	this.widgetItemAddCount = v;
	return this;
};

JkWidgetCommonDynamicVerticalScrollerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonDynamicVerticalScrollerWidget"] === true;
};

let JkWidgetCommonHyperLinkWidget = function() {
	JkWidgetWidget.call(this);
	this.widgetContext = null;
	this.widgetText = null;
	this.widgetTextColor = null;
	this.widgetFontSize = 0.0;
	this.widgetClickHandler = null;
	this.widgetUrl = null;
};

JkWidgetCommonHyperLinkWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetCommonHyperLinkWidget.prototype.constructor = JkWidgetCommonHyperLinkWidget;
JkWidgetCommonHyperLinkWidget.prototype._t = {
	"JkWidgetWidget" : true,
	"JkWidgetCommonHyperLinkWidget" : true
};
JkWidgetCommonHyperLinkWidget.prototype._tobj = JkWidgetCommonHyperLinkWidget;

JkWidgetCommonHyperLinkWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonHyperLinkWidget;
	return v.CTOR_JkWidgetCommonHyperLinkWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonHyperLinkWidget.prototype.CTOR_JkWidgetCommonHyperLinkWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.widgetUrl = null;
	this.widgetClickHandler = null;
	this.widgetFontSize = 0.0;
	this.widgetTextColor = null;
	this.widgetText = null;
	this.widgetContext = null;
	this.widgetContext = context;
	this.setWidgetTextColor((JkGfxColor.forRGB(0, 0, 0xff)));
	this.setWidgetFontSize((context.getHeightValue("3mm")));
	return this;
};

JkWidgetCommonHyperLinkWidget.forText = function(context, text, handler) {
	var v = JkWidgetCommonHyperLinkWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetText(text);
	v.setWidgetClickHandler(handler);
	return v;
};

JkWidgetCommonHyperLinkWidget.prototype.createElement = function() {
	var v = JkUiHTMLDOM.createElement("a");
	JkUiHTMLDOM.setAttribute(v, "href", "javascript:void(0)");
	return v;
};

JkWidgetCommonHyperLinkWidget.prototype.prepareElement = function(v) {
	JkWidgetWidget.prototype.prepareElement.call(this, v);
	JkUiHTMLDOM.setStyle(v, "display", "block");
	JkUiHTMLDOM.setStyle(v, "font-size", "20px");
	JkUiHTMLDOM.setFontFamily(v, "Arial");
};

JkWidgetCommonHyperLinkWidget.prototype.setWidgetText = function(text) {
	this.widgetText = text;
	JkUiHTMLDOM.setTextContent(this.element, text);
};

JkWidgetCommonHyperLinkWidget.prototype.getWidgetText = function() {
	return this.widgetText;
};

JkWidgetCommonHyperLinkWidget.prototype.setWidgetTextColor = function(color) {
	this.widgetTextColor = color;
	JkUiHTMLDOM.setStyle(this.element, "color", (color.toRgbString()));
	return this;
};

JkWidgetCommonHyperLinkWidget.prototype.getWidgetTextColor = function() {
	return this.widgetTextColor;
};

JkWidgetCommonHyperLinkWidget.prototype.setWidgetFontSize = function(fontSize) {
	this.widgetFontSize = fontSize;
	JkUiHTMLDOM.setStyle(this.element, "font-size", (JkLangString.safeString((JkLangString.forDouble(fontSize)))) + ("px"));
};

JkWidgetCommonHyperLinkWidget.prototype.getFontSize = function() {
	return this.widgetFontSize;
};

JkWidgetCommonHyperLinkWidget.prototype.setWidgetClickHandler = function(handler) {
	this.widgetClickHandler = handler;
	JkWidgetWidget.setWidgetClickHandler(this, handler);
};

JkWidgetCommonHyperLinkWidget.prototype.setWidgetUrl = function(url) {
	this.widgetUrl = url;
	JkUiHTMLDOM.setAttribute(this.element, "href", url);
};

JkWidgetCommonHyperLinkWidget.prototype.getWidgetUrl = function() {
	return this.widgetUrl;
};

JkWidgetCommonHyperLinkWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonHyperLinkWidget"] === true;
};

let JkWidgetCommonMenuBarWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.box = null;
};

JkWidgetCommonMenuBarWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonMenuBarWidget.prototype.constructor = JkWidgetCommonMenuBarWidget;
JkWidgetCommonMenuBarWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCommonMenuBarWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonMenuBarWidget.prototype._tobj = JkWidgetCommonMenuBarWidget;

JkWidgetCommonMenuBarWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonMenuBarWidget;
	return v.CTOR_JkWidgetCommonMenuBarWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonMenuBarWidget.prototype.CTOR_JkWidgetCommonMenuBarWidget_JkUiGuiApplicationContext = function(context) {
	this.box = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonMenuBarWidget.prototype.addMenu = function(title, menu) {
	var v = menu;
	if(!(v != null)) {
		v = JkWidgetMenu.NEW();
	}
	var m = v;
	var button = JkWidgetCommonTextButtonWidget.forText(this.context, title, null);
	button.setWidgetPadding((this.context.getHeightValue("1mm")));
	button.setWidgetPaddingHorizontal((this.context.getWidthValue("3mm")));
	button.setWidgetBackgroundColor((JkGfxColor.forString("#BBBBBB")));
	button.setWidgetClickHandler((function() {
		JkWidgetCommonPopupMenu.showBelow(this.context, button, m, (-1), (-1));
	}.bind(this)));
	this.box.addWidget(button);
	return v;
};

JkWidgetCommonMenuBarWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	var widget = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget.setWidgetColor((JkGfxColor.forString("#BBBBBB")));
	this.addWidget(widget);
	this.box = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.box.setWidgetSpacing((this.context.getWidthValue("300um")));
	this.box.setWidgetMargin((this.context.getWidthValue("300um")));
	this.addWidget(this.box);
};

JkWidgetCommonMenuBarWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonMenuBarWidget"] === true;
};

let JkWidgetCommonRouteNavigationWidgetRoute = function() {
	this.name = null;
	this.handler = null;
};

JkWidgetCommonRouteNavigationWidgetRoute.prototype._t = { "JkWidgetCommonRouteNavigationWidgetRoute" : true };
JkWidgetCommonRouteNavigationWidgetRoute.prototype._tobj = JkWidgetCommonRouteNavigationWidgetRoute;

JkWidgetCommonRouteNavigationWidgetRoute.NEW = function() {
	var v = new JkWidgetCommonRouteNavigationWidgetRoute;
	return v.CTOR_JkWidgetCommonRouteNavigationWidgetRoute();
};

JkWidgetCommonRouteNavigationWidgetRoute.prototype.CTOR_JkWidgetCommonRouteNavigationWidgetRoute = function() {
	this.handler = null;
	this.name = null;
	return this;
};

JkWidgetCommonRouteNavigationWidgetRoute.prototype.getName = function() {
	return this.name;
};

JkWidgetCommonRouteNavigationWidgetRoute.prototype.setName = function(v) {
	this.name = v;
	return this;
};

JkWidgetCommonRouteNavigationWidgetRoute.prototype.getHandler = function() {
	return this.handler;
};

JkWidgetCommonRouteNavigationWidgetRoute.prototype.setHandler = function(v) {
	this.handler = v;
	return this;
};

JkWidgetCommonRouteNavigationWidgetRoute.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonRouteNavigationWidgetRoute"] === true;
};

let JkWidgetCommonRouteNavigationWidget = function() {
	JkWidgetCommonNavigationFrameWidget.call(this);
	this.routes = null;
};

JkWidgetCommonRouteNavigationWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetCommonNavigationFrameWidget.prototype);
JkWidgetCommonRouteNavigationWidget.prototype.constructor = JkWidgetCommonRouteNavigationWidget;
JkWidgetCommonRouteNavigationWidget.prototype._t = {
	"JkUiRouterListener" : true,
	"JkWidgetCommonRouteNavigationWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetCommonNavigationFrameWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetTitleContainerWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetParentAwareWidget" : true
};
JkWidgetCommonRouteNavigationWidget.prototype._tobj = JkWidgetCommonRouteNavigationWidget;

JkWidgetCommonRouteNavigationWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCommonRouteNavigationWidget;
	return v.CTOR_JkWidgetCommonRouteNavigationWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCommonRouteNavigationWidget.prototype.CTOR_JkWidgetCommonRouteNavigationWidget_JkUiGuiApplicationContext = function(ctx) {
	this.routes = null;
	if(JkWidgetCommonNavigationFrameWidget.prototype.CTOR_JkWidgetCommonNavigationFrameWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.routes = new Map;
	return this;
};

JkWidgetCommonRouteNavigationWidget.prototype.initializeWidget = function() {
	JkWidgetCommonNavigationFrameWidget.prototype.initializeWidget.call(this);
	JkUiRouter.goToDefault();
};

JkWidgetCommonRouteNavigationWidget.prototype.onRouteChanged = function(route) {
	var w = this.getWidget(route);
	if(!(w != null)) {
		return;
	}
	JkWidgetWidget.removeChildrenOf(this.contentArea);
	this.contentArea.addWidget(w);
	if(JkWidgetDisplayAwareWidget.IS_INSTANCE && JkWidgetDisplayAwareWidget.IS_INSTANCE(w)) {
		w.onWidgetDisplayed();
	}
};

JkWidgetCommonRouteNavigationWidget.prototype.initializeRoutes = function(rs) {
	if(!(rs != null)) {
		return false;
	}
	if(rs != null) {
		var n = 0;
		var m2 = rs.length;
		for(n = 0 ; n < m2 ; n++) {
			var m = (function(o) {
				if(JkWidgetCommonRouteNavigationWidgetRoute.IS_INSTANCE && JkWidgetCommonRouteNavigationWidgetRoute.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))(rs[n]);
			if(m != null) {
				var route = m.getName();
				var widget = m.getHandler();
				this.addRoute(route, widget);
			}
		}
	}
	return true;
};

JkWidgetCommonRouteNavigationWidget.prototype.addRoute = function(route, callback) {
	if(!(this.routes != null)) {
		this.routes = new Map;
	}
	this.routes.set(route, callback);
};

JkWidgetCommonRouteNavigationWidget.prototype.getWidget = function(route) {
	var w = JkLangMap.getValue(this.routes, route);
	if(!(w != null)) {
		w = JkLangMap.getValue(this.routes, "*");
	}
	if(!(w != null)) {
		return null;
	}
	return w();
};

JkWidgetCommonRouteNavigationWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonRouteNavigationWidget"] === true;
};

let JkWidgetCommonAutoSuggestInputWidget = function() {
	JkWidgetCommonTextInputWidget.call(this);
	this.defaultNoRecordMessage = "No record found";
	this.widgetValueChangeHandler = null;
	this.widgetContext = null;
	this.widgetItems = null;
	this.container = null;
	this.myContainer = null;
	this.shown = false;
};

JkWidgetCommonAutoSuggestInputWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetCommonTextInputWidget.prototype);
JkWidgetCommonAutoSuggestInputWidget.prototype.constructor = JkWidgetCommonAutoSuggestInputWidget;
JkWidgetCommonAutoSuggestInputWidget.prototype._t = {
	"JkWidgetCommonAutoSuggestInputWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCommonTextInputWidget" : true,
	"JkWidgetWidgetWithValue" : true
};
JkWidgetCommonAutoSuggestInputWidget.prototype._tobj = JkWidgetCommonAutoSuggestInputWidget;

JkWidgetCommonAutoSuggestInputWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCommonAutoSuggestInputWidget;
	return v.CTOR_JkWidgetCommonAutoSuggestInputWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCommonAutoSuggestInputWidget.prototype.CTOR_JkWidgetCommonAutoSuggestInputWidget_JkUiGuiApplicationContext = function(ctx) {
	this.shown = false;
	this.myContainer = null;
	this.container = null;
	this.widgetItems = null;
	this.widgetContext = null;
	this.widgetValueChangeHandler = null;
	this.defaultNoRecordMessage = "No record found";
	if(JkWidgetCommonTextInputWidget.prototype.CTOR_JkWidgetCommonTextInputWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.widgetContext = ctx;
	this.container = JkWidgetVerticalBoxWidget.forContext(this.widgetContext, 0, 0);
	this.setWidgetTextChangeHandler((function() {
		this.onWidgetTextChanged();
	}.bind(this)));
	return this;
};

JkWidgetCommonAutoSuggestInputWidget.prototype.isWidgetShown = function() {
	return this.shown;
};

JkWidgetCommonAutoSuggestInputWidget.prototype.clearItems = function() {
	if(!(this.container != null)) {
		return;
	}
	JkWidgetWidget.removeChildrenOf(this.container);
};

JkWidgetCommonAutoSuggestInputWidget.prototype.setWidgetItems = function(items) {
	this.widgetItems = items;
};

JkWidgetCommonAutoSuggestInputWidget.prototype.getWidgetItems = function() {
	return this.widgetItems;
};

JkWidgetCommonAutoSuggestInputWidget.prototype.createWidgetItem = function(title, isFirst, index) {
	var textColor = this.widgetContext.getStyleColor("AutoSuggestInputWidget", "textColor", null);
	if(!(textColor != null)) {
		textColor = JkGfxColor.black();
	}
	var backgroundColor = this.widgetContext.getStyleColor("AutoSuggestInputWidget", "backgroundColor", null);
	if(!(backgroundColor != null)) {
		backgroundColor = JkGfxColor.white();
	}
	var outlineColor = this.widgetContext.getStyleColor("AutoSuggestInputWidget", "outlineColor", null);
	if(!(outlineColor != null)) {
		outlineColor = JkGfxColor.black();
	}
	var outlineWidth = this.widgetContext.getStylePixels("AutoSuggestInputWidget", "outlineWidth", null);
	if(outlineWidth < 1) {
		outlineWidth = this.widgetContext.getHeightValue("1px");
	}
	var padding = this.widgetContext.getStylePixels("AutoSuggestInputWidget", "padding", null);
	if(padding < 1) {
		padding = this.widgetContext.getHeightValue("1000um");
	}
	var fontSize = this.widgetContext.getStylePixels("AutoSuggestInputWidget", "fontSize", null);
	if(fontSize < 1) {
		fontSize = this.widgetContext.getHeightValue("2mm");
	}
	var t = title;
	if(JkLangString.isEmpty(t)) {
		t = this.defaultNoRecordMessage;
	}
	var ttitle = t;
	var lbl = JkWidgetLabelWidget.forText(this.widgetContext, t);
	lbl.setWidgetTextColor(textColor);
	var layer = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.widgetContext);
	var canvas = JkWidgetCanvasWidget.forColor(this.widgetContext, backgroundColor);
	canvas.setWidgetOutlineColor(outlineColor);
	canvas.setWidgetOutlineWidth(outlineWidth);
	layer.addWidget(canvas);
	layer.addWidget((JkWidgetLayerWidget.forWidget(this.widgetContext, lbl, padding)));
	if(JkLangString.isNotEmpty(title)) {
		JkWidgetWidget.setWidgetClickHandler(layer, (function() {
			this.setWidgetText(ttitle);
			if(this.widgetValueChangeHandler != null) {
				this.widgetValueChangeHandler();
			}
			this.closePopup();
		}.bind(this)));
	}
	return layer;
};

JkWidgetCommonAutoSuggestInputWidget.prototype.showPopup = function() {
	if(!(this.container != null)) {
		return;
	}
	if(this.shown) {
		return;
	}
	var thisWidget = this;
	var parentLayer = null;
	var parent = JkWidgetWidget.getParent(thisWidget);
	while(parent != null){
		if(JkWidgetLayerWidget.IS_INSTANCE && JkWidgetLayerWidget.IS_INSTANCE(parent)) {
			parentLayer = parent;
		}
		parent = JkWidgetWidget.getParent(parent);
	}
	if(!(parentLayer != null)) {
		console.log("[jk.widget.common.AutoSuggestInputWidget.showPopup] (AutoSuggestInputWidget.sling:137:3): No LayerWidget was found in the widget tree. Cannot show suggestions dropdown!");
		return;
	}
	this.myContainer = JkWidgetCommonAutoSuggestInputWidgetMyContainerWidget.NEW_JkUiGuiApplicationContext(this.widgetContext);
	this.myContainer.setWidget(thisWidget);
	this.myContainer.addWidget(this.container);
	JkUiHTMLDOM.addEventListener((JkUiHTMLDOM.getDocument()), "click", (function() {
		this.closePopup();
	}.bind(this)));
	parentLayer.addWidget(this.myContainer);
	var animationDestY = JkWidgetWidget.getAbsoluteY(thisWidget);
	var ay = this.widgetContext.getHeightValue("3mm");
	JkWidgetWidget.move(this.container, (JkWidgetWidget.getAbsoluteX(thisWidget)), (~(~(animationDestY + ay))));
	var anim = JkWidgetWidgetAnimation.forDuration(this.widgetContext, 300);
	anim.addCallback((function(completion1) {
		var bgf = completion1 * 1.5;
		if(bgf > 1.0) {
			bgf = 1.0;
		}
		JkWidgetWidget.move(this.container, (JkWidgetWidget.getAbsoluteX(thisWidget)), (~(~(animationDestY + ~(~((1.0 - completion1) * ay))))));
	}.bind(this)));
	anim.start();
	this.shown = true;
};

JkWidgetCommonAutoSuggestInputWidget.prototype.closePopup = function() {
	if(!this.shown) {
		return;
	}
	var anim = JkWidgetWidgetAnimation.forDuration(this.widgetContext, 300);
	anim.addFadeOut(this.myContainer, true);
	anim.start();
	this.shown = false;
};

JkWidgetCommonAutoSuggestInputWidget.prototype.onWidgetTextChanged = function() {
	this.clearItems();
	if(JkLangString.getLength((this.getWidgetText())) < 3) {
		this.closePopup();
		return;
	}
	this.searchStringFromItems((this.getWidgetText()));
	this.showPopup();
};

JkWidgetCommonAutoSuggestInputWidget.prototype.searchStringFromItems = function(value) {
	if(!(this.widgetItems != null) || JkLangVector.isEmpty(this.widgetItems)) {
		this.addItemToList(null, false, 0);
	}
	if(this.widgetItems != null) {
		var n = 0;
		var m = this.widgetItems.length;
		for(n = 0 ; n < m ; n++) {
			var item = this.widgetItems[n];
			if(item != null) {
				if(JkLangString.contains((JkLangString.toLowerCase(item)), (JkLangString.toLowerCase(value)))) {
					this.addItemToList(item, false, 0);
				}
			}
		}
	}
	if(JkLangVector.getSize((JkWidgetWidget.getChildren(this.container))) < 1) {
		this.addItemToList(null, false, 0);
	}
};

JkWidgetCommonAutoSuggestInputWidget.prototype.addSuggestedItems = function() {
	if(!(this.widgetItems != null) || JkLangVector.isEmpty(this.widgetItems)) {
		this.addItemToList(null, false, 0);
	}
	var index = 0;
	var isFirst = true;
	if(this.widgetItems != null) {
		var n = 0;
		var m = this.widgetItems.length;
		for(n = 0 ; n < m ; n++) {
			var item = this.widgetItems[n];
			if(item != null) {
				this.addItemToList(item, isFirst, index);
				isFirst = false;
				index++;
			}
		}
	}
};

JkWidgetCommonAutoSuggestInputWidget.prototype.addItemToList = function(item, isFirst, index) {
	var v = this.createWidgetItem(item, isFirst, index);
	if(v != null) {
		this.container.addWidget(v);
	}
};

JkWidgetCommonAutoSuggestInputWidget.prototype.getDefaultNoRecordMessage = function() {
	return this.defaultNoRecordMessage;
};

JkWidgetCommonAutoSuggestInputWidget.prototype.setDefaultNoRecordMessage = function(v) {
	this.defaultNoRecordMessage = v;
	return this;
};

JkWidgetCommonAutoSuggestInputWidget.prototype.getWidgetValueChangeHandler = function() {
	return this.widgetValueChangeHandler;
};

JkWidgetCommonAutoSuggestInputWidget.prototype.setWidgetValueChangeHandler = function(v) {
	this.widgetValueChangeHandler = v;
	return this;
};

JkWidgetCommonAutoSuggestInputWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonAutoSuggestInputWidget"] === true;
};

let JkWidgetCommonRoundedTextBoxWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.outline = null;
	this.background = null;
	this.textInput = null;
};

JkWidgetCommonRoundedTextBoxWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonRoundedTextBoxWidget.prototype.constructor = JkWidgetCommonRoundedTextBoxWidget;
JkWidgetCommonRoundedTextBoxWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetCommonRoundedTextBoxWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonRoundedTextBoxWidget.prototype._tobj = JkWidgetCommonRoundedTextBoxWidget;

JkWidgetCommonRoundedTextBoxWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCommonRoundedTextBoxWidget;
	return v.CTOR_JkWidgetCommonRoundedTextBoxWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCommonRoundedTextBoxWidget.prototype.CTOR_JkWidgetCommonRoundedTextBoxWidget_JkUiGuiApplicationContext = function(ctx) {
	this.textInput = null;
	this.background = null;
	this.outline = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.forceCreateWidget();
	return this;
};

JkWidgetCommonRoundedTextBoxWidget.prototype.setWidgetEnabled = function(enable) {
	JkWidgetWidget.setEnabled(this.textInput, enable);
	return this;
};

JkWidgetCommonRoundedTextBoxWidget.prototype.setWidgetFontSize = function(fontsize) {
	this.textInput.setWidgetFontSize(fontsize);
	return this;
};

JkWidgetCommonRoundedTextBoxWidget.prototype.setWidgetPlaceholder = function(str) {
	this.textInput.setWidgetPlaceholder(str);
	return this;
};

JkWidgetCommonRoundedTextBoxWidget.prototype.setWidgetTextChangeHandler = function(handler) {
	if(!(handler != null)) {
		return null;
	}
	var hnd = handler;
	this.textInput.setWidgetTextChangeHandler((function() {
		hnd((this.textInput.getWidgetText()));
	}.bind(this)));
	return this;
};

JkWidgetCommonRoundedTextBoxWidget.prototype.setWidgetText = function(str) {
	this.textInput.setWidgetText(str);
	return this;
};

JkWidgetCommonRoundedTextBoxWidget.prototype.getWidgetText = function() {
	return this.textInput.getWidgetText();
};

JkWidgetCommonRoundedTextBoxWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.setWidgetMargin((this.context.getHeightValue("1px")));
	this.outline = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.outline.setWidgetColor((JkGfxColor.instance("#BCBEC0")));
	this.outline.setWidgetRoundingRadius1((this.context.getHeightValue("2000um")));
	this.addWidget(this.outline);
	var widget = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.background = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.background.setWidgetColor((JkGfxColor.white()));
	this.background.setWidgetRoundingRadius1((this.context.getHeightValue("2000um")));
	widget.addWidget(this.background);
	widget.setWidgetMargin((this.context.getHeightValue("1px")));
	var widget2 = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(this.context);
	var widget3 = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget3.setWidgetMargin((this.context.getHeightValue("3px")));
	this.textInput = JkWidgetCommonTextInputWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.textInput.setWidgetFontSize((this.context.getHeightValue("2000um")));
	widget3.addWidget(this.textInput);
	widget2.addWidget1(widget3, 0.0, 0.5, true);
	widget.addWidget(widget2);
	this.addWidget(widget);
};

JkWidgetCommonRoundedTextBoxWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonRoundedTextBoxWidget"] === true;
};

let JkWidgetCommonButtonWidget = function() {
	JkWidgetWidget.call(this);
	this.widgetContext = null;
	this.widgetText = null;
	this.widgetTextColor = null;
	this.widgetBackgroundColor = null;
	this.widgetIcon = null;
	this.widgetClickHandler = null;
	this.widgetFont = null;
	this.widgetFontSize = 0.0;
};

JkWidgetCommonButtonWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetCommonButtonWidget.prototype.constructor = JkWidgetCommonButtonWidget;
JkWidgetCommonButtonWidget.prototype._t = {
	"JkWidgetWidget" : true,
	"JkWidgetCommonButtonWidget" : true
};
JkWidgetCommonButtonWidget.prototype._tobj = JkWidgetCommonButtonWidget;

JkWidgetCommonButtonWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonButtonWidget;
	return v.CTOR_JkWidgetCommonButtonWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonButtonWidget.prototype.CTOR_JkWidgetCommonButtonWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.widgetFontSize = 0.0;
	this.widgetFont = null;
	this.widgetClickHandler = null;
	this.widgetIcon = null;
	this.widgetBackgroundColor = null;
	this.widgetTextColor = null;
	this.widgetText = null;
	this.widgetContext = null;
	this.widgetContext = context;
	return this;
};

JkWidgetCommonButtonWidget.forText = function(context, text, handler) {
	var v = JkWidgetCommonButtonWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetText(text);
	v.setWidgetClickHandler(handler);
	return v;
};

JkWidgetCommonButtonWidget.prototype.createElement = function() {
	return JkUiHTMLDOM.createElement("button");
};

JkWidgetCommonButtonWidget.prototype.prepareElement = function(v) {
	JkWidgetWidget.prototype.prepareElement.call(this, v);
	JkUiHTMLDOM.setStyle(v, "font-size", "20px");
	JkUiHTMLDOM.setStyle(v, "padding", "8px");
	JkUiHTMLDOM.setStyle(v, "border", "none");
	JkUiHTMLDOM.setStyle(v, "cursor", "pointer");
};

JkWidgetCommonButtonWidget.prototype.setWidgetText = function(text) {
	this.widgetText = text;
	JkUiHTMLDOM.setTextContent(this.element, text);
};

JkWidgetCommonButtonWidget.prototype.getWidgetText = function() {
	return this.widgetText;
};

JkWidgetCommonButtonWidget.prototype.setWidgetTextColor = function(color) {
	this.widgetTextColor = color;
	if(color == null) {
		JkUiHTMLDOM.removeStyle(this.element, "background-color");
	}
	else {
		JkUiHTMLDOM.setStyle(this.element, "color", (JkUiHTMLDOM.colorToRGBA(color)));
	}
};

JkWidgetCommonButtonWidget.prototype.getWidgetTextColor = function() {
	return this.widgetTextColor;
};

JkWidgetCommonButtonWidget.prototype.setWidgetBackgroundColor = function(color) {
	this.widgetBackgroundColor = color;
	if(color == null) {
		JkUiHTMLDOM.removeStyle(this.element, "background-color");
	}
	else {
		JkUiHTMLDOM.setStyle(this.element, "background-color", (JkUiHTMLDOM.colorToRGBA(color)));
	}
};

JkWidgetCommonButtonWidget.prototype.getWidgetBackgroundColor = function() {
	return this.widgetBackgroundColor;
};

JkWidgetCommonButtonWidget.prototype.onWidgetClicked = function() {
	if(this.widgetClickHandler != null) {
		this.widgetClickHandler();
	}
};

JkWidgetCommonButtonWidget.prototype.setWidgetClickHandler = function(handler) {
	this.widgetClickHandler = handler;
	this.element.onclick = handler;
	;
};

JkWidgetCommonButtonWidget.prototype.setWidgetIcon = function(icon) {
	this.widgetIcon = icon;
	console.log("[jk.widget.common.ButtonWidget.setWidgetIcon] (ButtonWidget.sling:366:3): Not implemented");
};

JkWidgetCommonButtonWidget.prototype.getWidgetIcon = function() {
	return this.widgetIcon;
};

JkWidgetCommonButtonWidget.prototype.setWidgetFont = function(font) {
	this.widgetFont = font;
	JkUiHTMLDOM.setFontFamily(this.element, font);
};

JkWidgetCommonButtonWidget.prototype.setWidgetFontSize = function(fontSize) {
	this.widgetFontSize = fontSize;
	JkUiHTMLDOM.setStyle(this.element, "font-size", (JkLangString.safeString((JkLangString.forDouble(fontSize)))) + ("px"));
};

JkWidgetCommonButtonWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonButtonWidget"] === true;
};

let JkWidgetCommonDateSelectorWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetContext = null;
	this.dayBox = null;
	this.monthBox = null;
	this.yearBox = null;
	this.value = null;
	this.skipYears = 0;
};

JkWidgetCommonDateSelectorWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonDateSelectorWidget.prototype.constructor = JkWidgetCommonDateSelectorWidget;
JkWidgetCommonDateSelectorWidget.prototype._t = {
	"JkWidgetWidgetWithValue" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCommonDateSelectorWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonDateSelectorWidget.prototype._tobj = JkWidgetCommonDateSelectorWidget;

JkWidgetCommonDateSelectorWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCommonDateSelectorWidget;
	return v.CTOR_JkWidgetCommonDateSelectorWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCommonDateSelectorWidget.prototype.CTOR_JkWidgetCommonDateSelectorWidget_JkUiGuiApplicationContext = function(ctx) {
	this.skipYears = 0;
	this.value = null;
	this.yearBox = null;
	this.monthBox = null;
	this.dayBox = null;
	this.widgetContext = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.widgetContext = ctx;
	return this;
};

JkWidgetCommonDateSelectorWidget.forContext = function(context) {
	return JkWidgetCommonDateSelectorWidget.NEW_JkUiGuiApplicationContext(context);
};

JkWidgetCommonDateSelectorWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	this.dayBox = JkWidgetCommonSelectWidget.forStringList1(this.context, ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]);
	this.monthBox = JkWidgetCommonSelectWidget.forKeyValueStrings1(this.context, ["1:January", "2:February", "3:March", "4:April", "5:May", "6:June", "7:July", "8:August", "9:September", "10:October", "11:November", "12:December"]);
	this.monthBox.setWidgetValueChangeHandler((function() {
		this.onChangeValues();
	}.bind(this)));
	var cy = JkTimeSystemClock.asDateTimeLocal().getYear();
	if(cy < 1) {
		cy = 2016;
	}
	cy -= this.skipYears;
	var yearOptions = JkLangKeyValueList.NEW();
	for(var i = cy ; i >= 1920 ; i--) {
		var str = JkLangString.forInteger(i);
		yearOptions.add(str, str);
	}
	this.yearBox = JkWidgetCommonSelectWidget.forKeyValueList(this.context, yearOptions);
	this.yearBox.setWidgetValueChangeHandler((function() {
		this.onChangeValues();
	}.bind(this)));
	var box = JkWidgetHorizontalBoxWidget.forContext(this.context, 0, 0);
	box.setWidgetSpacing((this.context.getHeightValue("1mm")));
	box.addWidget1(this.dayBox, 1);
	box.addWidget1(this.monthBox, 2);
	box.addWidget1(this.yearBox, 1);
	this.addWidget(box);
	this.applyValueToWidgets();
};

JkWidgetCommonDateSelectorWidget.prototype.applyValueToWidgets = function() {
	if(this.dayBox == null || this.monthBox == null || this.yearBox == null) {
		return;
	}
	if(!(this.value != null)) {
		return;
	}
	var year = JkLangString.getSubString(this.value, 0, 4);
	var month = JkLangString.getSubString(this.value, 4, 2);
	var day = JkLangString.getSubString(this.value, 6, 2);
	if(JkLangString.startsWith(day, "0", 0)) {
		day = JkLangString.getEndOfString(day, 1);
	}
	if(JkLangString.startsWith(month, "0", 0)) {
		month = JkLangString.getEndOfString(month, 1);
	}
	this.yearBox.setWidgetValue(year);
	this.monthBox.setWidgetValue(month);
	this.dayBox.setWidgetValue(day);
};

JkWidgetCommonDateSelectorWidget.prototype.getValueFromWidgets = function() {
	if(this.dayBox == null || this.monthBox == null || this.yearBox == null) {
		return;
	}
	var year = JkLangString.asString((this.yearBox.getWidgetValue()));
	var month = JkLangString.asString((this.monthBox.getWidgetValue()));
	var day = JkLangString.asString((this.dayBox.getWidgetValue()));
	var sb = JkLangStringBuilder.NEW();
	sb.appendString(year);
	if(JkLangString.getLength(month) == 1) {
		sb.appendCharacter('0'.charCodeAt());
	}
	sb.appendString(month);
	if(JkLangString.getLength(day) == 1) {
		sb.appendCharacter('0'.charCodeAt());
	}
	sb.appendString(day);
	this.value = sb.toString();
};

JkWidgetCommonDateSelectorWidget.prototype.setWidgetValue = function(value) {
	this.value = (function(o) {
		if(typeof(o) === 'string') {
			return o;
		}
		return null;
	}.bind(this))(value);
	this.applyValueToWidgets();
};

JkWidgetCommonDateSelectorWidget.prototype.getWidgetValue = function() {
	this.getValueFromWidgets();
	return this.value;
};

JkWidgetCommonDateSelectorWidget.prototype.isLeapYear = function(year) {
	if(year != 0) {
		if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
			return true;
		}
	}
	return false;
};

JkWidgetCommonDateSelectorWidget.prototype.getNumberOfDays = function(month, year) {
	if(month == 4 || month == 6 || month == 9 || month == 11) {
		return 30;
	}
	else if(month == 2) {
		if(this.isLeapYear(year)) {
			return 29;
		}
		return 28;
	}
	return 31;
};

JkWidgetCommonDateSelectorWidget.prototype.onChangeValues = function() {
	if(!JkLangString.isNotEmpty((this.monthBox.getSelectedWidgetValue()))) {
		return;
	}
	if(!JkLangString.isNotEmpty((this.yearBox.getSelectedWidgetValue()))) {
		return;
	}
	var numberOfDays = this.getNumberOfDays((JkLangString.toInteger((this.monthBox.getSelectedWidgetValue()))), (JkLangString.toInteger((this.yearBox.getSelectedWidgetValue()))));
	var d = new Array;
	for(var x = 1 ; x <= numberOfDays ; x++) {
		d.push(JkLangString.forInteger(x));
	}
	this.dayBox.setWidgetItemsAsStringList2(d);
};

JkWidgetCommonDateSelectorWidget.prototype.getSkipYears = function() {
	return this.skipYears;
};

JkWidgetCommonDateSelectorWidget.prototype.setSkipYears = function(v) {
	this.skipYears = v;
	return this;
};

JkWidgetCommonDateSelectorWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonDateSelectorWidget"] === true;
};

let JkWidgetCommonButtonWithImageWidget = function() {
	JkWidgetVerticalBoxWidget.call(this);
	this.image = null;
	this.label = null;
};

JkWidgetCommonButtonWithImageWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetVerticalBoxWidget.prototype);
JkWidgetCommonButtonWithImageWidget.prototype.constructor = JkWidgetCommonButtonWithImageWidget;
JkWidgetCommonButtonWithImageWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCommonButtonWithImageWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetVerticalBoxWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonButtonWithImageWidget.prototype._tobj = JkWidgetCommonButtonWithImageWidget;

JkWidgetCommonButtonWithImageWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCommonButtonWithImageWidget;
	return v.CTOR_JkWidgetCommonButtonWithImageWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCommonButtonWithImageWidget.prototype.CTOR_JkWidgetCommonButtonWithImageWidget_JkUiGuiApplicationContext = function(ctx) {
	this.label = null;
	this.image = null;
	if(JkWidgetVerticalBoxWidget.prototype.CTOR_JkWidgetVerticalBoxWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.forceCreateWidget();
	return this;
};

JkWidgetCommonButtonWithImageWidget.prototype.setWidgetButtonImage = function(source) {
	this.image.setWidgetImageResource(source);
	return this;
};

JkWidgetCommonButtonWithImageWidget.prototype.setWidgetButtonTitle = function(title) {
	this.label.setWidgetText(title);
	return this;
};

JkWidgetCommonButtonWithImageWidget.prototype.setWidgetClickHandler = function(handler) {
	if(!(handler != null)) {
		return null;
	}
	JkWidgetWidget.setWidgetClickHandler(this, handler);
	return this;
};

JkWidgetCommonButtonWithImageWidget.prototype.setWidgetFontSize = function(size) {
	this.label.setWidgetFontSize(size);
	return this;
};

JkWidgetCommonButtonWithImageWidget.prototype.setWidgetImageSize = function(size) {
	this.image.setWidgetImageWidth(size);
	this.image.setWidgetImageHeight(size);
	return this;
};

JkWidgetCommonButtonWithImageWidget.prototype.createWidget = function() {
	JkWidgetVerticalBoxWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.setWidgetSpacing((this.context.getHeightValue("1000um")));
	var widget = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.image = JkWidgetImageWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.image.setWidgetImageScaleMethod(JkWidgetImageWidget.FIT);
	this.image.setWidgetImageWidth((this.context.getHeightValue("4mm")));
	this.image.setWidgetImageHeight((this.context.getHeightValue("4mm")));
	widget.addWidget(this.image);
	this.addWidget1(widget, 1.0);
	this.label = JkWidgetLabelWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.label.setWidgetTextAlign(JkWidgetLabelWidget.ALIGN_CENTER);
	this.label.setWidgetFontSize((this.context.getHeightValue("2000um")));
	this.addWidget(this.label);
};

JkWidgetCommonButtonWithImageWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonButtonWithImageWidget"] === true;
};

let JkWidgetCommonImageButtonWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetContext = null;
	this.widgetImage = null;
	this.widgetImageResource = null;
	this.widgetClickHandler = null;
	this.widgetImageScale = 0;
	this.widgetButtonWidth = 0;
	this.widgetButtonHeight = 0;
	this.imageWidget = null;
};

JkWidgetCommonImageButtonWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonImageButtonWidget.prototype.constructor = JkWidgetCommonImageButtonWidget;
JkWidgetCommonImageButtonWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetCommonImageButtonWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonImageButtonWidget.prototype._tobj = JkWidgetCommonImageButtonWidget;

JkWidgetCommonImageButtonWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCommonImageButtonWidget;
	return v.CTOR_JkWidgetCommonImageButtonWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCommonImageButtonWidget.prototype.CTOR_JkWidgetCommonImageButtonWidget_JkUiGuiApplicationContext = function(ctx) {
	this.imageWidget = null;
	this.widgetButtonHeight = 0;
	this.widgetButtonWidth = 0;
	this.widgetImageScale = 0;
	this.widgetClickHandler = null;
	this.widgetImageResource = null;
	this.widgetImage = null;
	this.widgetContext = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.widgetContext = ctx;
	return this;
};

JkWidgetCommonImageButtonWidget.forImage = function(context, image, handler) {
	var v = JkWidgetCommonImageButtonWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetImage(image);
	v.setWidgetClickHandler(handler);
	return v;
};

JkWidgetCommonImageButtonWidget.forImageResource = function(context, resName, handler) {
	var v = JkWidgetCommonImageButtonWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetImageResource(resName);
	v.setWidgetClickHandler(handler);
	return v;
};

JkWidgetCommonImageButtonWidget.prototype.setWidgetImage = function(image) {
	this.widgetImage = image;
	this.widgetImageResource = null;
	this.updateImageWidget();
	return this;
};

JkWidgetCommonImageButtonWidget.prototype.setWidgetImageResource = function(resName) {
	this.widgetImageResource = resName;
	this.widgetImage = null;
	this.updateImageWidget();
	return this;
};

JkWidgetCommonImageButtonWidget.prototype.setWidgetClickHandler = function(handler) {
	this.widgetClickHandler = handler;
	JkWidgetWidget.setWidgetClickHandler(this, handler);
	return this;
};

JkWidgetCommonImageButtonWidget.prototype.updateImageWidget = function() {
	if(!(this.imageWidget != null)) {
		return;
	}
	if(this.widgetImage != null) {
		this.imageWidget.setWidgetImage(this.widgetImage);
	}
	else {
		this.imageWidget.setWidgetImageResource(this.widgetImageResource);
	}
};

JkWidgetCommonImageButtonWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	this.imageWidget = JkWidgetImageWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.imageWidget.setWidgetImageScaleMethod(this.widgetImageScale);
	this.imageWidget.setWidgetImageWidth(this.widgetButtonWidth);
	this.imageWidget.setWidgetImageHeight(this.widgetButtonHeight);
	this.addWidget(this.imageWidget);
	this.updateImageWidget();
	JkUiHTMLDOM.setStyle(this.element, "cursor", "pointer");
};

JkWidgetCommonImageButtonWidget.prototype.getWidgetImageScale = function() {
	return this.widgetImageScale;
};

JkWidgetCommonImageButtonWidget.prototype.setWidgetImageScale = function(v) {
	this.widgetImageScale = v;
	return this;
};

JkWidgetCommonImageButtonWidget.prototype.getWidgetButtonWidth = function() {
	return this.widgetButtonWidth;
};

JkWidgetCommonImageButtonWidget.prototype.setWidgetButtonWidth = function(v) {
	this.widgetButtonWidth = v;
	return this;
};

JkWidgetCommonImageButtonWidget.prototype.getWidgetButtonHeight = function() {
	return this.widgetButtonHeight;
};

JkWidgetCommonImageButtonWidget.prototype.setWidgetButtonHeight = function(v) {
	this.widgetButtonHeight = v;
	return this;
};

JkWidgetCommonImageButtonWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonImageButtonWidget"] === true;
};

let JkWidgetCommonSplashScreenWidgetSlide = function() {
	this.resource = null;
	this.delay = 0;
	this.backgroundColor = null;
};

JkWidgetCommonSplashScreenWidgetSlide.prototype._t = { "JkWidgetCommonSplashScreenWidgetSlide" : true };
JkWidgetCommonSplashScreenWidgetSlide.prototype._tobj = JkWidgetCommonSplashScreenWidgetSlide;

JkWidgetCommonSplashScreenWidgetSlide.NEW = function() {
	var v = new JkWidgetCommonSplashScreenWidgetSlide;
	return v.CTOR_JkWidgetCommonSplashScreenWidgetSlide();
};

JkWidgetCommonSplashScreenWidgetSlide.prototype.CTOR_JkWidgetCommonSplashScreenWidgetSlide = function() {
	this.backgroundColor = null;
	this.delay = 0;
	this.resource = null;
	return this;
};

JkWidgetCommonSplashScreenWidgetSlide.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonSplashScreenWidgetSlide"] === true;
};

let JkWidgetCommonSplashScreenWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.backgroundColor = null;
	this.slides = null;
	this.doneHandler = null;
	this.currentSlide = -1;
	this.currentImageWidget = null;
	this.imageWidgetWidth = "80mm";
	this.margin = "5mm";
	this.canvas = null;
};

JkWidgetCommonSplashScreenWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonSplashScreenWidget.prototype.constructor = JkWidgetCommonSplashScreenWidget;
JkWidgetCommonSplashScreenWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCommonSplashScreenWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonSplashScreenWidget.prototype._tobj = JkWidgetCommonSplashScreenWidget;

JkWidgetCommonSplashScreenWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCommonSplashScreenWidget;
	return v.CTOR_JkWidgetCommonSplashScreenWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCommonSplashScreenWidget.prototype.CTOR_JkWidgetCommonSplashScreenWidget_JkUiGuiApplicationContext = function(ctx) {
	this.canvas = null;
	this.margin = "5mm";
	this.imageWidgetWidth = "80mm";
	this.currentImageWidget = null;
	this.currentSlide = -1;
	this.doneHandler = null;
	this.slides = null;
	this.backgroundColor = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.slides = new Array;
	return this;
};

JkWidgetCommonSplashScreenWidget.prototype.addSlide = function(resource, delay, bgColor) {
	var slide = JkWidgetCommonSplashScreenWidgetSlide.NEW();
	slide.resource = resource;
	slide.delay = delay;
	if(bgColor != null) {
		slide.backgroundColor = bgColor;
	}
	this.slides.push(slide);
};

JkWidgetCommonSplashScreenWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	if(this.backgroundColor != null) {
		this.canvas = JkWidgetCanvasWidget.forColor(this.context, this.backgroundColor);
	}
	else {
		this.canvas = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	}
	this.addWidget(this.canvas);
	this.nextImage();
};

JkWidgetCommonSplashScreenWidget.prototype.nextImage = function() {
	this.currentSlide++;
	var slide = JkLangVector.get(this.slides, this.currentSlide);
	if(slide == null) {
		var anim = JkWidgetWidgetAnimation.forDuration(this.context, 1000);
		anim.addFadeOut(this.currentImageWidget, true);
		anim.setEndListener((function() {
			this.onEnded();
		}.bind(this)));
		anim.start();
		return;
	}
	if(this.canvas != null && slide.backgroundColor != null) {
		this.canvas.setWidgetColor(slide.backgroundColor);
	}
	else if(!(slide.backgroundColor != null) && !(this.backgroundColor != null)) {
		this.canvas.setWidgetColor(null);
	}
	var imageWidget = JkWidgetImageWidget.forImageResource(this.context, slide.resource);
	JkWidgetWidget.setAlpha(imageWidget, 0);
	imageWidget.setWidgetImageWidth((this.context.getWidthValue(this.imageWidgetWidth)));
	var align = JkWidgetAlignWidget.forWidget(this.context, imageWidget, 0.5, 0.5, 0);
	var sz = this.context.getWidthValue(this.margin);
	if(sz > 0) {
		align.setWidgetMargin(sz);
	}
	this.addWidget(align);
	var anim1 = JkWidgetWidgetAnimation.forDuration(this.context, 1000);
	anim1.addCrossFade(this.currentImageWidget, imageWidget, true);
	anim1.start();
	this.currentImageWidget = imageWidget;
	this.context.startTimer(slide.delay, (function() {
		this.nextImage();
	}.bind(this)));
};

JkWidgetCommonSplashScreenWidget.prototype.onEnded = function() {
	if(this.doneHandler != null) {
		this.doneHandler();
	}
};

JkWidgetCommonSplashScreenWidget.prototype.getBackgroundColor = function() {
	return this.backgroundColor;
};

JkWidgetCommonSplashScreenWidget.prototype.setBackgroundColor = function(v) {
	this.backgroundColor = v;
	return this;
};

JkWidgetCommonSplashScreenWidget.prototype.getDoneHandler = function() {
	return this.doneHandler;
};

JkWidgetCommonSplashScreenWidget.prototype.setDoneHandler = function(v) {
	this.doneHandler = v;
	return this;
};

JkWidgetCommonSplashScreenWidget.prototype.getImageWidgetWidth = function() {
	return this.imageWidgetWidth;
};

JkWidgetCommonSplashScreenWidget.prototype.setImageWidgetWidth = function(v) {
	this.imageWidgetWidth = v;
	return this;
};

JkWidgetCommonSplashScreenWidget.prototype.getMargin = function() {
	return this.margin;
};

JkWidgetCommonSplashScreenWidget.prototype.setMargin = function(v) {
	this.margin = v;
	return this;
};

JkWidgetCommonSplashScreenWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonSplashScreenWidget"] === true;
};

let JkWidgetCommonSelectWidget = function() {
	JkWidgetWidget.call(this);
	this.widgetOnFocusHandler = null;
	this.widgetOnLoseFocusHandler = null;
	this.widgetContext = null;
	this.widgetItems = null;
	this.widgetValueChangeHandler = null;
	this.widgetBackgroundColor = null;
	this.widgetTextColor = null;
	this.widgetPadding = 0;
	this.widgetFontFamily = null;
	this.widgetFontResource = null;
	this.widgetFontSize = 0.0;
	this.widgetFontUnderline = false;
	this.widgetFontItalic = false;
	this.widgetFontBold = false;
	this.widgetIsEnabled = true;
};

JkWidgetCommonSelectWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetCommonSelectWidget.prototype.constructor = JkWidgetCommonSelectWidget;
JkWidgetCommonSelectWidget.prototype._t = {
	"JkWidgetWidgetWithValue" : true,
	"JkWidgetCommonSelectWidget" : true,
	"JkWidgetWidget" : true
};
JkWidgetCommonSelectWidget.prototype._tobj = JkWidgetCommonSelectWidget;

JkWidgetCommonSelectWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonSelectWidget;
	return v.CTOR_JkWidgetCommonSelectWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonSelectWidget.prototype.CTOR_JkWidgetCommonSelectWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.widgetIsEnabled = true;
	this.widgetFontBold = false;
	this.widgetFontItalic = false;
	this.widgetFontUnderline = false;
	this.widgetFontSize = 0.0;
	this.widgetFontResource = null;
	this.widgetFontFamily = null;
	this.widgetPadding = 0;
	this.widgetTextColor = null;
	this.widgetBackgroundColor = null;
	this.widgetValueChangeHandler = null;
	this.widgetItems = null;
	this.widgetContext = null;
	this.widgetOnLoseFocusHandler = null;
	this.widgetOnFocusHandler = null;
	this.widgetContext = context;
	this.setWidgetStyle("SelectWidget");
	return this;
};

JkWidgetCommonSelectWidget.forKeyValueList = function(context, options) {
	var v = JkWidgetCommonSelectWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetItemsAsKeyValueList(options);
	return v;
};

JkWidgetCommonSelectWidget.forKeyValueStrings1 = function(context, options) {
	var v = JkWidgetCommonSelectWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetItemsAsKeyValueStrings2(options);
	return v;
};

JkWidgetCommonSelectWidget.forKeyValueStrings2 = function(context, options) {
	var v = JkWidgetCommonSelectWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetItemsAsKeyValueStrings1(options);
	return v;
};

JkWidgetCommonSelectWidget.forStringList1 = function(context, options) {
	var v = JkWidgetCommonSelectWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetItemsAsStringList3(options);
	return v;
};

JkWidgetCommonSelectWidget.forStringList2 = function(context, options) {
	var v = JkWidgetCommonSelectWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetItemsAsStringList2(options);
	return v;
};

JkWidgetCommonSelectWidget.forStringList3 = function(context, options) {
	var v = JkWidgetCommonSelectWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetItemsAsStringList1(options);
	return v;
};

JkWidgetCommonSelectWidget.prototype.createElement = function() {
	var v = JkUiHTMLDOM.createElement("select");
	var myObject = this;
	v.onchange = function() {
		myObject.onWidgetSelectionChanged();
	};
	;
	return v;
};

JkWidgetCommonSelectWidget.prototype.prepareElement = function(v) {
	JkWidgetWidget.prototype.prepareElement.call(this, v);
	JkUiHTMLDOM.addEventListener(this.element, "focus", (function() {
		this.onFocusListener();
	}.bind(this)));
	JkUiHTMLDOM.addEventListener(this.element, "blur", (function() {
		this.onLoseFocusListener();
	}.bind(this)));
};

JkWidgetCommonSelectWidget.prototype.setWidgetStyle = function(style) {
	this.widgetFontFamily = this.widgetContext.getStyleString(style, "fontFamily", null);
	if(JkLangString.isEmpty(this.widgetFontFamily)) {
		this.widgetFontFamily = "Arial";
	}
	this.widgetFontSize = this.widgetContext.getStylePixels(style, "fontSize", null);
	if(this.widgetFontSize < 1.0) {
		this.widgetFontSize = this.widgetContext.getHeightValue("3mm");
	}
	this.widgetFontResource = this.widgetContext.getStyleString(style, "fontResource", null);
	this.widgetTextColor = this.widgetContext.getStyleColor(style, "textColor", null);
	this.widgetBackgroundColor = this.widgetContext.getStyleColor(style, "backgroundColor", null);
	this.widgetPadding = this.widgetContext.getStylePixels(style, "padding", null);
	this.updateWidgetFont();
	this.updateWidgetAppearance(true);
	return this;
};

JkWidgetCommonSelectWidget.prototype.setWidgetFontFamily = function(family) {
	this.widgetFontFamily = family;
	this.updateWidgetFont();
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonSelectWidget.prototype.setWidgetFontResource = function(res) {
	this.widgetFontResource = res;
	this.updateWidgetFont();
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonSelectWidget.prototype.setWidgetFontSize = function(fontSize) {
	this.widgetFontSize = fontSize;
	this.updateWidgetFont();
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonSelectWidget.prototype.setWidgetFontUnderline = function(underline) {
	this.widgetFontUnderline = underline;
	this.updateWidgetFont();
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonSelectWidget.prototype.setWidgetFontItalic = function(italic) {
	this.widgetFontItalic = italic;
	this.updateWidgetFont();
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonSelectWidget.prototype.setWidgetFontBold = function(bold) {
	this.widgetFontBold = bold;
	this.updateWidgetFont();
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetCommonSelectWidget.prototype.updateWidgetFont = function() {
	JkUiHTMLDOM.setFontFamily(this.element, this.widgetFontFamily);
	JkUiHTMLDOM.setStyle(this.element, "font-size", (JkLangString.safeString((JkLangString.forDouble(this.widgetFontSize)))) + ("px"));
	if(this.widgetFontBold) {
		JkUiHTMLDOM.setStyle(this.element, "font-weight", "bold");
	}
	if(this.widgetFontItalic) {
		JkUiHTMLDOM.setStyle(this.element, "font-style", "italic");
	}
	if(this.widgetFontUnderline) {
		JkUiHTMLDOM.setStyle(this.element, "text-decoration", "underline");
	}
};

JkWidgetCommonSelectWidget.prototype.setWidgetPadding = function(value) {
	this.widgetPadding = value;
	this.updateWidgetAppearance(true);
	return this;
};

JkWidgetCommonSelectWidget.prototype.getWidgetPadding = function() {
	return this.widgetPadding;
};

JkWidgetCommonSelectWidget.prototype.setWidgetTextColor = function(color) {
	this.widgetTextColor = color;
	this.updateWidgetAppearance(false);
	return this;
};

JkWidgetCommonSelectWidget.prototype.getWidgetTextColor = function() {
	return this.widgetTextColor;
};

JkWidgetCommonSelectWidget.prototype.setWidgetBackgroundColor = function(color) {
	this.widgetBackgroundColor = color;
	this.updateWidgetAppearance(false);
	return this;
};

JkWidgetCommonSelectWidget.prototype.getWidgetBackgroundColor = function() {
	return this.widgetBackgroundColor;
};

JkWidgetCommonSelectWidget.prototype.getActualWidgetTextColor = function() {
	var textColor = this.widgetTextColor;
	if(textColor == null) {
		if(this.widgetBackgroundColor != null) {
			if(this.widgetBackgroundColor.isLightColor()) {
				textColor = JkGfxColor.black();
			}
			else {
				textColor = JkGfxColor.white();
			}
		}
		else {
			textColor = JkGfxColor.black();
		}
	}
	return textColor;
};

JkWidgetCommonSelectWidget.prototype.updateWidgetAppearance = function(layoutChanged) {
	var textColor = this.getActualWidgetTextColor();
	if(this.widgetBackgroundColor != null || this.widgetTextColor != null || this.widgetPadding > 0) {
		if(this.widgetBackgroundColor == null) {
			JkUiHTMLDOM.setStyle(this.element, "background-color", "rgba(0,0,0,0)");
		}
		else {
			JkUiHTMLDOM.setStyle(this.element, "background-color", (JkUiHTMLDOM.colorToRGBA(this.widgetBackgroundColor)));
		}
		JkUiHTMLDOM.setStyle(this.element, "color", (JkUiHTMLDOM.colorToRGBA(textColor)));
		JkUiHTMLDOM.setStyle(this.element, "padding", (JkLangString.safeString((JkLangString.forInteger(this.widgetPadding)))) + ("px "));
		JkUiHTMLDOM.setStyle(this.element, "appearance", "none");
		JkUiHTMLDOM.setStyle(this.element, "-webkit-appearance", "none");
		JkUiHTMLDOM.setStyle(this.element, "-moz-appearance", "none");
		JkUiHTMLDOM.setStyle(this.element, "border", "0px");
		JkUiHTMLDOM.setStyle(this.element, "border-radius", "0px");
	}
	else {
		JkUiHTMLDOM.removeStyle(this.element, "appearance");
		JkUiHTMLDOM.removeStyle(this.element, "-webkit-appearance");
		JkUiHTMLDOM.removeStyle(this.element, "-moz-appearance");
		JkUiHTMLDOM.removeStyle(this.element, "border");
		JkUiHTMLDOM.removeStyle(this.element, "border-radius");
		JkUiHTMLDOM.removeStyle(this.element, "color");
		JkUiHTMLDOM.removeStyle(this.element, "padding");
	}
	if(layoutChanged) {
		JkWidgetWidget.onLayoutChanged(this);
	}
};

JkWidgetCommonSelectWidget.prototype.setWidgetItemsAsKeyValueList = function(items) {
	var selectedIndex = this.getSelectedWidgetIndex();
	this.widgetItems = items;
	JkUiHTMLDOM.setTextContent(this.element, "");
	if(this.widgetItems != null) {
		var it = this.widgetItems.iterate();
		while(it != null){
			var item = it.next();
			if(item == null) {
				break;
			}
			var option = JkUiHTMLDOM.createElement("option");
			JkUiHTMLDOM.setTextContent(option, item.value);
			JkUiHTMLDOM.setAttribute(option, "value", item.key);
			JkUiHTMLDOM.appendChild(this.element, option);
		}
	}
	this.setSelectedWidgetIndex(selectedIndex);
};

JkWidgetCommonSelectWidget.prototype.addWidgetItem1 = function(value) {
	this.addWidgetItem2(value, value);
};

JkWidgetCommonSelectWidget.prototype.addWidgetItem2 = function(k, v) {
	var list = this.widgetItems;
	if(!(list != null)) {
		list = JkLangKeyValueList.NEW();
	}
	list.add(k, v);
	this.setWidgetItemsAsKeyValueList(list);
};

JkWidgetCommonSelectWidget.prototype.removeWidgetItem = function(index) {
	if(!(this.widgetItems != null)) {
		return;
	}
	var list = this.widgetItems;
	var selectedIndex = this.getSelectedWidgetIndex();
	list.remove(index);
	this.setWidgetItemsAsKeyValueList(list);
	this.setSelectedWidgetIndex(selectedIndex);
};

JkWidgetCommonSelectWidget.prototype.setWidgetItemsAsKeyValueStrings1 = function(options) {
	var list = JkLangKeyValueList.NEW();
	if(options != null) {
		if(options != null) {
			var n = 0;
			var m = options.length;
			for(n = 0 ; n < m ; n++) {
				var option = options[n];
				if(option != null) {
					var comps = JkLangString.split(option, ':'.charCodeAt(), 2);
					var kk = JkLangVector.get(comps, 0);
					var vv = JkLangVector.get(comps, 1);
					if(vv == null) {
						vv = kk;
					}
					list.add(kk, vv);
				}
			}
		}
	}
	this.setWidgetItemsAsKeyValueList(list);
};

JkWidgetCommonSelectWidget.prototype.setWidgetItemsAsKeyValueStrings2 = function(options) {
	var list = JkLangKeyValueList.NEW();
	if(options != null) {
		if(options != null) {
			var n = 0;
			var m = options.length;
			for(n = 0 ; n < m ; n++) {
				var option = (function(o) {
					if(typeof(o) === 'string') {
						return o;
					}
					return null;
				}.bind(this))(options[n]);
				if(option != null) {
					var comps = JkLangString.split(option, ':'.charCodeAt(), 2);
					var kk = JkLangVector.get(comps, 0);
					var vv = JkLangVector.get(comps, 1);
					if(vv == null) {
						vv = kk;
					}
					list.add(kk, vv);
				}
			}
		}
	}
	this.setWidgetItemsAsKeyValueList(list);
};

JkWidgetCommonSelectWidget.prototype.setWidgetItemsAsStringList1 = function(options) {
	var list = JkLangKeyValueList.NEW();
	if(options != null) {
		var array = options.toVector();
		if(array != null) {
			var n = 0;
			var m = array.length;
			for(n = 0 ; n < m ; n++) {
				var option = (function(o) {
					if(typeof(o) === 'string') {
						return o;
					}
					return null;
				}.bind(this))(array[n]);
				if(option != null) {
					list.add(option, option);
				}
			}
		}
	}
	this.setWidgetItemsAsKeyValueList(list);
};

JkWidgetCommonSelectWidget.prototype.setWidgetItemsAsStringList2 = function(options) {
	var list = JkLangKeyValueList.NEW();
	if(options != null) {
		if(options != null) {
			var n = 0;
			var m = options.length;
			for(n = 0 ; n < m ; n++) {
				var option = options[n];
				if(option != null) {
					list.add(option, option);
				}
			}
		}
	}
	this.setWidgetItemsAsKeyValueList(list);
};

JkWidgetCommonSelectWidget.prototype.setWidgetItemsAsStringList3 = function(options) {
	var list = JkLangKeyValueList.NEW();
	if(options != null) {
		if(options != null) {
			var n = 0;
			var m = options.length;
			for(n = 0 ; n < m ; n++) {
				var option = (function(o) {
					if(typeof(o) === 'string') {
						return o;
					}
					return null;
				}.bind(this))(options[n]);
				if(option != null) {
					list.add(option, option);
				}
			}
		}
	}
	this.setWidgetItemsAsKeyValueList(list);
};

JkWidgetCommonSelectWidget.prototype.adjustSelectedWidgetItemIndex = function(index) {
	if(this.widgetItems == null || this.widgetItems.count() < 1) {
		return -1;
	}
	if(index < 0) {
		return 0;
	}
	if(index >= this.widgetItems.count()) {
		return this.widgetItems.count() - 1;
	}
	return index;
};

JkWidgetCommonSelectWidget.prototype.findIndexForWidgetValue = function(id) {
	var v = -1;
	if(this.widgetItems != null) {
		var n = 0;
		var it = this.widgetItems.iterate();
		while(it != null){
			var item = it.next();
			if(item == null) {
				break;
			}
			if(item.key == id) {
				v = n;
				break;
			}
			n++;
		}
	}
	return v;
};

JkWidgetCommonSelectWidget.prototype.getWidgetItemCount = function() {
	if(this.widgetItems == null) {
		return 0;
	}
	return this.widgetItems.count();
};

JkWidgetCommonSelectWidget.prototype.getWidgetTextForIndex = function(index) {
	if(!(this.widgetItems != null)) {
		return null;
	}
	return this.widgetItems.getValue(index);
};

JkWidgetCommonSelectWidget.prototype.getSelectedWidgetIndex = function() {
	return this.element.selectedIndex;
};

JkWidgetCommonSelectWidget.prototype.setSelectedWidgetIndex = function(index) {
	var v = this.adjustSelectedWidgetItemIndex(index);
	this.element.selectedIndex = v;
	;
};

JkWidgetCommonSelectWidget.prototype.setSelectedWidgetValue = function(id) {
	this.setSelectedWidgetIndex((this.findIndexForWidgetValue(id)));
};

JkWidgetCommonSelectWidget.prototype.getSelectedWidgetValue = function() {
	var index = this.getSelectedWidgetIndex();
	if(this.widgetItems == null || index < 0) {
		return null;
	}
	return this.widgetItems.getKey(index);
};

JkWidgetCommonSelectWidget.prototype.setWidgetValue = function(value) {
	this.setSelectedWidgetValue((JkLangString.asString(value)));
};

JkWidgetCommonSelectWidget.prototype.getWidgetValue = function() {
	return this.getSelectedWidgetValue();
};

JkWidgetCommonSelectWidget.prototype.setWidgetValueChangeHandler = function(handler) {
	this.widgetValueChangeHandler = handler;
};

JkWidgetCommonSelectWidget.prototype.onWidgetSelectionChanged = function() {
	if(this.widgetValueChangeHandler != null) {
		this.widgetValueChangeHandler();
	}
};

JkWidgetCommonSelectWidget.prototype.getWidgetItems = function() {
	return this.widgetItems;
};

JkWidgetCommonSelectWidget.prototype.onFocusListener = function() {
	if(this.widgetOnFocusHandler != null) {
		this.widgetOnFocusHandler();
	}
};

JkWidgetCommonSelectWidget.prototype.onLoseFocusListener = function() {
	if(this.widgetOnLoseFocusHandler != null) {
		this.widgetOnLoseFocusHandler();
	}
};

JkWidgetCommonSelectWidget.prototype.setWidgetIsEnabled = function(v, background) {
	this.widgetIsEnabled = v;
	if(this.widgetIsEnabled) {
		JkUiHTMLDOM.setAttribute(this.element, "disabled", null);
		JkUiHTMLDOM.setStyle(this.element, "background-color", "rgba(0,0,0,0)");
	}
	else {
		JkUiHTMLDOM.setAttribute(this.element, "disabled", "disabled");
		JkUiHTMLDOM.setStyle(this.element, "background-color", (JkUiHTMLDOM.colorToRGBA(background)));
	}
};

JkWidgetCommonSelectWidget.prototype.getWidgetIsEnabled = function() {
	return this.widgetIsEnabled;
};

JkWidgetCommonSelectWidget.prototype.focus = function() {
	JkUiHTMLDOM.setFocus(this.element);
};

JkWidgetCommonSelectWidget.prototype.getWidgetOnFocusHandler = function() {
	return this.widgetOnFocusHandler;
};

JkWidgetCommonSelectWidget.prototype.setWidgetOnFocusHandler = function(v) {
	this.widgetOnFocusHandler = v;
	return this;
};

JkWidgetCommonSelectWidget.prototype.getWidgetOnLoseFocusHandler = function() {
	return this.widgetOnLoseFocusHandler;
};

JkWidgetCommonSelectWidget.prototype.setWidgetOnLoseFocusHandler = function(v) {
	this.widgetOnLoseFocusHandler = v;
	return this;
};

JkWidgetCommonSelectWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonSelectWidget"] === true;
};

let JkWidgetCommonRadioButtonGroupWidget = function() {
	JkWidgetWidget.call(this);
	this.radiobuttons = null;
	this.widgetContext = null;
	this.widgetName = null;
	this.widgetSelectedValue = null;
	this.widgetItems = null;
	this.selectedWidgetIndex = -1;
	this.widgetChangeHandler = null;
};

JkWidgetCommonRadioButtonGroupWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetCommonRadioButtonGroupWidget.prototype.constructor = JkWidgetCommonRadioButtonGroupWidget;
JkWidgetCommonRadioButtonGroupWidget.prototype._t = {
	"JkWidgetWidgetWithValue" : true,
	"JkWidgetCommonRadioButtonGroupWidget" : true,
	"JkWidgetWidget" : true
};
JkWidgetCommonRadioButtonGroupWidget.prototype._tobj = JkWidgetCommonRadioButtonGroupWidget;

JkWidgetCommonRadioButtonGroupWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonRadioButtonGroupWidget;
	return v.CTOR_JkWidgetCommonRadioButtonGroupWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonRadioButtonGroupWidget.prototype.CTOR_JkWidgetCommonRadioButtonGroupWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.widgetChangeHandler = null;
	this.selectedWidgetIndex = -1;
	this.widgetItems = null;
	this.widgetSelectedValue = null;
	this.widgetName = null;
	this.widgetContext = null;
	this.radiobuttons = null;
	this.widgetContext = context;
	return this;
};

JkWidgetCommonRadioButtonGroupWidget.forGroup = function(context, group, items, orientation) {
	var v = JkWidgetCommonRadioButtonGroupWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetName(group);
	v.setWidgetOrientation(orientation);
	for(var i = 0 ; i < JkLangVector.getSize(items) ; i++) {
		v.addWidgetItem((JkLangVector.get(items, i)), i);
	}
	return v;
};

JkWidgetCommonRadioButtonGroupWidget.prototype.createElement = function() {
	return JkUiHTMLDOM.createElement("div");
};

JkWidgetCommonRadioButtonGroupWidget.prototype.addWidgetItem = function(text, index) {
	if(!(this.widgetItems != null)) {
		this.widgetItems = new Array;
	}
	this.widgetItems.push(text);
	var input = JkUiHTMLDOM.createElement("input");
	JkUiHTMLDOM.setAttribute(input, "type", "radio");
	JkUiHTMLDOM.setAttribute(input, "value", text);
	if(JkLangString.isEmpty(this.widgetName) == false) {
		JkUiHTMLDOM.setAttribute(input, "name", this.widgetName);
	}
	JkUiHTMLDOM.addEventListener(input, "click", (function() {
		this.widgetSelectedValue = JkUiHTMLDOM.getValue(input);
		this.onChangeSelectedItem();
	}.bind(this)));
	var label = JkUiHTMLDOM.createElement("label");
	JkUiHTMLDOM.setTextContent(label, text);
	JkUiHTMLDOM.setStyle(label, "margin-left", "5px");
	JkUiHTMLDOM.setStyle(label, "margin-right", "8px");
	var d = JkUiHTMLDOM.createElement("div");
	JkUiHTMLDOM.appendChild(d, input);
	JkUiHTMLDOM.appendChild(d, label);
	JkUiHTMLDOM.appendChild(this.element, d);
	if(this.radiobuttons == null) {
		this.radiobuttons = new Array;
	}
	this.radiobuttons.push(input);
};

JkWidgetCommonRadioButtonGroupWidget.prototype.setWidgetSelectedValue = function(indx) {
	this.widgetSelectedValue = null;
	var n = 0;
	if(this.radiobuttons != null) {
		var n2 = 0;
		var m = this.radiobuttons.length;
		for(n2 = 0 ; n2 < m ; n2++) {
			var button = this.radiobuttons[n2];
			if(button != null) {
				if(indx == n) {
					button.checked = true;
					;
					this.widgetSelectedValue = JkUiHTMLDOM.getValue(button);
				}
				else {
					button.checked = false;
					;
				}
				n++;
			}
		}
	}
};

JkWidgetCommonRadioButtonGroupWidget.prototype.setWidgetName = function(name) {
	this.widgetName = name;
	if(this.radiobuttons != null) {
		var n = 0;
		var m = this.radiobuttons.length;
		for(n = 0 ; n < m ; n++) {
			var o = this.radiobuttons[n];
			if(o != null) {
				JkUiHTMLDOM.setAttribute(o, "name", name);
			}
		}
	}
};

JkWidgetCommonRadioButtonGroupWidget.prototype.setWidgetOrientation = function(orientation) {
	if(orientation == JkWidgetCommonRadioButtonGroupWidget.HORIZONTAL) {
		var p = null;
		if(this.radiobuttons != null) {
			var n = 0;
			var m = this.radiobuttons.length;
			for(n = 0 ; n < m ; n++) {
				var rb = this.radiobuttons[n];
				if(rb != null) {
					p = JkUiHTMLDOM.getParentElement(rb);
					JkUiHTMLDOM.setStyle(p, "display", "inline-block");
				}
			}
		}
	}
	else if(orientation == JkWidgetCommonRadioButtonGroupWidget.VERTICAL) {
		var p1 = null;
		if(this.radiobuttons != null) {
			var n2 = 0;
			var m2 = this.radiobuttons.length;
			for(n2 = 0 ; n2 < m2 ; n2++) {
				var rb1 = this.radiobuttons[n2];
				if(rb1 != null) {
					p1 = JkUiHTMLDOM.getParentElement(rb1);
					JkUiHTMLDOM.setStyle(p1, "display", "block");
				}
			}
		}
	}
};

JkWidgetCommonRadioButtonGroupWidget.prototype.getWidgetSelectedValue = function() {
	return this.widgetSelectedValue;
};

JkWidgetCommonRadioButtonGroupWidget.prototype.onChangeSelectedItem = function() {
	if(this.widgetChangeHandler != null) {
		this.widgetChangeHandler();
	}
};

JkWidgetCommonRadioButtonGroupWidget.prototype.setWidgetValue = function(value) {
	var io = (function(o) {
		if(JkLangIntegerObject.IS_INSTANCE && JkLangIntegerObject.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(value);
	if(io != null) {
		this.setWidgetSelectedValue((io.toInteger()));
	}
	else {
		this.setWidgetSelectedValue((-1));
	}
};

JkWidgetCommonRadioButtonGroupWidget.prototype.getWidgetValue = function() {
	return this.getWidgetSelectedValue();
};

JkWidgetCommonRadioButtonGroupWidget.prototype.getWidgetChangeHandler = function() {
	return this.widgetChangeHandler;
};

JkWidgetCommonRadioButtonGroupWidget.prototype.setWidgetChangeHandler = function(v) {
	this.widgetChangeHandler = v;
	return this;
};

JkWidgetCommonRadioButtonGroupWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonRadioButtonGroupWidget"] === true;
};

JkWidgetCommonRadioButtonGroupWidget.HORIZONTAL = 0;
JkWidgetCommonRadioButtonGroupWidget.VERTICAL = 1;

let JkWidgetCommonTableWidgetColumnInfo = function() {
	this.label = null;
	this.width = 0;
	this.align = 0.0;
	this.sortid = null;
};

JkWidgetCommonTableWidgetColumnInfo.prototype._t = { "JkWidgetCommonTableWidgetColumnInfo" : true };
JkWidgetCommonTableWidgetColumnInfo.prototype._tobj = JkWidgetCommonTableWidgetColumnInfo;

JkWidgetCommonTableWidgetColumnInfo.NEW = function() {
	var v = new JkWidgetCommonTableWidgetColumnInfo;
	return v.CTOR_JkWidgetCommonTableWidgetColumnInfo();
};

JkWidgetCommonTableWidgetColumnInfo.prototype.CTOR_JkWidgetCommonTableWidgetColumnInfo = function() {
	this.sortid = null;
	this.align = 0.0;
	this.width = 0;
	this.label = null;
	return this;
};

JkWidgetCommonTableWidgetColumnInfo.prototype.getLabel = function() {
	return this.label;
};

JkWidgetCommonTableWidgetColumnInfo.prototype.setLabel = function(v) {
	this.label = v;
	return this;
};

JkWidgetCommonTableWidgetColumnInfo.prototype.getWidth = function() {
	return this.width;
};

JkWidgetCommonTableWidgetColumnInfo.prototype.setWidth = function(v) {
	this.width = v;
	return this;
};

JkWidgetCommonTableWidgetColumnInfo.prototype.getAlign = function() {
	return this.align;
};

JkWidgetCommonTableWidgetColumnInfo.prototype.setAlign = function(v) {
	this.align = v;
	return this;
};

JkWidgetCommonTableWidgetColumnInfo.prototype.getSortid = function() {
	return this.sortid;
};

JkWidgetCommonTableWidgetColumnInfo.prototype.setSortid = function(v) {
	this.sortid = v;
	return this;
};

JkWidgetCommonTableWidgetColumnInfo.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonTableWidgetColumnInfo"] === true;
};

let JkWidgetCommonTableWidgetRowWidget = function() {
	JkWidgetLayerWithBackgroundColorWidget.call(this);
	this.childWidgets = null;
	this.widgetTextColor = null;
	this.box = null;
};

JkWidgetCommonTableWidgetRowWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWithBackgroundColorWidget.prototype);
JkWidgetCommonTableWidgetRowWidget.prototype.constructor = JkWidgetCommonTableWidgetRowWidget;
JkWidgetCommonTableWidgetRowWidget.prototype._t = {
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetLayerWithBackgroundColorWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetCommonTableWidgetRowWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonTableWidgetRowWidget.prototype._tobj = JkWidgetCommonTableWidgetRowWidget;

JkWidgetCommonTableWidgetRowWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonTableWidgetRowWidget;
	return v.CTOR_JkWidgetCommonTableWidgetRowWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonTableWidgetRowWidget.prototype.CTOR_JkWidgetCommonTableWidgetRowWidget_JkUiGuiApplicationContext = function(context) {
	this.box = null;
	this.widgetTextColor = null;
	this.childWidgets = null;
	if(JkWidgetLayerWithBackgroundColorWidget.prototype.CTOR_JkWidgetLayerWithBackgroundColorWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonTableWidgetRowWidget.forTextValues = function(context, data) {
	var v = JkWidgetCommonTableWidgetRowWidget.NEW_JkUiGuiApplicationContext(context);
	if(data != null) {
		var n = 0;
		var m = data.length;
		for(n = 0 ; n < m ; n++) {
			var str = data[n];
			if(str != null) {
				v.addText(str, 0.0, 0);
			}
		}
	}
	return v;
};

JkWidgetCommonTableWidgetRowWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWithBackgroundColorWidget.prototype.initializeWidget.call(this);
	if(this.childWidgets != null) {
		var n = 0;
		var m = this.childWidgets.length;
		for(n = 0 ; n < m ; n++) {
			var widget = this.childWidgets[n];
			if(widget != null) {
				this.box.addWidget1(widget, (widget.getCellWeight()));
			}
		}
	}
};

JkWidgetCommonTableWidgetRowWidget.prototype.reset = function() {
	this.childWidgets = null;
	if(this.getInitialized()) {
		JkWidgetWidget.removeChildrenOf(this.box);
	}
};

JkWidgetCommonTableWidgetRowWidget.prototype.addText = function(text, align, width) {
	this.addCellWidget((JkWidgetLabelWidget.forText(this.context, text).setWidgetTextColor(this.widgetTextColor)), align, width);
};

JkWidgetCommonTableWidgetRowWidget.prototype.addClickableText = function(text, clickid, clickHandler, align, width) {
	var ch = clickHandler;
	var cl = clickid;
	var handler = function() {
		if(ch != null) {
			ch(cl);
		}
	}.bind(this);
	this.addCellWidget((JkWidgetCommonHyperLinkWidget.forText(this.context, text, handler).setWidgetTextColor(this.widgetTextColor)), align, width);
};

JkWidgetCommonTableWidgetRowWidget.prototype.addCellWidget = function(widget, align, width) {
	if(!(widget != null)) {
		return;
	}
	var cell = JkWidgetCommonTableWidgetCellWidget.forWidget(this.context, widget, align);
	cell.setCellWidth(width);
	if(!(this.childWidgets != null)) {
		this.childWidgets = new Array;
	}
	this.childWidgets.push(cell);
	if(this.getInitialized()) {
		this.box.addWidget1(cell, (cell.getCellWeight()));
	}
};

JkWidgetCommonTableWidgetRowWidget.prototype.getCellWidgets = function() {
	return this.childWidgets;
};

JkWidgetCommonTableWidgetRowWidget.prototype.createWidget = function() {
	JkWidgetLayerWithBackgroundColorWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.box = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.box.setWidgetMargin((this.context.getStylePixels("jkwidget", "table-spacing", "2mm")));
	this.box.setWidgetSpacing((this.context.getStylePixels("jkwidget", "table-spacing", "2mm")));
	this.addWidget(this.box);
};

JkWidgetCommonTableWidgetRowWidget.prototype.getWidgetTextColor = function() {
	return this.widgetTextColor;
};

JkWidgetCommonTableWidgetRowWidget.prototype.setWidgetTextColor = function(v) {
	this.widgetTextColor = v;
	return this;
};

JkWidgetCommonTableWidgetRowWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonTableWidgetRowWidget"] === true;
};

let JkWidgetCommonTableWidgetCellWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.contentWidget = null;
	this.contentWidgetAlign = 0.5;
	this.contentWidgetWidth = 0;
	this.contentWidgetWeight = 0.0;
	this.align = null;
};

JkWidgetCommonTableWidgetCellWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonTableWidgetCellWidget.prototype.constructor = JkWidgetCommonTableWidgetCellWidget;
JkWidgetCommonTableWidgetCellWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetCommonTableWidgetCellWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonTableWidgetCellWidget.prototype._tobj = JkWidgetCommonTableWidgetCellWidget;

JkWidgetCommonTableWidgetCellWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonTableWidgetCellWidget;
	return v.CTOR_JkWidgetCommonTableWidgetCellWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonTableWidgetCellWidget.prototype.CTOR_JkWidgetCommonTableWidgetCellWidget_JkUiGuiApplicationContext = function(context) {
	this.align = null;
	this.contentWidgetWeight = 0.0;
	this.contentWidgetWidth = 0;
	this.contentWidgetAlign = 0.5;
	this.contentWidget = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonTableWidgetCellWidget.forWidget = function(ctx, widget, align) {
	var v = JkWidgetCommonTableWidgetCellWidget.NEW_JkUiGuiApplicationContext(ctx);
	v.setContentWidget(widget, align);
	return v;
};

JkWidgetCommonTableWidgetCellWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	this.updateWidget();
};

JkWidgetCommonTableWidgetCellWidget.prototype.getCellWeight = function() {
	return this.contentWidgetWeight;
};

JkWidgetCommonTableWidgetCellWidget.prototype.updateWidget = function() {
	if(!this.getInitialized()) {
		return;
	}
	JkWidgetWidget.removeChildrenOf(this.align);
	if(this.contentWidget != null) {
		this.align.addWidget1(this.contentWidget, this.contentWidgetAlign, 0.5, false);
	}
	if(this.contentWidgetWidth > 0) {
		this.setWidgetWidthRequest(this.contentWidgetWidth);
	}
	var parent = (function(o) {
		if(JkWidgetHorizontalBoxWidget.IS_INSTANCE && JkWidgetHorizontalBoxWidget.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkWidgetWidget.getParent(this)));
	if(parent != null) {
		parent.setWidgetWeight(this, this.contentWidgetWeight);
	}
};

JkWidgetCommonTableWidgetCellWidget.prototype.setContentWidget = function(widget, vv) {
	this.contentWidget = widget;
	this.contentWidgetAlign = vv;
	this.updateWidget();
};

JkWidgetCommonTableWidgetCellWidget.prototype.setCellWidth = function(width) {
	this.contentWidgetWidth = width;
	if(this.contentWidgetWidth < 1) {
		this.contentWidgetWeight = 1.0;
	}
	else {
		this.contentWidgetWeight = 0.0;
	}
	this.updateWidget();
};

JkWidgetCommonTableWidgetCellWidget.prototype.setCellAlign = function(vv) {
	this.contentWidgetAlign = vv;
	this.updateWidget();
};

JkWidgetCommonTableWidgetCellWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.align = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.addWidget(this.align);
};

JkWidgetCommonTableWidgetCellWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonTableWidgetCellWidget"] === true;
};

let JkWidgetCommonTableWidget = function() {
	JkWidgetVerticalBoxWidget.call(this);
	this.widgetSortHandler = null;
	this.rowWidgets = null;
	this.columns = null;
	this.data = null;
	this.header = null;
	this.scrollerLayer = null;
};

JkWidgetCommonTableWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetVerticalBoxWidget.prototype);
JkWidgetCommonTableWidget.prototype.constructor = JkWidgetCommonTableWidget;
JkWidgetCommonTableWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetCommonTableWidget" : true,
	"JkWidgetVerticalBoxWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonTableWidget.prototype._tobj = JkWidgetCommonTableWidget;

JkWidgetCommonTableWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonTableWidget;
	return v.CTOR_JkWidgetCommonTableWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonTableWidget.prototype.CTOR_JkWidgetCommonTableWidget_JkUiGuiApplicationContext = function(context) {
	this.scrollerLayer = null;
	this.header = null;
	this.data = null;
	this.columns = null;
	this.rowWidgets = null;
	this.widgetSortHandler = null;
	if(JkWidgetVerticalBoxWidget.prototype.CTOR_JkWidgetVerticalBoxWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonTableWidget.prototype.initializeWidget = function() {
	JkWidgetVerticalBoxWidget.prototype.initializeWidget.call(this);
	this.updateWidgetColumns();
	this.updateDataWidgets();
};

JkWidgetCommonTableWidget.prototype.parseColumnInfo = function(value) {
	var v = JkWidgetCommonTableWidgetColumnInfo.NEW();
	if(!(value != null)) {
		return v;
	}
	var array = JkLangString.split(value, ','.charCodeAt(), 0);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var comp = array[n];
			if(comp != null) {
				var vals = JkLangString.split(comp, '='.charCodeAt(), 2);
				var key = JkLangVector.get(vals, 0);
				var val = JkLangVector.get(vals, 1);
				if(key == "label") {
					v.setLabel(val);
				}
				else if(key == "width") {
					v.setWidth((this.context.getWidthValue(val)));
				}
				else if(key == "align") {
					if(val == "left") {
						v.setAlign(0.0);
					}
					else if(val == "center") {
						v.setAlign(0.5);
					}
					else if(val == "right") {
						v.setAlign(1.0);
					}
					else {
						v.setAlign(0.0);
					}
				}
				else if(key == "sortid") {
					v.setSortid(val);
				}
			}
		}
	}
	return v;
};

JkWidgetCommonTableWidget.prototype.onSort = function(sortid) {
	if(this.widgetSortHandler != null) {
		this.widgetSortHandler(sortid);
	}
};

JkWidgetCommonTableWidget.prototype.setWidgetHasHeader = function(value) {
	JkWidgetWidget.setVisible(this.header, value);
};

JkWidgetCommonTableWidget.prototype.setWidgetColumns = function(columns) {
	this.columns = columns;
	if(this.getInitialized()) {
		this.updateWidgetColumns();
	}
};

JkWidgetCommonTableWidget.prototype.updateWidgetColumns = function() {
	this.header.reset();
	if(this.columns != null) {
		var n = 0;
		var m = this.columns.length;
		for(n = 0 ; n < m ; n++) {
			var cc = this.columns[n];
			if(cc != null) {
				var column = JkLangString.asString(cc);
				var ci = this.parseColumnInfo(column);
				var sortid = ci.getSortid();
				if(JkLangString.isNotEmpty(sortid)) {
					var handler = function(vv1) {
						this.onSort(vv1);
					}.bind(this);
					this.header.addClickableText((ci.getLabel()), sortid, handler, (ci.getAlign()), (ci.getWidth()));
				}
				else {
					this.header.addText((ci.getLabel()), (ci.getAlign()), (ci.getWidth()));
				}
			}
		}
	}
	if(this.rowWidgets != null) {
		var n2 = 0;
		var m2 = this.rowWidgets.length;
		for(n2 = 0 ; n2 < m2 ; n2++) {
			var row = (function(o) {
				if(JkWidgetCommonTableWidgetRowWidget.IS_INSTANCE && JkWidgetCommonTableWidgetRowWidget.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))(this.rowWidgets[n2]);
			if(row != null) {
				this.updateCellProperties(row);
			}
		}
	}
};

JkWidgetCommonTableWidget.prototype.getColumnInfo = function(idx) {
	if(!(this.columns != null)) {
		return JkWidgetCommonTableWidgetColumnInfo.NEW();
	}
	if(idx < 0 || idx >= this.columns.length) {
		return JkWidgetCommonTableWidgetColumnInfo.NEW();
	}
	return this.parseColumnInfo((JkLangString.asString(this.columns[idx])));
};

JkWidgetCommonTableWidget.prototype.updateCellProperties = function(row) {
	if(!(row != null)) {
		return;
	}
	var cells = row.getCellWidgets();
	if(!(cells != null)) {
		return;
	}
	var n = 0;
	while(n < JkLangVector.getSize(cells)){
		var cell = JkLangVector.get(cells, n);
		if(cell != null) {
			var ci = this.getColumnInfo(n);
			cell.setCellWidth((ci.getWidth()));
			cell.setCellAlign((ci.getAlign()));
		}
		n++;
	}
};

JkWidgetCommonTableWidget.prototype.setWidgetData = function(data) {
	this.data = data;
	if(this.getInitialized()) {
		this.updateDataWidgets();
	}
};

JkWidgetCommonTableWidget.prototype.setRowStyle = function(row) {
	row.setWidgetColor((this.context.getStyleColor("jkwidget", "table-row-color", "#EEEEEE")));
	row.setWidgetTextColor((this.context.getStyleColor("jkwidget", "table-row-text-color", "#000000")));
};

JkWidgetCommonTableWidget.prototype.updateDataWidgets = function() {
	var widgets = new Array;
	if(this.data != null) {
		var n = 0;
		var m = this.data.length;
		for(n = 0 ; n < m ; n++) {
			var entry = this.data[n];
			if(entry != null) {
				var v = JkWidgetCommonTableWidgetRowWidget.NEW_JkUiGuiApplicationContext(this.context);
				this.setRowStyle(v);
				if(entry != null) {
					var n2 = 0;
					var m2 = entry.length;
					for(n2 = 0 ; n2 < m2 ; n2++) {
						var cell = entry[n2];
						if(cell != null) {
							if(JkWidgetWidget.IS_INSTANCE && JkWidgetWidget.IS_INSTANCE(cell)) {
								v.addCellWidget(cell, 0.0, 0);
							}
							else {
								v.addText((JkLangString.asString(cell)), 0.0, 0);
							}
						}
					}
				}
				widgets.push(v);
			}
		}
	}
	this.rowWidgets = widgets;
	if(widgets != null) {
		var n3 = 0;
		var m3 = widgets.length;
		for(n3 = 0 ; n3 < m3 ; n3++) {
			var row = (function(o) {
				if(JkWidgetCommonTableWidgetRowWidget.IS_INSTANCE && JkWidgetCommonTableWidgetRowWidget.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))(widgets[n3]);
			if(row != null) {
				this.updateCellProperties(row);
			}
		}
	}
	var original = JkLangVector.get((JkWidgetWidget.getChildren(this.scrollerLayer)), 0);
	var scroller = JkWidgetCommonDynamicVerticalScrollerWidget.NEW_JkUiGuiApplicationContext(this.context);
	scroller.setWidgetContainerSpacing((this.context.getHeightValue("1mm")));
	scroller.setWidgetContainerMargin((this.context.getHeightValue("1mm")));
	scroller.setWidgetProvider((JkWidgetStaticWidgetProvider.forWidgets(widgets)));
	scroller.clear();
	JkWidgetWidget.setVisible(scroller, false);
	this.scrollerLayer.addWidget(scroller);
	if(original != null) {
		var o1 = original;
		var s = scroller;
		this.context.startTimer(0, (function() {
			JkWidgetWidget.removeFromParent(o1);
			JkWidgetWidget.setVisible(s, true);
		}.bind(this)));
	}
};

JkWidgetCommonTableWidget.prototype.createWidget = function() {
	JkWidgetVerticalBoxWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.header = JkWidgetCommonTableWidgetRowWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.header.setWidgetColor((this.context.getStyleColor("jkwidget", "table-header-color", "#777777")));
	this.header.setWidgetTextColor((this.context.getStyleColor("jkwidget", "table-header-text-color", "#FFFFFF")));
	this.addWidget(this.header);
	this.scrollerLayer = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.addWidget1(this.scrollerLayer, 1.0);
};

JkWidgetCommonTableWidget.prototype.getWidgetSortHandler = function() {
	return this.widgetSortHandler;
};

JkWidgetCommonTableWidget.prototype.setWidgetSortHandler = function(v) {
	this.widgetSortHandler = v;
	return this;
};

JkWidgetCommonTableWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonTableWidget"] === true;
};

let JkWidgetCommonActionBarWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetBackgroundColor = null;
	this.widgetTextColor = null;
	this.widgetMenuItemSpacing = 0;
	this.widgetTitle = null;
	this.widgetLeftIconResource = null;
	this.widgetLeftAction = null;
	this.widgetRightIconResource = null;
	this.widgetRightAction = null;
	this.widgetTitleContainer = null;
	this.label = null;
	this.leftButton = null;
	this.rightButton = null;
	this.box = null;
	this.menuItems = null;
	this.overlayWidget = null;
	this.canvas = null;
};

JkWidgetCommonActionBarWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonActionBarWidget.prototype.constructor = JkWidgetCommonActionBarWidget;
JkWidgetCommonActionBarWidget.prototype._t = {
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetScreenAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCommonActionBarWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonActionBarWidget.prototype._tobj = JkWidgetCommonActionBarWidget;

JkWidgetCommonActionBarWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonActionBarWidget;
	return v.CTOR_JkWidgetCommonActionBarWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonActionBarWidget.prototype.CTOR_JkWidgetCommonActionBarWidget_JkUiGuiApplicationContext = function(context) {
	this.canvas = null;
	this.overlayWidget = null;
	this.menuItems = null;
	this.box = null;
	this.rightButton = null;
	this.leftButton = null;
	this.label = null;
	this.widgetTitleContainer = null;
	this.widgetRightAction = null;
	this.widgetRightIconResource = null;
	this.widgetLeftAction = null;
	this.widgetLeftIconResource = null;
	this.widgetTitle = null;
	this.widgetMenuItemSpacing = 0;
	this.widgetTextColor = null;
	this.widgetBackgroundColor = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonActionBarWidget.prototype.setWidgetTitle = function(value) {
	this.widgetTitle = value;
	if(this.label != null) {
		this.label.setWidgetText(this.widgetTitle);
	}
	JkWidgetWidget.setLayoutSize(this.label, (-1), (JkWidgetWidget.getHeight(this.label)));
	return this;
};

JkWidgetCommonActionBarWidget.prototype.setWidgetTitleAlignment = function(align) {
	if(!(this.widgetTitleContainer != null)) {
		return;
	}
	this.widgetTitleContainer.setAlignForIndex(0, align, 0.5);
};

JkWidgetCommonActionBarWidget.prototype.setActionBarMargin = function(margin) {
	if(!(this.box != null)) {
		return;
	}
	this.box.setWidgetMargin(margin);
};

JkWidgetCommonActionBarWidget.prototype.setActionBarMarginLeft = function(margin) {
	if(!(this.box != null)) {
		return;
	}
	this.box.setWidgetMarginLeft(margin);
};

JkWidgetCommonActionBarWidget.prototype.setActionBarMarginRight = function(margin) {
	if(!(this.box != null)) {
		return;
	}
	this.box.setWidgetMarginRight(margin);
};

JkWidgetCommonActionBarWidget.prototype.setActionBarMarginTop = function(margin) {
	if(!(this.box != null)) {
		return;
	}
	this.box.setWidgetMarginTop(margin);
};

JkWidgetCommonActionBarWidget.prototype.setActionBarMarginBottom = function(margin) {
	if(!(this.box != null)) {
		return;
	}
	this.box.setWidgetMarginBottom(margin);
};

JkWidgetCommonActionBarWidget.prototype.getWidgetTitleLabel = function() {
	return this.label;
};

JkWidgetCommonActionBarWidget.prototype.getWidgetTitle = function() {
	return this.widgetTitle;
};

JkWidgetCommonActionBarWidget.prototype.configureLeftButton = function(iconResource, action) {
	this.widgetLeftIconResource = iconResource;
	this.widgetLeftAction = action;
	this.updateLeftButton();
};

JkWidgetCommonActionBarWidget.prototype.configureRightButton = function(iconResource, action) {
	this.widgetRightIconResource = iconResource;
	this.widgetRightAction = action;
	this.updateRightButton();
};

JkWidgetCommonActionBarWidget.prototype.configureRightButtonMenu = function(iconResource, menu) {
	this.widgetRightIconResource = iconResource;
	var m = menu;
	this.widgetRightAction = function() {
		JkWidgetCommonPopupMenu.showBelow(this.context, this.rightButton, m, (this.context.getWidthValue("50mm")), 1);
	}.bind(this);
	this.updateRightButton();
};

JkWidgetCommonActionBarWidget.prototype.updateLeftButton = function() {
	if(!(this.leftButton != null)) {
		return;
	}
	if(JkLangString.isNotEmpty(this.widgetLeftIconResource)) {
		this.leftButton.setWidgetImageResource(this.widgetLeftIconResource);
		this.leftButton.setWidgetClickHandler(this.widgetLeftAction);
	}
	else {
		this.leftButton.setWidgetImageResource(null);
		this.leftButton.setWidgetClickHandler(null);
	}
};

JkWidgetCommonActionBarWidget.prototype.updateRightButton = function() {
	if(!(this.rightButton != null)) {
		return;
	}
	if(JkLangString.isNotEmpty(this.widgetRightIconResource)) {
		this.rightButton.setWidgetImageResource(this.widgetRightIconResource);
		this.rightButton.setWidgetClickHandler(this.widgetRightAction);
	}
	else {
		this.rightButton.setWidgetImageResource(null);
		this.rightButton.setWidgetClickHandler(null);
	}
};

JkWidgetCommonActionBarWidget.prototype.getWidgetTextColor = function() {
	var wtc = this.widgetTextColor;
	if(!(wtc != null)) {
		wtc = JkGfxColor.forRGB(255, 255, 255);
	}
	return wtc;
};

JkWidgetCommonActionBarWidget.prototype.onWidgetAddedToScreen = function(screen) {
};

JkWidgetCommonActionBarWidget.prototype.onWidgetRemovedFromScreen = function(screen) {
};

JkWidgetCommonActionBarWidget.prototype.configureMenuItems = function(items) {
	if(!(items != null)) {
		return;
	}
	if(!(this.menuItems != null)) {
		return;
	}
	if(items != null) {
		var n = 0;
		var m = items.length;
		for(n = 0 ; n < m ; n++) {
			var widget = items[n];
			if(widget != null) {
				this.menuItems.addWidget(widget);
			}
		}
	}
};

JkWidgetCommonActionBarWidget.prototype.setActionBarBackgroundColor = function(color) {
	if(this.canvas != null) {
		this.canvas.setWidgetColor(color);
	}
};

JkWidgetCommonActionBarWidget.prototype.addOverlay = function(widget) {
	if(this.overlayWidget != null) {
		this.overlayWidget.addWidget(widget);
	}
};

JkWidgetCommonActionBarWidget.prototype.removeOverlay = function() {
	if(!(this.overlayWidget != null)) {
		return false;
	}
	JkWidgetWidget.removeChildrenOf(this.overlayWidget);
	return true;
};

JkWidgetCommonActionBarWidget.prototype.clearMenuItems = function() {
	if(this.menuItems != null) {
		JkWidgetWidget.removeChildrenOf(this.menuItems);
	}
};

JkWidgetCommonActionBarWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	var bgc = this.widgetBackgroundColor;
	if(bgc != null) {
		this.canvas = JkWidgetCanvasWidget.forColor(this.context, bgc);
		this.addWidget(this.canvas);
	}
	var tml = JkWidgetCommonTopMarginLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.label = JkWidgetLabelWidget.forText(this.context, this.widgetTitle);
	this.label.setWidgetFontFamily("Arial");
	var wtc = this.getWidgetTextColor();
	this.label.setWidgetTextColor(wtc);
	this.box = JkWidgetHorizontalBoxWidget.forContext(this.context, 0, 0);
	this.box.setWidgetMargin((this.context.getWidthValue("1mm")));
	this.box.setWidgetSpacing((this.context.getWidthValue("1mm")));
	this.leftButton = JkWidgetCommonImageButtonWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.leftButton.setWidgetButtonHeight((this.context.getHeightValue("6mm")));
	this.box.addWidget(this.leftButton);
	this.updateLeftButton();
	this.widgetTitleContainer = JkWidgetAlignWidget.forWidget(this.context, this.label, 0.5, 0.5, 0);
	this.box.addWidget1(this.widgetTitleContainer, 1.0);
	var spacing = this.widgetMenuItemSpacing;
	if(spacing < 0) {
		spacing = this.context.getWidthValue("1mm");
	}
	this.menuItems = JkWidgetHorizontalBoxWidget.forContext(this.context, (this.context.getWidthValue("1mm")), spacing);
	this.box.addWidget(this.menuItems);
	this.rightButton = JkWidgetCommonImageButtonWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.rightButton.setWidgetButtonHeight((this.context.getHeightValue("6mm")));
	this.box.addWidget(this.rightButton);
	this.updateRightButton();
	tml.addWidget(this.box);
	this.overlayWidget = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	tml.addWidget(this.overlayWidget);
	this.addWidget(tml);
};

JkWidgetCommonActionBarWidget.prototype.getWidgetBackgroundColor = function() {
	return this.widgetBackgroundColor;
};

JkWidgetCommonActionBarWidget.prototype.setWidgetBackgroundColor = function(v) {
	this.widgetBackgroundColor = v;
	return this;
};

JkWidgetCommonActionBarWidget.prototype.setWidgetTextColor = function(v) {
	this.widgetTextColor = v;
	return this;
};

JkWidgetCommonActionBarWidget.prototype.getWidgetMenuItemSpacing = function() {
	return this.widgetMenuItemSpacing;
};

JkWidgetCommonActionBarWidget.prototype.setWidgetMenuItemSpacing = function(v) {
	this.widgetMenuItemSpacing = v;
	return this;
};

JkWidgetCommonActionBarWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonActionBarWidget"] === true;
};

let JkWidgetCommonCheckBoxWidget = function() {
	JkWidgetWidget.call(this);
	this.widgetContext = null;
	this.widgetText = null;
	this.widgetTextColor = null;
	this.widgetFontResource = null;
	this.widgetFontFamily = null;
	this.widgetCheckHandler = null;
};

JkWidgetCommonCheckBoxWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetCommonCheckBoxWidget.prototype.constructor = JkWidgetCommonCheckBoxWidget;
JkWidgetCommonCheckBoxWidget.prototype._t = {
	"JkWidgetWidgetWithValue" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCommonCheckBoxWidget" : true
};
JkWidgetCommonCheckBoxWidget.prototype._tobj = JkWidgetCommonCheckBoxWidget;

JkWidgetCommonCheckBoxWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonCheckBoxWidget;
	return v.CTOR_JkWidgetCommonCheckBoxWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonCheckBoxWidget.prototype.CTOR_JkWidgetCommonCheckBoxWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.widgetCheckHandler = null;
	this.widgetFontFamily = null;
	this.widgetFontResource = null;
	this.widgetTextColor = null;
	this.widgetText = null;
	this.widgetContext = null;
	this.widgetContext = context;
	this.widgetFontFamily = "Arial";
	this.widgetTextColor = JkGfxColor.black();
	this.setWidgetTextColor(this.widgetTextColor);
	return this;
};

JkWidgetCommonCheckBoxWidget.forText = function(context, text) {
	var v = JkWidgetCommonCheckBoxWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetText(text);
	return v;
};

JkWidgetCommonCheckBoxWidget.prototype.createElement = function() {
	var v = JkUiHTMLDOM.createElement("div");
	var input = JkUiHTMLDOM.createElement("input");
	JkUiHTMLDOM.setAttribute(input, "type", "checkbox");
	JkUiHTMLDOM.addEventListener(input, "change", (function() {
		this.onCheckChangeListener();
	}.bind(this)));
	var label = JkUiHTMLDOM.createElement("label");
	JkUiHTMLDOM.setStyle(label, "margin-left", "5px");
	JkUiHTMLDOM.setStyle(label, "font-size", "14px");
	JkUiHTMLDOM.setStyle(input, "cursor", "pointer");
	JkUiHTMLDOM.appendChild(v, input);
	JkUiHTMLDOM.appendChild(v, label);
	return v;
};

JkWidgetCommonCheckBoxWidget.prototype.setWidgetText = function(text) {
	this.widgetText = text;
	var child = JkUiHTMLDOM.getChild(this.element, 1);
	JkUiHTMLDOM.setTextContent(child, text);
};

JkWidgetCommonCheckBoxWidget.prototype.getWidgetText = function() {
	return this.widgetText;
};

JkWidgetCommonCheckBoxWidget.prototype.setWidgetTextColor = function(color) {
	this.widgetTextColor = color;
	this.updateWidgetFont();
	return this;
};

JkWidgetCommonCheckBoxWidget.prototype.getWidgetTextColor = function() {
	return this.widgetTextColor;
};

JkWidgetCommonCheckBoxWidget.prototype.setWidgetFontFamily = function(font) {
	this.widgetFontFamily = font;
	this.updateWidgetFont();
	return this;
};

JkWidgetCommonCheckBoxWidget.prototype.setWidgetFontResource = function(res) {
	this.widgetFontResource = res;
	this.updateWidgetFont();
	return this;
};

JkWidgetCommonCheckBoxWidget.prototype.updateWidgetFont = function() {
	var child = JkUiHTMLDOM.getChild(this.element, 1);
	JkUiHTMLDOM.setStyle(child, "color", (JkUiHTMLDOM.colorToRGBA(this.widgetTextColor)));
	JkUiHTMLDOM.setFontFamily(this.element, this.widgetFontFamily);
};

JkWidgetCommonCheckBoxWidget.prototype.getWidgetChecked = function() {
	return this.element.firstChild.checked;
};

JkWidgetCommonCheckBoxWidget.prototype.setWidgetChecked = function(x) {
	var child = JkUiHTMLDOM.getChild(this.element, 0);
	if(x == true) {
		child.checked = true;
		;
	}
	else {
		child.checked = false;
		;
	}
};

JkWidgetCommonCheckBoxWidget.prototype.setWidgetValue = function(value) {
	this.setWidgetChecked((JkLangBoolean.asBoolean(value, false)));
};

JkWidgetCommonCheckBoxWidget.prototype.getWidgetValue = function() {
	return JkLangBoolean.asObject((this.getWidgetChecked()));
};

JkWidgetCommonCheckBoxWidget.prototype.onCheckChangeListener = function() {
	if(this.widgetCheckHandler != null) {
		this.widgetCheckHandler();
	}
};

JkWidgetCommonCheckBoxWidget.prototype.getWidgetCheckHandler = function() {
	return this.widgetCheckHandler;
};

JkWidgetCommonCheckBoxWidget.prototype.setWidgetCheckHandler = function(v) {
	this.widgetCheckHandler = v;
	return this;
};

JkWidgetCommonCheckBoxWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonCheckBoxWidget"] === true;
};

let JkWidgetCommonSwitcherLayerWidget = function() {
	JkWidgetContainerWidget.call(this);
	this.margin = 0;
};

JkWidgetCommonSwitcherLayerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetContainerWidget.prototype);
JkWidgetCommonSwitcherLayerWidget.prototype.constructor = JkWidgetCommonSwitcherLayerWidget;
JkWidgetCommonSwitcherLayerWidget.prototype._t = {
	"JkWidgetCommonSwitcherLayerWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonSwitcherLayerWidget.prototype._tobj = JkWidgetCommonSwitcherLayerWidget;

JkWidgetCommonSwitcherLayerWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonSwitcherLayerWidget;
	return v.CTOR_JkWidgetCommonSwitcherLayerWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonSwitcherLayerWidget.prototype.CTOR_JkWidgetCommonSwitcherLayerWidget_JkUiGuiApplicationContext = function(context) {
	this.margin = 0;
	if(JkWidgetContainerWidget.prototype.CTOR_JkWidgetContainerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonSwitcherLayerWidget.findTopMostLayerWidget = function(widget) {
	var v = null;
	var pp = widget;
	while(pp != null){
		if(JkWidgetCommonSwitcherLayerWidget.IS_INSTANCE && JkWidgetCommonSwitcherLayerWidget.IS_INSTANCE(pp)) {
			v = pp;
		}
		pp = JkWidgetWidget.getParent(pp);
	}
	return v;
};

JkWidgetCommonSwitcherLayerWidget.forMargin = function(context, margin) {
	var v = JkWidgetCommonSwitcherLayerWidget.NEW_JkUiGuiApplicationContext(context);
	v.margin = margin;
	return v;
};

JkWidgetCommonSwitcherLayerWidget.forWidget = function(context, widget, margin) {
	var v = JkWidgetCommonSwitcherLayerWidget.NEW_JkUiGuiApplicationContext(context);
	v.margin = margin;
	v.addWidget(widget);
	return v;
};

JkWidgetCommonSwitcherLayerWidget.forWidgets = function(context, widgets, margin) {
	var v = JkWidgetCommonSwitcherLayerWidget.NEW_JkUiGuiApplicationContext(context);
	v.margin = margin;
	if(widgets != null) {
		var n = 0;
		var m = widgets.length;
		for(n = 0 ; n < m ; n++) {
			var widget = widgets[n];
			if(widget != null) {
				v.addWidget(widget);
			}
		}
	}
	return v;
};

JkWidgetCommonSwitcherLayerWidget.prototype.onWidgetHeightChanged = function(height) {
	JkWidgetContainerWidget.prototype.onWidgetHeightChanged.call(this, height);
	var children = JkWidgetWidget.getChildren(this);
	if(children != null) {
		var topmost = JkLangVector.get(children, (JkLangVector.getSize(children) - 1));
		if(topmost != null) {
			JkWidgetWidget.resizeHeight(topmost, (height - this.margin - this.margin));
		}
	}
};

JkWidgetCommonSwitcherLayerWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	var children = JkWidgetWidget.getChildren(this);
	if(!(children != null)) {
		return;
	}
	var childCount = JkLangVector.getSize(children);
	var wc = -1;
	if(widthConstraint >= 0) {
		wc = widthConstraint - this.margin - this.margin;
		if(wc < 0) {
			wc = 0;
		}
	}
	var mw = 0;
	var mh = 0;
	var n = 0;
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n2 = 0;
		var m = array.length;
		for(n2 = 0 ; n2 < m ; n2++) {
			var child = array[n2];
			if(child != null) {
				if(n == childCount - 1) {
					JkWidgetWidget.layout(child, wc, false);
					mw = JkWidgetWidget.getWidth(child);
					mh = JkWidgetWidget.getHeight(child);
					JkWidgetWidget.move(child, this.margin, this.margin);
				}
				else {
					var ww = JkWidgetWidget.getWidth(child);
					JkWidgetWidget.move(child, (-ww), this.margin);
				}
				n++;
			}
		}
	}
	JkWidgetWidget.setLayoutSize(this, (mw + this.margin + this.margin), (mh + this.margin + this.margin));
};

JkWidgetCommonSwitcherLayerWidget.prototype.removeAllChildren = function() {
	JkWidgetWidget.removeChildrenOf(this);
};

JkWidgetCommonSwitcherLayerWidget.prototype.getChildWidget = function(index) {
	var children = JkWidgetWidget.getChildren(this);
	if(!(children != null)) {
		return null;
	}
	return JkLangVector.get(children, index);
};

JkWidgetCommonSwitcherLayerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonSwitcherLayerWidget"] === true;
};

let JkWidgetCommonPopupWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetContext = null;
	this.widgetContainerBackgroundColor = null;
	this.widgetContainer = null;
	this.widgetContent = null;
	this.animationDestY = 0;
	this.popupShowAnimationEndHandler = null;
	this.popupHideAnimationEndHandler = null;
	this.widgetModal = true;
};

JkWidgetCommonPopupWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonPopupWidget.prototype.constructor = JkWidgetCommonPopupWidget;
JkWidgetCommonPopupWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCommonPopupWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonPopupWidget.prototype._tobj = JkWidgetCommonPopupWidget;

JkWidgetCommonPopupWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCommonPopupWidget;
	return v.CTOR_JkWidgetCommonPopupWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCommonPopupWidget.prototype.CTOR_JkWidgetCommonPopupWidget_JkUiGuiApplicationContext = function(ctx) {
	this.widgetModal = true;
	this.popupHideAnimationEndHandler = null;
	this.popupShowAnimationEndHandler = null;
	this.animationDestY = 0;
	this.widgetContent = null;
	this.widgetContainer = null;
	this.widgetContainerBackgroundColor = null;
	this.widgetContext = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.widgetContext = ctx;
	return this;
};

JkWidgetCommonPopupWidget.forContentWidget = function(context, widget) {
	var v = JkWidgetCommonPopupWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetContent(widget);
	return v;
};

JkWidgetCommonPopupWidget.prototype.setWidgetContainerBackgroundColor = function(color) {
	if(color != null) {
		this.widgetContainerBackgroundColor = JkWidgetCanvasWidget.forColor(this.widgetContext, color);
	}
};

JkWidgetCommonPopupWidget.prototype.setWidgetContent = function(widget) {
	if(widget != null) {
		this.widgetContent = widget;
	}
};

JkWidgetCommonPopupWidget.prototype.getWidgetContainerBackgroundColor = function() {
	return this.widgetContainerBackgroundColor;
};

JkWidgetCommonPopupWidget.prototype.getWidgetContent = function() {
	return this.widgetContent;
};

JkWidgetCommonPopupWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	if(this.widgetContainerBackgroundColor == null) {
		this.widgetContainerBackgroundColor = JkWidgetCanvasWidget.forColor(this.widgetContext, (JkGfxColor.forRGBADouble(0, 0, 0, 0.8)));
		JkWidgetWidget.setWidgetClickHandler(this.widgetContainerBackgroundColor, (function() {
			if(!this.widgetModal) {
				this.hidePopup();
			}
		}.bind(this)));
	}
	this.addWidget(this.widgetContainerBackgroundColor);
	if(this.widgetContent != null) {
		this.addWidget((JkWidgetAlignWidget.forWidget(this.widgetContext, this.widgetContent, 0.5, 0.5, 0)));
	}
};

JkWidgetCommonPopupWidget.prototype.onWidgetHeightChanged = function(height) {
	JkWidgetLayerWidget.prototype.onWidgetHeightChanged.call(this, height);
	this.animationDestY = JkWidgetWidget.getY(this.widgetContent);
};

JkWidgetCommonPopupWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	JkWidgetLayerWidget.prototype.computeWidgetLayout.call(this, widthConstraint);
	this.animationDestY = JkWidgetWidget.getY(this.widgetContent);
};

JkWidgetCommonPopupWidget.prototype.showPopup = function(widget) {
	var parentLayer = null;
	var div = JkUiHTMLDOM.createElement("div");
	JkUiHTMLDOM.setStyle(div, "position", "fixed");
	JkUiHTMLDOM.setStyle(div, "bottom", "0px");
	JkUiHTMLDOM.setStyle(div, "top", "0px");
	JkUiHTMLDOM.setStyle(div, "left", "0px");
	JkUiHTMLDOM.setStyle(div, "right", "0px");
	JkUiHTMLDOM.setStyle(div, "width", "100%");
	JkUiHTMLDOM.setStyle(div, "height", "100%");
	JkUiHTMLDOM.setStyle(div, "z-index", "999");
	JkUiHTMLDOM.appendToBody(div);
	parentLayer = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	parentLayer.setAllowResize(false);
	JkWidgetWidget.addToDomElement(parentLayer, div);
	this.widgetContainer = JkWidgetVerticalScrollerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.widgetContainer.setWidgetScrollBarDisabled(true);
	this.widgetContainer.addWidget(this);
	parentLayer.addWidget(this.widgetContainer);
	JkWidgetWidget.setAlpha(this.widgetContainerBackgroundColor, 0);
	JkWidgetWidget.setAlpha(this.widgetContent, 0);
	this.animationDestY = JkWidgetWidget.getY(this.widgetContent);
	var ay = this.context.getHeightValue("3mm");
	JkWidgetWidget.move(this.widgetContent, (JkWidgetWidget.getX(this.widgetContent)), (~(~(this.animationDestY + ay))));
	var anim = JkWidgetWidgetAnimation.forDuration(this.context, 300);
	anim.addCallback((function(completion1) {
		var bgf = completion1 * 1.5;
		if(bgf > 1.0) {
			bgf = 1.0;
		}
		JkWidgetWidget.setAlpha(this.widgetContainerBackgroundColor, bgf);
		JkWidgetWidget.setAlpha(this.widgetContent, completion1);
		JkWidgetWidget.move(this.widgetContent, (JkWidgetWidget.getX(this.widgetContent)), (~(~(this.animationDestY + ~(~((1.0 - completion1) * ay))))));
	}.bind(this)));
	anim.setEndListener((function() {
		if(this.popupShowAnimationEndHandler != null) {
			this.popupShowAnimationEndHandler();
		}
	}.bind(this)));
	anim.start();
};

JkWidgetCommonPopupWidget.prototype.hidePopup = function() {
	var anim = JkWidgetWidgetAnimation.forDuration(this.context, 300);
	anim.addFadeOut(this.widgetContainer, true);
	var parent = JkUiHTMLDOM.getParentElement((JkUiHTMLDOM.getParentElement(this.widgetContainer.element)));
	anim.setEndListener((function() {
		if(this.popupHideAnimationEndHandler != null) {
			this.popupHideAnimationEndHandler();
		}
		JkUiHTMLDOM.remove(parent);
	}.bind(this)));
	anim.start();
};

JkWidgetCommonPopupWidget.prototype.getPopupShowAnimationEndHandler = function() {
	return this.popupShowAnimationEndHandler;
};

JkWidgetCommonPopupWidget.prototype.setPopupShowAnimationEndHandler = function(v) {
	this.popupShowAnimationEndHandler = v;
	return this;
};

JkWidgetCommonPopupWidget.prototype.getPopupHideAnimationEndHandler = function() {
	return this.popupHideAnimationEndHandler;
};

JkWidgetCommonPopupWidget.prototype.setPopupHideAnimationEndHandler = function(v) {
	this.popupHideAnimationEndHandler = v;
	return this;
};

JkWidgetCommonPopupWidget.prototype.getWidgetModal = function() {
	return this.widgetModal;
};

JkWidgetCommonPopupWidget.prototype.setWidgetModal = function(v) {
	this.widgetModal = v;
	return this;
};

JkWidgetCommonPopupWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonPopupWidget"] === true;
};

let JkWidgetCommonLoadingWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.loading = null;
	this.animation = null;
};

JkWidgetCommonLoadingWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonLoadingWidget.prototype.constructor = JkWidgetCommonLoadingWidget;
JkWidgetCommonLoadingWidget.prototype._t = {
	"JkWidgetCommonLoadingWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonLoadingWidget.prototype._tobj = JkWidgetCommonLoadingWidget;

JkWidgetCommonLoadingWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonLoadingWidget;
	return v.CTOR_JkWidgetCommonLoadingWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonLoadingWidget.prototype.CTOR_JkWidgetCommonLoadingWidget_JkUiGuiApplicationContext = function(context) {
	this.animation = null;
	this.loading = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonLoadingWidget.initializeWithText = function(text) {
	JkWidgetCommonLoadingWidget.displayText = text;
	JkWidgetCommonLoadingWidget.displayImage = null;
};

JkWidgetCommonLoadingWidget.initializeWithImage = function(image) {
	JkWidgetCommonLoadingWidget.displayText = null;
	JkWidgetCommonLoadingWidget.displayImage = image;
};

JkWidgetCommonLoadingWidget.openPopup = function(context, widget) {
	var v = JkWidgetCommonLoadingWidget.NEW_JkUiGuiApplicationContext(context);
	if(v.showPopup(widget) == false) {
		v = null;
	}
	return v;
};

JkWidgetCommonLoadingWidget.closePopup = function(widget) {
	if(widget != null) {
		widget.stop();
		JkWidgetWidget.removeFromParent(widget);
	}
	return null;
};

JkWidgetCommonLoadingWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	var background = JkWidgetCanvasWidget.forColor(this.context, (JkGfxColor.forRGBADouble(0, 0, 0, 0.8)));
	JkWidgetWidget.setWidgetClickHandler(background, (function() {
		;
	}.bind(this)));
	this.addWidget(background);
	if(JkWidgetCommonLoadingWidget.displayImage != null) {
		var img = JkWidgetImageWidget.forImage(this.context, JkWidgetCommonLoadingWidget.displayImage);
		img.setWidgetImageHeight((this.context.getHeightValue("20mm")));
		this.loading = img;
	}
	else {
		var text = JkWidgetCommonLoadingWidget.displayText;
		if(JkLangString.isEmpty(text)) {
			text = "Loading ..";
		}
		var lt = JkWidgetLabelWidget.forText(this.context, text);
		lt.setWidgetTextColor((JkGfxColor.white()));
		lt.setWidgetFontSize((this.context.getHeightValue("3mm")));
		this.loading = lt;
	}
	this.addWidget((JkWidgetAlignWidget.forWidget(this.context, this.loading, 0.5, 0.5, 0)));
	this.start();
};

JkWidgetCommonLoadingWidget.prototype.start = function() {
	this.animation = JkWidgetWidgetAnimation.forDuration(this.context, 1000);
	this.animation.addFadeOutIn(this.loading);
	this.animation.setShouldLoop(true);
	this.animation.start();
};

JkWidgetCommonLoadingWidget.prototype.stop = function() {
	if(this.animation != null) {
		this.animation.setShouldStop(true);
		this.animation = null;
	}
};

JkWidgetCommonLoadingWidget.prototype.showPopup = function(target) {
	var topmost = JkWidgetLayerWidget.findTopMostLayerWidget(target);
	if(topmost == null) {
		return false;
	}
	topmost.addWidget(this);
	return true;
};

JkWidgetCommonLoadingWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonLoadingWidget"] === true;
};

JkWidgetCommonLoadingWidget.displayText = null;
JkWidgetCommonLoadingWidget.displayImage = null;

let JkWidgetCommonProgressBarWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetProgressBarColor = JkGfxColor.black();
	this.minimumPercentage = 0;
	this.maximumPercentage = 100;
	this.currentPercentage = 0;
	this.totalPercentage = 0;
	this.widgetWidth = 0;
	this.layer = null;
	this.hbox = null;
	this.container = null;
	this.canvas = null;
};

JkWidgetCommonProgressBarWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonProgressBarWidget.prototype.constructor = JkWidgetCommonProgressBarWidget;
JkWidgetCommonProgressBarWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCommonProgressBarWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonProgressBarWidget.prototype._tobj = JkWidgetCommonProgressBarWidget;

JkWidgetCommonProgressBarWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonProgressBarWidget;
	return v.CTOR_JkWidgetCommonProgressBarWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonProgressBarWidget.prototype.CTOR_JkWidgetCommonProgressBarWidget_JkUiGuiApplicationContext = function(context) {
	this.canvas = null;
	this.container = null;
	this.hbox = null;
	this.layer = null;
	this.widgetWidth = 0;
	this.totalPercentage = 0;
	this.currentPercentage = 0;
	this.maximumPercentage = 100;
	this.minimumPercentage = 0;
	this.widgetProgressBarColor = JkGfxColor.black();
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonProgressBarWidget.prototype.updateProgress = function(value) {
	this.currentPercentage = value;
	var percentage = 100 / this.maximumPercentage * this.currentPercentage;
	if(percentage < this.minimumPercentage) {
		percentage = this.minimumPercentage;
	}
	this.totalPercentage = percentage;
	this.widgetWidth = JkWidgetWidget.getWidth(this.layer) / this.maximumPercentage * percentage;
	if(this.totalPercentage <= 100) {
		if(this.totalPercentage < 1) {
			this.totalPercentage = 0;
			this.canvas.setWidgetColor((JkGfxColor.white()));
		}
		else {
			this.canvas.setWidgetColor(this.widgetProgressBarColor);
		}
		this.container.setWidgetWidthRequest(this.widgetWidth);
	}
};

JkWidgetCommonProgressBarWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.setWidgetHeightRequest((this.context.getHeightValue("10mm")));
	this.layer = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.layer.setWidgetMargin((this.context.getHeightValue("1px")));
	var widget = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget.setWidgetOutlineColor((JkGfxColor.black()));
	widget.setWidgetOutlineWidth((this.context.getHeightValue("1px")));
	this.layer.addWidget(widget);
	this.hbox = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.container = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.canvas = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.container.addWidget(this.canvas);
	this.hbox.addWidget(this.container);
	this.layer.addWidget(this.hbox);
	this.addWidget(this.layer);
};

JkWidgetCommonProgressBarWidget.prototype.getWidgetProgressBarColor = function() {
	return this.widgetProgressBarColor;
};

JkWidgetCommonProgressBarWidget.prototype.setWidgetProgressBarColor = function(v) {
	this.widgetProgressBarColor = v;
	return this;
};

JkWidgetCommonProgressBarWidget.prototype.getMinimumPercentage = function() {
	return this.minimumPercentage;
};

JkWidgetCommonProgressBarWidget.prototype.setMinimumPercentage = function(v) {
	this.minimumPercentage = v;
	return this;
};

JkWidgetCommonProgressBarWidget.prototype.getMaximumPercentage = function() {
	return this.maximumPercentage;
};

JkWidgetCommonProgressBarWidget.prototype.setMaximumPercentage = function(v) {
	this.maximumPercentage = v;
	return this;
};

JkWidgetCommonProgressBarWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonProgressBarWidget"] === true;
};

let JkWidgetCommonNavigationWidget = function() {
	JkWidgetCommonNavigationFrameWidget.call(this);
	this.widgetBackImageResourceName = "backarrow";
	this.widgetStack = null;
	this.contentWidget = null;
};

JkWidgetCommonNavigationWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetCommonNavigationFrameWidget.prototype);
JkWidgetCommonNavigationWidget.prototype.constructor = JkWidgetCommonNavigationWidget;
JkWidgetCommonNavigationWidget.prototype._t = {
	"JkUiKeyListener" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetTitleContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetCommonNavigationFrameWidget" : true,
	"JkWidgetCommonNavigationWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetParentAwareWidget" : true
};
JkWidgetCommonNavigationWidget.prototype._tobj = JkWidgetCommonNavigationWidget;

JkWidgetCommonNavigationWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCommonNavigationWidget;
	return v.CTOR_JkWidgetCommonNavigationWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCommonNavigationWidget.prototype.CTOR_JkWidgetCommonNavigationWidget_JkUiGuiApplicationContext = function(ctx) {
	this.contentWidget = null;
	this.widgetStack = null;
	this.widgetBackImageResourceName = "backarrow";
	if(JkWidgetCommonNavigationFrameWidget.prototype.CTOR_JkWidgetCommonNavigationFrameWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.widgetStack = JkLangStack.NEW();
	return this;
};

JkWidgetCommonNavigationWidget.switchToContainer = function(widget, newWidget) {
	var ng = null;
	var pp = JkWidgetWidget.getParent(widget);
	while(pp != null){
		if(JkWidgetCommonNavigationWidget.IS_INSTANCE && JkWidgetCommonNavigationWidget.IS_INSTANCE(pp)) {
			ng = pp;
			break;
		}
		pp = JkWidgetWidget.getParent(pp);
	}
	if(!(ng != null)) {
		return false;
	}
	return ng.switchWidget(newWidget);
};

JkWidgetCommonNavigationWidget.pushToContainer = function(widget, newWidget) {
	var ng = null;
	var pp = JkWidgetWidget.getParent(widget);
	while(pp != null){
		if(JkWidgetCommonNavigationWidget.IS_INSTANCE && JkWidgetCommonNavigationWidget.IS_INSTANCE(pp)) {
			ng = pp;
			break;
		}
		pp = JkWidgetWidget.getParent(pp);
	}
	if(!(ng != null)) {
		return false;
	}
	return ng.pushWidget(newWidget);
};

JkWidgetCommonNavigationWidget.popFromContainer = function(widget) {
	var ng = null;
	var pp = JkWidgetWidget.getParent(widget);
	while(pp != null){
		if(JkWidgetCommonNavigationWidget.IS_INSTANCE && JkWidgetCommonNavigationWidget.IS_INSTANCE(pp)) {
			ng = pp;
			break;
		}
		pp = JkWidgetWidget.getParent(pp);
	}
	if(!(ng != null)) {
		return null;
	}
	return ng.popWidget();
};

JkWidgetCommonNavigationWidget.findNavigationWidget = function(widget) {
	var pp = JkWidgetWidget.getParent(widget);
	while(pp != null){
		if(JkWidgetCommonNavigationWidget.IS_INSTANCE && JkWidgetCommonNavigationWidget.IS_INSTANCE(pp)) {
			return pp;
		}
		pp = JkWidgetWidget.getParent(pp);
	}
	return null;
};

JkWidgetCommonNavigationWidget.prototype.createMainWidget = function() {
	return null;
};

JkWidgetCommonNavigationWidget.prototype.initializeWidget = function() {
	JkWidgetCommonNavigationFrameWidget.prototype.initializeWidget.call(this);
	var main = this.contentWidget;
	if(!(main != null)) {
		main = this.createMainWidget();
	}
	if(main != null) {
		this.pushWidget(main);
	}
};

JkWidgetCommonNavigationWidget.prototype.updateMenuButton = function() {
	if(!(this.actionBar != null)) {
		return;
	}
	var handler = this.getMenuHandler();
	if(this.widgetStack != null && this.widgetStack.getSize() > 1) {
		this.actionBar.configureLeftButton(this.widgetBackImageResourceName, (function() {
			this.popWidget();
		}.bind(this)));
	}
	else {
		this.defaultLeftButtonConfiguration();
	}
};

JkWidgetCommonNavigationWidget.prototype.onKeyEvent = function(event) {
	if(event.isKeyPress(JkUiKeyEvent.KEY_BACK)) {
		if(this.widgetStack != null && this.widgetStack.getSize() > 1) {
			if(this.popWidget() != null) {
				event.consume();
			}
		}
	}
};

JkWidgetCommonNavigationWidget.prototype.setWidgetContent = function(widget) {
	if(!(widget != null)) {
		return;
	}
	if(this.widgetStack.getSize() > 0) {
		return;
	}
	if(!(this.contentArea != null)) {
		this.contentWidget = widget;
		return;
	}
	this.pushWidget(widget);
};

JkWidgetCommonNavigationWidget.prototype.pushWidget = function(widget) {
	if(this.contentArea == null || widget == null) {
		return false;
	}
	this.widgetStack.push(widget);
	this.contentArea.addWidget(widget);
	this.onCurrentWidgetChanged();
	return true;
};

JkWidgetCommonNavigationWidget.prototype.switchWidget = function(widget) {
	if(!(widget != null)) {
		return false;
	}
	this.popWidget();
	return this.pushWidget(widget);
};

JkWidgetCommonNavigationWidget.prototype.popWidget = function() {
	if(!(this.contentArea != null)) {
		return null;
	}
	var topmost = this.widgetStack.pop();
	if(!(topmost != null)) {
		return null;
	}
	JkWidgetWidget.removeFromParent(topmost);
	this.onCurrentWidgetChanged();
	return topmost;
};

JkWidgetCommonNavigationWidget.prototype.peekWidget = function() {
	return this.widgetStack.peek();
};

JkWidgetCommonNavigationWidget.prototype.getWidgetBackImageResourceName = function() {
	return this.widgetBackImageResourceName;
};

JkWidgetCommonNavigationWidget.prototype.setWidgetBackImageResourceName = function(v) {
	this.widgetBackImageResourceName = v;
	return this;
};

JkWidgetCommonNavigationWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonNavigationWidget"] === true;
};

let JkWidgetCommonSelectSearchWidgetMyContainerWidget = function() {
	JkWidgetContainerWidget.call(this);
	this.widget = null;
};

JkWidgetCommonSelectSearchWidgetMyContainerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetContainerWidget.prototype);
JkWidgetCommonSelectSearchWidgetMyContainerWidget.prototype.constructor = JkWidgetCommonSelectSearchWidgetMyContainerWidget;
JkWidgetCommonSelectSearchWidgetMyContainerWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetCommonSelectSearchWidgetMyContainerWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonSelectSearchWidgetMyContainerWidget.prototype._tobj = JkWidgetCommonSelectSearchWidgetMyContainerWidget;

JkWidgetCommonSelectSearchWidgetMyContainerWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonSelectSearchWidgetMyContainerWidget;
	return v.CTOR_JkWidgetCommonSelectSearchWidgetMyContainerWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonSelectSearchWidgetMyContainerWidget.prototype.CTOR_JkWidgetCommonSelectSearchWidgetMyContainerWidget_JkUiGuiApplicationContext = function(context) {
	this.widget = null;
	if(JkWidgetContainerWidget.prototype.CTOR_JkWidgetContainerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonSelectSearchWidgetMyContainerWidget.prototype.onWidgetHeightChanged = function(height) {
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.move(child, (JkWidgetWidget.getAbsoluteX(this.widget)), (JkWidgetWidget.getAbsoluteY(this.widget)));
			}
		}
	}
};

JkWidgetCommonSelectSearchWidgetMyContainerWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.layout(child, (JkWidgetWidget.getWidth(this.widget)), false);
				JkWidgetWidget.move(child, (JkWidgetWidget.getAbsoluteX(this.widget)), (JkWidgetWidget.getAbsoluteY(this.widget)));
			}
		}
	}
	JkWidgetWidget.setLayoutSize(this, widthConstraint, (JkWidgetWidget.getHeight(this)));
};

JkWidgetCommonSelectSearchWidgetMyContainerWidget.prototype.getWidget = function() {
	return this.widget;
};

JkWidgetCommonSelectSearchWidgetMyContainerWidget.prototype.setWidget = function(v) {
	this.widget = v;
	return this;
};

JkWidgetCommonSelectSearchWidgetMyContainerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonSelectSearchWidgetMyContainerWidget"] === true;
};

let JkWidgetCommonSelectSearchWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.defaultNoRecordMessage = "No record found";
	this.widgetOutlineColor = null;
	this.widgetItems = null;
	this.widgetValueChangeHandler = null;
	this.itemscontainer = null;
	this.myContainer = null;
	this.container = null;
	this.shown = false;
	this.background = null;
	this.label = null;
	this.icon = null;
};

JkWidgetCommonSelectSearchWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonSelectSearchWidget.prototype.constructor = JkWidgetCommonSelectSearchWidget;
JkWidgetCommonSelectSearchWidget.prototype._t = {
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetWidgetWithValue" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetCommonSelectSearchWidget" : true
};
JkWidgetCommonSelectSearchWidget.prototype._tobj = JkWidgetCommonSelectSearchWidget;

JkWidgetCommonSelectSearchWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonSelectSearchWidget;
	return v.CTOR_JkWidgetCommonSelectSearchWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonSelectSearchWidget.prototype.CTOR_JkWidgetCommonSelectSearchWidget_JkUiGuiApplicationContext = function(context) {
	this.icon = null;
	this.label = null;
	this.background = null;
	this.shown = false;
	this.container = null;
	this.myContainer = null;
	this.itemscontainer = null;
	this.widgetValueChangeHandler = null;
	this.widgetItems = null;
	this.widgetOutlineColor = null;
	this.defaultNoRecordMessage = "No record found";
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonSelectSearchWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	this.itemscontainer = JkWidgetVerticalBoxWidget.forContext(this.context, 0, 0);
	var input = JkWidgetCommonTextInputWidget.forType(this.context, JkWidgetCommonTextInputWidget.TYPE_DEFAULT, "Search");
	input.setWidgetPadding1((this.context.getHeightValue("1000um")));
	input.setWidgetTextChangeHandler((function() {
		this.onWidgetTextChanged((input.getWidgetText()));
	}.bind(this)));
	var canvas = JkWidgetCanvasWidget.forColor(this.context, (JkGfxColor.white()));
	canvas.setWidgetOutlineWidth((this.context.getHeightValue("100um")));
	if(this.widgetOutlineColor != null) {
		this.background.setWidgetOutlineColor(this.widgetOutlineColor);
		canvas.setWidgetOutlineColor(this.widgetOutlineColor);
	}
	else {
		canvas.setWidgetOutlineColor((JkGfxColor.black()));
	}
	var vbox = JkWidgetVerticalBoxWidget.forContext(this.context, 0, 0);
	vbox.addWidget((JkWidgetLayerWidget.forWidget(this.context, input, (this.context.getHeightValue("500um")))));
	vbox.addWidget((JkWidgetLayerWidget.forWidget(this.context, this.itemscontainer, (this.context.getHeightValue("500um")))));
	this.container = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.container.addWidget(canvas);
	this.container.addWidget(vbox);
	JkWidgetWidget.setWidgetClickHandler(this, (function() {
		if(!this.shown) {
			this.showPopup();
		}
		else {
			this.closePopup();
		}
	}.bind(this)));
};

JkWidgetCommonSelectSearchWidget.prototype.setWidgetPlaceholder = function(text) {
	this.label.setWidgetText(text);
	return this;
};

JkWidgetCommonSelectSearchWidget.prototype.setWidgetImageResource = function(resource) {
	this.icon.setWidgetImageResource(resource);
	return this;
};

JkWidgetCommonSelectSearchWidget.prototype.setWidgetBackgroundColor = function(color) {
	this.background.setWidgetColor(color);
	return this;
};

JkWidgetCommonSelectSearchWidget.prototype.onWidgetTextChanged = function(value) {
	this.clearItems();
	this.searchStringFromItems(value);
};

JkWidgetCommonSelectSearchWidget.prototype.searchStringFromItems = function(value) {
	if(!(this.widgetItems != null) || this.widgetItems.count() < 1) {
		this.addItemToList(null);
	}
	var isEmpty = false;
	if(JkLangString.isEmpty(value)) {
		isEmpty = true;
	}
	var it = this.widgetItems.iterate();
	while(it != null){
		var item = it.next();
		if(!(item != null)) {
			break;
		}
		if(!isEmpty) {
			if(JkLangString.contains((JkLangString.toLowerCase(item.value)), (JkLangString.toLowerCase(value)))) {
				this.addItemToList(item.value);
			}
		}
		else {
			this.addItemToList(item.value);
		}
	}
	if(JkLangVector.getSize((JkWidgetWidget.getChildren(this.itemscontainer))) < 1) {
		this.addItemToList(null);
	}
};

JkWidgetCommonSelectSearchWidget.prototype.clearItems = function() {
	if(!(this.itemscontainer != null)) {
		return;
	}
	JkWidgetWidget.removeChildrenOf(this.itemscontainer);
};

JkWidgetCommonSelectSearchWidget.prototype.setWidgetItems = function(items) {
	this.widgetItems = items;
	if(!(this.widgetItems != null)) {
		return;
	}
	var it = this.widgetItems.iterate();
	while(it != null){
		var item = it.next();
		if(!(item != null)) {
			break;
		}
		this.addItemToList(item.value);
	}
};

JkWidgetCommonSelectSearchWidget.prototype.createWidgetItem = function(title) {
	var textColor = this.context.getStyleColor("SelectSearchWidget", "textColor", null);
	if(!(textColor != null)) {
		textColor = JkGfxColor.black();
	}
	var backgroundColor = this.context.getStyleColor("SelectSearchWidget", "itemBackgroundColor", null);
	if(!(backgroundColor != null)) {
		backgroundColor = JkGfxColor.white();
	}
	var padding = this.context.getStylePixels("SelectSearchWidget", "padding", null);
	if(padding < 1) {
		padding = this.context.getHeightValue("1000um");
	}
	var fontSize = this.context.getStylePixels("SelectSearchWidget", "fontSize", null);
	if(fontSize < 1) {
		fontSize = this.context.getHeightValue("2mm");
	}
	var t = title;
	if(JkLangString.isEmpty(t)) {
		t = this.defaultNoRecordMessage;
	}
	var ttitle = t;
	var lbl = JkWidgetLabelWidget.forText(this.context, ttitle);
	lbl.setWidgetTextColor(textColor);
	var layer = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	layer.addWidget((JkWidgetCanvasWidget.forColor(this.context, backgroundColor)));
	layer.addWidget((JkWidgetLayerWidget.forWidget(this.context, lbl, padding)));
	if(JkLangString.isNotEmpty(title)) {
		JkWidgetWidget.setWidgetClickHandler(layer, (function() {
			this.label.setWidgetText(ttitle);
			this.closePopup();
			this.onWidgetSelectionChanged();
		}.bind(this)));
	}
	return layer;
};

JkWidgetCommonSelectSearchWidget.prototype.onWidgetSelectionChanged = function() {
	if(this.widgetValueChangeHandler != null) {
		this.widgetValueChangeHandler();
	}
};

JkWidgetCommonSelectSearchWidget.prototype.showPopup = function() {
	if(!(this.container != null)) {
		return;
	}
	if(this.shown) {
		return;
	}
	var thisWidget = this;
	var parentLayer = null;
	var parent = JkWidgetWidget.getParent(thisWidget);
	while(parent != null){
		if(JkWidgetLayerWidget.IS_INSTANCE && JkWidgetLayerWidget.IS_INSTANCE(parent)) {
			parentLayer = parent;
		}
		parent = JkWidgetWidget.getParent(parent);
	}
	if(!(parentLayer != null)) {
		console.log("[jk.widget.common.SelectSearchWidget.showPopup] (SelectSearchWidget.sling:234:3): No LayerWidget was found in the widget tree. Cannot show suggestions dropdown!");
		return;
	}
	this.myContainer = JkWidgetCommonSelectSearchWidgetMyContainerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.myContainer.setWidget(thisWidget);
	this.myContainer.addWidget(this.container);
	parentLayer.addWidget(this.myContainer);
	var animationDestY = JkWidgetWidget.getAbsoluteY(thisWidget);
	var ay = this.context.getHeightValue("3mm");
	JkWidgetWidget.move(this.container, (JkWidgetWidget.getAbsoluteX(thisWidget)), (~(~(animationDestY + ay))));
	var anim = JkWidgetWidgetAnimation.forDuration(this.context, 300);
	anim.addCallback((function(completion1) {
		var bgf = completion1 * 1.5;
		if(bgf > 1.0) {
			bgf = 1.0;
		}
		JkWidgetWidget.move(this.container, (JkWidgetWidget.getAbsoluteX(thisWidget)), (~(~(animationDestY + ~(~((1.0 - completion1) * ay))))));
	}.bind(this)));
	anim.start();
	this.shown = true;
};

JkWidgetCommonSelectSearchWidget.prototype.closePopup = function() {
	if(!this.shown) {
		return;
	}
	var anim = JkWidgetWidgetAnimation.forDuration(this.context, 300);
	anim.addFadeOut(this.myContainer, true);
	anim.start();
	this.shown = false;
};

JkWidgetCommonSelectSearchWidget.prototype.addItemToList = function(item) {
	var v = this.createWidgetItem(item);
	if(v != null) {
		this.itemscontainer.addWidget(v);
	}
};

JkWidgetCommonSelectSearchWidget.prototype.findIndexForWidgetValue = function(value) {
	var v = -1;
	if(this.widgetItems != null) {
		var n = 0;
		var it = this.widgetItems.iterate();
		while(it != null){
			var item = it.next();
			if(!(item != null)) {
				break;
			}
			if(item.value == value) {
				v = n;
				break;
			}
			n++;
		}
	}
	return v;
};

JkWidgetCommonSelectSearchWidget.prototype.getSelectedWidgetValue = function() {
	var index = this.findIndexForWidgetValue((this.label.getWidgetText()));
	if(!(this.widgetItems != null) || index < 0) {
		return null;
	}
	return this.widgetItems.getKey(index);
};

JkWidgetCommonSelectSearchWidget.prototype.setSelectedWidgetValue = function(value) {
	this.label.setWidgetText(value);
};

JkWidgetCommonSelectSearchWidget.prototype.setWidgetValue = function(value) {
	this.setSelectedWidgetValue((JkLangString.asString(value)));
};

JkWidgetCommonSelectSearchWidget.prototype.getWidgetValue = function() {
	return this.getSelectedWidgetValue();
};

JkWidgetCommonSelectSearchWidget.prototype.setWidgetValueChangeHandler = function(handler) {
	this.widgetValueChangeHandler = handler;
};

JkWidgetCommonSelectSearchWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.background = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.background.setWidgetColor((JkGfxColor.white()));
	this.background.setWidgetOutlineWidth((this.context.getHeightValue("100um")));
	this.background.setWidgetOutlineColor((JkGfxColor.black()));
	this.addWidget(this.background);
	var widget = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget.setWidgetMarginLeft((this.context.getHeightValue("1000um")));
	var widget2 = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.label = JkWidgetLabelWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.label.setWidgetText("Select");
	widget2.addWidget1(this.label, 0.0, 0.5, false);
	widget.addWidget(widget2);
	this.addWidget(widget);
	var widget3 = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.icon = JkWidgetImageWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.icon.setWidgetImageResource("arrow_down");
	this.icon.setWidgetImageWidth((this.context.getHeightValue("7000um")));
	this.icon.setWidgetImageHeight((this.context.getHeightValue("7000um")));
	widget3.addWidget1(this.icon, 1.0, 0.5, false);
	this.addWidget(widget3);
};

JkWidgetCommonSelectSearchWidget.prototype.getDefaultNoRecordMessage = function() {
	return this.defaultNoRecordMessage;
};

JkWidgetCommonSelectSearchWidget.prototype.setDefaultNoRecordMessage = function(v) {
	this.defaultNoRecordMessage = v;
	return this;
};

JkWidgetCommonSelectSearchWidget.prototype.getWidgetOutlineColor = function() {
	return this.widgetOutlineColor;
};

JkWidgetCommonSelectSearchWidget.prototype.setWidgetOutlineColor = function(v) {
	this.widgetOutlineColor = v;
	return this;
};

JkWidgetCommonSelectSearchWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonSelectSearchWidget"] === true;
};

let JkWidgetCommonCustomScrollBarWidget = function() {
	JkWidgetRenderableWidget.call(this);
	this.widgetOnScrollCallback = null;
	this.widgetMaximumValueY = 1000.0;
	this.widgetVisibleHeight = 40.0;
	this.widgetScrollableHeight = 100.0;
	this.widgetSpeedY = 0.5;
	this.valueY = 0.0;
	this.scrollBarY = 0.0;
	this.scrollBarHeight = 0.0;
};

JkWidgetCommonCustomScrollBarWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetRenderableWidget.prototype);
JkWidgetCommonCustomScrollBarWidget.prototype.constructor = JkWidgetCommonCustomScrollBarWidget;
JkWidgetCommonCustomScrollBarWidget.prototype._t = {
	"JkWidgetResizeAwareWidget" : true,
	"JkWidgetRenderableWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCommonCustomScrollBarWidget" : true,
	"JkWidgetParentAwareWidget" : true
};
JkWidgetCommonCustomScrollBarWidget.prototype._tobj = JkWidgetCommonCustomScrollBarWidget;

JkWidgetCommonCustomScrollBarWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonCustomScrollBarWidget;
	return v.CTOR_JkWidgetCommonCustomScrollBarWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonCustomScrollBarWidget.prototype.CTOR_JkWidgetCommonCustomScrollBarWidget_JkUiGuiApplicationContext = function(context) {
	this.scrollBarHeight = 0.0;
	this.scrollBarY = 0.0;
	this.valueY = 0.0;
	this.widgetSpeedY = 0.5;
	this.widgetScrollableHeight = 100.0;
	this.widgetVisibleHeight = 40.0;
	this.widgetMaximumValueY = 1000.0;
	this.widgetOnScrollCallback = null;
	if(JkWidgetRenderableWidget.prototype.CTOR_JkWidgetRenderableWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonCustomScrollBarWidget.prototype.onWidgetResized = function() {
	this.computeScrollBarLayout();
	JkWidgetRenderableWidget.prototype.onWidgetResized.call(this);
};

JkWidgetCommonCustomScrollBarWidget.prototype.render = function(ctx) {
	ctx.clearRect(0, 0, (JkWidgetWidget.getWidth(this)), (JkWidgetWidget.getHeight(this)));
	ctx.setFillStyle((JkGfxColor.forString("red")));
	ctx.fillRect(0, this.scrollBarY, (JkWidgetWidget.getWidth(this)), this.scrollBarHeight);
	this.valueY = this.scrollBarY / (JkWidgetWidget.getHeight(this) - ~(~this.scrollBarHeight)) * this.widgetMaximumValueY;
};

JkWidgetCommonCustomScrollBarWidget.prototype.computeScrollBarLayout = function() {
	this.scrollBarHeight = this.widgetVisibleHeight / this.widgetScrollableHeight * JkWidgetWidget.getHeight(this);
	this.scrollBarY = this.valueY / this.widgetMaximumValueY * (JkWidgetWidget.getHeight(this) - ~(~this.scrollBarHeight));
};

JkWidgetCommonCustomScrollBarWidget.prototype.prepareElement = function(element) {
	JkWidgetRenderableWidget.prototype.prepareElement.call(this, element);
	JkUiHTMLDOM.addEventListenerWithParameterInCallback(element, "wheel", (function(e1) {
		this.onWheel(e1);
	}.bind(this)));
};

JkWidgetCommonCustomScrollBarWidget.prototype.onWheel = function(e) {
	var h = JkWidgetWidget.getHeight(this);
	var newY = this.scrollBarY - this.widgetSpeedY * e.wheelDeltaY;
	if(newY > h - ~(~this.scrollBarHeight)) {
		newY = h - ~(~this.scrollBarHeight);
	}
	else if(newY < 0) {
		newY = 0;
	}
	if(this.scrollBarY != newY) {
		this.scrollBarY = newY;
		this.redraw();
		this.onScroll(0, this.scrollBarY);
	}
};

JkWidgetCommonCustomScrollBarWidget.prototype.onScroll = function(scrollX, scrollY) {
	if(this.widgetOnScrollCallback != null) {
		this.widgetOnScrollCallback(scrollX, scrollY);
	}
};

JkWidgetCommonCustomScrollBarWidget.prototype.getWidgetOnScrollCallback = function() {
	return this.widgetOnScrollCallback;
};

JkWidgetCommonCustomScrollBarWidget.prototype.setWidgetOnScrollCallback = function(v) {
	this.widgetOnScrollCallback = v;
	return this;
};

JkWidgetCommonCustomScrollBarWidget.prototype.getWidgetMaximumValueY = function() {
	return this.widgetMaximumValueY;
};

JkWidgetCommonCustomScrollBarWidget.prototype.setWidgetMaximumValueY = function(v) {
	this.widgetMaximumValueY = v;
	return this;
};

JkWidgetCommonCustomScrollBarWidget.prototype.getWidgetVisibleHeight = function() {
	return this.widgetVisibleHeight;
};

JkWidgetCommonCustomScrollBarWidget.prototype.setWidgetVisibleHeight = function(v) {
	this.widgetVisibleHeight = v;
	return this;
};

JkWidgetCommonCustomScrollBarWidget.prototype.getWidgetScrollableHeight = function() {
	return this.widgetScrollableHeight;
};

JkWidgetCommonCustomScrollBarWidget.prototype.setWidgetScrollableHeight = function(v) {
	this.widgetScrollableHeight = v;
	return this;
};

JkWidgetCommonCustomScrollBarWidget.prototype.getWidgetSpeedY = function() {
	return this.widgetSpeedY;
};

JkWidgetCommonCustomScrollBarWidget.prototype.setWidgetSpeedY = function(v) {
	this.widgetSpeedY = v;
	return this;
};

JkWidgetCommonCustomScrollBarWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonCustomScrollBarWidget"] === true;
};

let JkWidgetCommonToolbarWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.defaultActionItemWidgetBackgroundColor = null;
	this.defaultActionItemWidgetTextColor = null;
	this.widgetBackgroundColor = null;
	this.widgetItems = null;
	this.overlayWidget = null;
};

JkWidgetCommonToolbarWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonToolbarWidget.prototype.constructor = JkWidgetCommonToolbarWidget;
JkWidgetCommonToolbarWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetCommonToolbarWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCommonToolbarWidget.prototype._tobj = JkWidgetCommonToolbarWidget;

JkWidgetCommonToolbarWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCommonToolbarWidget;
	return v.CTOR_JkWidgetCommonToolbarWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCommonToolbarWidget.prototype.CTOR_JkWidgetCommonToolbarWidget_JkUiGuiApplicationContext = function(context) {
	this.overlayWidget = null;
	this.widgetItems = null;
	this.widgetBackgroundColor = null;
	this.defaultActionItemWidgetTextColor = null;
	this.defaultActionItemWidgetBackgroundColor = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCommonToolbarWidget.forItems = function(ctx, items, color) {
	var v = JkWidgetCommonToolbarWidget.NEW_JkUiGuiApplicationContext(ctx);
	v.setWidgetItems(items);
	v.setWidgetBackgroundColor(color);
	return v;
};

JkWidgetCommonToolbarWidget.prototype.addToWidgetItems = function(widget) {
	if(!(widget != null)) {
		return;
	}
	if(!(this.widgetItems != null)) {
		this.widgetItems = new Array;
	}
	this.widgetItems.push(widget);
};

JkWidgetCommonToolbarWidget.prototype.determineBackgroundColor = function() {
	var wc = this.widgetBackgroundColor;
	if(!(wc != null)) {
		wc = JkGfxColor.white();
	}
	return wc;
};

JkWidgetCommonToolbarWidget.prototype.determineTextColor = function(backgroundColor, textColor, defaultTextColor) {
	var tc = textColor;
	if(!(tc != null)) {
		tc = defaultTextColor;
	}
	if(!(tc != null)) {
		var cc = this.determineBackgroundColor();
		if(cc.isDarkColor()) {
			tc = JkGfxColor.white();
		}
		else {
			tc = JkGfxColor.black();
		}
	}
	return tc;
};

JkWidgetCommonToolbarWidget.prototype.addActionItem = function(text, resName, handler, textColor) {
	var iconWidget = JkWidgetImageWidget.forImageResource(this.context, resName);
	iconWidget.setWidgetImageScaleMethod(JkWidgetImageWidget.FIT);
	iconWidget.setWidgetImageHeight((this.context.getHeightValue("5mm")));
	iconWidget.setWidgetImageWidth((this.context.getWidthValue("5mm")));
	var tc = this.determineTextColor(this.widgetBackgroundColor, textColor, this.defaultActionItemWidgetTextColor);
	var mm2 = this.context.getHeightValue("2mm");
	var lbl = JkWidgetLabelWidget.forText(this.context, text);
	lbl.setWidgetFontSize(mm2);
	lbl.setWidgetTextColor(tc);
	var vbox = JkWidgetVerticalBoxWidget.forContext(this.context, 0, (this.context.getHeightValue("1mm")));
	vbox.addWidget((JkWidgetAlignWidget.forWidget(this.context, iconWidget, 0.5, 0.5, 0)));
	vbox.addWidget((JkWidgetAlignWidget.forWidget(this.context, lbl, 0.5, 0.5, 0)));
	if(handler != null) {
		JkWidgetWidget.setWidgetClickHandler(vbox, handler);
	}
	this.addToWidgetItems(vbox);
	return this;
};

JkWidgetCommonToolbarWidget.prototype.addOverlay = function(widget) {
	this.overlayWidget.addWidget(widget);
};

JkWidgetCommonToolbarWidget.prototype.removeOverlay = function() {
	if(!(this.overlayWidget != null)) {
		return false;
	}
	JkWidgetWidget.removeChildrenOf(this.overlayWidget);
	return true;
};

JkWidgetCommonToolbarWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	this.overlayWidget = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	var bgc = this.widgetBackgroundColor;
	if(!(bgc != null)) {
		bgc = this.defaultActionItemWidgetBackgroundColor;
	}
	if(bgc != null) {
		this.addWidget((JkWidgetCanvasWidget.forColor(this.context, bgc)));
	}
	var hbox = JkWidgetHorizontalBoxWidget.forContext(this.context, 0, 0);
	if(this.widgetItems != null) {
		var n = 0;
		var m = this.widgetItems.length;
		for(n = 0 ; n < m ; n++) {
			var w = this.widgetItems[n];
			if(w != null) {
				hbox.addWidget1((JkWidgetAlignWidget.forWidget(this.context, w, 0.5, 0.5, 0)), 1.0);
			}
		}
	}
	this.addWidget((JkWidgetLayerWidget.forWidget(this.context, hbox, (this.context.getHeightValue("1mm")))));
	this.addWidget(this.overlayWidget);
};

JkWidgetCommonToolbarWidget.prototype.getDefaultActionItemWidgetBackgroundColor = function() {
	return this.defaultActionItemWidgetBackgroundColor;
};

JkWidgetCommonToolbarWidget.prototype.setDefaultActionItemWidgetBackgroundColor = function(v) {
	this.defaultActionItemWidgetBackgroundColor = v;
	return this;
};

JkWidgetCommonToolbarWidget.prototype.getDefaultActionItemWidgetTextColor = function() {
	return this.defaultActionItemWidgetTextColor;
};

JkWidgetCommonToolbarWidget.prototype.setDefaultActionItemWidgetTextColor = function(v) {
	this.defaultActionItemWidgetTextColor = v;
	return this;
};

JkWidgetCommonToolbarWidget.prototype.getWidgetBackgroundColor = function() {
	return this.widgetBackgroundColor;
};

JkWidgetCommonToolbarWidget.prototype.setWidgetBackgroundColor = function(v) {
	this.widgetBackgroundColor = v;
	return this;
};

JkWidgetCommonToolbarWidget.prototype.getWidgetItems = function() {
	return this.widgetItems;
};

JkWidgetCommonToolbarWidget.prototype.setWidgetItems = function(v) {
	this.widgetItems = v;
	return this;
};

JkWidgetCommonToolbarWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonToolbarWidget"] === true;
};

let JkWidgetCommonPopupDialogManager = function() {
	this.context = null;
	this.parent = null;
	this.backgroundColor = null;
	this.headerBackgroundColor = null;
	this.headerTextColor = null;
	this.messageTextColor = null;
	this.positiveButtonColor = null;
	this.negativeButtonColor = null;
};

JkWidgetCommonPopupDialogManager.prototype._t = { "JkWidgetCommonPopupDialogManager" : true };
JkWidgetCommonPopupDialogManager.prototype._tobj = JkWidgetCommonPopupDialogManager;

JkWidgetCommonPopupDialogManager.NEW_JkUiGuiApplicationContextJkWidgetWidget = function(context, parent) {
	var v = new JkWidgetCommonPopupDialogManager;
	return v.CTOR_JkWidgetCommonPopupDialogManager_JkUiGuiApplicationContextJkWidgetWidget(context, parent);
};

JkWidgetCommonPopupDialogManager.prototype.CTOR_JkWidgetCommonPopupDialogManager_JkUiGuiApplicationContextJkWidgetWidget = function(context, parent) {
	this.negativeButtonColor = null;
	this.positiveButtonColor = null;
	this.messageTextColor = null;
	this.headerTextColor = null;
	this.headerBackgroundColor = null;
	this.backgroundColor = null;
	this.parent = null;
	this.context = null;
	this.context = context;
	this.parent = parent;
	this.positiveButtonColor = JkGfxColor.forRGB(0x80, 0xcc, 0x80);
	this.negativeButtonColor = JkGfxColor.forRGB(0xcc, 0x80, 0x80);
	this.backgroundColor = null;
	this.headerBackgroundColor = null;
	this.headerTextColor = null;
	this.messageTextColor = null;
	return this;
};

JkWidgetCommonPopupDialogManager.prototype.setButtonColor = function(color) {
	this.positiveButtonColor = color;
	this.negativeButtonColor = color;
	return this;
};

JkWidgetCommonPopupDialogManager.prototype.showTextInputDialog = function(title, prompt, callback) {
	this.checkForDefaultColors();
	var mm2 = this.context.getWidthValue("2mm");
	var mm3 = this.context.getWidthValue("3mm");
	var widget = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget.setWidgetWidthRequest((this.context.getWidthValue("100mm")));
	widget.addWidget((JkWidgetCanvasWidget.forColor(this.context, this.backgroundColor)));
	var titleLabel = JkWidgetLabelWidget.forText(this.context, title);
	titleLabel.setWidgetFontSize(mm3);
	titleLabel.setWidgetTextColor(this.headerTextColor);
	titleLabel.setWidgetFontBold(true);
	var box = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	box.addWidget((JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context).addWidget((JkWidgetCanvasWidget.forColor(this.context, this.headerBackgroundColor))).addWidget((JkWidgetAlignWidget.forWidget(this.context, titleLabel, 0, 0.5, 0).setWidgetMargin(mm3)))));
	var sbox = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	sbox.setWidgetMargin(mm3);
	sbox.setWidgetSpacing(mm3);
	var messageLabel = JkWidgetLabelWidget.forText(this.context, prompt);
	messageLabel.setWidgetTextAlign(JkWidgetLabelWidget.ALIGN_CENTER);
	messageLabel.setWidgetFontSize(mm3);
	messageLabel.setWidgetTextColor(this.messageTextColor);
	sbox.addWidget(messageLabel);
	var input = JkWidgetCommonTextInputWidget.NEW_JkUiGuiApplicationContext(this.context);
	input.setWidgetBackgroundColor((JkGfxColor.forRGB(200, 200, 200)));
	input.setWidgetPadding1((this.context.getHeightValue("2mm")));
	input.setWidgetFontSize((this.context.getHeightValue("3000um")));
	sbox.addWidget(input);
	var buttons = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	buttons.setWidgetSpacing(mm3);
	var padding = this.context.getHeightValue("2000um");
	var noButton = JkWidgetCommonTextButtonWidget.forText(this.context, "Cancel", null);
	noButton.setWidgetBackgroundColor(this.negativeButtonColor);
	noButton.setWidgetPadding(padding);
	buttons.addWidget1(noButton, 1.0);
	var yesButton = JkWidgetCommonTextButtonWidget.forText(this.context, "OK", null);
	yesButton.setWidgetBackgroundColor(this.positiveButtonColor);
	yesButton.setWidgetPadding(padding);
	buttons.addWidget1(yesButton, 1.0);
	sbox.addWidget(buttons);
	box.addWidget(sbox);
	widget.addWidget(box);
	var pp = JkWidgetCommonPopupWidget.forContentWidget(this.context, (JkWidgetLayerWidget.forWidget(this.context, widget, mm2)));
	var cb = callback;
	pp.showPopup(this.parent);
	yesButton.setWidgetClickHandler((function() {
		pp.hidePopup();
		if(cb != null) {
			cb((input.getWidgetText()));
		}
	}.bind(this)));
	noButton.setWidgetClickHandler((function() {
		pp.hidePopup();
		if(cb != null) {
			cb(null);
		}
	}.bind(this)));
};

JkWidgetCommonPopupDialogManager.prototype.showMessageDialog = function(title, message, callback) {
	this.checkForDefaultColors();
	var mm2 = this.context.getWidthValue("2mm");
	var mm3 = this.context.getWidthValue("3mm");
	var widget = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget.setWidgetWidthRequest((this.context.getWidthValue("100mm")));
	widget.addWidget((JkWidgetCanvasWidget.forColor(this.context, (JkGfxColor.white()))));
	var titleLabel = JkWidgetLabelWidget.forText(this.context, title);
	titleLabel.setWidgetFontSize(mm3);
	titleLabel.setWidgetTextColor(this.headerTextColor);
	titleLabel.setWidgetFontBold(true);
	var box = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	box.addWidget((JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context).addWidget((JkWidgetCanvasWidget.forColor(this.context, this.headerBackgroundColor))).addWidget((JkWidgetAlignWidget.forWidget(this.context, titleLabel, 0, 0.5, 0).setWidgetMargin(mm3)))));
	var sbox = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	sbox.setWidgetMargin(mm3);
	sbox.setWidgetSpacing(mm3);
	var messageLabel = JkWidgetLabelWidget.forText(this.context, message);
	messageLabel.setWidgetTextAlign(JkWidgetLabelWidget.ALIGN_CENTER);
	messageLabel.setWidgetFontSize(mm3);
	messageLabel.setWidgetTextColor(this.messageTextColor);
	sbox.addWidget(messageLabel);
	var buttons = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	buttons.setWidgetSpacing(mm3);
	var okButton = JkWidgetCommonTextButtonWidget.forText(this.context, "OK", null);
	okButton.setWidgetBackgroundColor(this.positiveButtonColor);
	okButton.setWidgetPadding((this.context.getHeightValue("2000um")));
	buttons.addWidget1(okButton, 1.0);
	sbox.addWidget(buttons);
	box.addWidget(sbox);
	widget.addWidget(box);
	var pp = JkWidgetCommonPopupWidget.forContentWidget(this.context, (JkWidgetLayerWidget.forWidget(this.context, widget, mm2)));
	var cb = callback;
	pp.showPopup(this.parent);
	okButton.setWidgetClickHandler((function() {
		pp.hidePopup();
		if(cb != null) {
			cb();
		}
	}.bind(this)));
};

JkWidgetCommonPopupDialogManager.prototype.showConfirmDialog = function(title, message, okcallback, cancelcallback) {
	this.checkForDefaultColors();
	var mm2 = this.context.getWidthValue("2mm");
	var mm3 = this.context.getWidthValue("3mm");
	var widget = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget.setWidgetWidthRequest((this.context.getWidthValue("100mm")));
	widget.addWidget((JkWidgetCanvasWidget.forColor(this.context, (JkGfxColor.white()))));
	var titleLabel = JkWidgetLabelWidget.forText(this.context, title);
	titleLabel.setWidgetFontSize(mm3);
	titleLabel.setWidgetTextColor(this.headerTextColor);
	titleLabel.setWidgetFontBold(true);
	var box = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	box.addWidget((JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context).addWidget((JkWidgetCanvasWidget.forColor(this.context, this.headerBackgroundColor))).addWidget((JkWidgetAlignWidget.forWidget(this.context, titleLabel, 0, 0.5, 0).setWidgetMargin(mm3)))));
	var sbox = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	sbox.setWidgetMargin(mm3);
	sbox.setWidgetSpacing(mm3);
	var messageLabel = JkWidgetLabelWidget.forText(this.context, message);
	messageLabel.setWidgetTextAlign(JkWidgetLabelWidget.ALIGN_CENTER);
	messageLabel.setWidgetFontSize(mm3);
	messageLabel.setWidgetTextColor(this.messageTextColor);
	sbox.addWidget(messageLabel);
	var buttons = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	buttons.setWidgetSpacing(mm3);
	var padding = this.context.getHeightValue("2000um");
	var noButton = JkWidgetCommonTextButtonWidget.forText(this.context, "NO", null);
	noButton.setWidgetBackgroundColor(this.negativeButtonColor);
	noButton.setWidgetPadding(padding);
	buttons.addWidget1(noButton, 1.0);
	var yesButton = JkWidgetCommonTextButtonWidget.forText(this.context, "YES", null);
	yesButton.setWidgetBackgroundColor(this.positiveButtonColor);
	yesButton.setWidgetPadding(padding);
	buttons.addWidget1(yesButton, 1.0);
	sbox.addWidget(buttons);
	box.addWidget(sbox);
	widget.addWidget(box);
	var pp = JkWidgetCommonPopupWidget.forContentWidget(this.context, (JkWidgetLayerWidget.forWidget(this.context, widget, mm2)));
	var okcb = okcallback;
	var cancelcb = cancelcallback;
	pp.showPopup(this.parent);
	yesButton.setWidgetClickHandler((function() {
		pp.hidePopup();
		if(okcb != null) {
			okcb();
		}
	}.bind(this)));
	noButton.setWidgetClickHandler((function() {
		pp.hidePopup();
		if(cancelcb != null) {
			cancelcb();
		}
	}.bind(this)));
};

JkWidgetCommonPopupDialogManager.prototype.showErrorDialog = function(message, callback) {
	this.showMessageDialog("Error", message, callback);
};

JkWidgetCommonPopupDialogManager.prototype.checkForDefaultColors = function() {
	var bgc = this.backgroundColor;
	if(bgc == null) {
		this.backgroundColor = JkGfxColor.white();
	}
	var hbg = this.headerBackgroundColor;
	if(hbg == null) {
		this.headerBackgroundColor = JkGfxColor.black();
	}
	var htc = this.headerTextColor;
	if(htc == null) {
		if(this.headerBackgroundColor.isDarkColor()) {
			this.headerTextColor = JkGfxColor.white();
		}
		else {
			this.headerTextColor = JkGfxColor.black();
		}
	}
	var mtc = this.messageTextColor;
	if(mtc == null) {
		if(this.backgroundColor.isDarkColor()) {
			this.messageTextColor = JkGfxColor.white();
		}
		else {
			this.messageTextColor = JkGfxColor.black();
		}
	}
};

JkWidgetCommonPopupDialogManager.prototype.getContext = function() {
	return this.context;
};

JkWidgetCommonPopupDialogManager.prototype.setContext = function(v) {
	this.context = v;
	return this;
};

JkWidgetCommonPopupDialogManager.prototype.getParent = function() {
	return this.parent;
};

JkWidgetCommonPopupDialogManager.prototype.setParent = function(v) {
	this.parent = v;
	return this;
};

JkWidgetCommonPopupDialogManager.prototype.getBackgroundColor = function() {
	return this.backgroundColor;
};

JkWidgetCommonPopupDialogManager.prototype.setBackgroundColor = function(v) {
	this.backgroundColor = v;
	return this;
};

JkWidgetCommonPopupDialogManager.prototype.getHeaderBackgroundColor = function() {
	return this.headerBackgroundColor;
};

JkWidgetCommonPopupDialogManager.prototype.setHeaderBackgroundColor = function(v) {
	this.headerBackgroundColor = v;
	return this;
};

JkWidgetCommonPopupDialogManager.prototype.getHeaderTextColor = function() {
	return this.headerTextColor;
};

JkWidgetCommonPopupDialogManager.prototype.setHeaderTextColor = function(v) {
	this.headerTextColor = v;
	return this;
};

JkWidgetCommonPopupDialogManager.prototype.getMessageTextColor = function() {
	return this.messageTextColor;
};

JkWidgetCommonPopupDialogManager.prototype.setMessageTextColor = function(v) {
	this.messageTextColor = v;
	return this;
};

JkWidgetCommonPopupDialogManager.prototype.getPositiveButtonColor = function() {
	return this.positiveButtonColor;
};

JkWidgetCommonPopupDialogManager.prototype.setPositiveButtonColor = function(v) {
	this.positiveButtonColor = v;
	return this;
};

JkWidgetCommonPopupDialogManager.prototype.getNegativeButtonColor = function() {
	return this.negativeButtonColor;
};

JkWidgetCommonPopupDialogManager.prototype.setNegativeButtonColor = function(v) {
	this.negativeButtonColor = v;
	return this;
};

JkWidgetCommonPopupDialogManager.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonPopupDialogManager"] === true;
};

let JkWidgetCommonRoundedImageWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetScaleSize = 0;
	this.imageWidget = null;
};

JkWidgetCommonRoundedImageWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCommonRoundedImageWidget.prototype.constructor = JkWidgetCommonRoundedImageWidget;
JkWidgetCommonRoundedImageWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetCommonRoundedImageWidget" : true
};
JkWidgetCommonRoundedImageWidget.prototype._tobj = JkWidgetCommonRoundedImageWidget;

JkWidgetCommonRoundedImageWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCommonRoundedImageWidget;
	return v.CTOR_JkWidgetCommonRoundedImageWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCommonRoundedImageWidget.prototype.CTOR_JkWidgetCommonRoundedImageWidget_JkUiGuiApplicationContext = function(ctx) {
	this.imageWidget = null;
	this.widgetScaleSize = 0;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.forceCreateWidget();
	return this;
};

JkWidgetCommonRoundedImageWidget.prototype.setWidgetSize = function(sz) {
	this.setWidgetHeightRequest(sz);
	this.setWidgetWidthRequest(sz);
	return this;
};

JkWidgetCommonRoundedImageWidget.prototype.setWidgetImageResource = function(src) {
	var image = JkUiImageUtil.createCircularImageSync((this.context.getResourceImage(src)));
	this.imageWidget.setWidgetImage(image);
	return this;
};

JkWidgetCommonRoundedImageWidget.prototype.setWidgetImage = function(image) {
	var img = JkUiImageUtil.createCircularImageSync(image);
	this.imageWidget.setWidgetImage(img);
	return this;
};

JkWidgetCommonRoundedImageWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.imageWidget = JkWidgetImageWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.imageWidget.setWidgetImageScaleMethod(JkWidgetImageWidget.FILL);
	this.addWidget(this.imageWidget);
};

JkWidgetCommonRoundedImageWidget.prototype.getWidgetScaleSize = function() {
	return this.widgetScaleSize;
};

JkWidgetCommonRoundedImageWidget.prototype.setWidgetScaleSize = function(v) {
	this.widgetScaleSize = v;
	return this;
};

JkWidgetCommonRoundedImageWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCommonRoundedImageWidget"] === true;
};
