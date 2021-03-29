let JkGeneratorDataGenerator = function() {};

JkGeneratorDataGenerator.prototype._t = { "JkGeneratorDataGenerator" : true };
JkGeneratorDataGenerator.prototype._tobj = JkGeneratorDataGenerator;

JkGeneratorDataGenerator.NEW = function() {
	var v = new JkGeneratorDataGenerator;
	return v.CTOR_JkGeneratorDataGenerator();
};

JkGeneratorDataGenerator.prototype.CTOR_JkGeneratorDataGenerator = function() {
	return this;
};

JkGeneratorDataGenerator.generateCodeOrId = function(_length, allDigits, allCaps, prefix) {
	var random = JkRandomRandom.getSharedInstance();
	var sb = JkLangStringBuilder.NEW();
	if(JkLangString.isNotEmpty(prefix)) {
		sb.appendString(prefix);
	}
	var l = _length;
	if(l < 1) {
		l = 1;
	}
	for(var i = 0 ; i < l ; i++) {
		if(allDigits) {
			sb.appendCharacter((random.nextInt3(48, 58)));
		}
		else if(random.nextInt3(0, 2) == 0) {
			sb.appendCharacter((random.nextInt3(48, 58)));
		}
		else if(allCaps) {
			sb.appendCharacter((JkLangCharacter.toUppercase((random.nextInt3(97, 123)))));
		}
		else if(random.nextInt3(0, 2) == 0) {
			sb.appendCharacter((JkLangCharacter.toUppercase((random.nextInt3(97, 123)))));
		}
		else {
			sb.appendCharacter((random.nextInt3(97, 123)));
		}
	}
	return sb.toString();
};

JkGeneratorDataGenerator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkGeneratorDataGenerator"] === true;
};
