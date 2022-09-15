local WIDTH = love.graphics.getWidth()
local HEIGHT = love.graphics.getHeight()
function love.load()
    rect1 = 
    {
        x = 0, 
        y = 0,
        w = 100,
        h = 100,
        speed = 10
    }
	key       = love.keyboard.isDown 
    colour    = love.graphics.setColor
    rectangle = love.graphics.rectangle
    red       = {1, 0, 0}
    green     = {0, 1, 0}
    blue      = {0, 0, 1}
    yellow    = {1, 1, 0}
end

function love.update(dt)
	-- combining selections to check for key press and ability to move
    if (key('w') or key('up')) and rect1.y > 0 then
        rect1.y = rect1.y - rect1.speed
		colour(blue) -- set colour to blue
    end
    if (key('a')  or key('left')) and rect1.x > 0 then
        rect1.x = rect1.x - rect1.speed
		colour(red) -- set colour to red
    end
    if (key('s') or key('down')) and rect1.y < HEIGHT - rect1.h then
        rect1.y = rect1.y + rect1.speed
		colour(green) -- set colour to green
    end
    if (key('d') or key('right')) and rect1.x < WIDTH - rect1.w then
        rect1.x = rect1.x + rect1.speed
		colour(yellow) -- set colour to yellow
    end
end

function love.draw()
    rectangle("fill", rect1.x, rect1.y, rect1.w, rect1.h)
end
