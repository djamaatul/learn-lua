function Hello()
  print(1)
  coroutine.yield()
  print(2)
  coroutine.yield()
  print(2)
  coroutine.yield()
end

x = coroutine.create(Hello)

a = coroutine.resume(x)
print(a)


a = coroutine.resume(x)
print(a)

a = coroutine.resume(x)
print(a)

a = coroutine.resume(x)
print(a)
