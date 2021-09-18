local SuperClass = {}
SuperClass.__index = SuperClass

--// Added by my boyfriend
local mathfloor = math and math.floor or function(n)
    return n - n % 1
end

local function NormalizeNumber(num)
	return num % 0x80000000
end

local function RandomizeSeed(seed, object)
	if not seed then
		seed = os.time() * 100
	end

	object[2] = object[4]
	object[5] = NormalizeNumber(seed)

	return object
end

local function CopyTable(Table)
	local clone = {}

	for i, v in pairs(Table) do
		clone[i] = v
	end

	return clone
end

function SuperClass:NextNumber(floor, ceil)
	local rand1, rand2 = self[3], self[1] * self[5] + self[2]
	local rand3 = rand2 % rand1

	self[5] = rand3
	self[2] = mathfloor(rand2 / rand1)

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

function SuperClass:NextInteger(floor, ceil)
	return mathfloor(self:NextNumber(floor, ceil))
end

function SuperClass:Clone()
	return setmetatable(CopyTable(self), SuperClass)
end

local Random = {}

function Random.new(seed)
	local object = setmetatable({}, SuperClass)

	object[1], object[2], object[3] = 1103515245, 12345, 0x10000
	object[4] = object[2]
	object = RandomizeSeed(seed, object)

	return object
end

return Random
