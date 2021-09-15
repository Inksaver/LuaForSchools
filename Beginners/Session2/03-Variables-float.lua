-- demonstrate float and if statement
function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function main()
	-- Float variables
	myFloat  = 1.5 -- create a float variable
	-- Note the use of the tostring() function
	print("The variable myFloat contains: ".. tostring(myFloat))
	
	-- get a number from the user
	userInput = input("Type a number from 1 to 100 (program will crash if not a number)")
	-- convert userInput to number
	userInput = tonumber(userInput) -- if it cannot be converted it becomes nil
	-- program will crash if you multiply a number with nil!!!
	print("Your number: ".. userInput .." multiplied by " .. myFloat .. " = " .. userInput * myFloat)
end

main()

input("Press Enter to quit")