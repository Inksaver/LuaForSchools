-- demonstrates tostring()
function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function main()
	-- create a number variable and give it a value of 10
	myNumber = 10
	-- Try and Print out the value of the variable
	print("the variable myNumber contains: "..myNumber)

	-- This works perfectly as Lua uses .. to join strings
	-- and converts the number 10 to the string "10" on the fly
	-- With Python, this will not work, and you get this message:
	-- TypeError: Can't convert 'int' object to str implicitly
	-- use tostring() to be certain
	print("tostring(myNumber) = "..tostring(myNumber))
end

main()

input("Press Enter to quit")
