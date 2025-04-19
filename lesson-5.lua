local file = io.open("hello.text", "w")

print(string.reverse("Hello world"))

if file == nil then
	os.exit(1)
end

file:write("Hello World")

file:close()
a, b, c = table.unpack({ "hello", "world", "!" })

print(a, b, c)
