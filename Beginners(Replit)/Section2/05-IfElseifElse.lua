-- demonstrates boolean variables and if elseif else end

function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function main()
	-- Boolean variables can only be either true or false
	-- Most languages associate true = 1, false = 0
	-- You can also think of yes = true, no = false
	
	choice = false -- variable called 'choice' is given the default value false
	userInput = input("Do you like Lua? (y/n)")
	-- user SHOULD have typed a 'y' or 'n'
	if userInput == "" then						-- Enter only
		print("You only pressed the Enter key")
	elseif userInput == 'y' then				-- 'y' typed in
		print("Great! variable 'choice' is now true")
		choice = true							-- set choice to true as the user typed 'y'
	elseif userInput == 'n' then				-- 'n' typed in
		print("Oh. That is disappointing")
	else										-- some other characters typed in
		print("You typed "..userInput.." I can't translate that to true/false")
	end
	
	print("\nThe value of the boolean variable 'choice' is: " .. tostring(choice))
end

main()