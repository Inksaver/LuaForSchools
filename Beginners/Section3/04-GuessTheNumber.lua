local function input(prompt, dataType) 	-- get input from user
	dataType = dataType or "string" 	-- if not supplied then give default value
	while true do						-- break not required as return used instead
		io.write(prompt .. "_")
		local userInput = io.read()
		if dataType == "string" then
			return userInput
		elseif dataType == "int" or dataType == "float" then
			if tonumber(userInput) ~= nil then
				return tonumber(userInput)
			else
				print("Enter a number ".. userInput .. " does not work")
			end
		elseif dataType == "bool" then
			if userInput == "y" or userInput == "yes" then
				return true
			elseif userInput == "n" or userInput == "no" then
				return false
			else
				print("Enter y or n ".. userInput .. " does not work")
			end
		end
	end
end

local function main()
	math.randomseed(os.time())		-- set the random seed
	local n = math.random(1, 99)	-- pick a number between 1 and 99

	repeat
		-- no need to convert guess to a number, as return type is guaranteed
		local guess = input("Enter an integer from 1 to 99", "int")
		if guess < n then
			print("Too low")
		elseif guess > n then
			print("Too high")
		else
			print("you guessed it!")
		end
	until guess == n
	input("Press Enter to quit")
end

main()