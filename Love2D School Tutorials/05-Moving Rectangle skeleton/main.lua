function love.load()	
	rect = {x = 0, y = 50, w = 100, h = 100, speed = 5}
end

function love.update(dt)

end

function love.draw()
	love.graphics.setColor(0,1,0,1)
	love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
end
