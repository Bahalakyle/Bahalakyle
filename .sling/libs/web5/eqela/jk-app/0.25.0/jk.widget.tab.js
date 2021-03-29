let JkWidgetTabTabContentWidget = {};

JkWidgetTabTabContentWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetTabTabContentWidget"] === true;
};

let JkWidgetTabTabContainerWidgetTabTitleContainerWidget = function() {
	JkWidgetContainerWidget.call(this);
	this.children = null;
};

JkWidgetTabTabContainerWidgetTabTitleContainerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetContainerWidget.prototype);
JkWidgetTabTabContainerWidgetTabTitleContainerWidget.prototype.constructor = JkWidgetTabTabContainerWidgetTabTitleContainerWidget;
JkWidgetTabTabContainerWidgetTabTitleContainerWidget.prototype._t = {
	"JkWidgetTabTabContainerWidgetTabTitleContainerWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetTabTabContainerWidgetTabTitleContainerWidget.prototype._tobj = JkWidgetTabTabContainerWidgetTabTitleContainerWidget;

JkWidgetTabTabContainerWidgetTabTitleContainerWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetTabTabContainerWidgetTabTitleContainerWidget;
	return v.CTOR_JkWidgetTabTabContainerWidgetTabTitleContainerWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetTabTabContainerWidgetTabTitleContainerWidget.prototype.CTOR_JkWidgetTabTabContainerWidgetTabTitleContainerWidget_JkUiGuiApplicationContext = function(ctx) {
	this.children = null;
	if(JkWidgetContainerWidget.prototype.CTOR_JkWidgetContainerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.children = new Array;
	return this;
};

JkWidgetTabTabContainerWidgetTabTitleContainerWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	var mw = 0;
	var mh = 0;
	if(this.children != null) {
		var n = 0;
		var m = this.children.length;
		for(n = 0 ; n < m ; n++) {
			var child = this.children[n];
			if(child != null) {
				JkWidgetWidget.layout(child, (-1), false);
				JkWidgetWidget.move(child, mw, 0);
				mw += JkWidgetWidget.getWidth(child);
				var ch = JkWidgetWidget.getHeight(child);
				if(ch > mh) {
					mh = ch;
				}
			}
		}
	}
	JkWidgetWidget.setLayoutSize(this, widthConstraint, mh);
};

JkWidgetTabTabContainerWidgetTabTitleContainerWidget.prototype.addWidget = function(widget) {
	return this.addWidget1(widget, (-1));
};

JkWidgetTabTabContainerWidgetTabTitleContainerWidget.prototype.addWidget1 = function(widget, index) {
	if(widget != null) {
		if(index > -1) {
			JkLangVector.insert(this.children, widget, index);
		}
		else {
			this.children.push(widget);
		}
		JkWidgetWidget.addChild(this, widget);
	}
	this.updateIndexes();
	return this;
};

JkWidgetTabTabContainerWidgetTabTitleContainerWidget.prototype.onChildWidgetAdded = function(widget) {
	var v = new Array;
	v.push(widget);
	JkWidgetContainerWidget.prototype.onChildWidgetsRemoved.call(this, v);
};

JkWidgetTabTabContainerWidgetTabTitleContainerWidget.prototype.onChildWidgetsRemoved = function(widgets) {
	var update = false;
	if(widgets != null) {
		var n = 0;
		var m = widgets.length;
		for(n = 0 ; n < m ; n++) {
			var widget = widgets[n];
			if(widget != null) {
				if(JkLangVector.removeValue(this.children, widget) > -1) {
					update = true;
				}
			}
		}
	}
	if(update) {
		this.updateIndexes();
	}
	JkWidgetContainerWidget.prototype.onChildWidgetsRemoved.call(this, widgets);
};

JkWidgetTabTabContainerWidgetTabTitleContainerWidget.prototype.updateIndexes = function() {
	var nv = new Array;
	if(this.children != null) {
		var n = 0;
		var m = this.children.length;
		for(n = 0 ; n < m ; n++) {
			var child = this.children[n];
			if(child != null) {
				nv.push(child);
			}
		}
	}
	this.children = nv;
};

JkWidgetTabTabContainerWidgetTabTitleContainerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetTabTabContainerWidgetTabTitleContainerWidget"] === true;
};

let JkWidgetTabTabContainerWidgetMyContainerWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetParent = null;
};

JkWidgetTabTabContainerWidgetMyContainerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetTabTabContainerWidgetMyContainerWidget.prototype.constructor = JkWidgetTabTabContainerWidgetMyContainerWidget;
JkWidgetTabTabContainerWidgetMyContainerWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetTabTabContainerWidgetMyContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetTabTabContainerWidgetMyContainerWidget.prototype._tobj = JkWidgetTabTabContainerWidgetMyContainerWidget;

JkWidgetTabTabContainerWidgetMyContainerWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetTabTabContainerWidgetMyContainerWidget;
	return v.CTOR_JkWidgetTabTabContainerWidgetMyContainerWidget_JkUiGuiApplicationContext(context);
};

JkWidgetTabTabContainerWidgetMyContainerWidget.prototype.CTOR_JkWidgetTabTabContainerWidgetMyContainerWidget_JkUiGuiApplicationContext = function(context) {
	this.widgetParent = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetTabTabContainerWidgetMyContainerWidget.prototype.onChildWidgetsRemoved = function(widgets) {
	JkWidgetWidget.onLayoutChanged(this);
	if(!(this.widgetParent != null)) {
		return;
	}
	if(widgets != null) {
		var n = 0;
		var m = widgets.length;
		for(n = 0 ; n < m ; n++) {
			var widget = widgets[n];
			if(widget != null) {
				var w = (function(o) {
					if(JkWidgetTabTabContentWidget.IS_INSTANCE && JkWidgetTabTabContentWidget.IS_INSTANCE(o)) {
						return o;
					}
					return null;
				}.bind(this))(widget);
				if(w != null) {
					var title = w.getTabContentTitle();
					var tab = this.widgetParent.getTabObject(title);
					JkWidgetWidget.removeFromParent(tab.item);
					this.widgetParent.removeTabObject(title);
				}
			}
		}
	}
};

JkWidgetTabTabContainerWidgetMyContainerWidget.prototype.getWidgetParent = function() {
	return this.widgetParent;
};

JkWidgetTabTabContainerWidgetMyContainerWidget.prototype.setWidgetParent = function(v) {
	this.widgetParent = v;
	return this;
};

JkWidgetTabTabContainerWidgetMyContainerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetTabTabContainerWidgetMyContainerWidget"] === true;
};

let JkWidgetTabTabContainerWidgetTabObject = function() {
	this.title = null;
	this.index = 0;
	this.item = null;
	this.content = null;
};

JkWidgetTabTabContainerWidgetTabObject.prototype._t = { "JkWidgetTabTabContainerWidgetTabObject" : true };
JkWidgetTabTabContainerWidgetTabObject.prototype._tobj = JkWidgetTabTabContainerWidgetTabObject;

JkWidgetTabTabContainerWidgetTabObject.NEW = function() {
	var v = new JkWidgetTabTabContainerWidgetTabObject;
	return v.CTOR_JkWidgetTabTabContainerWidgetTabObject();
};

JkWidgetTabTabContainerWidgetTabObject.prototype.CTOR_JkWidgetTabTabContainerWidgetTabObject = function() {
	this.content = null;
	this.item = null;
	this.index = 0;
	this.title = null;
	return this;
};

JkWidgetTabTabContainerWidgetTabObject.prototype.setOnTabClickHandler = function(handler) {
	var hdl = handler;
	var obj = this;
	JkWidgetWidget.setWidgetClickHandler(this.item, (function() {
		hdl(obj);
	}.bind(this)));
};

JkWidgetTabTabContainerWidgetTabObject.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetTabTabContainerWidgetTabObject"] === true;
};

let JkWidgetTabTabItemCreator = {};

JkWidgetTabTabItemCreator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetTabTabItemCreator"] === true;
};

let JkWidgetTabTabItemWidget = {};

JkWidgetTabTabItemWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetTabTabItemWidget"] === true;
};

let JkWidgetTabTabContainerWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.beforeTabSwitchEventHandler = null;
	this.tabSwitchEventHandler = null;
	this.tabItemCreator = null;
	this.tabCollection = null;
	this.currentTab = null;
	this.tabTitleContainer = null;
	this.canvas = null;
	this.tabContentContainer = null;
};

JkWidgetTabTabContainerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetTabTabContainerWidget.prototype.constructor = JkWidgetTabTabContainerWidget;
JkWidgetTabTabContainerWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetTabTabContainerWidget" : true
};
JkWidgetTabTabContainerWidget.prototype._tobj = JkWidgetTabTabContainerWidget;

JkWidgetTabTabContainerWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetTabTabContainerWidget;
	return v.CTOR_JkWidgetTabTabContainerWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetTabTabContainerWidget.prototype.CTOR_JkWidgetTabTabContainerWidget_JkUiGuiApplicationContext = function(ctx) {
	this.tabContentContainer = null;
	this.canvas = null;
	this.tabTitleContainer = null;
	this.currentTab = null;
	this.tabCollection = null;
	this.tabItemCreator = null;
	this.tabSwitchEventHandler = null;
	this.beforeTabSwitchEventHandler = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.tabItemCreator = JkWidgetTabTabContainerWidgetDefaultTabItemCreator.NEW().setContext(ctx);
	this.tabCollection = new Array;
	this.forceCreateWidget();
	return this;
};

JkWidgetTabTabContainerWidget.findTabContainerWidget = function(widget) {
	var pp = JkWidgetWidget.getParent(widget);
	while(pp != null){
		if(JkWidgetTabTabContainerWidget.IS_INSTANCE && JkWidgetTabTabContainerWidget.IS_INSTANCE(pp)) {
			return pp;
		}
		pp = JkWidgetWidget.getParent(pp);
	}
	return null;
};

JkWidgetTabTabContainerWidget.pushTab = function(tab, parent) {
	var tabs = JkWidgetTabTabContainerWidget.findTabContainerWidget(parent);
	if(!(tabs != null)) {
		return false;
	}
	tabs.addTab(tab);
	return true;
};

JkWidgetTabTabContainerWidget.prototype.addTab = function(widget) {
	if(!(widget != null)) {
		return;
	}
	var title = widget.getTabContentTitle();
	if(!(title != null)) {
		title = "";
	}
	var v = this.tabItemCreator.createTabItemWidgetFor(title);
	if(this.tabItemCreator.isXButtonEnabled()) {
		var box = this.tabItemCreator.addXButton(((function(o) {
			if(JkWidgetTabTabItemWidget.IS_INSTANCE && JkWidgetTabTabItemWidget.IS_INSTANCE(o)) {
				return o;
			}
			return null;
		}.bind(this))(v)), this);
		this.tabTitleContainer.addWidget(box);
	}
	else {
		this.tabTitleContainer.addWidget(v);
	}
	var tab = JkWidgetTabTabContainerWidgetTabObject.NEW();
	tab.title = title;
	tab.item = v;
	tab.index = this.tabCollection.length;
	tab.content = (function(o1) {
		if(JkWidgetWidget.IS_INSTANCE && JkWidgetWidget.IS_INSTANCE(o1)) {
			return o1;
		}
		return null;
	}.bind(this))(widget);
	tab.setOnTabClickHandler((function(to1) {
		this.updateSelectedTab(to1, false);
	}.bind(this)));
	this.addTabObject(tab);
	this.updateSelectedTab(tab, true);
};

JkWidgetTabTabContainerWidget.prototype.removeTab = function(title) {
	var obj = this.getTabObject(title);
	if(!(obj != null)) {
		return;
	}
	JkWidgetWidget.removeFromParent(obj.item);
	JkWidgetWidget.removeFromParent(obj.content);
	var idx = this.currentTab.index;
	this.removeTabObject(title);
	this.updateTabIndexes();
	if(this.tabCollection.length == idx) {
		idx = idx - 1;
	}
	this.setActiveTab(idx);
};

JkWidgetTabTabContainerWidget.prototype.updateTabIndexes = function() {
	var idx = 0;
	if(this.tabCollection != null) {
		var n = 0;
		var m = this.tabCollection.length;
		for(n = 0 ; n < m ; n++) {
			var tab = this.tabCollection[n];
			if(tab != null) {
				tab.index = idx;
				idx++;
			}
		}
	}
};

JkWidgetTabTabContainerWidget.prototype.addTabObject = function(tab) {
	this.tabCollection.push(tab);
};

JkWidgetTabTabContainerWidget.prototype.getTabObject = function(title) {
	var tabObject = null;
	if(this.tabCollection != null) {
		var n = 0;
		var m = this.tabCollection.length;
		for(n = 0 ; n < m ; n++) {
			var tab = this.tabCollection[n];
			if(tab != null) {
				if(tab.title == title) {
					tabObject = tab;
					break;
				}
			}
		}
	}
	return tabObject;
};

JkWidgetTabTabContainerWidget.prototype.removeTabObject = function(title) {
	var tab = this.getTabObject(title);
	if(!(tab != null)) {
		return;
	}
	JkLangVector.removeValue(this.tabCollection, tab);
};

JkWidgetTabTabContainerWidget.prototype.updateSelectedTab = function(tab, newTab) {
	if(!(tab != this.currentTab)) {
		return;
	}
	if(this.currentTab != null) {
		this.currentTab.item.onTabDeselected();
		JkWidgetWidget.setVisible(this.currentTab.content, false);
	}
	var oldTab = this.currentTab;
	this.currentTab = tab;
	this.currentTab.item.onTabSelected();
	if(this.beforeTabSwitchEventHandler != null) {
		var tabCancel = JkLangBoolean.NEW();
		this.beforeTabSwitchEventHandler(this.currentTab.index, tabCancel);
		if(tabCancel.toBoolean()) {
			return;
		}
	}
	if(newTab) {
		if(!JkWidgetWidget.getVisible(this)) {
			JkWidgetWidget.setVisible(this.currentTab.content, true);
		}
		this.tabContentContainer.addWidget(this.currentTab.content);
	}
	else {
		JkWidgetWidget.setVisible(this.currentTab.content, true);
	}
	if(JkWidgetDisplayAwareWidget.IS_INSTANCE && JkWidgetDisplayAwareWidget.IS_INSTANCE(this.currentTab.content)) {
		this.currentTab.content.onWidgetDisplayed();
	}
	if(this.tabSwitchEventHandler != null) {
		this.tabSwitchEventHandler(oldTab.index);
	}
};

JkWidgetTabTabContainerWidget.prototype.setWidgetContentOutlineColor = function(color) {
	this.canvas.setWidgetOutlineColor(color);
	return this;
};

JkWidgetTabTabContainerWidget.prototype.setWidgetContentOutlineWidth = function(width) {
	this.canvas.setWidgetOutlineWidth(width);
	return this;
};

JkWidgetTabTabContainerWidget.prototype.getTabItemWidget1 = function(title) {
	var tabObject = this.getTabObject(title);
	if(!(tabObject != null)) {
		return null;
	}
	return tabObject.item;
};

JkWidgetTabTabContainerWidget.prototype.getActiveTabIndex = function() {
	if(!(this.currentTab != null)) {
		return -1;
	}
	return this.currentTab.index;
};

JkWidgetTabTabContainerWidget.prototype.setTabEnabled = function(index, enable) {
	var ee = enable;
	var tabObject = JkLangVector.get(this.tabCollection, index);
	if(!(tabObject != null)) {
		return;
	}
	tabObject.setOnTabClickHandler((function(to1) {
		if(ee) {
			this.updateSelectedTab(to1, false);
		}
	}.bind(this)));
};

JkWidgetTabTabContainerWidget.prototype.getTabItemWidget2 = function(index) {
	var tabObject = JkLangVector.get(this.tabCollection, index);
	if(!(tabObject != null)) {
		return null;
	}
	return tabObject.item;
};

JkWidgetTabTabContainerWidget.prototype.setActiveTab = function(index) {
	var tabObject = JkLangVector.get(this.tabCollection, index);
	if(!(tabObject != null)) {
		return;
	}
	this.updateSelectedTab(tabObject, false);
};

JkWidgetTabTabContainerWidget.prototype.getTabContentWidget = function(index) {
	var tabObject = JkLangVector.get(this.tabCollection, index);
	if(!(tabObject != null)) {
		return null;
	}
	return tabObject.content;
};

JkWidgetTabTabContainerWidget.prototype.getTabCount = function() {
	return JkLangVector.getSize(this.tabCollection);
};

JkWidgetTabTabContainerWidget.prototype.setTabVisible = function(index, v) {
	var tabObject = JkLangVector.get(this.tabCollection, index);
	if(!(tabObject != null)) {
		return;
	}
	if(!v) {
		JkWidgetWidget.removeFromParent(tabObject.item);
	}
	else if(!JkWidgetWidget.hasParent(tabObject.item)) {
		this.tabTitleContainer.addWidget1(tabObject.item, index);
	}
	if(this.currentTab == tabObject) {
		JkWidgetWidget.setVisible(tabObject.content, v);
		if(v && (JkWidgetDisplayAwareWidget.IS_INSTANCE && JkWidgetDisplayAwareWidget.IS_INSTANCE(tabObject.content))) {
			tabObject.content.onWidgetDisplayed();
		}
		if(!v) {
			this.setActiveTab(0);
		}
	}
};

JkWidgetTabTabContainerWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	var widget = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.tabTitleContainer = JkWidgetTabTabContainerWidgetTabTitleContainerWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget.addWidget(this.tabTitleContainer);
	this.canvas = JkWidgetLayerWithBackgroundColorWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.tabContentContainer = JkWidgetTabTabContainerWidgetMyContainerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.tabContentContainer.setWidgetParent(this);
	this.canvas.addWidget(this.tabContentContainer);
	widget.addWidget1(this.canvas, 1.0);
	this.addWidget(widget);
};

JkWidgetTabTabContainerWidget.prototype.getBeforeTabSwitchEventHandler = function() {
	return this.beforeTabSwitchEventHandler;
};

JkWidgetTabTabContainerWidget.prototype.setBeforeTabSwitchEventHandler = function(v) {
	this.beforeTabSwitchEventHandler = v;
	return this;
};

JkWidgetTabTabContainerWidget.prototype.getTabSwitchEventHandler = function() {
	return this.tabSwitchEventHandler;
};

JkWidgetTabTabContainerWidget.prototype.setTabSwitchEventHandler = function(v) {
	this.tabSwitchEventHandler = v;
	return this;
};

JkWidgetTabTabContainerWidget.prototype.getTabItemCreator = function() {
	return this.tabItemCreator;
};

JkWidgetTabTabContainerWidget.prototype.setTabItemCreator = function(v) {
	this.tabItemCreator = v;
	return this;
};

JkWidgetTabTabContainerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetTabTabContainerWidget"] === true;
};

let JkWidgetTabTabContainerWidgetDefaultTabItemCreator = function() {
	this.context = null;
};

JkWidgetTabTabContainerWidgetDefaultTabItemCreator.prototype._t = {
	"JkWidgetTabTabItemCreator" : true,
	"JkWidgetTabTabContainerWidgetDefaultTabItemCreator" : true
};
JkWidgetTabTabContainerWidgetDefaultTabItemCreator.prototype._tobj = JkWidgetTabTabContainerWidgetDefaultTabItemCreator;

JkWidgetTabTabContainerWidgetDefaultTabItemCreator.NEW = function() {
	var v = new JkWidgetTabTabContainerWidgetDefaultTabItemCreator;
	return v.CTOR_JkWidgetTabTabContainerWidgetDefaultTabItemCreator();
};

JkWidgetTabTabContainerWidgetDefaultTabItemCreator.prototype.CTOR_JkWidgetTabTabContainerWidgetDefaultTabItemCreator = function() {
	this.context = null;
	return this;
};

JkWidgetTabTabContainerWidgetDefaultTabItemCreator.prototype.createTabItemWidgetFor = function(title) {
	var v = JkWidgetTabTabContainerWidgetDefaultTabItemWidget.NEW_JkUiGuiApplicationContext(this.context);
	v.setTabTitle(title);
	return v;
};

JkWidgetTabTabContainerWidgetDefaultTabItemCreator.prototype.addXButton = function(item, tabContainer) {
	return (function(o) {
		if(JkWidgetWidget.IS_INSTANCE && JkWidgetWidget.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))(item);
};

JkWidgetTabTabContainerWidgetDefaultTabItemCreator.prototype.isXButtonEnabled = function() {
	return false;
};

JkWidgetTabTabContainerWidgetDefaultTabItemCreator.prototype.getContext = function() {
	return this.context;
};

JkWidgetTabTabContainerWidgetDefaultTabItemCreator.prototype.setContext = function(v) {
	this.context = v;
	return this;
};

JkWidgetTabTabContainerWidgetDefaultTabItemCreator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetTabTabContainerWidgetDefaultTabItemCreator"] === true;
};

let JkWidgetTabTabWidgetTabHeaderWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.index = 0;
	this.container = null;
	this.headerBackground = null;
	this.headerPadding = null;
	this.headerTitle = null;
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetTabTabWidgetTabHeaderWidget.prototype.constructor = JkWidgetTabTabWidgetTabHeaderWidget;
JkWidgetTabTabWidgetTabHeaderWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetTabTabWidgetTabHeaderWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetTabTabWidgetTabHeaderWidget.prototype._tobj = JkWidgetTabTabWidgetTabHeaderWidget;

JkWidgetTabTabWidgetTabHeaderWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetTabTabWidgetTabHeaderWidget;
	return v.CTOR_JkWidgetTabTabWidgetTabHeaderWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.CTOR_JkWidgetTabTabWidgetTabHeaderWidget_JkUiGuiApplicationContext = function(ctx) {
	this.headerTitle = null;
	this.headerPadding = null;
	this.headerBackground = null;
	this.container = null;
	this.index = 0;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.forceCreateWidget();
	return this;
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	JkWidgetWidget.setWidgetClickHandler(this, (function() {
		this.container.updateSelectedTab(this.index);
	}.bind(this)));
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.setHeaderMargin = function(tabHeaderPadding) {
	this.headerPadding.setWidgetMargin(tabHeaderPadding);
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.setHeaderTitle = function(text) {
	this.headerTitle.setWidgetText(text);
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.setHeaderTitleAlign = function(align) {
	this.headerTitle.setWidgetTextAlign(align);
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.setHeaderBackground = function(color) {
	this.headerBackground.setWidgetColor(color);
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.setHeaderOutlineColor = function(color) {
	this.headerBackground.setWidgetOutlineColor(color);
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.setWidgetRoundingRadius = function(radius) {
	this.headerBackground.setWidgetRoundingRadius1(radius);
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.setHeaderOutlineWidth = function(width) {
	this.headerBackground.setWidgetOutlineWidth(width);
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.setHeaderTextColor = function(color) {
	this.headerTitle.setWidgetTextColor(color);
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.headerBackground = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.addWidget(this.headerBackground);
	this.headerPadding = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.headerTitle = JkWidgetLabelWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.headerTitle.setWidgetText("Tab Header");
	this.headerPadding.addWidget(this.headerTitle);
	this.addWidget(this.headerPadding);
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.getIndex = function() {
	return this.index;
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.setIndex = function(v) {
	this.index = v;
	return this;
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.getContainer = function() {
	return this.container;
};

JkWidgetTabTabWidgetTabHeaderWidget.prototype.setContainer = function(v) {
	this.container = v;
	return this;
};

JkWidgetTabTabWidgetTabHeaderWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetTabTabWidgetTabHeaderWidget"] === true;
};

let JkWidgetTabTabWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetTabOutlineColor = null;
	this.widgetTabOutlineWidth = 0;
	this.widgetContentOutlineColor = null;
	this.widgetContentOutlineWidth = 0;
	this.widgetTabContent = null;
	this.widgetSelectedTabBackgroundColor = null;
	this.widgetSelectedTabTextColor = null;
	this.widgetUnselectedTabBackgroundColor = null;
	this.widgetUnselectedTabTextColor = null;
	this.widgetTabHeaderTitleMargin = 0;
	this.widgetRoundingRadius = 0;
	this.widgetTextAlign = 0;
	this.widgetContentSpacing = 0;
	this.widgetTabContentRoundingRadius = 0;
	this.widgetOnTabChangeListener = null;
	this.container = null;
	this.tabHeadersBackground = null;
	this.tabHeaders = null;
	this.background = null;
	this.content = null;
};

JkWidgetTabTabWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetTabTabWidget.prototype.constructor = JkWidgetTabTabWidget;
JkWidgetTabTabWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetTabTabWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetTabTabWidget.prototype._tobj = JkWidgetTabTabWidget;

JkWidgetTabTabWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetTabTabWidget;
	return v.CTOR_JkWidgetTabTabWidget_JkUiGuiApplicationContext(context);
};

JkWidgetTabTabWidget.prototype.CTOR_JkWidgetTabTabWidget_JkUiGuiApplicationContext = function(context) {
	this.content = null;
	this.background = null;
	this.tabHeaders = null;
	this.tabHeadersBackground = null;
	this.container = null;
	this.widgetOnTabChangeListener = null;
	this.widgetTabContentRoundingRadius = 0;
	this.widgetContentSpacing = 0;
	this.widgetTextAlign = 0;
	this.widgetRoundingRadius = 0;
	this.widgetTabHeaderTitleMargin = 0;
	this.widgetUnselectedTabTextColor = null;
	this.widgetUnselectedTabBackgroundColor = null;
	this.widgetSelectedTabTextColor = null;
	this.widgetSelectedTabBackgroundColor = null;
	this.widgetTabContent = null;
	this.widgetContentOutlineWidth = 0;
	this.widgetContentOutlineColor = null;
	this.widgetTabOutlineWidth = 0;
	this.widgetTabOutlineColor = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetTabTabWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	if(!(this.widgetTabContent != null)) {
		return;
	}
	this.container.setWidgetSpacing(this.widgetContentSpacing);
	if(this.widgetContentOutlineColor != null) {
		this.background.setWidgetOutlineColor(this.widgetContentOutlineColor);
	}
	this.background.setWidgetOutlineWidth(this.widgetContentOutlineWidth);
	this.background.setWidgetRoundingRadius1(this.widgetTabContentRoundingRadius);
	this.tabHeadersBackground.setWidgetRoundingRadius1(this.widgetRoundingRadius);
	for(var i = 0 ; i < JkLangVector.getSize(this.widgetTabContent) ; i++) {
		var d = JkLangVector.get(this.widgetTabContent, i);
		if(!(d != null)) {
			continue;
		}
		var h = JkWidgetTabTabWidgetTabHeaderWidget.NEW_JkUiGuiApplicationContext(this.context);
		h.setHeaderMargin(this.widgetTabHeaderTitleMargin);
		h.setContainer(this);
		h.setIndex(i);
		h.setHeaderTitle((d.getString("header", null)));
		h.setHeaderTitleAlign(this.widgetTextAlign);
		if(this.widgetTabOutlineColor != null) {
			h.setHeaderOutlineColor(this.widgetTabOutlineColor);
		}
		h.setHeaderOutlineWidth(this.widgetTabOutlineWidth);
		this.tabHeaders.addWidget1(h, 1.0);
	}
	this.updateSelectedTab(0);
};

JkWidgetTabTabWidget.prototype.updateSelectedTab = function(idx) {
	var w = JkWidgetWidget.getChildren(this.tabHeaders);
	for(var i = 0 ; i < w.length ; i++) {
		if(i == idx) {
			if(!(this.widgetSelectedTabBackgroundColor != null)) {
				this.widgetSelectedTabBackgroundColor = JkGfxColor.white();
			}
			if(!(this.widgetSelectedTabTextColor != null)) {
				this.widgetSelectedTabTextColor = JkGfxColor.black();
			}
			(function(o) {
				if(JkWidgetTabTabWidgetTabHeaderWidget.IS_INSTANCE && JkWidgetTabTabWidgetTabHeaderWidget.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))(w[idx]).setHeaderBackground(this.widgetSelectedTabBackgroundColor);
			(function(o1) {
				if(JkWidgetTabTabWidgetTabHeaderWidget.IS_INSTANCE && JkWidgetTabTabWidgetTabHeaderWidget.IS_INSTANCE(o1)) {
					return o1;
				}
				return null;
			}.bind(this))(w[idx]).setHeaderTextColor(this.widgetSelectedTabTextColor);
			(function(o2) {
				if(JkWidgetTabTabWidgetTabHeaderWidget.IS_INSTANCE && JkWidgetTabTabWidgetTabHeaderWidget.IS_INSTANCE(o2)) {
					return o2;
				}
				return null;
			}.bind(this))(w[idx]).setWidgetRoundingRadius(this.widgetRoundingRadius);
			continue;
		}
		if(!(this.widgetUnselectedTabBackgroundColor != null)) {
			this.widgetUnselectedTabBackgroundColor = JkGfxColor.forRGB(128, 128, 128);
		}
		if(!(this.widgetUnselectedTabTextColor != null)) {
			this.widgetUnselectedTabTextColor = JkGfxColor.forRGB(80, 80, 80);
		}
		(function(o3) {
			if(JkWidgetTabTabWidgetTabHeaderWidget.IS_INSTANCE && JkWidgetTabTabWidgetTabHeaderWidget.IS_INSTANCE(o3)) {
				return o3;
			}
			return null;
		}.bind(this))(w[i]).setHeaderBackground(this.widgetUnselectedTabBackgroundColor);
		(function(o4) {
			if(JkWidgetTabTabWidgetTabHeaderWidget.IS_INSTANCE && JkWidgetTabTabWidgetTabHeaderWidget.IS_INSTANCE(o4)) {
				return o4;
			}
			return null;
		}.bind(this))(w[i]).setHeaderTextColor(this.widgetUnselectedTabTextColor);
		(function(o5) {
			if(JkWidgetTabTabWidgetTabHeaderWidget.IS_INSTANCE && JkWidgetTabTabWidgetTabHeaderWidget.IS_INSTANCE(o5)) {
				return o5;
			}
			return null;
		}.bind(this))(w[i]).setWidgetRoundingRadius(this.widgetRoundingRadius);
	}
	this.updateContent(idx);
};

JkWidgetTabTabWidget.prototype.updateContent = function(idx) {
	JkWidgetWidget.removeChildrenOf(this.content);
	var v = JkLangVector.get(this.widgetTabContent, idx);
	if(!(v != null)) {
		return;
	}
	var w = (function(o) {
		if(JkWidgetWidget.IS_INSTANCE && JkWidgetWidget.IS_INSTANCE(o)) {
			return o;
		}
		return null;
	}.bind(this))((v.get("widget")));
	if(!(w != null)) {
		return;
	}
	this.content.addWidget(w);
	if(this.widgetOnTabChangeListener != null) {
		this.widgetOnTabChangeListener(idx, w);
	}
};

JkWidgetTabTabWidget.prototype.setWidgetSelectedTab = function(index) {
	if(index < this.widgetTabContent.length) {
		this.updateSelectedTab(index);
	}
};

JkWidgetTabTabWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.container = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.tabHeadersBackground = JkWidgetLayerWithBackgroundColorWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.tabHeadersBackground.setWidgetColor((JkGfxColor.white()));
	this.tabHeaders = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.tabHeadersBackground.addWidget(this.tabHeaders);
	this.container.addWidget(this.tabHeadersBackground);
	this.background = JkWidgetLayerWithBackgroundColorWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.background.setWidgetColor((JkGfxColor.white()));
	this.content = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.background.addWidget(this.content);
	this.container.addWidget1(this.background, 1.0);
	this.addWidget(this.container);
};

JkWidgetTabTabWidget.prototype.getWidgetTabOutlineColor = function() {
	return this.widgetTabOutlineColor;
};

JkWidgetTabTabWidget.prototype.setWidgetTabOutlineColor = function(v) {
	this.widgetTabOutlineColor = v;
	return this;
};

JkWidgetTabTabWidget.prototype.getWidgetTabOutlineWidth = function() {
	return this.widgetTabOutlineWidth;
};

JkWidgetTabTabWidget.prototype.setWidgetTabOutlineWidth = function(v) {
	this.widgetTabOutlineWidth = v;
	return this;
};

JkWidgetTabTabWidget.prototype.getWidgetContentOutlineColor = function() {
	return this.widgetContentOutlineColor;
};

JkWidgetTabTabWidget.prototype.setWidgetContentOutlineColor = function(v) {
	this.widgetContentOutlineColor = v;
	return this;
};

JkWidgetTabTabWidget.prototype.getWidgetContentOutlineWidth = function() {
	return this.widgetContentOutlineWidth;
};

JkWidgetTabTabWidget.prototype.setWidgetContentOutlineWidth = function(v) {
	this.widgetContentOutlineWidth = v;
	return this;
};

JkWidgetTabTabWidget.prototype.getWidgetTabContent = function() {
	return this.widgetTabContent;
};

JkWidgetTabTabWidget.prototype.setWidgetTabContent = function(v) {
	this.widgetTabContent = v;
	return this;
};

JkWidgetTabTabWidget.prototype.getWidgetSelectedTabBackgroundColor = function() {
	return this.widgetSelectedTabBackgroundColor;
};

JkWidgetTabTabWidget.prototype.setWidgetSelectedTabBackgroundColor = function(v) {
	this.widgetSelectedTabBackgroundColor = v;
	return this;
};

JkWidgetTabTabWidget.prototype.getWidgetSelectedTabTextColor = function() {
	return this.widgetSelectedTabTextColor;
};

JkWidgetTabTabWidget.prototype.setWidgetSelectedTabTextColor = function(v) {
	this.widgetSelectedTabTextColor = v;
	return this;
};

JkWidgetTabTabWidget.prototype.getWidgetUnselectedTabBackgroundColor = function() {
	return this.widgetUnselectedTabBackgroundColor;
};

JkWidgetTabTabWidget.prototype.setWidgetUnselectedTabBackgroundColor = function(v) {
	this.widgetUnselectedTabBackgroundColor = v;
	return this;
};

JkWidgetTabTabWidget.prototype.getWidgetUnselectedTabTextColor = function() {
	return this.widgetUnselectedTabTextColor;
};

JkWidgetTabTabWidget.prototype.setWidgetUnselectedTabTextColor = function(v) {
	this.widgetUnselectedTabTextColor = v;
	return this;
};

JkWidgetTabTabWidget.prototype.getWidgetTabHeaderTitleMargin = function() {
	return this.widgetTabHeaderTitleMargin;
};

JkWidgetTabTabWidget.prototype.setWidgetTabHeaderTitleMargin = function(v) {
	this.widgetTabHeaderTitleMargin = v;
	return this;
};

JkWidgetTabTabWidget.prototype.getWidgetRoundingRadius = function() {
	return this.widgetRoundingRadius;
};

JkWidgetTabTabWidget.prototype.setWidgetRoundingRadius = function(v) {
	this.widgetRoundingRadius = v;
	return this;
};

JkWidgetTabTabWidget.prototype.getWidgetTextAlign = function() {
	return this.widgetTextAlign;
};

JkWidgetTabTabWidget.prototype.setWidgetTextAlign = function(v) {
	this.widgetTextAlign = v;
	return this;
};

JkWidgetTabTabWidget.prototype.getWidgetContentSpacing = function() {
	return this.widgetContentSpacing;
};

JkWidgetTabTabWidget.prototype.setWidgetContentSpacing = function(v) {
	this.widgetContentSpacing = v;
	return this;
};

JkWidgetTabTabWidget.prototype.getWidgetTabContentRoundingRadius = function() {
	return this.widgetTabContentRoundingRadius;
};

JkWidgetTabTabWidget.prototype.setWidgetTabContentRoundingRadius = function(v) {
	this.widgetTabContentRoundingRadius = v;
	return this;
};

JkWidgetTabTabWidget.prototype.getWidgetOnTabChangeListener = function() {
	return this.widgetOnTabChangeListener;
};

JkWidgetTabTabWidget.prototype.setWidgetOnTabChangeListener = function(v) {
	this.widgetOnTabChangeListener = v;
	return this;
};

JkWidgetTabTabWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetTabTabWidget"] === true;
};

let JkWidgetTabTabContainerWidgetDefaultTabItemWidget = function() {
	JkWidgetLayerWithBackgroundColorWidget.call(this);
	this.title = null;
};

JkWidgetTabTabContainerWidgetDefaultTabItemWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWithBackgroundColorWidget.prototype);
JkWidgetTabTabContainerWidgetDefaultTabItemWidget.prototype.constructor = JkWidgetTabTabContainerWidgetDefaultTabItemWidget;
JkWidgetTabTabContainerWidgetDefaultTabItemWidget.prototype._t = {
	"JkWidgetTabTabItemWidget" : true,
	"JkWidgetLayerWithBackgroundColorWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetTabTabContainerWidgetDefaultTabItemWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetWidget" : true
};
JkWidgetTabTabContainerWidgetDefaultTabItemWidget.prototype._tobj = JkWidgetTabTabContainerWidgetDefaultTabItemWidget;

JkWidgetTabTabContainerWidgetDefaultTabItemWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetTabTabContainerWidgetDefaultTabItemWidget;
	return v.CTOR_JkWidgetTabTabContainerWidgetDefaultTabItemWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetTabTabContainerWidgetDefaultTabItemWidget.prototype.CTOR_JkWidgetTabTabContainerWidgetDefaultTabItemWidget_JkUiGuiApplicationContext = function(ctx) {
	this.title = null;
	if(JkWidgetLayerWithBackgroundColorWidget.prototype.CTOR_JkWidgetLayerWithBackgroundColorWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.forceCreateWidget();
	return this;
};

JkWidgetTabTabContainerWidgetDefaultTabItemWidget.prototype.setTabTitle = function(txt) {
	this.title.setWidgetText(txt);
};

JkWidgetTabTabContainerWidgetDefaultTabItemWidget.prototype.onTabSelected = function() {
	this.setWidgetColor((JkGfxColor.white()));
	this.title.setWidgetTextColor((JkGfxColor.black()));
};

JkWidgetTabTabContainerWidgetDefaultTabItemWidget.prototype.onTabDeselected = function() {
	this.setWidgetColor((JkGfxColor.instance("#f2f2f2")));
	this.title.setWidgetTextColor((JkGfxColor.white()));
};

JkWidgetTabTabContainerWidgetDefaultTabItemWidget.prototype.createWidget = function() {
	JkWidgetLayerWithBackgroundColorWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.setWidgetColor((JkGfxColor.white()));
	var widget = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget.setWidgetMargin((this.context.getHeightValue("2mm")));
	this.title = JkWidgetLabelWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.title.setWidgetText("New Tab");
	widget.addWidget(this.title);
	this.addWidget(widget);
};

JkWidgetTabTabContainerWidgetDefaultTabItemWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetTabTabContainerWidgetDefaultTabItemWidget"] === true;
};
