let JkShaSHAEncoder = function() {};

JkShaSHAEncoder.prototype._t = { "JkShaSHAEncoder" : true };
JkShaSHAEncoder.prototype._tobj = JkShaSHAEncoder;

JkShaSHAEncoder.NEW = function() {
	var v = new JkShaSHAEncoder;
	return v.CTOR_JkShaSHAEncoder();
};

JkShaSHAEncoder.prototype.CTOR_JkShaSHAEncoder = function() {
	return this;
};

JkShaSHAEncoder.create = function() {
	return JkShaSHAEncoderGeneric.NEW();
};

JkShaSHAEncoder.getSha1HashForString = function(data) {
	if(!(data != null)) {
		return null;
	}
	var enc = JkShaSHAEncoder.create();
	if(!(enc != null)) {
		return null;
	}
	return enc.encodeAsString((JkLangString.toUTF8Buffer(data)), JkShaSHAEncoder.SHA1);
};

JkShaSHAEncoder.getSha1HashForBuffer = function(data) {
	if(!(data != null)) {
		return null;
	}
	var enc = JkShaSHAEncoder.create();
	if(!(enc != null)) {
		return null;
	}
	return enc.encodeAsString(data, JkShaSHAEncoder.SHA1);
};

JkShaSHAEncoder.prototype.encodeAsBuffer = function(data, version) {};

JkShaSHAEncoder.prototype.encodeAsString = function(data, version) {};

JkShaSHAEncoder.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkShaSHAEncoder"] === true;
};

JkShaSHAEncoder.ANY = 0;
JkShaSHAEncoder.SHA1 = 1;
JkShaSHAEncoder.SHA224 = 2;
JkShaSHAEncoder.SHA256 = 3;
JkShaSHAEncoder.SHA384 = 4;
JkShaSHAEncoder.SHA512 = 5;

let JkShaSHAEncoderGenericSHA = function() {
	this.sha128 = 160;
	this.sha256 = 256;
	this.sha384 = 384;
	this.sha512 = 512;
	this.blockSize512 = 512;
	this.blockSize1024 = 1024;
	this.block64 = 448;
	this.block128 = 896;
	this.digestLength = 0;
	this.blockBitSize = 0;
	this.k = null;
	this.k2 = null;
	this.hash1 = null;
	this.hash2 = null;
	this.input = null;
	this.result = null;
};

JkShaSHAEncoderGenericSHA.prototype._t = { "JkShaSHAEncoderGenericSHA" : true };
JkShaSHAEncoderGenericSHA.prototype._tobj = JkShaSHAEncoderGenericSHA;

JkShaSHAEncoderGenericSHA.NEW = function() {
	var v = new JkShaSHAEncoderGenericSHA;
	return v.CTOR_JkShaSHAEncoderGenericSHA();
};

JkShaSHAEncoderGenericSHA.prototype.CTOR_JkShaSHAEncoderGenericSHA = function() {
	this.result = null;
	this.input = null;
	this.hash2 = null;
	this.hash1 = null;
	this.k2 = null;
	this.k = null;
	this.blockBitSize = 0;
	this.digestLength = 0;
	this.block128 = 896;
	this.block64 = 448;
	this.blockSize1024 = 1024;
	this.blockSize512 = 512;
	this.sha512 = 512;
	this.sha384 = 384;
	this.sha256 = 256;
	this.sha128 = 160;
	return this;
};

JkShaSHAEncoderGenericSHA.prototype.encode = function(buf, version) {
	if(!(buf != null)) {
		return;
	}
	this.input = buf;
	if(version == this.sha384 || version == this.sha512) {
		this.k2 = [0x428a2f98d728b000, 0x7137449123ef6400, 0x8000000000000000, 0x8000000000000000, 0x3956c25bf348b400, 0x59f111f1b605d000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x12835b0145707000, 0x243185be4ee4b200, 0x550c7dc3d5ffb400, 0x72be5d74f27b8800, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0xfc19dc68b8cd580, 0x240ca1cc77ac9c00, 0x2de92c6f592b0200, 0x4a7484aa6ea6e400, 0x5cb0a9dcbd41fc00, 0x76f988da83115400, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x6ca6351e0038280, 0x142929670a0e6e00, 0x27b70a8546d23000, 0x2e1b21385c26c800, 0x4d2c6dfc5ac42800, 0x53380d139d95b400, 0x650a73548baf6400, 0x766a0abb3c77b000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x106aa07032bbd200, 0x19a4c116b8d2d100, 0x1e376c085141ab00, 0x2748774cdf8eec00, 0x34b0bcb5e19b4800, 0x391c0cb3c5c95a00, 0x4ed8aa4ae3418800, 0x5b9cca4f7763e400, 0x682e6ff3d6b2b800, 0x748f82ee5defb000, 0x78a5636f43173000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x8000000000000000, 0x6f067aa72176fc0, 0xa637dc5a2c89880, 0x113f9804bef90e00, 0x1b710b35131c4700, 0x28db77f523047c00, 0x32caab7b40c72400, 0x3c9ebe0a15c9be00, 0x431d67c49c100c00, 0x4cc5d4becb3e4000, 0x597f299cfc658000, 0x5fcb6fab3ad6f800, 0x6c44198c4a475800];
	}
	if(version == 128) {
		this.digestLength = this.sha128;
		this.blockBitSize = this.blockSize512;
		this.hash1 = [0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476, 0xc3d2e1f0];
	}
	else if(version == this.sha256) {
		this.digestLength = this.sha256;
		this.blockBitSize = this.blockSize512;
		this.hash1 = [0x6a09e667, 0xbb67ae85, 0x3c6ef372, 0xa54ff53a, 0x510e527f, 0x9b05688c, 0x1f83d9ab, 0x5be0cd19];
		this.k = [0x428a2f98, 0x71374491, 0xb5c0fbcf, 0xe9b5dba5, 0x3956c25b, 0x59f111f1, 0x923f82a4, 0xab1c5ed5, 0xd807aa98, 0x12835b01, 0x243185be, 0x550c7dc3, 0x72be5d74, 0x80deb1fe, 0x9bdc06a7, 0xc19bf174, 0xe49b69c1, 0xefbe4786, 0xfc19dc6, 0x240ca1cc, 0x2de92c6f, 0x4a7484aa, 0x5cb0a9dc, 0x76f988da, 0x983e5152, 0xa831c66d, 0xb00327c8, 0xbf597fc7, 0xc6e00bf3, 0xd5a79147, 0x6ca6351, 0x14292967, 0x27b70a85, 0x2e1b2138, 0x4d2c6dfc, 0x53380d13, 0x650a7354, 0x766a0abb, 0x81c2c92e, 0x92722c85, 0xa2bfe8a1, 0xa81a664b, 0xc24b8b70, 0xc76c51a3, 0xd192e819, 0xd6990624, 0xf40e3585, 0x106aa070, 0x19a4c116, 0x1e376c08, 0x2748774c, 0x34b0bcb5, 0x391c0cb3, 0x4ed8aa4a, 0x5b9cca4f, 0x682e6ff3, 0x748f82ee, 0x78a5636f, 0x84c87814, 0x8cc70208, 0x90befffa, 0xa4506ceb, 0xbef9a3f7, 0xc67178f2];
	}
	else if(version == this.sha384) {
		this.digestLength = this.sha384;
		this.blockBitSize = this.blockSize1024;
		this.hash2 = [0x8000000000000000, 0x629a292a367cd400, 0x8000000000000000, 0x152fecd8f70e5900, 0x67332667ffc00c00, 0x8000000000000000, 0x8000000000000000, 0x47b5481dbefa5000];
	}
	else {
		this.digestLength = this.sha512;
		this.blockBitSize = this.blockSize1024;
		this.hash2 = [0x6a09e667f3bcc800, 0x8000000000000000, 0x3c6ef372fe94f800, 0x8000000000000000, 0x510e527fade68000, 0x8000000000000000, 0x1f83d9abfb41bd00, 0x5be0cd19137e2000];
	}
};

JkShaSHAEncoderGenericSHA.prototype.digest = function() {
	if(!(this.input != null)) {
		return null;
	}
	if(this.result != null) {
		return this.result;
	}
	var ptr = this.bitPadding(this.input);
	var messageBlocks = this.blocks(ptr, (this.blockBitSize / 8));
	if(messageBlocks != null) {
		var n = 0;
		var m = messageBlocks.length;
		for(n = 0 ; n < m ; n++) {
			var block = messageBlocks[n];
			if(block != null) {
				if(this.blockBitSize == this.blockSize512) {
					this.shaProcess32(block);
				}
				else {
					this.shaProcess64(block);
				}
			}
		}
	}
	var ret = new ArrayBuffer(this.digestLength / 8);
	if(this.blockBitSize == this.blockSize512) {
		var idx = 0;
		if(this.hash1 != null) {
			var n2 = 0;
			var m2 = this.hash1.length;
			for(n2 = 0 ; n2 < m2 ; n2++) {
				var element = this.hash1[n2];
				var pos = idx * 4;
				ret[pos] = ~(~(~(~(element >> 24)) & 0xff));
				ret[pos + 1] = ~(~(~(~(element >> 16)) & 0xff));
				ret[pos + 2] = ~(~(~(~(element >> 8)) & 0xff));
				ret[pos + 3] = ~(~(~(~element) & 0xff));
				idx += 1;
			}
		}
	}
	else {
		var idx1 = 0;
		if(this.hash2 != null) {
			var n3 = 0;
			var m3 = this.hash2.length;
			for(n3 = 0 ; n3 < m3 ; n3++) {
				var element1 = this.hash2[n3];
				if(this.digestLength == this.sha384 && idx1 == 6) {
					break;
				}
				var pos1 = idx1 * 8;
				ret[pos1] = ~(~(~(~(element1 >> 56)) & 0xff));
				ret[pos1 + 1] = ~(~(~(~(element1 >> 48)) & 0xff));
				ret[pos1 + 2] = ~(~(~(~(element1 >> 40)) & 0xff));
				ret[pos1 + 3] = ~(~(~(~(element1 >> 32)) & 0xff));
				ret[pos1 + 4] = ~(~(~(~(element1 >> 24)) & 0xff));
				ret[pos1 + 5] = ~(~(~(~(element1 >> 16)) & 0xff));
				ret[pos1 + 6] = ~(~(~(~(element1 >> 8)) & 0xff));
				ret[pos1 + 7] = ~(~(~(~element1) & 0xff));
				idx1 += 1;
			}
		}
	}
	this.result = ret;
	return ret;
};

JkShaSHAEncoderGenericSHA.prototype.shaProcess32 = function(block) {
	var kcount = 0;
	if(this.digestLength == this.sha128) {
		kcount = 80;
	}
	else {
		kcount = this.k.length;
	}
	var output = [];
	for(var t = 0 ; t < output.length ; t++) {
		if(t <= 15) {
			var index = t * 4;
			output[t] = ~(~(~(~block[index]) << 24));
			output[t] = output[t] | ~(~(~(~block[index + 1]) << 16));
			output[t] = output[t] | ~(~(~(~block[index + 2]) << 8));
			output[t] = output[t] | ~(~(~(~block[index + 3])));
		}
		else if(this.digestLength == this.sha128) {
			output[t] = this.rotateLeft(output[t - 3], 1) ^ this.rotateLeft(output[t - 8], 1) ^ this.rotateLeft(output[t - 14], 1) ^ this.rotateLeft(output[t - 16], 1);
		}
		else {
			var s0 = this.rotateRight32((~(~output[t - 15])), 7) ^ this.rotateRight32((~(~output[t - 15])), 18) ^ ~(~this.forUint32((~(~output[t - 15]) >> 3)));
			var s1 = this.rotateRight32((~(~output[t - 2])), 17) ^ this.rotateRight32((~(~output[t - 2])), 19) ^ ~(~this.forUint32((~(~output[t - 2]) >> 10)));
			output[t] = this.forUint32((s1 + output[t - 7] + s0 + output[t - 16]));
		}
	}
	var a = this.hash1[0];
	var b = this.hash1[1];
	var c = this.hash1[2];
	var d = this.hash1[3];
	var e = this.hash1[4];
	if(this.digestLength == this.sha128) {
		for(var j = 0 ; j <= 79 ; j++) {
			var f = ~(~0);
			var k = ~(~0);
			if(j <= 19) {
				f = this.forUint32((b & c | ~b & d));
				k = 0x5a827999;
			}
			else if(j <= 39) {
				f = this.forUint32((b ^ c ^ d));
				k = 0x6ed9eba1;
			}
			else if(j <= 59) {
				f = this.forUint32((b & c | b & d | c & d));
				k = 0x8f1bbcdc;
			}
			else if(j <= 79) {
				f = this.forUint32((b ^ c ^ d));
				k = 0xca62c1d6;
			}
			var temp = this.forUint32((this.rotateLeft(a, 5) + f + e + output[j] + k));
			e = d;
			d = c;
			c = this.rotateLeft(b, 30);
			b = a;
			a = temp;
		}
		this.hash1[0] = a + this.hash1[0];
		this.hash1[1] = b + this.hash1[1];
		this.hash1[2] = c + this.hash1[2];
		this.hash1[3] = d + this.hash1[3];
		this.hash1[4] = e + this.hash1[4];
	}
	else {
		var f1 = this.hash1[5];
		var g = this.hash1[6];
		var h = this.hash1[7];
		for(var t1 = 0 ; t1 < this.k.length ; t1++) {
			var e1 = this.rotateRight32(e, 6) ^ this.rotateRight32(e, 11) ^ this.rotateRight32(e, 25);
			var ch = e & f1 ^ ~e & g;
			var t11 = this.forUint32((h + e1 + ch + this.k[t1] + output[t1]));
			var e0 = this.rotateRight32(a, 2) ^ this.rotateRight32(a, 13) ^ this.rotateRight32(a, 22);
			var maj = a & b ^ a & c ^ b & c;
			var t2 = this.forUint32((e0 + maj));
			h = g;
			g = f1;
			f1 = e;
			e = this.forUint32((d + t11));
			d = c;
			c = b;
			b = a;
			a = this.forUint32((t11 + t2));
		}
		this.hash1[0] = a + this.hash1[0];
		this.hash1[1] = b + this.hash1[1];
		this.hash1[2] = c + this.hash1[2];
		this.hash1[3] = d + this.hash1[3];
		this.hash1[4] = e + this.hash1[4];
		this.hash1[5] = f1 + this.hash1[5];
		this.hash1[6] = g + this.hash1[6];
		this.hash1[7] = h + this.hash1[7];
	}
};

JkShaSHAEncoderGenericSHA.prototype.forUint32 = function(v) {
	return v & 0xffffffff;
};

JkShaSHAEncoderGenericSHA.prototype.shaProcess64 = function(block) {
	if(!(block != null)) {
		return;
	}
	var output = [];
	for(var t = 0 ; t < output.length ; t++) {
		if(t <= 15) {
			var index = t * 8;
			output[t] = ~(~(~(~block[index + 0]) << 56));
			output[t] = output[t] | ~(~(~(~block[index + 1]) << 48));
			output[t] = output[t] | ~(~(~(~block[index + 2]) << 40));
			output[t] = output[t] | ~(~(~(~block[index + 3]) << 32));
			output[t] = output[t] | ~(~(~(~block[index + 4]) << 24));
			output[t] = output[t] | ~(~(~(~block[index + 5]) << 16));
			output[t] = output[t] | ~(~(~(~block[index + 6]) << 8));
			output[t] = output[t] | ~(~block[index + 7]);
		}
		else {
			var s0 = ~(~(this.rotateRight64((~(~output[t - 15])), 1) ^ this.rotateRight64((~(~output[t - 15])), 8) ^ ~(~(~(~output[t - 15]) >> 7))));
			var s1 = ~(~(this.rotateRight64((~(~output[t - 2])), 19) ^ this.rotateRight64((~(~output[t - 2])), 61) ^ ~(~(~(~output[t - 2]) >> 6))));
			output[t] = s1 + ~(~output[t - 7]) + s0 + ~(~output[t - 16]);
		}
	}
	var a = this.hash2[0];
	var b = this.hash2[1];
	var c = this.hash2[2];
	var d = this.hash2[3];
	var e = this.hash2[4];
	var f = this.hash2[5];
	var g = this.hash2[6];
	var h = this.hash2[7];
	for(var t1 = 0 ; t1 < this.k2.length ; t1++) {
		var e0 = ~(~(this.rotateRight64(a, 28) ^ this.rotateRight64(a, 34) ^ this.rotateRight64(a, 39)));
		var maj = a & b ^ a & c ^ b & c;
		var t2 = ~(~(e0 + maj));
		var e1 = ~(~(this.rotateRight64(e, 14) ^ this.rotateRight64(e, 18) ^ this.rotateRight64(e, 41)));
		var ch = e & f ^ ~e & g;
		var t11 = ~(~h) + ~(~e1) + ~(~ch) + ~(~this.k2[t1]) + ~(~output[t1]);
		h = g;
		g = f;
		f = e;
		e = d + t11;
		d = c;
		c = b;
		b = a;
		a = t11 + t2;
	}
	this.hash2[0] = a + this.hash2[0];
	this.hash2[1] = b + this.hash2[1];
	this.hash2[2] = c + this.hash2[2];
	this.hash2[3] = d + this.hash2[3];
	this.hash2[4] = e + this.hash2[4];
	this.hash2[5] = f + this.hash2[5];
	this.hash2[6] = g + this.hash2[6];
	this.hash2[7] = h + this.hash2[7];
};

JkShaSHAEncoderGenericSHA.prototype.bitPadding = function(input) {
	if(!(input != null)) {
		return null;
	}
	var inputBitLength = JkLangBuffer.getSize(input) * 8;
	var newBuf = JkLangBuffer.resize(input, (JkLangBuffer.getSize(input) + 1));
	JkLangBuffer.setByte(newBuf, (JkLangBuffer.getSize(newBuf) - 1), (~(~0x80)));
	var mod = ~(~(inputBitLength % this.blockBitSize));
	var bitsToAppend = 0;
	if(this.blockBitSize == this.blockSize512) {
		if(mod < this.block64) {
			bitsToAppend = ~(~(this.block64 - 1 - mod));
		}
		else {
			bitsToAppend = ~(~(this.blockBitSize + this.block64 - mod - 1));
		}
		var osz = JkLangBuffer.getSize(newBuf);
		var asz = (bitsToAppend - 7) / 8;
		newBuf = JkLangBuffer.resize(newBuf, (osz + asz));
		for(var n = 0 ; n < asz ; n++) {
			newBuf[~(~osz) + n] = ~(~0);
		}
	}
	else {
		if(mod < this.block128) {
			bitsToAppend = ~(~(this.block128 - 1 - mod));
		}
		else {
			bitsToAppend = ~(~(this.blockBitSize + this.block128 - mod - 1));
		}
		var osz1 = JkLangBuffer.getSize(newBuf);
		var asz1 = (bitsToAppend - 7 + 64) / 8;
		newBuf = JkLangBuffer.resize(newBuf, (osz1 + asz1));
		for(var n1 = 0 ; n1 < asz1 ; n1++) {
			newBuf[~(~osz1) + n1] = ~(~0);
		}
	}
	newBuf = JkLangBuffer.resize(newBuf, (JkLangBuffer.getSize(newBuf) + 8));
	var sz = ~(~JkLangBuffer.getSize(newBuf));
	newBuf[sz - 8] = ~(~((~(~inputBitLength) & 0x8000000000000000) >> 56));
	newBuf[sz - 7] = ~(~((~(~inputBitLength) & 0xff000000000000) >> 48));
	newBuf[sz - 6] = ~(~((~(~inputBitLength) & 0xff0000000000) >> 40));
	newBuf[sz - 5] = ~(~((~(~inputBitLength) & 0xff00000000) >> 32));
	newBuf[sz - 4] = ~(~((~(~inputBitLength) & 0xff000000) >> 24));
	newBuf[sz - 3] = ~(~((~(~inputBitLength) & 0xff0000) >> 16));
	newBuf[sz - 2] = ~(~((~(~inputBitLength) & 0xff00) >> 8));
	newBuf[sz - 1] = ~(~(~(~inputBitLength) & 0xff));
	return newBuf;
};

JkShaSHAEncoderGenericSHA.prototype.blocks = function(buf, size) {
	var msgBlocks = new Array;
	for(var i = 0 ; i < JkLangBuffer.getSize(buf) ; i += size) {
		var buff = new ArrayBuffer(size);
		buff = JkLangBuffer.getSubBuffer(buf, i, size, false);
		msgBlocks.push(buff);
	}
	return msgBlocks;
};

JkShaSHAEncoderGenericSHA.prototype.rotateRight32 = function(num, cnt) {
	return this.forUint32((this.forUint32(num) >> cnt)) | this.forUint32((this.forUint32(num) << 32 - cnt));
};

JkShaSHAEncoderGenericSHA.prototype.rotateRight64 = function(num, cnt) {
	return ~(~(num >> cnt | num << 64 - cnt));
};

JkShaSHAEncoderGenericSHA.prototype.rotateLeft = function(num, cnt) {
	return this.forUint32((this.forUint32(num) << cnt)) | ~(~this.forUint32((this.forUint32(num) >> 32 - cnt)));
};

JkShaSHAEncoderGenericSHA.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkShaSHAEncoderGenericSHA"] === true;
};

let JkShaSHAEncoderGeneric = function() {
	JkShaSHAEncoder.call(this);
};

JkShaSHAEncoderGeneric.prototype = (function(o) { function F() {}; F.prototype = o; return(new F()); }) (JkShaSHAEncoder.prototype);
JkShaSHAEncoderGeneric.prototype.constructor = JkShaSHAEncoderGeneric;
JkShaSHAEncoderGeneric.prototype._t = {
	"JkShaSHAEncoderGeneric" : true,
	"JkShaSHAEncoder" : true
};
JkShaSHAEncoderGeneric.prototype._tobj = JkShaSHAEncoderGeneric;

JkShaSHAEncoderGeneric.NEW = function() {
	var v = new JkShaSHAEncoderGeneric;
	return v.CTOR_JkShaSHAEncoderGeneric();
};

JkShaSHAEncoderGeneric.prototype.CTOR_JkShaSHAEncoderGeneric = function() {
	if(JkShaSHAEncoder.prototype.CTOR_JkShaSHAEncoder.call(this) == null) {
		return null;
	}
	return this;
};

JkShaSHAEncoderGeneric.prototype.encodeAsBuffer = function(data, version) {
	if(!(data != null)) {
		return null;
	}
	var algorithm = 0;
	if(JkShaSHAEncoder.ANY == version || JkShaSHAEncoder.SHA1 == version) {
		algorithm = 128;
	}
	else if(JkShaSHAEncoder.SHA256 == version) {
		algorithm = 256;
	}
	else if(JkShaSHAEncoder.SHA384 == version) {
		algorithm = 384;
	}
	else if(JkShaSHAEncoder.SHA512 == version) {
		algorithm = 512;
	}
	if(!(algorithm != 0)) {
		return null;
	}
	var sha = JkShaSHAEncoderGenericSHA.NEW();
	sha.encode(data, algorithm);
	return sha.digest();
};

JkShaSHAEncoderGeneric.prototype.encodeAsString = function(data, version) {
	var digest = this.encodeAsBuffer(data, version);
	if(!(digest != null)) {
		return null;
	}
	var result = JkLangString.forBufferHex(digest);
	return result;
};

JkShaSHAEncoderGeneric.IS_INSTANCE = function(o) {
	return o != null && o._t != null && o._t["JkShaSHAEncoderGeneric"] === true;
};
