local rect = {} -- create an empty table populated in main()

local function clear()
    os.execute("sleep 0.25")     -- wait 1/4 second (Replit / Unix only)
    os.execute("clear")          -- ask the operating system to clear the console ("cls" in Windows)
end

local function update()
    -- increase the X position
    rect.X = rect.X + 2          -- add 2 to X position
end

local function draw()
    local x = (" "):rep(rect.X)  -- string of spaces equivalent to position of X "" -> "     "
    print(x..rect.top)           -- print top of rectangle
    print(x..rect.middle)        -- print middle of rectangle
    print(x..rect.bottom)        -- print bottom of rectangle
end

local function main()
    rect.X = 0                  -- set X value to 0
    rect.top =    "┌─────┐"
    rect.middle = "│     │"
    rect.bottom = "└─────┘"
    for frames = 1, 20 do
        update()                 -- update values of rect.X
        clear()                  -- clear screen and pause for 1 second
        draw()                   -- draw updated rectangle
    end
end

main()