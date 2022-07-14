function love.load()
	colour = love.graphics.setColor
	line = love.graphics.line
	red = {1,0,0,1}
	green = {0,1,0,1}
	blue = {0,0,1,1}
end

function love.update(dt)
    
end

function love.draw()
	-- love.graphics.line( x1, y1, x2, y2, ... ) You can continue passing point positions to draw a polyline.
	colour(green)
	love.graphics.line(0, 20, 800, 20)
	colour(red)
	line(200,50, 400,50, 500, 250, 100,250, 200,50)   -- last pair is a repeat to complete the trapezoid
	
	local mx, my = love.mouse.getPosition()
	local windowWidth, windowHeight = love.graphics.getDimensions()
	colour(blue)
	love.graphics.line(windowWidth/2, windowHeight/2, mx, my)
end
