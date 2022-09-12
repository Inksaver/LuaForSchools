-- adding to a table

function input(prompt) -- get input from user
	io.write(prompt .. "_")
	return io.read()
end

function main()
	colours = {"red", "green", "blue"} --create a table of colours
	myFavourites = {} -- create an empty table
	
	print("Colours table: "..table.concat(colours, ", "))
	print("Creating a table of 3 of your favourite colours...")
	for i = 1, 3 do
		userInput = input("Type your favourite colour (number "..i..")")
		table.insert(myFavourites, userInput)
	end
	print("colours table: "..table.concat(colours, ", "))
	print("Favourite colours table: "..table.concat(myFavourites, ", "))
	input("Press Enter to quit")
end

main() -- program starts here