function p(num)
    coroutine.yield(num)
end


for i = 1,10 do
    co = coroutine.create(function ()
                p(i)
    end)


    s, num = coroutine.resume(co)

    print(num);
end


Human = function(self)
    return {
        name = self.name
    }
end

function hi(obj)
    print('Hi ' ..obj.name)
end

local x = Human{
    name = 'Dika'
}
hi(x)

function printf(fmt, ...)
  result = string.format(fmt, ...)
  print(result)
end

Animal = {
name = nil,
hp = 100,
power = 10
}


function Animal.new(self)
    result = Animal
    result.name = self.name
   return result
end


function Animal:New(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self -- using this for read return data as Animal or using o = Animal
   return o
end


function Animal:woof() --method using :
    printf(
[[
name: %s
hp: %d
power: %d
]], self.name, self.hp, self.power)

end

function Animal:attack(opponent)
    opponent.hp = opponent.hp - self.power
end


local cat = Animal.new{ --function using dot
    name= 'Nasi'
}

local cat2 = Animal:New{
    name= 'Koneng'
}

cat2:attack(cat) --method using : to get self
cat2:attack(cat) --method using : to get self
cat2:attack(cat) --method using : to get self
cat2:attack(cat) --method using : to get self

cat:woof()
