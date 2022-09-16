function love.load()
    -- using an image as background, so use the image as window size.
    background = love.graphics.newImage('sprites/background.png')
    WIDTH = background:getWidth()
    HEIGHT = background:getHeight()

    love.window.setMode(WIDTH, HEIGHT) -- change window size to match background
    player =
    {
        x = 0,
        y = 0,
        speed = 5,
        sprite = love.graphics.newImage('sprites/parrot.png'),
    }
    player.width = player.sprite:getWidth()   -- get player width  from image
    player.height = player.sprite:getHeight() -- get player height from image
    player.x = (WIDTH - player.width) / 2     -- centre the player x
    player.y = (HEIGHT - player.height) / 2   -- centre the player y

    
    key = love.keyboard.isDown
    draw = love.graphics.draw
end

function love.update(dt)
    if key("right") then
        player.x = math.min(WIDTH - player.width, player.x + player.speed)
    end

    if key("left") then
        player.x = math.max(0, player.x - player.speed)
    end

    if key("down") then
        player.y = math.min(HEIGHT - player.height, player.y + player.speed)
    end

    if key("up") then
        player.y = math.max(0, player.y - player.speed)
    end
end

function love.draw()
    draw(background, 0, 0)
    draw(player.sprite, player.x, player.y)
end