Random = {}
Random.__index = Random

local function NormalizeNumber(num)
	return num % 0x80000000
end

local function RandomizeSeed(seed, object)
	if not seed then
		seed = NormalizeNumber(os.time())
	end

	object[2] = object[4]
	object[5] = NormalizeNumber(seed)

  return object
end

function Random:NextNumber(floor, ceil)
	local rand1, rand2 = self[3], self[1] * self[5] + self[2]
	local rand3 = rand2 % rand1

	self[5] = rand3
	self[2] = math.floor(rand2 / rand1)

	if not floor then
		return rand3 / 0x10000
	elseif not ceil then
		if floor == 0 then
			return rand3
		else
			return 1 + rand3 % floor
		end
	else
		return floor + rand3 % ceil - floor + 1
	end
end

function Random:NextInteger(floor, ceil)
	return math.floor(self:NextNumber(floor, ceil))
end

local function CopyTable(Table)
	local clone = {}
	for i, v in pairs(Table) do
		if type(v) == "table" then
			clone[i] = CopyTable(v)
		else
			clone[i] = v
		end
	end

	return clone
end

function Random:Clone()
	return setmetatable(CopyTable(self), Random)
end

function Random.new(seed)
	local object = setmetatable({}, Random)

	object[1], object[2], object[3] = 1103515245, 12345, 0x10000
	object[4] = object[2]
	object = RandomizeSeed(seed, object)

	return object
end

return Random
