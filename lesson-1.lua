local hi = require "hi";

local helloWorld = "Hello World"
local name = 'dika'
address = [[
    Jalan Rajawali No.312 RT.032 RW.016, Perumahan/Kelurahan Sindangkasih
    Kec/Kab Majalengka
]]

print(number) --nil cos assigment below

number = 1 --global variable
local isMale = true --local variable

print(number) --1

hi.hi('Hi,', name)

print(address)

x, y, z = '1', '2' --z is nil
print(x..y,z)

--[[
    function f(a)
        return a;
    end
    a, b = pcall(f, 'a')

    a = true, b = 'a'

]]--

print("Enter your age: ")
status, value = pcall(function() return io.read("*number") end)

a = value

if a == nil then 
    -- error("Age must be number")
    -- return os.exit();
    a = 0
elseif a == 1 then
    print('a is '..a)
end

print("Your year birth is " .. os.date("%Y") - a)

print(true and true, not true, true or false)

print(1 >= 0, 1 == 2)

print(1 ~= 2) -- equevalent 1 != 2

local obj = {
    a = 'a'
} --table

obj.b = 'b'

print(obj['a'], obj.b)

local lurik = {'Senin', 'Selasa' , [1] = 'Rabu', [3] = 'Kamis'} --valid first [1] = 'Senin'

print(lurik[1]..lurik[2]..lurik[3]) --start index 1 output: senin selasa

for i,v in ipairs(lurik) do
    print('for in', i, v)
end

local i = 0
while (i <= 5)do
    if i == 2 then break end;
    print('while'..i);
    i = i + 1
end

for i =0,5 do
    print('for' .. i)
end

do
    print(x)
    local x = 2
    print(x)
end

function multipleReturn()
    return 1, 2
end

x,y = multipleReturn()

print(x, y)

-- print the first non-empty line
repeat
  line = io.read()
until line ~= ""
print(line)

print 'dika'


function PrintTable(table, ...)
    print(table.key)
    for key,value in ipairs(arg) do
        print(key, value)
    end
end

PrintTable({
    ['key'] = 'value1'
}, 'arg1', 'arg2') 

PrintTable { --named parameter
    key = '123'
}

local tab = { {key= 2}, {key= 1} }
table.sort(tab, function(a,b)
    return a.key <= b.key
    end
)

print('sorted table')
for i,v in ipairs(tab) do
    print('for in', i, v.key)
end

function call(callback)
    callback();
end

call(function() print('Hello from callback') end)

dofile("hi.lua")
--
-- loadstring('print("Hello")')()

if(1) then print(true) end --all number is true also empty srtring
if(nil) then print(true) else print(false) end --falsy

local tabl = {a = 1}

local tabl2 = tabl

tabl.a = 2 -- ref to tabl2

print(tabl2.a)


co = coroutine.create(function()
    for i = 1,10 do
        print(i)
    end
end)

print(coroutine.resume(co))
