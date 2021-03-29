let JkMathMath = function() {};

JkMathMath.prototype._t = { "JkMathMath" : true };
JkMathMath.prototype._tobj = JkMathMath;

JkMathMath.NEW = function() {
	var v = new JkMathMath;
	return v.CTOR_JkMathMath();
};

JkMathMath.prototype.CTOR_JkMathMath = function() {
	return this;
};

JkMathMath.toRadians = function(d) {
	return JkMathMath.M_PI / 180 * d;
};

JkMathMath.toDegrees = function(r) {
	return JkMathMath.M_PI * r / 180;
};

JkMathMath.abs = function(d) {
	return Math.abs(d);
};

JkMathMath.absFloat = function(f) {
	return Math.abs(f);
};

JkMathMath.absInt32 = function(i) {
	return Math.abs(i);
};

JkMathMath.absInt64 = function(l) {
	return Math.abs(l);
};

JkMathMath.acos = function(d) {
	return Math.acos(d);
};

JkMathMath.asin = function(d) {
	return Math.asin(d);
};

JkMathMath.atan = function(d) {
	return Math.atan(d);
};

JkMathMath.atan2 = function(y, x) {
	return Math.atan2(y,x);
};

JkMathMath.ceil = function(d) {
	return Math.ceil(d);
};

JkMathMath.cos = function(d) {
	return Math.cos(d);
};

JkMathMath.cosh = function(d) {
	return Math.cosh(d);
};

JkMathMath.exp = function(d) {
	return Math.exp(d);
};

JkMathMath.floor = function(d) {
	return Math.floor(d);
};

JkMathMath.remainder = function(x, y) {
	var z = 0.0;
	z = x % y;
	return z;
};

JkMathMath.log = function(d) {
	return Math.log(d);
};

JkMathMath.log10 = function(d) {
	return Math.log10(d);
};

JkMathMath.max = function(d1, d2) {
	return Math.max(d1,d2);
};

JkMathMath.maxFloat = function(f1, f2) {
	return Math.max(f1,f2);
};

JkMathMath.maxInt32 = function(i1, i2) {
	return Math.max(i1,i2);
};

JkMathMath.maxInt64 = function(l1, l2) {
	return Math.max(l1,l2);
};

JkMathMath.min = function(d1, d2) {
	return Math.min(d1,d2);
};

JkMathMath.minFloat = function(f1, f2) {
	return Math.min(f1,f2);
};

JkMathMath.minInt32 = function(i1, i2) {
	return Math.min(i1,i2);
};

JkMathMath.minInt64 = function(l1, l2) {
	return Math.max(l1,l2);
};

JkMathMath.pow = function(x, y) {
	return Math.pow(x,y);
};

JkMathMath.round = function(n) {
	return Math.round(n);
};

JkMathMath.roundWithMode = function(d, mode) {
	if(mode == JkMathMath.HALF_POSITIVE) {
		return Math.round(d);
	}
	var fd = JkMathMath.floor(d);
	var dp = d - fd;
	if(dp < 0.5) {
		return fd;
	}
	if(dp > 0.5) {
		return JkMathMath.ceil(d);
	}
	if(mode == JkMathMath.HALF_AWAY_FROM_ZERO) {
		if(d < 0) {
			return fd;
		}
		return JkMathMath.ceil(d);
	}
	if(mode == JkMathMath.HALF_TOWARD_ZERO) {
		if(d < 0) {
			return JkMathMath.ceil(d);
		}
		return fd;
	}
	if(mode == JkMathMath.HALF_NEAREST_EVEN) {
		if(~(~fd) % 2 == 0) {
			return fd;
		}
		return JkMathMath.ceil(d);
	}
	if(mode == JkMathMath.HALF_POSITIVE) {
		return JkMathMath.ceil(d);
	}
	if(mode == JkMathMath.HALF_NEGATIVE) {
		return fd;
	}
	return d;
};

JkMathMath.sin = function(d) {
	return Math.sin(d);
};

JkMathMath.sinh = function(d) {
	return Math.sinh(d);
};

JkMathMath.sqrt = function(d) {
	return Math.sqrt(d);
};

JkMathMath.tan = function(d) {
	return Math.tan(d);
};

JkMathMath.tanh = function(d) {
	return Math.tanh(d);
};

JkMathMath.computeQuinticInEasing = function(t, b, c, d) {
	var x = t / d;
	return c * x * x * x * x * x + b;
};

JkMathMath.computeQuinticOutEasing = function(t, b, c, d) {
	var x = t / d - 1;
	return c * (x * x * x * x * x + 1) + b;
};

JkMathMath.computeQuinticInOutEasing = function(t, b, c, d) {
	var x = t / d / 2;
	if(x < 1.0) {
		return c / 2 * x * x * x * x * x + b;
	}
	x = x - 2;
	return c / 2 * (x * x * x * x * x + 2) + b;
};

JkMathMath.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMathMath"] === true;
};

JkMathMath.M_PI = 3.14159265358979;
JkMathMath.M_PI_2 = 1.5707963267949;
JkMathMath.M_PI_4 = 0.78539816339745;
JkMathMath.M_1_PI = 0.31830988618379;
JkMathMath.M_2_PI = 0.63661977236758;
JkMathMath.M_2_SQRTPI = 1.12837916709551;
JkMathMath.M_SQRT2 = 1.4142135623731;
JkMathMath.M_SQRT1_2 = 0.70710678118655;
JkMathMath.HALF_AWAY_FROM_ZERO = 0;
JkMathMath.HALF_TOWARD_ZERO = 1;
JkMathMath.HALF_NEAREST_EVEN = 2;
JkMathMath.HALF_POSITIVE = 3;
JkMathMath.HALF_NEGATIVE = 4;

let JkMathMatrix33 = function() {
	this.v = [];
};

JkMathMatrix33.prototype._t = { "JkMathMatrix33" : true };
JkMathMatrix33.prototype._tobj = JkMathMatrix33;

JkMathMatrix33.NEW = function() {
	var v = new JkMathMatrix33;
	return v.CTOR_JkMathMatrix33();
};

JkMathMatrix33.prototype.CTOR_JkMathMatrix33 = function() {
	this.v = [];
	return this;
};

JkMathMatrix33.forZero = function() {
	return JkMathMatrix33.forValues([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);
};

JkMathMatrix33.forIdentity = function() {
	return JkMathMatrix33.forValues([1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0]);
};

JkMathMatrix33.invertMatrix = function(m) {
	var d = m.v[0] * m.v[4] * m.v[8] + m.v[3] * m.v[7] * m.v[2] + m.v[6] * m.v[1] * m.v[5] - m.v[0] * m.v[7] * m.v[5] - m.v[3] * m.v[1] * m.v[8] - m.v[6] * m.v[4] * m.v[2];
	var v = JkMathMatrix33.NEW();
	v.v[0] = (m.v[4] * m.v[8] - m.v[7] * m.v[5]) / d;
	v.v[3] = (m.v[6] * m.v[5] - m.v[3] * m.v[8]) / d;
	v.v[6] = (m.v[3] * m.v[7] - m.v[6] * m.v[4]) / d;
	v.v[1] = (m.v[7] * m.v[2] - m.v[1] * m.v[8]) / d;
	v.v[4] = (m.v[0] * m.v[8] - m.v[6] * m.v[2]) / d;
	v.v[7] = (m.v[6] * m.v[1] - m.v[0] * m.v[7]) / d;
	v.v[2] = (m.v[1] * m.v[5] - m.v[4] * m.v[2]) / d;
	v.v[5] = (m.v[3] * m.v[2] - m.v[0] * m.v[5]) / d;
	v.v[8] = (m.v[0] * m.v[4] - m.v[3] * m.v[1]) / d;
	return v;
};

JkMathMatrix33.forTranslate = function(translateX, translateY) {
	return JkMathMatrix33.forValues([1.0, 0.0, translateX, 0.0, 1.0, translateY, 0.0, 0.0, 1.0]);
};

JkMathMatrix33.forRotation = function(angle) {
	var c = JkMathMath.cos(angle);
	var s = JkMathMath.sin(angle);
	return JkMathMatrix33.forValues([c, s, 0.0, -s, c, 0.0, 0.0, 0.0, 1.0]);
};

JkMathMatrix33.forRotationWithCenter = function(angle, centerX, centerY) {
	var translate = JkMathMatrix33.forTranslate(centerX, centerY);
	var rotate = JkMathMatrix33.forRotation(angle);
	var translateBack = JkMathMatrix33.forTranslate((-centerX), (-centerY));
	var translatedRotated = JkMathMatrix33.multiplyMatrix(translate, rotate);
	return JkMathMatrix33.multiplyMatrix(translatedRotated, translateBack);
};

JkMathMatrix33.forSkew = function(skewX, skewY) {
	return JkMathMatrix33.forValues([1.0, skewX, 0.0, skewY, 1.0, 0.0, 0.0, 0.0, 1.0]);
};

JkMathMatrix33.forScale = function(scaleX, scaleY) {
	return JkMathMatrix33.forValues([scaleX, 0.0, 0.0, 0.0, scaleY, 0.0, 0.0, 0.0, 1.0]);
};

JkMathMatrix33.forFlip = function(flipX, flipY) {
	var xmat33 = JkMathMatrix33.forValues([1.0, 0.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 1.0]);
	var ymat33 = JkMathMatrix33.forValues([-1.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 1.0]);
	if(flipX && flipY) {
		return JkMathMatrix33.multiplyMatrix(xmat33, ymat33);
	}
	else if(flipX) {
		return xmat33;
	}
	else if(flipY) {
		return ymat33;
	}
	return JkMathMatrix33.forIdentity();
};

JkMathMatrix33.forValues = function(mv) {
	var v = JkMathMatrix33.NEW();
	var i = 0;
	for(i = 0 ; i < 9 ; i++) {
		if(i >= mv.length) {
			v.v[i] = 0.0;
		}
		else {
			v.v[i] = mv[i];
		}
	}
	return v;
};

JkMathMatrix33.multiplyScalar = function(v, mm) {
	var mat33 = JkMathMatrix33.forZero();
	mat33.v[0] = mm.v[0] * v;
	mat33.v[1] = mm.v[1] * v;
	mat33.v[2] = mm.v[2] * v;
	mat33.v[3] = mm.v[3] * v;
	mat33.v[4] = mm.v[4] * v;
	mat33.v[5] = mm.v[5] * v;
	mat33.v[6] = mm.v[6] * v;
	mat33.v[7] = mm.v[7] * v;
	mat33.v[8] = mm.v[8] * v;
	return mat33;
};

JkMathMatrix33.multiplyMatrix = function(a, b) {
	var matrix33 = JkMathMatrix33.NEW();
	matrix33.v[0] = a.v[0] * b.v[0] + a.v[1] * b.v[3] + a.v[2] * b.v[6];
	matrix33.v[1] = a.v[0] * b.v[1] + a.v[1] * b.v[4] + a.v[2] * b.v[7];
	matrix33.v[2] = a.v[0] * b.v[2] + a.v[1] * b.v[5] + a.v[2] * b.v[8];
	matrix33.v[3] = a.v[3] * b.v[0] + a.v[4] * b.v[3] + a.v[5] * b.v[6];
	matrix33.v[4] = a.v[3] * b.v[1] + a.v[4] * b.v[4] + a.v[5] * b.v[7];
	matrix33.v[5] = a.v[3] * b.v[2] + a.v[4] * b.v[5] + a.v[5] * b.v[8];
	matrix33.v[6] = a.v[6] * b.v[0] + a.v[7] * b.v[3] + a.v[8] * b.v[6];
	matrix33.v[7] = a.v[6] * b.v[1] + a.v[7] * b.v[4] + a.v[8] * b.v[7];
	matrix33.v[8] = a.v[6] * b.v[2] + a.v[7] * b.v[5] + a.v[8] * b.v[8];
	return matrix33;
};

JkMathMatrix33.multiplyVector = function(a, b) {
	var x = a.v[0] * b.x + a.v[1] * b.y + a.v[2] * 1.0;
	var y = a.v[3] * b.x + a.v[4] * b.y + a.v[5] * 1.0;
	return JkMathVector2.create(x, y);
};

JkMathMatrix33.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMathMatrix33"] === true;
};

let JkMathMatrix44 = function() {
	this.v = [];
};

JkMathMatrix44.prototype._t = { "JkMathMatrix44" : true };
JkMathMatrix44.prototype._tobj = JkMathMatrix44;

JkMathMatrix44.NEW = function() {
	var v = new JkMathMatrix44;
	return v.CTOR_JkMathMatrix44();
};

JkMathMatrix44.prototype.CTOR_JkMathMatrix44 = function() {
	this.v = [];
	return this;
};

JkMathMatrix44.forZero = function() {
	return JkMathMatrix44.forValues([0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0]);
};

JkMathMatrix44.forIdentity = function() {
	return JkMathMatrix44.forValues([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0]);
};

JkMathMatrix44.forTranslate = function(translateX, translateY, translateZ) {
	return JkMathMatrix44.forValues([1.0, 0.0, 0.0, translateX, 0.0, 1.0, 0.0, translateY, 0.0, 0.0, 1.0, translateZ, 0.0, 0.0, 0.0, 1.0]);
};

JkMathMatrix44.forXRotation = function(angle) {
	var c = JkMathMath.cos(angle);
	var s = JkMathMath.sin(angle);
	return JkMathMatrix44.forValues([1.0, 0.0, 0.0, 0.0, 0.0, c, -s, 0.0, 0.0, s, c, 0.0, 0.0, 0.0, 0.0, 1.0]);
};

JkMathMatrix44.forYRotation = function(angle) {
	var c = JkMathMath.cos(angle);
	var s = JkMathMath.sin(angle);
	return JkMathMatrix44.forValues([c, 0.0, s, 0.0, 0.0, 1.0, 0.0, 0.0, -s, 0.0, c, 0.0, 0.0, 0.0, 0.0, 1.0]);
};

JkMathMatrix44.forZRotation = function(angle) {
	var c = JkMathMath.cos(angle);
	var s = JkMathMath.sin(angle);
	return JkMathMatrix44.forValues([c, -s, 0.0, 0.0, s, c, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0]);
};

JkMathMatrix44.forSkew = function(vx, vy, vz) {
	return JkMathMatrix44.forValues([1.0, vx, vx, 0.0, vy, 1.0, vy, 0.0, vz, vz, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0]);
};

JkMathMatrix44.forXRotationWithCenter = function(angle, centerX, centerY, centerZ) {
	var translate = JkMathMatrix44.forTranslate(centerX, centerY, centerZ);
	var rotate = JkMathMatrix44.forXRotation(angle);
	var translateBack = JkMathMatrix44.forTranslate((-centerX), (-centerY), (-centerZ));
	var translatedRotated = JkMathMatrix44.multiplyMatrix(translate, rotate);
	return JkMathMatrix44.multiplyMatrix(translatedRotated, translateBack);
};

JkMathMatrix44.forYRotationWithCenter = function(angle, centerX, centerY, centerZ) {
	var translate = JkMathMatrix44.forTranslate(centerX, centerY, centerZ);
	var rotate = JkMathMatrix44.forYRotation(angle);
	var translateBack = JkMathMatrix44.forTranslate((-centerX), (-centerY), (-centerZ));
	var translatedRotated = JkMathMatrix44.multiplyMatrix(translate, rotate);
	return JkMathMatrix44.multiplyMatrix(translatedRotated, translateBack);
};

JkMathMatrix44.forZRotationWithCenter = function(angle, centerX, centerY, centerZ) {
	var translate = JkMathMatrix44.forTranslate(centerX, centerY, centerZ);
	var rotate = JkMathMatrix44.forZRotation(angle);
	var translateBack = JkMathMatrix44.forTranslate((-centerX), (-centerY), (-centerZ));
	var translatedRotated = JkMathMatrix44.multiplyMatrix(translate, rotate);
	return JkMathMatrix44.multiplyMatrix(translatedRotated, translateBack);
};

JkMathMatrix44.forScale = function(scaleX, scaleY, scaleZ) {
	return JkMathMatrix44.forValues([scaleX, 0.0, 0.0, 0.0, 0.0, scaleY, 0.0, 0.0, 0.0, 0.0, scaleZ, 0.0, 0.0, 0.0, 0.0, 1.0]);
};

JkMathMatrix44.forFlipXY = function(flipXY) {
	if(flipXY) {
		return JkMathMatrix44.forValues([1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0.0, 1.0]);
	}
	return JkMathMatrix44.forIdentity();
};

JkMathMatrix44.forFlipXZ = function(flipXZ) {
	if(flipXZ) {
		return JkMathMatrix44.forValues([1.0, 0.0, 0.0, 0.0, 0.0, -1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0]);
	}
	return JkMathMatrix44.forIdentity();
};

JkMathMatrix44.forFlipYZ = function(flipYZ) {
	if(flipYZ) {
		return JkMathMatrix44.forValues([-1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0]);
	}
	return JkMathMatrix44.forIdentity();
};

JkMathMatrix44.forValues = function(mv) {
	var v = JkMathMatrix44.NEW();
	var i = 0;
	for(i = 0 ; i < 16 ; i++) {
		if(i >= mv.length) {
			v.v[i] = 0.0;
		}
		else {
			v.v[i] = mv[i];
		}
	}
	return v;
};

JkMathMatrix44.multiplyScalar = function(v, mm) {
	return JkMathMatrix44.forValues([mm.v[0] * v, mm.v[1] * v, mm.v[2] * v, mm.v[3] * v, mm.v[4] * v, mm.v[5] * v, mm.v[6] * v, mm.v[7] * v, mm.v[8] * v, mm.v[9] * v, mm.v[10] * v, mm.v[11] * v, mm.v[12] * v, mm.v[3] * v, mm.v[14] * v, mm.v[15] * v]);
};

JkMathMatrix44.multiplyMatrix = function(a, b) {
	var matrix44 = JkMathMatrix44.NEW();
	matrix44.v[0] = a.v[0] * b.v[0] + a.v[1] * b.v[4] + a.v[2] * b.v[8] + a.v[3] * b.v[12];
	matrix44.v[1] = a.v[0] * b.v[1] + a.v[1] * b.v[5] + a.v[2] * b.v[9] + a.v[3] * b.v[13];
	matrix44.v[2] = a.v[0] * b.v[2] + a.v[1] * b.v[6] + a.v[2] * b.v[10] + a.v[3] * b.v[14];
	matrix44.v[3] = a.v[0] * b.v[3] + a.v[1] * b.v[7] + a.v[2] * b.v[11] + a.v[3] * b.v[15];
	matrix44.v[4] = a.v[4] * b.v[0] + a.v[5] * b.v[4] + a.v[6] * b.v[8] + a.v[7] * b.v[12];
	matrix44.v[5] = a.v[4] * b.v[1] + a.v[5] * b.v[5] + a.v[6] * b.v[9] + a.v[7] * b.v[13];
	matrix44.v[6] = a.v[4] * b.v[2] + a.v[5] * b.v[6] + a.v[6] * b.v[10] + a.v[7] * b.v[14];
	matrix44.v[7] = a.v[4] * b.v[3] + a.v[5] * b.v[7] + a.v[6] * b.v[11] + a.v[7] * b.v[15];
	matrix44.v[8] = a.v[8] * b.v[0] + a.v[9] * b.v[4] + a.v[10] * b.v[8] + a.v[11] * b.v[12];
	matrix44.v[9] = a.v[8] * b.v[1] + a.v[9] * b.v[5] + a.v[10] * b.v[9] + a.v[11] * b.v[13];
	matrix44.v[10] = a.v[8] * b.v[2] + a.v[9] * b.v[6] + a.v[10] * b.v[10] + a.v[11] * b.v[14];
	matrix44.v[11] = a.v[8] * b.v[3] + a.v[9] * b.v[7] + a.v[10] * b.v[11] + a.v[11] * b.v[15];
	matrix44.v[12] = a.v[12] * b.v[0] + a.v[13] * b.v[4] + a.v[14] * b.v[8] + a.v[15] * b.v[12];
	matrix44.v[13] = a.v[12] * b.v[1] + a.v[13] * b.v[5] + a.v[14] * b.v[9] + a.v[15] * b.v[13];
	matrix44.v[14] = a.v[12] * b.v[2] + a.v[13] * b.v[6] + a.v[14] * b.v[10] + a.v[15] * b.v[14];
	matrix44.v[15] = a.v[12] * b.v[3] + a.v[13] * b.v[7] + a.v[14] * b.v[11] + a.v[15] * b.v[15];
	return matrix44;
};

JkMathMatrix44.multiplyVector = function(a, b) {
	var x = a.v[0] * b.x + a.v[1] * b.y + a.v[2] * b.z + a.v[3] * 1.0;
	var y = a.v[4] * b.x + a.v[5] * b.y + a.v[6] * b.z + a.v[7] * 1.0;
	var z = a.v[8] * b.x + a.v[9] * b.y + a.v[10] * b.z + a.v[11] * 1.0;
	return JkMathVector3.create(x, y, z);
};

JkMathMatrix44.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMathMatrix44"] === true;
};

let JkMathVector2 = function() {
	this.x = 0.0;
	this.y = 0.0;
};

JkMathVector2.prototype._t = { "JkMathVector2" : true };
JkMathVector2.prototype._tobj = JkMathVector2;

JkMathVector2.NEW = function() {
	var v = new JkMathVector2;
	return v.CTOR_JkMathVector2();
};

JkMathVector2.prototype.CTOR_JkMathVector2 = function() {
	this.y = 0.0;
	this.x = 0.0;
	return this;
};

JkMathVector2.create = function(x, y) {
	var v = JkMathVector2.NEW();
	v.x = x;
	v.y = y;
	return v;
};

JkMathVector2.prototype.add = function(b) {
	this.x += b.x;
	this.y += b.y;
	return this;
};

JkMathVector2.prototype.subtract = function(b) {
	this.x -= b.x;
	this.y -= b.y;
	return this;
};

JkMathVector2.prototype.multiply = function(b) {
	this.x *= b.x;
	this.y *= b.y;
	return this;
};

JkMathVector2.prototype.multiplyScalar = function(a) {
	this.x += a;
	this.y += a;
	return this;
};

JkMathVector2.prototype.distance = function(b) {
	var dist = (this.y - b.y) * (this.y - b.y) + (this.x - b.x) * (this.x - b.x);
	return JkMathMath.sqrt(dist);
};

JkMathVector2.prototype.getLength = function() {
	return JkMathMath.sqrt((this.x * this.x + this.y * this.y));
};

JkMathVector2.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMathVector2"] === true;
};

let JkMathVector3 = function() {
	this.x = 0.0;
	this.y = 0.0;
	this.z = 0.0;
};

JkMathVector3.prototype._t = { "JkMathVector3" : true };
JkMathVector3.prototype._tobj = JkMathVector3;

JkMathVector3.NEW = function() {
	var v = new JkMathVector3;
	return v.CTOR_JkMathVector3();
};

JkMathVector3.prototype.CTOR_JkMathVector3 = function() {
	this.z = 0.0;
	this.y = 0.0;
	this.x = 0.0;
	return this;
};

JkMathVector3.create = function(x, y, z) {
	var v = JkMathVector3.NEW();
	v.x = x;
	v.y = y;
	v.z = z;
	return v;
};

JkMathVector3.prototype.add = function(b) {
	this.x += b.x;
	this.y += b.y;
	this.z += b.z;
	return this;
};

JkMathVector3.prototype.subtract = function(b) {
	this.x -= b.x;
	this.y -= b.y;
	this.z -= b.z;
	return this;
};

JkMathVector3.prototype.multiply = function(b) {
	this.x *= b.x;
	this.y *= b.y;
	this.z *= b.z;
	return this;
};

JkMathVector3.prototype.multiplyScalar = function(a) {
	this.x *= a;
	this.y *= a;
	this.z *= a;
	return this;
};

JkMathVector3.prototype.distance = function(b) {
	var dist = (this.y - b.y) * (this.y - b.y) + (this.x - b.x) * (this.x - b.x) + (this.z - b.z) * (this.z - b.z);
	return JkMathMath.sqrt(dist);
};

JkMathVector3.prototype.getLength = function() {
	return JkMathMath.sqrt((this.x * this.x + this.y * this.y + this.z * this.z));
};

JkMathVector3.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkMathVector3"] === true;
};
