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
	--[[
	Modify the code below to give helpful guidance of the range of numbers remaining.

	Hints:

	Create 2 variables to hold the largest and smallest numbers guessed so far.
	Re-assign these variables as guesses are made
	Output an appropriate message after each guess, telling the user how they have fared, and the range they now need to use.
	
	]]
	math.randomseed(os.time())		-- set the random seed
	local n = math.random(1, 99)	-- pick a number between 1 and 99

	repeat
		-- no need to convert guess to a number, as return type is guaranteed
		local guess = input("Enter an integer from 1 to 99")
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