
--[[
https://www.w3schools.com/charsets/ref_utf_box.asp
utf8 box characters stored here for easy copy/paste:

┌ ┬ ┐ ─ ╔ ╦ ╗ ═
 
├ ┼ ┤ │ ╠ ╬ ╣ ║
 
└ ┴ ┘   ╚ ╩ ╝
]]
kb = require "lib.kboard" -- note kboard.lua is in a folder called "lib". If not use require "kboard"

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
Give an introduction to your adventure.
You can use square brackets instead of quotation marks to
make long pieces of text.

On multiple lines
]])
end

function getExits(location)
	local exits = {}								-- empty table
	if location.north ~= "" then					-- is there a north exit? eg "kitchen"
		table.insert(exits, location.north)			-- add the exit to the table eg {"kitchen"}
	end
	-- add check for east
	if location.south ~= "" then
		table.insert(exits, location.south)
	end
	-- add check for west
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
	
	
	
	
	local exits = getExits(location)
	local choice = kb.menu("Which way do you want to go?", exits)
	return exits[choice]
end

function displayPlayer()
	-- string.rep("═", 40) can also be written ("═"):rep(40) -> Lua "syntactic sugar"
	print("╔"..string.rep("═", 40).."╗") -- start with ╔ add 40 of ═ finish with ╗ -> line length = 42
	
	print("║            Player properties           ║") -- Fixed length string: nice and easy! -> line length = 42
	
	print("║ Name:      "..player.name..(" "):rep(28 - #player.name).."║") -- use maths: see comment below 
	-- print other characteristics here
	
	-- finish the box here
	
	--[[
	Calculating line lengths and positions:
	# = lengthOf -> #player.name returns length of player.name. if player.name == "Fred" -> 4
	(" "):rep(number) returns a string of length 'number' copies of whatever is inside " " (space in this case)
	28 - #player.name returns 24 if player.name == "Fred" (4 letters -> 28-4 = 24)
	(" "):rep(28 - #player.name) returns a string of 24 spaces if player.name == "Fred"
	"║ Name:      " is 13 charactes long + 4 (player.name) + 24 (spaces) + 1 ("║") = 42 characters: the length of the line
	]]
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
	
	-- Ask the user for name, weapon
	player.name = kb.getString("Type the name of your player",true, 3, 20)
	characters = {"Genius", "Average Joe", "Teacher", "Earthworm"}
	choice = kb.menu("Choose your character", characters)
	player.characterIndex = choice
	player.character = characters[choice]
	
	-- you could change properties based on character choice
	if player.characterIndex == 1 then -- first character chosen
		player.health = 45
		player.strength = 55
		-- add other player properties if you want eg player.stamina
	--elseif                --statements here to cover all possible choices
	--else
	end
	
	weapons = {"feather", "axe", "plastic fork", "nuclear warhead"}
	-- use kb.menu to choose a weapon
	-- choice =
	-- player.weapon = 
end

function main()
	intro()                               -- write your introduction
	setupPlayer()                         -- get player characteristics
	displayPlayer()                       -- print out player properties
	locationName = "dungeon"              -- start in one of the locations
	-- Use either a while-do or repeat-until loop to run the game
		locationName = play(locationName) -- This function returns either the name of the location chosen or "Quit"
	--end
	print("Thank you for playing")	      -- final message when the player has decided to quit
end

main()
print("Press any key to exit")
io.read()