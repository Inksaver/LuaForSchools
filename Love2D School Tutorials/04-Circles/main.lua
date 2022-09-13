function love.load()

end

function love.update(dt)
    
end

function love.draw()
    love.graphics.setBackgroundColor(1, 1, 1, 1)
    -- love.graphics.circle( mode, x, y, radius )
    -- draw a blue circle at 600, 200 with a radius of 100
    love.graphics.setColor(0, 0, 1, 1) -- set colour to blue
    love.graphics.circle("fill", 600, 200, 100)
	
	
    -- love.graphics.arc( drawmode, x, y, radius, angle1, angle2, segments )
    -- Draws a filled or unfilled arc at position (x, y). The arc is drawn from angle1 to angle2 in radians
    -- draw red 1/4 circle at  200,200 radius 100 clook position 12 to 3
    love.graphics.setColor(1, 0, 0, 1) -- set colour to red
    love.graphics.arc( "fill", 200, 200, 100, 0, math.pi/2)
	
    -- draw green 1/4 circle at  200,200 radius 100 clock poition 9 to 12
    love.graphics.setColor(0, 1, 0, 1) -- set colour to green
    love.graphics.arc( "fill", 200, 200, 100, -3.142, -1.5)
	
    -- draw pacman
    love.graphics.setColor(1, 1, 0, 1) -- set colour to yellow
    pacwidth = math.pi / 6 -- size of his mouth
    love.graphics.arc( "fill", 400, 300, 100, pacwidth, (math.pi * 2) - pacwidth )
	
    -- draw ellipse
    -- love.graphics.ellipse( mode, x, y, radiusx, radiusy, segments )
    love.graphics.setColor(1, 1, 1)
    love.graphics.ellipse("fill", 600, 400, 75, 50, 100) -- Draw white ellipse with 100 segments.
    love.graphics.setColor(1, 0, 0)
    love.graphics.ellipse("fill", 600, 520, 75, 50, 10)   -- Draw red ellipse with 10 segments.
end
