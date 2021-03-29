let JkSlonConvertToJson = function() {};

JkSlonConvertToJson.prototype._t = { "JkSlonConvertToJson" : true };
JkSlonConvertToJson.prototype._tobj = JkSlonConvertToJson;

JkSlonConvertToJson.NEW = function() {
	var v = new JkSlonConvertToJson;
	return v.CTOR_JkSlonConvertToJson();
};

JkSlonConvertToJson.prototype.CTOR_JkSlonConvertToJson = function() {
	return this;
};

JkSlonConvertToJson._main = function(args) {
	var src = args[0];
	if(JkLangString.isEmpty(src)) {
		return 1;
	}
	var dst = args[1];
	try {
		var data = JkSlonSLONParser.forFile((JkFsFile.forPath(src))).acceptObject();
		if(!(data != null)) {
			return 1;
		}
		var dstr = JkJsonJSONEncoder.toString(data);
		if(JkLangString.isNotEmpty(dst)) {
			var dstf = JkFsFile.forPath(dst);
			if(!dstf.setContentsUTF8(dstr)) {
				JkLangError._throw("failedToWrite", dstf);
			}
		}
		else {
			console.log(dstr);
		}
		return 0;
	}
	catch(e) {
		console.log("ERROR: " + (JkLangString.safeString((JkLangString.asString(e)))));
	}
	return 1;
};

JkSlonConvertToJson._main();

JkSlonConvertToJson.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkSlonConvertToJson"] === true;
};
