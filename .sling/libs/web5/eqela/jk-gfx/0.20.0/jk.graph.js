let JkGraphGraphColors = function() {};

JkGraphGraphColors.prototype._t = { "JkGraphGraphColors" : true };
JkGraphGraphColors.prototype._tobj = JkGraphGraphColors;

JkGraphGraphColors.NEW = function() {
	var v = new JkGraphGraphColors;
	return v.CTOR_JkGraphGraphColors();
};

JkGraphGraphColors.prototype.CTOR_JkGraphGraphColors = function() {
	return this;
};

JkGraphGraphColors.getColors = function() {
	if(JkGraphGraphColors.colors == null) {
		JkGraphGraphColors.colors = new Array;
		JkGraphGraphColors.colors.push(JkGfxColor.forString("#FF0000"));
		JkGraphGraphColors.colors.push(JkGfxColor.forString("#00FF00"));
		JkGraphGraphColors.colors.push(JkGfxColor.forString("#0000FF"));
		JkGraphGraphColors.colors.push(JkGfxColor.forString("#FF00FF"));
		JkGraphGraphColors.colors.push(JkGfxColor.forString("#00FFFF"));
		JkGraphGraphColors.colors.push(JkGfxColor.forString("#FFFF00"));
	}
	return JkGraphGraphColors.colors;
};

JkGraphGraphColors.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGraphGraphColors"] === true;
};

JkGraphGraphColors.colors = null;

let JkGraphCommonGraphRenderer = function() {
	this.title = null;
	this.yTitle = null;
	this.xTitle = null;
	this.legends = null;
	this.labels = null;
	this.values = null;
};

JkGraphCommonGraphRenderer.prototype._t = {
	"JkRenderRenderer" : true,
	"JkGraphCommonGraphRenderer" : true
};
JkGraphCommonGraphRenderer.prototype._tobj = JkGraphCommonGraphRenderer;

JkGraphCommonGraphRenderer.NEW = function() {
	var v = new JkGraphCommonGraphRenderer;
	return v.CTOR_JkGraphCommonGraphRenderer();
};

JkGraphCommonGraphRenderer.prototype.CTOR_JkGraphCommonGraphRenderer = function() {
	this.values = null;
	this.labels = null;
	this.legends = null;
	this.xTitle = null;
	this.yTitle = null;
	this.title = null;
	return this;
};

JkGraphCommonGraphRenderer.prototype.render = function(ctx, width, height) {
	var margin = width * 0.01;
	var graphx = margin;
	var graphy = margin;
	var graphwidth = width - margin * 2;
	var graphheight = height - margin * 2;
	if(JkLangString.isNotEmpty(this.title)) {
		ctx.save();
		var titleFont = JkGfxFontDescription.forName("Arial", null);
		var tfh = height * 0.035;
		titleFont.setSize((JkGfxLength.forPoints(tfh, 0.0)));
		ctx.setFillStyle((JkGfxColor.black()));
		ctx.setFont(titleFont);
		ctx.setTextAlign(JkRenderRenderingContext.ALIGN_CENTER);
		ctx.setTextBaseline(JkRenderRenderingContext.BASELINE_MIDDLE);
		ctx.fillText(this.title, (width / 2), (tfh / 2), 0);
		ctx.restore();
		graphy += tfh + margin;
		graphheight -= tfh + margin;
	}
	if(JkLangString.isNotEmpty(this.xTitle)) {
		ctx.save();
		var titleFont1 = JkGfxFontDescription.forName("Arial", null);
		var tfh1 = height * 0.02;
		titleFont1.setSize((JkGfxLength.forPoints(tfh1, 0.0)));
		ctx.setFillStyle((JkGfxColor.forString("#404040")));
		ctx.setFont(titleFont1);
		ctx.setTextAlign(JkRenderRenderingContext.ALIGN_CENTER);
		ctx.setTextBaseline(JkRenderRenderingContext.BASELINE_MIDDLE);
		ctx.fillText(this.xTitle, (width / 2), (height - margin - tfh1 / 2), 0);
		ctx.restore();
		graphheight -= tfh1 + margin;
	}
	if(JkLangString.isNotEmpty(this.yTitle)) {
		ctx.save();
		var titleFont2 = JkGfxFontDescription.forName("Arial", null);
		var tfh2 = height * 0.02;
		titleFont2.setSize((JkGfxLength.forPoints(tfh2, 0.0)));
		ctx.setFillStyle((JkGfxColor.forString("#404040")));
		ctx.setFont(titleFont2);
		ctx.setTextAlign(JkRenderRenderingContext.ALIGN_CENTER);
		ctx.setTextBaseline(JkRenderRenderingContext.BASELINE_MIDDLE);
		ctx.translate((margin + tfh2 / 2), (height / 2));
		ctx.rotate((-JkMathMath.M_PI / 2));
		ctx.fillText(this.yTitle, 0, 0, 0);
		ctx.restore();
		graphwidth -= tfh2 + margin;
		graphx += tfh2 + margin;
	}
	this.renderGraph(ctx, graphx, graphy, graphwidth, graphheight);
};

JkGraphCommonGraphRenderer.prototype.renderGraph = function(ctx, ox, oy, width, height) {};

JkGraphCommonGraphRenderer.prototype.getTitle = function() {
	return this.title;
};

JkGraphCommonGraphRenderer.prototype.setTitle = function(v) {
	this.title = v;
	return this;
};

JkGraphCommonGraphRenderer.prototype.getYTitle = function() {
	return this.yTitle;
};

JkGraphCommonGraphRenderer.prototype.setYTitle = function(v) {
	this.yTitle = v;
	return this;
};

JkGraphCommonGraphRenderer.prototype.getXTitle = function() {
	return this.xTitle;
};

JkGraphCommonGraphRenderer.prototype.setXTitle = function(v) {
	this.xTitle = v;
	return this;
};

JkGraphCommonGraphRenderer.prototype.getLegends = function() {
	return this.legends;
};

JkGraphCommonGraphRenderer.prototype.setLegends = function(v) {
	this.legends = v;
	return this;
};

JkGraphCommonGraphRenderer.prototype.getLabels = function() {
	return this.labels;
};

JkGraphCommonGraphRenderer.prototype.setLabels = function(v) {
	this.labels = v;
	return this;
};

JkGraphCommonGraphRenderer.prototype.getValues = function() {
	return this.values;
};

JkGraphCommonGraphRenderer.prototype.setValues = function(v) {
	this.values = v;
	return this;
};

JkGraphCommonGraphRenderer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGraphCommonGraphRenderer"] === true;
};

let JkGraphBarGraphRenderer = function() {
	JkGraphCommonGraphRenderer.call(this);
	this.barFillColor = JkGfxColor.forString("#8080FF");
	this.barOutlineColor = JkGfxColor.black();
};

JkGraphBarGraphRenderer.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkGraphCommonGraphRenderer.prototype);
JkGraphBarGraphRenderer.prototype.constructor = JkGraphBarGraphRenderer;
JkGraphBarGraphRenderer.prototype._t = {
	"JkGraphCommonGraphRenderer" : true,
	"JkGraphBarGraphRenderer" : true,
	"JkRenderRenderer" : true
};
JkGraphBarGraphRenderer.prototype._tobj = JkGraphBarGraphRenderer;

JkGraphBarGraphRenderer.NEW = function() {
	var v = new JkGraphBarGraphRenderer;
	return v.CTOR_JkGraphBarGraphRenderer();
};

JkGraphBarGraphRenderer.prototype.CTOR_JkGraphBarGraphRenderer = function() {
	this.barOutlineColor = JkGfxColor.black();
	this.barFillColor = JkGfxColor.forString("#8080FF");
	if(JkGraphCommonGraphRenderer.prototype.CTOR_JkGraphCommonGraphRenderer.call(this) == null) {
		return null;
	}
	return this;
};

JkGraphBarGraphRenderer.prototype.renderGraph = function(ctx, ox, ooy, width, oheight) {
	var values = this.getValues();
	if(values == null || values.length < 2) {
		return;
	}
	var labels = this.getLabels();
	var oy = ooy;
	var height = oheight;
	var valueCount = values.length;
	var high = values[0];
	var low = values[0];
	var labelheight = height * 0.015;
	for(var n = 0 ; n < valueCount ; n++) {
		if(values[n] < low) {
			low = values[n];
		}
		if(values[n] > high) {
			high = values[n];
		}
	}
	if(low >= 0) {
		low = 0;
		if(labels != null) {
			height -= labelheight * 2;
		}
	}
	if(high <= 0) {
		high = 0;
		if(labels != null) {
			oy += labelheight * 2;
			height -= labelheight * 2;
		}
	}
	var range = high - low;
	var baseliney = 0.0;
	if(low >= 0) {
		baseliney = height;
	}
	else {
		baseliney = height - -low / range * height;
	}
	ctx.setStrokeStyle(this.barOutlineColor);
	ctx.setFillStyle(this.barFillColor);
	var blockSize = width / valueCount;
	for(var n1 = 0 ; n1 < valueCount ; n1++) {
		var x = n1 * blockSize;
		var y = 0.0;
		var h = 0.0;
		if(values[n1] >= 0) {
			h = values[n1] / range * height;
			y = baseliney - h;
		}
		else {
			y = baseliney;
			h = -values[n1] / range * height;
		}
		var barmargin = blockSize * 0.1;
		var barwidth = blockSize - barmargin * 2;
		ctx.fillRect((ox + x + barmargin), (oy + y), barwidth, h);
		ctx.strokeRect((ox + x + barmargin), (oy + y), barwidth, h);
		var label = JkLangVector.get(labels, n1);
		if(JkLangString.isNotEmpty(label)) {
			ctx.save();
			var labelFont = JkGfxFontDescription.forName("Arial", null);
			labelFont.setSize((JkGfxLength.forPoints(labelheight, 0.0)));
			ctx.setFillStyle((JkGfxColor.forString("#686868")));
			ctx.setFont(labelFont);
			ctx.setTextAlign(JkRenderRenderingContext.ALIGN_CENTER);
			ctx.setTextBaseline(JkRenderRenderingContext.BASELINE_MIDDLE);
			var lx = ox + x + barmargin + barwidth / 2;
			var ly = 0.0;
			if(values[n1] >= 0) {
				ly = oy + baseliney + labelheight + labelheight / 2;
			}
			else {
				ly = oy + baseliney - labelheight - labelheight / 2;
			}
			ctx.fillText(label, lx, ly, 0);
			ctx.restore();
		}
	}
	ctx.stroke();
};

JkGraphBarGraphRenderer.prototype.getBarFillColor = function() {
	return this.barFillColor;
};

JkGraphBarGraphRenderer.prototype.setBarFillColor = function(v) {
	this.barFillColor = v;
	return this;
};

JkGraphBarGraphRenderer.prototype.getBarOutlineColor = function() {
	return this.barOutlineColor;
};

JkGraphBarGraphRenderer.prototype.setBarOutlineColor = function(v) {
	this.barOutlineColor = v;
	return this;
};

JkGraphBarGraphRenderer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGraphBarGraphRenderer"] === true;
};

let JkGraphLineGraphRenderer = function() {
	JkGraphCommonGraphRenderer.call(this);
	this.lineWidth = 3.0;
};

JkGraphLineGraphRenderer.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkGraphCommonGraphRenderer.prototype);
JkGraphLineGraphRenderer.prototype.constructor = JkGraphLineGraphRenderer;
JkGraphLineGraphRenderer.prototype._t = {
	"JkGraphLineGraphRenderer" : true,
	"JkGraphCommonGraphRenderer" : true,
	"JkRenderRenderer" : true
};
JkGraphLineGraphRenderer.prototype._tobj = JkGraphLineGraphRenderer;

JkGraphLineGraphRenderer.NEW = function() {
	var v = new JkGraphLineGraphRenderer;
	return v.CTOR_JkGraphLineGraphRenderer();
};

JkGraphLineGraphRenderer.prototype.CTOR_JkGraphLineGraphRenderer = function() {
	this.lineWidth = 3.0;
	if(JkGraphCommonGraphRenderer.prototype.CTOR_JkGraphCommonGraphRenderer.call(this) == null) {
		return null;
	}
	return this;
};

JkGraphLineGraphRenderer.prototype.renderGraph = function(ctx, ox, oy, width, height) {
	var values = this.getValues();
	if(values == null || values.length < 2) {
		return;
	}
	var valueCount = values.length;
	var high = values[0];
	var low = values[0];
	for(var n = 0 ; n < valueCount ; n++) {
		if(values[n] < low) {
			low = values[n];
		}
		if(values[n] > high) {
			high = values[n];
		}
	}
	var range = high - low;
	ctx.setStrokeStyle((JkGfxColor.black()));
	ctx.setLineWidth(this.lineWidth);
	ctx.setLineJoin(JkRenderRenderingContext.LINE_JOIN_ROUND);
	for(var n1 = 0 ; n1 < valueCount ; n1++) {
		var x = n1 * (width / (valueCount - 1));
		var y = height - (values[n1] - low) / range * height;
		if(n1 == 0) {
			ctx.moveTo((ox + x), (oy + y));
		}
		else {
			ctx.lineTo((ox + x), (oy + y));
		}
	}
	ctx.stroke();
};

JkGraphLineGraphRenderer.prototype.getLineWidth = function() {
	return this.lineWidth;
};

JkGraphLineGraphRenderer.prototype.setLineWidth = function(v) {
	this.lineWidth = v;
	return this;
};

JkGraphLineGraphRenderer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGraphLineGraphRenderer"] === true;
};

let JkGraphPieGraphRenderer = function() {
	JkGraphCommonGraphRenderer.call(this);
	this.colors = JkGraphGraphColors.getColors();
	this.currentColor = -1;
	this.showPercentages = false;
};

JkGraphPieGraphRenderer.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkGraphCommonGraphRenderer.prototype);
JkGraphPieGraphRenderer.prototype.constructor = JkGraphPieGraphRenderer;
JkGraphPieGraphRenderer.prototype._t = {
	"JkGraphCommonGraphRenderer" : true,
	"JkRenderRenderer" : true,
	"JkGraphPieGraphRenderer" : true
};
JkGraphPieGraphRenderer.prototype._tobj = JkGraphPieGraphRenderer;

JkGraphPieGraphRenderer.NEW = function() {
	var v = new JkGraphPieGraphRenderer;
	return v.CTOR_JkGraphPieGraphRenderer();
};

JkGraphPieGraphRenderer.prototype.CTOR_JkGraphPieGraphRenderer = function() {
	this.showPercentages = false;
	this.currentColor = -1;
	this.colors = JkGraphGraphColors.getColors();
	if(JkGraphCommonGraphRenderer.prototype.CTOR_JkGraphCommonGraphRenderer.call(this) == null) {
		return null;
	}
	return this;
};

JkGraphPieGraphRenderer.prototype.getNextColor = function() {
	var n = this.currentColor;
	this.currentColor++;
	if(this.currentColor >= JkLangVector.getSize(this.colors)) {
		this.currentColor = 0;
	}
	return this.colors[n];
};

JkGraphPieGraphRenderer.prototype.renderGraph = function(ctx, ox, oy, width, height) {
	var values = this.getValues();
	if(values == null || values.length < 2) {
		return;
	}
	var labels = this.getLabels();
	this.currentColor = 0;
	var labelheight = height * 0.025;
	var valueCount = values.length;
	var total = 0.0;
	for(var n = 0 ; n < valueCount ; n++) {
		if(values[n] <= 0.0) {
			continue;
		}
		total += values[n];
	}
	if(total <= 0.0) {
		return;
	}
	var centerx = ox + width / 2;
	var centery = oy + height / 2;
	var radius = 0.0;
	if(width > height) {
		radius = height / 2;
	}
	else {
		radius = width / 2;
	}
	var fullcircle = 2.0 * JkMathMath.M_PI;
	var prev = 0.0;
	ctx.setStrokeStyle((JkGfxColor.black()));
	for(var n1 = 0 ; n1 < valueCount ; n1++) {
		if(values[n1] <= 0.0) {
			continue;
		}
		var p = values[n1] / total;
		var arcr = fullcircle * p;
		ctx.beginPath();
		ctx.moveTo(centerx, centery);
		ctx.arc(centerx, centery, radius, prev, (prev + arcr), false);
		ctx.lineTo(centerx, centery);
		ctx.setFillStyle((this.getNextColor()));
		ctx.fill();
		ctx.stroke();
		ctx.closePath();
		var label = JkLangVector.get(labels, n1);
		if(this.showPercentages) {
			var pp = (JkLangString.safeString((JkLangString.forDouble((p * 100.0))))) + ("%");
			if(label != null) {
				label = (JkLangString.safeString(label)) + (" (") + (JkLangString.safeString(pp)) + (")");
			}
			else {
				label = pp;
			}
		}
		if(JkLangString.isNotEmpty(label)) {
			ctx.save();
			var labelFont = JkGfxFontDescription.forName("Arial", null);
			labelFont.setSize((JkGfxLength.forPoints(labelheight, 0.0)));
			labelFont.setBold(true);
			ctx.setFillStyle((JkGfxColor.black()));
			ctx.setStrokeStyle((JkGfxColor.white()));
			ctx.setFont(labelFont);
			ctx.setTextAlign(JkRenderRenderingContext.ALIGN_CENTER);
			ctx.setTextBaseline(JkRenderRenderingContext.BASELINE_MIDDLE);
			var centerr = prev + arcr / 2;
			var lx = centerx + JkMathMath.cos(centerr) * radius;
			var ly = centery + JkMathMath.sin(centerr) * radius;
			ctx.strokeText(label, lx, ly, 0);
			ctx.fillText(label, lx, ly, 0);
			ctx.restore();
		}
		prev += arcr;
	}
};

JkGraphPieGraphRenderer.prototype.getShowPercentages = function() {
	return this.showPercentages;
};

JkGraphPieGraphRenderer.prototype.setShowPercentages = function(v) {
	this.showPercentages = v;
	return this;
};

JkGraphPieGraphRenderer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGraphPieGraphRenderer"] === true;
};
