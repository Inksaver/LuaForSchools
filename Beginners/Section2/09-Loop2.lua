-- demonstrates while loop without break

function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function main()
	userInput == ""
	while userInput ~= "your name" do 		-- ~= means 'is NOT equal to' -> while userInput is not equal to 'your name'
		userInput = input('Type "your name"')
		if userInput == "your name" then	-- user typed in 'your name' as instructed!
			print("That is correct!")
			--break 						-- break no longer needed. the loop will not run again as userInput is now = 'your name'
		else								-- user typed in their real name
			print(string.upper("Unfortunately, that is wrong! Try again...\n")) -- shout at the user! (UPPER CASE)
		end
	end

	input("Press Enter to quit")
end

main()
