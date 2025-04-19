_G.love = require("love")
require("conf")

local FPS = 1000000

Box = {
	width = 50,
	height = 50,

	position = {
		x = 0,
		y = 0,
	},

  color = {0,0,0}
}

function Box:new(o)
	o = o or Box
	setmetatable(o, Box)
	o.__index = Box
	return o
end

function Box:getRandomHex()
  return math.random()
end

function Box:changeColor(color)
  if(color ~= nil) then
      self.color = color
    return
  end
  self.color = {self:getRandomHex(),self:getRandomHex(), self:getRandomHex()}
end

function Box:moveVertial(offset)
	self.position.y = self.position.y + (offset or 1)
end

function Box:moveHorizontal(offset)
	self.position.x = self.position.x + (offset or 1)
end

function Box:render()
	love.graphics.setColor(unpack(self.color))
	love.graphics.rectangle("fill", self.position.x, self.position.y, self.width,self.height)
end

function love.load()
	time = 0
	count = 0

	box1 = Box:new()

	directionX = "forward"
end

function love.update(dt) -- run 100ms
	time = time + 0.1
	windowWidth, windowHeight = love.graphics.getDimensions()

	if (box1.position.x + (box1.width/2)) >= windowWidth then
    Box:changeColor()
		directionX = "reverse"
	end
	if box1.position.x <= 0 then
    Box:changeColor()
		directionX = "forward"
	end

	if (box1.position.y + (box1.height/2)) >= windowHeight then
    Box:changeColor()
		directionY = "reverse"
	end
	if box1.position.y <= 0 then
    Box:changeColor()
		directionY = "forward"
	end

	if directionX == "forward" then
		box1:moveHorizontal(1)
	else
		box1:moveHorizontal(-1)
	end

	if directionY == "forward" then
		box1:moveVertial(1)
	else
		box1:moveVertial(-1)
	end
end

function love.draw()
	if time <= (100 / FPS) then
		return
	end
	count = count + 1

	love.graphics.setColor(1, 1, 1)
	love.graphics.print("FPS: " .. count)

  box1:render()
	time = 0
end
