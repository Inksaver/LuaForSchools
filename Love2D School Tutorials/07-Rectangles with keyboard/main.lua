function love.load()
    rect = {x = 0, y = 0, w = 100, h = 100, speed = 10}
end

function love.update(dt)
    if love.keyboard.isDown('w') then
        rect.y = rect.y - rect.speed
    end
    if love.keyboard.isDown('a') then
        rect.x = rect.x - rect.speed
    end
    if love.keyboard.isDown('s') then
        rect.y = rect.y + rect.speed
    end
    if love.keyboard.isDown('d') then
        rect.x = rect.x + rect.speed
    end
    if rect.x > 800 - rect.w then
        rect.x = 800 - rect.w
    end
    if rect.x < 0 then
        rect.x = 0
    end
    if rect.y > 600 - rect.h then
        rect.y = 600 - rect.h
    end
    if rect.y < 0 then
        rect.y = 0
    end
end

function love.draw()
    love.graphics.setBackgroundColor(1, 1, 1, 1)
    love.graphics.setColor(1, 0, 0) -- set colour to red
    love.graphics.rectangle("fill", rect.x, rect.y, rect.w, rect.h)
end
