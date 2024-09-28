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

function main()
	math.randomseed(os.time())
	local range = 99
	local n = math.random(range)
	local closestAbove = range
	local closestBelow = 1
	repeat
		local guess = getNumber("Guess the number (between "..closestBelow.. " and "..closestAbove..")")
		if guess < n then
			if guess > closestBelow then
				closestBelow = guess
			end
			print("guess is low. (Between " .. closestBelow .. " and " .. closestAbove .. ")")
		elseif guess > n then
			if guess < closestAbove then
				closestAbove = guess
			end
			print("guess is high. (Between " .. closestBelow .. " and ".. closestAbove .. ")")
		end
	until guess == n
	print("you guessed it!")
end

-- program runs from here
main()