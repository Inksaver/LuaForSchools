local WIDTH = love.graphics.getWidth()
local HEIGHT = love.graphics.getHeight()
function love.load()
    -- rect table declared in a more compact form
    rect1 = 
    {
        x = 0, 
        y = 0,
        w = 100,
        h = 100,
        speed = 10
    }
    -- assign functions to variables
    key = love.keyboard.isDown 
    colour = love.graphics.setColor
    rectangle = love.graphics.rectangle
end

function love.update(dt)
    -- combining selections to check for key press and ability to move
    if (key('w') or key('up')) and rect1.y > 0 then
        rect1.y = rect1.y - rect1.speed
    end
    if (key('a')  or key('left')) and rect1.x > 0 then
        rect1.x = rect1.x - rect1.speed
    end
    if (key('s') or key('down')) and rect1.y < HEIGHT - rect1.h then
        rect1.y = rect1.y + rect1.speed
    end
    if (key('d') or key('right')) and rect1.x < WIDTH - rect1.w then
        rect1.x = rect1.x + rect1.speed
    end
end

function love.draw()
    colour(1, 0, 0, 1) -- set colour to red
    rectangle("fill", rect1.x, rect1.y, rect1.w, rect1.h)
end
