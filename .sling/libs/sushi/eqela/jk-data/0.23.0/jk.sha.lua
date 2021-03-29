jk = jk or {}

jk.sha = jk.sha or {}

jk.sha.SHAEncoder = {}
jk.sha.SHAEncoder.__index = jk.sha.SHAEncoder
_vm:set_metatable(jk.sha.SHAEncoder, {})

jk.sha.SHAEncoder.ANY = 0
jk.sha.SHAEncoder.SHA1 = 1
jk.sha.SHAEncoder.SHA224 = 2
jk.sha.SHAEncoder.SHA256 = 3
jk.sha.SHAEncoder.SHA384 = 4
jk.sha.SHAEncoder.SHA512 = 5

function jk.sha.SHAEncoder._create()
	local v = _vm:set_metatable({}, jk.sha.SHAEncoder)
	return v
end

function jk.sha.SHAEncoder:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.sha.SHAEncoder'
	self['_isType.jk.sha.SHAEncoder'] = true
end

function jk.sha.SHAEncoder:_construct0()
	jk.sha.SHAEncoder._init(self)
	return self
end

function jk.sha.SHAEncoder:create()
	do return _g.jk.sha.SHAEncoderGeneric._construct0(_g.jk.sha.SHAEncoderGeneric._create()) end
end

function jk.sha.SHAEncoder:getSha1HashForString(data)
	if not (data ~= nil) then
		do return nil end
	end
	do
		local enc = _g.jk.sha.SHAEncoder:create()
		if not (enc ~= nil) then
			do return nil end
		end
		do return enc:encodeAsString(_g.jk.lang.String:toUTF8Buffer(data), _g.jk.sha.SHAEncoder.SHA1) end
	end
end

function jk.sha.SHAEncoder:getSha1HashForBuffer(data)
	if not (data ~= nil) then
		do return nil end
	end
	do
		local enc = _g.jk.sha.SHAEncoder:create()
		if not (enc ~= nil) then
			do return nil end
		end
		do return enc:encodeAsString(data, _g.jk.sha.SHAEncoder.SHA1) end
	end
end

function jk.sha.SHAEncoder:encodeAsBuffer(data, version)
end

function jk.sha.SHAEncoder:encodeAsString(data, version)
end

jk.sha.SHAEncoderGeneric = _g.jk.sha.SHAEncoder._create()
jk.sha.SHAEncoderGeneric.__index = jk.sha.SHAEncoderGeneric
_vm:set_metatable(jk.sha.SHAEncoderGeneric, {
	__index = _g.jk.sha.SHAEncoder
})

function jk.sha.SHAEncoderGeneric._create()
	local v = _vm:set_metatable({}, jk.sha.SHAEncoderGeneric)
	return v
end

function jk.sha.SHAEncoderGeneric:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.sha.SHAEncoderGeneric'
	self['_isType.jk.sha.SHAEncoderGeneric'] = true
end

function jk.sha.SHAEncoderGeneric:_construct0()
	jk.sha.SHAEncoderGeneric._init(self)
	do _g.jk.sha.SHAEncoder._construct0(self) end
	return self
end

function jk.sha.SHAEncoderGeneric:encodeAsBuffer(data, version)
	if not (data ~= nil) then
		do return nil end
	end
	do
		local algorithm = 0
		if _g.jk.sha.SHAEncoder.ANY == version or _g.jk.sha.SHAEncoder.SHA1 == version then
			algorithm = 128
		elseif _g.jk.sha.SHAEncoder.SHA256 == version then
			algorithm = 256
		elseif _g.jk.sha.SHAEncoder.SHA384 == version then
			algorithm = 384
		elseif _g.jk.sha.SHAEncoder.SHA512 == version then
			algorithm = 512
		end
		if not (algorithm ~= 0) then
			do return nil end
		end
		do
			local sha = _g.jk.sha.SHAEncoderGeneric.SHA._construct0(_g.jk.sha.SHAEncoderGeneric.SHA._create())
			do sha:encode(data, algorithm) end
			do return sha:digest() end
		end
	end
end

function jk.sha.SHAEncoderGeneric:encodeAsString(data, version)
	local digest = self:encodeAsBuffer(data, version)
	if not (digest ~= nil) then
		do return nil end
	end
	do
		local result = _g.jk.lang.String:forBufferHex(digest)
		do return result end
	end
end

jk.sha.SHAEncoderGeneric.SHA = {}
jk.sha.SHAEncoderGeneric.SHA.__index = jk.sha.SHAEncoderGeneric.SHA
_vm:set_metatable(jk.sha.SHAEncoderGeneric.SHA, {})

function jk.sha.SHAEncoderGeneric.SHA._create()
	local v = _vm:set_metatable({}, jk.sha.SHAEncoderGeneric.SHA)
	return v
end

function jk.sha.SHAEncoderGeneric.SHA:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.sha.SHAEncoderGeneric.SHA'
	self['_isType.jk.sha.SHAEncoderGeneric.SHA'] = true
	self.sha128 = 160
	self.sha256 = 256
	self.sha384 = 384
	self.sha512 = 512
	self.blockSize512 = 512
	self.blockSize1024 = 1024
	self.block64 = 448
	self.block128 = 896
	self.digestLength = 0
	self.blockBitSize = 0
	self.k = nil
	self.k2 = nil
	self.hash1 = nil
	self.hash2 = nil
	self.input = nil
	self.result = nil
end

function jk.sha.SHAEncoderGeneric.SHA:_construct0()
	jk.sha.SHAEncoderGeneric.SHA._init(self)
	return self
end

function jk.sha.SHAEncoderGeneric.SHA:encode(buf, version)
	if not (buf ~= nil) then
		do return end
	end
	self.input = buf
	if version == self.sha384 or version == self.sha512 then
		self.k2 = {
			4794697086780616704,
			8158064640168780800,
			-9223372036854775808,
			-9223372036854775808,
			4131703408338449408,
			6480981068601479168,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			1334009975649890304,
			2608012711638118912,
			6128411473006801920,
			8268148722764580864,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			1135362057144423808,
			2597628984639134720,
			3308224258029322752,
			5365058923640841216,
			6679025012923563008,
			8573033837759648768,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			489312712824947328,
			1452737877330783744,
			2861767655752347648,
			3322285676063803392,
			5560940570517710848,
			5996557281743188992,
			7280758554555802624,
			8532644243296464896,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			1182934255886127616,
			1847814050463011072,
			2177327727835720448,
			2830643537854262272,
			3796741975233480704,
			4115178125766777344,
			5681478168544905216,
			6601373596472566784,
			7507060721942968320,
			8399075790359080960,
			8693463985226723328,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			-9223372036854775808,
			500013540394364864,
			748580250866718848,
			1242879168328830464,
			1977374033974150912,
			2944078676154940416,
			3659926193048069120,
			4368137639120453120,
			4836135668995329024,
			5532061633213251584,
			6448918945643986944,
			6902733635092674560,
			7801388544844847104
		}
	end
	if version == 128 then
		self.digestLength = self.sha128
		self.blockBitSize = self.blockSize512
		self.hash1 = {
			1732584193,
			4023233417,
			2562383102,
			271733878,
			3285377520
		}
	elseif version == self.sha256 then
		self.digestLength = self.sha256
		self.blockBitSize = self.blockSize512
		self.hash1 = {
			1779033703,
			3144134277,
			1013904242,
			2773480762,
			1359893119,
			2600822924,
			528734635,
			1541459225
		}
		self.k = {
			1116352408,
			1899447441,
			3049323471,
			3921009573,
			961987163,
			1508970993,
			2453635748,
			2870763221,
			3624381080,
			310598401,
			607225278,
			1426881987,
			1925078388,
			2162078206,
			2614888103,
			3248222580,
			3835390401,
			4022224774,
			264347078,
			604807628,
			770255983,
			1249150122,
			1555081692,
			1996064986,
			2554220882,
			2821834349,
			2952996808,
			3210313671,
			3336571891,
			3584528711,
			113926993,
			338241895,
			666307205,
			773529912,
			1294757372,
			1396182291,
			1695183700,
			1986661051,
			2177026350,
			2456956037,
			2730485921,
			2820302411,
			3259730800,
			3345764771,
			3516065817,
			3600352804,
			4094571909,
			275423344,
			430227734,
			506948616,
			659060556,
			883997877,
			958139571,
			1322822218,
			1537002063,
			1747873779,
			1955562222,
			2024104815,
			2227730452,
			2361852424,
			2428436474,
			2756734187,
			3204031479,
			3329325298
		}
	elseif version == self.sha384 then
		self.digestLength = self.sha384
		self.blockBitSize = self.blockSize1024
		self.hash2 = {
			-9223372036854775808,
			7105036623409894400,
			-9223372036854775808,
			1526699215303891200,
			7436329637833083904,
			-9223372036854775808,
			-9223372036854775808,
			5167115440072839168
		}
	else
		self.digestLength = self.sha512
		self.blockBitSize = self.blockSize1024
		self.hash2 = {
			7640891576956012544,
			-9223372036854775808,
			4354685564936845312,
			-9223372036854775808,
			5840696475078000640,
			-9223372036854775808,
			2270897969802886400,
			6620516959819538432
		}
	end
end

function jk.sha.SHAEncoderGeneric.SHA:digest()
	if not (self.input ~= nil) then
		do return nil end
	end
	if self.result ~= nil then
		do return self.result end
	end
	do
		local ptr = self:bitPadding(self.input)
		local messageBlocks = self:blocks(ptr, _util:convert_to_integer(self.blockBitSize / 8))
		if messageBlocks ~= nil then
			local n = 0
			local m = _g.jk.lang.Vector:getSize(messageBlocks)
			do
				n = 0
				while n < m do
					local block = messageBlocks[n + 1]
					if block ~= nil then
						if self.blockBitSize == self.blockSize512 then
							do self:shaProcess32(block) end
						else
							do self:shaProcess64(block) end
						end
					end
					do n = n + 1 end
				end
			end
		end
		do
			local ret = _util:allocate_buffer(_util:convert_to_integer(self.digestLength / 8))
			if self.blockBitSize == self.blockSize512 then
				local idx = 0
				if self.hash1 ~= nil then
					local n2 = 0
					local m2 = #self.hash1
					do
						n2 = 0
						while n2 < m2 do
							local element = self.hash1[n2 + 1]
							local pos = idx * 4
							ret[pos + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(element, 24), 255)
							ret[pos + 1 + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(element, 16), 255)
							ret[pos + 2 + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(element, 8), 255)
							ret[pos + 3 + 1] = _vm:bitwise_and(element, 255)
							idx = idx + 1
							do n2 = n2 + 1 end
						end
					end
				end
			else
				local idx = 0
				if self.hash2 ~= nil then
					local n3 = 0
					local m3 = #self.hash2
					do
						n3 = 0
						while n3 < m3 do
							local element = self.hash2[n3 + 1]
							if self.digestLength == self.sha384 and idx == 6 then
								do break end
							end
							do
								local pos = idx * 8
								ret[pos + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(element, 56), 255)
								ret[pos + 1 + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(element, 48), 255)
								ret[pos + 2 + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(element, 40), 255)
								ret[pos + 3 + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(element, 32), 255)
								ret[pos + 4 + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(element, 24), 255)
								ret[pos + 5 + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(element, 16), 255)
								ret[pos + 6 + 1] = _vm:bitwise_and(_vm:bitwise_right_shift(element, 8), 255)
								ret[pos + 7 + 1] = _vm:bitwise_and(element, 255)
								idx = idx + 1
							end
							do n3 = n3 + 1 end
						end
					end
				end
			end
			self.result = ret
			do return ret end
		end
	end
end

function jk.sha.SHAEncoderGeneric.SHA:shaProcess32(block)
	local kcount = 0
	if self.digestLength == self.sha128 then
		kcount = 80
	else
		kcount = #self.k
	end
	do
		local output = _vm:allocate_array(kcount)
		do
			local t = 0
			while t < #output do
				if t <= 15 then
					local index = t * 4
					output[t + 1] = _vm:bitwise_left_shift(block[index + 1], 24)
					output[t + 1] = _vm:bitwise_or(output[t + 1], _vm:bitwise_left_shift(block[index + 1 + 1], 16))
					output[t + 1] = _vm:bitwise_or(output[t + 1], _vm:bitwise_left_shift(block[index + 2 + 1], 8))
					output[t + 1] = _vm:bitwise_or(output[t + 1], block[index + 3 + 1])
				elseif self.digestLength == self.sha128 then
					output[t + 1] = _vm:bitwise_xor(_vm:bitwise_xor(_vm:bitwise_xor(self:rotateLeft(output[t - 3 + 1], 1), self:rotateLeft(output[t - 8 + 1], 1)), self:rotateLeft(output[t - 14 + 1], 1)), self:rotateLeft(output[t - 16 + 1], 1))
				else
					local s0 = _vm:bitwise_xor(_vm:bitwise_xor(self:rotateRight32(output[t - 15 + 1], 7), self:rotateRight32(output[t - 15 + 1], 18)), self:forUint32(_vm:bitwise_right_shift(output[t - 15 + 1], 3)))
					local s1 = _vm:bitwise_xor(_vm:bitwise_xor(self:rotateRight32(output[t - 2 + 1], 17), self:rotateRight32(output[t - 2 + 1], 19)), self:forUint32(_vm:bitwise_right_shift(output[t - 2 + 1], 10)))
					output[t + 1] = self:forUint32(s1 + output[t - 7 + 1] + s0 + output[t - 16 + 1])
				end
				do t = t + 1 end
			end
		end
		do
			local a = self.hash1[0 + 1]
			local b = self.hash1[1 + 1]
			local c = self.hash1[2 + 1]
			local d = self.hash1[3 + 1]
			local e = self.hash1[4 + 1]
			if self.digestLength == self.sha128 then
				do
					local j = 0
					while j <= 79 do
						local f = 0
						local k = 0
						if j <= 19 then
							f = self:forUint32(_vm:bitwise_or(_vm:bitwise_and(b, c), _vm:bitwise_and(_vm:bitwise_not(b), d)))
							k = 1518500249
						elseif j <= 39 then
							f = self:forUint32(_vm:bitwise_xor(_vm:bitwise_xor(b, c), d))
							k = 1859775393
						elseif j <= 59 then
							f = self:forUint32(_vm:bitwise_or(_vm:bitwise_or(_vm:bitwise_and(b, c), _vm:bitwise_and(b, d)), _vm:bitwise_and(c, d)))
							k = 2400959708
						elseif j <= 79 then
							f = self:forUint32(_vm:bitwise_xor(_vm:bitwise_xor(b, c), d))
							k = 3395469782
						end
						do
							local temp = self:forUint32(self:rotateLeft(a, 5) + f + e + output[j + 1] + k)
							e = d
							d = c
							c = self:rotateLeft(b, 30)
							b = a
							a = temp
						end
						do j = j + 1 end
					end
				end
				self.hash1[0 + 1] = a + self.hash1[0 + 1]
				self.hash1[1 + 1] = b + self.hash1[1 + 1]
				self.hash1[2 + 1] = c + self.hash1[2 + 1]
				self.hash1[3 + 1] = d + self.hash1[3 + 1]
				self.hash1[4 + 1] = e + self.hash1[4 + 1]
			else
				local f = self.hash1[5 + 1]
				local g = self.hash1[6 + 1]
				local h = self.hash1[7 + 1]
				do
					local t = 0
					while t < #self.k do
						local e1 = _vm:bitwise_xor(_vm:bitwise_xor(self:rotateRight32(e, 6), self:rotateRight32(e, 11)), self:rotateRight32(e, 25))
						local ch = _vm:bitwise_xor(_vm:bitwise_and(e, f), _vm:bitwise_and(_vm:bitwise_not(e), g))
						local t1 = self:forUint32(h + e1 + ch + self.k[t + 1] + output[t + 1])
						local e0 = _vm:bitwise_xor(_vm:bitwise_xor(self:rotateRight32(a, 2), self:rotateRight32(a, 13)), self:rotateRight32(a, 22))
						local maj = _vm:bitwise_xor(_vm:bitwise_xor(_vm:bitwise_and(a, b), _vm:bitwise_and(a, c)), _vm:bitwise_and(b, c))
						local t2 = self:forUint32(e0 + maj)
						h = g
						g = f
						f = e
						e = self:forUint32(d + t1)
						d = c
						c = b
						b = a
						a = self:forUint32(t1 + t2)
						do t = t + 1 end
					end
				end
				self.hash1[0 + 1] = a + self.hash1[0 + 1]
				self.hash1[1 + 1] = b + self.hash1[1 + 1]
				self.hash1[2 + 1] = c + self.hash1[2 + 1]
				self.hash1[3 + 1] = d + self.hash1[3 + 1]
				self.hash1[4 + 1] = e + self.hash1[4 + 1]
				self.hash1[5 + 1] = f + self.hash1[5 + 1]
				self.hash1[6 + 1] = g + self.hash1[6 + 1]
				self.hash1[7 + 1] = h + self.hash1[7 + 1]
			end
		end
	end
end

function jk.sha.SHAEncoderGeneric.SHA:forUint32(v)
	do return _vm:bitwise_and(v, 4294967295) end
end

function jk.sha.SHAEncoderGeneric.SHA:shaProcess64(block)
	if not (block ~= nil) then
		do return end
	end
	do
		local output = _vm:allocate_array(#self.k2)
		do
			local t = 0
			while t < #output do
				if t <= 15 then
					local index = t * 8
					output[t + 1] = _vm:bitwise_left_shift(block[index + 0 + 1], 56)
					output[t + 1] = _vm:bitwise_or(output[t + 1], _vm:bitwise_left_shift(block[index + 1 + 1], 48))
					output[t + 1] = _vm:bitwise_or(output[t + 1], _vm:bitwise_left_shift(block[index + 2 + 1], 40))
					output[t + 1] = _vm:bitwise_or(output[t + 1], _vm:bitwise_left_shift(block[index + 3 + 1], 32))
					output[t + 1] = _vm:bitwise_or(output[t + 1], _vm:bitwise_left_shift(block[index + 4 + 1], 24))
					output[t + 1] = _vm:bitwise_or(output[t + 1], _vm:bitwise_left_shift(block[index + 5 + 1], 16))
					output[t + 1] = _vm:bitwise_or(output[t + 1], _vm:bitwise_left_shift(block[index + 6 + 1], 8))
					output[t + 1] = _vm:bitwise_or(output[t + 1], block[index + 7 + 1])
				else
					local s0 = _vm:bitwise_xor(_vm:bitwise_xor(self:rotateRight64(output[t - 15 + 1], 1), self:rotateRight64(output[t - 15 + 1], 8)), _vm:bitwise_right_shift(output[t - 15 + 1], 7))
					local s1 = _vm:bitwise_xor(_vm:bitwise_xor(self:rotateRight64(output[t - 2 + 1], 19), self:rotateRight64(output[t - 2 + 1], 61)), _vm:bitwise_right_shift(output[t - 2 + 1], 6))
					output[t + 1] = s1 + output[t - 7 + 1] + s0 + output[t - 16 + 1]
				end
				do t = t + 1 end
			end
		end
		do
			local a = self.hash2[0 + 1]
			local b = self.hash2[1 + 1]
			local c = self.hash2[2 + 1]
			local d = self.hash2[3 + 1]
			local e = self.hash2[4 + 1]
			local f = self.hash2[5 + 1]
			local g = self.hash2[6 + 1]
			local h = self.hash2[7 + 1]
			do
				local t = 0
				while t < #self.k2 do
					local e0 = _vm:bitwise_xor(_vm:bitwise_xor(self:rotateRight64(a, 28), self:rotateRight64(a, 34)), self:rotateRight64(a, 39))
					local maj = _vm:bitwise_xor(_vm:bitwise_xor(_vm:bitwise_and(a, b), _vm:bitwise_and(a, c)), _vm:bitwise_and(b, c))
					local t2 = e0 + maj
					local e1 = _vm:bitwise_xor(_vm:bitwise_xor(self:rotateRight64(e, 14), self:rotateRight64(e, 18)), self:rotateRight64(e, 41))
					local ch = _vm:bitwise_xor(_vm:bitwise_and(e, f), _vm:bitwise_and(_vm:bitwise_not(e), g))
					local t1 = h + e1 + ch + self.k2[t + 1] + output[t + 1]
					h = g
					g = f
					f = e
					e = d + t1
					d = c
					c = b
					b = a
					a = t1 + t2
					do t = t + 1 end
				end
			end
			self.hash2[0 + 1] = a + self.hash2[0 + 1]
			self.hash2[1 + 1] = b + self.hash2[1 + 1]
			self.hash2[2 + 1] = c + self.hash2[2 + 1]
			self.hash2[3 + 1] = d + self.hash2[3 + 1]
			self.hash2[4 + 1] = e + self.hash2[4 + 1]
			self.hash2[5 + 1] = f + self.hash2[5 + 1]
			self.hash2[6 + 1] = g + self.hash2[6 + 1]
			self.hash2[7 + 1] = h + self.hash2[7 + 1]
		end
	end
end

function jk.sha.SHAEncoderGeneric.SHA:bitPadding(input)
	if not (input ~= nil) then
		do return nil end
	end
	do
		local inputBitLength = _g.jk.lang.Buffer:getSize(input) * 8
		local newBuf = _g.jk.lang.Buffer:resize(input, _g.jk.lang.Buffer:getSize(input) + 1)
		do _g.jk.lang.Buffer:setByte(newBuf, _g.jk.lang.Buffer:getSize(newBuf) - 1, 128) end
		do
			local mod = _util:convert_to_integer(inputBitLength % self.blockBitSize)
			local bitsToAppend = 0
			if self.blockBitSize == self.blockSize512 then
				if mod < self.block64 then
					bitsToAppend = self.block64 - 1 - mod
				else
					bitsToAppend = self.blockBitSize + self.block64 - mod - 1
				end
				do
					local osz = _g.jk.lang.Buffer:getSize(newBuf)
					local asz = _util:convert_to_integer((bitsToAppend - 7) / 8)
					newBuf = _g.jk.lang.Buffer:resize(newBuf, osz + asz)
					do
						local n = 0
						while n < asz do
							newBuf[osz + n + 1] = 0
							do n = n + 1 end
						end
					end
				end
			else
				if mod < self.block128 then
					bitsToAppend = self.block128 - 1 - mod
				else
					bitsToAppend = self.blockBitSize + self.block128 - mod - 1
				end
				do
					local osz = _g.jk.lang.Buffer:getSize(newBuf)
					local asz = _util:convert_to_integer((bitsToAppend - 7 + 64) / 8)
					newBuf = _g.jk.lang.Buffer:resize(newBuf, osz + asz)
					do
						local n = 0
						while n < asz do
							newBuf[osz + n + 1] = 0
							do n = n + 1 end
						end
					end
				end
			end
			newBuf = _g.jk.lang.Buffer:resize(newBuf, _g.jk.lang.Buffer:getSize(newBuf) + 8)
			do
				local sz = _g.jk.lang.Buffer:getSize(newBuf)
				newBuf[sz - 8 + 1] = _vm:bitwise_right_shift(_vm:bitwise_and(inputBitLength, -9223372036854775808), 56)
				newBuf[sz - 7 + 1] = _vm:bitwise_right_shift(_vm:bitwise_and(inputBitLength, 71776119061217280), 48)
				newBuf[sz - 6 + 1] = _vm:bitwise_right_shift(_vm:bitwise_and(inputBitLength, 280375465082880), 40)
				newBuf[sz - 5 + 1] = _vm:bitwise_right_shift(_vm:bitwise_and(inputBitLength, 1095216660480), 32)
				newBuf[sz - 4 + 1] = _vm:bitwise_right_shift(_vm:bitwise_and(inputBitLength, 4278190080), 24)
				newBuf[sz - 3 + 1] = _vm:bitwise_right_shift(_vm:bitwise_and(inputBitLength, 16711680), 16)
				newBuf[sz - 2 + 1] = _vm:bitwise_right_shift(_vm:bitwise_and(inputBitLength, 65280), 8)
				newBuf[sz - 1 + 1] = _vm:bitwise_and(inputBitLength, 255)
				do return newBuf end
			end
		end
	end
end

function jk.sha.SHAEncoderGeneric.SHA:blocks(buf, size)
	local msgBlocks = {}
	do
		local i = 0
		while i < _g.jk.lang.Buffer:getSize(buf) do
			local buff = _util:allocate_buffer(size)
			buff = _g.jk.lang.Buffer:getSubBuffer(buf, i, size, false)
			do _g.jk.lang.Vector:append(msgBlocks, buff) end
			i = i + size
		end
	end
	do return msgBlocks end
end

function jk.sha.SHAEncoderGeneric.SHA:rotateRight32(num, cnt)
	do return _vm:bitwise_or(self:forUint32(_vm:bitwise_right_shift(self:forUint32(num), cnt)), self:forUint32(_vm:bitwise_left_shift(self:forUint32(num), 32 - cnt))) end
end

function jk.sha.SHAEncoderGeneric.SHA:rotateRight64(num, cnt)
	do return _vm:bitwise_or(_vm:bitwise_right_shift(num, cnt), _vm:bitwise_left_shift(num, 64 - cnt)) end
end

function jk.sha.SHAEncoderGeneric.SHA:rotateLeft(num, cnt)
	do return _vm:bitwise_or(self:forUint32(_vm:bitwise_left_shift(self:forUint32(num), cnt)), self:forUint32(_vm:bitwise_right_shift(self:forUint32(num), 32 - cnt))) end
end
