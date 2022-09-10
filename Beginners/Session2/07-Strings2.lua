function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function main()
	userInput = input('Type "your name"')

	if userInput == "your name" then	-- user typed in 'your name' as instructed!
		print("That is correct!")
	else	-- user typed in their real name
		print(("Unfortunately, that is wrong!"):upper().." Try again...\n") -- shout at the user! (UPPER CASE)
	end
end

main()

input("Press Enter to quit")
