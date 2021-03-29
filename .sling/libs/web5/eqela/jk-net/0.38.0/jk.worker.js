let JkWorkerWorkerPool = function() {
	this.ctx = null;
	this.maxWorkers = 200;
	this.maxQueue = 1000;
};

JkWorkerWorkerPool.prototype._t = { "JkWorkerWorkerPool" : true };
JkWorkerWorkerPool.prototype._tobj = JkWorkerWorkerPool;

JkWorkerWorkerPool.NEW = function() {
	var v = new JkWorkerWorkerPool;
	return v.CTOR_JkWorkerWorkerPool();
};

JkWorkerWorkerPool.prototype.CTOR_JkWorkerWorkerPool = function() {
	this.maxQueue = 1000;
	this.maxWorkers = 200;
	this.ctx = null;
	return this;
};

JkWorkerWorkerPool.prototype.forContext = function(ctx) {
	console.log("[jk.worker.WorkerPool.forContext] (WorkerPool.sling:37:3): Not implemented");
	return null;
};

JkWorkerWorkerPool.prototype.executeWorker = function(workertype, input, handler) {};

JkWorkerWorkerPool.prototype.getCtx = function() {
	return this.ctx;
};

JkWorkerWorkerPool.prototype.setCtx = function(v) {
	this.ctx = v;
	return this;
};

JkWorkerWorkerPool.prototype.getMaxWorkers = function() {
	return this.maxWorkers;
};

JkWorkerWorkerPool.prototype.setMaxWorkers = function(v) {
	this.maxWorkers = v;
	return this;
};

JkWorkerWorkerPool.prototype.getMaxQueue = function() {
	return this.maxQueue;
};

JkWorkerWorkerPool.prototype.setMaxQueue = function(v) {
	this.maxQueue = v;
	return this;
};

JkWorkerWorkerPool.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWorkerWorkerPool"] === true;
};

let JkWorkerWorker = function() {};

JkWorkerWorker.prototype._t = { "JkWorkerWorker" : true };
JkWorkerWorker.prototype._tobj = JkWorkerWorker;

JkWorkerWorker.NEW = function() {
	var v = new JkWorkerWorker;
	return v.CTOR_JkWorkerWorker();
};

JkWorkerWorker.prototype.CTOR_JkWorkerWorker = function() {
	return this;
};

JkWorkerWorker.getOutputWriter = function() {
	console.log("[jk.worker.Worker.getOutputWriter] (Worker.sling:39:9): Not implemented");
	return null;
};

JkWorkerWorker.getInputBuffer = function() {
	console.log("[jk.worker.Worker.getInputBuffer] (Worker.sling:50:9): Not implemented");
	return null;
};

JkWorkerWorker.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkWorkerWorker"] === true;
};
