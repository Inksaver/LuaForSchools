-- removing from a table

function input(prompt)
	--[[ get input from user ]]
	io.write(prompt .. "_")
	return io.read()
end

function main()
	colours = {"red", "green", "blue"} --create a table of colours
	
	print("Colours table: "..table.concat(colours, ", "))
	while #colours > 0 do
		userInput = input("Which colour do you want to remove?")
		local found = false
		for index = 1, #colours do
			if colours[index] == userInput then
				table.remove(colours, index)
				found = true
				break
			end
		end
		if found then
			print("colours table: "..table.concat(colours, ", "))
		else
			print(userInput.." not found in the table")
		end
	end
	input("Press Enter to quit")
end

main() -- program starts here
