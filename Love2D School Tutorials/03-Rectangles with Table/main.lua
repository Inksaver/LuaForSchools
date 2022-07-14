function love.load()
	-- set variables for rectangle in a table
	rect1 = {}
	rect1.x = 100 
	rect1.y = 100
	rect1.w = 100
	rect1.h = 100
end

function love.update(dt)
    rect1.x = rect1.x + 1
end

function love.draw()
	love.graphics.setColor(1, 0, 0, 1) -- set colour to red
	love.graphics.rectangle("fill", rect1.x, rect1.y, rect1.w, rect1.h)
end
