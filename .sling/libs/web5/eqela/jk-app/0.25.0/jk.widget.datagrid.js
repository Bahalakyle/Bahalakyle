let JkWidgetDatagridDataGridWidgetColumn = function() {
	this.name = null;
	this.weight = 0.0;
	this.key = null;
	this.textAlign = 0;
};

JkWidgetDatagridDataGridWidgetColumn.prototype._t = { "JkWidgetDatagridDataGridWidgetColumn" : true };
JkWidgetDatagridDataGridWidgetColumn.prototype._tobj = JkWidgetDatagridDataGridWidgetColumn;

JkWidgetDatagridDataGridWidgetColumn.NEW = function() {
	var v = new JkWidgetDatagridDataGridWidgetColumn;
	return v.CTOR_JkWidgetDatagridDataGridWidgetColumn();
};

JkWidgetDatagridDataGridWidgetColumn.prototype.CTOR_JkWidgetDatagridDataGridWidgetColumn = function() {
	this.textAlign = 0;
	this.key = null;
	this.weight = 0.0;
	this.name = null;
	return this;
};

JkWidgetDatagridDataGridWidgetColumn.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetDatagridDataGridWidgetColumn"] === true;
};

let JkWidgetDatagridDataGridWidgetCellWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetText = null;
	this.widgetIsEditable = false;
	this.widgetKey = null;
	this.widgetTextAlign = 0;
	this.widgetTextColor = null;
	this.widget = null;
	this.cellBackground = null;
	this.cellTextCon = null;
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetDatagridDataGridWidgetCellWidget.prototype.constructor = JkWidgetDatagridDataGridWidgetCellWidget;
JkWidgetDatagridDataGridWidgetCellWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetDatagridDataGridWidgetCellWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetDatagridDataGridWidgetCellWidget.prototype._tobj = JkWidgetDatagridDataGridWidgetCellWidget;

JkWidgetDatagridDataGridWidgetCellWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetDatagridDataGridWidgetCellWidget;
	return v.CTOR_JkWidgetDatagridDataGridWidgetCellWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype.CTOR_JkWidgetDatagridDataGridWidgetCellWidget_JkUiGuiApplicationContext = function(ctx) {
	this.cellTextCon = null;
	this.cellBackground = null;
	this.widget = null;
	this.widgetTextColor = null;
	this.widgetTextAlign = 0;
	this.widgetKey = null;
	this.widgetIsEditable = false;
	this.widgetText = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.forceCreateWidget();
	return this;
};

JkWidgetDatagridDataGridWidgetCellWidget.forEditableCell = function(ctx, text, padding, textAlign) {
	var v = JkWidgetDatagridDataGridWidgetCellWidget.NEW_JkUiGuiApplicationContext(ctx);
	v.setWidgetText(text);
	v.setWidgetCellPadding(padding);
	v.setWidgetIsEditable(true);
	v.setWidgetTextAlign(textAlign);
	return v;
};

JkWidgetDatagridDataGridWidgetCellWidget.forStaticCell = function(ctx, text, padding, textAlign) {
	var v = JkWidgetDatagridDataGridWidgetCellWidget.NEW_JkUiGuiApplicationContext(ctx);
	v.setWidgetText(text);
	v.setWidgetCellPadding(padding);
	v.setWidgetIsEditable(false);
	v.setWidgetTextAlign(textAlign);
	return v;
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype.initializeWidget = function() {
	JkWidgetLayerWidget.prototype.initializeWidget.call(this);
	if(this.widgetIsEditable) {
		this.widget = JkWidgetCommonTextInputWidget.NEW_JkUiGuiApplicationContext(this.context);
		this.widget.setWidgetText(this.widgetText);
		this.widget.setWidgetTextColor(this.widgetTextColor);
		this.widget.setWidgetTextAlign(this.widgetTextAlign);
		this.cellTextCon.addWidget(this.widget);
	}
	else {
		this.widget = JkWidgetLabelWidget.forText(this.context, this.widgetText);
		this.widget.setWidgetTextColor(this.widgetTextColor);
		this.widget.setWidgetTextAlign(this.widgetTextAlign);
		this.cellTextCon.addWidget(this.widget);
	}
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype.setWidgetCellPadding = function(padding) {
	this.cellTextCon.setWidgetMargin(padding);
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype.setWidgetCellBackgroundColor = function(color) {
	this.cellBackground.setWidgetColor(color);
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype.setWidgetCellTextColor = function(color) {
	this.widgetTextColor = color;
	if(!(this.widget != null)) {
		return;
	}
	if(JkWidgetCommonTextInputWidget.IS_INSTANCE && JkWidgetCommonTextInputWidget.IS_INSTANCE(this.widget)) {
		this.widget.setWidgetTextColor(color);
	}
	else {
		this.widget.setWidgetTextColor(color);
	}
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype.getWidgetText = function() {
	var v = "";
	if(JkWidgetCommonTextInputWidget.IS_INSTANCE && JkWidgetCommonTextInputWidget.IS_INSTANCE(this.widget)) {
		v = this.widget.getWidgetText();
	}
	else {
		v = this.widget.getWidgetText();
	}
	return v;
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype.createWidget = function() {
	JkWidgetLayerWidget.prototype.createWidget.call(this);
	var thisWidget = this;
	this.cellBackground = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.cellBackground.setWidgetColor((JkGfxColor.white()));
	this.addWidget(this.cellBackground);
	this.cellTextCon = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.addWidget(this.cellTextCon);
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype.setWidgetText = function(v) {
	this.widgetText = v;
	return this;
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype.getWidgetIsEditable = function() {
	return this.widgetIsEditable;
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype.setWidgetIsEditable = function(v) {
	this.widgetIsEditable = v;
	return this;
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype.getWidgetKey = function() {
	return this.widgetKey;
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype.setWidgetKey = function(v) {
	this.widgetKey = v;
	return this;
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype.getWidgetTextAlign = function() {
	return this.widgetTextAlign;
};

JkWidgetDatagridDataGridWidgetCellWidget.prototype.setWidgetTextAlign = function(v) {
	this.widgetTextAlign = v;
	return this;
};

JkWidgetDatagridDataGridWidgetCellWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetDatagridDataGridWidgetCellWidget"] === true;
};

let JkWidgetDatagridDataGridWidgetDataGridRowWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetGridWidth = 0;
	this.widgetCellPadding = 0;
	this.widgetIsEditable = false;
	this.widgetBackground = null;
	this.widgetMain = null;
	this.widgetCellContainer = null;
};

JkWidgetDatagridDataGridWidgetDataGridRowWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetDatagridDataGridWidgetDataGridRowWidget.prototype.constructor = JkWidgetDatagridDataGridWidgetDataGridRowWidget;
JkWidgetDatagridDataGridWidgetDataGridRowWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetWidgetWithLayout" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetDatagridDataGridWidgetDataGridRowWidget" : true
};
JkWidgetDatagridDataGridWidgetDataGridRowWidget.prototype._tobj = JkWidgetDatagridDataGridWidgetDataGridRowWidget;

JkWidgetDatagridDataGridWidgetDataGridRowWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetDatagridDataGridWidgetDataGridRowWidget;
	return v.CTOR_JkWidgetDatagridDataGridWidgetDataGridRowWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetDatagridDataGridWidgetDataGridRowWidget.prototype.CTOR_JkWidgetDatagridDataGridWidgetDataGridRowWidget_JkUiGuiApplicationContext = function(ctx) {
	this.widgetCellContainer = null;
	this.widgetMain = null;
	this.widgetBackground = null;
	this.widgetIsEditable = false;
	this.widgetCellPadding = 0;
	this.widgetGridWidth = 0;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.addWidget((this.widgetBackground = JkWidgetCanvasWidget.forColor(this.context, (JkGfxColor.black()))));
	this.addWidget((this.widgetMain = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(ctx)));
	return this;
};

JkWidgetDatagridDataGridWidgetDataGridRowWidget.prototype.setWidgetBackgroundColor = function(color) {
	var array = JkWidgetWidget.getChildren(this.widgetCellContainer);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var cell = (function(o) {
				if(JkWidgetDatagridDataGridWidgetCellWidget.IS_INSTANCE && JkWidgetDatagridDataGridWidgetCellWidget.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))(array[n]);
			if(cell != null) {
				cell.setWidgetCellBackgroundColor(color);
			}
		}
	}
};

JkWidgetDatagridDataGridWidgetDataGridRowWidget.prototype.reload = function(data, widgetColumns, isEditable) {
	var n = 0;
	var c = data.length;
	this.widgetCellContainer = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(this.context);
	this.widgetCellContainer.setWidgetSpacing(this.widgetGridWidth);
	this.widgetMain.addWidget(this.widgetCellContainer);
	if(widgetColumns != null) {
		var n2 = 0;
		var m = widgetColumns.length;
		for(n2 = 0 ; n2 < m ; n2++) {
			var column = widgetColumns[n2];
			if(column != null) {
				if(n >= c) {
					continue;
				}
				var dd = data[n];
				var str = JkLangString.asString(dd);
				if(!(str != null)) {
					str = "";
				}
				var ta = column.textAlign;
				if(ta < 0) {
					ta = 0;
				}
				var cell = null;
				if(isEditable) {
					cell = JkWidgetDatagridDataGridWidgetCellWidget.forEditableCell(this.context, str, this.widgetCellPadding, ta);
				}
				else {
					cell = JkWidgetDatagridDataGridWidgetCellWidget.forStaticCell(this.context, str, this.widgetCellPadding, ta);
				}
				cell.setWidgetKey(column.key);
				cell.setWidgetCellTextColor((JkGfxColor.black()));
				this.widgetCellContainer.addWidget1(cell, column.weight);
				n++;
			}
		}
	}
};

JkWidgetDatagridDataGridWidgetDataGridRowWidget.prototype.collectRowDataTo = function(dv) {
	if(!(dv != null)) {
		return;
	}
	var dm = JkLangDynamicMap.NEW();
	var array = JkWidgetWidget.getChildren(this.widgetCellContainer);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var cell = (function(o) {
				if(JkWidgetDatagridDataGridWidgetCellWidget.IS_INSTANCE && JkWidgetDatagridDataGridWidgetCellWidget.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))(array[n]);
			if(cell != null) {
				dm.setString((cell.getWidgetKey()), (cell.getWidgetText()));
			}
		}
	}
	dv.appendObject(dm);
};

JkWidgetDatagridDataGridWidgetDataGridRowWidget.prototype.getWidgetGridWidth = function() {
	return this.widgetGridWidth;
};

JkWidgetDatagridDataGridWidgetDataGridRowWidget.prototype.setWidgetGridWidth = function(v) {
	this.widgetGridWidth = v;
	return this;
};

JkWidgetDatagridDataGridWidgetDataGridRowWidget.prototype.getWidgetCellPadding = function() {
	return this.widgetCellPadding;
};

JkWidgetDatagridDataGridWidgetDataGridRowWidget.prototype.setWidgetCellPadding = function(v) {
	this.widgetCellPadding = v;
	return this;
};

JkWidgetDatagridDataGridWidgetDataGridRowWidget.prototype.getWidgetIsEditable = function() {
	return this.widgetIsEditable;
};

JkWidgetDatagridDataGridWidgetDataGridRowWidget.prototype.setWidgetIsEditable = function(v) {
	this.widgetIsEditable = v;
	return this;
};

JkWidgetDatagridDataGridWidgetDataGridRowWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetDatagridDataGridWidgetDataGridRowWidget"] === true;
};

let JkWidgetDatagridDataGridWidget = function() {
	JkWidgetLayerWidget.call(this);
	this.widgetBackground = null;
	this.widgetGridBackground = null;
	this.widgetGrid = null;
	this.widgetDataBox = null;
	this.widgetHeaderRow = null;
	this.widgetColumns = null;
	this.widgetGridWidth = 0;
	this.selectedRow = null;
	this.widgetHeaderBackgroundColor = null;
	this.widgetHeaderForegroundColor = null;
	this.widgetDataBackgroundColor = null;
	this.widgetDataForegroundColor = null;
	this.widgetSelectedDataBackgroundColor = null;
	this.widgetSelectedDataForegroundColor = null;
	this.widgetCellPadding = 0;
	this.widgetIsEditable = false;
};

JkWidgetDatagridDataGridWidget.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkWidgetLayerWidget.prototype);
JkWidgetDatagridDataGridWidget.prototype.constructor = JkWidgetDatagridDataGridWidget;
JkWidgetDatagridDataGridWidget.prototype._t = {
	"JkWidgetParentAwareWidget" : true,
	"JkWidgetHeightAwareWidget" : true,
	"JkWidgetWidget" : true,
	"JkWidgetDatagridDataGridWidget" : true,
	"JkWidgetLayerWidget" : true,
	"JkWidgetContainerWidget" : true,
	"JkWidgetWidgetWithLayout" : true
};
JkWidgetDatagridDataGridWidget.prototype._tobj = JkWidgetDatagridDataGridWidget;

JkWidgetDatagridDataGridWidget.NEW_JkUiGuiApplicationContext = function(ctx) {
	var v = new JkWidgetDatagridDataGridWidget;
	return v.CTOR_JkWidgetDatagridDataGridWidget_JkUiGuiApplicationContext(ctx);
};

JkWidgetDatagridDataGridWidget.prototype.CTOR_JkWidgetDatagridDataGridWidget_JkUiGuiApplicationContext = function(ctx) {
	this.widgetIsEditable = false;
	this.widgetCellPadding = 0;
	this.widgetSelectedDataForegroundColor = null;
	this.widgetSelectedDataBackgroundColor = null;
	this.widgetDataForegroundColor = null;
	this.widgetDataBackgroundColor = null;
	this.widgetHeaderForegroundColor = null;
	this.widgetHeaderBackgroundColor = null;
	this.selectedRow = null;
	this.widgetGridWidth = 0;
	this.widgetColumns = null;
	this.widgetHeaderRow = null;
	this.widgetDataBox = null;
	this.widgetGrid = null;
	this.widgetGridBackground = null;
	this.widgetBackground = null;
	if(JkWidgetLayerWidget.prototype.CTOR_JkWidgetLayerWidget_JkUiGuiApplicationContext.call(this, ctx) == null) {
		return null;
	}
	this.addWidget((this.widgetBackground = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(ctx)));
	var db = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(ctx);
	this.widgetGrid = db;
	db.addWidget((this.widgetHeaderRow = JkWidgetHorizontalBoxWidget.NEW_JkUiGuiApplicationContext(ctx)));
	db.addWidget((this.widgetDataBox = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(ctx)));
	var dblayer = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(ctx);
	dblayer.addWidget((this.widgetGridBackground = JkWidgetCanvasWidget.NEW_JkUiGuiApplicationContext(ctx)));
	dblayer.addWidget(db);
	var dblb = JkWidgetVerticalBoxWidget.NEW_JkUiGuiApplicationContext(ctx);
	dblb.addWidget(dblayer);
	this.addWidget(dblb);
	this.setWidgetHeaderForegroundColor((JkGfxColor.black()));
	this.setWidgetDataBackgroundColor((JkGfxColor.white()));
	this.setWidgetDataForegroundColor((JkGfxColor.black()));
	this.setWidgetSelectedDataForegroundColor((JkGfxColor.white()));
	this.setWidgetSelectedDataBackgroundColor((JkGfxColor.instance("#428AFF")));
	this.setWidgetBackgroundColor((JkGfxColor.white()));
	this.setWidgetGridColor((JkGfxColor.black()));
	this.setWidgetHeaderBackgroundColor((JkGfxColor.instance("#AAAAAA")));
	this.setWidgetBackgroundColor((JkGfxColor.white()));
	this.setWidgetGridWidth((ctx.getHeightValue("500um")));
	this.setWidgetCellPadding((ctx.getHeightValue("1mm")));
	return this;
};

JkWidgetDatagridDataGridWidget.prototype.setWidgetBackgroundColor = function(color) {
	this.widgetBackground.setWidgetColor(color);
};

JkWidgetDatagridDataGridWidget.prototype.getWidgetBackgroundColor = function() {
	return this.widgetBackground.getWidgetColor();
};

JkWidgetDatagridDataGridWidget.prototype.setWidgetGridColor = function(color) {
	this.widgetGridBackground.setWidgetColor(color);
};

JkWidgetDatagridDataGridWidget.prototype.getWidgetGridColor = function() {
	return this.widgetGridBackground.getWidgetColor();
};

JkWidgetDatagridDataGridWidget.prototype.setWidgetGridWidth = function(width) {
	this.widgetGridWidth = width;
	this.widgetGrid.setWidgetMargin(width);
	this.widgetGrid.setWidgetSpacing(width);
	this.widgetDataBox.setWidgetSpacing(width);
	this.widgetHeaderRow.setWidgetSpacing(width);
};

JkWidgetDatagridDataGridWidget.prototype.deleteAllColumns = function() {
	this.widgetColumns = null;
	this.deleteWidgetHeaderRow();
	this.deleteAllRows();
};

JkWidgetDatagridDataGridWidget.prototype.addColumn = function(name, key, weight, textAlign) {
	if(!(this.widgetColumns != null)) {
		this.widgetColumns = new Array;
	}
	var c = JkWidgetDatagridDataGridWidgetColumn.NEW();
	c.name = name;
	c.key = key;
	c.weight = weight;
	c.textAlign = textAlign;
	this.widgetColumns.push(c);
};

JkWidgetDatagridDataGridWidget.prototype.addWidgetHeaderRow = function() {
	this.widgetHeaderRow.removeAllChildren();
	if(this.widgetColumns != null) {
		var n = 0;
		var m = this.widgetColumns.length;
		for(n = 0 ; n < m ; n++) {
			var column = this.widgetColumns[n];
			if(column != null) {
				var str = column.name;
				if(!(str != null)) {
					str = "";
				}
				var lbl = JkWidgetLabelWidget.forText(this.context, str);
				lbl.setWidgetTextColor(this.widgetHeaderForegroundColor);
				lbl.setWidgetFontBold(true);
				var cc = JkWidgetCanvasWidget.forColor(this.context, this.widgetHeaderBackgroundColor);
				var ll = JkWidgetLayerWidget.NEW_JkUiGuiApplicationContext(this.context);
				ll.addWidget(cc);
				if(this.widgetCellPadding > 0) {
					ll.addWidget((JkWidgetLayerWidget.forWidget(this.context, lbl, this.widgetCellPadding)));
				}
				else {
					ll.addWidget(lbl);
				}
				this.widgetHeaderRow.addWidget1(ll, column.weight);
			}
		}
	}
};

JkWidgetDatagridDataGridWidget.prototype.deleteWidgetHeaderRow = function() {
	this.widgetHeaderRow.removeAllChildren();
};

JkWidgetDatagridDataGridWidget.prototype.deleteAllRows = function() {
	this.widgetDataBox.removeAllChildren();
};

JkWidgetDatagridDataGridWidget.prototype.addRow = function(data, clickHandler, doubleClickHandler) {
	var row = JkWidgetDatagridDataGridWidgetDataGridRowWidget.NEW_JkUiGuiApplicationContext(this.context);
	row.setWidgetGridWidth(this.widgetGridWidth);
	row.setWidgetCellPadding(this.widgetCellPadding);
	row.reload(data, this.widgetColumns, this.widgetIsEditable);
	this.widgetDataBox.addWidget(row);
	var r = row;
	var h = clickHandler;
	var d = doubleClickHandler;
	JkWidgetWidget.setWidgetClickHandler(row, (function() {
		if(this.selectedRow != null) {
			this.selectedRow.setWidgetBackgroundColor((JkGfxColor.white()));
		}
		r.setWidgetBackgroundColor(this.widgetSelectedDataBackgroundColor);
		this.selectedRow = r;
		if(h != null) {
			h();
		}
	}.bind(this)));
	JkWidgetWidget.setWidgetDoubleClickHandler(row, (function() {
		if(this.selectedRow != null) {
			this.selectedRow.setWidgetBackgroundColor((JkGfxColor.white()));
		}
		r.setWidgetBackgroundColor(this.widgetSelectedDataBackgroundColor);
		this.selectedRow = r;
		if(d != null) {
			d();
		}
	}.bind(this)));
};

JkWidgetDatagridDataGridWidget.prototype.getGridData = function() {
	var dv = JkLangDynamicVector.NEW();
	var array = JkWidgetWidget.getChildren(this.widgetDataBox);
	if(array != null) {
		var n = 0;
		var m = array.length;
		for(n = 0 ; n < m ; n++) {
			var dgr = (function(o) {
				if(JkWidgetDatagridDataGridWidgetDataGridRowWidget.IS_INSTANCE && JkWidgetDatagridDataGridWidgetDataGridRowWidget.IS_INSTANCE(o)) {
					return o;
				}
				return null;
			}.bind(this))(array[n]);
			if(dgr != null) {
				dgr.collectRowDataTo(dv);
			}
		}
	}
	return dv;
};

JkWidgetDatagridDataGridWidget.prototype.getWidgetHeaderBackgroundColor = function() {
	return this.widgetHeaderBackgroundColor;
};

JkWidgetDatagridDataGridWidget.prototype.setWidgetHeaderBackgroundColor = function(v) {
	this.widgetHeaderBackgroundColor = v;
	return this;
};

JkWidgetDatagridDataGridWidget.prototype.getWidgetHeaderForegroundColor = function() {
	return this.widgetHeaderForegroundColor;
};

JkWidgetDatagridDataGridWidget.prototype.setWidgetHeaderForegroundColor = function(v) {
	this.widgetHeaderForegroundColor = v;
	return this;
};

JkWidgetDatagridDataGridWidget.prototype.getWidgetDataBackgroundColor = function() {
	return this.widgetDataBackgroundColor;
};

JkWidgetDatagridDataGridWidget.prototype.setWidgetDataBackgroundColor = function(v) {
	this.widgetDataBackgroundColor = v;
	return this;
};

JkWidgetDatagridDataGridWidget.prototype.getWidgetDataForegroundColor = function() {
	return this.widgetDataForegroundColor;
};

JkWidgetDatagridDataGridWidget.prototype.setWidgetDataForegroundColor = function(v) {
	this.widgetDataForegroundColor = v;
	return this;
};

JkWidgetDatagridDataGridWidget.prototype.getWidgetSelectedDataBackgroundColor = function() {
	return this.widgetSelectedDataBackgroundColor;
};

JkWidgetDatagridDataGridWidget.prototype.setWidgetSelectedDataBackgroundColor = function(v) {
	this.widgetSelectedDataBackgroundColor = v;
	return this;
};

JkWidgetDatagridDataGridWidget.prototype.getWidgetSelectedDataForegroundColor = function() {
	return this.widgetSelectedDataForegroundColor;
};

JkWidgetDatagridDataGridWidget.prototype.setWidgetSelectedDataForegroundColor = function(v) {
	this.widgetSelectedDataForegroundColor = v;
	return this;
};

JkWidgetDatagridDataGridWidget.prototype.getWidgetCellPadding = function() {
	return this.widgetCellPadding;
};

JkWidgetDatagridDataGridWidget.prototype.setWidgetCellPadding = function(v) {
	this.widgetCellPadding = v;
	return this;
};

JkWidgetDatagridDataGridWidget.prototype.getWidgetIsEditable = function() {
	return this.widgetIsEditable;
};

JkWidgetDatagridDataGridWidget.prototype.setWidgetIsEditable = function(v) {
	this.widgetIsEditable = v;
	return this;
};

JkWidgetDatagridDataGridWidget.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWidgetDatagridDataGridWidget"] === true;
};

JkWidgetDatagridDataGridWidget.ALIGN_LEFT = 0;
JkWidgetDatagridDataGridWidget.ALIGN_CENTER = 1;
JkWidgetDatagridDataGridWidget.ALIGN_RIGHT = 2;
JkWidgetDatagridDataGridWidget.ALIGN_JUSTIFY = 3;
