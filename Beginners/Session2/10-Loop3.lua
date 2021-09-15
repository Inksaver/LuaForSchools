-- demonstrates repeat..until loop

function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function main()
	-- userInput == "" <- no longer needed
	repeat -- starting a loop with repeat forces it to run at least once
		userInput = input('Type "your name"')
		if userInput == "your name" then	-- user typed in 'your name' as instructed!
			print("That is correct!")
		else								-- user typed in their real name
			print(string.upper("Unfortunately, that is wrong! Try again...\n")) -- shout at the user! (UPPER CASE)
		end
	until userInput == "your name"-- as soon as userInput = 'your name' the loop will end
end

main()
input("Press Enter to quit")