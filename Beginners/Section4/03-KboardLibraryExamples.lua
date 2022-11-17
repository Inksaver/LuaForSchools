kb = require "lib.kboard" --use same kboard.lua but from separate folder

local function quit()
	io.write("Enter to quit")
	io.read()
end

local function testKboard()
	local name = kb.getString("What is your name?", true, 3, 6)
	print("User name : "..name.." <- See how I used a capital letter!")

	local age = kb.getInteger("How old are you?", 5, 110)
	print("User age : ".. age.. " years old.")
	
	local height = kb.getFloat("How tall are you?", 0.5, 2.0)
	print("User height : ".. height.." metres tall.")
	
	local likesPython = kb.getBoolean("Do you like Python? (y/n)")
	print("User likes Python : "..tostring(likesPython))
	kb.sleep(2)					-- pause 2 secs
	
	local title = "What do think of this utility?"
	local options = {"Brilliant", "Not bad", "Could do better", "Rubbish"}
	local choice = kb.menu(title, options)
	print(name.." thinks this utility is : "..options[choice])
end

local function main()
	--[[ Everything runs from here ]]
	testKboard()
	quit()
end
main()