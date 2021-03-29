let JkWidgetListPaginatedListWidgetPageTrackerWidget = function() {
	JkWidgetLayerWithBackgroundColorWidget.call(this);
	this.widgetParent = null;
	this.currentPage = 0;
	this.pageCollection = null;
	this.pageAlign = null;
	this.pageContainer = null;
	this.prevButton = null;
	this.pages = null;
	this.nextButton = null;
};

JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWithBackgroundColorWidget.prototype);
JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype.constructor = JkWidgetListPaginatedListWidgetPageTrackerWidget;
JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype._t = {
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetListPaginatedListWidgetPageTrackerWidget" : true,
	"JkWidgetLayerWithBackgroundColorWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype._tobj = JkWidgetListPaginatedListWidgetPageTrackerWidget;

JkWidgetListPaginatedListWidgetPageTrackerWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetListPaginatedListWidgetPageTrackerWidget;
	return v.CTOR_JkWidgetListPaginatedListWidgetPageTrackerWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype.CTOR_JkWidgetListPaginatedListWidgetPageTrackerWidget_JkUiGuiApplicationContext = function(ctx) {
	this.nextButton = null;
	this.pages = null;
	this.prevButton = null;
	this.pageContainer = null;
	this.pageAlign = null;
	this.pageCollection = null;
	this.currentPage = 0;
	this.widgetParent = null;
	if(JkWidgetLayerWithBackgroundColorWidget.prototype.CTOR_JkWidgetLayerWithBackgroundColorWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.forceCreateWidget();
	this.pageCollection = new Array;
	return this;
};

JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype.setWidgetPreviousImageResource = function(resource) {
	this.prevButton.setWidgetImageResource(resource);
};

JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype.setWidgetNextImageResource = function(resource) {
	this.nextButton.setWidgetImageResource(resource);
};

JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype.setWidgetPageSpacing = function(spacing) {
	this.pages.setWidgetSpacing(spacing);
};

JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype.updatePages = function(pageCount, currentPage) {
	this.setupPages(pageCount);
	this.moveTo(currentPage);
};

JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype.setupPages = function(pageCount) {
	JkLangVector.clear(this.pageCollection);
	for(var i = 0 ; i < pageCount ; i++) {
		var pi = this.widgetParent.createPageItemWidget();
		if(!(pi != null)) {
			pi = JkWidgetListPaginatedListWidgetDefaultPageItemWidget.NEW_JkUiGuiApplicationContext(this.context);
		}
		pi.setPageNumber((i + 1));
		pi.setPageTracker(this);
		this.pageCollection.push(pi);
	}
};

JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype.onPrevButtonClicked = function() {
	this.moveTo((this.currentPage - 1));
	this.widgetParent.onPreviousPage(this.currentPage);
};

JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype.onNextButtonClicked = function() {
	this.moveTo((this.currentPage + 1));
	this.widgetParent.onNextPage(this.currentPage);
};

JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype.moveTo = function(page) {
	var s = JkLangVector.getSize(this.pageCollection);
	if(!(page > 0 && page <= s)) {
		return;
	}
	JkWidgetWidget.removeChildrenOf(this.pages);
	this.currentPage = page;
	var p = page - 1;
	var o = 0;
	var l = 5;
	if(s > 5) {
		o = p - 2;
		if(p >= s - 2) {
			o = s - 5;
		}
		if(o < 0) {
			o = 0;
		}
		l = p + 3;
		if(l < 5) {
			l = 5;
		}
		if(l > s) {
			l = s;
		}
	}
	if(p > 0) {
		JkWidgetWidget.setVisible(this.prevButton, true);
	}
	else {
		JkWidgetWidget.setVisible(this.prevButton, false);
	}
	if(p < s - 1) {
		JkWidgetWidget.setVisible(this.nextButton, true);
	}
	else {
		JkWidgetWidget.setVisible(this.nextButton, false);
	}
	for(var i = 0 ; o < l ; o++) {
		var pw = JkLangVector.get(this.pageCollection, o);
		if(!(pw != null)) {
			break;
		}
		pw.setAsCurrentPage((o == p));
		this.pages.addWidget(((function(o1) {
			if(JkWidgetWidget.IS_INSTANCE && JkWidgetWidget.IS_INSTANCE(o1)) {
				return o1;
			}
			return null;
		}.bind(this))(pw)));
	}
};

JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype.createWidget = function() {
	JkWidgetLayerWithBackgroundColorWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.pageAlign = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.pageContainer = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	JkWidgetWidget.setWidgetId(this.pageContainer, "paginationContainer");
	this.prevButton = JkWidgetCommonImageButtonWidget.NEW_JkUiGuiApplicationContext(this.context);
	JkWidgetWidget.setWidgetId(this.prevButton, "prevPageButton");
	this.prevButton.setWidgetWidthRequest((this.context.getHeightValue("6mm")));
	this.prevButton.setWidgetHeightRequest((this.context.getHeightValue("6mm")));
	this.prevButton.setWidgetClickHandler((function() {
		this.onPrevButtonClicked();
	}.bind(this)));
	this.pageContainer.addWidget(this.prevButton);
	this.pages = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	JkWidgetWidget.setWidgetId(this.pages, "pageNumbersContainer");
	this.pageContainer.addWidget(this.pages);
	this.nextButton = JkWidgetCommonImageButtonWidget.NEW_JkUiGuiApplicationContext(this.context);
	JkWidgetWidget.setWidgetId(this.nextButton, "nextPageButton");
	this.nextButton.setWidgetWidthRequest((this.context.getHeightValue("6mm")));
	this.nextButton.setWidgetHeightRequest((this.context.getHeightValue("6mm")));
	this.nextButton.setWidgetClickHandler((function() {
		this.onNextButtonClicked();
	}.bind(this)));
	this.pageContainer.addWidget(this.nextButton);
	this.pageAlign.addWidget(this.pageContainer);
	this.addWidget(this.pageAlign);
};

JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype.getWidgetParent = function() {
	return this.widgetParent;
};

JkWidgetListPaginatedListWidgetPageTrackerWidget.prototype.setWidgetParent = function(v) {
	this.widgetParent = v;
	return this;
};

JkWidgetListPaginatedListWidgetPageTrackerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetListPaginatedListWidgetPageTrackerWidget"] === true;
};

let JkWidgetListPaginatedListWidgetPageItemWidget = {};

JkWidgetListPaginatedListWidgetPageItemWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetListPaginatedListWidgetPageItemWidget"] === true;
};

let JkWidgetListPaginatedListWidgetDefaultPageItemWidget = function() {
	JkWidgetLayerWithBackgroundColorWidget.call(this);
	this.pageNumber = null;
};

JkWidgetListPaginatedListWidgetDefaultPageItemWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWithBackgroundColorWidget.prototype);
JkWidgetListPaginatedListWidgetDefaultPageItemWidget.prototype.constructor = JkWidgetListPaginatedListWidgetDefaultPageItemWidget;
JkWidgetListPaginatedListWidgetDefaultPageItemWidget.prototype._t = {
	"JkWidgetLayerWithBackgroundColorWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetListPaginatedListWidgetDefaultPageItemWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetListPaginatedListWidgetPageItemWidget" : true
};
JkWidgetListPaginatedListWidgetDefaultPageItemWidget.prototype._tobj = JkWidgetListPaginatedListWidgetDefaultPageItemWidget;

JkWidgetListPaginatedListWidgetDefaultPageItemWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetListPaginatedListWidgetDefaultPageItemWidget;
	return v.CTOR_JkWidgetListPaginatedListWidgetDefaultPageItemWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetListPaginatedListWidgetDefaultPageItemWidget.prototype.CTOR_JkWidgetListPaginatedListWidgetDefaultPageItemWidget_JkUiGuiApplicationContext = function(ctx) {
	this.pageNumber = null;
	if(JkWidgetLayerWithBackgroundColorWidget.prototype.CTOR_JkWidgetLayerWithBackgroundColorWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.forceCreateWidget();
	return this;
};

JkWidgetListPaginatedListWidgetDefaultPageItemWidget.prototype.setPageNumber = function(page) {
	this.pageNumber.setWidgetText((JkLangString.forInteger(page)));
};

JkWidgetListPaginatedListWidgetDefaultPageItemWidget.prototype.setPageTracker = function(pageTracker) {
	;
};

JkWidgetListPaginatedListWidgetDefaultPageItemWidget.prototype.setAsCurrentPage = function(isCurrent) {
	if(isCurrent) {
		this.setWidgetColor((JkGfxColor.instance("blue")));
	}
	else {
		this.setWidgetColor((JkGfxColor.white()));
	}
};

JkWidgetListPaginatedListWidgetDefaultPageItemWidget.prototype.createWidget = function() {
	JkWidgetLayerWithBackgroundColorWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.setWidgetMargin((this.context.getHeightValue("2mm")));
	var widget = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.pageNumber = JkWidgetLabelWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.pageNumber.setWidgetTextColor((JkGfxColor.black()));
	widget.addWidget(this.pageNumber);
	this.addWidget(widget);
};

JkWidgetListPaginatedListWidgetDefaultPageItemWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetListPaginatedListWidgetDefaultPageItemWidget"] === true;
};

let JkWidgetListPaginatedListWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.pageTracker = null;
	this.failedLayer = null;
	this.box = null;
	this.listLayer = null;
	this.list = null;
	this.pageBox = null;
};

JkWidgetListPaginatedListWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetListPaginatedListWidget.prototype.constructor = JkWidgetListPaginatedListWidget;
JkWidgetListPaginatedListWidget.prototype._t = {
	"JkWidgetListPaginatedListWidget" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetListPaginatedListWidget.prototype._tobj = JkWidgetListPaginatedListWidget;

JkWidgetListPaginatedListWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetListPaginatedListWidget;
	return v.CTOR_JkWidgetListPaginatedListWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetListPaginatedListWidget.prototype.CTOR_JkWidgetListPaginatedListWidget_JkUiGuiApplicationContext = function(ctx) {
	this.pageBox = null;
	this.list = null;
	this.listLayer = null;
	this.box = null;
	this.failedLayer = null;
	this.pageTracker = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.forceCreateWidget();
	this.pageTracker = JkWidgetListPaginatedListWidgetPageTrackerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.pageTracker.setWidgetParent(this);
	return this;
};

JkWidgetListPaginatedListWidget.prototype.getListCount = function() {
	return JkWidgetWidget.getChildren(this.list).length;
};

JkWidgetListPaginatedListWidget.prototype.setWidgetPreviousImageResource = function(resource) {
	this.pageTracker.setWidgetPreviousImageResource(resource);
	return this;
};

JkWidgetListPaginatedListWidget.prototype.setWidgetNextImageResource = function(resource) {
	this.pageTracker.setWidgetNextImageResource(resource);
	return this;
};

JkWidgetListPaginatedListWidget.prototype.setWidgetPageTrackerSpacing = function(spacing) {
	this.pageTracker.setWidgetPageSpacing(spacing);
	return this;
};

JkWidgetListPaginatedListWidget.prototype.setWidgetListSpacing = function(spacing) {
	this.list.setWidgetSpacing(spacing);
	return this;
};

JkWidgetListPaginatedListWidget.prototype.setWidgetListBackgroundColor = function(color) {
	this.listLayer.setWidgetColor(color);
	return this;
};

JkWidgetListPaginatedListWidget.prototype.doGetData = function(page, resetTracker) {
	var rt = resetTracker;
	this.startQuery(page, (function(response1) {
		if(!(response1 != null)) {
			this.onNoDataReceived();
			return;
		}
		var records = response1.getDynamicVector("records");
		if(!(records != null)) {
			this.onNoDataReceived();
			return;
		}
		if(!(records.getSize() > 0)) {
			this.onNoDataReceived();
			return;
		}
		if(rt) {
			this.updatePageTracker((response1.getInteger("pageCount", 0)), (response1.getInteger("currentPage", 0)));
		}
		this.populateList(records);
	}.bind(this)), (function(error1) {
		this.onQueryFailed(error1);
	}.bind(this)));
};

JkWidgetListPaginatedListWidget.prototype.updatePageTracker = function(pageCount, currentPage) {
	if(pageCount < 2) {
		if(JkWidgetWidget.hasParent(this.pageTracker)) {
			JkWidgetWidget.removeFromParent(this.pageTracker);
		}
		return;
	}
	this.pageTracker.updatePages(pageCount, currentPage);
	if(!JkWidgetWidget.hasParent(this.pageTracker)) {
		this.pageBox.addWidget(this.pageTracker);
	}
};

JkWidgetListPaginatedListWidget.prototype.onPreviousPage = function(page) {
	this.doGetData(page, false);
};

JkWidgetListPaginatedListWidget.prototype.onNextPage = function(page) {
	this.doGetData(page, false);
};

JkWidgetListPaginatedListWidget.prototype.onNoDataReceived = function() {
	this.clearList();
	JkWidgetWidget.removeFromParent(this.pageTracker);
	if(!(this.failedLayer != null)) {
		this.failedLayer = JkWidgetAlignWidget.forWidget(this.context, (JkWidgetLabelWidget.forText(this.context, "No data found")), 0.5, 0.5, 0);
	}
	if(JkWidgetWidget.hasParent(this.failedLayer) == false) {
		this.addWidget(this.failedLayer);
	}
};

JkWidgetListPaginatedListWidget.prototype.clearList = function() {
	JkWidgetWidget.removeChildrenOf(this.list);
	JkWidgetWidget.removeFromParent(this.failedLayer);
};

JkWidgetListPaginatedListWidget.prototype.populateList = function(records) {
	this.clearList();
	var array = records.toVector();
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var item = (function(o) {
				if(JkLangDynamicMap.IS_INSTANCE && JkLangDynamicMap.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))(array[n]);
			if(item != null) {
				if(!(item != null)) {
					continue;
				}
				var w = this.createListItemWidget(item);
				if(!(w != null)) {
					continue;
				}
				this.list.addWidget(w);
			}
		}
	}
	this.onDonePopulatingList();
};

JkWidgetListPaginatedListWidget.prototype.onDonePopulatingList = function() {
	;
};

JkWidgetListPaginatedListWidget.prototype.onQueryFailed = function(error) {
	;
};

JkWidgetListPaginatedListWidget.prototype.createPageItemWidget = function() {};

JkWidgetListPaginatedListWidget.prototype.createListItemWidget = function(data) {};

JkWidgetListPaginatedListWidget.prototype.startQuery = function(page, callback, errorCallback) {};

JkWidgetListPaginatedListWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.box = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.listLayer = JkWidgetLayerWithBackgroundColorWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.listLayer.setWidgetColor((JkGfxColor.black()));
	this.list = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.list.setWidgetSpacing((this.context.getHeightValue("200um")));
	this.listLayer.addWidget(this.list);
	this.box.addWidget(this.listLayer);
	this.pageBox = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.box.addWidget(this.pageBox);
	this.addWidget(this.box);
};

JkWidgetListPaginatedListWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetListPaginatedListWidget"] === true;
};

let JkWidgetListListItemWidget = function() {
	JkWidgetVerticalBoxWidget.call(this);
	this.list = null;
	this.widgetListSpacing = 0;
	this.widgetListMargin = 0;
};

JkWidgetListListItemWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetVerticalBoxWidget.prototype);
JkWidgetListListItemWidget.prototype.constructor = JkWidgetListListItemWidget;
JkWidgetListListItemWidget.prototype._t = {
	"JkWidgetDisplayAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetVerticalBoxWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetListListItemWidget" : true,
	"JkWidgetTitledWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetContainerWidget" : true
};
JkWidgetListListItemWidget.prototype._tobj = JkWidgetListListItemWidget;

JkWidgetListListItemWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetListListItemWidget;
	return v.CTOR_JkWidgetListListItemWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetListListItemWidget.prototype.CTOR_JkWidgetListListItemWidget_JkUiGuiApplicationContext = function(ctx) {
	this.widgetListMargin = 0;
	this.widgetListSpacing = 0;
	this.list = null;
	if(JkWidgetVerticalBoxWidget.prototype.CTOR_JkWidgetVerticalBoxWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.widgetListMargin = 0;
	this.widgetListSpacing = this.context.getHeightValue("1mm");
	return this;
};

JkWidgetListListItemWidget.prototype.getWidgetTitle = function() {
	return null;
};

JkWidgetListListItemWidget.prototype.onWidgetDisplayed = function() {
	this.onGetData();
};

JkWidgetListListItemWidget.prototype.initializeWidget = function() {
	JkWidgetVerticalBoxWidget.prototype.initializeWidget.call(this);
	var shw = this.getSubHeaderWidget();
	if(shw != null) {
		this.addWidget(shw);
	}
	this.setWidgetMargin((this.context.getHeightValue("1mm")));
	this.setWidgetSpacing((this.context.getHeightValue("1mm")));
	this.list = JkWidgetVerticalBoxWidget.forContext(this.context, this.widgetListMargin, this.widgetListSpacing);
	this.addWidget1((JkWidgetVerticalScrollerWidget.forWidget(this.context, this.list)), 1.0);
};

JkWidgetListListItemWidget.prototype.onGetData = function() {
	JkWidgetWidget.removeChildrenOf(this.list);
	this.startDataQuery((function(response1) {
		if(!(response1 != null) || JkLangVector.getSize(response1) < 1) {
			this.onNoDataReceived();
			return;
		}
		this.onDataReceived(response1);
	}.bind(this)));
};

JkWidgetListListItemWidget.prototype.onNoDataReceived = function() {
	this.list.addWidget((JkWidgetAlignWidget.forWidget(this.context, (JkWidgetLabelWidget.forText(this.context, "No data found")), 0.5, 0.5, 0)));
};

JkWidgetListListItemWidget.prototype.onDataReceived = function(data) {
	if(data != null) {
		var n = 0;
		var m = data.length;
		for(n = 0 ; n < m ; n++) {
			var record = data[n];
			if(record != null) {
				var widget = this.createWidgetForRecord(record);
				if(widget != null) {
					this.list.addWidget(widget);
				}
			}
		}
	}
};

JkWidgetListListItemWidget.prototype.getSubHeaderWidget = function() {
	return null;
};

JkWidgetListListItemWidget.prototype.createWidgetForRecord = function(record) {
	return null;
};

JkWidgetListListItemWidget.prototype.startDataQuery = function(callback) {};

JkWidgetListListItemWidget.prototype.getWidgetListSpacing = function() {
	return this.widgetListSpacing;
};

JkWidgetListListItemWidget.prototype.setWidgetListSpacing = function(v) {
	this.widgetListSpacing = v;
	return this;
};

JkWidgetListListItemWidget.prototype.getWidgetListMargin = function() {
	return this.widgetListMargin;
};

JkWidgetListListItemWidget.prototype.setWidgetListMargin = function(v) {
	this.widgetListMargin = v;
	return this;
};

JkWidgetListListItemWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetListListItemWidget"] === true;
};
