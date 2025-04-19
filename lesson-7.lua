function printHelloWorld()
	for i = 1, 1000 do
		print("Hello World")
		coroutine.yield()
	end
end

-- Create a coroutine
co = coroutine.create(printHelloWorld)

-- Resume the coroutine 1000 times
for i = 1, 1000 do
	coroutine.resume(co)
end

