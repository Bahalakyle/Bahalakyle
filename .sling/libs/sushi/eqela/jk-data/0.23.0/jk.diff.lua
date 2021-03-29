jk = jk or {}

jk.diff = jk.diff or {}

jk.diff.UnifiedDiff = {}
jk.diff.UnifiedDiff.__index = jk.diff.UnifiedDiff
_vm:set_metatable(jk.diff.UnifiedDiff, {})

function jk.diff.UnifiedDiff._create()
	local v = _vm:set_metatable({}, jk.diff.UnifiedDiff)
	return v
end

function jk.diff.UnifiedDiff:_init()
	self._isClassInstance = true
	self._qualifiedClassName = self._qualifiedClassName or 'jk.diff.UnifiedDiff'
	self['_isType.jk.diff.UnifiedDiff'] = true
end

function jk.diff.UnifiedDiff:_construct0()
	jk.diff.UnifiedDiff._init(self)
	return self
end

function jk.diff.UnifiedDiff:backtrack(lcs, olines, nlines, i, j)
	if i == 0 or j == 0 then
		do return {} end
	end
	do
		local ocount = _g.jk.lang.Vector:getSize(olines)
		if olines[i - 1 + 1] == nlines[j - 1 + 1] then
			local v = _g.jk.diff.UnifiedDiff:backtrack(lcs, olines, nlines, i - 1, j - 1)
			do _g.jk.lang.Vector:append(v, olines[i - 1 + 1]) end
			do return v end
		end
		if lcs[i + (j - 1) * (ocount + 1) + 1] > lcs[i - 1 + j * (ocount + 1) + 1] then
			do return _g.jk.diff.UnifiedDiff:backtrack(lcs, olines, nlines, i, j - 1) end
		end
		do return _g.jk.diff.UnifiedDiff:backtrack(lcs, olines, nlines, i - 1, j) end
	end
end

function jk.diff.UnifiedDiff:execute(fileName, original, modified)
	if not (original ~= nil) then
		do return nil end
	end
	if not (modified ~= nil) then
		do return nil end
	end
	do
		local olines = _g.jk.lang.String:split(original, 10, 0)
		local nlines = _g.jk.lang.String:split(modified, 10, 0)
		local ocount = _g.jk.lang.Vector:getSize(olines)
		local ncount = _g.jk.lang.Vector:getSize(nlines)
		local lcs = _vm:allocate_array((ocount + 1) * (ncount + 1))
		do
			local n = 0
			while n < ocount + 1 do
				lcs[n + 1] = 0
				do n = n + 1 end
			end
		end
		do
			local n = 0
			while n < ncount + 1 do
				lcs[n * (ocount + 1) + 1] = 0
				do n = n + 1 end
			end
		end
		do
			local i = 1
			while i < ocount + 1 do
				do
					local j = 1
					while j < ncount + 1 do
						if olines[i - 1 + 1] == nlines[j - 1 + 1] then
							lcs[i + j * (ocount + 1) + 1] = lcs[i - 1 + (j - 1) * (ocount + 1) + 1] + 1
						elseif lcs[i + (j - 1) * (ocount + 1) + 1] > lcs[i - 1 + j * (ocount + 1) + 1] then
							lcs[i + j * (ocount + 1) + 1] = lcs[i + (j - 1) * (ocount + 1) + 1]
						else
							lcs[i + j * (ocount + 1) + 1] = lcs[i - 1 + j * (ocount + 1) + 1]
						end
						do j = j + 1 end
					end
				end
				do i = i + 1 end
			end
		end
		do
			local lcsLines = _g.jk.diff.UnifiedDiff:backtrack(lcs, olines, nlines, ocount, ncount)
			local op = 0
			local np = 0
			local sameCounter = 0
			local blocksb = nil
			local blockopc = 0
			local blocknpc = 0
			local blockolines = 0
			local blocknlines = 0
			local msb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
			do msb:appendString("diff -u a/" .. _g.jk.lang.String:safeString(fileName) .. " b/" .. _g.jk.lang.String:safeString(fileName) .. "\n") end
			do
				local timeNow = _g.jk.time.SystemClock:asDateTimeLocal()
				local timeString = _g.jk.lang.String:safeString(timeNow:toStringDateTime()) .. ".000000000 +0000"
				do msb:appendString("--- a/" .. _g.jk.lang.String:safeString(fileName) .. " " .. _g.jk.lang.String:safeString(timeString) .. "\n") end
				do msb:appendString("+++ b/" .. _g.jk.lang.String:safeString(fileName) .. " " .. _g.jk.lang.String:safeString(timeString) .. "\n") end
				do
					local hdr = msb:toString()
					msb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
					do
						local lp = 0
						local lcsLinesCount = _g.jk.lang.Vector:getSize(lcsLines)
						while true do
							local line = nil
							if lp < lcsLinesCount then
								line = lcsLines[lp + 1]
							else
								line = nil
							end
							do lp = lp + 1 end
							if line == nil and op >= ocount and np >= ncount then
								do break end
							end
							do
								local changes = nil
								local oop = op
								local onp = np
								while op < ocount and not (olines[op + 1] == line) do
									if not (changes ~= nil) then
										changes = {}
									end
									do _g.jk.lang.Vector:append(changes, "-" .. _g.jk.lang.String:safeString(olines[op + 1])) end
									do op = op + 1 end
								end
								while np < ncount and not (nlines[np + 1] == line) do
									if not (changes ~= nil) then
										changes = {}
									end
									do _g.jk.lang.Vector:append(changes, "+" .. _g.jk.lang.String:safeString(nlines[np + 1])) end
									do np = np + 1 end
								end
								if changes ~= nil then
									sameCounter = 0
									if not (blocksb ~= nil) then
										local opc = oop - 3
										if opc < 0 then
											opc = 0
										end
										do
											local npc = onp - 3
											if npc < 0 then
												npc = 0
											end
											blocksb = _g.jk.lang.StringBuilder._construct0(_g.jk.lang.StringBuilder._create())
											blockopc = opc + 1
											blocknpc = npc + 1
											blockolines = 0
											blocknlines = 0
											do
												local n = opc
												while n < oop do
													do blocksb:appendString(" " .. _g.jk.lang.String:safeString(olines[n + 1]) .. "\n") end
													do blockolines = blockolines + 1 end
													do n = n + 1 end
												end
											end
										end
									end
									if changes ~= nil then
										local n2 = 0
										local m = _g.jk.lang.Vector:getSize(changes)
										do
											n2 = 0
											while n2 < m do
												local change = changes[n2 + 1]
												if change ~= nil then
													do blocksb:appendString(change) end
													do blocksb:appendCharacter(10) end
													if _g.jk.lang.String:startsWith(change, "+", 0) then
														do blocknlines = blocknlines + 1 end
													elseif _g.jk.lang.String:startsWith(change, "-", 0) then
														do blocknlines = blocknlines - 1 end
														do blockolines = blockolines + 1 end
													end
												end
												do n2 = n2 + 1 end
											end
										end
									end
									changes = nil
								end
								do sameCounter = sameCounter + 1 end
								if sameCounter > 3 then
									if blocksb ~= nil then
										if hdr ~= nil then
											do msb:appendString(hdr) end
											hdr = nil
										end
										do msb:appendString("@@ -" .. _g.jk.lang.String:forInteger(blockopc) .. "," .. _g.jk.lang.String:forInteger(blockolines) .. " +" .. _g.jk.lang.String:forInteger(blocknpc) .. "," .. _g.jk.lang.String:forInteger(blockolines + blocknlines) .. " @@\n") end
										do msb:appendString(blocksb:toString()) end
										blocksb = nil
									end
								end
								if blocksb ~= nil and op < ocount then
									do blocksb:appendString(" " .. _g.jk.lang.String:safeString(olines[op + 1]) .. "\n") end
									do blockolines = blockolines + 1 end
								end
								do op = op + 1 end
								do np = np + 1 end
							end
						end
						if blocksb ~= nil then
							if hdr ~= nil then
								do msb:appendString(hdr) end
								hdr = nil
							end
							do msb:appendString("@@ -" .. _g.jk.lang.String:forInteger(blockopc) .. "," .. _g.jk.lang.String:forInteger(blockolines) .. " +" .. _g.jk.lang.String:forInteger(blocknpc) .. "," .. _g.jk.lang.String:forInteger(blockolines + blocknlines) .. " @@\n") end
							do msb:appendString(blocksb:toString()) end
							blocksb = nil
						end
						do return msb:toString() end
					end
				end
			end
		end
	end
end
