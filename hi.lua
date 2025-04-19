local M = {}
M.hi = function(hello, name)
    print(hello .. " my name is " .. name)
end

print("Hi.lua")
-- return M

obj = {key = "value"}

arr = {{"1 asd", "2"}}

print(arr[1][1])

func = function(o, ...)
  print(o.name)

  for _, v in pairs(arg)do
    print(v)
  end

end

func({name = "Func 1"}, "arg1", "arg2")

function func2(cb)
  cb()
end

func2(function()
  print("Hello")
end)

if 1 and 0 then
  print("not equal")
end
x = {"15", name = 2, "12"}
for k, v in pairs(x) do
  print(k, v)
end

Animal = {}

function Animal:new(obj)
  local o = {
    name = obj.name,
    age = obj.age
  }
  setmetatable(o, self)
  self.__index =  self
  self.__add = function(left, right)
    return left.age + right.age
  end

  self.__eq = function(left, right)
    print("Execute")
    return left.age == right.age
  end
  return o
end

function Animal:woof()
  print("woof")
end

cat = Animal:new{ name = "Cat", age = 2 }
dog = Animal:new{ name = "Dog", age = 2 }

print(dog + cat )
print(dog == cat)

function len(obj)
  n = 0
  for _,_ in pairs(obj) do n = n + 1 end
  return n
end

print(#{"A"}, #"as", len{k ="v", h = "a"})
