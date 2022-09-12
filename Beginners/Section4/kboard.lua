--[[
kboard static class returns string, integer, float, boolean and menu choices.
Use:

name = Kboard.GetString("What is your name?", true, 1, 10, row);
age = Kboard.GetInteger("How old are you", 5, 110, row);
height = Kboard.GetRealNumber("How tall are you?", 0.5, 2.0, row);
likesPython = Kboard.GetBoolean("Do you like C#? (y/n)", row);

options = {"Brilliant", "Not bad", "Could do better", "Rubbish"};
choice = Kboard.Menu("What do think of this utility?", options, row)
]]
local Kboard = {}
local blank = string.rep(" ", 79)
local delay = 2

--[[from http://lua-users.org/wiki/StringRecipes
	Change an entire string to Title Case (i.e. capitalise the first letter of each word)
	Add extra characters to the pattern if you need to. _ and ' are
	found in the middle of identifiers and English words.
	We must also put %w_' into [%w_'] to make it handle normal stuff
	and extra stuff the same.
	This also turns hex numbers into, eg. 0Xa7d4
	
	str = str:gsub("(%a)([%w_']*)", tchelper)
]]
local function tchelper(first, rest)
   return first:upper()..rest:lower()
end

--[[ local functions are private, not called directly from other files ]]

local function processInput(prompt, minValue, maxValue, dataType)
	--[[ validate input, raise error messages until input is valid ]]
	local validInput = false
	local userInput
	while not validInput do
		io.write(prompt.."_")
		userInput = io.read()
		local output = userInput
		if dataType == "string" then
			if userInput:len() == 0 and minValue > 0 then
				print("Just pressing the Enter key or spacebar doesn't work")
			else
				if userInput:len() < minValue or userInput:len() > maxValue then
					print("Try entering text between "..minValue.." and "..maxValue.." characters")
				else
					validInput = true
				end
			end
		else
			if userInput:len() == 0 then
				print("Just pressing the Enter key or spacebar doesn't work")
			else
				if dataType == "bool" then		
					if userInput:sub(1, 1):lower() == "y" then
						userInput = true
						validInput = true
					elseif userInput:sub(1, 1):lower() == "n" then
						userInput = false
						validInput = true
					else
						print("Only anything starting with y or n is accepted")
					end
				else
					if dataType == "int" or dataType == "float" then
						local input = tonumber(userInput)			
						if input == nil then
							print("Try entering a number - "..userInput.." does not cut it")
						else
							if input >= minValue and input <= maxValue then
								if math.floor(input / 1) ~= input and dataType == "int"  then
									print("Try entering a whole number - "..userInput.." does not cut it")
								else
									validInput = true
									userInput = input
								end
							else
								print("Try a number from "..minValue.." to "..maxValue)
							end
						end
					end
				end
			end
		end
	end
	return userInput
end

function Kboard.GetString(prompt, withTitle, minValue, maxValue) 
	--[[ Return a string. withTitle, minValue and maxValue are given defaults if not passed ]]
	withTitle = withTitle or false
	minValue = minValue or 1
	maxValue = maxValue or 20
	local userInput = processInput(prompt, minValue, maxValue, "string")
	if withTitle then
		userInput = Kboard.ToTitle(userInput)
	end
	return userInput
end

function Kboard.GetFloat(prompt, minValue, maxValue) 
	--[[ Return a real number. minValue and maxValue are given defaults if not passed ]]
	minValue = minValue or -10000000000
	maxValue = maxValue or  10000000000
	
	return processInput(prompt, minValue, maxValue, "float")
end

function Kboard.GetInteger(prompt, minValue, maxValue) 
	--[[ Return an integer. minValue and maxValue are given defaults if not passed ]]
	minValue = minValue or 0
	maxValue = maxValue or 65536
	return processInput(prompt, minValue, maxValue, "int")
end

function Kboard.GetBoolean(prompt)
	--[[ Return a boolean. Based on y(es)/ n(o) response ]]
	return processInput(prompt, 1, 3, "bool", row)
end
	
function Kboard.ToTitle(Text) 
	--[[ converts any string to Title Case ]]
	return Text:gsub("(%a)([%w_']*)", tchelper)
end

function Kboard.Sleep(s) 
    --[[ Lua version of Python time.sleep(2) ]]
	local sec = tonumber(os.clock() + s); 
    while (os.clock() < sec) do end 
end

function Kboard.Menu(title, list)
	--[[ displays a menu using the text in 'title', and a list of menu items (string) ]]
	print(title)
	local index = 1
	for _, item in ipairs(list) do
		if index < 10 then
			print("     "..index..") "..item)
		else
			print("    "..index..") "..item)
		end
		index = index + 1
	end
	return Kboard.GetInteger("Type the number of your choice (1 to "..index-1 ..")", 1, #list)
end
	
return Kboard