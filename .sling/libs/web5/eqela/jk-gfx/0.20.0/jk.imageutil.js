let JkImageutilRGBAImageBuffer = function() {
	this.buffer = null;
	this.width = 0;
	this.height = 0;
};

JkImageutilRGBAImageBuffer.prototype._t = { "JkImageutilRGBAImageBuffer" : true };
JkImageutilRGBAImageBuffer.prototype._tobj = JkImageutilRGBAImageBuffer;

JkImageutilRGBAImageBuffer.NEW = function() {
	var v = new JkImageutilRGBAImageBuffer;
	return v.CTOR_JkImageutilRGBAImageBuffer();
};

JkImageutilRGBAImageBuffer.prototype.CTOR_JkImageutilRGBAImageBuffer = function() {
	this.height = 0;
	this.width = 0;
	this.buffer = null;
	return this;
};

JkImageutilRGBAImageBuffer.prototype.getBuffer = function() {
	return this.buffer;
};

JkImageutilRGBAImageBuffer.prototype.setBuffer = function(v) {
	this.buffer = v;
	return this;
};

JkImageutilRGBAImageBuffer.prototype.getWidth = function() {
	return this.width;
};

JkImageutilRGBAImageBuffer.prototype.setWidth = function(v) {
	this.width = v;
	return this;
};

JkImageutilRGBAImageBuffer.prototype.getHeight = function() {
	return this.height;
};

JkImageutilRGBAImageBuffer.prototype.setHeight = function(v) {
	this.height = v;
	return this;
};

JkImageutilRGBAImageBuffer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkImageutilRGBAImageBuffer"] === true;
};

let JkImageutilImageResizerIndexMovingBuffer = function() {
	this.buf = null;
	this.index = 0;
};

JkImageutilImageResizerIndexMovingBuffer.prototype._t = { "JkImageutilImageResizerIndexMovingBuffer" : true };
JkImageutilImageResizerIndexMovingBuffer.prototype._tobj = JkImageutilImageResizerIndexMovingBuffer;

JkImageutilImageResizerIndexMovingBuffer.NEW = function() {
	var v = new JkImageutilImageResizerIndexMovingBuffer;
	return v.CTOR_JkImageutilImageResizerIndexMovingBuffer();
};

JkImageutilImageResizerIndexMovingBuffer.prototype.CTOR_JkImageutilImageResizerIndexMovingBuffer = function() {
	this.index = 0;
	this.buf = null;
	return this;
};

JkImageutilImageResizerIndexMovingBuffer.prototype.move = function(n) {
	var v = JkImageutilImageResizerIndexMovingBuffer.NEW();
	v.setBuf(this.buf);
	v.setIndex((v.getIndex() + n));
	return v;
};

JkImageutilImageResizerIndexMovingBuffer.prototype.getBuf = function() {
	return this.buf;
};

JkImageutilImageResizerIndexMovingBuffer.prototype.setBuf = function(v) {
	this.buf = v;
	return this;
};

JkImageutilImageResizerIndexMovingBuffer.prototype.getIndex = function() {
	return this.index;
};

JkImageutilImageResizerIndexMovingBuffer.prototype.setIndex = function(v) {
	this.index = v;
	return this;
};

JkImageutilImageResizerIndexMovingBuffer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkImageutilImageResizerIndexMovingBuffer"] === true;
};

let JkImageutilImageResizer = function() {};

JkImageutilImageResizer.prototype._t = { "JkImageutilImageResizer" : true };
JkImageutilImageResizer.prototype._tobj = JkImageutilImageResizer;

JkImageutilImageResizer.NEW = function() {
	var v = new JkImageutilImageResizer;
	return v.CTOR_JkImageutilImageResizer();
};

JkImageutilImageResizer.prototype.CTOR_JkImageutilImageResizer = function() {
	return this;
};

JkImageutilImageResizer.li = function(src1, src2, a) {
	var v = ~(~(a * src2 + (1 - ~(~a)) * src1));
	return v;
};

JkImageutilImageResizer.bilinearInterpolation = function(q11, q21, q12, q22, tx, ty) {
	return JkImageutilImageResizer.li((JkImageutilImageResizer.li(q11, q21, tx)), (JkImageutilImageResizer.li(q12, q22, tx)), ty);
};

JkImageutilImageResizer.resizeBilinear = function(bmpbuf, anw, anh) {
	if(anw == 0 || anh == 0) {
		return null;
	}
	if(anw < 0 && anh < 0) {
		return bmpbuf;
	}
	var src = bmpbuf.getBuffer();
	if(!(src != null)) {
		return null;
	}
	var sz = ~(~JkLangBuffer.getSize(src));
	var ow = bmpbuf.getWidth();
	var oh = bmpbuf.getHeight();
	if(ow == anw && oh == anh) {
		return bmpbuf;
	}
	if(sz != ow * oh * 4) {
		return null;
	}
	var nw = anw;
	var nh = anh;
	var scaler = 1.0;
	if(nw < 0) {
		scaler = nh / oh;
	}
	else if(nh < 0) {
		scaler = nw / ow;
	}
	if(scaler != 1.0) {
		nw = ~(~(ow * scaler));
		nh = ~(~(oh * scaler));
	}
	var dest = new ArrayBuffer(nw * nh * 4);
	if(!(dest != null)) {
		return null;
	}
	var desp = dest;
	var srcp = src;
	var dx = 0;
	var dy = 0;
	var stepx = (ow - ~(~1.0)) / (nw - ~(~1.0));
	var stepy = (oh - ~(~1.0)) / (nh - ~(~1.0));
	for(dy = 0 ; dy < nh ; dy++) {
		for(dx = 0 ; dx < nw ; dx++) {
			var ptx = dx * stepx;
			var pty = dy * stepy;
			var ix = ~(~ptx);
			var iy = ~(~pty);
			var q11i = (iy * ow + ix) * 4;
			var q21i = (iy * ow + (ix + 1)) * 4;
			var q12i = ((iy + 1) * ow + ix) * 4;
			var q22i = ((iy + 1) * ow + (ix + 1)) * 4;
			var rq11 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q11i + 0));
			var gq11 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q11i + 1));
			var bq11 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q11i + 2));
			var aq11 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q11i + 3));
			var rq21 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q21i + 0));
			var gq21 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q21i + 1));
			var bq21 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q21i + 2));
			var aq21 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q21i + 3));
			var rq12 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q12i + 0));
			var gq12 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q12i + 1));
			var bq12 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q12i + 2));
			var aq12 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q12i + 3));
			var rq22 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q22i + 0));
			var gq22 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q22i + 1));
			var bq22 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q22i + 2));
			var aq22 = JkImageutilImageFilterUtil.getSafeByte(srcp, sz, (q22i + 3));
			var resr = ~(~JkImageutilImageResizer.bilinearInterpolation(rq11, rq21, rq12, rq22, (ptx - ix), (pty - iy)));
			var resg = ~(~JkImageutilImageResizer.bilinearInterpolation(gq11, gq21, gq12, gq22, (ptx - ix), (pty - iy)));
			var resb = ~(~JkImageutilImageResizer.bilinearInterpolation(bq11, bq21, bq12, bq22, (ptx - ix), (pty - iy)));
			var resa = ~(~JkImageutilImageResizer.bilinearInterpolation(aq11, aq21, aq12, aq22, (ptx - ix), (pty - iy)));
			JkLangBuffer.setByte(desp, ((dy * nw + dx) * 4 + 0), (~(~resr)));
			JkLangBuffer.setByte(desp, ((dy * nw + dx) * 4 + 1), (~(~resg)));
			JkLangBuffer.setByte(desp, ((dy * nw + dx) * 4 + 2), (~(~resb)));
			JkLangBuffer.setByte(desp, ((dy * nw + dx) * 4 + 3), (~(~resa)));
		}
	}
	return JkImageutilBitmapBuffer.create(dest, nw, nh);
};

JkImageutilImageResizer.untransformCoords = function(m, ix, iy, tu, tv, tw) {
	var x = ix + ~(~0.5);
	var y = iy + ~(~0.5);
	tu[0] = m.v[0] * (x + 0) + m.v[3] * (y + 0) + m.v[6];
	tv[0] = m.v[1] * (x + 0) + m.v[4] * (y + 0) + m.v[7];
	tw[0] = m.v[2] * (x + 0) + m.v[5] * (y + 0) + m.v[8];
	tu[1] = m.v[0] * (x - 1) + m.v[3] * (y + 0) + m.v[6];
	tv[1] = m.v[1] * (x - 1) + m.v[4] * (y + 0) + m.v[7];
	tw[1] = m.v[2] * (x - 1) + m.v[5] * (y + 0) + m.v[8];
	tu[2] = m.v[0] * (x + 0) + m.v[3] * (y - 1) + m.v[6];
	tv[2] = m.v[1] * (x + 0) + m.v[4] * (y - 1) + m.v[7];
	tw[2] = m.v[2] * (x + 0) + m.v[5] * (y - 1) + m.v[8];
	tu[3] = m.v[0] * (x + 1) + m.v[3] * (y + 0) + m.v[6];
	tv[3] = m.v[1] * (x + 1) + m.v[4] * (y + 0) + m.v[7];
	tw[3] = m.v[2] * (x + 1) + m.v[5] * (y + 0) + m.v[8];
	tu[4] = m.v[0] * (x + 0) + m.v[3] * (y + 1) + m.v[6];
	tv[4] = m.v[1] * (x + 0) + m.v[4] * (y + 1) + m.v[7];
	tw[4] = m.v[2] * (x + 0) + m.v[5] * (y + 1) + m.v[8];
};

JkImageutilImageResizer.normalizeCoords = function(count, tu, tv, tw, su, sv) {
	var i = 0;
	for(i = 0 ; i < count ; i++) {
		if(tw[i] != 0.0) {
			su[i] = tu[i] / tw[i] - 0.5;
			sv[i] = tv[i] / tw[i] - 0.5;
		}
		else {
			su[i] = tu[i];
			sv[i] = tv[i];
		}
	}
};

JkImageutilImageResizer.initFixedUnit = function() {
	JkImageutilImageResizer.unit = 1 << JkImageutilImageResizer.FIXED_SHIFT;
};

JkImageutilImageResizer.double2Fixed = function(val) {
	JkImageutilImageResizer.initFixedUnit();
	var v = ~(~(val * JkImageutilImageResizer.unit));
	return v;
};

JkImageutilImageResizer.fixed2Double = function(val) {
	JkImageutilImageResizer.initFixedUnit();
	return val / JkImageutilImageResizer.unit;
};

JkImageutilImageResizer.superSampleDtest = function(x0, y0, x1, y1, x2, y2, x3, y3) {
	return JkMathMath.abs((x0 - x1)) > JkMathMath.M_SQRT2 || JkMathMath.abs((x1 - x2)) > JkMathMath.M_SQRT2 || JkMathMath.abs((x2 - x3)) > JkMathMath.M_SQRT2 || JkMathMath.abs((x3 - x0)) > JkMathMath.M_SQRT2 || JkMathMath.abs((y0 - y1)) > JkMathMath.M_SQRT2 || JkMathMath.abs((y1 - y2)) > JkMathMath.M_SQRT2 || JkMathMath.abs((y2 - y3)) > JkMathMath.M_SQRT2 || JkMathMath.abs((y3 - y0)) > JkMathMath.M_SQRT2;
};

JkImageutilImageResizer.supersampleTest = function(x0, y0, x1, y1, x2, y2, x3, y3) {
	JkImageutilImageResizer.initFixedUnit();
	return JkMathMath.abs((x0 - x1)) > JkImageutilImageResizer.unit || JkMathMath.abs((x1 - x2)) > JkImageutilImageResizer.unit || JkMathMath.abs((x2 - x3)) > JkImageutilImageResizer.unit || JkMathMath.abs((x3 - x0)) > JkImageutilImageResizer.unit || JkMathMath.abs((y0 - y1)) > JkImageutilImageResizer.unit || JkMathMath.abs((y1 - y2)) > JkImageutilImageResizer.unit || JkMathMath.abs((y2 - y3)) > JkImageutilImageResizer.unit || JkMathMath.abs((y3 - y0)) > JkImageutilImageResizer.unit;
};

JkImageutilImageResizer.lerp = function(v1, v2, r) {
	JkImageutilImageResizer.initFixedUnit();
	var v = v1 * (JkImageutilImageResizer.unit - r) + v2 * r >> JkImageutilImageResizer.FIXED_SHIFT;
	return v;
};

JkImageutilImageResizer.sampleBi = function(pixels, x, y, color) {
	JkImageutilImageResizer.initFixedUnit();
	var xscale = x & JkImageutilImageResizer.unit - 1;
	var yscale = y & JkImageutilImageResizer.unit - 1;
	var x0 = x >> JkImageutilImageResizer.FIXED_SHIFT;
	var y0 = y >> JkImageutilImageResizer.FIXED_SHIFT;
	var x1 = x0 + 1;
	var y1 = y0 + 1;
	var i = 0;
	var c0 = pixels.getRgbaPixel(x0, y0, true);
	var c1 = pixels.getRgbaPixel(x1, y0, true);
	var c2 = pixels.getRgbaPixel(x0, y1, true);
	var c3 = pixels.getRgbaPixel(x1, y1, true);
	color[3] = JkImageutilImageResizer.lerp((JkImageutilImageResizer.lerp(c0[3], c1[3], yscale)), (JkImageutilImageResizer.lerp(c2[3], c3[3], yscale)), xscale);
	if(color[3] != 0) {
		for(i = 0 ; i < 3 ; i++) {
			color[i] = JkImageutilImageResizer.lerp((JkImageutilImageResizer.lerp((c0[i] * c0[3] / 255), (c1[i] * c1[3] / 255), yscale)), (JkImageutilImageResizer.lerp((c2[i] * c2[3] / 255), (c3[i] * c3[3] / 255), yscale)), xscale);
		}
	}
	else {
		for(i = 0 ; i < 3 ; i++) {
			color[i] = 0;
		}
	}
};

JkImageutilImageResizer.getSample = function(pixels, xc, yc, x0, y0, x1, y1, x2, y2, x3, y3, cciv, level, color) {
	if(level == 0 || JkImageutilImageResizer.supersampleTest(x0, y0, x1, y1, x2, y2, x3, y3) == false) {
		var i = 0;
		var c = [];
		JkImageutilImageResizer.sampleBi(pixels, xc, yc, c);
		for(i = 0 ; i < 4 ; i++) {
			color[i] = color[i] + c[i];
		}
	}
	else {
		var tx = 0;
		var lx = 0;
		var rx = 0;
		var bx = 0;
		var tlx = 0;
		var trx = 0;
		var blx = 0;
		var brx = 0;
		var ty = 0;
		var ly = 0;
		var ry = 0;
		var by = 0;
		var tly = 0;
		var trz = 0;
		var bly = 0;
		var bry = 0;
		tx = (x0 + x1) / 2;
		tlx = (x0 + xc) / 2;
		trx = (x1 + xc) / 2;
		lx = (x0 + x3) / 2;
		rx = (x1 + x2) / 2;
		blx = (x2 + xc) / 2;
		brx = (x3 + xc) / 2;
		bx = (x3 + x2) / 2;
		ty = (y0 + y1) / 2;
		tly = (y0 + yc) / 2;
		trz = (y1 + yc) / 2;
		ly = (y0 + y3) / 2;
		ry = (y1 + y2) / 2;
		bly = (y3 + yc) / 2;
		bry = (y2 + yc) / 2;
		by = (y3 + y2) / 2;
		JkImageutilImageResizer.getSample(pixels, tlx, tly, x0, y0, tx, ty, xc, yc, lx, ly, cciv, (level - 1), color);
		JkImageutilImageResizer.getSample(pixels, trx, trz, tx, ty, x1, y1, rx, ry, xc, yc, cciv, (level - 1), color);
		JkImageutilImageResizer.getSample(pixels, brx, bry, xc, yc, rx, ry, x2, y2, bx, by, cciv, (level - 1), color);
		JkImageutilImageResizer.getSample(pixels, blx, bly, lx, ly, xc, yc, bx, by, x3, y3, cciv, (level - 1), color);
	}
};

JkImageutilImageResizer.sampleAdapt = function(src, xc, yc, x0, y0, x1, y1, x2, y2, x3, y3, dest) {
	var cc = 0;
	var i = 0;
	var c = [];
	var cciv = 0;
	JkImageutilImageResizer.getSample(src, (JkImageutilImageResizer.double2Fixed(xc)), (JkImageutilImageResizer.double2Fixed(yc)), (JkImageutilImageResizer.double2Fixed(x0)), (JkImageutilImageResizer.double2Fixed(y0)), (JkImageutilImageResizer.double2Fixed(x1)), (JkImageutilImageResizer.double2Fixed(y1)), (JkImageutilImageResizer.double2Fixed(x2)), (JkImageutilImageResizer.double2Fixed(y2)), (JkImageutilImageResizer.double2Fixed(x3)), (JkImageutilImageResizer.double2Fixed(y3)), cciv, 3, c);
	cc = cciv;
	if(cc == 0) {
		cc = 1;
	}
	var aa = c[3] / cc;
	JkLangBuffer.setByte((dest.getBuf()), 3, (~(~aa)));
	if(aa != 0) {
		for(i = 0 ; i < 3 ; i++) {
			JkLangBuffer.setByte((dest.getBuf()), i, (~(~(c[i] / cc * 255 / aa))));
		}
	}
	else {
		for(i = 0 ; i < 3 ; i++) {
			JkLangBuffer.setByte((dest.getBuf()), i, (~(~0)));
		}
	}
};

JkImageutilImageResizer.drawableTransformCubic = function(x, jm1, j, jp1, jp2) {
	return j + 0.5 * x * (jp1 - jm1 + x * (2.0 * jm1 - 5.0 * j + 4.0 * jp1 - jp2 + x * (3.0 * (j - jp1) + jp2 - jm1)));
};

JkImageutilImageResizer.cubicRow = function(dx, row) {
	return ~(~JkImageutilImageResizer.drawableTransformCubic(dx, (JkLangBuffer.getByte((row.getBuf()), 0)), (JkLangBuffer.getByte((row.getBuf()), 4)), (JkLangBuffer.getByte((row.getBuf()), 8)), (JkLangBuffer.getByte((row.getBuf()), 12))));
};

JkImageutilImageResizer.cubicScaledRow = function(dx, row, arow) {
	return ~(~JkImageutilImageResizer.drawableTransformCubic(dx, (JkLangBuffer.getByte((row.getBuf()), 0) * JkLangBuffer.getByte((arow.getBuf()), 0)), (JkLangBuffer.getByte((row.getBuf()), 4) * JkLangBuffer.getByte((arow.getBuf()), 4)), (JkLangBuffer.getByte((row.getBuf()), 8) * JkLangBuffer.getByte((arow.getBuf()), 8)), (JkLangBuffer.getByte((row.getBuf()), 12) * JkLangBuffer.getByte((arow.getBuf()), 12))));
};

JkImageutilImageResizer.sampleCubic = function(src, su, sv, dest) {
	var aval = 0.0;
	var arecip = 0.0;
	var i = 0;
	var iu = ~(~JkMathMath.floor(su));
	var iv = ~(~JkMathMath.floor(sv));
	var stride = src.getStride();
	var du = 0.0;
	var dv = 0.0;
	var br = src.getBufferRegion((iu - 1), (iv - 1), false);
	if(!(br != null)) {
		return;
	}
	dest.setBuf(br);
	du = su - iu;
	dv = sv - iv;
	aval = JkImageutilImageResizer.drawableTransformCubic(dv, (JkImageutilImageResizer.cubicRow(du, (dest.move((3 + stride * 0))))), (JkImageutilImageResizer.cubicRow(du, (dest.move((3 + stride * 1))))), (JkImageutilImageResizer.cubicRow(du, (dest.move((3 + stride * 2))))), (JkImageutilImageResizer.cubicRow(du, (dest.move((3 + stride * 3))))));
	if(aval <= 0) {
		arecip = 0.0;
		JkLangBuffer.setByte((dest.getBuf()), 3, (~(~0)));
	}
	else if(aval > 255.0) {
		arecip = 1.0 / aval;
		JkLangBuffer.setByte((dest.getBuf()), 3, (~(~255)));
	}
	else {
		arecip = 1.0 / aval;
		JkLangBuffer.setByte((dest.getBuf()), 3, (~(~JkMathMath.round(aval))));
	}
	for(i = 0 ; i < 3 ; i++) {
		var v = ~(~JkMathMath.round((arecip * JkImageutilImageResizer.drawableTransformCubic(dv, (JkImageutilImageResizer.cubicScaledRow(du, (dest.move((i + stride * 0))), (dest.move((3 + stride * 0))))), (JkImageutilImageResizer.cubicScaledRow(du, (dest.move((i + stride * 1))), (dest.move((3 + stride * 1))))), (JkImageutilImageResizer.cubicScaledRow(du, (dest.move((i + stride * 2))), (dest.move((3 + stride * 2))))), (JkImageutilImageResizer.cubicScaledRow(du, (dest.move((i + stride * 3))), (dest.move((3 + stride * 3)))))))));
		JkLangBuffer.setByte((dest.getBuf()), i, (~(~JkImageutilImageFilterUtil.clamp(v))));
	}
};

JkImageutilImageResizer.resizeBicubic = function(bb, anw, anh) {
	if(anw == 0 || anh == 0) {
		return null;
	}
	if(anw < 0 && anh < 0) {
		return bb;
	}
	var sb = bb.getBuffer();
	if(!(sb != null)) {
		return null;
	}
	var w = bb.getWidth();
	var h = bb.getHeight();
	var scaler = 1.0;
	var nw = anw;
	var nh = anh;
	if(nw < 0) {
		scaler = nh / h;
	}
	else if(nh < 0) {
		scaler = nw / w;
	}
	if(scaler != 1.0) {
		nw = ~(~(w * scaler));
		nh = ~(~(h * scaler));
	}
	var v = new ArrayBuffer(nw * nh * 4);
	var destp = null;
	destp.setBuf(v);
	var y = 0;
	var sx = nw / w;
	var sy = nh / h;
	var matrix = JkMathMatrix33.forScale(sx, sy);
	matrix = JkMathMatrix33.invertMatrix(matrix);
	var uinc = matrix.v[0];
	var vinc = matrix.v[1];
	var winc = matrix.v[2];
	var pixels = JkImageutilRGBAPixelIntegerBuffer.create(sb, w, h);
	var pixrgn = JkImageutilPixelRegionBuffer.forRgbaPixels(pixels, 4, 4);
	var tu = [];
	var tv = [];
	var tw = [];
	var su = [];
	var sv = [];
	for(y = 0 ; y < nh ; y++) {
		JkImageutilImageResizer.untransformCoords(matrix, 0, y, tu, tv, tw);
		var width = nw;
		while(width-- > 0){
			var i = 0;
			JkImageutilImageResizer.normalizeCoords(5, tu, tv, tw, su, sv);
			if(JkImageutilImageResizer.superSampleDtest(su[1], sv[1], su[2], sv[2], su[3], sv[3], su[4], sv[4])) {
				JkImageutilImageResizer.sampleAdapt(pixels, su[0], sv[0], su[1], sv[1], su[2], sv[2], su[3], sv[3], su[4], sv[4], destp);
			}
			else {
				JkImageutilImageResizer.sampleCubic(pixrgn, su[0], sv[0], destp);
			}
			destp = destp.move(4);
			for(i = 0 ; i < 5 ; i++) {
				tu[i] = tu[i] + uinc;
				tv[i] = tv[i] + vinc;
				tw[i] = tw[i] + winc;
			}
		}
	}
	return JkImageutilBitmapBuffer.create(v, nw, nh);
};

JkImageutilImageResizer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkImageutilImageResizer"] === true;
};

JkImageutilImageResizer.FIXED_SHIFT = 10;
JkImageutilImageResizer.unit = 0;

let JkImageutilBitmapBuffer = function() {
	this.buffer = null;
	this.width = 0;
	this.height = 0;
};

JkImageutilBitmapBuffer.prototype._t = { "JkImageutilBitmapBuffer" : true };
JkImageutilBitmapBuffer.prototype._tobj = JkImageutilBitmapBuffer;

JkImageutilBitmapBuffer.NEW = function() {
	var v = new JkImageutilBitmapBuffer;
	return v.CTOR_JkImageutilBitmapBuffer();
};

JkImageutilBitmapBuffer.prototype.CTOR_JkImageutilBitmapBuffer = function() {
	this.height = 0;
	this.width = 0;
	this.buffer = null;
	return this;
};

JkImageutilBitmapBuffer.create = function(b, w, h) {
	if(b == null || JkLangBuffer.getSize(b) < 4 || w < 1 || h < 1) {
		return null;
	}
	return JkImageutilBitmapBuffer.NEW().setBuffer(b).setWidth(w).setHeight(h);
};

JkImageutilBitmapBuffer.prototype.getBuffer = function() {
	return this.buffer;
};

JkImageutilBitmapBuffer.prototype.setBuffer = function(v) {
	this.buffer = v;
	return this;
};

JkImageutilBitmapBuffer.prototype.getWidth = function() {
	return this.width;
};

JkImageutilBitmapBuffer.prototype.setWidth = function(v) {
	this.width = v;
	return this;
};

JkImageutilBitmapBuffer.prototype.getHeight = function() {
	return this.height;
};

JkImageutilBitmapBuffer.prototype.setHeight = function(v) {
	this.height = v;
	return this;
};

JkImageutilBitmapBuffer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkImageutilBitmapBuffer"] === true;
};

let JkImageutilImageFilter = function() {};

JkImageutilImageFilter.prototype._t = { "JkImageutilImageFilter" : true };
JkImageutilImageFilter.prototype._tobj = JkImageutilImageFilter;

JkImageutilImageFilter.NEW = function() {
	var v = new JkImageutilImageFilter;
	return v.CTOR_JkImageutilImageFilter();
};

JkImageutilImageFilter.prototype.CTOR_JkImageutilImageFilter = function() {
	return this;
};

JkImageutilImageFilter.resizeImage = function(bmpbuf, nw, nh, type) {
	if(!(bmpbuf != null)) {
		return null;
	}
	if(type == JkImageutilImageFilter.RESIZE_TYPE_BICUBIC) {
		return JkImageutilImageResizer.resizeBicubic(bmpbuf, nw, nh);
	}
	return JkImageutilImageResizer.resizeBilinear(bmpbuf, nw, nh);
};

JkImageutilImageFilter.filterGreyscale = function(bmpbuf) {
	if(!(bmpbuf != null)) {
		return null;
	}
	return JkImageutilGreyscaleImage.createGreyscale(bmpbuf, 1.0, 1.0, 1.0, 1.0);
};

JkImageutilImageFilter.filterRedSepia = function(bmpbuf) {
	if(!(bmpbuf != null)) {
		return null;
	}
	return JkImageutilGreyscaleImage.createRedSepia(bmpbuf);
};

JkImageutilImageFilter.filterBlur = function(bmpbuf) {
	if(!(bmpbuf != null)) {
		return null;
	}
	var array = [0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 0.0, 1.0, 1.0, 1.0, 1.0, 1.0, 0.0, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0];
	return JkImageutilImageFilterUtil.createForArrayFilter(bmpbuf, array, 5, 5, (1.0 / 13.0), 1.0);
};

JkImageutilImageFilter.filterSharpen = function(bmpbuf) {
	if(!(bmpbuf != null)) {
		return null;
	}
	var array = [-1.0, -1.0, -1.0, -1.0, 9.0, -1.0, -1.0, -1.0, -1.0];
	return JkImageutilImageFilterUtil.createForArrayFilter(bmpbuf, array, 3, 3, 1.0, 1.0);
};

JkImageutilImageFilter.filterEmboss = function(bmpbuf) {
	if(!(bmpbuf != null)) {
		return null;
	}
	var array = [-2.0, -1.0, 0.0, -1.0, 1.0, 1.0, 0.0, 1.0, 2.0];
	return JkImageutilImageFilterUtil.createForArrayFilter(bmpbuf, array, 3, 3, 2.0, 0.0);
};

JkImageutilImageFilter.filterMotionBlur = function(bmpbuf) {
	if(!(bmpbuf != null)) {
		return null;
	}
	var array = [1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0];
	return JkImageutilImageFilterUtil.createForArrayFilter(bmpbuf, array, 9, 9, (1.0 / 9.0), 1.0);
};

JkImageutilImageFilter.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkImageutilImageFilter"] === true;
};

JkImageutilImageFilter.RESIZE_TYPE_BILINEAR = 0;
JkImageutilImageFilter.RESIZE_TYPE_BICUBIC = 1;

let JkImageutilPixelRegionBuffer = function() {
	this.src = null;
	this.rangew = 0;
	this.rangeh = 0;
	this.cache = null;
};

JkImageutilPixelRegionBuffer.prototype._t = { "JkImageutilPixelRegionBuffer" : true };
JkImageutilPixelRegionBuffer.prototype._tobj = JkImageutilPixelRegionBuffer;

JkImageutilPixelRegionBuffer.NEW = function() {
	var v = new JkImageutilPixelRegionBuffer;
	return v.CTOR_JkImageutilPixelRegionBuffer();
};

JkImageutilPixelRegionBuffer.prototype.CTOR_JkImageutilPixelRegionBuffer = function() {
	this.cache = null;
	this.rangeh = 0;
	this.rangew = 0;
	this.src = null;
	return this;
};

JkImageutilPixelRegionBuffer.forRgbaPixels = function(src, w, h) {
	var v = JkImageutilPixelRegionBuffer.NEW();
	v.src = src;
	v.rangew = w;
	v.rangeh = h;
	return v;
};

JkImageutilPixelRegionBuffer.prototype.getStride = function() {
	return this.rangew * 4;
};

JkImageutilPixelRegionBuffer.prototype.getBufferRegion = function(x, y, newbuffer) {
	if(this.cache == null && newbuffer == false) {
		this.cache = new ArrayBuffer(this.rangew * this.rangeh * 4);
	}
	var v = this.cache;
	if(newbuffer) {
		v = new ArrayBuffer(this.rangew * this.rangeh * 4);
	}
	var p = v;
	if(!(p != null)) {
		return null;
	}
	var i = 0;
	var j = 0;
	for(i = 0 ; i < this.rangeh ; i++) {
		for(j = 0 ; j < this.rangew ; j++) {
			var pix = this.src.getRgbaPixel((x + j), (y + i), false);
			JkLangBuffer.setByte(p, ((i * this.rangew + j) * 4 + 0), (~(~pix[0])));
			JkLangBuffer.setByte(p, ((i * this.rangew + j) * 4 + 1), (~(~pix[1])));
			JkLangBuffer.setByte(p, ((i * this.rangew + j) * 4 + 2), (~(~pix[2])));
			JkLangBuffer.setByte(p, ((i * this.rangew + j) * 4 + 3), (~(~pix[3])));
		}
	}
	return v;
};

JkImageutilPixelRegionBuffer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkImageutilPixelRegionBuffer"] === true;
};

let JkImageutilPNGEncoder = function() {};

JkImageutilPNGEncoder.prototype._t = { "JkImageutilPNGEncoder" : true };
JkImageutilPNGEncoder.prototype._tobj = JkImageutilPNGEncoder;

JkImageutilPNGEncoder.NEW = function() {
	var v = new JkImageutilPNGEncoder;
	return v.CTOR_JkImageutilPNGEncoder();
};

JkImageutilPNGEncoder.prototype.CTOR_JkImageutilPNGEncoder = function() {
	return this;
};

JkImageutilPNGEncoder.encode = function(data, width, height) {
	if(!(data.byteLength > 0)) {
		return null;
	}
	var buffer = null;
	return buffer;
};

JkImageutilPNGEncoder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkImageutilPNGEncoder"] === true;
};

let JkImageutilRGBAPixelIntegerBuffer = function() {
	this.buffer = null;
	this.pointer = null;
	this.width = 0;
	this.height = 0;
	this.cache = null;
};

JkImageutilRGBAPixelIntegerBuffer.prototype._t = { "JkImageutilRGBAPixelIntegerBuffer" : true };
JkImageutilRGBAPixelIntegerBuffer.prototype._tobj = JkImageutilRGBAPixelIntegerBuffer;

JkImageutilRGBAPixelIntegerBuffer.NEW = function() {
	var v = new JkImageutilRGBAPixelIntegerBuffer;
	return v.CTOR_JkImageutilRGBAPixelIntegerBuffer();
};

JkImageutilRGBAPixelIntegerBuffer.prototype.CTOR_JkImageutilRGBAPixelIntegerBuffer = function() {
	this.cache = null;
	this.height = 0;
	this.width = 0;
	this.pointer = null;
	this.buffer = null;
	return this;
};

JkImageutilRGBAPixelIntegerBuffer.create = function(b, w, h) {
	var v = JkImageutilRGBAPixelIntegerBuffer.NEW();
	v.buffer = b;
	v.width = w;
	v.height = h;
	v.pointer = b;
	return v;
};

JkImageutilRGBAPixelIntegerBuffer.prototype.getWidth = function() {
	return this.width;
};

JkImageutilRGBAPixelIntegerBuffer.prototype.getHeight = function() {
	return this.height;
};

JkImageutilRGBAPixelIntegerBuffer.prototype.getRgbaPixel = function(x, y, newbuffer) {
	if(this.cache == null && newbuffer == false) {
		this.cache = [];
	}
	var v = this.cache;
	if(newbuffer) {
		v = [];
	}
	var i = 0;
	if(x < 0 || x >= this.width || y < 0 || y >= this.height) {
		return v;
	}
	for(i = 0 ; i < 4 ; i++) {
		v[i] = JkLangBuffer.getByte(this.pointer, ((y * this.width + x) * 4 + i));
	}
	return v;
};

JkImageutilRGBAPixelIntegerBuffer.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkImageutilRGBAPixelIntegerBuffer"] === true;
};

let JkImageutilICOImageReaderIconDirEntry = function() {
	this.width = 0;
	this.height = 0;
	this.colors = 0;
	this.colorPlanes = 0;
	this.bitsPerPixel = 0;
	this.size = 0;
	this.offset = 0;
};

JkImageutilICOImageReaderIconDirEntry.prototype._t = { "JkImageutilICOImageReaderIconDirEntry" : true };
JkImageutilICOImageReaderIconDirEntry.prototype._tobj = JkImageutilICOImageReaderIconDirEntry;

JkImageutilICOImageReaderIconDirEntry.NEW = function() {
	var v = new JkImageutilICOImageReaderIconDirEntry;
	return v.CTOR_JkImageutilICOImageReaderIconDirEntry();
};

JkImageutilICOImageReaderIconDirEntry.prototype.CTOR_JkImageutilICOImageReaderIconDirEntry = function() {
	this.offset = 0;
	this.size = 0;
	this.bitsPerPixel = 0;
	this.colorPlanes = 0;
	this.colors = 0;
	this.height = 0;
	this.width = 0;
	return this;
};

JkImageutilICOImageReaderIconDirEntry.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkImageutilICOImageReaderIconDirEntry"] === true;
};

let JkImageutilICOImageReader = function() {};

JkImageutilICOImageReader.prototype._t = { "JkImageutilICOImageReader" : true };
JkImageutilICOImageReader.prototype._tobj = JkImageutilICOImageReader;

JkImageutilICOImageReader.NEW = function() {
	var v = new JkImageutilICOImageReader;
	return v.CTOR_JkImageutilICOImageReader();
};

JkImageutilICOImageReader.prototype.CTOR_JkImageutilICOImageReader = function() {
	return this;
};

JkImageutilICOImageReader.readFile = function(file) {
	if(!(file != null)) {
		return null;
	}
	if(!file.hasExtension("ico")) {
		return null;
	}
	return JkImageutilICOImageReader.readBuffer((file.getContentsBuffer()));
};

JkImageutilICOImageReader.readBuffer = function(buffer) {
	var data = buffer;
	var size = data.byteLength;
	if(!(size > 6)) {
		return null;
	}
	var res1 = ~(~(data[1] << 8 | data[0]));
	if(!(res1 == 0)) {
		return null;
	}
	var type = ~(~(data[3] << 8 | data[2]));
	if(!(type == 1 || type == 2)) {
		return null;
	}
	var inum = ~(~(data[5] << 8 | data[4]));
	if(!(size > 6 + inum * 16)) {
		return null;
	}
	var n = 0;
	var c = 6;
	var entries = null;
	while(true){
		if(n >= inum) {
			break;
		}
		var iw = ~(~data[c + 0]);
		var ih = ~(~data[c + 1]);
		var cc = ~(~data[c + 2]);
		var rs = ~(~data[c + 3]);
		var cp = ~(~(data[c + 5] << 8 | data[c + 4]));
		var bp = ~(~(data[c + 7] << 8 | data[c + 6]));
		var sz = ~(~(data[c + 11] << 24 | data[c + 10] << 16 | data[c + 9] << 8 | data[c + 8]));
		var of = ~(~(data[c + 15] << 24 | data[c + 14] << 16 | data[c + 13] << 8 | data[c + 12]));
		c += 16;
		n++;
		if(rs != 0) {
			continue;
		}
		var ee = JkImageutilICOImageReaderIconDirEntry.NEW();
		ee.width = iw;
		ee.height = ih;
		ee.colors = cc;
		ee.colorPlanes = cp;
		ee.bitsPerPixel = bp;
		ee.size = sz;
		ee.offset = of;
		var buf = JkImageutilICOImageReader.processEntry(ee, data);
		if(buf != null) {
			if(!(entries != null)) {
				entries = new Array;
			}
			var ib = JkImageutilRGBAImageBuffer.NEW();
			ib.setBuffer(buf);
			ib.setWidth(iw);
			ib.setHeight(ih);
			entries.push(ib);
		}
	}
	return entries;
};

JkImageutilICOImageReader.processEntry = function(entry, buffer) {
	var size = entry.size;
	var data = new ArrayBuffer(size);
	JkLangBuffer.copyFrom(data, buffer, entry.offset, 0, size);
	if(!(size > 40)) {
		return null;
	}
	var c = 0;
	var hs = ~(~(data[c + 3] << 24 | data[c + 2] << 16 | data[c + 1] << 8 | data[c + 0]));
	var hw = ~(~(data[c + 7] << 24 | data[c + 6] << 16 | data[c + 5] << 8 | data[c + 4]));
	var hh = ~(~(data[c + 11] << 24 | data[c + 10] << 16 | data[c + 9] << 8 | data[c + 8]));
	var hp = ~(~(data[c + 13] << 8 | data[c + 12]));
	var hc = ~(~(data[c + 19] << 24 | data[c + 18] << 16 | data[c + 17] << 8 | data[c + 16]));
	var hi = ~(~(data[c + 23] << 24 | data[c + 22] << 16 | data[c + 21] << 8 | data[c + 20]));
	var hx = ~(~(data[c + 27] << 24 | data[c + 26] << 16 | data[c + 25] << 8 | data[c + 24]));
	var hy = ~(~(data[c + 31] << 24 | data[c + 30] << 16 | data[c + 29] << 8 | data[c + 28]));
	var hu = ~(~(data[c + 35] << 24 | data[c + 34] << 16 | data[c + 33] << 8 | data[c + 32]));
	var hm = ~(~(data[c + 39] << 24 | data[c + 38] << 16 | data[c + 37] << 8 | data[c + 36]));
	var hb = ~(~(data[c + 15] << 8 | data[c + 14]));
	c += 40;
	var srcs = size - c;
	var isrc = new ArrayBuffer(srcs);
	JkLangBuffer.copyFrom(isrc, data, c, 0, srcs);
	var width = ~(~entry.width);
	var height = ~(~entry.height);
	var xorMask = JkImageutilICOImageReader.getXorMask(isrc, width, height, hb);
	if(!(xorMask != null)) {
		return null;
	}
	var andMask = JkImageutilICOImageReader.getAndMask(isrc, width, height);
	var ides = new ArrayBuffer(width * height * 4);
	for(var y = 0 ; y < height ; y++) {
		for(var x = 0 ; x < width ; x++) {
			var z = (x + y * width) * 4;
			var w = (x + (height - y - 1) * width) * 4;
			JkLangBuffer.setByte(ides, (w + 0), (JkLangBuffer.getByte(xorMask, (z + 0))));
			JkLangBuffer.setByte(ides, (w + 1), (JkLangBuffer.getByte(xorMask, (z + 1))));
			JkLangBuffer.setByte(ides, (w + 2), (JkLangBuffer.getByte(xorMask, (z + 2))));
			if(andMask != null) {
				var a = x + y * width;
				JkLangBuffer.setByte(ides, (w + 3), (JkLangBuffer.getByte(andMask, a)));
			}
		}
	}
	return ides;
};

JkImageutilICOImageReader.getAndMask = function(data, width, height) {
	var sz = data.byteLength;
	var iw = width;
	var ih = height;
	var pd = JkImageutilICOImageReader.getPadding((iw / 8));
	var of = sz - (iw / 8 + pd) * ih;
	var bf = 0x80;
	var bs = 0;
	var cc = 0;
	var am = new ArrayBuffer(iw * ih);
	for(var y = 0 ; y < ih ; y++) {
		for(var x = 0 ; x < iw ; x++) {
			if(bs > 7) {
				bs = 0;
				of++;
			}
			var cb = ~(~data[of]);
			var mm = bf >> bs;
			var vv = ~(~(cb & mm));
			var bm = vv != 0x0 ? 0x0 : 0xff;
			JkLangBuffer.setByte(am, cc, bm);
			bs++;
			cc++;
		}
		of += pd;
	}
	return am;
};

JkImageutilICOImageReader.getXorMask = function(data, width, height, colorDepth) {
	if(!(data != null)) {
		return null;
	}
	var cd = colorDepth;
	var iw = width;
	var ih = height;
	var xm = new ArrayBuffer(iw * ih * 4);
	var pd = JkImageutilICOImageReader.getPadding(iw);
	var of = 0;
	if(cd == 24 || cd == 32) {
		var io = 0;
		for(var y = 0 ; y < ih ; y++) {
			for(var x = 0 ; x < iw ; x++) {
				JkLangBuffer.setByte(xm, (of++), (~(~data[io++])));
				JkLangBuffer.setByte(xm, (of++), (~(~data[io++])));
				JkLangBuffer.setByte(xm, (of++), (~(~data[io++])));
				if(cd == 32) {
					io++;
				}
				of++;
			}
			io += pd;
		}
	}
	else if(cd == 8) {
		var io1 = ~(~(JkMathMath.pow(2.0, (cd * 1.0)) * 4));
		for(var y1 = 0 ; y1 < ih ; y1++) {
			for(var x1 = 0 ; x1 < iw ; x1++) {
				var iy = ~(~data[io1]);
				var ix = ~(~(iy * 4));
				JkLangBuffer.setByte(xm, (of++), (~(~data[ix + 0])));
				JkLangBuffer.setByte(xm, (of++), (~(~data[ix + 1])));
				JkLangBuffer.setByte(xm, (of++), (~(~data[ix + 2])));
				of++;
				io1++;
			}
			io1 += pd;
		}
	}
	else {
		return null;
	}
	return xm;
};

JkImageutilICOImageReader.getPadding = function(width) {
	return ~(~JkMathMath.abs((4 - width))) % ~(~4);
};

JkImageutilICOImageReader.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkImageutilICOImageReader"] === true;
};

let JkImageutilImageFilterUtil = function() {};

JkImageutilImageFilterUtil.prototype._t = { "JkImageutilImageFilterUtil" : true };
JkImageutilImageFilterUtil.prototype._tobj = JkImageutilImageFilterUtil;

JkImageutilImageFilterUtil.NEW = function() {
	var v = new JkImageutilImageFilterUtil;
	return v.CTOR_JkImageutilImageFilterUtil();
};

JkImageutilImageFilterUtil.prototype.CTOR_JkImageutilImageFilterUtil = function() {
	return this;
};

JkImageutilImageFilterUtil.clamp = function(v) {
	if(v > 255) {
		return 255;
	}
	if(v < 0) {
		return 0;
	}
	return ~(~v);
};

JkImageutilImageFilterUtil.getSafeByte = function(p, sz, idx) {
	var i = idx;
	if(i >= sz) {
		i = sz - 1;
	}
	else if(i < 0) {
		i = 0;
	}
	return JkLangBuffer.getByte(p, i);
};

JkImageutilImageFilterUtil.createForArrayFilter = function(bmpbuf, filterArray, fw, fh, factor, bias) {
	var srcbuf = bmpbuf.getBuffer();
	var w = bmpbuf.getWidth();
	var h = bmpbuf.getHeight();
	if(w < 1 || h < 1) {
		return null;
	}
	var desbuf = new ArrayBuffer(w * h * 4);
	var x = 0;
	var y = 0;
	var srcptr = srcbuf;
	var desptr = desbuf;
	var sz = ~(~JkLangBuffer.getSize(srcbuf));
	for(x = 0 ; x < w ; x++) {
		for(y = 0 ; y < h ; y++) {
			var sr = 0.0;
			var sg = 0.0;
			var sb = 0.0;
			var sa = 0.0;
			var fx = 0;
			var fy = 0;
			for(fy = 0 ; fy < fh ; fy++) {
				for(fx = 0 ; fx < fw ; fx++) {
					var ix = x - fw / 2 + fx;
					var iy = y - fh / 2 + fy;
					sr += JkImageutilImageFilterUtil.getSafeByte(srcptr, sz, ((iy * w + ix) * 4 + 0)) * filterArray[fy * fw + fx];
					sg += JkImageutilImageFilterUtil.getSafeByte(srcptr, sz, ((iy * w + ix) * 4 + 1)) * filterArray[fy * fw + fx];
					sb += JkImageutilImageFilterUtil.getSafeByte(srcptr, sz, ((iy * w + ix) * 4 + 2)) * filterArray[fy * fw + fx];
					sa += JkImageutilImageFilterUtil.getSafeByte(srcptr, sz, ((iy * w + ix) * 4 + 3)) * filterArray[fy * fw + fx];
				}
			}
			JkLangBuffer.setByte(desptr, ((y * w + x) * 4 + 0), (~(~JkImageutilImageFilterUtil.clamp((factor * sr + bias)))));
			JkLangBuffer.setByte(desptr, ((y * w + x) * 4 + 1), (~(~JkImageutilImageFilterUtil.clamp((factor * sg + bias)))));
			JkLangBuffer.setByte(desptr, ((y * w + x) * 4 + 2), (~(~JkImageutilImageFilterUtil.clamp((factor * sb + bias)))));
			JkLangBuffer.setByte(desptr, ((y * w + x) * 4 + 3), (~(~JkImageutilImageFilterUtil.clamp((factor * sa + bias)))));
		}
	}
	return JkImageutilBitmapBuffer.create(desbuf, w, h);
};

JkImageutilImageFilterUtil.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkImageutilImageFilterUtil"] === true;
};

let JkImageutilGreyscaleImage = function() {};

JkImageutilGreyscaleImage.prototype._t = { "JkImageutilGreyscaleImage" : true };
JkImageutilGreyscaleImage.prototype._tobj = JkImageutilGreyscaleImage;

JkImageutilGreyscaleImage.NEW = function() {
	var v = new JkImageutilGreyscaleImage;
	return v.CTOR_JkImageutilGreyscaleImage();
};

JkImageutilGreyscaleImage.prototype.CTOR_JkImageutilGreyscaleImage = function() {
	return this;
};

JkImageutilGreyscaleImage.createGreyscale = function(bmpbuf, rf, gf, bf, af) {
	var w = bmpbuf.getWidth();
	var h = bmpbuf.getHeight();
	var srcbuf = bmpbuf.getBuffer();
	if(srcbuf == null || w < 1 || h < 1) {
		return null;
	}
	var desbuf = new ArrayBuffer(w * h * 4);
	if(!(desbuf != null)) {
		return null;
	}
	var ss = ~(~JkLangBuffer.getSize(srcbuf));
	var srcptr = srcbuf;
	var desptr = desbuf;
	var x = 0;
	var y = 0;
	for(y = 0 ; y < h ; y++) {
		for(x = 0 ; x < w ; x++) {
			var sr = JkImageutilImageFilterUtil.getSafeByte(srcptr, ss, ((y * w + x) * 4 + 0)) * 0.2126;
			var sg = JkImageutilImageFilterUtil.getSafeByte(srcptr, ss, ((y * w + x) * 4 + 1)) * 0.7152;
			var sb = JkImageutilImageFilterUtil.getSafeByte(srcptr, ss, ((y * w + x) * 4 + 2)) * 0.0722;
			var sa = JkImageutilImageFilterUtil.getSafeByte(srcptr, ss, ((y * w + x) * 4 + 3));
			var sbnw = ~(~(sr + sg + sb));
			JkLangBuffer.setByte(desptr, ((y * w + x) * 4 + 0), (~(~JkImageutilImageFilterUtil.clamp((sbnw * rf)))));
			JkLangBuffer.setByte(desptr, ((y * w + x) * 4 + 1), (~(~JkImageutilImageFilterUtil.clamp((sbnw * gf)))));
			JkLangBuffer.setByte(desptr, ((y * w + x) * 4 + 2), (~(~JkImageutilImageFilterUtil.clamp((sbnw * bf)))));
			JkLangBuffer.setByte(desptr, ((y * w + x) * 4 + 3), (~(~JkImageutilImageFilterUtil.clamp((sa * af)))));
		}
	}
	return JkImageutilBitmapBuffer.create(desbuf, w, h);
};

JkImageutilGreyscaleImage.createRedSepia = function(imgbuf) {
	return JkImageutilGreyscaleImage.createGreyscale(imgbuf, (110.0 / 255.0 + 1.0), (66.0 / 255.0 + 1.0), (20.0 / 255.0 + 1.0), 1.0);
};

JkImageutilGreyscaleImage.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkImageutilGreyscaleImage"] === true;
};
