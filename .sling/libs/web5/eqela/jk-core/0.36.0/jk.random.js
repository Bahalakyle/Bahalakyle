let JkRandomRandom = function() {};

JkRandomRandom.prototype._t = { "JkRandomRandom" : true };
JkRandomRandom.prototype._tobj = JkRandomRandom;

JkRandomRandom.NEW_Integer = function(seed) {
	var v = new JkRandomRandom;
	return v.CTOR_JkRandomRandom_Integer(seed);
};

JkRandomRandom.prototype.CTOR_JkRandomRandom_Integer = function(seed) {
	this.setSeed(seed);
	return this;
};

JkRandomRandom.NEW = function() {
	var v = new JkRandomRandom;
	return v.CTOR_JkRandomRandom();
};

JkRandomRandom.prototype.CTOR_JkRandomRandom = function() {
	return this;
};

JkRandomRandom.getSharedInstance = function() {
	if(!(JkRandomRandom.instance != null)) {
		JkRandomRandom.instance = JkRandomRandom.NEW();
	}
	return JkRandomRandom.instance;
};

JkRandomRandom.prototype.setSeed = function(seed) {
};

JkRandomRandom.prototype.nextBoolean = function() {
	if(this.nextInt1() % 2 == 0) {
		return false;
	}
	return true;
};

JkRandomRandom.prototype.nextInt1 = function() {
	return this.nextInt3((-(~(~JkMathMath.pow(2, 31)))), (~(~JkMathMath.pow(2, 31)) - 1));
};

JkRandomRandom.prototype.nextInt2 = function(n) {
	return Math.floor((Math.random() * n) + 1);
};

JkRandomRandom.prototype.nextInt3 = function(s, e) {
	return Math.floor(Math.random() * (e - s) + s);
};

JkRandomRandom.prototype.nextBytes = function(buf) {
	var sz = buf.length;
	for(var n = 0 ; n < sz ; n++) {
		buf[n] = ~(~this.nextInt3((-127), 128));
	}
};

JkRandomRandom.prototype.nextDouble = function() {
	return Math.random();
};

JkRandomRandom.prototype.nextFloat = function() {
	return Math.random().toFixed(8);
};

JkRandomRandom.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkRandomRandom"] === true;
};

JkRandomRandom.instance = null;
