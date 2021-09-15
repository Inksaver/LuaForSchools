-- tonumber(), tostring()
function input(text)
	io.write(text.."_")
	return io.read()
end

function main()
	-- Anything typed in is a string, INCLUDING numbers!
	-- Ask the user to type something, and store what they typed.
	userInput = input("Type in any letters, numbers or symbols and press Enter")
	print("You typed in the characters "..userInput)
	-- Ask the user to enter only numbers
	userInput = input("Type in any number, and press Enter")

	-- If they typed in 3, it is the character "3"
	-- You have to convert it to a number
	userInput = tonumber(userInput) -- if it cannot be converted it becomes nil
	print("The variable userInput now contains:  "..tostring(userInput))
end

main()

input("Press Enter to quit")