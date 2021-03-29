let JkWidgetCalendarCalendarWidgetDayWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.index = 0;
	this.container = null;
	this.enable = true;
	this.canvas = null;
	this.lbl = null;
};

JkWidgetCalendarCalendarWidgetDayWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCalendarCalendarWidgetDayWidget.prototype.constructor = JkWidgetCalendarCalendarWidgetDayWidget;
JkWidgetCalendarCalendarWidgetDayWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetCalendarCalendarWidgetDayWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCalendarCalendarWidgetDayWidget.prototype._tobj = JkWidgetCalendarCalendarWidgetDayWidget;

JkWidgetCalendarCalendarWidgetDayWidget.NEW_JkUiGuiApplicationContext = function(context) {
	var v = new JkWidgetCalendarCalendarWidgetDayWidget;
	return v.CTOR_JkWidgetCalendarCalendarWidgetDayWidget_JkUiGuiApplicationContext(context);
};

JkWidgetCalendarCalendarWidgetDayWidget.prototype.CTOR_JkWidgetCalendarCalendarWidgetDayWidget_JkUiGuiApplicationContext = function(context) {
	this.lbl = null;
	this.canvas = null;
	this.enable = true;
	this.container = null;
	this.index = 0;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, context) == null) {
		return null;
	}
	return this;
};

JkWidgetCalendarCalendarWidgetDayWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	JkWidgetWidget.setWidgetClickHandler(this, (function() {
		if(this.enable) {
			this.container.updateSelectedDay(this.index);
		}
	}.bind(this)));
	this.canvas.setWidgetColor((JkGfxColor.white()));
};

JkWidgetCalendarCalendarWidgetDayWidget.prototype.setWidgetText = function(value) {
	this.lbl.setWidgetText(value);
	return this;
};

JkWidgetCalendarCalendarWidgetDayWidget.prototype.setWidgetEnabled = function(x) {
	this.enable = x;
	if(!x) {
		this.lbl.setWidgetTextColor((JkGfxColor.instance("#CCCCCC")));
	}
	else {
		this.lbl.setWidgetTextColor((JkGfxColor.instance("#191818")));
	}
};

JkWidgetCalendarCalendarWidgetDayWidget.prototype.getWidgetText = function() {
	return this.lbl.getWidgetText();
};

JkWidgetCalendarCalendarWidgetDayWidget.prototype.setWidgetBackgroundColor = function(color) {
	if(!(color != null)) {
		return null;
	}
	this.canvas.setWidgetColor(color);
	this.canvas.setWidgetRoundingRadius1((this.context.getHeightValue("3000um")));
	return this;
};

JkWidgetCalendarCalendarWidgetDayWidget.prototype.setWidgetTextColor = function(color) {
	if(!(color != null)) {
		return null;
	}
	if(this.enable) {
		this.lbl.setWidgetTextColor(color);
	}
	return this;
};

JkWidgetCalendarCalendarWidgetDayWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	var widget = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget.setWidgetColor((JkGfxColor.white()));
	this.addWidget(widget);
	var widget2 = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(this.context);
	var widget3 = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget3.setWidgetHeightRequest((this.context.getHeightValue("6000um")));
	widget3.setWidgetWidthRequest((this.context.getHeightValue("6000um")));
	this.canvas = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.canvas.setWidgetColor((JkGfxColor.white()));
	this.canvas.setWidgetRoundingRadius1((this.context.getHeightValue("3000um")));
	widget3.addWidget(this.canvas);
	var widget4 = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(this.context);
	var widget5 = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget5.setWidgetMargin((this.context.getHeightValue("400um")));
	this.lbl = JkWidgetLabelWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.lbl.setWidgetTextColor((JkGfxColor.black()));
	widget5.addWidget(this.lbl);
	widget4.addWidget(widget5);
	widget3.addWidget(widget4);
	widget2.addWidget(widget3);
	this.addWidget(widget2);
};

JkWidgetCalendarCalendarWidgetDayWidget.prototype.getIndex = function() {
	return this.index;
};

JkWidgetCalendarCalendarWidgetDayWidget.prototype.setIndex = function(v) {
	this.index = v;
	return this;
};

JkWidgetCalendarCalendarWidgetDayWidget.prototype.getContainer = function() {
	return this.container;
};

JkWidgetCalendarCalendarWidgetDayWidget.prototype.setContainer = function(v) {
	this.container = v;
	return this;
};

JkWidgetCalendarCalendarWidgetDayWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCalendarCalendarWidgetDayWidget"] === true;
};

let JkWidgetCalendarCalendarWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetOnClickHandler = null;
	this.widgetDisablePreviousDays = false;
	this.widgetBackgroundColor = null;
	this.widgetSelectedDayColor = null;
	this.widgetSelectedTextColor = null;
	this.widgetTextColor = null;
	this.days = null;
	this.currentMonth = 0;
	this.currentYear = 0;
	this.currentDay = 0;
	this.background = null;
	this.buttonContainer = null;
	this.prevYear = null;
	this.yearLabel = null;
	this.nextYear = null;
	this.prevMonth = null;
	this.monthLabel = null;
	this.nextMonth = null;
	this.headerContainer = null;
	this.container = null;
};

JkWidgetCalendarCalendarWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetCalendarCalendarWidget.prototype.constructor = JkWidgetCalendarCalendarWidget;
JkWidgetCalendarCalendarWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetCalendarCalendarWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetCalendarCalendarWidget.prototype._tobj = JkWidgetCalendarCalendarWidget;

JkWidgetCalendarCalendarWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetCalendarCalendarWidget;
	return v.CTOR_JkWidgetCalendarCalendarWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetCalendarCalendarWidget.prototype.CTOR_JkWidgetCalendarCalendarWidget_JkUiGuiApplicationContext = function(ctx) {
	this.container = null;
	this.headerContainer = null;
	this.nextMonth = null;
	this.monthLabel = null;
	this.prevMonth = null;
	this.nextYear = null;
	this.yearLabel = null;
	this.prevYear = null;
	this.buttonContainer = null;
	this.background = null;
	this.currentDay = 0;
	this.currentYear = 0;
	this.currentMonth = 0;
	this.days = null;
	this.widgetTextColor = null;
	this.widgetSelectedTextColor = null;
	this.widgetSelectedDayColor = null;
	this.widgetBackgroundColor = null;
	this.widgetDisablePreviousDays = false;
	this.widgetOnClickHandler = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.setWidgetStyle("CalendarWidget");
	return this;
};

JkWidgetCalendarCalendarWidget.prototype.setWidgetStyle = function(style) {
	this.widgetBackgroundColor = this.context.getStyleColor(style, "backgroundColor", null);
	if(!(this.widgetBackgroundColor != null)) {
		this.widgetBackgroundColor = JkGfxColor.white();
	}
	this.widgetSelectedDayColor = this.context.getStyleColor(style, "selectedDayColor", null);
	if(!(this.widgetSelectedDayColor != null)) {
		this.widgetSelectedDayColor = JkGfxColor.black();
	}
	this.widgetSelectedTextColor = this.context.getStyleColor(style, "selectedTextColor", null);
	if(!(this.widgetSelectedTextColor != null)) {
		this.widgetSelectedTextColor = JkGfxColor.white();
	}
	this.widgetTextColor = this.context.getStyleColor(style, "textColor", null);
	if(!(this.widgetTextColor != null)) {
		this.widgetTextColor = JkGfxColor.black();
	}
	this.updateWidgetStyle();
	return this;
};

JkWidgetCalendarCalendarWidget.prototype.updateWidgetStyle = function() {
	if(this.background != null) {
		this.background.setWidgetColor(this.widgetBackgroundColor);
	}
	if(this.yearLabel != null) {
		this.yearLabel.setWidgetTextColor(this.widgetTextColor);
	}
	if(this.monthLabel != null) {
		this.monthLabel.setWidgetTextColor(this.widgetTextColor);
	}
};

JkWidgetCalendarCalendarWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	this.days = new Array;
	var counter = 0;
	for(var x = 0 ; x < 6 ; x++) {
		var hbox = JkWidgetHorizontalBoxWidget.forContext(this.context, 0, (this.context.getHeightValue("400um")));
		for(var y = 0 ; y < 7 ; y++) {
			var d = JkWidgetCalendarCalendarWidgetDayWidget.NEW_JkUiGuiApplicationContext(this.context);
			d.setIndex(counter);
			d.setContainer(this);
			hbox.addWidget1(d, 1.0);
			this.days.push(d);
			counter++;
		}
		this.container.addWidget1(hbox, 1.0);
	}
	var weekNames = this.getWeekNames();
	for(var i = 0 ; i < weekNames.length ; i++) {
		this.headerContainer.addWidget1((JkWidgetCalendarCalendarWidgetDayWidget.NEW_JkUiGuiApplicationContext(this.context).setWidgetText(weekNames[i]).setWidgetTextColor(this.widgetTextColor)), 1.0);
	}
	var dt = JkTimeSystemClock.asDateTimeLocal();
	this.currentDay = dt.getDayOfMonth();
	this.currentYear = dt.getYear();
	this.currentMonth = dt.getMonth();
	this.yearLabel.setWidgetText((JkLangString.forInteger((dt.getYear()))));
	this.monthLabel.setWidgetText(this.getMonths()[dt.getMonth() - 1]);
	this.updateCalendarView(this.currentMonth, this.currentYear, this.currentDay);
	this.setClickHandlers();
	this.updateWidgetStyle();
};

JkWidgetCalendarCalendarWidget.prototype.setClickHandlers = function() {
	var months = this.getMonths();
	this.prevYear.setWidgetClickHandler((function() {
		this.currentYear--;
		this.yearLabel.setWidgetText((JkLangString.forInteger(this.currentYear)));
		this.updateCalendarView(this.currentMonth, this.currentYear, this.currentDay);
	}.bind(this)));
	this.nextYear.setWidgetClickHandler((function() {
		this.currentYear++;
		this.yearLabel.setWidgetText((JkLangString.forInteger(this.currentYear)));
		this.updateCalendarView(this.currentMonth, this.currentYear, this.currentDay);
	}.bind(this)));
	this.prevMonth.setWidgetClickHandler((function() {
		this.currentMonth--;
		if(this.currentMonth == 0) {
			this.currentMonth += 12;
			this.currentYear--;
			this.yearLabel.setWidgetText((JkLangString.forInteger(this.currentYear)));
		}
		this.monthLabel.setWidgetText(months[this.currentMonth - 1]);
		this.updateCalendarView(this.currentMonth, this.currentYear, this.currentDay);
	}.bind(this)));
	this.nextMonth.setWidgetClickHandler((function() {
		this.currentMonth++;
		if(this.currentMonth > 12) {
			this.currentMonth -= 12;
			this.currentYear++;
			this.yearLabel.setWidgetText((JkLangString.forInteger(this.currentYear)));
		}
		this.monthLabel.setWidgetText(months[this.currentMonth - 1]);
		this.updateCalendarView(this.currentMonth, this.currentYear, this.currentDay);
	}.bind(this)));
};

JkWidgetCalendarCalendarWidget.prototype.updateCalendarView = function(month, year, day) {
	var dt = JkTimeSystemClock.asDateTimeLocal();
	var numOfDays = this.getNumberOfDays(month, year);
	var startDay = this.getFirstDay(month, year);
	var today = day;
	var dayCounter = 1;
	var ld = 1;
	for(var i = 0 ; i < this.days.length ; i++) {
		var widget = JkLangVector.get(this.days, i);
		if(!(widget != null)) {
			continue;
		}
		var str = "";
		if(i < startDay) {
			var nd = this.getNumberOfDays((month - 1), year);
			str = JkLangString.forInteger((nd - startDay + (i + 1)));
			widget.setWidgetEnabled(false);
		}
		else if(i >= startDay && dayCounter <= numOfDays) {
			if(this.widgetDisablePreviousDays) {
				if(dayCounter < today && month == dt.getMonth() && year == dt.getYear()) {
					widget.setWidgetEnabled(false);
				}
				else {
					widget.setWidgetEnabled(true);
				}
			}
			else {
				widget.setWidgetEnabled(true);
			}
			if(this.currentDay == dayCounter && month == dt.getMonth() && year == dt.getYear()) {
				widget.setWidgetBackgroundColor(this.widgetSelectedDayColor);
				widget.setWidgetTextColor(this.widgetSelectedTextColor);
			}
			else if(dayCounter == today && month == dt.getMonth() && year == dt.getYear()) {
				widget.setWidgetBackgroundColor(this.widgetSelectedDayColor);
				widget.setWidgetTextColor(this.widgetSelectedTextColor);
			}
			else {
				widget.setWidgetBackgroundColor(this.widgetBackgroundColor);
				widget.setWidgetTextColor(this.widgetTextColor);
			}
			str = JkLangString.forInteger(dayCounter);
			dayCounter++;
		}
		else {
			widget.setWidgetEnabled(false);
			str = JkLangString.forInteger(ld);
			ld++;
		}
		widget.setWidgetText(str);
	}
};

JkWidgetCalendarCalendarWidget.prototype.updateSelectedDay = function(index) {
	for(var x = 0 ; x < this.days.length ; x++) {
		var widget = JkLangVector.get(this.days, x);
		if(!(widget != null)) {
			continue;
		}
		if(x == index) {
			if(!JkLangString.isEmpty((widget.getWidgetText()))) {
				widget.setWidgetBackgroundColor(this.widgetSelectedDayColor);
				widget.setWidgetTextColor(this.widgetSelectedTextColor);
				this.currentDay = JkLangString.toInteger((widget.getWidgetText()));
				if(this.widgetOnClickHandler != null) {
					this.widgetOnClickHandler(this.currentYear, this.currentMonth, this.currentDay);
				}
				continue;
			}
		}
		widget.setWidgetBackgroundColor(this.widgetBackgroundColor);
		widget.setWidgetTextColor(this.widgetTextColor);
	}
};

JkWidgetCalendarCalendarWidget.prototype.getWeekNames = function() {
	return ["Su", "Mo", "Tu", "We", "Th", "Fr", "Sa"];
};

JkWidgetCalendarCalendarWidget.prototype.getMonths = function() {
	return ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
};

JkWidgetCalendarCalendarWidget.prototype.getFirstDay = function(month, year) {
	var m = month;
	var y = year;
	if(m == 1 || m == 2) {
		m += 12;
		y--;
	}
	var k = y % 100;
	var j = y / 100;
	var h1 = JkMathMath.floor((13 * (m + 1) / 5));
	var h2 = JkMathMath.floor((k / 4));
	var h3 = JkMathMath.floor((j / 4));
	var h4 = JkMathMath.floor((5 * j));
	var h = ~(~(1 + ~(~h1) + k + h2 + h3 + h4)) % 7;
	var d = ~(~(h + 6)) % 7;
	return d;
};

JkWidgetCalendarCalendarWidget.prototype.getNumberOfDays = function(month, year) {
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

JkWidgetCalendarCalendarWidget.prototype.isLeapYear = function(year) {
	if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
		return true;
	}
	return false;
};

JkWidgetCalendarCalendarWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.setWidgetWidthRequest((this.context.getWidthValue("80mm")));
	this.setWidgetHeightRequest((this.context.getWidthValue("80mm")));
	this.background = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.background.setWidgetColor((JkGfxColor.white()));
	this.addWidget(this.background);
	var widget = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget.setWidgetSpacing((this.context.getHeightValue("400um")));
	this.buttonContainer = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	var widget2 = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.prevYear = JkWidgetCommonImageButtonWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.prevYear.setWidgetImageResource("left");
	this.prevYear.setWidgetButtonWidth((this.context.getHeightValue("6mm")));
	this.prevYear.setWidgetButtonHeight((this.context.getHeightValue("6mm")));
	widget2.addWidget(this.prevYear);
	var widget3 = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.yearLabel = JkWidgetLabelWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.yearLabel.setWidgetTextColor((JkGfxColor.black()));
	widget3.addWidget(this.yearLabel);
	widget2.addWidget1(widget3, 1.0);
	this.nextYear = JkWidgetCommonImageButtonWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.nextYear.setWidgetImageResource("right");
	this.nextYear.setWidgetButtonWidth((this.context.getHeightValue("6mm")));
	this.nextYear.setWidgetButtonHeight((this.context.getHeightValue("6mm")));
	widget2.addWidget(this.nextYear);
	this.buttonContainer.addWidget(widget2);
	var widget4 = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.prevMonth = JkWidgetCommonImageButtonWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.prevMonth.setWidgetImageResource("left");
	this.prevMonth.setWidgetButtonWidth((this.context.getHeightValue("6mm")));
	this.prevMonth.setWidgetButtonHeight((this.context.getHeightValue("6mm")));
	widget4.addWidget(this.prevMonth);
	var widget5 = JkWidgetAlignWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.monthLabel = JkWidgetLabelWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.monthLabel.setWidgetTextColor((JkGfxColor.black()));
	widget5.addWidget(this.monthLabel);
	widget4.addWidget1(widget5, 1.0);
	this.nextMonth = JkWidgetCommonImageButtonWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.nextMonth.setWidgetImageResource("right");
	this.nextMonth.setWidgetButtonWidth((this.context.getHeightValue("6mm")));
	this.nextMonth.setWidgetButtonHeight((this.context.getHeightValue("6mm")));
	widget4.addWidget(this.nextMonth);
	this.buttonContainer.addWidget(widget4);
	widget.addWidget(this.buttonContainer);
	var widget6 = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget6.setWidgetHeightRequest((this.context.getHeightValue("40um")));
	var widget7 = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget7.setWidgetColor((JkGfxColor.black()));
	widget6.addWidget(widget7);
	widget.addWidget(widget6);
	this.headerContainer = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.headerContainer.setWidgetSpacing((this.context.getHeightValue("400um")));
	widget.addWidget(this.headerContainer);
	var widget8 = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget8.setWidgetHeightRequest((this.context.getHeightValue("40um")));
	var widget9 = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	widget9.setWidgetColor((JkGfxColor.black()));
	widget8.addWidget(widget9);
	widget.addWidget(widget8);
	this.container = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.container.setWidgetSpacing((this.context.getHeightValue("400um")));
	widget.addWidget1(this.container, 1.0);
	this.addWidget(widget);
};

JkWidgetCalendarCalendarWidget.prototype.getWidgetOnClickHandler = function() {
	return this.widgetOnClickHandler;
};

JkWidgetCalendarCalendarWidget.prototype.setWidgetOnClickHandler = function(v) {
	this.widgetOnClickHandler = v;
	return this;
};

JkWidgetCalendarCalendarWidget.prototype.getWidgetDisablePreviousDays = function() {
	return this.widgetDisablePreviousDays;
};

JkWidgetCalendarCalendarWidget.prototype.setWidgetDisablePreviousDays = function(v) {
	this.widgetDisablePreviousDays = v;
	return this;
};

JkWidgetCalendarCalendarWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetCalendarCalendarWidget"] === true;
};
