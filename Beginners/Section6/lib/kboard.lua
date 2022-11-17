-- Kboard static class returns string, integer, boolean and menu choices
local Kboard = {}

--[[from http://lua-users.org/wiki/StringRecipes
	Change an entire string to Title Case (i.e. capitalise the first letter of each word)
	Add extra characters to the pattern if you need to. _ and ' are
	found in the middle of identifiers and English words.
	We must also put %w_' into [%w_'] to make it handle normal stuff
	and extra stuff the same.
	This also turns hex numbers into, eg. 0Xa7d4
	
	str = str:gsub("(%a)([%w_']*)", tchelper)
]]
local delay = 2

local function tchelper(first, rest)
   return first:upper()..rest:lower()
end

function Kboard.getString(prompt, withTitle, minInt, maxInt) -- withTitle, minInt and maxInt are given defaults if not passed
	withTitle = withTitle or false
	minInt = minInt or 1
	maxInt = maxInt or 20
	local retValue = ""
	while true do
		io.write(prompt.."_")
		local userInput = io.read()
		if string.len(userInput) == 0 then
			print("\nJust pressing the Enter key doesn't work...")
		else		
			if string.len(userInput) >= minInt and string.len(userInput) <= maxInt then
				retValue = userInput
				if withTitle then
					retValue = Kboard.toTitle(userInput)
				end
				break
			else
				print("\nTry entering text between "..minInt.." and "..maxInt.." characters...")
			end
		end
	end
	
	return retValue
end

function Kboard.getFloat(prompt, minValue, maxValue) 
	--[[ Return a real number. minValue and maxValue are given defaults if not passed ]]
	minValue = minValue or -100000000
	maxValue = maxValue or 100000000

	local retValue = 0
	local validated = false
	while not validated do
		io.write(prompt.."_")
		local userInput = io.read()
		if string.len(userInput) == 0 then
			print("\nJust pressing the Enter key doesn't work...")
		else
			retValue = tonumber(userInput)
			if retValue == nil then
				print("\nTry entering a number - "..userInput.." does not cut it...")
			else
				if retValue >= minValue and retValue <= maxValue then
					validated = true
				else
					print("\nTry a number from "..minValue.." to "..maxValue.."...")
				end					
			end
		end
	end
	return retValue
end
	
function Kboard.getInteger(prompt, minInt, maxInt) -- minInt and maxInt are given defaults if not passed
	minInt = minInt or 0
	maxInt = maxInt or 65536
	local retValue = 0
	while true do
		io.write(prompt.."_")
		local userInput = io.read()
		if string.len(userInput) == 0 then
			print("\nJust pressing the Enter key doesn't work...")
		else
			if tonumber(userInput) ~= nil then
				retValue = tonumber(userInput)
				if retValue >= minInt and retValue <= maxInt then
					if math.floor(retValue / 1) ~= retValue then
						print(userInput.. " is not an integer")
					else
						break
					end
				else
					print("\nTry a number from "..minInt.." to "..maxInt.."...")
				end
			else
				print("\nTry entering a number - "..userInput.." does not cut it...")
			end
		end
	end
	return retValue
end
		
function Kboard.getBoolean(prompt) -- assumes yes/no type entries from user
	local retValue = false
	local validated = false
	while not validated do
		io.write(prompt.."_")
		local userInput = io.read()
		if string.len(userInput) == 0 then
			print("\nJust pressing the Enter key doesn't work...")
		else		
			if userInput:sub(1,1):lower() == "y" then
				retValue = true
				validated = true
			elseif userInput:sub(1,1):lower() == "n" then
				validated = true
			else
				print("\nOnly anything starting with y or n is accepted...")
			end
		end	
	end
	return retValue
end
	
function Kboard.toTitle(Text) --converts any string to Title Case
	return Text:gsub("(%a)([%w_']*)", tchelper)
end
	
function Kboard.Menu(title, list) -- allows for upper/lower case menu/Menu call
	return Kboard.menu(title, list)
end
	
function Kboard.menu(title, list) -- displays a menu using the text in 'title', and a list of menu items (string)
	index = 1
	print(title)
	for _, item in ipairs(list) do
		print("\t"..index..") "..item)
		index = index + 1
	end
	return Kboard.getInteger("Type the number of your choice (1 to "..index-1 ..")", 1, #list)
end

function Kboard.sleep(s) 
    --[[ Lua version of Python time.sleep(2) ]]
	local sec = tonumber(os.clock() + s); 
    while (os.clock() < sec) do end 
end
	
return Kboard