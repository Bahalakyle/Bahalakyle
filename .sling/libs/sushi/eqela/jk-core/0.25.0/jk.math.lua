jk = jk or {}

jk.math = jk.math or {}

jk.math.Vector2 = {}
jk.math.Vector2.__index = jk.math.Vector2
_vm:set_metatable(jk.math.Vector2, {})

function jk.math.Vector2._create()
	local v = _vm:set_metatable({}, jk.math.Vector2)
	return v
end

function jk.math.Vector2:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.math.Vector2'
	self['_isType.jk.math.Vector2'] = true
	self.x = 0.0
	self.y = 0.0
end

function jk.math.Vector2:_construct0()
	jk.math.Vector2._init(self)
	return self
end

function jk.math.Vector2:create(x, y)
	local v = _g.jk.math.Vector2._construct0(_g.jk.math.Vector2._create())
	v.x = x
	v.y = y
	do return v end
end

function jk.math.Vector2:add(b)
	self.x = self.x + b.x
	self.y = self.y + b.y
	do return self end
end

function jk.math.Vector2:subtract(b)
	self.x = self.x - b.x
	self.y = self.y - b.y
	do return self end
end

function jk.math.Vector2:multiply(b)
	self.x = self.x * b.x
	self.y = self.y * b.y
	do return self end
end

function jk.math.Vector2:multiplyScalar(a)
	self.x = self.x + a
	self.y = self.y + a
	do return self end
end

function jk.math.Vector2:distance(b)
	local dist = (self.y - b.y) * (self.y - b.y) + (self.x - b.x) * (self.x - b.x)
	do return _g.jk.math.Math:sqrt(dist) end
end

function jk.math.Vector2:getLength()
	do return _g.jk.math.Math:sqrt(self.x * self.x + self.y * self.y) end
end

jk.math.Vector3 = {}
jk.math.Vector3.__index = jk.math.Vector3
_vm:set_metatable(jk.math.Vector3, {})

function jk.math.Vector3._create()
	local v = _vm:set_metatable({}, jk.math.Vector3)
	return v
end

function jk.math.Vector3:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.math.Vector3'
	self['_isType.jk.math.Vector3'] = true
	self.x = 0.0
	self.y = 0.0
	self.z = 0.0
end

function jk.math.Vector3:_construct0()
	jk.math.Vector3._init(self)
	return self
end

function jk.math.Vector3:create(x, y, z)
	local v = _g.jk.math.Vector3._construct0(_g.jk.math.Vector3._create())
	v.x = x
	v.y = y
	v.z = z
	do return v end
end

function jk.math.Vector3:add(b)
	self.x = self.x + b.x
	self.y = self.y + b.y
	self.z = self.z + b.z
	do return self end
end

function jk.math.Vector3:subtract(b)
	self.x = self.x - b.x
	self.y = self.y - b.y
	self.z = self.z - b.z
	do return self end
end

function jk.math.Vector3:multiply(b)
	self.x = self.x * b.x
	self.y = self.y * b.y
	self.z = self.z * b.z
	do return self end
end

function jk.math.Vector3:multiplyScalar(a)
	self.x = self.x * a
	self.y = self.y * a
	self.z = self.z * a
	do return self end
end

function jk.math.Vector3:distance(b)
	local dist = (self.y - b.y) * (self.y - b.y) + (self.x - b.x) * (self.x - b.x) + (self.z - b.z) * (self.z - b.z)
	do return _g.jk.math.Math:sqrt(dist) end
end

function jk.math.Vector3:getLength()
	do return _g.jk.math.Math:sqrt(self.x * self.x + self.y * self.y + self.z * self.z) end
end

jk.math.Matrix44 = {}
jk.math.Matrix44.__index = jk.math.Matrix44
_vm:set_metatable(jk.math.Matrix44, {})

function jk.math.Matrix44._create()
	local v = _vm:set_metatable({}, jk.math.Matrix44)
	return v
end

function jk.math.Matrix44:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.math.Matrix44'
	self['_isType.jk.math.Matrix44'] = true
	self.v = _vm:allocate_array(16)
end

function jk.math.Matrix44:_construct0()
	jk.math.Matrix44._init(self)
	return self
end

function jk.math.Matrix44:forZero()
	do return _g.jk.math.Matrix44:forValues({
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0
	}) end
end

function jk.math.Matrix44:forIdentity()
	do return _g.jk.math.Matrix44:forValues({
		1.0,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix44:forTranslate(translateX, translateY, translateZ)
	do return _g.jk.math.Matrix44:forValues({
		1.0,
		0.0,
		0.0,
		translateX,
		0.0,
		1.0,
		0.0,
		translateY,
		0.0,
		0.0,
		1.0,
		translateZ,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix44:forXRotation(angle)
	local c = _g.jk.math.Math:cos(angle)
	local s = _g.jk.math.Math:sin(angle)
	do return _g.jk.math.Matrix44:forValues({
		1.0,
		0.0,
		0.0,
		0.0,
		0.0,
		c,
		-s,
		0.0,
		0.0,
		s,
		c,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix44:forYRotation(angle)
	local c = _g.jk.math.Math:cos(angle)
	local s = _g.jk.math.Math:sin(angle)
	do return _g.jk.math.Matrix44:forValues({
		c,
		0.0,
		s,
		0.0,
		0.0,
		1.0,
		0.0,
		0.0,
		-s,
		0.0,
		c,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix44:forZRotation(angle)
	local c = _g.jk.math.Math:cos(angle)
	local s = _g.jk.math.Math:sin(angle)
	do return _g.jk.math.Matrix44:forValues({
		c,
		-s,
		0.0,
		0.0,
		s,
		c,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix44:forSkew(vx, vy, vz)
	do return _g.jk.math.Matrix44:forValues({
		1.0,
		vx,
		vx,
		0.0,
		vy,
		1.0,
		vy,
		0.0,
		vz,
		vz,
		1.0,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix44:forXRotationWithCenter(angle, centerX, centerY, centerZ)
	local translate = _g.jk.math.Matrix44:forTranslate(centerX, centerY, centerZ)
	local rotate = _g.jk.math.Matrix44:forXRotation(angle)
	local translateBack = _g.jk.math.Matrix44:forTranslate(-centerX, -centerY, -centerZ)
	local translatedRotated = _g.jk.math.Matrix44:multiplyMatrix(translate, rotate)
	do return _g.jk.math.Matrix44:multiplyMatrix(translatedRotated, translateBack) end
end

function jk.math.Matrix44:forYRotationWithCenter(angle, centerX, centerY, centerZ)
	local translate = _g.jk.math.Matrix44:forTranslate(centerX, centerY, centerZ)
	local rotate = _g.jk.math.Matrix44:forYRotation(angle)
	local translateBack = _g.jk.math.Matrix44:forTranslate(-centerX, -centerY, -centerZ)
	local translatedRotated = _g.jk.math.Matrix44:multiplyMatrix(translate, rotate)
	do return _g.jk.math.Matrix44:multiplyMatrix(translatedRotated, translateBack) end
end

function jk.math.Matrix44:forZRotationWithCenter(angle, centerX, centerY, centerZ)
	local translate = _g.jk.math.Matrix44:forTranslate(centerX, centerY, centerZ)
	local rotate = _g.jk.math.Matrix44:forZRotation(angle)
	local translateBack = _g.jk.math.Matrix44:forTranslate(-centerX, -centerY, -centerZ)
	local translatedRotated = _g.jk.math.Matrix44:multiplyMatrix(translate, rotate)
	do return _g.jk.math.Matrix44:multiplyMatrix(translatedRotated, translateBack) end
end

function jk.math.Matrix44:forScale(scaleX, scaleY, scaleZ)
	do return _g.jk.math.Matrix44:forValues({
		scaleX,
		0.0,
		0.0,
		0.0,
		0.0,
		scaleY,
		0.0,
		0.0,
		0.0,
		0.0,
		scaleZ,
		0.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix44:forFlipXY(flipXY)
	if flipXY then
		do return _g.jk.math.Matrix44:forValues({
			1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			-1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0
		}) end
	end
	do return _g.jk.math.Matrix44:forIdentity() end
end

function jk.math.Matrix44:forFlipXZ(flipXZ)
	if flipXZ then
		do return _g.jk.math.Matrix44:forValues({
			1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			-1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0
		}) end
	end
	do return _g.jk.math.Matrix44:forIdentity() end
end

function jk.math.Matrix44:forFlipYZ(flipYZ)
	if flipYZ then
		do return _g.jk.math.Matrix44:forValues({
			-1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0,
			0.0,
			0.0,
			0.0,
			0.0,
			1.0
		}) end
	end
	do return _g.jk.math.Matrix44:forIdentity() end
end

function jk.math.Matrix44:forValues(mv)
	local v = _g.jk.math.Matrix44._construct0(_g.jk.math.Matrix44._create())
	local i = 0
	do
		i = 0
		while i < 16 do
			if i >= #mv then
				v.v[i + 1] = 0.0
			else
				v.v[i + 1] = mv[i + 1]
			end
			do i = i + 1 end
		end
	end
	do return v end
end

function jk.math.Matrix44:multiplyScalar(v, mm)
	do return _g.jk.math.Matrix44:forValues({
		mm.v[0 + 1] * v,
		mm.v[1 + 1] * v,
		mm.v[2 + 1] * v,
		mm.v[3 + 1] * v,
		mm.v[4 + 1] * v,
		mm.v[5 + 1] * v,
		mm.v[6 + 1] * v,
		mm.v[7 + 1] * v,
		mm.v[8 + 1] * v,
		mm.v[9 + 1] * v,
		mm.v[10 + 1] * v,
		mm.v[11 + 1] * v,
		mm.v[12 + 1] * v,
		mm.v[3 + 1] * v,
		mm.v[14 + 1] * v,
		mm.v[15 + 1] * v
	}) end
end

function jk.math.Matrix44:multiplyMatrix(a, b)
	local matrix44 = _g.jk.math.Matrix44._construct0(_g.jk.math.Matrix44._create())
	matrix44.v[0 + 1] = a.v[0 + 1] * b.v[0 + 1] + a.v[1 + 1] * b.v[4 + 1] + a.v[2 + 1] * b.v[8 + 1] + a.v[3 + 1] * b.v[12 + 1]
	matrix44.v[1 + 1] = a.v[0 + 1] * b.v[1 + 1] + a.v[1 + 1] * b.v[5 + 1] + a.v[2 + 1] * b.v[9 + 1] + a.v[3 + 1] * b.v[13 + 1]
	matrix44.v[2 + 1] = a.v[0 + 1] * b.v[2 + 1] + a.v[1 + 1] * b.v[6 + 1] + a.v[2 + 1] * b.v[10 + 1] + a.v[3 + 1] * b.v[14 + 1]
	matrix44.v[3 + 1] = a.v[0 + 1] * b.v[3 + 1] + a.v[1 + 1] * b.v[7 + 1] + a.v[2 + 1] * b.v[11 + 1] + a.v[3 + 1] * b.v[15 + 1]
	matrix44.v[4 + 1] = a.v[4 + 1] * b.v[0 + 1] + a.v[5 + 1] * b.v[4 + 1] + a.v[6 + 1] * b.v[8 + 1] + a.v[7 + 1] * b.v[12 + 1]
	matrix44.v[5 + 1] = a.v[4 + 1] * b.v[1 + 1] + a.v[5 + 1] * b.v[5 + 1] + a.v[6 + 1] * b.v[9 + 1] + a.v[7 + 1] * b.v[13 + 1]
	matrix44.v[6 + 1] = a.v[4 + 1] * b.v[2 + 1] + a.v[5 + 1] * b.v[6 + 1] + a.v[6 + 1] * b.v[10 + 1] + a.v[7 + 1] * b.v[14 + 1]
	matrix44.v[7 + 1] = a.v[4 + 1] * b.v[3 + 1] + a.v[5 + 1] * b.v[7 + 1] + a.v[6 + 1] * b.v[11 + 1] + a.v[7 + 1] * b.v[15 + 1]
	matrix44.v[8 + 1] = a.v[8 + 1] * b.v[0 + 1] + a.v[9 + 1] * b.v[4 + 1] + a.v[10 + 1] * b.v[8 + 1] + a.v[11 + 1] * b.v[12 + 1]
	matrix44.v[9 + 1] = a.v[8 + 1] * b.v[1 + 1] + a.v[9 + 1] * b.v[5 + 1] + a.v[10 + 1] * b.v[9 + 1] + a.v[11 + 1] * b.v[13 + 1]
	matrix44.v[10 + 1] = a.v[8 + 1] * b.v[2 + 1] + a.v[9 + 1] * b.v[6 + 1] + a.v[10 + 1] * b.v[10 + 1] + a.v[11 + 1] * b.v[14 + 1]
	matrix44.v[11 + 1] = a.v[8 + 1] * b.v[3 + 1] + a.v[9 + 1] * b.v[7 + 1] + a.v[10 + 1] * b.v[11 + 1] + a.v[11 + 1] * b.v[15 + 1]
	matrix44.v[12 + 1] = a.v[12 + 1] * b.v[0 + 1] + a.v[13 + 1] * b.v[4 + 1] + a.v[14 + 1] * b.v[8 + 1] + a.v[15 + 1] * b.v[12 + 1]
	matrix44.v[13 + 1] = a.v[12 + 1] * b.v[1 + 1] + a.v[13 + 1] * b.v[5 + 1] + a.v[14 + 1] * b.v[9 + 1] + a.v[15 + 1] * b.v[13 + 1]
	matrix44.v[14 + 1] = a.v[12 + 1] * b.v[2 + 1] + a.v[13 + 1] * b.v[6 + 1] + a.v[14 + 1] * b.v[10 + 1] + a.v[15 + 1] * b.v[14 + 1]
	matrix44.v[15 + 1] = a.v[12 + 1] * b.v[3 + 1] + a.v[13 + 1] * b.v[7 + 1] + a.v[14 + 1] * b.v[11 + 1] + a.v[15 + 1] * b.v[15 + 1]
	do return matrix44 end
end

function jk.math.Matrix44:multiplyVector(a, b)
	local x = a.v[0 + 1] * b.x + a.v[1 + 1] * b.y + a.v[2 + 1] * b.z + a.v[3 + 1] * 1.0
	local y = a.v[4 + 1] * b.x + a.v[5 + 1] * b.y + a.v[6 + 1] * b.z + a.v[7 + 1] * 1.0
	local z = a.v[8 + 1] * b.x + a.v[9 + 1] * b.y + a.v[10 + 1] * b.z + a.v[11 + 1] * 1.0
	do return _g.jk.math.Vector3:create(x, y, z) end
end

jk.math.Matrix33 = {}
jk.math.Matrix33.__index = jk.math.Matrix33
_vm:set_metatable(jk.math.Matrix33, {})

function jk.math.Matrix33._create()
	local v = _vm:set_metatable({}, jk.math.Matrix33)
	return v
end

function jk.math.Matrix33:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.math.Matrix33'
	self['_isType.jk.math.Matrix33'] = true
	self.v = _vm:allocate_array(9)
end

function jk.math.Matrix33:_construct0()
	jk.math.Matrix33._init(self)
	return self
end

function jk.math.Matrix33:forZero()
	do return _g.jk.math.Matrix33:forValues({
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0,
		0.0
	}) end
end

function jk.math.Matrix33:forIdentity()
	do return _g.jk.math.Matrix33:forValues({
		1.0,
		0.0,
		0.0,
		0.0,
		1.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix33:invertMatrix(m)
	local d = m.v[0 + 1] * m.v[4 + 1] * m.v[8 + 1] + m.v[3 + 1] * m.v[7 + 1] * m.v[2 + 1] + m.v[6 + 1] * m.v[1 + 1] * m.v[5 + 1] - m.v[0 + 1] * m.v[7 + 1] * m.v[5 + 1] - m.v[3 + 1] * m.v[1 + 1] * m.v[8 + 1] - m.v[6 + 1] * m.v[4 + 1] * m.v[2 + 1]
	local v = _g.jk.math.Matrix33._construct0(_g.jk.math.Matrix33._create())
	v.v[0 + 1] = (m.v[4 + 1] * m.v[8 + 1] - m.v[7 + 1] * m.v[5 + 1]) / d
	v.v[3 + 1] = (m.v[6 + 1] * m.v[5 + 1] - m.v[3 + 1] * m.v[8 + 1]) / d
	v.v[6 + 1] = (m.v[3 + 1] * m.v[7 + 1] - m.v[6 + 1] * m.v[4 + 1]) / d
	v.v[1 + 1] = (m.v[7 + 1] * m.v[2 + 1] - m.v[1 + 1] * m.v[8 + 1]) / d
	v.v[4 + 1] = (m.v[0 + 1] * m.v[8 + 1] - m.v[6 + 1] * m.v[2 + 1]) / d
	v.v[7 + 1] = (m.v[6 + 1] * m.v[1 + 1] - m.v[0 + 1] * m.v[7 + 1]) / d
	v.v[2 + 1] = (m.v[1 + 1] * m.v[5 + 1] - m.v[4 + 1] * m.v[2 + 1]) / d
	v.v[5 + 1] = (m.v[3 + 1] * m.v[2 + 1] - m.v[0 + 1] * m.v[5 + 1]) / d
	v.v[8 + 1] = (m.v[0 + 1] * m.v[4 + 1] - m.v[3 + 1] * m.v[1 + 1]) / d
	do return v end
end

function jk.math.Matrix33:forTranslate(translateX, translateY)
	do return _g.jk.math.Matrix33:forValues({
		1.0,
		0.0,
		translateX,
		0.0,
		1.0,
		translateY,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix33:forRotation(angle)
	local c = _g.jk.math.Math:cos(angle)
	local s = _g.jk.math.Math:sin(angle)
	do return _g.jk.math.Matrix33:forValues({
		c,
		s,
		0.0,
		-s,
		c,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix33:forRotationWithCenter(angle, centerX, centerY)
	local translate = _g.jk.math.Matrix33:forTranslate(centerX, centerY)
	local rotate = _g.jk.math.Matrix33:forRotation(angle)
	local translateBack = _g.jk.math.Matrix33:forTranslate(-centerX, -centerY)
	local translatedRotated = _g.jk.math.Matrix33:multiplyMatrix(translate, rotate)
	do return _g.jk.math.Matrix33:multiplyMatrix(translatedRotated, translateBack) end
end

function jk.math.Matrix33:forSkew(skewX, skewY)
	do return _g.jk.math.Matrix33:forValues({
		1.0,
		skewX,
		0.0,
		skewY,
		1.0,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix33:forScale(scaleX, scaleY)
	do return _g.jk.math.Matrix33:forValues({
		scaleX,
		0.0,
		0.0,
		0.0,
		scaleY,
		0.0,
		0.0,
		0.0,
		1.0
	}) end
end

function jk.math.Matrix33:forFlip(flipX, flipY)
	local xmat33 = _g.jk.math.Matrix33:forValues({
		1.0,
		0.0,
		0.0,
		0.0,
		-1.0,
		0.0,
		0.0,
		0.0,
		1.0
	})
	local ymat33 = _g.jk.math.Matrix33:forValues({
		-1.0,
		0.0,
		0.0,
		0.0,
		1.0,
		0.0,
		0.0,
		0.0,
		1.0
	})
	if flipX and flipY then
		do return _g.jk.math.Matrix33:multiplyMatrix(xmat33, ymat33) end
	elseif flipX then
		do return xmat33 end
	elseif flipY then
		do return ymat33 end
	end
	do return _g.jk.math.Matrix33:forIdentity() end
end

function jk.math.Matrix33:forValues(mv)
	local v = _g.jk.math.Matrix33._construct0(_g.jk.math.Matrix33._create())
	local i = 0
	do
		i = 0
		while i < 9 do
			if i >= #mv then
				v.v[i + 1] = 0.0
			else
				v.v[i + 1] = mv[i + 1]
			end
			do i = i + 1 end
		end
	end
	do return v end
end

function jk.math.Matrix33:multiplyScalar(v, mm)
	local mat33 = _g.jk.math.Matrix33:forZero()
	mat33.v[0 + 1] = mm.v[0 + 1] * v
	mat33.v[1 + 1] = mm.v[1 + 1] * v
	mat33.v[2 + 1] = mm.v[2 + 1] * v
	mat33.v[3 + 1] = mm.v[3 + 1] * v
	mat33.v[4 + 1] = mm.v[4 + 1] * v
	mat33.v[5 + 1] = mm.v[5 + 1] * v
	mat33.v[6 + 1] = mm.v[6 + 1] * v
	mat33.v[7 + 1] = mm.v[7 + 1] * v
	mat33.v[8 + 1] = mm.v[8 + 1] * v
	do return mat33 end
end

function jk.math.Matrix33:multiplyMatrix(a, b)
	local matrix33 = _g.jk.math.Matrix33._construct0(_g.jk.math.Matrix33._create())
	matrix33.v[0 + 1] = a.v[0 + 1] * b.v[0 + 1] + a.v[1 + 1] * b.v[3 + 1] + a.v[2 + 1] * b.v[6 + 1]
	matrix33.v[1 + 1] = a.v[0 + 1] * b.v[1 + 1] + a.v[1 + 1] * b.v[4 + 1] + a.v[2 + 1] * b.v[7 + 1]
	matrix33.v[2 + 1] = a.v[0 + 1] * b.v[2 + 1] + a.v[1 + 1] * b.v[5 + 1] + a.v[2 + 1] * b.v[8 + 1]
	matrix33.v[3 + 1] = a.v[3 + 1] * b.v[0 + 1] + a.v[4 + 1] * b.v[3 + 1] + a.v[5 + 1] * b.v[6 + 1]
	matrix33.v[4 + 1] = a.v[3 + 1] * b.v[1 + 1] + a.v[4 + 1] * b.v[4 + 1] + a.v[5 + 1] * b.v[7 + 1]
	matrix33.v[5 + 1] = a.v[3 + 1] * b.v[2 + 1] + a.v[4 + 1] * b.v[5 + 1] + a.v[5 + 1] * b.v[8 + 1]
	matrix33.v[6 + 1] = a.v[6 + 1] * b.v[0 + 1] + a.v[7 + 1] * b.v[3 + 1] + a.v[8 + 1] * b.v[6 + 1]
	matrix33.v[7 + 1] = a.v[6 + 1] * b.v[1 + 1] + a.v[7 + 1] * b.v[4 + 1] + a.v[8 + 1] * b.v[7 + 1]
	matrix33.v[8 + 1] = a.v[6 + 1] * b.v[2 + 1] + a.v[7 + 1] * b.v[5 + 1] + a.v[8 + 1] * b.v[8 + 1]
	do return matrix33 end
end

function jk.math.Matrix33:multiplyVector(a, b)
	local x = a.v[0 + 1] * b.x + a.v[1 + 1] * b.y + a.v[2 + 1] * 1.0
	local y = a.v[3 + 1] * b.x + a.v[4 + 1] * b.y + a.v[5 + 1] * 1.0
	do return _g.jk.math.Vector2:create(x, y) end
end

jk.math.Math = {}
jk.math.Math.__index = jk.math.Math
_vm:set_metatable(jk.math.Math, {})

jk.math.Math.M_PI = 3.14159265358979
jk.math.Math.M_PI_2 = 1.5707963267949
jk.math.Math.M_PI_4 = 0.78539816339745
jk.math.Math.M_1_PI = 0.31830988618379
jk.math.Math.M_2_PI = 0.63661977236758
jk.math.Math.M_2_SQRTPI = 1.12837916709551
jk.math.Math.M_SQRT2 = 1.4142135623731
jk.math.Math.M_SQRT1_2 = 0.70710678118655
jk.math.Math.HALF_AWAY_FROM_ZERO = 0
jk.math.Math.HALF_TOWARD_ZERO = 1
jk.math.Math.HALF_NEAREST_EVEN = 2
jk.math.Math.HALF_POSITIVE = 3
jk.math.Math.HALF_NEGATIVE = 4

function jk.math.Math._create()
	local v = _vm:set_metatable({}, jk.math.Math)
	return v
end

function jk.math.Math:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.math.Math'
	self['_isType.jk.math.Math'] = true
end

function jk.math.Math:_construct0()
	jk.math.Math._init(self)
	return self
end

function jk.math.Math:toRadians(d)
	do return _g.jk.math.Math.M_PI / 180 * d end
end

function jk.math.Math:toDegrees(r)
	do return _g.jk.math.Math.M_PI * r / 180 end
end

function jk.math.Math:abs(d)
	_io:write_to_stdout("[jk.math.Math.abs] (Math.sling:154:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:absFloat(f)
	_io:write_to_stdout("[jk.math.Math.absFloat] (Math.sling:184:3): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.math.Math:absInt32(i)
	_io:write_to_stdout("[jk.math.Math.absInt32] (Math.sling:214:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:absInt64(l)
	_io:write_to_stdout("[jk.math.Math.absInt64] (Math.sling:244:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:acos(d)
	_io:write_to_stdout("[jk.math.Math.acos] (Math.sling:274:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:asin(d)
	_io:write_to_stdout("[jk.math.Math.asin] (Math.sling:304:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:atan(d)
	_io:write_to_stdout("[jk.math.Math.atan] (Math.sling:334:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:atan2(y, x)
	_io:write_to_stdout("[jk.math.Math.atan2] (Math.sling:364:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:ceil(d)
	_io:write_to_stdout("[jk.math.Math.ceil] (Math.sling:394:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:cos(d)
	_io:write_to_stdout("[jk.math.Math.cos] (Math.sling:424:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:cosh(d)
	_io:write_to_stdout("[jk.math.Math.cosh] (Math.sling:454:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:exp(d)
	_io:write_to_stdout("[jk.math.Math.exp] (Math.sling:484:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:floor(d)
	_io:write_to_stdout("[jk.math.Math.floor] (Math.sling:514:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:remainder(x, y)
	_io:write_to_stdout("[jk.math.Math.remainder] (Math.sling:543:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:log(d)
	_io:write_to_stdout("[jk.math.Math.log] (Math.sling:573:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:log10(d)
	_io:write_to_stdout("[jk.math.Math.log10] (Math.sling:603:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:max(d1, d2)
	_io:write_to_stdout("[jk.math.Math.max] (Math.sling:639:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:maxFloat(f1, f2)
	_io:write_to_stdout("[jk.math.Math.maxFloat] (Math.sling:675:3): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.math.Math:maxInt32(i1, i2)
	_io:write_to_stdout("[jk.math.Math.maxInt32] (Math.sling:711:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:maxInt64(l1, l2)
	_io:write_to_stdout("[jk.math.Math.maxInt64] (Math.sling:747:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:min(d1, d2)
	_io:write_to_stdout("[jk.math.Math.min] (Math.sling:783:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:minFloat(f1, f2)
	_io:write_to_stdout("[jk.math.Math.minFloat] (Math.sling:819:3): Not implemented" .. "\n")
	do return 0.0 end
end

function jk.math.Math:minInt32(i1, i2)
	_io:write_to_stdout("[jk.math.Math.minInt32] (Math.sling:855:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:minInt64(l1, l2)
	_io:write_to_stdout("[jk.math.Math.minInt64] (Math.sling:891:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:pow(x, y)
	_io:write_to_stdout("[jk.math.Math.pow] (Math.sling:921:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:round(n)
	_io:write_to_stdout("[jk.math.Math.round] (Math.sling:956:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:roundWithMode(d, mode)
	local fd = _g.jk.math.Math:floor(d)
	local dp = d - fd
	if dp < 0.5 then
		do return fd end
	end
	if dp > 0.5 then
		do return _g.jk.math.Math:ceil(d) end
	end
	if mode == _g.jk.math.Math.HALF_AWAY_FROM_ZERO then
		if d < 0 then
			do return fd end
		end
		do return _g.jk.math.Math:ceil(d) end
	end
	if mode == _g.jk.math.Math.HALF_TOWARD_ZERO then
		if d < 0 then
			do return _g.jk.math.Math:ceil(d) end
		end
		do return fd end
	end
	if mode == _g.jk.math.Math.HALF_NEAREST_EVEN then
		if _util:convert_to_integer(_util:convert_to_integer(fd) % 2) == 0 then
			do return fd end
		end
		do return _g.jk.math.Math:ceil(d) end
	end
	if mode == _g.jk.math.Math.HALF_POSITIVE then
		do return _g.jk.math.Math:ceil(d) end
	end
	if mode == _g.jk.math.Math.HALF_NEGATIVE then
		do return fd end
	end
	do return d end
end

function jk.math.Math:sin(d)
	_io:write_to_stdout("[jk.math.Math.sin] (Math.sling:1056:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:sinh(d)
	_io:write_to_stdout("[jk.math.Math.sinh] (Math.sling:1086:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:sqrt(d)
	_io:write_to_stdout("[jk.math.Math.sqrt] (Math.sling:1116:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:tan(d)
	_io:write_to_stdout("[jk.math.Math.tan] (Math.sling:1146:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:tanh(d)
	_io:write_to_stdout("[jk.math.Math.tanh] (Math.sling:1176:3): Not implemented" .. "\n")
	do return 0 end
end

function jk.math.Math:computeQuinticInEasing(t, b, c, d)
	local x = t / d
	do return c * x * x * x * x * x + b end
end

function jk.math.Math:computeQuinticOutEasing(t, b, c, d)
	local x = t / d - 1
	do return c * (x * x * x * x * x + 1) + b end
end

function jk.math.Math:computeQuinticInOutEasing(t, b, c, d)
	local x = t / d / 2
	if x < 1.0 then
		do return c / 2 * x * x * x * x * x + b end
	end
	x = x - 2
	do return c / 2 * (x * x * x * x * x + 2) + b end
end
