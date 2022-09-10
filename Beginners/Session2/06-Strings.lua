-- demonstrates  #, string.upper(), string.lower()
-- Lua 'syntactic sugar' : instead of .
function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function main()
	userInput = input("Type your name")
	-- # returns the length of the string inside the brackets as an INTEGER
	numberOfChars = #(userInput)
	print("Your name ".. userInput .. " has " .. numberOfChars .. " characters in it")
	
	-- string.upper() converts all characters to UPPER CASE
	print("Your name ".. userInput .. " in upper case is ".. string.upper(userInput))
	print("Your name ".. userInput .. " in upper case is ".. (userInput):upper())
	
	-- string.lower() converts all characters to lower case
	print("Your name ".. userInput .. " in lower case is ".. string.lower(userInput))
	print("Your name ".. userInput .. " in lower case is ".. (userInput):lower())
end

main()

input("Press Enter to quit")
