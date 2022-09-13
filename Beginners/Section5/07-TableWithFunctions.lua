local rect = {} -- create an empty table populated in main()

local function input(prompt)
    --[[ get input from user ]]
    io.write(prompt .. "_")
    return io.read()
end

local function update()
    --[[ increase the X position and Width ]]
    --rect.X = rect.X + 2                    -- add 2 to X position
    --rect.Width = rect.Width + 2            -- add 2 to Width
    rect.moveHorizontal(2)
    rect.changeWidth(2)
end

function rect.draw()
    local x = (" "):rep(rect.X)             -- string of spaces equivalent to position of X "" -> "     "
    local width = ("-"):rep(rect.Width)     -- string of - equivalent to Width "----------" -> "---------------"
    local empty = (" "):rep(rect.Width - 2) -- string of spaces equivalent to inside of rectangle 8 -> 13
    print(x..width)                         -- print top of rectangle "----------" -> "---------------"
    for rows = 1, rect.Height - 2 do        -- loop: height of rectangle minus top and bottom
        print(x.."|"..empty.."|")           -- print sides of rectangle "|        ||" -> "||             |"
    end
    print(x..width)                         -- print bottom of rectangle "----------" -> "---------------"
end

local function main()
    rect.X = 0                    -- set X value to 0
    rect.Y = 0                    -- set Y value to 0
    rect.Width = 10               -- set Width to 10
    rect.Height = 4               -- set Height to 4
    rect.Colour = {0.2, 0.5, 0.9} -- set colour to relative values of red / green / blue 0 to 1
    rect.Mode = "fill"            -- set draw mode to "fill" (alternative is "line")
    function rect.moveHorizontal(pixels)
        rect.X = rect.X + pixels  -- add no of pixels to X position
    end
    function rect.changeWidth(pixels)
        rect.Width = rect.Width + pixels -- add no of pixels to Width
    end
    for frames = 1, 5 do
        update()                  -- update values of rect.X and rect.Width
        rect.draw()               -- draw updated rectangle
    end
    input("Press Enter to quit")
end

main()