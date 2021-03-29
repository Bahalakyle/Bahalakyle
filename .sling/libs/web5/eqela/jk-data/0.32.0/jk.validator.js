let JkValidatorDataValidator = function() {};

JkValidatorDataValidator.prototype._t = { "JkValidatorDataValidator" : true };
JkValidatorDataValidator.prototype._tobj = JkValidatorDataValidator;

JkValidatorDataValidator.NEW = function() {
	var v = new JkValidatorDataValidator;
	return v.CTOR_JkValidatorDataValidator();
};

JkValidatorDataValidator.prototype.CTOR_JkValidatorDataValidator = function() {
	return this;
};

JkValidatorDataValidator.isEmailAddressValid = function(emailAddress) {
	if(JkLangString.isEmpty(emailAddress)) {
		return false;
	}
	if(JkLangString.getLength(emailAddress) > 254) {
		return false;
	}
	var ci = JkLangString.iterate(emailAddress);
	if(!(ci != null)) {
		return false;
	}
	var insideQuotation = false;
	var outsideQuotation = false;
	var dotPreceded = false;
	var isFirstCharacter = true;
	var containsAtCharacter = false;
	var i = -1;
	while(true){
		i++;
		var c = ci.getNextChar();
		if(c < 1) {
			break;
		}
		if(outsideQuotation) {
			if(c != 46 && c != 64) {
				return false;
			}
		}
		if(c >= 65 && c <= 90) {
			;
		}
		else if(c >= 97 && c <= 122) {
			;
		}
		else if(c >= 48 && c <= 57) {
			;
		}
		else if(c == 33) {
			;
		}
		else if(c >= 35 && c <= 39) {
			;
		}
		else if(c == 42) {
			;
		}
		else if(c == 43) {
			;
		}
		else if(c == 45) {
			;
		}
		else if(c == 47) {
			;
		}
		else if(c == 61) {
			;
		}
		else if(c == 63) {
			;
		}
		else if(c >= 94 && c <= 96) {
			;
		}
		else if(c >= 123 && c <= 126) {
			;
		}
		else if(c == 46) {
			if(isFirstCharacter) {
				return false;
			}
			if(dotPreceded && !insideQuotation) {
				return false;
			}
			dotPreceded = true;
			continue;
		}
		else if(c == 32) {
			if(!insideQuotation) {
				return false;
			}
		}
		else if(c == 34) {
			if(insideQuotation) {
				insideQuotation = false;
				outsideQuotation = true;
			}
			else {
				if(!isFirstCharacter && !dotPreceded) {
					return false;
				}
				insideQuotation = true;
				outsideQuotation = false;
			}
		}
		else if(c == 40) {
			if(!insideQuotation) {
				return false;
			}
		}
		else if(c == 41) {
			if(!insideQuotation) {
				return false;
			}
		}
		else if(c == 44) {
			if(!insideQuotation) {
				return false;
			}
		}
		else if(c == 58) {
			if(!insideQuotation) {
				return false;
			}
		}
		else if(c == 59) {
			if(!insideQuotation) {
				return false;
			}
		}
		else if(c == 60) {
			if(!insideQuotation) {
				return false;
			}
		}
		else if(c == 62) {
			if(!insideQuotation) {
				return false;
			}
		}
		else if(c == 64) {
			if(isFirstCharacter) {
				return false;
			}
			if(!insideQuotation) {
				if(dotPreceded) {
					return false;
				}
				containsAtCharacter = true;
				break;
			}
		}
		else if(c == 91) {
			if(!insideQuotation) {
				return false;
			}
		}
		else if(c == 92) {
			if(!insideQuotation) {
				return false;
			}
		}
		else if(c == 93) {
			if(!insideQuotation) {
				return false;
			}
		}
		else {
			return false;
		}
		isFirstCharacter = false;
		dotPreceded = false;
	}
	if(i < 0) {
		return false;
	}
	if(i > 64) {
		return false;
	}
	if(!containsAtCharacter) {
		return false;
	}
	var domain = JkLangString.getEndOfString(emailAddress, (i + 1));
	if(JkLangString.isEmpty(domain)) {
		return false;
	}
	if(JkLangString.getLength(domain) > 253) {
		return false;
	}
	if(JkLangString.startsWith(domain, "[", 0)) {
		if(!JkLangString.endsWith(domain, "]")) {
			return false;
		}
		var ip = JkLangString.getSubString(domain, 1, (JkLangString.getLength(domain) - 2));
		if(JkLangString.isEmpty(ip)) {
			return false;
		}
		var nodes = JkLangString.split(ip, '.'.charCodeAt(), 0);
		if(!(nodes != null) || JkLangVector.getSize(nodes) != 4) {
			return false;
		}
		if(nodes != null) {
			var n2 = 0;
			var m = nodes.length;
			for(n2 = 0 ; n2 < m ; n2++) {
				var node = nodes[n2];
				if(node != null) {
					ci = JkLangString.iterate(node);
					while(true){
						var c1 = ci.getNextChar();
						if(c1 < 1) {
							break;
						}
						if(c1 >= 48 && c1 <= 57) {
							;
						}
						else {
							return false;
						}
					}
					var n = JkLangString.toInteger(node);
					if(n < 0 || n > 255) {
						return false;
					}
				}
			}
		}
		return false;
	}
	var domains = JkLangString.split(domain, '.'.charCodeAt(), 0);
	if(JkLangVector.getSize(domains) <= 1) {
		return false;
	}
	if(domains != null) {
		var n3 = 0;
		var m2 = domains.length;
		for(n3 = 0 ; n3 < m2 ; n3++) {
			var label = domains[n3];
			if(label != null) {
				if(JkLangString.isEmpty(label)) {
					return false;
				}
				if(JkLangString.getLength(label) > 63) {
					return false;
				}
				ci = JkLangString.iterate(label);
				if(!(ci != null)) {
					return false;
				}
				var hyphenPreceded = false;
				isFirstCharacter = true;
				while(true){
					var c2 = ci.getNextChar();
					if(c2 < 1) {
						break;
					}
					if(c2 >= 65 && c2 <= 90) {
						;
					}
					else if(c2 >= 97 && c2 <= 122) {
						;
					}
					else if(c2 >= 48 && c2 <= 57) {
						;
					}
					else if(c2 == 45) {
						if(isFirstCharacter) {
							return false;
						}
						hyphenPreceded = true;
						isFirstCharacter = false;
						continue;
					}
					else {
						return false;
					}
					hyphenPreceded = false;
					isFirstCharacter = false;
				}
				if(hyphenPreceded) {
					return false;
				}
			}
		}
	}
	return true;
};

JkValidatorDataValidator.checkPassword = function(password, minimum, maximun) {
	if(JkLangString.isEmpty(password)) {
		return JkLangError.forCode("noPassword", null);
	}
	var min = minimum;
	if(min < 8) {
		min = 8;
	}
	if(JkLangString.getLength(password) < min) {
		return JkLangError.forCode("passwordLengthLessThanMinimum", null);
	}
	var max = maximun;
	if(max < 64) {
		max = 64;
	}
	if(JkLangString.getLength(password) > max) {
		return JkLangError.forCode("passwordLengthMoreThanMaximum", null);
	}
	var hasLowerAlpha = false;
	var hasUpperAlpha = false;
	var hasNumeric = false;
	var hasSpecial = false;
	var previousChar = '\0'.charCodeAt();
	var sChar = '\0'.charCodeAt();
	var count = 1;
	var ci = JkLangString.iterate(password);
	while(true){
		var c = ci.getNextChar();
		if(c < 1) {
			break;
		}
		if(c > 32 && c < 127) {
			if(previousChar == c) {
				count++;
				if(count == 3) {
					return JkLangError.forCode("passwordHasRepetitiveCharacters", null);
				}
				previousChar = c;
			}
			else if(c == previousChar + 1) {
				sChar = c;
			}
			else if(c == sChar + 1) {
				return JkLangError.forCode("passwordHasSequentialCharacters", null);
			}
			else {
				previousChar = c;
			}
			if(c >= 65 && c <= 90) {
				hasUpperAlpha = true;
			}
			else if(c >= 97 && c <= 122) {
				hasLowerAlpha = true;
			}
			else if(c >= 48 && c <= 57) {
				hasNumeric = true;
			}
			else {
				hasSpecial = true;
			}
			continue;
		}
		return JkLangError.forCode("passwordHasUnknownCharacter", null);
	}
	if(hasUpperAlpha && hasLowerAlpha == false && hasNumeric == false && hasSpecial == false) {
		return JkLangError.forCode("passwordHasNoAlphanumericCharacterCombination", null);
	}
	else if(hasLowerAlpha && hasUpperAlpha && hasNumeric == false && hasSpecial == false) {
		return JkLangError.forCode("passwordHasNoNumericAndSpecialCharacterCombination", null);
	}
	else if(hasNumeric == false) {
		return JkLangError.forCode("passwordHasNoNumericCharacter", null);
	}
	else if(hasLowerAlpha == false) {
		return JkLangError.forCode("passwordHasNoLowercase", null);
	}
	else if(hasUpperAlpha == false) {
		return JkLangError.forCode("passwordHasNoUppercase", null);
	}
	else if(hasSpecial == false) {
		return JkLangError.forCode("passwordHasNoSpecialCharacter", null);
	}
	else {
		return null;
	}
};

JkValidatorDataValidator.isNameValid = function(name) {
	if(JkLangString.isEmpty(name)) {
		return false;
	}
	var ci = JkLangString.iterate(name);
	var isFirstCharacter = true;
	var spacePreceded = false;
	var hyphenPreceded = false;
	while(true){
		var c = ci.getNextChar();
		if(c < 1) {
			break;
		}
		if(c == 32) {
			if(isFirstCharacter) {
				return false;
			}
			if(spacePreceded) {
				return false;
			}
			spacePreceded = true;
			continue;
		}
		if(c == 45) {
			if(isFirstCharacter) {
				return false;
			}
			if(hyphenPreceded) {
				return false;
			}
			hyphenPreceded = true;
			continue;
		}
		isFirstCharacter = false;
		spacePreceded = false;
		hyphenPreceded = false;
		if(c == 164 || c == 165 || c >= 65 && c <= 90 || c >= 97 && c <= 122) {
			continue;
		}
		return false;
	}
	if(spacePreceded) {
		return false;
	}
	if(hyphenPreceded) {
		return false;
	}
	return true;
};

JkValidatorDataValidator.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkValidatorDataValidator"] === true;
};
