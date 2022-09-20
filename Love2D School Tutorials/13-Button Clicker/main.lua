local HEIGHT = love.graphics.getHeight()
local WIDTH = love.graphics.getWidth()
local wait = 3
local colour = {math.random(), math.random(), math.random()}

local function distanceBetween(x1, y1, x2, y2)
    return math.sqrt((y2 - y1)^2 +(x2 - x1)^2)
end

function love.mousepressed(x, y, b, istouch)
    if b == 1 and gameState == 2 then
        if distanceBetween(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
            score = score + 1
            button.x = math.random(button.size, love.graphics.getWidth() - button.size)
            button.y = math.random(button.size, love.graphics.getHeight() - button.size)
            colour = {math.random(), math.random(), math.random()}
        end
    end
    if gameState == 1 then
        gameState = 2
        timer = 10
        score = 0
        wait = 3
    end
end

function love.load()
    if arg[#arg] == "-debug" then require("mobdebug").start() end 
    love.graphics.setBackgroundColor(1, 1, 1)
    print("Window background set to white")
    
    button =
    {
        x = 200,
        y = 200,
        size = 50
    }
    score = 0
    timer = 10
    gameState = 1
    myFont = love.graphics.newFont("fonts/calibri.ttf", 40)
end

function love.update(dt)
    if gameState == 2 then
        if timer > 0 then
            timer = timer - dt
        end
        if timer < 0 then
            timer = 0
            gameState = 3
        end
    elseif gameState == 3 then
        wait = wait - dt
        if wait < 0 then
            gameState = 1
        end
    end
end

function love.draw()
    love.graphics.setFont(myFont)
    love.graphics.setColor(0, 0, 0) -- should be 1,1,1 if on black background
    
    if gameState == 1 then -- menu
        love.graphics.printf("Click anywhere to begin",
                              0,
                              HEIGHT / 2 - 20,
                              WIDTH,
                              "center")
    else
        love.graphics.print("Score: "..score, WIDTH * 0.2, HEIGHT * 0.9)
        love.graphics.print("Time: "..math.ceil(timer), WIDTH * 0.6, HEIGHT * 0.9)
        if gameState == 2 then
            love.graphics.setColor(colour)
            love.graphics.circle('fill', button.x, button.y, button.size)
        end
    end
end