function love.load()
	x = 0 		-- starting position of rectangle horizontal
	y = 0		-- starting position of rectangle vertical
	speed = 10	-- how fast the rectangle should travel
end

function love.update(dt)
	if love.keyboard.isDown('w') and y > 0 then
		y = y - speed
	end
	if love.keyboard.isDown('a') and x > 0 then
		x = x - speed
	end
	if love.keyboard.isDown('s') and y < 600 then
		y = y + speed
	end
	if love.keyboard.isDown('d') and x < 800 then
		x = x + speed
	end
end

function love.draw()
	love.graphics.setColor(1, 0, 0) -- set colour to red
	love.graphics.rectangle("fill", x, y, 100, 100)
end
