kb = require "kboard"

local function quit()
	io.write("Enter to quit")
	io.read()
end

-- It is good coding practice to use a main() function
function main()
	-- assume user is too lazy to use a capital letter
	--[[
	Kboard.getString(prompt, withTitle, minInt, maxInt)
	prompt = "What is your name?", withTitle = false, min length 1, max length 20
	prompt = "Both names please?", withTitle = true, min length 1, max length 30
	]]
	print("\nYour name (in Caps) is: " .. kb.getString("What is your Name?", false, 1, 20):upper())
	print("Your name (in Title Case) is: " .. kb.getString("Both names please (in lower case)?", true, 1, 30))
	quit()
end

-- Script runs from here: everything above is ignored until called
main() -- call the function main()