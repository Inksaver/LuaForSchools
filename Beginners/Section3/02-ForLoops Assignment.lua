-- Change the code in main() to draw the following:
--[[

     *
    ***
   *********
  ***********
 *************  
***************  

]]

--[[
	This example is 6 rows deep. You could do this in a number of ways:
	1. Lazy: write 6 string variables with the correct layout, then print them: 1 mark!
	
	2. Better: create 6 string variables using code to fill them, then print them: 2 marks!
	   (you could use a combination of string.rep() and concatenation -> .. )
	   eg row1 = string.rep(" ", 4) .. "*" .. string.rep(" ", 4)
	   
	3. Use a for loop to draw both halves of the tree one row at a time similar to 2.
	   (join the string.rep(# ,#) combinations in the for loop)
	   but able to cope with as many rows as the user chooses: 10 marks!
]]

function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function main()
	numberOfRows = input("Type a number between 5 and 20. (Enter only for 6 rows)")
	numberOfRows = tonumber(numberOfRows)
	if numberOfRows == nil then
		numberOfRows = 6 -- user has chosen the default
	end
	-- draw a triangle
	-- for variable = start, finish, step do
	for i = 1, numberOfRows, 1 do
		-- string.rep() repeats the character(s) given by the number supplied
		-- eg string.rep("*", 4) returns "****"
		lineOfChars = string.rep("*", i)
		print(lineOfChars)
	end
end

main() -- program starts here

input("Press Enter to quit")