function love.load()
    player = {}
    player.x = 400
    player.y = 200
    player.speed = 5
    player.sprite = love.graphics.newImage('sprites/parrot.png')

    background = love.graphics.newImage('sprites/background.png')
end

function love.update(dt)
    if love.keyboard.isDown("right") then
        player.x = player.x + player.speed
    end

    if love.keyboard.isDown("left") then
        player.x = player.x - player.speed
    end

    if love.keyboard.isDown("down") then
        player.y = player.y + player.speed
    end

    if love.keyboard.isDown("up") then
        player.y = player.y - player.speed
    end
end

function love.draw()
    love.graphics.draw(background, 0, 0)
    love.graphics.draw(player.sprite, player.x, player.y)
end