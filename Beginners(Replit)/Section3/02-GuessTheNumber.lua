local function getNumber(prompt) 	-- get input from user
	while true do						-- break not required as return used instead
		io.write(prompt .. "_")
		local userInput = io.read()
		if tonumber(userInput) ~= nil then
			return tonumber(userInput)
		else
			print("Enter a number ".. userInput .. " does not work")
		end
	end
end

local function main()
	math.randomseed(os.time())		-- set the random seed
	local n = math.random(1, 99)	-- pick a number between 1 and 99

	repeat
		-- no need to convert guess to a number, as return type is guaranteed
		local guess = getNumber("Enter an integer from 1 to 99")
		if guess < n then
			print("Too low")
		elseif guess > n then
			print("Too high")
		else
			print("you guessed it!")
		end
	until guess == n
end

main()