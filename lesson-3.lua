Stack = {}

function Stack:new(o)
	o = o or {}

	setmetatable(o, self)

	self.__index = self

	self.__add = function(left, right)
		return #left + #right
	end

	self.__eq = function(left, right)
		return #left == #right
	end

	return o
end

function Stack:push(str)
	table.insert(self, str) -- or
	-- self[#self +1] = str
end

function Stack:pop()
	-- self[#self] = nil --or
	table.remove(self, #self)
end

local stack = Stack:new({})

stack:push("hello")
stack:push("world")

print(#stack)

stack:pop()

print(#stack)

print("stack + stack = " .. stack + Stack:new({ "hola", "bonjour" }))
print("stack == stack = ", stack == Stack:new({ "hola" }))

print(table.unpack({ "hello", "world" }))

local Queue = {
	__index = function(_, key)
		return key
	end,
	-- __call = function(self, key)
	--     return key
	-- end
}

local queue = setmetatable({}, Queue)

print(queue["100"])

print(string.format("%q %s", "hello", "okk"))

local co = coroutine.create(function()
	for i = 1, 20 do
		coroutine.yield(i)
	end
end)

for _ = 1, 20 do
	local _, v = coroutine.resume(co)

	print(v)
end
