let JkWidgetCarouselCarouselWidgetMyContainerWidgetMyChild = function() {
	this.widget = null;
	this.x = 0;
};

JkWidgetCarouselCarouselWidgetMyContainerWidgetMyChild.prototype._t = { "JkWidgetCarouselCarouselWidgetMyContainerWidgetMyChild" : true };
JkWidgetCarouselCarouselWidgetMyContainerWidgetMyChild.prototype._tobj = JkWidgetCarouselCarouselWidgetMyContainerWidgetMyChild;

JkWidgetCarouselCarouselWidgetMyContainerWidgetMyChild.NEW = function() {
	var v = new JkWidgetCarouselCarouselWidgetMyContainerWidgetMyChild;
	return v.CTOR_JkWidgetCarouselCarouselWidgetMyContainerWidgetMyChild();
};

JkWidgetCarouselCarouselWidgetMyContainerWidgetMyChild.prototype.CTOR_JkWidgetCarouselCarouselWidgetMyContainerWidgetMyChild = function() {
	this.x = 0;
	this.widget = null;
	return this;
};

JkWidgetCarouselCarouselWidgetMyContainerWidgetMyChild.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCarouselCarouselWidgetMyContainerWidgetMyChild"] === true;
};

let JkWidgetCarouselCarouselWidgetMyContainerWidget = function() {
	JkWidgetContainerWidget.call(this);
	this.animating = false;
	this.children = null;
	this.currentIndex = 0;
	this.widgetWidth = 0;
	this.widgetAnimationDuration = 1000;
	this.widgetAnimationProgressListener = null;
	this.widgetCurrentWidgetChangeListener = null;
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetContainerWidget.prototype);
JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.constructor = JkWidgetCarouselCarouselWidgetMyContainerWidget;
JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCarouselCarouselWidgetMyContainerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype._tobj = JkWidgetCarouselCarouselWidgetMyContainerWidget;

JkWidgetCarouselCarouselWidgetMyContainerWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCarouselCarouselWidgetMyContainerWidget;
	return v.CTOR_JkWidgetCarouselCarouselWidgetMyContainerWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.CTOR_JkWidgetCarouselCarouselWidgetMyContainerWidget_JkUiGuiApplicationContext = function(ctx) {
	this.widgetCurrentWidgetChangeListener = null;
	this.widgetAnimationProgressListener = null;
	this.widgetAnimationDuration = 1000;
	this.widgetWidth = 0;
	this.currentIndex = 0;
	this.children = null;
	this.animating = false;
	if(JkWidgetContainerWidget.prototype.CTOR_JkWidgetContainerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.children = new Array;
	return this;
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.onWidgetHeightChanged = function(height) {
	JkWidgetContainerWidget.prototype.onWidgetHeightChanged.call(this, height);
	var array = JkWidgetWidget.getChildren(this);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var child = array[n];
			if(child != null) {
				JkWidgetWidget.resizeHeight(child, height);
			}
		}
	}
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.computeWidgetLayout = function(widthConstraint) {
	var widgets = JkWidgetWidget.getChildren(this);
	var childCount = widgets.length;
	var wc = widthConstraint;
	var mw = 0;
	var mh = 0;
	if(widgets != null) {
		var n = 0;
		var m = widgets.length;
		for(n = 0 ; n < m ; n++) {
			var child = widgets[n];
			if(child != null) {
				JkWidgetWidget.layout(child, wc, false);
				var tw = JkWidgetWidget.getWidth(child);
				if(tw > mw) {
					mw = tw;
				}
				var th = JkWidgetWidget.getHeight(child);
				if(th > mh) {
					mh = th;
				}
			}
		}
	}
	for(var i = 0 ; i < childCount ; i++) {
		this.children[i].x = i * mw;
		JkWidgetWidget.move(this.children[i].widget, this.children[i].x, 0);
	}
	this.widgetWidth = mw;
	JkWidgetWidget.setLayoutSize(this, mw, 0);
	this.updateChildren();
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.moveToNext = function() {
	if(this.currentIndex == this.children.length - 1) {
		return false;
	}
	return this.moveToIndex((this.currentIndex + 1));
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.moveToPrevious = function() {
	if(this.currentIndex == 0) {
		return false;
	}
	return this.moveToIndex((this.currentIndex - 1));
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.moveToFirst = function() {
	return this.moveToIndex(0);
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.moveToIndex = function(index) {
	if(this.animating) {
		return false;
	}
	var idx = index;
	if(idx < 0 && idx > this.children.length - 1) {
		return false;
	}
	var anim = JkWidgetWidgetAnimation.forDuration(this.context, this.widgetAnimationDuration);
	anim.addCallback((function(completion1) {
		if(completion1 > 1.0) {
			completion1 = 1.0;
		}
		this.widgetAnimationProgressListener(completion1);
		for(var i = 0 ; i < this.children.length ; i++) {
			var child = this.children[i];
			var b = child.x;
			var c = (i - idx) * this.widgetWidth;
			var dx = (c - b) * completion1 + ~(~b);
			JkWidgetWidget.move(child.widget, (~(~dx)), 0);
		}
	}.bind(this)));
	anim.setEndListener((function() {
		this.updateChildren();
	}.bind(this)));
	anim.start();
	this.animating = true;
	return true;
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.updateChildren = function() {
	for(var i = 0 ; i < this.children.length ; i++) {
		var child = this.children[i];
		child.x = JkWidgetWidget.getX(child.widget);
		if(child.x == 0) {
			this.currentIndex = i;
			this.widgetCurrentWidgetChangeListener(this.currentIndex, child.widget);
		}
	}
	this.animating = false;
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.addWidget = function(widget) {
	var child = JkWidgetCarouselCarouselWidgetMyContainerWidgetMyChild.NEW();
	child.widget = widget;
	this.children.push(child);
	JkWidgetWidget.addChild(this, widget);
	return this;
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.clear = function() {
	JkWidgetWidget.removeChildrenOf(this);
	JkLangVector.clear(this.children);
	this.currentIndex = 0;
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.getWidgetAnimationDuration = function() {
	return this.widgetAnimationDuration;
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.setWidgetAnimationDuration = function(v) {
	this.widgetAnimationDuration = v;
	return this;
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.getWidgetAnimationProgressListener = function() {
	return this.widgetAnimationProgressListener;
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.setWidgetAnimationProgressListener = function(v) {
	this.widgetAnimationProgressListener = v;
	return this;
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.getWidgetCurrentWidgetChangeListener = function() {
	return this.widgetCurrentWidgetChangeListener;
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.prototype.setWidgetCurrentWidgetChangeListener = function(v) {
	this.widgetCurrentWidgetChangeListener = v;
	return this;
};

JkWidgetCarouselCarouselWidgetMyContainerWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCarouselCarouselWidgetMyContainerWidget"] === true;
};

let JkWidgetCarouselCarouselWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetAnimationProgressListener = null;
	this.widgetCurrentWidgetChangeListener = null;
	this.widgetAutoSwitch = false;
	this.widgetAutoSwitchInterval = 1.0;
	this.timerRunning = false;
	this.background = null;
	this.carousell = null;
};

JkWidgetCarouselCarouselWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCarouselCarouselWidget.prototype.constructor = JkWidgetCarouselCarouselWidget;
JkWidgetCarouselCarouselWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCarouselCarouselWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCarouselCarouselWidget.prototype._tobj = JkWidgetCarouselCarouselWidget;

JkWidgetCarouselCarouselWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCarouselCarouselWidget;
	return v.CTOR_JkWidgetCarouselCarouselWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCarouselCarouselWidget.prototype.CTOR_JkWidgetCarouselCarouselWidget_JkUiGuiApplicationContext = function(context) {
	this.carousell = null;
	this.background = null;
	this.timerRunning = false;
	this.widgetAutoSwitchInterval = 1.0;
	this.widgetAutoSwitch = false;
	this.widgetCurrentWidgetChangeListener = null;
	this.widgetAnimationProgressListener = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCarouselCarouselWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	if(this.widgetAutoSwitch) {
		this.start();
	}
};

JkWidgetCarouselCarouselWidget.prototype.start = function() {
	if(this.widgetAutoSwitchInterval < 1) {
		return;
	}
	this.timerRunning = true;
	this.onTick((JkTimeSystemClock.asSeconds()), (~(~(this.widgetAutoSwitchInterval * ~(~1000)))));
};

JkWidgetCarouselCarouselWidget.prototype.stop = function() {
	this.timerRunning = false;
};

JkWidgetCarouselCarouselWidget.prototype.onTick = function(lastTick, timeoutSeconds) {
	var diff = JkTimeSystemClock.asSeconds() - lastTick;
	var nextTick = timeoutSeconds;
	if(diff > 0) {
		nextTick -= diff;
	}
	var tos = timeoutSeconds;
	this.context.startTimer(nextTick, (function() {
		this.onPeriodicTimer();
		if(this.timerRunning) {
			this.onTick((JkTimeSystemClock.asSeconds()), tos);
		}
	}.bind(this)));
};

JkWidgetCarouselCarouselWidget.prototype.onPeriodicTimer = function() {
	if(!this.widgetAutoSwitch) {
		this.stop();
	}
	if(!this.carousell.moveToNext()) {
		this.carousell.moveToFirst();
	}
};

JkWidgetCarouselCarouselWidget.prototype.setWidgetBackgroundColor = function(color) {
	this.background.setWidgetColor(color);
};

JkWidgetCarouselCarouselWidget.prototype.setWidgetAnimationDuration = function(duration) {
	this.carousell.setWidgetAnimationDuration(duration);
};

JkWidgetCarouselCarouselWidget.prototype.setWidgetEntry = function(widget) {
	this.carousell.addWidget(widget);
};

JkWidgetCarouselCarouselWidget.prototype.setWidgetSelected = function(index) {
	this.carousell.moveToIndex(index);
};

JkWidgetCarouselCarouselWidget.prototype.setWidgetToNext = function() {
	this.carousell.moveToNext();
};

JkWidgetCarouselCarouselWidget.prototype.setWidgetToPrevious = function() {
	this.carousell.moveToPrevious();
};

JkWidgetCarouselCarouselWidget.prototype.clearEntries = function() {
	this.carousell.clear();
};

JkWidgetCarouselCarouselWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.background = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.background.setWidgetColor((JkGfxColor.black()));
	this.addWidget(this.background);
	this.carousell = JkWidgetCarouselCarouselWidgetMyContainerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.carousell.setWidgetAnimationProgressListener((function(completion1) {
		if(this.widgetAnimationProgressListener != null) {
			this.widgetAnimationProgressListener(completion1);
		}
	}.bind(this)));
	this.carousell.setWidgetCurrentWidgetChangeListener((function(index1, widget1) {
		if(this.widgetCurrentWidgetChangeListener != null) {
			this.widgetCurrentWidgetChangeListener(index1, widget1);
		}
	}.bind(this)));
	this.addWidget(this.carousell);
};

JkWidgetCarouselCarouselWidget.prototype.getWidgetAnimationProgressListener = function() {
	return this.widgetAnimationProgressListener;
};

JkWidgetCarouselCarouselWidget.prototype.setWidgetAnimationProgressListener = function(v) {
	this.widgetAnimationProgressListener = v;
	return this;
};

JkWidgetCarouselCarouselWidget.prototype.getWidgetCurrentWidgetChangeListener = function() {
	return this.widgetCurrentWidgetChangeListener;
};

JkWidgetCarouselCarouselWidget.prototype.setWidgetCurrentWidgetChangeListener = function(v) {
	this.widgetCurrentWidgetChangeListener = v;
	return this;
};

JkWidgetCarouselCarouselWidget.prototype.getWidgetAutoSwitch = function() {
	return this.widgetAutoSwitch;
};

JkWidgetCarouselCarouselWidget.prototype.setWidgetAutoSwitch = function(v) {
	this.widgetAutoSwitch = v;
	return this;
};

JkWidgetCarouselCarouselWidget.prototype.getWidgetAutoSwitchInterval = function() {
	return this.widgetAutoSwitchInterval;
};

JkWidgetCarouselCarouselWidget.prototype.setWidgetAutoSwitchInterval = function(v) {
	this.widgetAutoSwitchInterval = v;
	return this;
};

JkWidgetCarouselCarouselWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCarouselCarouselWidget"] === true;
};
