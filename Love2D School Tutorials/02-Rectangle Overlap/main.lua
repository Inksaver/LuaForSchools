function love.load()
    -- set variables for 2 rectangles
    x1 = 100 
    y1 = 100
    w1 = 100
    h1 = 100

    x2 = 150
    y2 = 150
    w2 = 100
    h2 = 100
end

function love.update(dt)
    
end

function love.draw()
    love.graphics.setBackgroundColor(1, 1, 1, 1)
    love.graphics.setColor(1, 0, 0, 1) -- set colour to red
    love.graphics.rectangle("fill", x1, y1, w1, h1)
    love.graphics.setColor(0, 1, 0, 0.7) -- set colour to green, transparency to 50%
    love.graphics.rectangle("fill", x2, y2, w2, h2)
end
