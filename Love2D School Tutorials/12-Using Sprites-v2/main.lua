function love.load()
    -- add these lines to debug in ZeroBrane Studio
    if arg[#arg] == "-debug" then
        print("running in debug mode")
        require("mobdebug").start()
    end
    -- load background image
    background = love.graphics.newImage('sprites/background.png')
    WIDTH = background:getWidth()    -- get width and height of background image
    HEIGHT = background:getHeight()
    love.window.setMode(WIDTH, HEIGHT) -- change window size to match background
    
    anim8 = require 'lib/anim8'
    love.graphics.setDefaultFilter("nearest", "nearest") -- graphics filter for pixel scaling

    player =
    {
        x = 0,
        y = 0,
        width = 0,
        height = 0,
        speed = 5,
        spriteSheet = love.graphics.newImage('sprites/player-sheet.png'),
        grid = {},
        anim = {},
        animations = {},
        scale = {}
    }
    -- newGrid(frameWidth, frameHeight, imageWidth, imageHeight, left, top, border)
    -- create a new grid from the supplied spritesheet
    -- you will need to know the size of each frame in advance. player-sheet.png has 12 x 18 pixel sprites
    -- in a grid 4 frames wide, 4 frames deep
    player.grid = anim8.newGrid( 12, 18, player.spriteSheet:getWidth(), player.spriteSheet:getHeight())
    -- newAnimation(frames, durations, onLoop)
    -- player.grid('1-4', 1) use frames 1-4 on the top row
    player.animations.down  = anim8.newAnimation( player.grid('1-4', 1), 0.2 ) -- top row, 0.2 secs frame rate
    player.animations.left  = anim8.newAnimation( player.grid('1-4', 2), 0.2 ) -- row 2, 0.2 secs frame rate
    player.animations.right = anim8.newAnimation( player.grid('1-4', 3), 0.2 ) -- row 3, 0.2 secs frame rate
    player.animations.up    = anim8.newAnimation( player.grid('1-4', 4), 0.2 ) -- row 4, 0.2 secs frame rate

    player.anim = player.animations.down  -- start facing down (towards screen)
    player.width, player.height = player.anim:getDimensions()  -- needed for controlling player position and collisions
    player.scale.x = 4    -- change to enlarge / shrink sprite display width
    player.scale.y = 4    -- change to enlarge / shrink sprite display height
    player.x = (WIDTH - (player.width * player.scale.x)) / 2    -- centre the player
    player.y = (HEIGHT - (player.height * player.scale.y)) / 2
    step = love.audio.newSource("sounds/FootstepGrass01.wav","static")
    bgmusic = love.audio.newSource("sounds/AmbientNatureOutside.wav","stream")
    love.audio.play(bgmusic)
end

function love.update(dt)
    local isMoving = false
    
    if love.keyboard.isDown("right") then
        player.x = math.min(WIDTH - (player.width * player.scale.x), player.x + player.speed)
        player.anim = player.animations.right
        isMoving = true
    end

    if love.keyboard.isDown("left") then
        player.x = math.max(0, player.x - player.speed)
        player.anim = player.animations.left
        isMoving = true
    end

    if love.keyboard.isDown("down") then
        player.y = math.min(HEIGHT - player.height * player.scale.y, player.y + player.speed)
        player.anim = player.animations.down
        isMoving = true
    end

    if love.keyboard.isDown("up") then
        player.y = math.max(0, player.y - player.speed)
        player.anim = player.animations.up
        isMoving = true
    end

    if isMoving then
        love.audio.play(step)
    else
        player.anim:gotoFrame(2)
    end

    player.anim:update(dt)
    if not bgmusic:isPlaying() then
        love.audio.play(bgmusic)
    end
end

function love.draw()
    love.graphics.draw(background, 0, 0)
    -- Animation:draw(image, x, y, r, sx, sy, ox, oy, kx, ky)
    player.anim:draw(player.spriteSheet, player.x, player.y, nil, player.scale.x, player.scale.y)
end