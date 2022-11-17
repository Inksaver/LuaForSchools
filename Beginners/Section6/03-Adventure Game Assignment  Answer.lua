--[[
https://www.w3schools.com/charsets/ref_utf_box.asp
utf8 box characters stored here for easy copy/paste:

┌ ┬ ┐ ─ ╔ ╦ ╗ ═
 
├ ┼ ┤ │ ╠ ╬ ╣ ║
 
└ ┴ ┘   ╚ ╩ ╝
]]
kb = require "lib.kboard"

-- make as many rooms/cells/areas/locations as you need:
office = {}										-- empty table
office.name = "office"
office.description = "The headmaster's office."
office.items = {}								-- items can be an empty table
office.north = ""								-- make sure you create all 4 directions, even if empty
office.east = ""
office.south = "dungeon"						-- make sure you add "dungeon" to the master table later
office.west = ""

dungeon = {}
dungeon.name = "dungeon"
dungeon.description = "A rat infested cell"
dungeon.items = {"key","torch"}
dungeon.north = "office"
dungeon.east = ""
dungeon.south = "kitchen"
dungeon.west = ""

kitchen = {}
kitchen.name = "kitchen"
kitchen.description = "A steamy industrial kitchen in MacDonalds"
kitchen.items = {"knife"}
kitchen.north = "dungeon"
kitchen.east = ""
kitchen.south = ""
kitchen.west = ""

locations = {} -- master table. Change / add locations appropriate to your adventure
locations["dungeon"] = dungeon	-- make sure the key "dungeon" and value dungeon are consistent in other locations
locations["office"] = office
locations["kitchen"] = kitchen

player = {} -- empty table for you to add properties such as health, strength, ability, intelligence etc


function intro()
	print(
[[
┌───────────────────────────────────────────────────────────┐
│                       SCHOOL OF DOOM                      │
├───────────────────────────────────────────────────────────┤
│ Welcome to the most epic of adventures                    │
│ You are trapped inside the school from Hell!              │
│                                                           │
│ See if you can escape......                               │
└───────────────────────────────────────────────────────────┘
]])
end

function getExits(location)
	local exits = {}								-- empty table
	if location.north ~= "" then					-- is there a north exit? eg "kitchen"
		table.insert(exits, location.north)			-- add the exit to the table eg {"kitchen"}
	end
	if location.east ~= "" then
		table.insert(exits, location.east)
	end
	if location.south ~= "" then
		table.insert(exits, location.south)
	end
	if location.west ~= "" then
		table.insert(exits, location.west)
	end
	table.insert(exits, "Quit")						-- Add "Quit" to the end of the table eg {"kitchen", "dungeon", "Quit"}
	
	return exits
end

function play(locationName)
	local location = locations[locationName]        -- eg locations["dungeon"] returns the dungeon table 
	--print location details
	print("You are in ".. location.name.." "..location.description)
	
	--print any Items in this area
	io.write("In this area there is ")
	--use a for loop based on the length of location.items
	
	for i = 1, #location.items do
		io.write(location.items[i] .. ", ")
	end
	print()
	
	local exits = getExits(location)
	local choice = kb.menu("Which way do you want to go?", exits)
	return exits[choice]
end

function displayPlayer()
	print("╔"..string.rep("═", 40).."╗")
	print("║            Player properties           ║")
	print("║ Name:      "..player.name..(" "):rep(28 - #player.name).."║")
	print("║ Character: "..player.character..(" "):rep(28 - #player.character).."║")
	print("║ Weapon:    "..player.weapon..(" "):rep(28 - #player.weapon).."║")
	print("║ Health:    "..player.health..(" "):rep(28 - #tostring(player.health)).."║")
	print("║ Strength:  "..player.strength..(" "):rep(28 - #tostring(player.strength)).."║")
	print("╚"..string.rep("═", 40).."╝")
end

function setupPlayer()
	-- create default player
	player.name = ""
	player.characterIndex = 1
	player.character = ""
	player.inventory = {} -- empty table to be used later for adding items
	player.weapon = ""
	player.health = 50
	player.strength = 50
	player.weapon = ""
	-- add other player properties if you want eg player.stamina
	player.stamina = 80
	
	-- Ask the user for name, weapon
	player.name = kb.getString("Type the name of your player",true, 3, 20)
	characters = {"Genius", "Average Joe", "Teacher", "Earthworm"}
	choice = kb.menu("Choose your character", characters)
	player.characterIndex = choice
	player.character = characters[choice]
	
	if player.characterIndex == 1 or  player.characterIndex == 3 then
		player.health = 45
		player.strength = 55
		
	elseif player.characterIndex == 2 then
		player.health = 60
		player.strength = 30
	end
	weapons = {"feather", "axe", "plastic fork", "nuclear warhead"}
	-- use kb.menu to choose a weapon
	player.weapon = weapons[kb.menu("Choose your weapon", weapons)]
	-- print out player properties
	displayPlayer()
end

function main()
	intro()							-- write your introduction
	setupPlayer()					-- get player characteristics
	locationName = "dungeon"		-- start in one of the locations
	while locationName ~= "Quit" do	-- Use either a while-do or repeat-until loop to run the game
		locationName = play(locationName)	-- This function returns either the name of the location chosen or "Quit"
	end
	print("Thank you for playing")	-- final message when the player has decided to quit
end

main()
print("Press any key to exit")
io.read()