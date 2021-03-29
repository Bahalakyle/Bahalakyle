let JkRenderRenderer = {};

JkRenderRenderer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkRenderRenderer"] === true;
};

let JkRenderRenderingContext = function() {};

JkRenderRenderingContext.prototype._t = { "JkRenderRenderingContext" : true };
JkRenderRenderingContext.prototype._tobj = JkRenderRenderingContext;

JkRenderRenderingContext.NEW = function() {
	var v = new JkRenderRenderingContext;
	return v.CTOR_JkRenderRenderingContext();
};

JkRenderRenderingContext.prototype.CTOR_JkRenderRenderingContext = function() {
	return this;
};

JkRenderRenderingContext.prototype.setFillStyle = function(style) {};

JkRenderRenderingContext.prototype.setStrokeStyle = function(style) {};

JkRenderRenderingContext.prototype.setShadowColor = function(color) {};

JkRenderRenderingContext.prototype.setShadowBlur = function(blur) {};

JkRenderRenderingContext.prototype.setShadowOffsetX = function(offset) {};

JkRenderRenderingContext.prototype.setShadowOffsetY = function(offset) {};

JkRenderRenderingContext.prototype.createLinearGradient = function(x0, y0, x1, y1) {};

JkRenderRenderingContext.prototype.createPattern = function(image, repeat) {};

JkRenderRenderingContext.prototype.createRadialGradient = function(x0, y0, r0, x1, y1, r1) {};

JkRenderRenderingContext.prototype.addColorStop = function(gradient, index, color) {};

JkRenderRenderingContext.prototype.setLineCap = function(cap) {};

JkRenderRenderingContext.prototype.setLineJoin = function(join) {};

JkRenderRenderingContext.prototype.setLineWidth = function(width) {};

JkRenderRenderingContext.prototype.setMiterLimit = function(limit) {};

JkRenderRenderingContext.prototype.rect = function(x, y, width, height) {};

JkRenderRenderingContext.prototype.fillRect = function(x, y, width, height) {};

JkRenderRenderingContext.prototype.strokeRect = function(x, y, width, height) {};

JkRenderRenderingContext.prototype.clearRect = function(x, y, width, height) {};

JkRenderRenderingContext.prototype.fill = function() {};

JkRenderRenderingContext.prototype.stroke = function() {};

JkRenderRenderingContext.prototype.beginPath = function() {};

JkRenderRenderingContext.prototype.moveTo = function(x, y) {};

JkRenderRenderingContext.prototype.closePath = function() {};

JkRenderRenderingContext.prototype.lineTo = function(x, y) {};

JkRenderRenderingContext.prototype.clip = function() {};

JkRenderRenderingContext.prototype.quadraticCurveTo = function(cpx, cpy, x, y) {};

JkRenderRenderingContext.prototype.bezierCurveTo = function(cp1x, cp1y, cp2x, cp2y, x, y) {};

JkRenderRenderingContext.prototype.arc = function(x, y, r, sAngle, eAngle, counterclockwise) {};

JkRenderRenderingContext.prototype.arcTo = function(x1, y1, x2, y2, r) {};

JkRenderRenderingContext.prototype.isPointInPath = function(x, y) {};

JkRenderRenderingContext.prototype.scale = function(scalewidth, scaleheight) {};

JkRenderRenderingContext.prototype.rotate = function(angle) {};

JkRenderRenderingContext.prototype.translate = function(x, y) {};

JkRenderRenderingContext.prototype.transform = function(a, b, c, d, e, f) {};

JkRenderRenderingContext.prototype.setTransform = function(a, b, c, d, e, f) {};

JkRenderRenderingContext.prototype.setFont = function(font) {};

JkRenderRenderingContext.prototype.setTextAlign = function(align) {};

JkRenderRenderingContext.prototype.setTextBaseline = function(baseline) {};

JkRenderRenderingContext.prototype.fillText = function(text, x, y, maxWidth) {};

JkRenderRenderingContext.prototype.strokeText = function(text, x, y, maxWidth) {};

JkRenderRenderingContext.prototype.measureTextHeight = function(text) {};

JkRenderRenderingContext.prototype.measureTextWidth = function(text) {};

JkRenderRenderingContext.prototype.drawImage = function(img, x, y) {};

JkRenderRenderingContext.prototype.drawAndScaleImage = function(img, x, y, width, height) {};

JkRenderRenderingContext.prototype.drawAndProcessImage = function(img, sx, sy, swidth, sheight, x, y, width, height) {};

JkRenderRenderingContext.prototype.setGlobalAlpha = function(alpha) {};

JkRenderRenderingContext.prototype.save = function() {};

JkRenderRenderingContext.prototype.restore = function() {};

JkRenderRenderingContext.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkRenderRenderingContext"] === true;
};

JkRenderRenderingContext.REPEAT_BOTH = 0;
JkRenderRenderingContext.REPEAT_X = 1;
JkRenderRenderingContext.REPEAT_Y = 2;
JkRenderRenderingContext.REPEAT_NONE = 3;
JkRenderRenderingContext.LINE_CAP_BUTT = 0;
JkRenderRenderingContext.LINE_CAP_ROUND = 1;
JkRenderRenderingContext.LINE_CAP_SQUARE = 2;
JkRenderRenderingContext.LINE_JOIN_MITER = 0;
JkRenderRenderingContext.LINE_JOIN_BEVEL = 1;
JkRenderRenderingContext.LINE_JOIN_ROUND = 2;
JkRenderRenderingContext.ALIGN_START = 0;
JkRenderRenderingContext.ALIGN_END = 1;
JkRenderRenderingContext.ALIGN_CENTER = 2;
JkRenderRenderingContext.ALIGN_LEFT = 3;
JkRenderRenderingContext.ALIGN_RIGHT = 4;
JkRenderRenderingContext.BASELINE_ALPHABETIC = 0;
JkRenderRenderingContext.BASELINE_TOP = 1;
JkRenderRenderingContext.BASELINE_HANGING = 2;
JkRenderRenderingContext.BASELINE_MIDDLE = 3;
JkRenderRenderingContext.BASELINE_IDEOGRAPHIC = 4;
JkRenderRenderingContext.BASELINE_BOTTOM = 5;
