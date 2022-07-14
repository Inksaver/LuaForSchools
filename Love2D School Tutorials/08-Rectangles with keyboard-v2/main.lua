local WIDTH = love.graphics.getWidth()
local HEIGHT = love.graphics.getHeight()
function love.load()
	rect1 = {}
	rect1.x = 0 
	rect1.y = 0
	rect1.w = 100
	rect1.h = 100
	rect1.speed = 10
end

function love.update(dt)
	if (love.keyboard.isDown('w') or love.keyboard.isDown('up')) and rect1.y > 0 then
		rect1.y = rect1.y - rect1.speed
	end
	if (love.keyboard.isDown('a')  or love.keyboard.isDown('left')) and rect1.x > 0 then
		rect1.x = rect1.x - rect1.speed
	end
	if (love.keyboard.isDown('s') or love.keyboard.isDown('down')) and rect1.y < HEIGHT - rect1.h then
		rect1.y = rect1.y + rect1.speed
	end
	if (love.keyboard.isDown('d') or love.keyboard.isDown('right')) and rect1.x < WIDTH - rect1.w then
		rect1.x = rect1.x + rect1.speed
	end
end

function love.draw()
	love.graphics.setColor(1, 0, 0, 1) -- set colour to red
	love.graphics.rectangle("fill", rect1.x, rect1.y, rect1.w, rect1.h)
end
