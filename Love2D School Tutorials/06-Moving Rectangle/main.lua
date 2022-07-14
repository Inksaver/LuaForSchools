function love.load()
	rect = {x = 0, y = 50, w = 100, h = 100, speed = 5}
	circle = {x = 25, y = 300, r = 50, speed = 7}
end

function love.update(dt)
    rect.x = rect.x + rect.speed
	
	if rect.x > 800 - rect.w then
		rect.speed = rect.speed * -1
	end
	if rect.x < 0 then
		rect.speed = math.abs(rect.speed)
	end
	
	circle.x = circle.x + circle.speed
	if circle.x > 800 - circle.r then
		circle.speed = circle.speed * -1
	end
	if circle.x < circle.r -1 then
		circle.speed = math.abs(circle.speed)
	end
end

function love.draw()
	love.graphics.setColor(0,1,0,1)
	love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
	love.graphics.setColor(0,0,1,1)
	love.graphics.circle("fill", circle.x, circle.y, circle.r)
end
