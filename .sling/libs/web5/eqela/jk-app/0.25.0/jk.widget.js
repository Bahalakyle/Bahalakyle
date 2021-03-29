let JkWidgetWidgetWithValue = {};

JkWidgetWidgetWithValue.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetWidgetWithValue"] === true;
};

let JkWidgetDisplayAwareWidget = {};

JkWidgetDisplayAwareWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetDisplayAwareWidget"] === true;
};

let JkWidgetVerticalBoxWidgetMyChildEntry = function() {
	this.widget = null;
	this.weight = 0.0;
};

JkWidgetVerticalBoxWidgetMyChildEntry.prototype._t = { "JkWidgetVerticalBoxWidgetMyChildEntry" : true };
JkWidgetVerticalBoxWidgetMyChildEntry.prototype._tobj = JkWidgetVerticalBoxWidgetMyChildEntry;

JkWidgetVerticalBoxWidgetMyChildEntry.NEW = function() {
	var v = new JkWidgetVerticalBoxWidgetMyChildEntry;
	return v.CTOR_JkWidgetVerticalBoxWidgetMyChildEntry();
};

JkWidgetVerticalBoxWidgetMyChildEntry.prototype.CTOR_JkWidgetVerticalBoxWidgetMyChildEntry = function() {
	this.weight = 0.0;
	this.widget = null;
	return this;
};

JkWidgetVerticalBoxWidgetMyChildEntry.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetVerticalBoxWidgetMyChildEntry"] === true;
};

let JkWidgetParentAwareWidget = {};

JkWidgetParentAwareWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetParentAwareWidget"] === true;
};

let JkWidgetWidget = function() {
	this.element = null;
	this.cachedWidth = 0;
	this.cachedHeight = 0;
};

JkWidgetWidget.prototype._t = { "JkWidgetWidget" : true };
JkWidgetWidget.prototype._tobj = JkWidgetWidget;

JkWidgetWidget.NEW = function() {
	var v = new JkWidgetWidget;
	return v.CTOR_JkWidgetWidget();
};

JkWidgetWidget.prototype.CTOR_JkWidgetWidget = function() {
	this.cachedHeight = 0;
	this.cachedWidth = 0;
	this.element = null;
	this.element = this.createElement();
	this.element.widgetObject = this;
	;
	this.prepareElement(this.element);
	return this;
};

JkWidgetWidget.prototype.createElement = function() {
	return JkUiHTMLDOM.createElement("div");
};

JkWidgetWidget.prototype.prepareElement = function(element) {
	JkUiHTMLDOM.setStyle(element, "pointer-events", "auto");
	JkUiHTMLDOM.setStyle(element, "position", "absolute");
	JkUiHTMLDOM.setStyle(element, "overflow", "hidden");
};

JkWidgetWidget.onWidgetAddedToParent = function(widget) {
	if(!(widget != null)) {
		return;
	}
	if(JkWidgetParentAwareWidget.IS_INSTANCE && JkWidgetParentAwareWidget.IS_INSTANCE(widget)) {
		widget.onWidgetAddedToParent();
	}
};

JkWidgetWidget.onWidgetRemovedFromParent = function(widget) {
	if(!(widget != null)) {
		return;
	}
	if(JkWidgetParentAwareWidget.IS_INSTANCE && JkWidgetParentAwareWidget.IS_INSTANCE(widget)) {
		widget.onWidgetRemovedFromParent();
	}
};

JkWidgetWidget.notifyOnStartScreen = function(widget, screen) {
	var array = JkWidgetWidget.getChildren(widget);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.notifyOnStartScreen(child, screen);
			}
		}
	}
	if(JkWidgetScreenStartStopAwareWidget.IS_INSTANCE && JkWidgetScreenStartStopAwareWidget.IS_INSTANCE(widget)) {
		widget.onStartScreen(screen);
	}
};

JkWidgetWidget.notifyOnStopScreen = function(widget, screen) {
	var array = JkWidgetWidget.getChildren(widget);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.notifyOnStopScreen(child, screen);
			}
		}
	}
	if(JkWidgetScreenStartStopAwareWidget.IS_INSTANCE && JkWidgetScreenStartStopAwareWidget.IS_INSTANCE(widget)) {
		widget.onStopScreen(screen);
	}
};

JkWidgetWidget.notifyOnAddedToScreen = function(widget, screen) {
	var array = JkWidgetWidget.getChildren(widget);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.notifyOnAddedToScreen(child, screen);
			}
		}
	}
	if(JkWidgetScreenAwareWidget.IS_INSTANCE && JkWidgetScreenAwareWidget.IS_INSTANCE(widget)) {
		widget.onWidgetAddedToScreen(screen);
	}
};

JkWidgetWidget.notifyOnRemovedFromScreen = function(widget, screen) {
	if(JkWidgetScreenAwareWidget.IS_INSTANCE && JkWidgetScreenAwareWidget.IS_INSTANCE(widget)) {
		widget.onWidgetRemovedFromScreen(screen);
	}
	var array = JkWidgetWidget.getChildren(widget);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.notifyOnRemovedFromScreen(child, screen);
			}
		}
	}
};

JkWidgetWidget.addChild = function(parent, child) {
	if(!(parent != null)) {
		return;
	}
	if(!(child != null)) {
		return;
	}
	if(JkWidgetParentAwareWidget.IS_INSTANCE && JkWidgetParentAwareWidget.IS_INSTANCE(child)) {
		child.onWidgetAddingToParent();
	}
	JkUiHTMLDOM.appendChild(parent.element, child.element);
	var pp = (function(o) {
		if(JkWidgetContainerWidget.IS_INSTANCE && JkWidgetContainerWidget.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(parent);
	if(pp != null) {
		pp.onChildWidgetAdded(child);
	}
	JkWidgetWidget.onWidgetAddedToParent(child);
	var screen = JkWidgetScreenForWidget.findScreenForWidget(child);
	if(screen != null) {
		JkWidgetWidget.notifyOnAddedToScreen(child, screen);
	}
};

JkWidgetWidget.removeFromParent = function(child) {
	if(!(child != null)) {
		return null;
	}
	var parentWidget = JkWidgetWidget.getParent(child);
	if(!(parentWidget != null)) {
		return null;
	}
	var pp = (function(o) {
		if(JkWidgetContainerWidget.IS_INSTANCE && JkWidgetContainerWidget.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(parentWidget);
	JkUiHTMLDOM.remove(child.element);
	if(pp != null) {
		var v = new Array;
		v.push(child);
		pp.onChildWidgetsRemoved(v);
	}
	var screen = JkWidgetScreenForWidget.findScreenForWidget(parentWidget);
	if(screen != null) {
		JkWidgetWidget.notifyOnRemovedFromScreen(child, screen);
	}
	JkWidgetWidget.onWidgetRemovedFromParent(child);
	return null;
};

JkWidgetWidget.domElementAsWidget = function(element) {
	var v = null;
	v = element.widgetObject;
	;
	if((JkWidgetWidget.IS_INSTANCE && JkWidgetWidget.IS_INSTANCE(v)) == false) {
		v = null;
	}
	return v;
};

JkWidgetWidget.hasParent = function(widget) {
	if(!(JkWidgetWidget.getParent(widget) != null)) {
		return false;
	}
	return true;
};

JkWidgetWidget.getParent = function(widget) {
	if(!(widget != null)) {
		return null;
	}
	var pe = JkUiHTMLDOM.getParentElement(widget.element);
	if(!(pe != null)) {
		return null;
	}
	return JkWidgetWidget.domElementAsWidget(pe);
};

JkWidgetWidget.getChildren = function(widget) {
	if(!(widget != null)) {
		return null;
	}
	var v = new Array;
	var dome = widget.element;
	var ll = dome.childNodes.length;
	for(var n = 0 ; n < ll ; n++) {
		v.push(JkWidgetWidget.domElementAsWidget(dome.childNodes[n]));
	}
	return v;
};

JkWidgetWidget.getX = function(widget) {
	if(!(widget != null)) {
		return 0;
	}
	var v = 0;
	v = widget.element.offsetLeft;
	;
	return v;
};

JkWidgetWidget.getY = function(widget) {
	if(!(widget != null)) {
		return 0;
	}
	var v = 0;
	v = widget.element.offsetTop;
	;
	return v;
};

JkWidgetWidget.getAbsoluteX = function(widget) {
	if(!(widget != null)) {
		return 0;
	}
	var v = 0;
	v = widget.element.getBoundingClientRect().left;
	;
	return v;
};

JkWidgetWidget.getAbsoluteY = function(widget) {
	if(!(widget != null)) {
		return 0;
	}
	var v = 0;
	v = widget.element.getBoundingClientRect().bottom;
	;
	return v;
};

JkWidgetWidget.getWidth = function(widget) {
	if(!(widget != null)) {
		return 0;
	}
	var v = 0;
	if(JkWidgetWidget.isRootWidget(widget)) {
		v = widget.element.getBoundingClientRect().width;
		;
	}
	else {
		v = widget.cachedWidth;
	}
	return v;
};

JkWidgetWidget.getHeight = function(widget) {
	if(!(widget != null)) {
		return 0;
	}
	var v = 0;
	if(JkWidgetWidget.isRootWidget(widget)) {
		v = widget.element.getBoundingClientRect().height;
		;
	}
	else {
		v = widget.cachedHeight;
	}
	return v;
};

JkWidgetWidget.getGeometryString = function(widget) {
	if(!(widget != null)) {
		return "null,null,null,null";
	}
	return (JkLangString.safeString((JkLangString.forInteger((JkWidgetWidget.getX(widget)))))) + (",") + (JkLangString.safeString((JkLangString.forInteger((JkWidgetWidget.getY(widget)))))) + (",") + (JkLangString.safeString((JkLangString.forInteger((JkWidgetWidget.getWidth(widget)))))) + (",") + (JkLangString.safeString((JkLangString.forInteger((JkWidgetWidget.getHeight(widget))))));
};

JkWidgetWidget.move = function(widget, x, y) {
	widget.element.style.left = (~~x) + "px";
	widget.element.style.top = (~~y) + "px";
	;
};

JkWidgetWidget.isRootWidget = function(widget) {
	var cw = (function(o) {
		if(JkWidgetContainerWidget.IS_INSTANCE && JkWidgetContainerWidget.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(widget);
	if(!(cw != null)) {
		return false;
	}
	var pp = JkWidgetWidget.getParent(cw);
	if(!(pp != null)) {
		return true;
	}
	if(JkWidgetWidgetWithLayout.IS_INSTANCE && JkWidgetWidgetWithLayout.IS_INSTANCE(pp)) {
		return false;
	}
	return true;
};

JkWidgetWidget.findScreen = function(widget) {
	var pp = widget.element;
	while(pp != null){
		var v = null;
		if(pp.screenObject) {
			v = pp.screenObject
		}
		;
		if(v != null) {
			return (function(o) {
				if(JkUiScreen.IS_INSTANCE && JkUiScreen.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))(v);
		}
		pp = JkUiHTMLDOM.getParentElement(pp);
	}
	return null;
};

JkWidgetWidget.findRootWidget = function(widget) {
	var v = widget;
	while(true){
		if(!(v != null)) {
			break;
		}
		if(JkWidgetWidget.isRootWidget(v)) {
			return (function(o) {
				if(JkWidgetContainerWidget.IS_INSTANCE && JkWidgetContainerWidget.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))(v);
		}
		v = JkWidgetWidget.getParent(v);
	}
	return null;
};

JkWidgetWidget.setLayoutSize = function(widget, widthValue, heightValue) {
	if(JkWidgetWidget.isRootWidget(widget)) {
		var ccw = (function(o) {
			if(JkWidgetContainerWidget.IS_INSTANCE && JkWidgetContainerWidget.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))(widget);
		if(ccw != null && ccw.getAllowResize() == false) {
			return false;
		}
	}
	var width = widthValue;
	if(width < 0) {
		width = 0;
	}
	var height = heightValue;
	if(height < 0) {
		height = 0;
	}
	if(JkWidgetWidget.getWidth(widget) == width && JkWidgetWidget.getHeight(widget) == height) {
		return false;
	}
	widget.element.style.width = ~~width + "px";
	widget.element.style.height = ~~height + "px";
	;
	widget.cachedWidth = width;
	widget.cachedHeight = height;
	if(JkWidgetResizeAwareWidget.IS_INSTANCE && JkWidgetResizeAwareWidget.IS_INSTANCE(widget)) {
		widget.onWidgetResized();
	}
	return true;
};

JkWidgetWidget.resizeHeight = function(widget, height) {
	if(!JkWidgetWidget.setLayoutSize(widget, (JkWidgetWidget.getWidth(widget)), height)) {
		return false;
	}
	if(JkWidgetHeightAwareWidget.IS_INSTANCE && JkWidgetHeightAwareWidget.IS_INSTANCE(widget)) {
		widget.onWidgetHeightChanged(height);
	}
	return true;
};

JkWidgetWidget.layout = function(widget, widthConstraint, force) {
	if(!(widget != null)) {
		return;
	}
	var done = false;
	if(JkWidgetWidgetWithLayout.IS_INSTANCE && JkWidgetWidgetWithLayout.IS_INSTANCE(widget)) {
		done = widget.layoutWidget(widthConstraint, force);
	}
	if(!done) {
		var ww = 0;
		var hh = 0;
		if(widthConstraint >= 0) {
			var wws = (JkLangString.safeString((JkLangString.forInteger(widthConstraint)))) + ("px");
			widget.element.style["white-space"] = "normal";
			widget.element.style["width"] = wws;
			hh = widget.element.offsetHeight;
			;
			widget.cachedWidth = widthConstraint;
			ww = widthConstraint;
		}
		else {
			widget.element.style["white-space"] = "nowrap";
			widget.element.style["width"] = "auto";
			ww = widget.element.getBoundingClientRect().width;
			hh = widget.element.offsetHeight;
			;
			ww++;
		}
		JkWidgetWidget.setLayoutSize(widget, ww, hh);
		if(JkWidgetResizeAwareWidget.IS_INSTANCE && JkWidgetResizeAwareWidget.IS_INSTANCE(widget)) {
			widget.onWidgetResized();
		}
	}
};

JkWidgetWidget.togglePointerEventHandling = function(widget, value) {
	var cw = (function(o) {
		if(JkWidgetContainerWidget.IS_INSTANCE && JkWidgetContainerWidget.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(widget);
	if(!(cw != null)) {
		return;
	}
	cw.togglePointerEventHandling(value);
};

JkWidgetWidget.setWidgetClickHandler = function(widget, handler) {
	if(handler != null) {
		JkWidgetWidget.togglePointerEventHandling(widget, true);
	}
	else {
		JkWidgetWidget.togglePointerEventHandling(widget, false);
	}
	widget.element.onclick = handler;
	;
	if((JkWidgetContainerWidget.IS_INSTANCE && JkWidgetContainerWidget.IS_INSTANCE(widget)) == false) {
		JkUiHTMLDOM.setStyle(widget.element, "pointer-events", "auto");
	}
	JkUiHTMLDOM.setStyle(widget.element, "cursor", "pointer");
};

JkWidgetWidget.setWidgetDoubleClickHandler = function(widget, handler) {
	if(handler != null) {
		JkWidgetWidget.togglePointerEventHandling(widget, true);
	}
	else {
		JkWidgetWidget.togglePointerEventHandling(widget, false);
	}
	if(!(handler != null)) {
		return;
	}
	JkUiHTMLDOM.addEventListener(widget.element, "dblclick", handler);
};

JkWidgetWidget.setWidgetLongClickHandler = function(widget, handler) {
	if(handler != null) {
		JkWidgetWidget.togglePointerEventHandling(widget, true);
	}
	else {
		JkWidgetWidget.togglePointerEventHandling(widget, false);
	}
	var timer = null;
	widget.element.onmousedown = function(){
		timer = setTimeout( handler, 500 );
	};
	widget.element.onmouseup = function(){
		clearTimeout( timer );
	};
	;
	JkUiHTMLDOM.setStyle(widget.element, "cursor", "pointer");
};

JkWidgetWidget.setWidgetPointerHandlers = function(widget, onStartHandler, onTouchHandler, onEndHandler) {
	if(onStartHandler == null && onTouchHandler == null && onEndHandler == null) {
		JkWidgetWidget.togglePointerEventHandling(widget, false);
	}
	else {
		JkWidgetWidget.togglePointerEventHandling(widget, true);
	}
	var mousedown = false;
	var getCoordinates = function(evt) {
		var rect = widget.element.getBoundingClientRect();
		var x = evt.clientX - rect.left;
		var y = evt.clientY - rect.top;
		return { x : x, y : y};
	};
	if(onTouchHandler != null) {
		var othf = function(evt) {
			if(mousedown) {
				JkUiHTMLDOM.setStyle(widget.element, "cursor", "move");
				onTouchHandler(getCoordinates(evt).x, getCoordinates(evt).y);
			}
		};
		widget.element.onmousemove = othf;
	}
	if(onStartHandler != null) {
		var oshf = function(evt) {
			mousedown = true;
			onStartHandler(getCoordinates(evt).x, getCoordinates(evt).y);
		};
		widget.element.onmousedown = oshf;
	}
	if(onEndHandler != null) {
		var oehf = function(evt) {
			if(mousedown) {
				JkUiHTMLDOM.setStyle(widget.element, "cursor", "auto");
				onEndHandler(getCoordinates(evt).x, getCoordinates(evt).y);
				mousedown = false;
			}
		};
		widget.element.onmouseup = oehf;
	}
	;
};

JkWidgetWidget.removeChildrenOf = function(widget) {
	if(!(widget != null)) {
		return;
	}
	var children = JkWidgetWidget.getChildren(widget);
	widget.element.textContent = "";
	;
	var screen = JkWidgetScreenForWidget.findScreenForWidget(widget);
	var pp = (function(o) {
		if(JkWidgetContainerWidget.IS_INSTANCE && JkWidgetContainerWidget.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(widget);
	if(children != null) {
		var n = 0;
		var m = children.length;
		for(n = 0 ; n < m ; n++) {
			var child = children[n];
			if(child != null) {
				if(screen != null) {
					JkWidgetWidget.notifyOnRemovedFromScreen(child, screen);
				}
				JkWidgetWidget.onWidgetRemovedFromParent(child);
			}
		}
	}
	if(pp != null) {
		pp.onChildWidgetsRemoved(children);
	}
};

JkWidgetWidget.onLayoutChanged = function(widget) {
	if(!(widget != null)) {
		return;
	}
	var wwl = (function(o) {
		if(JkWidgetWidgetWithLayout.IS_INSTANCE && JkWidgetWidgetWithLayout.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(widget);
	if(wwl != null && wwl.hasWidgetLayoutChanged()) {
		return;
	}
	if(JkWidgetWidget.isRootWidget(widget)) {
		widget.scheduleLayout();
	}
	else {
		var pp = (function(o1) {
			if(JkWidgetWidget.IS_INSTANCE && JkWidgetWidget.IS_INSTANCE(o1)) {
				return o1;
			}
			return null;
		}.bind(this))((JkWidgetWidget.getParent(widget)));
		if(pp != null) {
			JkWidgetWidget.onLayoutChanged(pp);
		}
		else {
			var root = JkWidgetWidget.findRootWidget(widget);
			if(root != null) {
				root.scheduleLayout();
			}
		}
	}
	if(wwl != null) {
		wwl.setWidgetLayoutChanged();
	}
};

JkWidgetWidget.setAlpha = function(widget, alpha) {
	if(!(widget != null)) {
		return;
	}
	JkUiHTMLDOM.setStyle(widget.element, "opacity", (JkLangString.forDouble(alpha)));
};

JkWidgetWidget.setRotation = function(widget, degrees) {
	if(!(widget != null)) {
		return;
	}
	var element = widget.element;
	var ang = degrees * 180.0 / JkMathMath.M_PI;
	var str = "rotate(" + (JkLangString.safeString((JkLangString.forInteger((~(~ang)))))) + ("deg)");
	JkUiHTMLDOM.setStyle(element, "transform", str);
	JkUiHTMLDOM.setStyle(element, "webkitTransform", str);
	JkUiHTMLDOM.setStyle(element, "msTransform", str);
	JkUiHTMLDOM.setStyle(element, "oTransform", str);
	JkUiHTMLDOM.setStyle(element, "mozTransform", str);
};

JkWidgetWidget.setEnabled = function(widget, enabled) {
	if(!(widget != null)) {
		return;
	}
	var elem = widget.element;
	elem.disabled = !enabled;
	;
};

JkWidgetWidget.setTabIndex = function(widget, index) {
	if(!(widget != null)) {
		return;
	}
	JkUiHTMLDOM.setAttribute(widget.element, "tabIndex", (JkLangString.forInteger(index)));
};

JkWidgetWidget.setVisible = function(widget, visible) {
	if(!(widget != null)) {
		return;
	}
	if(visible) {
		JkUiHTMLDOM.setStyle(widget.element, "visibility", "inherit");
	}
	else {
		JkUiHTMLDOM.setStyle(widget.element, "visibility", "hidden");
	}
};

JkWidgetWidget.getVisible = function(widget) {
	if(!(widget != null)) {
		return false;
	}
	var visible = false;
	var visibility = JkUiHTMLDOM.getStyle(widget.element, "visibility");
	if(JkLangString.equals(visibility, "visible") || JkLangString.equals(visibility, "inherit")) {
		visible = true;
	}
	return visible;
};

JkWidgetWidget.setWidgetId = function(widget, idValue) {
	if(!(widget != null)) {
		return;
	}
	if(JkWidgetIdAwareWidget.IS_INSTANCE && JkWidgetIdAwareWidget.IS_INSTANCE(widget)) {
		(function(o) {
			if(JkWidgetIdAwareWidget.IS_INSTANCE && JkWidgetIdAwareWidget.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))(widget).setWidgetId(idValue);
	}
	else {
		JkUiHTMLDOM.setAttribute(widget.element, "id", (JkLangString.asString(idValue)));
	}
};

JkWidgetWidget.focus = function(widget) {
	JkUiHTMLDOM.setAttribute(widget.element, "tabindex", "-1");
	JkUiHTMLDOM.setFocus(widget.element);
};

JkWidgetWidget.setWidgetToolTipText = function(widget, str) {
	JkUiHTMLDOM.setAttribute(widget.element, "title", str);
};

JkWidgetWidget.setWidgetMousePointer = function(widget, mousePointer) {
	if(mousePointer == JkWidgetWidget.MOUSE_POINTER_DEFAULT) {
		JkUiHTMLDOM.setStyle(widget.element, "cursor", "default");
	}
	else if(mousePointer == JkWidgetWidget.MOUSE_POINTER_CROSSHAIR) {
		JkUiHTMLDOM.setStyle(widget.element, "cursor", "crosshair");
	}
	else if(mousePointer == JkWidgetWidget.MOUSE_POINTER_NESW) {
		JkUiHTMLDOM.setStyle(widget.element, "cursor", "nesw-resize");
	}
	else if(mousePointer == JkWidgetWidget.MOUSE_POINTER_NS) {
		JkUiHTMLDOM.setStyle(widget.element, "cursor", "ns-resize");
	}
	else if(mousePointer == JkWidgetWidget.MOUSE_POINTER_NWSE) {
		JkUiHTMLDOM.setStyle(widget.element, "cursor", "nwse-resize");
	}
	else if(mousePointer == JkWidgetWidget.MOUSE_POINTER_NODROP) {
		JkUiHTMLDOM.setStyle(widget.element, "cursor", "no-drop");
	}
	else if(mousePointer == JkWidgetWidget.MOUSE_POINTER_HOURGLASS) {
		JkUiHTMLDOM.setStyle(widget.element, "cursor", "progress");
	}
};

JkWidgetWidget.addToDomElement = function(widget, parentElement) {
	if(!(widget != null)) {
		return;
	}
	if(!(parentElement != null)) {
		return;
	}
	JkUiHTMLDOM.setStyle(parentElement, "display", "table");
	JkUiHTMLDOM.setStyle(parentElement, "overflow", "hidden");
	if(parentElement == JkUiHTMLDOM.getDocumentBody()) {
		JkUiHTMLDOM.setStyle(parentElement, "width", "100%");
		JkUiHTMLDOM.setStyle(parentElement, "height", "100%");
		var html = JkUiHTMLDOM.getElementsByTagName((JkUiHTMLDOM.getDocument()), "html")[0];
		JkUiHTMLDOM.setStyle(html, "width", "100%");
		JkUiHTMLDOM.setStyle(html, "height", "100%");
	}
	JkUiHTMLDOM.setStyle(widget.element, "display", "table-cell");
	JkUiHTMLDOM.setStyle(widget.element, "position", "relative");
	JkUiHTMLDOM.setStyle(widget.element, "width", "100%");
	JkUiHTMLDOM.setStyle(widget.element, "height", "100%");
	JkUiHTMLDOM.appendChild(parentElement, widget.element);
	widget.onWidgetAddingToParent();
	widget.onWidgetAddedToParent();
	widget.scheduleLayout();
};

JkWidgetWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetWidget"] === true;
};

JkWidgetWidget.MOUSE_POINTER_DEFAULT = 0;
JkWidgetWidget.MOUSE_POINTER_ARROW = 1;
JkWidgetWidget.MOUSE_POINTER_CROSSHAIR = 2;
JkWidgetWidget.MOUSE_POINTER_IBEAM = 3;
JkWidgetWidget.MOUSE_POINTER_ICON = 4;
JkWidgetWidget.MOUSE_POINTER_SIZE = 5;
JkWidgetWidget.MOUSE_POINTER_NESW = 6;
JkWidgetWidget.MOUSE_POINTER_NS = 7;
JkWidgetWidget.MOUSE_POINTER_NWSE = 8;
JkWidgetWidget.MOUSE_POINTER_WE = 9;
JkWidgetWidget.MOUSE_POINTER_UPARROW = 10;
JkWidgetWidget.MOUSE_POINTER_HOURGLASS = 11;
JkWidgetWidget.MOUSE_POINTER_NODROP = 12;
JkWidgetWidget.MOUSE_POINTER_ARROW_HOURGLASS = 13;
JkWidgetWidget.MOUSE_POINTER_ARROW_QUESTION = 14;
JkWidgetWidget.MOUSE_POINTER_SIZE_ALL = 15;

let JkWidgetWidgetAnimation = function() {
	this.context = null;
	this.duration = 0;
	this.callbacks = null;
	this.endListener = null;
	this.shouldStop = false;
	this.shouldLoop = false;
	this.startTime = 0;
};

JkWidgetWidgetAnimation.prototype._t = { "JkWidgetWidgetAnimation" : true };
JkWidgetWidgetAnimation.prototype._tobj = JkWidgetWidgetAnimation;

JkWidgetWidgetAnimation.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetWidgetAnimation;
	return v.CTOR_JkWidgetWidgetAnimation_JkUiGuiApplicationContext(context);
};

JkWidgetWidgetAnimation.prototype.CTOR_JkWidgetWidgetAnimation_JkUiGuiApplicationContext = function(context) {
	this.startTime = 0;
	this.shouldLoop = false;
	this.shouldStop = false;
	this.endListener = null;
	this.callbacks = null;
	this.duration = 0;
	this.context = null;
	this.context = context;
	this.callbacks = new Array;
	return this;
};

JkWidgetWidgetAnimation.forDuration = function(context, duration) {
	var v = JkWidgetWidgetAnimation.NEW_JkUiGuiApplicationContext(context);
	v.setDuration(duration);
	return v;
};

JkWidgetWidgetAnimation.prototype.addCallback = function(callback) {
	if(callback != null) {
		this.callbacks.push(callback);
	}
	return this;
};

JkWidgetWidgetAnimation.prototype.addCrossFade = function(from, to, removeFrom) {
	var ff = from;
	var tt = to;
	var rf = removeFrom;
	this.addCallback((function(completion1) {
		JkWidgetWidget.setAlpha(ff, (1.0 - completion1));
		JkWidgetWidget.setAlpha(tt, completion1);
		if(rf && completion1 >= 1.0) {
			JkWidgetWidget.removeFromParent(ff);
		}
	}.bind(this)));
	return this;
};

JkWidgetWidgetAnimation.prototype.addFadeIn = function(from) {
	var ff = from;
	this.addCallback((function(completion1) {
		JkWidgetWidget.setAlpha(ff, completion1);
	}.bind(this)));
	return this;
};

JkWidgetWidgetAnimation.prototype.addFadeOut = function(from, removeAfter) {
	var ff = from;
	var ra = removeAfter;
	this.addCallback((function(completion1) {
		JkWidgetWidget.setAlpha(ff, (1.0 - completion1));
		if(ra && completion1 >= 1.0) {
			JkWidgetWidget.removeFromParent(ff);
		}
	}.bind(this)));
	return this;
};

JkWidgetWidgetAnimation.prototype.addFadeOutIn = function(from) {
	var ff = from;
	this.addCallback((function(completion1) {
		var r = JkMathMath.remainder(completion1, 1.0);
		if(r < 0.5) {
			JkWidgetWidget.setAlpha(ff, (1.0 - r * 2));
		}
		else {
			JkWidgetWidget.setAlpha(ff, ((r - 0.5) * 2));
		}
	}.bind(this)));
	return this;
};

JkWidgetWidgetAnimation.prototype.tick = function(completion) {
	if(this.callbacks != null) {
		var n = 0;
		var m = this.callbacks.length;
		for(n = 0 ; n < m ; n++) {
			var callback = this.callbacks[n];
			if(callback != null) {
				callback(completion);
			}
		}
	}
};

JkWidgetWidgetAnimation.prototype.onProgress = function(elapsedTime) {
	var completion = elapsedTime / this.duration;
	this.tick(completion);
	if(this.shouldLoop == false && completion >= 1.0 || this.shouldStop) {
		this.onAnimationEnded();
		return false;
	}
	return true;
};

JkWidgetWidgetAnimation.prototype.onAnimationEnded = function() {
	if(this.endListener != null) {
		this.endListener();
	}
};

JkWidgetWidgetAnimation.prototype.onAnimationFrame = function() {
	if(this.onProgress(this.getPerformanceNow() - this.startTime)) {
		requestAnimationFrame(function(e) { this.onAnimationFrame(); }.bind(this));
		;
	}
};

JkWidgetWidgetAnimation.prototype.getPerformanceNow = function() {
	if("performance" in window == true && "now" in window.performance == true) {
		return(window.performance.now());
	}
	return(Date.now());
	;
};

JkWidgetWidgetAnimation.prototype.start = function() {
	this.startTime = this.getPerformanceNow();
	requestAnimationFrame(function(e) { this.onAnimationFrame(); }.bind(this));
	;
};

JkWidgetWidgetAnimation.prototype.getDuration = function() {
	return this.duration;
};

JkWidgetWidgetAnimation.prototype.setDuration = function(v) {
	this.duration = v;
	return this;
};

JkWidgetWidgetAnimation.prototype.getEndListener = function() {
	return this.endListener;
};

JkWidgetWidgetAnimation.prototype.setEndListener = function(v) {
	this.endListener = v;
	return this;
};

JkWidgetWidgetAnimation.prototype.getShouldStop = function() {
	return this.shouldStop;
};

JkWidgetWidgetAnimation.prototype.setShouldStop = function(v) {
	this.shouldStop = v;
	return this;
};

JkWidgetWidgetAnimation.prototype.getShouldLoop = function() {
	return this.shouldLoop;
};

JkWidgetWidgetAnimation.prototype.setShouldLoop = function(v) {
	this.shouldLoop = v;
	return this;
};

JkWidgetWidgetAnimation.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetWidgetAnimation"] === true;
};

let JkWidgetWidgetWithLayout = {};

JkWidgetWidgetWithLayout.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetWidgetWithLayout"] === true;
};

let JkWidgetHeightAwareWidget = {};

JkWidgetHeightAwareWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetHeightAwareWidget"] === true;
};

let JkWidgetLabelWidget = function() {
	JkWidgetWidget.call(this);
	this.widgetContext = null;
	this.widgetText = null;
	this.widgetTextColor = null;
	this.widgetFontSize = 0.0;
	this.widgetFontBold = false;
	this.widgetFontFamily = null;
	this.widgetFontResource = null;
	this.widgetTextAlign = 0;
	this.widgetFontUnderline = false;
	this.widgetFontItalic = false;
	this.widgetPaddingLeft = 0;
	this.widgetPaddingTop = 0;
	this.widgetPaddingRight = 0;
	this.widgetPaddingBottom = 0;
	this.widgetMaximumNumberOfLines = 0;
};

JkWidgetLabelWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetLabelWidget.prototype.constructor = JkWidgetLabelWidget;
JkWidgetLabelWidget.prototype._t = {
	"JkWidgetWidget" : true,
	"JkWidgetLabelWidget" : true
};
JkWidgetLabelWidget.prototype._tobj = JkWidgetLabelWidget;

JkWidgetLabelWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetLabelWidget;
	return v.CTOR_JkWidgetLabelWidget_JkUiGuiApplicationContext(context);
};

JkWidgetLabelWidget.prototype.CTOR_JkWidgetLabelWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.widgetMaximumNumberOfLines = 0;
	this.widgetPaddingBottom = 0;
	this.widgetPaddingRight = 0;
	this.widgetPaddingTop = 0;
	this.widgetPaddingLeft = 0;
	this.widgetFontItalic = false;
	this.widgetFontUnderline = false;
	this.widgetTextAlign = 0;
	this.widgetFontResource = null;
	this.widgetFontFamily = null;
	this.widgetFontBold = false;
	this.widgetFontSize = 0.0;
	this.widgetTextColor = null;
	this.widgetText = null;
	this.widgetContext = null;
	this.widgetContext = context;
	this.setWidgetStyle("LabelWidget");
	return this;
};

JkWidgetLabelWidget.forText = function(context, text) {
	var v = JkWidgetLabelWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetText(text);
	return v;
};

JkWidgetLabelWidget.prototype.createElement = function() {
	return JkUiHTMLDOM.createElement("div");
};

JkWidgetLabelWidget.prototype.prepareElement = function(v) {
	JkWidgetWidget.prototype.prepareElement.call(this, v);
	JkUiHTMLDOM.setStyle(v, "pointer-events", "inherit");
	JkUiHTMLDOM.setStyle(v, "font-size", "20px");
};

JkWidgetLabelWidget.prototype.setWidgetText = function(text) {
	this.widgetText = text;
	if(!(this.widgetText != null)) {
		this.widgetText = "";
	}
	JkUiHTMLDOM.setTextContent(this.element, this.widgetText);
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetLabelWidget.prototype.getWidgetText = function() {
	return this.widgetText;
};

JkWidgetLabelWidget.prototype.setWidgetTextAlign = function(align) {
	this.widgetTextAlign = align;
	if(align == JkWidgetLabelWidget.ALIGN_LEFT) {
		JkUiHTMLDOM.setStyle(this.element, "text-align", "left");
	}
	else if(align == JkWidgetLabelWidget.ALIGN_CENTER) {
		JkUiHTMLDOM.setStyle(this.element, "text-align", "center");
	}
	else if(align == JkWidgetLabelWidget.ALIGN_RIGHT) {
		JkUiHTMLDOM.setStyle(this.element, "text-align", "right");
	}
	else if(align == JkWidgetLabelWidget.ALIGN_JUSTIFY) {
		JkUiHTMLDOM.setStyle(this.element, "text-align", "justify");
	}
	else {
		JkUiHTMLDOM.setStyle(this.element, "text-align", "left");
	}
	return this;
};

JkWidgetLabelWidget.prototype.getWidgetTextAlign = function() {
	return this.widgetTextAlign;
};

JkWidgetLabelWidget.prototype.setWidgetWordWrapping = function(wrap) {
	if(wrap == JkWidgetLabelWidget.NO_WRAP) {
		console.log("[jk.widget.LabelWidget.setWidgetWordWrapping] (LabelWidget.sling:421:4): Not implemented");
	}
	else if(wrap == JkWidgetLabelWidget.WORD_WRAP) {
		console.log("[jk.widget.LabelWidget.setWidgetWordWrapping] (LabelWidget.sling:482:4): Not implemented");
	}
	return this;
};

JkWidgetLabelWidget.prototype.setWidgetTextColor = function(color) {
	this.widgetTextColor = color;
	this.updateWidgetFont(false);
	return this;
};

JkWidgetLabelWidget.prototype.getWidgetTextColor = function() {
	return this.widgetTextColor;
};

JkWidgetLabelWidget.prototype.setWidgetFontSize = function(fontSize) {
	this.widgetFontSize = fontSize;
	this.updateWidgetFont(true);
	return this;
};

JkWidgetLabelWidget.prototype.getFontSize = function() {
	return this.widgetFontSize;
};

JkWidgetLabelWidget.prototype.setWidgetFontBold = function(bold) {
	this.widgetFontBold = bold;
	this.updateWidgetFont(true);
	return this;
};

JkWidgetLabelWidget.prototype.setWidgetFontUnderline = function(underline) {
	this.widgetFontUnderline = underline;
	this.updateWidgetFont(true);
	return this;
};

JkWidgetLabelWidget.prototype.setWidgetFontItalic = function(italic) {
	this.widgetFontItalic = italic;
	this.updateWidgetFont(true);
	return this;
};

JkWidgetLabelWidget.prototype.setWidgetFontFamily = function(font) {
	this.widgetFontFamily = font;
	this.updateWidgetFont(true);
	return this;
};

JkWidgetLabelWidget.prototype.setWidgetFontResource = function(res) {
	this.widgetFontResource = res;
	this.updateWidgetFont(true);
	return this;
};

JkWidgetLabelWidget.prototype.setWidgetStyle = function(style) {
	this.widgetFontFamily = this.widgetContext.getStyleString(style, "fontFamily", null);
	if(JkLangString.isEmpty(this.widgetFontFamily)) {
		this.widgetFontFamily = "Arial";
	}
	this.widgetFontResource = this.widgetContext.getStyleString(style, "fontResource", null);
	this.widgetTextColor = this.widgetContext.getStyleColor(style, "textColor", null);
	if(!(this.widgetTextColor != null)) {
		this.widgetTextColor = JkGfxColor.forRGB(0, 0, 0);
	}
	this.widgetFontSize = this.widgetContext.getStylePixels(style, "fontSize", null);
	if(this.widgetFontSize < 1.0) {
		this.widgetFontSize = this.widgetContext.getHeightValue("3mm");
	}
	this.widgetFontBold = JkLangBoolean.asBoolean((this.widgetContext.getStyleString(style, "fontBold", null)), false);
	this.setWidgetPadding1((this.widgetContext.getStylePixels(style, "padding", null)));
	this.updateWidgetFont(true);
	return this;
};

JkWidgetLabelWidget.prototype.updateWidgetFont = function(changesLayout) {
	var fs = this.widgetFontSize;
	if(fs < 1.0) {
		fs = 1.0;
	}
	JkUiHTMLDOM.setFontFamily(this.element, this.widgetFontFamily);
	JkUiHTMLDOM.setStyle(this.element, "font-size", (JkLangString.safeString((JkLangString.forDouble(fs)))) + ("px"));
	if(this.widgetFontBold) {
		JkUiHTMLDOM.setStyle(this.element, "font-weight", "bold");
	}
	if(this.widgetFontItalic) {
		JkUiHTMLDOM.setStyle(this.element, "font-style", "italic");
	}
	if(this.widgetFontUnderline) {
		JkUiHTMLDOM.setStyle(this.element, "text-decoration", "underline");
	}
	JkUiHTMLDOM.setStyle(this.element, "color", (JkUiHTMLDOM.colorToRGBA(this.widgetTextColor)));
	if(changesLayout) {
		JkWidgetWidget.onLayoutChanged(this);
	}
};

JkWidgetLabelWidget.prototype.setWidgetPadding1 = function(padding) {
	return this.setWidgetPadding2(padding, padding, padding, padding);
};

JkWidgetLabelWidget.prototype.setWidgetPaddingLeft = function(value) {
	return this.setWidgetPadding2(value, this.widgetPaddingTop, this.widgetPaddingRight, this.widgetPaddingBottom);
};

JkWidgetLabelWidget.prototype.setWidgetPaddingTop = function(value) {
	return this.setWidgetPadding2(this.widgetPaddingLeft, value, this.widgetPaddingRight, this.widgetPaddingBottom);
};

JkWidgetLabelWidget.prototype.setWidgetPaddingRight = function(value) {
	return this.setWidgetPadding2(this.widgetPaddingLeft, this.widgetPaddingTop, value, this.widgetPaddingBottom);
};

JkWidgetLabelWidget.prototype.setWidgetPaddingBottom = function(value) {
	return this.setWidgetPadding2(this.widgetPaddingLeft, this.widgetPaddingTop, this.widgetPaddingRight, value);
};

JkWidgetLabelWidget.prototype.setWidgetPadding2 = function(l, t, r, b) {
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

JkWidgetLabelWidget.prototype.updateWidgetPadding = function() {
	JkUiHTMLDOM.setStyle(this.element, "padding", (JkLangString.safeString((JkLangString.forInteger(this.widgetPaddingTop)))) + ("px") + (" ") + (JkLangString.safeString((JkLangString.forInteger(this.widgetPaddingRight)))) + ("px") + (" ") + (JkLangString.safeString((JkLangString.forInteger(this.widgetPaddingBottom)))) + ("px") + (" ") + (JkLangString.safeString((JkLangString.forInteger(this.widgetPaddingLeft)))) + ("px"));
	JkUiHTMLDOM.setStyle(this.element, "box-sizing", "border-box");
};

JkWidgetLabelWidget.prototype.getWidgetMaximumNumberOfLines = function() {
	return this.widgetMaximumNumberOfLines;
};

JkWidgetLabelWidget.prototype.setWidgetMaximumNumberOfLines = function(v) {
	this.widgetMaximumNumberOfLines = v;
	return this;
};

JkWidgetLabelWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetLabelWidget"] === true;
};

JkWidgetLabelWidget.ALIGN_LEFT = 0;
JkWidgetLabelWidget.ALIGN_CENTER = 1;
JkWidgetLabelWidget.ALIGN_RIGHT = 2;
JkWidgetLabelWidget.ALIGN_JUSTIFY = 3;
JkWidgetLabelWidget.WORD_WRAP = 0;
JkWidgetLabelWidget.NO_WRAP = 1;
let JkWidgetScreenAwareWidget = {};

JkWidgetScreenAwareWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetScreenAwareWidget"] === true;
};

let JkWidgetContainerWidget = function() {
	JkWidgetWidget.call(this);
	this.context = null;
	this.widgetLayoutChanged = true;
	this.lastWidthConstraint = -2;
	this.lastLayoutWidth = -1;
	this.isLayoutScheduled = false;
	this.allowResize = true;
	this.initialized = false;
	this.created = false;
	this.originalParentWidth = null;
	this.originalParentHeight = null;
};

JkWidgetContainerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetContainerWidget.prototype.constructor = JkWidgetContainerWidget;
JkWidgetContainerWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetContainerWidget.prototype._tobj = JkWidgetContainerWidget;

JkWidgetContainerWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetContainerWidget;
	return v.CTOR_JkWidgetContainerWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetContainerWidget.prototype.CTOR_JkWidgetContainerWidget_JkUiGuiApplicationContext = function(ctx) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.originalParentHeight = null;
	this.originalParentWidth = null;
	this.created = false;
	this.initialized = false;
	this.allowResize = true;
	this.isLayoutScheduled = false;
	this.lastLayoutWidth = -1;
	this.lastWidthConstraint = -2;
	this.widgetLayoutChanged = true;
	this.context = null;
	this.context = ctx;
	this.togglePointerEventHandling(false);
	return this;
};

JkWidgetContainerWidget.prototype.togglePointerEventHandling = function(active) {
	if(active) {
		JkUiHTMLDOM.setStyle(this.element, "pointer-events", "auto");
	}
	else {
		JkUiHTMLDOM.setStyle(this.element, "pointer-events", "none");
	}
};

JkWidgetContainerWidget.prototype.onNativelyResized = function() {
	if(JkWidgetWidget.isRootWidget(this)) {
		JkWidgetWidget.layout(this, (JkWidgetWidget.getWidth(this)), false);
		this.onWidgetHeightChanged((JkWidgetWidget.getHeight(this)));
	}
};

JkWidgetContainerWidget.prototype.hasSize = function() {
	if(JkWidgetWidget.getWidth(this) > 0 || JkWidgetWidget.getHeight(this) > 0) {
		return true;
	}
	return false;
};

JkWidgetContainerWidget.prototype.createWidget = function() {
};

JkWidgetContainerWidget.prototype.forceCreateWidget = function() {
	if(!this.created) {
		this.createWidget();
		this.created = true;
	}
};

JkWidgetContainerWidget.prototype.onWidgetAddingToParent = function() {
	this.forceCreateWidget();
	if(this.initialized) {
		return;
	}
	this.setInitialized(true);
	this.initializeWidget();
};

JkWidgetContainerWidget.prototype.initializeWidget = function() {
};

JkWidgetContainerWidget.prototype.addWidget = function(widget) {
	JkWidgetWidget.addChild(this, widget);
	return this;
};

JkWidgetContainerWidget.prototype.onChildWidgetAdded = function(widget) {
	JkWidgetWidget.onLayoutChanged(this);
};

JkWidgetContainerWidget.prototype.onChildWidgetsRemoved = function(widgets) {
	JkWidgetWidget.onLayoutChanged(this);
};

JkWidgetContainerWidget.prototype.onWidgetAddedToParent = function() {
	if(JkWidgetWidget.isRootWidget(this)) {
		if(!(JkWidgetContainerWidget.resizeHandlers != null)) {
			JkWidgetContainerWidget.resizeHandlers = new Array;
			var executeResizeHandlers = function() {
				if(JkWidgetContainerWidget.resizeHandlers != null) {
					var n = 0;
					var m = JkWidgetContainerWidget.resizeHandlers.length;
					for(n = 0 ; n < m ; n++) {
						var handler = JkWidgetContainerWidget.resizeHandlers[n];
						if(handler != null) {
							handler.onNativelyResized();
						}
					}
				}
			}.bind(this);
			var oresize = window.onresize;
			window.onresize = function(event) {
				if(oresize) {
					oresize();
				}
				executeResizeHandlers();
			};
			;
		}
		JkWidgetContainerWidget.resizeHandlers.push(this);
		var pp = JkUiHTMLDOM.getParentElement(this.element);
		if(pp != null) {
			this.originalParentWidth = JkUiHTMLDOM.getStyle(pp, "width");
			this.originalParentHeight = JkUiHTMLDOM.getStyle(pp, "height");
		}
	}
	JkWidgetWidget.onLayoutChanged(this);
};

JkWidgetContainerWidget.prototype.onWidgetRemovedFromParent = function() {
	if(JkWidgetWidget.isRootWidget(this) && JkWidgetContainerWidget.resizeHandlers != null) {
		JkLangVector.removeValue(JkWidgetContainerWidget.resizeHandlers, this);
	}
};

JkWidgetContainerWidget.prototype.onWidgetHeightChanged = function(height) {
};

JkWidgetContainerWidget.prototype.computeWidgetLayout = function(widthConstraint) {
};

JkWidgetContainerWidget.prototype.setWidgetLayoutChanged = function() {
	this.widgetLayoutChanged = true;
};

JkWidgetContainerWidget.prototype.hasWidgetLayoutChanged = function() {
	return this.widgetLayoutChanged;
};

JkWidgetContainerWidget.prototype.layoutWidget = function(widthConstraint, force) {
	if(force || this.widgetLayoutChanged || widthConstraint != this.lastWidthConstraint) {
		if(force == false && this.widgetLayoutChanged == false && (widthConstraint >= 0 && widthConstraint == this.lastLayoutWidth)) {
			;
		}
		else {
			this.widgetLayoutChanged = false;
			this.computeWidgetLayout(widthConstraint);
			this.lastWidthConstraint = widthConstraint;
			this.lastLayoutWidth = JkWidgetWidget.getWidth(this);
		}
	}
	return true;
};

JkWidgetContainerWidget.prototype.scheduleLayout = function() {
	if(this.isLayoutScheduled) {
		return;
	}
	this.isLayoutScheduled = true;
	this.addToLayoutQueue(this);
};

JkWidgetContainerWidget.prototype.executeLayout = function() {
	this.isLayoutScheduled = false;
	var ww = JkWidgetWidget.getWidth(this);
	if(ww == 0 && this.allowResize) {
		ww = -1;
	}
	JkWidgetWidget.layout(this, ww, false);
	if(this.allowResize) {
		var pp = JkUiHTMLDOM.getParentElement(this.element);
		if(pp != null) {
			if(JkLangString.isEmpty(this.originalParentWidth)) {
				JkUiHTMLDOM.setStyle(pp, "width", (JkLangString.safeString((JkLangString.forInteger((JkWidgetWidget.getWidth(this)))))) + ("px"));
			}
			if(JkLangString.isEmpty(this.originalParentHeight)) {
				JkUiHTMLDOM.setStyle(pp, "height", (JkLangString.safeString((JkLangString.forInteger((JkWidgetWidget.getHeight(this)))))) + ("px"));
			}
		}
	}
};

JkWidgetContainerWidget.prototype.processLayoutQueue = function() {
	if(!(JkWidgetContainerWidget.layoutQueue != null)) {
		return;
	}
	var lq = JkWidgetContainerWidget.layoutQueue;
	JkWidgetContainerWidget.layoutQueue = null;
	if(lq != null) {
		var n = 0;
		var m = lq.length;
		for(n = 0 ; n < m ; n++) {
			var widget = lq[n];
			if(widget != null) {
				widget.executeLayout();
			}
		}
	}
};

JkWidgetContainerWidget.prototype.addToLayoutQueue = function(widget) {
	if(!(widget != null)) {
		return;
	}
	if(JkWidgetContainerWidget.layoutQueue != null) {
		JkWidgetContainerWidget.layoutQueue.push(widget);
		return;
	}
	JkWidgetContainerWidget.layoutQueue = new Array;
	JkWidgetContainerWidget.layoutQueue.push(widget);
	this.context.startTimer(0, (function() {
		var c = 0;
		while(JkWidgetContainerWidget.layoutQueue != null){
			if(c >= 10) {
				break;
			}
			this.processLayoutQueue();
			c++;
		}
	}.bind(this)));
};

JkWidgetContainerWidget.prototype.getAllowResize = function() {
	return this.allowResize;
};

JkWidgetContainerWidget.prototype.setAllowResize = function(v) {
	this.allowResize = v;
	return this;
};

JkWidgetContainerWidget.prototype.getInitialized = function() {
	return this.initialized;
};

JkWidgetContainerWidget.prototype.setInitialized = function(v) {
	this.initialized = v;
	return this;
};

JkWidgetContainerWidget.prototype.getCreated = function() {
	return this.created;
};

JkWidgetContainerWidget.prototype.setCreated = function(v) {
	this.created = v;
	return this;
};

JkWidgetContainerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetContainerWidget"] === true;
};

JkWidgetContainerWidget.resizeHandlers = null;
JkWidgetContainerWidget.layoutQueue = null;

let JkWidgetScreenForWidget = function() {
	JkUiScreen.call(this);
	this.captureBrowserBackButton = true;
	this.context = null;
	this.myWidget = null;
	this.keyEvent = null;
};

JkWidgetScreenForWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkUiScreen.prototype);
JkWidgetScreenForWidget.prototype.constructor = JkWidgetScreenForWidget;
JkWidgetScreenForWidget.prototype._t = {
	"JkUiScreen" : true,
	"JkUiScreenWithContext" : true,
	"JkWidgetScreenForWidget" : true
};
JkWidgetScreenForWidget.prototype._tobj = JkWidgetScreenForWidget;

JkWidgetScreenForWidget.NEW = function() {
	var v = new JkWidgetScreenForWidget;
	return v.CTOR_JkWidgetScreenForWidget();
};

JkWidgetScreenForWidget.prototype.CTOR_JkWidgetScreenForWidget = function() {
	this.keyEvent = null;
	this.myWidget = null;
	this.context = null;
	this.captureBrowserBackButton = true;
	if(JkUiScreen.prototype.CTOR_JkUiScreen.call(this) == null) {
		return null;
	}
	return this;
};

JkWidgetScreenForWidget.findScreenForWidget = function(widget) {
	return (function(o) {
		if(JkWidgetScreenForWidget.IS_INSTANCE && JkWidgetScreenForWidget.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((JkWidgetWidget.findScreen(widget)));
};

JkWidgetScreenForWidget.prototype.onBackKeyPressEvent = function() {
	if(!(this.keyEvent != null)) {
		this.keyEvent = JkUiKeyEvent.NEW();
	}
	this.keyEvent.clear();
	this.keyEvent.setAction(JkUiKeyEvent.ACTION_DOWN);
	this.keyEvent.setKeyCode(JkUiKeyEvent.KEY_BACK);
	this.deliverKeyEventToWidget(this.keyEvent, (this.getWidget()));
};

JkWidgetScreenForWidget.prototype.deliverKeyEventToWidget = function(event, widget) {
	if(!(widget != null)) {
		return;
	}
	var array = JkWidgetWidget.getChildren(widget);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				this.deliverKeyEventToWidget(event, child);
				if(event.isConsumed) {
					return;
				}
			}
		}
	}
	var kl = (function(o) {
		if(JkUiKeyListener.IS_INSTANCE && JkUiKeyListener.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(widget);
	if(kl != null) {
		kl.onKeyEvent(event);
		if(event.isConsumed) {
			return;
		}
	}
};

JkWidgetScreenForWidget.prototype.unlockOrientation = function() {
	console.log("[jk.widget.ScreenForWidget.unlockOrientation] (ScreenForWidget.sling:704:3): Not implemented");
};

JkWidgetScreenForWidget.prototype.lockToLandscapeOrientation = function() {
	console.log("[jk.widget.ScreenForWidget.lockToLandscapeOrientation] (ScreenForWidget.sling:731:3): Not implemented");
};

JkWidgetScreenForWidget.prototype.lockToPortraitOrientation = function() {
	console.log("[jk.widget.ScreenForWidget.lockToPortraitOrientation] (ScreenForWidget.sling:758:3): Not implemented");
};

JkWidgetScreenForWidget.prototype.setContext = function(context) {
	this.context = context;
};

JkWidgetScreenForWidget.prototype.getContext = function() {
	return this.context;
};

JkWidgetScreenForWidget.prototype.createContext = function() {
	var v = null;
	v = JkUiGuiApplicationContextForHTML.NEW();
	return v;
};

JkWidgetScreenForWidget.prototype.onPrepareScreen = function() {
};

JkWidgetScreenForWidget.prototype.onStartScreen = function() {
	JkWidgetWidget.notifyOnStartScreen(this.myWidget, this);
};

JkWidgetScreenForWidget.prototype.onStartScreenWithData = function(data) {
};

JkWidgetScreenForWidget.prototype.onStopScreen = function() {
	JkWidgetWidget.notifyOnStopScreen(this.myWidget, this);
};

JkWidgetScreenForWidget.prototype.onDestroyScreen = function() {
};

JkWidgetScreenForWidget.prototype.initialize = function() {
	if(this.context == null) {
		this.context = this.createContext();
	}
	var body = JkUiHTMLDOM.getDocumentBody();
	JkUiHTMLDOM.setStyle(body, "overflow", "hidden");
	if(this.captureBrowserBackButton) {
		var myObject = this;
		history.pushState({}, "", "#app");
		window.onpopstate = function(event) {
			myObject.onBackKeyPressEvent();
			history.pushState({}, "", "#app");
		};
		;
	}
};

JkWidgetScreenForWidget.prototype.cleanup = function() {
	window.onresize = null;
	;
};

JkWidgetScreenForWidget.prototype.getWidget = function() {
	return this.myWidget;
};

JkWidgetScreenForWidget.prototype.setWidget = function(widget) {
	if(!(!(this.myWidget != null))) {
		console.log("[jk.widget.ScreenForWidget.setWidget] (ScreenForWidget.sling:850:3): Multiple calls to setWidget()");
		return;
	}
	if(!(widget != null)) {
		return;
	}
	this.myWidget = widget;
	widget.setAllowResize(false);
	widget.element.screenObject = this;
	;
	JkWidgetWidget.addToDomElement(widget, (JkUiHTMLDOM.getDocumentBody()));
	JkWidgetWidget.notifyOnAddedToScreen(widget, this);
};

JkWidgetScreenForWidget.prototype.getCaptureBrowserBackButton = function() {
	return this.captureBrowserBackButton;
};

JkWidgetScreenForWidget.prototype.setCaptureBrowserBackButton = function(v) {
	this.captureBrowserBackButton = v;
	return this;
};

JkWidgetScreenForWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetScreenForWidget"] === true;
};

let JkWidgetLayerWidget = function() {
	JkWidgetContainerWidget.call(this);
	this.widgetMouseOver = null;
	this.widgetMouseOut = null;
	this.widgetMarginLeft = 0;
	this.widgetMarginRight = 0;
	this.widgetMarginTop = 0;
	this.widgetMarginBottom = 0;
	this.widgetWidthRequest = 0;
	this.widgetHeightRequest = 0;
	this.widgetMinimumHeightRequest = 0;
	this.widgetMaximumWidthRequest = 0;
};

JkWidgetLayerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetContainerWidget.prototype);
JkWidgetLayerWidget.prototype.constructor = JkWidgetLayerWidget;
JkWidgetLayerWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetLayerWidget.prototype._tobj = JkWidgetLayerWidget;

JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetLayerWidget;
	return v.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext(context);
};

JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext = function(context) {
	this.widgetMaximumWidthRequest = 0;
	this.widgetMinimumHeightRequest = 0;
	this.widgetHeightRequest = 0;
	this.widgetWidthRequest = 0;
	this.widgetMarginBottom = 0;
	this.widgetMarginTop = 0;
	this.widgetMarginRight = 0;
	this.widgetMarginLeft = 0;
	this.widgetMouseOut = null;
	this.widgetMouseOver = null;
	if(JkWidgetContainerWidget.prototype.CTOR_JkWidgetContainerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetLayerWidget.prototype.prepareElement = function(element) {
	JkWidgetContainerWidget.prototype.prepareElement.call(this, element);
	JkUiHTMLDOM.addEventListener(element, "mouseover", (function() {
		this.onMouseOver();
	}.bind(this)));
	JkUiHTMLDOM.addEventListener(element, "mouseout", (function() {
		this.onMouseOut();
	}.bind(this)));
};

JkWidgetLayerWidget.prototype.onMouseOver = function() {
	if(this.widgetMouseOver != null) {
		this.widgetMouseOver();
	}
};

JkWidgetLayerWidget.prototype.onMouseOut = function() {
	if(this.widgetMouseOut != null) {
		this.widgetMouseOut();
	}
};

JkWidgetLayerWidget.findTopMostLayerWidget = function(widget) {
	var v = null;
	var pp = widget;
	while(pp != null){
		if(JkWidgetLayerWidget.IS_INSTANCE && JkWidgetLayerWidget.IS_INSTANCE(pp)) {
			v = pp;
		}
		pp = JkWidgetWidget.getParent(pp);
	}
	return v;
};

JkWidgetLayerWidget.forContext = function(context) {
	return JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(context);
};

JkWidgetLayerWidget.forMargin = function(context, margin) {
	var v = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetMargin(margin);
	return v;
};

JkWidgetLayerWidget.forWidget = function(context, widget, margin) {
	var v = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetMargin(margin);
	v.addWidget(widget);
	return v;
};

JkWidgetLayerWidget.forWidgetAndWidth = function(context, widget, width) {
	var v = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(context);
	v.addWidget(widget);
	v.setWidgetWidthRequest(width);
	return v;
};

JkWidgetLayerWidget.forWidgets = function(context, widgets, margin) {
	var v = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetMargin(margin);
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

JkWidgetLayerWidget.prototype.setWidgetMaximumWidthRequest = function(width) {
	this.widgetMaximumWidthRequest = width;
	if(JkWidgetWidget.getWidth(this) > width) {
		JkWidgetWidget.onLayoutChanged(this);
	}
	return this;
};

JkWidgetLayerWidget.prototype.getWidgetMaximumWidthRequest = function() {
	return this.widgetMaximumWidthRequest;
};

JkWidgetLayerWidget.prototype.setWidgetWidthRequest = function(request) {
	this.widgetWidthRequest = request;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetLayerWidget.prototype.getWidgetWidthRequest = function() {
	return this.widgetWidthRequest;
};

JkWidgetLayerWidget.prototype.setWidgetHeightRequest = function(request) {
	this.widgetHeightRequest = request;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetLayerWidget.prototype.getWidgetHeightRequest = function() {
	return this.widgetHeightRequest;
};

JkWidgetLayerWidget.prototype.setWidgetMinimumHeightRequest = function(request) {
	this.widgetMinimumHeightRequest = request;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetLayerWidget.prototype.getWidgetMinimumHeightRequest = function() {
	return this.widgetMinimumHeightRequest;
};

JkWidgetLayerWidget.prototype.setWidgetMargin = function(margin) {
	this.widgetMarginLeft = margin;
	this.widgetMarginRight = margin;
	this.widgetMarginTop = margin;
	this.widgetMarginBottom = margin;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetLayerWidget.prototype.getWidgetMarginLeft = function() {
	return this.widgetMarginLeft;
};

JkWidgetLayerWidget.prototype.setWidgetMarginLeft = function(value) {
	this.widgetMarginLeft = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetLayerWidget.prototype.getWidgetMarginRight = function() {
	return this.widgetMarginRight;
};

JkWidgetLayerWidget.prototype.setWidgetMarginRight = function(value) {
	this.widgetMarginRight = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetLayerWidget.prototype.getWidgetMarginTop = function() {
	return this.widgetMarginTop;
};

JkWidgetLayerWidget.prototype.setWidgetMarginTop = function(value) {
	this.widgetMarginTop = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetLayerWidget.prototype.getWidgetMarginBottom = function() {
	return this.widgetMarginBottom;
};

JkWidgetLayerWidget.prototype.setWidgetMarginBottom = function(value) {
	this.widgetMarginBottom = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetLayerWidget.prototype.onWidgetHeightChanged = function(height) {
	JkWidgetContainerWidget.prototype.onWidgetHeightChanged.call(this, height);
	var mh = height - this.widgetMarginTop - this.widgetMarginBottom;
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.resizeHeight(child, mh);
			}
		}
	}
};

JkWidgetLayerWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	var wc = widthConstraint;
	if(wc < 0 && this.widgetWidthRequest > 0) {
		wc = this.widgetWidthRequest;
	}
	if(wc >= 0) {
		wc = wc - this.widgetMarginLeft - this.widgetMarginRight;
		if(wc < 0) {
			wc = 0;
		}
	}
	var mw = 0;
	var mh = 0;
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.layout(child, wc, false);
				JkWidgetWidget.move(child, this.widgetMarginLeft, this.widgetMarginTop);
				var cw = JkWidgetWidget.getWidth(child);
				if(wc < 0 && this.widgetMaximumWidthRequest > 0 && cw + this.widgetMarginLeft + this.widgetMarginRight > this.widgetMaximumWidthRequest) {
					JkWidgetWidget.layout(child, (this.widgetMaximumWidthRequest - this.widgetMarginLeft - this.widgetMarginRight), false);
					cw = JkWidgetWidget.getWidth(child);
				}
				var ch = JkWidgetWidget.getHeight(child);
				if(cw > mw) {
					mw = cw;
				}
				if(ch > mh) {
					mh = ch;
				}
			}
		}
	}
	var fw = widthConstraint;
	if(this.widgetWidthRequest > 0 && mw <= 0) {
		fw = this.widgetWidthRequest;
	}
	if(fw < 0) {
		fw = mw + this.widgetMarginLeft + this.widgetMarginRight;
	}
	var fh = mh + this.widgetMarginTop + this.widgetMarginBottom;
	if(this.widgetHeightRequest > 0) {
		fh = this.widgetHeightRequest;
	}
	if(this.widgetMinimumHeightRequest > 0 && fh < this.widgetMinimumHeightRequest) {
		fh = this.widgetMinimumHeightRequest;
	}
	JkWidgetWidget.setLayoutSize(this, fw, fh);
	mw = JkWidgetWidget.getWidth(this) - this.widgetMarginLeft - this.widgetMarginRight;
	mh = JkWidgetWidget.getHeight(this) - this.widgetMarginTop - this.widgetMarginBottom;
	var array2 = JkWidgetWidget.getChildren(this);
	if(array2 != null) {
		var n2 = 0;
		var m2 = array2.length;
		for(n2 = 0 ; n2 < m2 ; n2++) {
			var child1 = array2[n2];
			if(child1 != null) {
				if(wc < 0) {
					JkWidgetWidget.layout(child1, mw, false);
				}
				JkWidgetWidget.resizeHeight(child1, mh);
			}
		}
	}
};

JkWidgetLayerWidget.prototype.removeAllChildren = function() {
	JkWidgetWidget.removeChildrenOf(this);
};

JkWidgetLayerWidget.prototype.getChildWidget = function(index) {
	var children = JkWidgetWidget.getChildren(this);
	if(!(children != null)) {
		return null;
	}
	return JkLangVector.get(children, index);
};

JkWidgetLayerWidget.prototype.getWidgetMouseOver = function() {
	return this.widgetMouseOver;
};

JkWidgetLayerWidget.prototype.setWidgetMouseOver = function(v) {
	this.widgetMouseOver = v;
	return this;
};

JkWidgetLayerWidget.prototype.getWidgetMouseOut = function() {
	return this.widgetMouseOut;
};

JkWidgetLayerWidget.prototype.setWidgetMouseOut = function(v) {
	this.widgetMouseOut = v;
	return this;
};

JkWidgetLayerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetLayerWidget"] === true;
};

let JkWidgetVerticalScrollerWidget = function() {
	JkWidgetWidget.call(this);
	this.currentScrollY = 0;
	this.lastScrollY = 0;
	this.nearEnd = false;
	this.onScrolledHandler = null;
	this.onEndScrollHandler = null;
	this.layoutHeight = -1;
	this.heightChanged = false;
};

JkWidgetVerticalScrollerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetVerticalScrollerWidget.prototype.constructor = JkWidgetVerticalScrollerWidget;
JkWidgetVerticalScrollerWidget.prototype._t = {
	"JkWidgetVerticalScrollerWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetVerticalScrollerWidget.prototype._tobj = JkWidgetVerticalScrollerWidget;

JkWidgetVerticalScrollerWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetVerticalScrollerWidget;
	return v.CTOR_JkWidgetVerticalScrollerWidget_JkUiGuiApplicationContext(context);
};

JkWidgetVerticalScrollerWidget.prototype.CTOR_JkWidgetVerticalScrollerWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.heightChanged = false;
	this.layoutHeight = -1;
	this.onEndScrollHandler = null;
	this.onScrolledHandler = null;
	this.nearEnd = false;
	this.lastScrollY = 0;
	this.currentScrollY = 0;
	return this;
};

JkWidgetVerticalScrollerWidget.forWidget = function(context, widget) {
	var v = JkWidgetVerticalScrollerWidget.NEW_JkUiGuiApplicationContext(context);
	v.addWidget(widget);
	return v;
};

JkWidgetVerticalScrollerWidget.prototype.createElement = function() {
	var v = JkUiHTMLDOM.createElement("div");
	JkUiHTMLDOM.addToClassList(v, "VerticalScrollerWidget");
	return v;
};

JkWidgetVerticalScrollerWidget.prototype.prepareElement = function(element) {
	JkWidgetWidget.prototype.prepareElement.call(this, element);
	if(JkUiHTMLDOM.isFirefox() == false) {
		JkUiHTMLDOM.setStyle(element, "overflow-y", "scroll");
		if(JkUiHTMLDOM.isSafari()) {
			JkUiHTMLDOM.setStyle(element, "-webkit-overflow-scrolling", "touch");
		}
	}
	else {
		JkUiHTMLDOM.removeStyle(element, "overflow");
		JkUiHTMLDOM.setStyle(element, "overflow-x", "hidden");
	}
	JkUiHTMLDOM.addEventListener(element, "scroll", (function() {
		this.onScroll(element.scrollTop);
	}.bind(this)));
};

JkWidgetVerticalScrollerWidget.createNoScrollBarStyle = function() {
	if(JkWidgetVerticalScrollerWidget.noScrollBarStyleCreated) {
		return;
	}
	var styleElement = JkUiHTMLDOM.createElement("style");
	var className = "." + ("VerticalScrollerWidget") + ("WithNoScrollBar");
	var style = null;
	if(JkUiHTMLDOM.isWebKit()) {
		style = (JkLangString.safeString(className)) + ("::-webkit-scrollbar { display: none; }");
	}
	else if(JkUiHTMLDOM.isFirefox()) {
		if(!JkUiHTMLDOM.isMobile()) {
			style = (JkLangString.safeString(className)) + (" { overflow-y: hidden; }\n") + (JkLangString.safeString(className)) + (":hover { overflow-y: auto; }");
		}
	}
	if(style != null) {
		JkUiHTMLDOM.setTextContent(styleElement, style);
		JkUiHTMLDOM.appendChild((JkUiHTMLDOM.getDocumentHead()), styleElement);
	}
	JkWidgetVerticalScrollerWidget.noScrollBarStyleCreated = true;
};

JkWidgetVerticalScrollerWidget.prototype.isNearEnd = function() {
	return this.nearEnd;
};

JkWidgetVerticalScrollerWidget.prototype.onScroll = function(scrollY) {
	this.currentScrollY = scrollY;
	var ch = JkWidgetWidget.getHeight((JkLangVector.get((JkWidgetWidget.getChildren(this)), 0)));
	if(ch > 0) {
		this.nearEnd = ch - this.currentScrollY < JkWidgetWidget.getHeight(this) * 2 ? true : false;
	}
	if(this.onEndScrollHandler != null && ch - (scrollY + JkWidgetWidget.getHeight(this)) == 0) {
		this.onEndScrollHandler();
	}
	if(this.onScrolledHandler != null && this.lastScrollY != this.currentScrollY) {
		this.onScrolledHandler((this.lastScrollY < this.currentScrollY ? 0 : 1));
		this.lastScrollY = this.currentScrollY;
	}
};

JkWidgetVerticalScrollerWidget.prototype.setWidgetScrollBarDisabled = function(value) {
	if(value) {
		JkWidgetVerticalScrollerWidget.createNoScrollBarStyle();
		JkUiHTMLDOM.setStyle(this.element, "-ms-overflow-style", "none");
		JkUiHTMLDOM.addToClassList(this.element, "VerticalScrollerWidget" + ("WithNoScrollBar"));
	}
	else {
		JkUiHTMLDOM.setStyle(this.element, "-ms-overflow-style", "scrollbar");
		JkUiHTMLDOM.removeFromClassList(this.element, "VerticalScrollerWidget" + ("WithNoScrollBar"));
	}
};

JkWidgetVerticalScrollerWidget.prototype.onWidgetHeightChanged = function(height) {
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				if(height > this.layoutHeight) {
					JkWidgetWidget.resizeHeight(child, height);
				}
				else {
					JkWidgetWidget.resizeHeight(child, this.layoutHeight);
				}
			}
		}
	}
	this.heightChanged = true;
};

JkWidgetVerticalScrollerWidget.prototype.setWidgetLayoutChanged = function() {
};

JkWidgetVerticalScrollerWidget.prototype.hasWidgetLayoutChanged = function() {
	return false;
};

JkWidgetVerticalScrollerWidget.prototype.layoutWidget = function(widthConstraint, force) {
	var mw = 0;
	var mh = 0;
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.move(child, 0, 0);
				JkWidgetWidget.layout(child, widthConstraint, this.heightChanged);
				var cw = JkWidgetWidget.getWidth(child);
				var ch = JkWidgetWidget.getHeight(child);
				if(cw > mw) {
					mw = cw;
				}
				if(ch > mh) {
					mh = ch;
				}
			}
		}
	}
	var mh2 = mh;
	var eh = JkWidgetWidget.getHeight(this);
	if(eh > 0 && mh2 > eh) {
		mh2 = eh;
	}
	this.heightChanged = false;
	this.layoutHeight = mh;
	JkWidgetWidget.setLayoutSize(this, mw, mh2);
	var array2 = JkWidgetWidget.getChildren(this);
	if(array2 != null) {
		var n2 = 0;
		var m2 = array2.length;
		for(n2 = 0 ; n2 < m2 ; n2++) {
			var child1 = array2[n2];
			if(child1 != null) {
				JkWidgetWidget.resizeHeight(child1, mh);
			}
		}
	}
	return true;
};

JkWidgetVerticalScrollerWidget.prototype.addWidget = function(widget) {
	JkWidgetWidget.addChild(this, widget);
	return this;
};

JkWidgetVerticalScrollerWidget.prototype.scrollToBottom = function(animate) {
	var child = JkLangVector.get((JkWidgetWidget.getChildren(this)), 0);
	if(!(child != null)) {
		return;
	}
	var y = JkWidgetWidget.getHeight(child) - JkWidgetWidget.getHeight(this);
	if(!(y > 0)) {
		return;
	}
	var x = JkWidgetWidget.getX(child);
	this.element.scrollTop = this.element.scrollHeight;
	;
};

JkWidgetVerticalScrollerWidget.prototype.getOnScrolledHandler = function() {
	return this.onScrolledHandler;
};

JkWidgetVerticalScrollerWidget.prototype.setOnScrolledHandler = function(v) {
	this.onScrolledHandler = v;
	return this;
};

JkWidgetVerticalScrollerWidget.prototype.getOnEndScrollHandler = function() {
	return this.onEndScrollHandler;
};

JkWidgetVerticalScrollerWidget.prototype.setOnEndScrollHandler = function(v) {
	this.onEndScrollHandler = v;
	return this;
};

JkWidgetVerticalScrollerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetVerticalScrollerWidget"] === true;
};

JkWidgetVerticalScrollerWidget.noScrollBarStyleCreated = false;

let JkWidgetSwitcherWidget = function() {
	JkWidgetLayerWidget.call(this);
};

JkWidgetSwitcherWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetSwitcherWidget.prototype.constructor = JkWidgetSwitcherWidget;
JkWidgetSwitcherWidget.prototype._t = {
	"JkWidgetSwitcherWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetSwitcherWidget.prototype._tobj = JkWidgetSwitcherWidget;

JkWidgetSwitcherWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetSwitcherWidget;
	return v.CTOR_JkWidgetSwitcherWidget_JkUiGuiApplicationContext(context);
};

JkWidgetSwitcherWidget.prototype.CTOR_JkWidgetSwitcherWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetSwitcherWidget.prototype.replaceWith = function(widget) {
	this.removeAllChildren();
	if(widget != null) {
		JkWidgetLayerWidget.prototype.addWidget.call(this, widget);
		if(widget != null && (JkWidgetDisplayAwareWidget.IS_INSTANCE && JkWidgetDisplayAwareWidget.IS_INSTANCE(widget))) {
			widget.onWidgetDisplayed();
		}
	}
};

JkWidgetSwitcherWidget.prototype.addWidget = function(widget) {
	JkWidgetLayerWidget.prototype.addWidget.call(this, widget);
	JkWidgetWidget.setVisible(widget, false);
	return this;
};

JkWidgetSwitcherWidget.prototype.showWidget = function(widget) {
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var ww = array[n];
			if(ww != null) {
				if(ww != widget) {
					JkWidgetWidget.setVisible(ww, false);
				}
			}
		}
	}
	if(widget != null) {
		JkWidgetWidget.setVisible(widget, true);
		if(JkWidgetDisplayAwareWidget.IS_INSTANCE && JkWidgetDisplayAwareWidget.IS_INSTANCE(widget)) {
			widget.onWidgetDisplayed();
		}
	}
};

JkWidgetSwitcherWidget.prototype.showWidgetWithIndex = function(index) {
	this.showWidget((JkLangVector.get((JkWidgetWidget.getChildren(this)), index)));
};

JkWidgetSwitcherWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetSwitcherWidget"] === true;
};

let JkWidgetTitledWidget = {};

JkWidgetTitledWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetTitledWidget"] === true;
};

let JkWidgetMenuEntry = function() {
	this.title = null;
	this.handler = null;
};

JkWidgetMenuEntry.prototype._t = { "JkWidgetMenuEntry" : true };
JkWidgetMenuEntry.prototype._tobj = JkWidgetMenuEntry;

JkWidgetMenuEntry.NEW = function() {
	var v = new JkWidgetMenuEntry;
	return v.CTOR_JkWidgetMenuEntry();
};

JkWidgetMenuEntry.prototype.CTOR_JkWidgetMenuEntry = function() {
	this.handler = null;
	this.title = null;
	return this;
};

JkWidgetMenuEntry.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetMenuEntry"] === true;
};

let JkWidgetMenu = function() {
	this.entries = null;
};

JkWidgetMenu.prototype._t = { "JkWidgetMenu" : true };
JkWidgetMenu.prototype._tobj = JkWidgetMenu;

JkWidgetMenu.NEW = function() {
	var v = new JkWidgetMenu;
	return v.CTOR_JkWidgetMenu();
};

JkWidgetMenu.prototype.CTOR_JkWidgetMenu = function() {
	this.entries = null;
	return this;
};

JkWidgetMenu.prototype.addEntry1 = function(entry) {
	if(!(entry != null)) {
		return;
	}
	if(!(this.entries != null)) {
		this.entries = new Array;
	}
	this.entries.push(entry);
};

JkWidgetMenu.prototype.addEntry2 = function(title, handler) {
	var e = JkWidgetMenuEntry.NEW();
	e.title = title;
	e.handler = handler;
	this.addEntry1(e);
};

JkWidgetMenu.prototype.getEntries = function() {
	return this.entries;
};

JkWidgetMenu.prototype.setEntries = function(v) {
	this.entries = v;
	return this;
};

JkWidgetMenu.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetMenu"] === true;
};

let JkWidgetLayerWithBackgroundColorWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetColor = null;
	this.widgetOutlineColor = JkGfxColor.black();
	this.widgetOutlineWidth = 0;
	this.widgetBorderStyle = 0;
	this.widgetTopLeftRadius = 0.0;
	this.widgetTopRightRadius = 0.0;
	this.widgetBottomRightRadius = 0.0;
	this.widgetBottomLeftRadius = 0.0;
	this.widgetBorderLeftWidth = -1;
	this.widgetBorderRightWidth = -1;
	this.widgetBorderTopWidth = -1;
	this.widgetBorderBottomWidth = -1;
	this.widgetBorderLeftColor = JkGfxColor.black();
	this.widgetBorderRightColor = JkGfxColor.black();
	this.widgetBorderTopColor = JkGfxColor.black();
	this.widgetBorderBottomColor = JkGfxColor.black();
	this.widgetBorderLeftStyle = 0;
	this.widgetBorderRightStyle = 0;
	this.widgetBorderTopStyle = 0;
	this.widgetBorderBottomStyle = 0;
};

JkWidgetLayerWithBackgroundColorWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetLayerWithBackgroundColorWidget.prototype.constructor = JkWidgetLayerWithBackgroundColorWidget;
JkWidgetLayerWithBackgroundColorWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetLayerWithBackgroundColorWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetLayerWithBackgroundColorWidget.prototype._tobj = JkWidgetLayerWithBackgroundColorWidget;

JkWidgetLayerWithBackgroundColorWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetLayerWithBackgroundColorWidget;
	return v.CTOR_JkWidgetLayerWithBackgroundColorWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.CTOR_JkWidgetLayerWithBackgroundColorWidget_JkUiGuiApplicationContext = function(ctx) {
	this.widgetBorderBottomStyle = 0;
	this.widgetBorderTopStyle = 0;
	this.widgetBorderRightStyle = 0;
	this.widgetBorderLeftStyle = 0;
	this.widgetBorderBottomColor = JkGfxColor.black();
	this.widgetBorderTopColor = JkGfxColor.black();
	this.widgetBorderRightColor = JkGfxColor.black();
	this.widgetBorderLeftColor = JkGfxColor.black();
	this.widgetBorderBottomWidth = -1;
	this.widgetBorderTopWidth = -1;
	this.widgetBorderRightWidth = -1;
	this.widgetBorderLeftWidth = -1;
	this.widgetBottomLeftRadius = 0.0;
	this.widgetBottomRightRadius = 0.0;
	this.widgetTopRightRadius = 0.0;
	this.widgetTopLeftRadius = 0.0;
	this.widgetBorderStyle = 0;
	this.widgetOutlineWidth = 0;
	this.widgetOutlineColor = JkGfxColor.black();
	this.widgetColor = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	return this;
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetColor = function(color) {
	this.widgetColor = color;
	if(this.widgetColor != null) {
		JkUiHTMLDOM.setStyle(this.element, "background-color", (JkUiHTMLDOM.colorToRGBA(this.widgetColor)));
	}
	else {
		JkUiHTMLDOM.removeStyle(this.element, "background-color");
	}
	return this;
};

JkWidgetLayerWithBackgroundColorWidget.prototype.getWidgetColor = function() {
	return this.widgetColor;
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetOutlineColor = function(color) {
	this.widgetOutlineColor = color;
	this.updateWidgetBorder((-1), this.widgetOutlineWidth, this.widgetOutlineColor, this.widgetBorderStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.getWidgetOutlineColor = function() {
	return this.widgetOutlineColor;
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetOutlineWidth = function(width) {
	this.widgetOutlineWidth = width;
	this.updateWidgetBorder((-1), this.widgetOutlineWidth, this.widgetOutlineColor, this.widgetBorderStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.getWidgetOutlineWidth = function() {
	return this.widgetOutlineWidth;
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetBorderLeftWidth = function(sz) {
	this.widgetBorderLeftWidth = sz;
	this.updateWidgetBorder(JkWidgetLayerWithBackgroundColorWidget.LEFT_SIDE, this.widgetBorderLeftWidth, this.widgetBorderLeftColor, this.widgetBorderLeftStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetBorderRightWidth = function(sz) {
	this.widgetBorderRightWidth = sz;
	this.updateWidgetBorder(JkWidgetLayerWithBackgroundColorWidget.RIGHT_SIDE, this.widgetBorderRightWidth, this.widgetBorderRightColor, this.widgetBorderRightStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetBorderTopWidth = function(sz) {
	this.widgetBorderTopWidth = sz;
	this.updateWidgetBorder(JkWidgetLayerWithBackgroundColorWidget.TOP_SIDE, this.widgetBorderTopWidth, this.widgetBorderTopColor, this.widgetBorderTopStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetBorderBottomWidth = function(sz) {
	this.widgetBorderBottomWidth = sz;
	this.updateWidgetBorder(JkWidgetLayerWithBackgroundColorWidget.BOTTOM_SIDE, this.widgetBorderBottomWidth, this.widgetBorderBottomColor, this.widgetBorderBottomStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetBorderBottomColor = function(color) {
	this.widgetBorderBottomColor = color;
	this.updateWidgetBorder(JkWidgetLayerWithBackgroundColorWidget.BOTTOM_SIDE, this.widgetBorderBottomWidth, this.widgetBorderBottomColor, this.widgetBorderBottomStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetBorderTopColor = function(color) {
	this.widgetBorderTopColor = color;
	this.updateWidgetBorder(JkWidgetLayerWithBackgroundColorWidget.TOP_SIDE, this.widgetBorderTopWidth, this.widgetBorderTopColor, this.widgetBorderTopStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetBorderRightColor = function(color) {
	this.widgetBorderRightColor = color;
	this.updateWidgetBorder(JkWidgetLayerWithBackgroundColorWidget.RIGHT_SIDE, this.widgetBorderRightWidth, this.widgetBorderRightColor, this.widgetBorderRightStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetBorderLeftColor = function(color) {
	this.widgetBorderLeftColor = color;
	this.updateWidgetBorder(JkWidgetLayerWithBackgroundColorWidget.LEFT_SIDE, this.widgetBorderLeftWidth, this.widgetBorderLeftColor, this.widgetBorderLeftStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetBorderStyle = function(style) {
	this.widgetBorderStyle = style;
	this.updateWidgetBorder((-1), this.widgetOutlineWidth, this.widgetOutlineColor, this.widgetBorderStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetBorderLeftStyle = function(style) {
	this.widgetBorderLeftStyle = style;
	this.updateWidgetBorder(JkWidgetLayerWithBackgroundColorWidget.LEFT_SIDE, this.widgetBorderLeftWidth, this.widgetBorderLeftColor, this.widgetBorderLeftStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetBorderRightStyle = function(style) {
	this.widgetBorderRightStyle = style;
	this.updateWidgetBorder(JkWidgetLayerWithBackgroundColorWidget.RIGHT_SIDE, this.widgetBorderRightWidth, this.widgetBorderRightColor, this.widgetBorderRightStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetBorderTopStyle = function(style) {
	this.widgetBorderTopStyle = style;
	this.updateWidgetBorder(JkWidgetLayerWithBackgroundColorWidget.TOP_SIDE, this.widgetBorderTopWidth, this.widgetBorderTopColor, this.widgetBorderTopStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetBorderBottomStyle = function(style) {
	this.widgetBorderBottomStyle = style;
	this.updateWidgetBorder(JkWidgetLayerWithBackgroundColorWidget.BOTTOM_SIDE, this.widgetBorderBottomWidth, this.widgetBorderBottomColor, this.widgetBorderBottomStyle);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.updateWidgetBorder = function(borderSide, borderWidth, borderColor, borderStyle) {
	var borderSideString = "border";
	if(borderSide == JkWidgetLayerWithBackgroundColorWidget.TOP_SIDE) {
		borderSideString = "border-top";
	}
	if(borderSide == JkWidgetLayerWithBackgroundColorWidget.LEFT_SIDE) {
		borderSideString = "border-left";
	}
	if(borderSide == JkWidgetLayerWithBackgroundColorWidget.BOTTOM_SIDE) {
		borderSideString = "border-bottom";
	}
	if(borderSide == JkWidgetLayerWithBackgroundColorWidget.RIGHT_SIDE) {
		borderSideString = "border-right";
	}
	var borderStyleString = "solid";
	if(borderStyle == JkWidgetCanvasWidget.BORDER_STYLE_DASHED) {
		borderStyleString = "dashed";
	}
	if(borderStyle == JkWidgetCanvasWidget.BORDER_STYLE_DOTTED) {
		borderStyleString = "dotted";
	}
	if(borderStyle == JkWidgetCanvasWidget.BORDER_STYLE_NONE) {
		borderStyleString = "none";
	}
	if(borderWidth < 0) {
		JkUiHTMLDOM.removeStyle(this.element, borderSideString);
		JkUiHTMLDOM.removeStyle(this.element, (JkLangString.safeString(borderSideString)) + ("-color"));
		JkUiHTMLDOM.removeStyle(this.element, (JkLangString.safeString(borderSideString)) + ("-style"));
		JkUiHTMLDOM.removeStyle(this.element, "box-sizing");
	}
	else {
		JkUiHTMLDOM.setStyle(this.element, borderSideString, (JkLangString.safeString((JkLangString.forInteger(borderWidth)))) + ("px"));
		JkUiHTMLDOM.setStyle(this.element, (JkLangString.safeString(borderSideString)) + ("-style"), borderStyleString);
		JkUiHTMLDOM.setStyle(this.element, (JkLangString.safeString(borderSideString)) + ("-color"), (borderColor.toRgbString()));
		JkUiHTMLDOM.setStyle(this.element, "box-sizing", "border-box");
	}
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetRoundingRadiusTopLeft = function(radius) {
	this.widgetTopLeftRadius = radius;
	this.updateCanvasRoundingRadius();
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetRoundingRadiusTopRight = function(radius) {
	this.widgetTopRightRadius = radius;
	this.updateCanvasRoundingRadius();
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetRoundingRadiusBottomLeft = function(radius) {
	this.widgetBottomLeftRadius = radius;
	this.updateCanvasRoundingRadius();
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetRoundingRadiusBottomRight = function(radius) {
	this.widgetBottomRightRadius = radius;
	this.updateCanvasRoundingRadius();
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetRoundingRadius1 = function(radius) {
	this.setWidgetRoundingRadius3(radius, radius, radius, radius);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetRoundingRadius2 = function(lradius, rradius) {
	this.setWidgetRoundingRadius3(lradius, rradius, rradius, lradius);
};

JkWidgetLayerWithBackgroundColorWidget.prototype.setWidgetRoundingRadius3 = function(tlradius, trradius, brradius, blradius) {
	this.widgetTopLeftRadius = tlradius;
	this.widgetTopRightRadius = trradius;
	this.widgetBottomRightRadius = brradius;
	this.widgetBottomLeftRadius = blradius;
	this.updateCanvasRoundingRadius();
};

JkWidgetLayerWithBackgroundColorWidget.prototype.updateCanvasRoundingRadius = function() {
	var isRounded = true;
	if(this.widgetTopLeftRadius <= 0.0 && this.widgetTopRightRadius <= 0.0 && this.widgetBottomRightRadius <= 0.0 && this.widgetBottomLeftRadius <= 0.0) {
		isRounded = false;
	}
	if(isRounded) {
		JkUiHTMLDOM.setStyle(this.element, "border-radius", (JkLangString.safeString((JkLangString.forDouble(this.widgetTopLeftRadius)))) + ("px ") + (JkLangString.safeString((JkLangString.forDouble(this.widgetTopRightRadius)))) + ("px ") + (JkLangString.safeString((JkLangString.forDouble(this.widgetBottomRightRadius)))) + ("px ") + (JkLangString.safeString((JkLangString.forDouble(this.widgetBottomLeftRadius)))) + ("px"));
	}
	else {
		JkUiHTMLDOM.removeStyle(this.element, "border-radius");
	}
};

JkWidgetLayerWithBackgroundColorWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetLayerWithBackgroundColorWidget"] === true;
};

JkWidgetLayerWithBackgroundColorWidget.TOP_SIDE = 0;
JkWidgetLayerWithBackgroundColorWidget.LEFT_SIDE = 1;
JkWidgetLayerWithBackgroundColorWidget.BOTTOM_SIDE = 2;
JkWidgetLayerWithBackgroundColorWidget.RIGHT_SIDE = 3;

let JkWidgetImageWidget = function() {
	JkWidgetWidget.call(this);
	this.widgetContext = null;
	this.widgetImage = null;
	this.widgetImageWidth = 0;
	this.widgetImageHeight = 0;
	this.widgetImageRounded = false;
	this.widgetImageScaleMethod = 0;
	this.lastLayoutWidth = 0;
};

JkWidgetImageWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetImageWidget.prototype.constructor = JkWidgetImageWidget;
JkWidgetImageWidget.prototype._t = {
	"JkWidgetImageWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetImageWidget.prototype._tobj = JkWidgetImageWidget;

JkWidgetImageWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetImageWidget;
	return v.CTOR_JkWidgetImageWidget_JkUiGuiApplicationContext(context);
};

JkWidgetImageWidget.prototype.CTOR_JkWidgetImageWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.lastLayoutWidth = 0;
	this.widgetImageScaleMethod = 0;
	this.widgetImageRounded = false;
	this.widgetImageHeight = 0;
	this.widgetImageWidth = 0;
	this.widgetImage = null;
	this.widgetContext = null;
	this.widgetContext = context;
	this.setWidgetImageScaleMethod(JkWidgetImageWidget.STRETCH);
	return this;
};

JkWidgetImageWidget.forImage = function(context, image) {
	var v = JkWidgetImageWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetImage(image);
	return v;
};

JkWidgetImageWidget.forImageResource = function(context, resName) {
	var v = JkWidgetImageWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetImageResource(resName);
	return v;
};

JkWidgetImageWidget.prototype.createElement = function() {
	return JkUiHTMLDOM.createElement("img");
};

JkWidgetImageWidget.prototype.doSetWidgetImage = function(image) {
	var src = null;
	var img = (function(o) {
		if(JkUiImageForBrowser.IS_INSTANCE && JkUiImageForBrowser.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(image);
	if(img != null) {
		var bm = img.image;
		if(bm != null) {
			src = bm.src;
		}
		JkUiHTMLDOM.removeStyle(this.element, "display");
	}
	else {
		JkUiHTMLDOM.setStyle(this.element, "display", "none");
	}
	JkUiHTMLDOM.setAttribute(this.element, "src", src);
};

JkWidgetImageWidget.prototype.setWidgetImageScaleMethod = function(method) {
	this.widgetImageScaleMethod = method;
	if(method == JkWidgetImageWidget.STRETCH) {
		JkUiHTMLDOM.setStyle(this.element, "object-fit", "fill");
	}
	else if(method == JkWidgetImageWidget.FIT) {
		JkUiHTMLDOM.setStyle(this.element, "object-fit", "contain");
	}
	else if(method == JkWidgetImageWidget.FILL) {
		JkUiHTMLDOM.setStyle(this.element, "object-fit", "cover");
	}
	else {
		JkLogLog.warning(this.widgetContext, "Unsupported image scale method: " + (JkLangString.safeString((JkLangString.forInteger(method)))));
		JkUiHTMLDOM.setStyle(this.element, "object-fit", "fill");
	}
};

JkWidgetImageWidget.prototype.setWidgetImage = function(image) {
	if(this.widgetImageRounded) {
		JkUiImageUtil.createCircularImage(image, (function(nimage1) {
			this.widgetImage = nimage1;
			this.doSetWidgetImage(nimage1);
		}.bind(this)));
	}
	else {
		this.widgetImage = image;
		this.doSetWidgetImage(this.widgetImage);
	}
	JkWidgetWidget.onLayoutChanged(this);
};

JkWidgetImageWidget.prototype.setWidgetImageResource = function(resName) {
	var img = null;
	if(JkLangString.isEmpty(resName) == false && this.widgetContext != null) {
		img = this.widgetContext.getResourceImage(resName);
		if(img == null) {
			JkLogLog.error(this.widgetContext, "Failed to get resource image: `" + (JkLangString.safeString(resName)) + ("'"));
		}
	}
	this.setWidgetImage(img);
};

JkWidgetImageWidget.prototype.setWidgetLayoutChanged = function() {
};

JkWidgetImageWidget.prototype.hasWidgetLayoutChanged = function() {
	return false;
};

JkWidgetImageWidget.prototype.layoutWidget = function(widthConstraint, force) {
	if(widthConstraint >= 0 && widthConstraint == this.lastLayoutWidth) {
		return true;
	}
	if(this.widgetImage == null) {
		JkWidgetWidget.setLayoutSize(this, this.widgetImageWidth, this.widgetImageHeight);
		this.lastLayoutWidth = JkWidgetWidget.getWidth(this);
		return true;
	}
	if(widthConstraint < 0 && this.widgetImageWidth < 1 && this.widgetImageHeight < 1) {
		return false;
	}
	var width = -1;
	var height = -1;
	if(this.widgetImageWidth > 0 && this.widgetImageHeight > 0) {
		width = this.widgetImageWidth;
		height = this.widgetImageHeight;
	}
	else if(this.widgetImageWidth > 0) {
		width = this.widgetImageWidth;
	}
	else if(this.widgetImageHeight > 0) {
		height = this.widgetImageHeight;
	}
	else {
		width = widthConstraint;
	}
	if(width > 0 && widthConstraint >= 0 && width > widthConstraint) {
		width = widthConstraint;
		height = -1;
	}
	if(height < 0) {
		height = this.widgetImage.getPixelHeight() * width / this.widgetImage.getPixelWidth();
	}
	if(width < 0) {
		width = this.widgetImage.getPixelWidth() * height / this.widgetImage.getPixelHeight();
	}
	JkWidgetWidget.setLayoutSize(this, width, height);
	this.lastLayoutWidth = JkWidgetWidget.getWidth(this);
	return true;
};

JkWidgetImageWidget.prototype.getWidgetImageWidth = function() {
	return this.widgetImageWidth;
};

JkWidgetImageWidget.prototype.setWidgetImageWidth = function(v) {
	this.widgetImageWidth = v;
	return this;
};

JkWidgetImageWidget.prototype.getWidgetImageHeight = function() {
	return this.widgetImageHeight;
};

JkWidgetImageWidget.prototype.setWidgetImageHeight = function(v) {
	this.widgetImageHeight = v;
	return this;
};

JkWidgetImageWidget.prototype.getWidgetImageRounded = function() {
	return this.widgetImageRounded;
};

JkWidgetImageWidget.prototype.setWidgetImageRounded = function(v) {
	this.widgetImageRounded = v;
	return this;
};

JkWidgetImageWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetImageWidget"] === true;
};

JkWidgetImageWidget.STRETCH = 0;
JkWidgetImageWidget.FIT = 1;
JkWidgetImageWidget.FILL = 2;

let JkWidgetGridWidget = function() {
	JkWidgetContainerWidget.call(this);
	this.widgetCellSize = -1;
	this.minimumCols = 2;
	this.maximumCols = 0;
	this.widgetSpacing = 0;
	this.widgetMargin = 0;
};

JkWidgetGridWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetContainerWidget.prototype);
JkWidgetGridWidget.prototype.constructor = JkWidgetGridWidget;
JkWidgetGridWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetGridWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetGridWidget.prototype._tobj = JkWidgetGridWidget;

JkWidgetGridWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetGridWidget;
	return v.CTOR_JkWidgetGridWidget_JkUiGuiApplicationContext(context);
};

JkWidgetGridWidget.prototype.CTOR_JkWidgetGridWidget_JkUiGuiApplicationContext = function(context) {
	this.widgetMargin = 0;
	this.widgetSpacing = 0;
	this.maximumCols = 0;
	this.minimumCols = 2;
	this.widgetCellSize = -1;
	if(JkWidgetContainerWidget.prototype.CTOR_JkWidgetContainerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetGridWidget.forContext = function(context) {
	return JkWidgetGridWidget.NEW_JkUiGuiApplicationContext(context);
};

JkWidgetGridWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	var rows = 0;
	var cols = 0;
	var children = JkWidgetWidget.getChildren(this);
	if(children == null) {
		return;
	}
	var childCount = JkLangVector.getSize(children);
	if(childCount < 1) {
		return;
	}
	var wcs = this.widgetCellSize;
	if(wcs < 1) {
		wcs = this.context.getWidthValue("25mm");
	}
	var adjustWcs = false;
	var mywidth = widthConstraint - this.widgetMargin - this.widgetMargin;
	if(widthConstraint < 0) {
		cols = childCount;
	}
	else {
		cols = ~(~JkMathMath.floor(((mywidth + this.widgetSpacing) / (wcs + this.widgetSpacing))));
		if(this.minimumCols > 0 && cols < this.minimumCols) {
			cols = this.minimumCols;
			adjustWcs = true;
		}
		else if(childCount >= cols) {
			adjustWcs = true;
		}
	}
	if(adjustWcs) {
		wcs = (mywidth + this.widgetSpacing) / cols - this.widgetSpacing;
	}
	if(this.maximumCols > 0 && cols > this.maximumCols) {
		cols = this.maximumCols;
	}
	rows = ~(~JkMathMath.floor((childCount / cols)));
	if(childCount % cols > 0) {
		rows++;
	}
	JkWidgetWidget.setLayoutSize(this, (this.widgetMargin + cols * wcs + (cols - 1) * this.widgetSpacing + this.widgetMargin), (this.widgetMargin + rows * wcs + (rows - 1) * this.widgetSpacing + this.widgetMargin));
	var cx = 0;
	var x = this.widgetMargin;
	var y = this.widgetMargin;
	if(children != null) {
		var n = 0;
		var m = children.length;
		for(n = 0 ; n < m ; n++) {
			var child = children[n];
			if(child != null) {
				JkWidgetWidget.move(child, x, y);
				JkWidgetWidget.layout(child, wcs, false);
				JkWidgetWidget.resizeHeight(child, wcs);
				x += wcs;
				x += this.widgetSpacing;
				cx++;
				if(cx >= cols) {
					cx = 0;
					y += wcs;
					y += this.widgetSpacing;
					x = this.widgetMargin;
				}
			}
		}
	}
};

JkWidgetGridWidget.prototype.getWidgetCellSize = function() {
	return this.widgetCellSize;
};

JkWidgetGridWidget.prototype.setWidgetCellSize = function(v) {
	this.widgetCellSize = v;
	return this;
};

JkWidgetGridWidget.prototype.getMinimumCols = function() {
	return this.minimumCols;
};

JkWidgetGridWidget.prototype.setMinimumCols = function(v) {
	this.minimumCols = v;
	return this;
};

JkWidgetGridWidget.prototype.getMaximumCols = function() {
	return this.maximumCols;
};

JkWidgetGridWidget.prototype.setMaximumCols = function(v) {
	this.maximumCols = v;
	return this;
};

JkWidgetGridWidget.prototype.getWidgetSpacing = function() {
	return this.widgetSpacing;
};

JkWidgetGridWidget.prototype.setWidgetSpacing = function(v) {
	this.widgetSpacing = v;
	return this;
};

JkWidgetGridWidget.prototype.getWidgetMargin = function() {
	return this.widgetMargin;
};

JkWidgetGridWidget.prototype.setWidgetMargin = function(v) {
	this.widgetMargin = v;
	return this;
};

JkWidgetGridWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetGridWidget"] === true;
};

let JkWidgetResponsiveAwareWidget = {};

JkWidgetResponsiveAwareWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetResponsiveAwareWidget"] === true;
};

let JkWidgetWidgetProvider = {};

JkWidgetWidgetProvider.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetWidgetProvider"] === true;
};

let JkWidgetHorizontalBoxWidgetMyChildEntry = function() {
	this.widget = null;
	this.weight = 0.0;
};

JkWidgetHorizontalBoxWidgetMyChildEntry.prototype._t = { "JkWidgetHorizontalBoxWidgetMyChildEntry" : true };
JkWidgetHorizontalBoxWidgetMyChildEntry.prototype._tobj = JkWidgetHorizontalBoxWidgetMyChildEntry;

JkWidgetHorizontalBoxWidgetMyChildEntry.NEW = function() {
	var v = new JkWidgetHorizontalBoxWidgetMyChildEntry;
	return v.CTOR_JkWidgetHorizontalBoxWidgetMyChildEntry();
};

JkWidgetHorizontalBoxWidgetMyChildEntry.prototype.CTOR_JkWidgetHorizontalBoxWidgetMyChildEntry = function() {
	this.weight = 0.0;
	this.widget = null;
	return this;
};

JkWidgetHorizontalBoxWidgetMyChildEntry.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetHorizontalBoxWidgetMyChildEntry"] === true;
};

let JkWidgetHorizontalBoxWidget = function() {
	JkWidgetContainerWidget.call(this);
	this.children = null;
	this.widgetSpacing = 0;
	this.widgetMarginLeft = 0;
	this.widgetMarginRight = 0;
	this.widgetMarginTop = 0;
	this.widgetMarginBottom = 0;
	this.widgetFixedHeight = 0;
};

JkWidgetHorizontalBoxWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetContainerWidget.prototype);
JkWidgetHorizontalBoxWidget.prototype.constructor = JkWidgetHorizontalBoxWidget;
JkWidgetHorizontalBoxWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHorizontalBoxWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetHorizontalBoxWidget.prototype._tobj = JkWidgetHorizontalBoxWidget;

JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetHorizontalBoxWidget;
	return v.CTOR_JkWidgetHorizontalBoxWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetHorizontalBoxWidget.prototype.CTOR_JkWidgetHorizontalBoxWidget_JkUiGuiApplicationContext = function(ctx) {
	this.widgetFixedHeight = 0;
	this.widgetMarginBottom = 0;
	this.widgetMarginTop = 0;
	this.widgetMarginRight = 0;
	this.widgetMarginLeft = 0;
	this.widgetSpacing = 0;
	this.children = null;
	if(JkWidgetContainerWidget.prototype.CTOR_JkWidgetContainerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.children = new Array;
	return this;
};

JkWidgetHorizontalBoxWidget.forContext = function(context, widgetMargin, widgetSpacing) {
	var v = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(context);
	v.widgetMarginLeft = widgetMargin;
	v.widgetMarginRight = widgetMargin;
	v.widgetMarginTop = widgetMargin;
	v.widgetMarginBottom = widgetMargin;
	v.widgetSpacing = widgetSpacing;
	return v;
};

JkWidgetHorizontalBoxWidget.prototype.setWidgetMargin = function(margin) {
	this.widgetMarginLeft = margin;
	this.widgetMarginRight = margin;
	this.widgetMarginTop = margin;
	this.widgetMarginBottom = margin;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetHorizontalBoxWidget.prototype.getWidgetMarginLeft = function() {
	return this.widgetMarginLeft;
};

JkWidgetHorizontalBoxWidget.prototype.setWidgetMarginLeft = function(value) {
	this.widgetMarginLeft = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetHorizontalBoxWidget.prototype.getWidgetMarginRight = function() {
	return this.widgetMarginRight;
};

JkWidgetHorizontalBoxWidget.prototype.setWidgetMarginRight = function(value) {
	this.widgetMarginRight = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetHorizontalBoxWidget.prototype.getWidgetMarginTop = function() {
	return this.widgetMarginTop;
};

JkWidgetHorizontalBoxWidget.prototype.setWidgetMarginTop = function(value) {
	this.widgetMarginTop = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetHorizontalBoxWidget.prototype.getWidgetMarginBottom = function() {
	return this.widgetMarginBottom;
};

JkWidgetHorizontalBoxWidget.prototype.setWidgetMarginBottom = function(value) {
	this.widgetMarginBottom = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetHorizontalBoxWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	var totalWeight = 0.0;
	var highest = 0;
	var availableWidth = widthConstraint - this.widgetMarginLeft - this.widgetMarginRight;
	var childCount = 0;
	if(this.children != null) {
		var n = 0;
		var m = this.children.length;
		for(n = 0 ; n < m ; n++) {
			var child = this.children[n];
			if(child != null) {
				childCount++;
				if(child.weight > 0.0) {
					totalWeight += child.weight;
				}
				else {
					JkWidgetWidget.layout(child.widget, (-1), false);
					availableWidth -= JkWidgetWidget.getWidth(child.widget);
					var height = JkWidgetWidget.getHeight(child.widget);
					if(height > highest) {
						highest = height;
					}
				}
			}
		}
	}
	if(childCount > 1 && this.widgetSpacing > 0) {
		availableWidth -= (childCount - 1) * this.widgetSpacing;
	}
	if(this.children != null) {
		var n2 = 0;
		var m2 = this.children.length;
		for(n2 = 0 ; n2 < m2 ; n2++) {
			var child1 = this.children[n2];
			if(child1 != null) {
				if(child1.weight > 0.0) {
					var ww = ~(~(availableWidth * child1.weight / totalWeight));
					JkWidgetWidget.layout(child1.widget, ww, false);
					var height1 = JkWidgetWidget.getHeight(child1.widget);
					if(height1 > highest) {
						highest = height1;
					}
				}
			}
		}
	}
	var realHighest = highest;
	highest += this.widgetMarginTop + this.widgetMarginBottom;
	if(this.widgetFixedHeight > 0) {
		highest = this.widgetFixedHeight;
	}
	if(widthConstraint < 0) {
		var totalWidth = widthConstraint - availableWidth;
		JkWidgetWidget.setLayoutSize(this, totalWidth, highest);
	}
	else {
		JkWidgetWidget.setLayoutSize(this, widthConstraint, highest);
	}
	if(availableWidth < 0) {
		availableWidth = 0;
	}
	var x = this.widgetMarginLeft;
	if(this.children != null) {
		var n3 = 0;
		var m3 = this.children.length;
		for(n3 = 0 ; n3 < m3 ; n3++) {
			var child2 = this.children[n3];
			if(child2 != null) {
				var ww1 = 0;
				if(child2.weight > 0.0) {
					ww1 = ~(~(availableWidth * child2.weight / totalWeight));
					JkWidgetWidget.move(child2.widget, x, this.widgetMarginTop);
					JkWidgetWidget.layout(child2.widget, ww1, false);
					JkWidgetWidget.resizeHeight(child2.widget, realHighest);
				}
				else {
					ww1 = JkWidgetWidget.getWidth(child2.widget);
					JkWidgetWidget.move(child2.widget, x, this.widgetMarginTop);
					JkWidgetWidget.layout(child2.widget, ww1, false);
					JkWidgetWidget.resizeHeight(child2.widget, realHighest);
				}
				x += ww1;
				x += this.widgetSpacing;
			}
		}
	}
};

JkWidgetHorizontalBoxWidget.prototype.onWidgetHeightChanged = function(height) {
	JkWidgetContainerWidget.prototype.onWidgetHeightChanged.call(this, height);
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.resizeHeight(child, (height - this.widgetMarginTop - this.widgetMarginBottom));
			}
		}
	}
};

JkWidgetHorizontalBoxWidget.prototype.onChildWidgetsRemoved = function(widgets) {
	var ws = JkLangVector.getSize(widgets);
	if(ws > 0) {
		var vs = JkLangVector.getSize(this.children);
		if(ws == vs) {
			JkLangVector.clear(this.children);
		}
		else {
			var widget = JkLangVector.get(widgets, 0);
			if(this.children != null) {
				var n = 0;
				var m = this.children.length;
				for(n = 0 ; n < m ; n++) {
					var child = this.children[n];
					if(child != null) {
						if(child.widget == widget) {
							JkLangVector.removeValue(this.children, child);
							break;
						}
					}
				}
			}
		}
	}
	JkWidgetContainerWidget.prototype.onChildWidgetsRemoved.call(this, widgets);
};

JkWidgetHorizontalBoxWidget.prototype.addWidget = function(widget) {
	return this.addWidget1(widget, 0.0);
};

JkWidgetHorizontalBoxWidget.prototype.removeAllChildren = function() {
	JkWidgetWidget.removeChildrenOf(this);
};

JkWidgetHorizontalBoxWidget.prototype.addWidget1 = function(widget, weight) {
	if(widget != null) {
		var ee = JkWidgetHorizontalBoxWidgetMyChildEntry.NEW();
		ee.widget = widget;
		ee.weight = weight;
		this.children.push(ee);
		JkWidgetWidget.addChild(this, widget);
	}
	return this;
};

JkWidgetHorizontalBoxWidget.prototype.setWidgetWeight = function(widget, weight) {
	if(this.children != null) {
		var n = 0;
		var m = this.children.length;
		for(n = 0 ; n < m ; n++) {
			var child = this.children[n];
			if(child != null) {
				if(child.widget == widget) {
					child.weight = weight;
					JkWidgetWidget.onLayoutChanged(this);
					break;
				}
			}
		}
	}
};

JkWidgetHorizontalBoxWidget.prototype.getWidgetSpacing = function() {
	return this.widgetSpacing;
};

JkWidgetHorizontalBoxWidget.prototype.setWidgetSpacing = function(v) {
	this.widgetSpacing = v;
	return this;
};

JkWidgetHorizontalBoxWidget.prototype.getWidgetFixedHeight = function() {
	return this.widgetFixedHeight;
};

JkWidgetHorizontalBoxWidget.prototype.setWidgetFixedHeight = function(v) {
	this.widgetFixedHeight = v;
	return this;
};

JkWidgetHorizontalBoxWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetHorizontalBoxWidget"] === true;
};

let JkWidgetResizeAwareWidget = {};

JkWidgetResizeAwareWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetResizeAwareWidget"] === true;
};

let JkWidgetScreenStartStopAwareWidget = {};

JkWidgetScreenStartStopAwareWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetScreenStartStopAwareWidget"] === true;
};

let JkWidgetAlignWidgetMyChildEntry = function() {
	this.widget = null;
	this.alignX = 0.0;
	this.alignY = 0.0;
	this.maximizeWidth = false;
};

JkWidgetAlignWidgetMyChildEntry.prototype._t = { "JkWidgetAlignWidgetMyChildEntry" : true };
JkWidgetAlignWidgetMyChildEntry.prototype._tobj = JkWidgetAlignWidgetMyChildEntry;

JkWidgetAlignWidgetMyChildEntry.NEW = function() {
	var v = new JkWidgetAlignWidgetMyChildEntry;
	return v.CTOR_JkWidgetAlignWidgetMyChildEntry();
};

JkWidgetAlignWidgetMyChildEntry.prototype.CTOR_JkWidgetAlignWidgetMyChildEntry = function() {
	this.maximizeWidth = false;
	this.alignY = 0.0;
	this.alignX = 0.0;
	this.widget = null;
	return this;
};

JkWidgetAlignWidgetMyChildEntry.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetAlignWidgetMyChildEntry"] === true;
};

let JkWidgetAlignWidget = function() {
	JkWidgetContainerWidget.call(this);
	this.children = null;
	this.widgetMarginLeft = 0;
	this.widgetMarginRight = 0;
	this.widgetMarginTop = 0;
	this.widgetMarginBottom = 0;
};

JkWidgetAlignWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetContainerWidget.prototype);
JkWidgetAlignWidget.prototype.constructor = JkWidgetAlignWidget;
JkWidgetAlignWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetAlignWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetAlignWidget.prototype._tobj = JkWidgetAlignWidget;

JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetAlignWidget;
	return v.CTOR_JkWidgetAlignWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetAlignWidget.prototype.CTOR_JkWidgetAlignWidget_JkUiGuiApplicationContext = function(ctx) {
	this.widgetMarginBottom = 0;
	this.widgetMarginTop = 0;
	this.widgetMarginRight = 0;
	this.widgetMarginLeft = 0;
	this.children = null;
	if(JkWidgetContainerWidget.prototype.CTOR_JkWidgetContainerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.children = new Array;
	return this;
};

JkWidgetAlignWidget.forWidget = function(context, widget, alignX, alignY, margin) {
	var v = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(context);
	v.widgetMarginLeft = margin;
	v.widgetMarginRight = margin;
	v.widgetMarginTop = margin;
	v.widgetMarginBottom = margin;
	v.addWidget1(widget, alignX, alignY, false);
	return v;
};

JkWidgetAlignWidget.prototype.setWidgetMargin = function(margin) {
	this.widgetMarginLeft = margin;
	this.widgetMarginRight = margin;
	this.widgetMarginTop = margin;
	this.widgetMarginBottom = margin;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetAlignWidget.prototype.getWidgetMarginLeft = function() {
	return this.widgetMarginLeft;
};

JkWidgetAlignWidget.prototype.setWidgetMarginLeft = function(value) {
	this.widgetMarginLeft = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetAlignWidget.prototype.getWidgetMarginRight = function() {
	return this.widgetMarginRight;
};

JkWidgetAlignWidget.prototype.setWidgetMarginRight = function(value) {
	this.widgetMarginRight = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetAlignWidget.prototype.getWidgetMarginTop = function() {
	return this.widgetMarginTop;
};

JkWidgetAlignWidget.prototype.setWidgetMarginTop = function(value) {
	this.widgetMarginTop = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetAlignWidget.prototype.getWidgetMarginBottom = function() {
	return this.widgetMarginBottom;
};

JkWidgetAlignWidget.prototype.setWidgetMarginBottom = function(value) {
	this.widgetMarginBottom = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetAlignWidget.prototype.onWidgetHeightChanged = function(height) {
	JkWidgetContainerWidget.prototype.onWidgetHeightChanged.call(this, height);
	this.updateChildWidgetLocations();
};

JkWidgetAlignWidget.prototype.updateChildWidgetLocations = function() {
	if(this.children != null) {
		var n = 0;
		var m = this.children.length;
		for(n = 0 ; n < m ; n++) {
			var child = this.children[n];
			if(child != null) {
				this.handleEntry(child);
			}
		}
	}
};

JkWidgetAlignWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	var wc = -1;
	if(widthConstraint >= 0) {
		wc = widthConstraint - this.widgetMarginLeft - this.widgetMarginRight;
		if(wc < 0) {
			wc = 0;
		}
	}
	var mw = 0;
	var mh = 0;
	if(this.children != null) {
		var n = 0;
		var m = this.children.length;
		for(n = 0 ; n < m ; n++) {
			var child = this.children[n];
			if(child != null) {
				var widget = child.widget;
				if(child.maximizeWidth) {
					JkWidgetWidget.layout(widget, widthConstraint, false);
				}
				else {
					JkWidgetWidget.layout(widget, (-1), false);
				}
				var cw = JkWidgetWidget.getWidth(widget);
				if(wc >= 0 && cw > wc) {
					JkWidgetWidget.layout(widget, wc, false);
					cw = JkWidgetWidget.getWidth(widget);
				}
				if(cw > mw) {
					mw = cw;
				}
				var ch = JkWidgetWidget.getHeight(widget);
				if(ch > mh) {
					mh = ch;
				}
			}
		}
	}
	var mywidth = mw + this.widgetMarginLeft + this.widgetMarginRight;
	if(widthConstraint >= 0) {
		mywidth = widthConstraint;
	}
	JkWidgetWidget.setLayoutSize(this, mywidth, (mh + this.widgetMarginTop + this.widgetMarginBottom));
	this.updateChildWidgetLocations();
};

JkWidgetAlignWidget.prototype.handleEntry = function(entry) {
	var w = JkWidgetWidget.getWidth(this) - this.widgetMarginLeft - this.widgetMarginRight;
	var h = JkWidgetWidget.getHeight(this) - this.widgetMarginTop - this.widgetMarginBottom;
	var cw = JkWidgetWidget.getWidth(entry.widget);
	var ch = JkWidgetWidget.getHeight(entry.widget);
	if(cw > w || ch > h) {
		if(cw > w) {
			cw = w;
		}
		if(ch > h) {
			ch = h;
		}
	}
	var dx = this.widgetMarginLeft + ~(~((w - cw) * entry.alignX));
	var dy = this.widgetMarginTop + ~(~((h - ch) * entry.alignY));
	JkWidgetWidget.move(entry.widget, dx, dy);
};

JkWidgetAlignWidget.prototype.onChildWidgetsRemoved = function(widgets) {
	JkWidgetContainerWidget.prototype.onChildWidgetsRemoved.call(this, widgets);
	var ws = JkLangVector.getSize(widgets);
	if(ws > 0) {
		var vs = JkLangVector.getSize(this.children);
		if(ws == vs) {
			JkLangVector.clear(this.children);
		}
		else {
			var widget = JkLangVector.get(widgets, 0);
			if(this.children != null) {
				var n = 0;
				var m = this.children.length;
				for(n = 0 ; n < m ; n++) {
					var child = this.children[n];
					if(child != null) {
						if(child.widget == widget) {
							JkLangVector.removeValue(this.children, child);
							break;
						}
					}
				}
			}
		}
	}
};

JkWidgetAlignWidget.prototype.addWidget = function(widget) {
	return this.addWidget1(widget, 0.5, 0.5, false);
};

JkWidgetAlignWidget.prototype.addWidget1 = function(widget, alignX, alignY, maximizeWidth) {
	var ee = JkWidgetAlignWidgetMyChildEntry.NEW();
	ee.widget = widget;
	ee.alignX = alignX;
	ee.alignY = alignY;
	ee.maximizeWidth = maximizeWidth;
	this.children.push(ee);
	JkWidgetWidget.addChild(this, widget);
	if(this.hasSize()) {
		this.handleEntry(ee);
	}
	return this;
};

JkWidgetAlignWidget.prototype.setAlignForIndex = function(index, alignX, alignY) {
	var child = JkLangVector.get(this.children, index);
	if(child == null) {
		return;
	}
	if(child.alignX != alignX || child.alignY != alignY) {
		child.alignX = alignX;
		child.alignY = alignY;
		JkWidgetWidget.onLayoutChanged(this);
	}
};

JkWidgetAlignWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetAlignWidget"] === true;
};

let JkWidgetCanvasWidget = function() {
	JkWidgetWidget.call(this);
	this.widgetContext = null;
	this.widgetColor = null;
	this.widgetTopLeftRadius = 0.0;
	this.widgetTopRightRadius = 0.0;
	this.widgetBottomRightRadius = 0.0;
	this.widgetBottomLeftRadius = 0.0;
	this.widgetOutlineColor = null;
	this.widgetOutlineWidth = 0;
	this.widgetBorderStyle = 0;
};

JkWidgetCanvasWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetCanvasWidget.prototype.constructor = JkWidgetCanvasWidget;
JkWidgetCanvasWidget.prototype._t = {
	"JkWidgetWidget" : true,
	"JkWidgetCanvasWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCanvasWidget.prototype._tobj = JkWidgetCanvasWidget;

JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCanvasWidget;
	return v.CTOR_JkWidgetCanvasWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCanvasWidget.prototype.CTOR_JkWidgetCanvasWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.widgetBorderStyle = 0;
	this.widgetOutlineWidth = 0;
	this.widgetOutlineColor = null;
	this.widgetBottomLeftRadius = 0.0;
	this.widgetBottomRightRadius = 0.0;
	this.widgetTopRightRadius = 0.0;
	this.widgetTopLeftRadius = 0.0;
	this.widgetColor = null;
	this.widgetContext = null;
	this.widgetContext = context;
	this.widgetColor = JkGfxColor.black();
	this.widgetOutlineColor = JkGfxColor.black();
	return this;
};

JkWidgetCanvasWidget.forColor = function(context, color) {
	var v = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(context);
	v.setWidgetColor(color);
	return v;
};

JkWidgetCanvasWidget.prototype.prepareElement = function(element) {
	JkWidgetWidget.prototype.prepareElement.call(this, element);
	JkUiHTMLDOM.setStyle(element, "box-sizing", "border-box");
};

JkWidgetCanvasWidget.prototype.setWidgetLayoutChanged = function() {
};

JkWidgetCanvasWidget.prototype.hasWidgetLayoutChanged = function() {
	return false;
};

JkWidgetCanvasWidget.prototype.layoutWidget = function(widthConstraint, force) {
	var wc = widthConstraint;
	if(wc < 0) {
		wc = 0;
	}
	JkWidgetWidget.setLayoutSize(this, wc, 0);
	return true;
};

JkWidgetCanvasWidget.prototype.setWidgetColor = function(color) {
	this.widgetColor = color;
	if(!(this.widgetColor != null)) {
		JkUiHTMLDOM.removeStyle(this.element, "background-color");
	}
	else {
		JkUiHTMLDOM.setStyle(this.element, "background-color", (JkUiHTMLDOM.colorToRGBA(this.widgetColor)));
	}
};

JkWidgetCanvasWidget.prototype.getWidgetColor = function() {
	return this.widgetColor;
};

JkWidgetCanvasWidget.prototype.setWidgetOutlineColor = function(color) {
	this.widgetOutlineColor = color;
	this.updateCanvas();
};

JkWidgetCanvasWidget.prototype.getWidgetOutlineColor = function() {
	return this.widgetOutlineColor;
};

JkWidgetCanvasWidget.prototype.setWidgetOutlineWidth = function(width) {
	this.widgetOutlineWidth = width;
	this.updateCanvas();
};

JkWidgetCanvasWidget.prototype.getWidgetOutlineWidth = function() {
	return this.widgetOutlineWidth;
};

JkWidgetCanvasWidget.prototype.updateCanvas = function() {
	if(this.widgetOutlineWidth < 0) {
		JkUiHTMLDOM.removeStyle(this.element, "border");
		JkUiHTMLDOM.removeStyle(this.element, "border-color");
		JkUiHTMLDOM.removeStyle(this.element, "border-style");
	}
	else {
		JkUiHTMLDOM.setStyle(this.element, "border", (JkLangString.safeString((JkLangString.forInteger(this.widgetOutlineWidth)))) + ("px"));
		JkUiHTMLDOM.setStyle(this.element, "border-style", "solid");
		JkUiHTMLDOM.setStyle(this.element, "border-color", (this.widgetOutlineColor.toRgbString()));
	}
};

JkWidgetCanvasWidget.prototype.updateCanvasRoundingRadius = function() {
	var isRounded = true;
	if(this.widgetTopLeftRadius <= 0.0 && this.widgetTopRightRadius <= 0.0 && this.widgetBottomRightRadius <= 0.0 && this.widgetBottomLeftRadius <= 0.0) {
		isRounded = false;
	}
	if(isRounded) {
		JkUiHTMLDOM.setStyle(this.element, "border-radius", (JkLangString.safeString((JkLangString.forInteger((~(~this.widgetTopLeftRadius)))))) + ("px ") + (JkLangString.safeString((JkLangString.forInteger((~(~this.widgetTopRightRadius)))))) + ("px ") + (JkLangString.safeString((JkLangString.forInteger((~(~this.widgetBottomRightRadius)))))) + ("px ") + (JkLangString.safeString((JkLangString.forInteger((~(~this.widgetBottomLeftRadius)))))) + ("px"));
	}
	else {
		JkUiHTMLDOM.removeStyle(this.element, "border-radius");
	}
};

JkWidgetCanvasWidget.prototype.getWidgetTopLeftRadius = function() {
	return this.widgetTopLeftRadius;
};

JkWidgetCanvasWidget.prototype.getWidgetTopRightRadius = function() {
	return this.widgetTopRightRadius;
};

JkWidgetCanvasWidget.prototype.getWidgetBottomRightRadius = function() {
	return this.widgetBottomRightRadius;
};

JkWidgetCanvasWidget.prototype.getWidgetBottomLeftRadius = function() {
	return this.widgetBottomLeftRadius;
};

JkWidgetCanvasWidget.prototype.setWidgetRoundingRadiusTopLeft = function(radius) {
	this.widgetTopLeftRadius = radius;
	this.updateCanvasRoundingRadius();
};

JkWidgetCanvasWidget.prototype.setWidgetRoundingRadiusTopRight = function(radius) {
	this.widgetTopRightRadius = radius;
	this.updateCanvasRoundingRadius();
};

JkWidgetCanvasWidget.prototype.setWidgetRoundingRadiusBottomLeft = function(radius) {
	this.widgetBottomLeftRadius = radius;
	this.updateCanvasRoundingRadius();
};

JkWidgetCanvasWidget.prototype.setWidgetRoundingRadiusBottomRight = function(radius) {
	this.widgetBottomRightRadius = radius;
	this.updateCanvasRoundingRadius();
};

JkWidgetCanvasWidget.prototype.setWidgetRoundingRadius1 = function(radius) {
	this.setWidgetRoundingRadius3(radius, radius, radius, radius);
};

JkWidgetCanvasWidget.prototype.setWidgetRoundingRadius2 = function(lradius, rradius) {
	this.setWidgetRoundingRadius3(lradius, rradius, rradius, lradius);
};

JkWidgetCanvasWidget.prototype.setWidgetRoundingRadius3 = function(tlradius, trradius, brradius, blradius) {
	this.widgetTopLeftRadius = tlradius;
	this.widgetTopRightRadius = trradius;
	this.widgetBottomRightRadius = brradius;
	this.widgetBottomLeftRadius = blradius;
	this.updateCanvasRoundingRadius();
};

JkWidgetCanvasWidget.prototype.setWidgetBorderStyle = function(style) {
	this.widgetBorderStyle = style;
	if(style == JkWidgetCanvasWidget.BORDER_STYLE_SOLID) {
		JkUiHTMLDOM.setStyle(this.element, "border-style", "solid");
	}
	else if(style == JkWidgetCanvasWidget.BORDER_STYLE_DASHED) {
		JkUiHTMLDOM.setStyle(this.element, "border-style", "dashed");
	}
	else if(style == JkWidgetCanvasWidget.BORDER_STYLE_DOTTED) {
		JkUiHTMLDOM.setStyle(this.element, "border-style", "dotted");
	}
	else if(style == JkWidgetCanvasWidget.BORDER_STYLE_NONE) {
		JkUiHTMLDOM.setStyle(this.element, "border-style", "none");
	}
	else if(style == JkWidgetCanvasWidget.BORDER_STYLE_3D) {
		JkUiHTMLDOM.setStyle(this.element, "border-style", "groove");
	}
	else {
		JkLogLog.warning(this.widgetContext, "Unsupported image scale method: " + (JkLangString.safeString((JkLangString.forInteger(style)))));
		JkUiHTMLDOM.setStyle(this.element, "border-style", "solid");
	}
	return this;
};

JkWidgetCanvasWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCanvasWidget"] === true;
};

JkWidgetCanvasWidget.BORDER_STYLE_SOLID = 0;
JkWidgetCanvasWidget.BORDER_STYLE_DASHED = 1;
JkWidgetCanvasWidget.BORDER_STYLE_DOTTED = 2;
JkWidgetCanvasWidget.BORDER_STYLE_NONE = 3;
JkWidgetCanvasWidget.BORDER_STYLE_3D = 4;

let JkWidgetVerticalBoxWidget = function() {
	JkWidgetContainerWidget.call(this);
	this.children = null;
	this.widgetSpacing = 0;
	this.widgetMarginLeft = 0;
	this.widgetMarginRight = 0;
	this.widgetMarginTop = 0;
	this.widgetMarginBottom = 0;
	this.widgetWidthRequest = 0;
	this.widgetMaximumWidthRequest = 0;
};

JkWidgetVerticalBoxWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetContainerWidget.prototype);
JkWidgetVerticalBoxWidget.prototype.constructor = JkWidgetVerticalBoxWidget;
JkWidgetVerticalBoxWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetVerticalBoxWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetVerticalBoxWidget.prototype._tobj = JkWidgetVerticalBoxWidget;

JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetVerticalBoxWidget;
	return v.CTOR_JkWidgetVerticalBoxWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetVerticalBoxWidget.prototype.CTOR_JkWidgetVerticalBoxWidget_JkUiGuiApplicationContext = function(ctx) {
	this.widgetMaximumWidthRequest = 0;
	this.widgetWidthRequest = 0;
	this.widgetMarginBottom = 0;
	this.widgetMarginTop = 0;
	this.widgetMarginRight = 0;
	this.widgetMarginLeft = 0;
	this.widgetSpacing = 0;
	this.children = null;
	if(JkWidgetContainerWidget.prototype.CTOR_JkWidgetContainerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.children = new Array;
	return this;
};

JkWidgetVerticalBoxWidget.forContext = function(context, widgetMargin, widgetSpacing) {
	var v = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(context);
	v.widgetMarginLeft = widgetMargin;
	v.widgetMarginRight = widgetMargin;
	v.widgetMarginTop = widgetMargin;
	v.widgetMarginBottom = widgetMargin;
	v.widgetSpacing = widgetSpacing;
	return v;
};

JkWidgetVerticalBoxWidget.prototype.setWidgetMargin = function(margin) {
	this.widgetMarginLeft = margin;
	this.widgetMarginRight = margin;
	this.widgetMarginTop = margin;
	this.widgetMarginBottom = margin;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetVerticalBoxWidget.prototype.getWidgetMarginLeft = function() {
	return this.widgetMarginLeft;
};

JkWidgetVerticalBoxWidget.prototype.setWidgetMarginLeft = function(value) {
	this.widgetMarginLeft = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetVerticalBoxWidget.prototype.getWidgetMarginRight = function() {
	return this.widgetMarginRight;
};

JkWidgetVerticalBoxWidget.prototype.setWidgetMarginRight = function(value) {
	this.widgetMarginRight = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetVerticalBoxWidget.prototype.getWidgetMarginTop = function() {
	return this.widgetMarginTop;
};

JkWidgetVerticalBoxWidget.prototype.setWidgetMarginTop = function(value) {
	this.widgetMarginTop = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetVerticalBoxWidget.prototype.getWidgetMarginBottom = function() {
	return this.widgetMarginBottom;
};

JkWidgetVerticalBoxWidget.prototype.setWidgetMarginBottom = function(value) {
	this.widgetMarginBottom = value;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetVerticalBoxWidget.prototype.setWidgetWidthRequest = function(request) {
	this.widgetWidthRequest = request;
	JkWidgetWidget.onLayoutChanged(this);
	return this;
};

JkWidgetVerticalBoxWidget.prototype.getWidgetWidthRequest = function() {
	return this.widgetWidthRequest;
};

JkWidgetVerticalBoxWidget.prototype.setWidgetMaximumWidthRequest = function(width) {
	this.widgetMaximumWidthRequest = width;
	if(JkWidgetWidget.getWidth(this) > width) {
		JkWidgetWidget.onLayoutChanged(this);
	}
	return this;
};

JkWidgetVerticalBoxWidget.prototype.getWidgetMaximumWidthRequest = function() {
	return this.widgetMaximumWidthRequest;
};

JkWidgetVerticalBoxWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	var wc = -1;
	if(widthConstraint < 0 && this.widgetWidthRequest > 0) {
		wc = this.widgetWidthRequest - this.widgetMarginLeft - this.widgetMarginRight;
	}
	if(wc < 0 && widthConstraint >= 0) {
		wc = widthConstraint - this.widgetMarginLeft - this.widgetMarginRight;
		if(wc < 0) {
			wc = 0;
		}
	}
	var widest = 0;
	var childCount = 0;
	var y = this.widgetMarginTop;
	if(wc < 0) {
		if(this.children != null) {
			var n = 0;
			var m = this.children.length;
			for(n = 0 ; n < m ; n++) {
				var child = this.children[n];
				if(child != null) {
					JkWidgetWidget.layout(child.widget, (-1), false);
					var ww = JkWidgetWidget.getWidth(child.widget);
					if(ww > wc) {
						wc = ww;
					}
				}
			}
		}
	}
	if(this.children != null) {
		var n2 = 0;
		var m2 = this.children.length;
		for(n2 = 0 ; n2 < m2 ; n2++) {
			var child1 = this.children[n2];
			if(child1 != null) {
				if(childCount > 0) {
					y += this.widgetSpacing;
				}
				childCount++;
				JkWidgetWidget.layout(child1.widget, wc, false);
				JkWidgetWidget.move(child1.widget, this.widgetMarginLeft, y);
				var ww1 = JkWidgetWidget.getWidth(child1.widget);
				if(wc < 0 && this.widgetMaximumWidthRequest > 0 && ww1 + this.widgetMarginLeft + this.widgetMarginRight > this.widgetMaximumWidthRequest) {
					JkWidgetWidget.layout(child1.widget, (this.widgetMaximumWidthRequest - this.widgetMarginLeft - this.widgetMarginRight), false);
					ww1 = JkWidgetWidget.getWidth(child1.widget);
				}
				if(ww1 > widest) {
					widest = ww1;
				}
				y += JkWidgetWidget.getHeight(child1.widget);
			}
		}
	}
	y += this.widgetMarginBottom;
	var mywidth = widest + this.widgetMarginLeft + this.widgetMarginRight;
	if(widthConstraint >= 0) {
		mywidth = widthConstraint;
	}
	JkWidgetWidget.setLayoutSize(this, mywidth, y);
	this.onWidgetHeightChanged(y);
};

JkWidgetVerticalBoxWidget.prototype.onWidgetHeightChanged = function(height) {
	JkWidgetContainerWidget.prototype.onWidgetHeightChanged.call(this, height);
	var totalWeight = 0.0;
	var availableHeight = height - this.widgetMarginTop - this.widgetMarginBottom;
	var childCount = 0;
	if(this.children != null) {
		var n = 0;
		var m = this.children.length;
		for(n = 0 ; n < m ; n++) {
			var child = this.children[n];
			if(child != null) {
				childCount++;
				if(child.weight > 0.0) {
					totalWeight += child.weight;
				}
				else {
					availableHeight -= JkWidgetWidget.getHeight(child.widget);
				}
			}
		}
	}
	if(childCount > 1 && this.widgetSpacing > 0) {
		availableHeight -= (childCount - 1) * this.widgetSpacing;
	}
	if(availableHeight < 0) {
		availableHeight = 0;
	}
	var y = this.widgetMarginTop;
	if(this.children != null) {
		var n2 = 0;
		var m2 = this.children.length;
		for(n2 = 0 ; n2 < m2 ; n2++) {
			var child1 = this.children[n2];
			if(child1 != null) {
				JkWidgetWidget.move(child1.widget, this.widgetMarginLeft, y);
				if(child1.weight > 0.0) {
					var hh = ~(~(availableHeight * child1.weight / totalWeight));
					JkWidgetWidget.resizeHeight(child1.widget, hh);
				}
				var hh1 = JkWidgetWidget.getHeight(child1.widget);
				y += hh1;
				y += this.widgetSpacing;
			}
		}
	}
};

JkWidgetVerticalBoxWidget.prototype.onChildWidgetsRemoved = function(widgets) {
	var ws = JkLangVector.getSize(widgets);
	if(ws > 0) {
		var vs = JkLangVector.getSize(this.children);
		if(ws == vs) {
			JkLangVector.clear(this.children);
		}
		else {
			var widget = JkLangVector.get(widgets, 0);
			if(this.children != null) {
				var n = 0;
				var m = this.children.length;
				for(n = 0 ; n < m ; n++) {
					var child = this.children[n];
					if(child != null) {
						if(child.widget == widget) {
							JkLangVector.removeValue(this.children, child);
							break;
						}
					}
				}
			}
		}
	}
	JkWidgetContainerWidget.prototype.onChildWidgetsRemoved.call(this, widgets);
};

JkWidgetVerticalBoxWidget.prototype.addWidget = function(widget) {
	return this.addWidget1(widget, 0.0);
};

JkWidgetVerticalBoxWidget.prototype.removeAllChildren = function() {
	JkWidgetWidget.removeChildrenOf(this);
};

JkWidgetVerticalBoxWidget.prototype.addWidget1 = function(widget, weight) {
	if(widget != null) {
		var ee = JkWidgetVerticalBoxWidgetMyChildEntry.NEW();
		ee.widget = widget;
		ee.weight = weight;
		this.children.push(ee);
		JkWidgetWidget.addChild(this, widget);
	}
	return this;
};

JkWidgetVerticalBoxWidget.prototype.getWidgetSpacing = function() {
	return this.widgetSpacing;
};

JkWidgetVerticalBoxWidget.prototype.setWidgetSpacing = function(v) {
	this.widgetSpacing = v;
	return this;
};

JkWidgetVerticalBoxWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetVerticalBoxWidget"] === true;
};

let JkWidgetRenderableWidget = function() {
	JkWidgetWidget.call(this);
	this.renderContext = null;
	this.context = null;
	this.renderer = null;
};

JkWidgetRenderableWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetRenderableWidget.prototype.constructor = JkWidgetRenderableWidget;
JkWidgetRenderableWidget.prototype._t = {
	"JkWidgetWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetRenderableWidget" : true,
	"JkWidgetResizeAwareWidget" : true
};
JkWidgetRenderableWidget.prototype._tobj = JkWidgetRenderableWidget;

JkWidgetRenderableWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetRenderableWidget;
	return v.CTOR_JkWidgetRenderableWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetRenderableWidget.prototype.CTOR_JkWidgetRenderableWidget_JkUiGuiApplicationContext = function(ctx) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.renderer = null;
	this.context = null;
	this.renderContext = null;
	this.context = ctx;
	this.renderContext = JkUiRenderingContextForHTMLCanvas.forElement(this.element);
	return this;
};

JkWidgetRenderableWidget.forRenderer = function(ctx, renderer) {
	var v = JkWidgetRenderableWidget.NEW_JkUiGuiApplicationContext(ctx);
	v.setRenderer(renderer);
	return v;
};

JkWidgetRenderableWidget.prototype.createElement = function() {
	return JkUiHTMLDOM.createElement("canvas");
};

JkWidgetRenderableWidget.prototype.render = function(ctx) {
	if(this.renderer != null) {
		this.renderer.render(ctx, (JkWidgetWidget.getWidth(this)), (JkWidgetWidget.getHeight(this)));
	}
};

JkWidgetRenderableWidget.prototype.redraw = function() {
	var thisWidget = this;
	window.requestAnimationFrame(function() {
		thisWidget.render(thisWidget.renderContext);
	});
	;
};

JkWidgetRenderableWidget.prototype.onWidgetResized = function() {
	JkUiHTMLDOM.setAttribute(this.element, "width", (JkLangString.safeString((JkLangString.forInteger((JkWidgetWidget.getWidth(this)))))) + ("px"));
	JkUiHTMLDOM.setAttribute(this.element, "height", (JkLangString.safeString((JkLangString.forInteger((JkWidgetWidget.getHeight(this)))))) + ("px"));
	this.redraw();
};

JkWidgetRenderableWidget.prototype.onWidgetAddedToParent = function() {
};

JkWidgetRenderableWidget.prototype.onWidgetRemovedFromParent = function() {
};

JkWidgetRenderableWidget.prototype.onWidgetAddingToParent = function() {
};

JkWidgetRenderableWidget.prototype.getRenderer = function() {
	return this.renderer;
};

JkWidgetRenderableWidget.prototype.setRenderer = function(v) {
	this.renderer = v;
	return this;
};

JkWidgetRenderableWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetRenderableWidget"] === true;
};

let JkWidgetScrollerWidget = function() {
	JkWidgetWidget.call(this);
	this.widgetOnScrolledHandlerX = null;
	this.widgetOnScrolledHandlerY = null;
	this.widgetMaximumValueX = 1000.0;
	this.widgetMaximumValueY = 1000.0;
	this.layoutHeight = -1;
	this.layoutWidth = -1;
	this.heightChanged = false;
	this.valueX = 0.0;
	this.valueY = 0.0;
	this.currentScrollX = 0;
	this.currentScrollY = 0;
	this.lastScrollX = 0;
	this.lastScrollY = 0;
	this.nearEndX = false;
	this.nearEndY = false;
};

JkWidgetScrollerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetScrollerWidget.prototype.constructor = JkWidgetScrollerWidget;
JkWidgetScrollerWidget.prototype._t = {
	"JkWidgetWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetScrollerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetScrollerWidget.prototype._tobj = JkWidgetScrollerWidget;

JkWidgetScrollerWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetScrollerWidget;
	return v.CTOR_JkWidgetScrollerWidget_JkUiGuiApplicationContext(context);
};

JkWidgetScrollerWidget.prototype.CTOR_JkWidgetScrollerWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.nearEndY = false;
	this.nearEndX = false;
	this.lastScrollY = 0;
	this.lastScrollX = 0;
	this.currentScrollY = 0;
	this.currentScrollX = 0;
	this.valueY = 0.0;
	this.valueX = 0.0;
	this.heightChanged = false;
	this.layoutWidth = -1;
	this.layoutHeight = -1;
	this.widgetMaximumValueY = 1000.0;
	this.widgetMaximumValueX = 1000.0;
	this.widgetOnScrolledHandlerY = null;
	this.widgetOnScrolledHandlerX = null;
	return this;
};

JkWidgetScrollerWidget.forWidget = function(context, widget) {
	var v = JkWidgetScrollerWidget.NEW_JkUiGuiApplicationContext(context);
	v.addWidget(widget);
	return v;
};

JkWidgetScrollerWidget.prototype.createElement = function() {
	var v = JkUiHTMLDOM.createElement("div");
	JkUiHTMLDOM.addToClassList(v, "ScrollerWidget");
	return v;
};

JkWidgetScrollerWidget.prototype.prepareElement = function(element) {
	JkWidgetWidget.prototype.prepareElement.call(this, element);
	JkUiHTMLDOM.setStyle(element, "overflow", "scroll");
	JkUiHTMLDOM.addEventListener(element, "scroll", (function() {
		this.onScroll(element.scrollLeft, element.scrollTop);
	}.bind(this)));
};

JkWidgetScrollerWidget.createNoScrollBarStyle = function() {
	if(JkWidgetScrollerWidget.noScrollBarStyleCreated) {
		return;
	}
	var styleElement = JkUiHTMLDOM.createElement("style");
	var className = "." + ("ScrollerWidget") + ("WithNoScrollBar");
	var style = null;
	if(JkUiHTMLDOM.isWebKit()) {
		style = (JkLangString.safeString(className)) + ("::-webkit-scrollbar { display: none; }");
	}
	else if(JkUiHTMLDOM.isFirefox()) {
		if(!JkUiHTMLDOM.isMobile()) {
			style = (JkLangString.safeString(className)) + (" { overflow: hidden; }\n") + (JkLangString.safeString(className)) + (":hover { overflow: auto; }");
		}
	}
	if(style != null) {
		JkUiHTMLDOM.setTextContent(styleElement, style);
		JkUiHTMLDOM.appendChild((JkUiHTMLDOM.getDocumentHead()), styleElement);
	}
	JkWidgetScrollerWidget.noScrollBarStyleCreated = true;
};

JkWidgetScrollerWidget.prototype.onScroll = function(scrollX, scrollY) {
	this.currentScrollX = scrollX;
	var cw = JkWidgetWidget.getWidth((JkLangVector.get((JkWidgetWidget.getChildren(this)), 0)));
	this.valueX = this.currentScrollX / (cw - JkWidgetWidget.getWidth(this)) * this.widgetMaximumValueX;
	if(cw > 0) {
		this.nearEndX = cw - this.currentScrollX < JkWidgetWidget.getWidth(this) * 2;
	}
	if(this.widgetOnScrolledHandlerX != null && this.lastScrollX != this.currentScrollX) {
		this.widgetOnScrolledHandlerX((this.lastScrollX < this.currentScrollX ? 0 : 1));
		this.lastScrollX = this.currentScrollX;
	}
	this.currentScrollY = scrollY;
	var ch = JkWidgetWidget.getHeight((JkLangVector.get((JkWidgetWidget.getChildren(this)), 0)));
	this.valueY = scrollY / (ch - JkWidgetWidget.getHeight(this)) * this.widgetMaximumValueY;
	if(ch > 0) {
		this.nearEndY = ch - this.currentScrollY < JkWidgetWidget.getHeight(this) * 2;
	}
	if(this.widgetOnScrolledHandlerY != null && this.lastScrollY != this.currentScrollY) {
		this.widgetOnScrolledHandlerY((this.lastScrollY < this.currentScrollY ? 0 : 1));
		this.lastScrollY = this.currentScrollY;
	}
};

JkWidgetScrollerWidget.prototype.isNearEndX = function() {
	return this.nearEndX;
};

JkWidgetScrollerWidget.prototype.isNearEndY = function() {
	return this.nearEndY;
};

JkWidgetScrollerWidget.prototype.getValueX = function() {
	return this.valueX;
};

JkWidgetScrollerWidget.prototype.getValueY = function() {
	return this.valueY;
};

JkWidgetScrollerWidget.prototype.setWidgetScrollBarDisabled = function(value) {
	if(value) {
		JkWidgetScrollerWidget.createNoScrollBarStyle();
		JkUiHTMLDOM.setStyle(this.element, "-ms-overflow-style", "none");
		JkUiHTMLDOM.addToClassList(this.element, "ScrollerWidget" + ("WithNoScrollBar"));
	}
	else {
		JkUiHTMLDOM.setStyle(this.element, "-ms-overflow-style", "scrollbar");
		JkUiHTMLDOM.removeFromClassList(this.element, "ScrollerWidget" + ("WithNoScrollBar"));
	}
};

JkWidgetScrollerWidget.prototype.onWidgetHeightChanged = function(height) {
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				if(height > this.layoutHeight) {
					JkWidgetWidget.resizeHeight(child, height);
				}
				else {
					JkWidgetWidget.resizeHeight(child, this.layoutHeight);
				}
			}
		}
	}
	this.heightChanged = true;
};

JkWidgetScrollerWidget.prototype.setWidgetLayoutChanged = function() {
};

JkWidgetScrollerWidget.prototype.hasWidgetLayoutChanged = function() {
	return false;
};

JkWidgetScrollerWidget.prototype.layoutWidget = function(widthConstraint, force) {
	var mw = 0;
	var mh = 0;
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.move(child, 0, 0);
				JkWidgetWidget.layout(child, (-1), this.heightChanged);
				var cw = JkWidgetWidget.getWidth(child);
				var ch = JkWidgetWidget.getHeight(child);
				if(cw > mw) {
					mw = cw;
				}
				if(ch > mh) {
					mh = ch;
				}
			}
		}
	}
	var mh2 = mh;
	var eh = JkWidgetWidget.getHeight(this);
	if(eh > 0 && mh2 > eh) {
		mh2 = eh;
	}
	this.heightChanged = false;
	this.layoutHeight = mh;
	this.layoutWidth = mw;
	if(widthConstraint < 0) {
		JkWidgetWidget.setLayoutSize(this, mw, mh2);
	}
	else {
		JkWidgetWidget.setLayoutSize(this, widthConstraint, mh2);
	}
	return true;
};

JkWidgetScrollerWidget.prototype.addWidget = function(widget) {
	JkWidgetWidget.addChild(this, widget);
	return this;
};

JkWidgetScrollerWidget.prototype.getWidgetOnScrolledHandlerX = function() {
	return this.widgetOnScrolledHandlerX;
};

JkWidgetScrollerWidget.prototype.setWidgetOnScrolledHandlerX = function(v) {
	this.widgetOnScrolledHandlerX = v;
	return this;
};

JkWidgetScrollerWidget.prototype.getWidgetOnScrolledHandlerY = function() {
	return this.widgetOnScrolledHandlerY;
};

JkWidgetScrollerWidget.prototype.setWidgetOnScrolledHandlerY = function(v) {
	this.widgetOnScrolledHandlerY = v;
	return this;
};

JkWidgetScrollerWidget.prototype.getWidgetMaximumValueX = function() {
	return this.widgetMaximumValueX;
};

JkWidgetScrollerWidget.prototype.setWidgetMaximumValueX = function(v) {
	this.widgetMaximumValueX = v;
	return this;
};

JkWidgetScrollerWidget.prototype.getWidgetMaximumValueY = function() {
	return this.widgetMaximumValueY;
};

JkWidgetScrollerWidget.prototype.setWidgetMaximumValueY = function(v) {
	this.widgetMaximumValueY = v;
	return this;
};

JkWidgetScrollerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetScrollerWidget"] === true;
};

JkWidgetScrollerWidget.noScrollBarStyleCreated = false;
let JkWidgetTitleContainerWidget = {};

JkWidgetTitleContainerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetTitleContainerWidget"] === true;
};

let JkWidgetHorizontalScrollerWidget = function() {
	JkWidgetWidget.call(this);
	this.onScrolledHandler = null;
	this.layoutWidth = -1;
};

JkWidgetHorizontalScrollerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetWidget.prototype);
JkWidgetHorizontalScrollerWidget.prototype.constructor = JkWidgetHorizontalScrollerWidget;
JkWidgetHorizontalScrollerWidget.prototype._t = {
	"JkWidgetHorizontalScrollerWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetHorizontalScrollerWidget.prototype._tobj = JkWidgetHorizontalScrollerWidget;

JkWidgetHorizontalScrollerWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetHorizontalScrollerWidget;
	return v.CTOR_JkWidgetHorizontalScrollerWidget_JkUiGuiApplicationContext(context);
};

JkWidgetHorizontalScrollerWidget.prototype.CTOR_JkWidgetHorizontalScrollerWidget_JkUiGuiApplicationContext = function(context) {
	if(JkWidgetWidget.prototype.CTOR_JkWidgetWidget.call(this) == null) {
		return null;
	}
	this.layoutWidth = -1;
	this.onScrolledHandler = null;
	return this;
};

JkWidgetHorizontalScrollerWidget.prototype.createElement = function() {
	return JkUiHTMLDOM.createElement("div");
};

JkWidgetHorizontalScrollerWidget.prototype.prepareElement = function(element) {
	JkWidgetWidget.prototype.prepareElement.call(this, element);
	if(JkUiHTMLDOM.isFirefox() == false) {
		JkUiHTMLDOM.setStyle(element, "overflow-x", "scroll");
	}
	else {
		JkUiHTMLDOM.removeStyle(element, "overflow");
		JkUiHTMLDOM.setStyle(element, "overflow-y", "hidden");
	}
};

JkWidgetHorizontalScrollerWidget.createNoScrollBarStyle = function() {
	if(JkWidgetHorizontalScrollerWidget.noScrollBarStyleCreated) {
		return;
	}
	var styleElement = JkUiHTMLDOM.createElement("style");
	var className = "." + ("HorizontalScrollerWidget") + ("WithNoScrollBar");
	var style = null;
	if(JkUiHTMLDOM.isWebKit()) {
		style = (JkLangString.safeString(className)) + ("::-webkit-scrollbar { display: none; }");
	}
	else if(JkUiHTMLDOM.isFirefox()) {
		style = (JkLangString.safeString(className)) + (" { overflow-x: hidden; }\n") + (JkLangString.safeString(className)) + (":hover { overflow-x: auto; }");
	}
	if(style != null) {
		JkUiHTMLDOM.setTextContent(styleElement, style);
		JkUiHTMLDOM.appendChild((JkUiHTMLDOM.getDocumentHead()), styleElement);
	}
	JkWidgetHorizontalScrollerWidget.noScrollBarStyleCreated = true;
};

JkWidgetHorizontalScrollerWidget.forWidget = function(context, widget) {
	var v = JkWidgetHorizontalScrollerWidget.NEW_JkUiGuiApplicationContext(context);
	v.addWidget(widget);
	return v;
};

JkWidgetHorizontalScrollerWidget.prototype.setWidgetLayoutChanged = function() {
};

JkWidgetHorizontalScrollerWidget.prototype.hasWidgetLayoutChanged = function() {
	return false;
};

JkWidgetHorizontalScrollerWidget.prototype.layoutWidget = function(widthConstraint, force) {
	var mw = 0;
	var mh = 0;
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.move(child, 0, 0);
				JkWidgetWidget.layout(child, (-1), false);
				var childWidth = JkWidgetWidget.getWidth(child);
				var childHeight = JkWidgetWidget.getHeight(child);
				if(childWidth > mw) {
					mw = childWidth;
				}
				if(childHeight > mh) {
					mh = childHeight;
				}
			}
		}
	}
	this.layoutWidth = mw;
	if(widthConstraint < 0) {
		JkWidgetWidget.setLayoutSize(this, mw, mh);
	}
	else {
		JkWidgetWidget.setLayoutSize(this, widthConstraint, mh);
	}
	return true;
};

JkWidgetHorizontalScrollerWidget.prototype.addWidget = function(widget) {
	JkWidgetWidget.addChild(this, widget);
	return this;
};

JkWidgetHorizontalScrollerWidget.prototype.setWidgetScrollBarDisabled = function(value) {
	if(value) {
		JkWidgetHorizontalScrollerWidget.createNoScrollBarStyle();
		JkUiHTMLDOM.setStyle(this.element, "-ms-overflow-style", "none");
		JkUiHTMLDOM.addToClassList(this.element, "HorizontalScrollerWidget" + ("WithNoScrollBar"));
	}
	else {
		JkUiHTMLDOM.setStyle(this.element, "-ms-overflow-style", "scrollbar");
		JkUiHTMLDOM.removeFromClassList(this.element, "HorizontalScrollerWidget" + ("WithNoScrollBar"));
	}
};

JkWidgetHorizontalScrollerWidget.prototype.getOnScrolledHandler = function() {
	return this.onScrolledHandler;
};

JkWidgetHorizontalScrollerWidget.prototype.setOnScrolledHandler = function(v) {
	this.onScrolledHandler = v;
	return this;
};

JkWidgetHorizontalScrollerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetHorizontalScrollerWidget"] === true;
};

JkWidgetHorizontalScrollerWidget.noScrollBarStyleCreated = false;

let JkWidgetResponsiveWidget = function() {
	JkWidgetLayerWithBackgroundColorWidget.call(this);
	this.widgetNarrowWidth = 0;
	this.isNarrowInitialized = false;
	this.isWideInitialized = false;
};

JkWidgetResponsiveWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWithBackgroundColorWidget.prototype);
JkWidgetResponsiveWidget.prototype.constructor = JkWidgetResponsiveWidget;
JkWidgetResponsiveWidget.prototype._t = {
	"JkWidgetResizeAwareWidget" : true,
	"JkWidgetLayerWithBackgroundColorWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetResponsiveWidget" : true
};
JkWidgetResponsiveWidget.prototype._tobj = JkWidgetResponsiveWidget;

JkWidgetResponsiveWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetResponsiveWidget;
	return v.CTOR_JkWidgetResponsiveWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetResponsiveWidget.prototype.CTOR_JkWidgetResponsiveWidget_JkUiGuiApplicationContext = function(ctx) {
	this.isWideInitialized = false;
	this.isNarrowInitialized = false;
	this.widgetNarrowWidth = 0;
	if(JkWidgetLayerWithBackgroundColorWidget.prototype.CTOR_JkWidgetLayerWithBackgroundColorWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	return this;
};

JkWidgetResponsiveWidget.prototype.onWidgetResized = function() {
	if(this.widgetNarrowWidth <= 0) {
		this.widgetNarrowWidth = this.context.getHeightValue("150mm");
	}
	var width = JkWidgetWidget.getWidth(this);
	if(width < this.widgetNarrowWidth && !this.isNarrowInitialized) {
		this.onNarrowLayout();
		this.isNarrowInitialized = true;
		this.isWideInitialized = false;
	}
	else if(width > this.widgetNarrowWidth && !this.isWideInitialized) {
		this.onWideLayout();
		this.isWideInitialized = true;
		this.isNarrowInitialized = false;
	}
};

JkWidgetResponsiveWidget.prototype.onNarrowLayout = function() {
	this.checkForNarrow(this);
};

JkWidgetResponsiveWidget.prototype.onWideLayout = function() {
	this.checkForWide(this);
};

JkWidgetResponsiveWidget.prototype.checkForNarrow = function(widget) {
	if(JkWidgetResponsiveAwareWidget.IS_INSTANCE && JkWidgetResponsiveAwareWidget.IS_INSTANCE(widget)) {
		(function(o) {
			if(JkWidgetResponsiveAwareWidget.IS_INSTANCE && JkWidgetResponsiveAwareWidget.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))(widget).doNarrowLayout();
	}
	if(JkWidgetContainerWidget.IS_INSTANCE && JkWidgetContainerWidget.IS_INSTANCE(widget) || JkWidgetVerticalScrollerWidget.IS_INSTANCE && JkWidgetVerticalScrollerWidget.IS_INSTANCE(widget)) {
		var children = JkWidgetWidget.getChildren(widget);
		if(children != null) {
			var n = 0;
			var m = children.length;
			for(n = 0 ; n < m ; n++) {
				var child = children[n];
				if(child != null) {
					this.checkForNarrow(child);
				}
			}
		}
	}
};

JkWidgetResponsiveWidget.prototype.checkForWide = function(widget) {
	if(JkWidgetResponsiveAwareWidget.IS_INSTANCE && JkWidgetResponsiveAwareWidget.IS_INSTANCE(widget)) {
		(function(o) {
			if(JkWidgetResponsiveAwareWidget.IS_INSTANCE && JkWidgetResponsiveAwareWidget.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))(widget).doWideLayout();
	}
	if(JkWidgetContainerWidget.IS_INSTANCE && JkWidgetContainerWidget.IS_INSTANCE(widget) || JkWidgetVerticalScrollerWidget.IS_INSTANCE && JkWidgetVerticalScrollerWidget.IS_INSTANCE(widget)) {
		var children = JkWidgetWidget.getChildren(widget);
		if(children != null) {
			var n = 0;
			var m = children.length;
			for(n = 0 ; n < m ; n++) {
				var child = children[n];
				if(child != null) {
					this.checkForWide(child);
				}
			}
		}
	}
};

JkWidgetResponsiveWidget.prototype.getWidgetNarrowWidth = function() {
	return this.widgetNarrowWidth;
};

JkWidgetResponsiveWidget.prototype.setWidgetNarrowWidth = function(v) {
	this.widgetNarrowWidth = v;
	return this;
};

JkWidgetResponsiveWidget.prototype.getIsNarrowInitialized = function() {
	return this.isNarrowInitialized;
};

JkWidgetResponsiveWidget.prototype.setIsNarrowInitialized = function(v) {
	this.isNarrowInitialized = v;
	return this;
};

JkWidgetResponsiveWidget.prototype.getIsWideInitialized = function() {
	return this.isWideInitialized;
};

JkWidgetResponsiveWidget.prototype.setIsWideInitialized = function(v) {
	this.isWideInitialized = v;
	return this;
};

JkWidgetResponsiveWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetResponsiveWidget"] === true;
};

let JkWidgetIdAwareWidget = {};

JkWidgetIdAwareWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetIdAwareWidget"] === true;
};

let JkWidgetStaticWidgetProvider = function() {
	this.widgets = null;
	this.current = 0;
};

JkWidgetStaticWidgetProvider.prototype._t = {
	"JkWidgetWidgetProvider" : true,
	"JkWidgetStaticWidgetProvider" : true
};
JkWidgetStaticWidgetProvider.prototype._tobj = JkWidgetStaticWidgetProvider;

JkWidgetStaticWidgetProvider.NEW = function() {
	var v = new JkWidgetStaticWidgetProvider;
	return v.CTOR_JkWidgetStaticWidgetProvider();
};

JkWidgetStaticWidgetProvider.prototype.CTOR_JkWidgetStaticWidgetProvider = function() {
	this.current = 0;
	this.widgets = null;
	return this;
};

JkWidgetStaticWidgetProvider.forWidgets = function(widgets) {
	var v = JkWidgetStaticWidgetProvider.NEW();
	v.setWidgets(widgets);
	return v;
};

JkWidgetStaticWidgetProvider.prototype.getNextWidget = function() {
	if(!(this.widgets != null)) {
		return null;
	}
	var v = JkLangVector.get(this.widgets, this.current);
	if(v != null) {
		this.current++;
	}
	return v;
};

JkWidgetStaticWidgetProvider.prototype.getTotalCount = function() {
	return JkLangVector.getSize(this.widgets);
};

JkWidgetStaticWidgetProvider.prototype.reset = function() {
	this.current = 0;
};

JkWidgetStaticWidgetProvider.prototype.getWidgets = function() {
	return this.widgets;
};

JkWidgetStaticWidgetProvider.prototype.setWidgets = function(v) {
	this.widgets = v;
	return this;
};

JkWidgetStaticWidgetProvider.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetStaticWidgetProvider"] === true;
};
