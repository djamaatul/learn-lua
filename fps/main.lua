require "love"

FPS = 30
time = 0

function love.load()
end

function love.update(dt)
  time = time + dt
end

function love.draw()

  if(time >= (100/FPS)) then
    love.graphics.setColor(1,1,1)
    love.graphics.print("Hello World")
    time = 0
  end
end

