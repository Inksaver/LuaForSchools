-- demonstration of for loops and string.rep()
function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function main()
	numberOfRows = input("Type a number between 5 and 20")
	
	numberOfRows = tonumber(numberOfRows)
	if numberOfRows ~= nil then
		
		-- draw a triangle
		-- for variable = start, finish, step do
		for i = 1, numberOfRows, 1 do -- eg start at 1 step to 6: 1, 2, 3, 4, 5, 6
			-- i starts at 1, then steps 2, 3, 4, 5, etc -> numberOfRows
			-- string.rep() repeats the character(s) given by the number supplied
			-- eg string.rep("*", 4) returns "****"
			lineOfChars = string.rep("*", i)
			print(lineOfChars)
		end
		-- reverse the triangle by starting with a high number and using -1 for the step: 6, 5, 4, 3, 2, 1
		for i = numberOfRows, 1, -1 do
			lineOfChars = ("*"):rep(i)
			print(lineOfChars)
		end
	end
end

main() -- program starts here

input("Press Enter to quit")