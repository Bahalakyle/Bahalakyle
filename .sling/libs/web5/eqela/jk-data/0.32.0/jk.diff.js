let JkDiffUnifiedDiff = function() {};

JkDiffUnifiedDiff.prototype._t = { "JkDiffUnifiedDiff" : true };
JkDiffUnifiedDiff.prototype._tobj = JkDiffUnifiedDiff;

JkDiffUnifiedDiff.NEW = function() {
	var v = new JkDiffUnifiedDiff;
	return v.CTOR_JkDiffUnifiedDiff();
};

JkDiffUnifiedDiff.prototype.CTOR_JkDiffUnifiedDiff = function() {
	return this;
};

JkDiffUnifiedDiff.backtrack = function(lcs, olines, nlines, i, j) {
	if(i == 0 || j == 0) {
		return new Array;
	}
	var ocount = JkLangVector.getSize(olines);
	if(olines[i - 1] == nlines[j - 1]) {
		var v = JkDiffUnifiedDiff.backtrack(lcs, olines, nlines, (i - 1), (j - 1));
		v.push(olines[i - 1]);
		return v;
	}
	if(lcs[i + (j - 1) * (ocount + 1)] > lcs[i - 1 + j * (ocount + 1)]) {
		return JkDiffUnifiedDiff.backtrack(lcs, olines, nlines, i, (j - 1));
	}
	return JkDiffUnifiedDiff.backtrack(lcs, olines, nlines, (i - 1), j);
};

JkDiffUnifiedDiff.execute = function(fileName, original, modified) {
	if(!(original != null)) {
		return null;
	}
	if(!(modified != null)) {
		return null;
	}
	var olines = JkLangString.split(original, '\n'.charCodeAt(), 0);
	var nlines = JkLangString.split(modified, '\n'.charCodeAt(), 0);
	var ocount = JkLangVector.getSize(olines);
	var ncount = JkLangVector.getSize(nlines);
	var lcs = [];
	for(var n = 0 ; n < ocount + 1 ; n++) {
		lcs[n] = 0;
	}
	for(var n1 = 0 ; n1 < ncount + 1 ; n1++) {
		lcs[n1 * (ocount + 1)] = 0;
	}
	for(var i = 1 ; i < ocount + 1 ; i++) {
		for(var j = 1 ; j < ncount + 1 ; j++) {
			if(olines[i - 1] == nlines[j - 1]) {
				lcs[i + j * (ocount + 1)] = lcs[i - 1 + (j - 1) * (ocount + 1)] + 1;
			}
			else if(lcs[i + (j - 1) * (ocount + 1)] > lcs[i - 1 + j * (ocount + 1)]) {
				lcs[i + j * (ocount + 1)] = lcs[i + (j - 1) * (ocount + 1)];
			}
			else {
				lcs[i + j * (ocount + 1)] = lcs[i - 1 + j * (ocount + 1)];
			}
		}
	}
	var lcsLines = JkDiffUnifiedDiff.backtrack(lcs, olines, nlines, ocount, ncount);
	var op = 0;
	var np = 0;
	var sameCounter = 0;
	var blocksb = null;
	var blockopc = 0;
	var blocknpc = 0;
	var blockolines = 0;
	var blocknlines = 0;
	var msb = JkLangStringBuilder.NEW();
	msb.appendString("diff -u a/" + (JkLangString.safeString(fileName)) + (" b/") + (JkLangString.safeString(fileName)) + ("\n"));
	var timeNow = JkTimeSystemClock.asDateTimeLocal();
	var timeString = (JkLangString.safeString((timeNow.toStringDateTime()))) + (".000000000 +0000");
	msb.appendString("--- a/" + (JkLangString.safeString(fileName)) + (" ") + (JkLangString.safeString(timeString)) + ("\n"));
	msb.appendString("+++ b/" + (JkLangString.safeString(fileName)) + (" ") + (JkLangString.safeString(timeString)) + ("\n"));
	var hdr = msb.toString();
	msb = JkLangStringBuilder.NEW();
	var lp = 0;
	var lcsLinesCount = JkLangVector.getSize(lcsLines);
	while(true){
		var line = null;
		if(lp < lcsLinesCount) {
			line = lcsLines[lp];
		}
		else {
			line = null;
		}
		lp++;
		if(line == null && op >= ocount && np >= ncount) {
			break;
		}
		var changes = null;
		var oop = op;
		var onp = np;
		while(op < ocount && !(olines[op] == line)){
			if(!(changes != null)) {
				changes = new Array;
			}
			changes.push("-" + (JkLangString.safeString(olines[op])));
			op++;
		}
		while(np < ncount && !(nlines[np] == line)){
			if(!(changes != null)) {
				changes = new Array;
			}
			changes.push("+" + (JkLangString.safeString(nlines[np])));
			np++;
		}
		if(changes != null) {
			sameCounter = 0;
			if(!(blocksb != null)) {
				var opc = oop - 3;
				if(opc < 0) {
					opc = 0;
				}
				var npc = onp - 3;
				if(npc < 0) {
					npc = 0;
				}
				blocksb = JkLangStringBuilder.NEW();
				blockopc = opc + 1;
				blocknpc = npc + 1;
				blockolines = 0;
				blocknlines = 0;
				for(var n2 = opc ; n2 < oop ; n2++) {
					blocksb.appendString(" " + (JkLangString.safeString(olines[n2])) + ("\n"));
					blockolines++;
				}
			}
			if(changes != null) {
				var n21 = 0;
				var m = changes.length;
				for(n21 = 0 ; n21 < m ; n21++) {
					var change = changes[n21];
					if(change != null) {
						blocksb.appendString(change);
						blocksb.appendCharacter('\n'.charCodeAt());
						if(JkLangString.startsWith(change, "+", 0)) {
							blocknlines++;
						}
						else if(JkLangString.startsWith(change, "-", 0)) {
							blocknlines--;
							blockolines++;
						}
					}
				}
			}
			changes = null;
		}
		sameCounter++;
		if(sameCounter > 3) {
			if(blocksb != null) {
				if(hdr != null) {
					msb.appendString(hdr);
					hdr = null;
				}
				msb.appendString("@@ -" + (JkLangString.forInteger(blockopc)) + (",") + (JkLangString.forInteger(blockolines)) + (" +") + (JkLangString.forInteger(blocknpc)) + (",") + (JkLangString.forInteger((blockolines + blocknlines))) + (" @@\n"));
				msb.appendString((blocksb.toString()));
				blocksb = null;
			}
		}
		if(blocksb != null && op < ocount) {
			blocksb.appendString(" " + (JkLangString.safeString(olines[op])) + ("\n"));
			blockolines++;
		}
		op++;
		np++;
	}
	if(blocksb != null) {
		if(hdr != null) {
			msb.appendString(hdr);
			hdr = null;
		}
		msb.appendString("@@ -" + (JkLangString.forInteger(blockopc)) + (",") + (JkLangString.forInteger(blockolines)) + (" +") + (JkLangString.forInteger(blocknpc)) + (",") + (JkLangString.forInteger((blockolines + blocknlines))) + (" @@\n"));
		msb.appendString((blocksb.toString()));
		blocksb = null;
	}
	return msb.toString();
};

JkDiffUnifiedDiff.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkDiffUnifiedDiff"] === true;
};
