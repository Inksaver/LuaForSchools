-- demonstrate if statement to prevent crash
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
	userInput = input("Type a number from 1 to 100")
	-- convert userInput to number
	userInput = tonumber(userInput) -- if it cannot be converted it becomes nil
	
	-- use of if statement checks if user did not type a number
	if userInput == nil then -- did not convert so now nil. note: ==
		print("You did not type a number")
	else
		print("Your number: ".. userInput .." multiplied by " .. myFloat .. " = " .. userInput * myFloat)
	end
end

main()