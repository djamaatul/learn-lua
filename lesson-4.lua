local current = os.date("%d-%m-%Y %H:%M:%S")
print(current)
-- print(os.clock())

local specificDate = os.time({
	year = 2001,
	month = 05,
	day = 02,
})

print(specificDate)

print(os.difftime(os.time(), specificDate) .. "second")

print(string.format("hello \r  %s age %d \n okk", "dika", 23))
