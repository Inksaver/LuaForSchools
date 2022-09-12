kb = require "kboard"

local function quit()
	io.write("Enter to quit")
		io.read()
end

local function testKboard()
	--[[
	If in IDE row is kept at -1, which disables the SetCursorPos in Kboard library
	so the output scrolls as normal
	Otherwise incorrect answers keep the output on the same linefeed
	]]
	local name = kb.GetString("What is your name?", true, 3, 6)
	print("User name : "..name.." <- See how I used a capital letter!")

	local age = kb.GetInteger("How old are you?", 5, 110)
	print("User age : ".. age.. " years old.")
	
	local height = kb.GetFloat("How tall are you?", 0.5, 2.0)
	print("User height : ".. height.." metres tall.")
	
	local likesPython = kb.GetBoolean("Do you like Python? (y/n)")
	print("User likes Python : "..tostring(likesPython))
	kb.Sleep(2)					-- pause 2 secs
	
	local title = "What do think of this utility?"
	local options = {"Brilliant", "Not bad", "Could do better", "Rubbish"}
	local choice = kb.Menu(title, options)
	print(name.." thinks this utility is : "..options[choice])
end

local function main()
	--[[ Everything runs from here ]]
	testKboard()
	quit()
end
main()