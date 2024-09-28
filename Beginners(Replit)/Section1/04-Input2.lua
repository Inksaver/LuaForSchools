-- does exacly the same as 03-Input1.lua
-- demonstrates new function called input() with return value

function input(prompt)
	io.write(prompt .. "_") 		-- "_" is added to prompt eg Type your name_
	return io.read()				-- io.read() sends what you typed in to where it was called
end

function main()
	print("Hello. We are going to talk to each other...")
	print("I will ask you a question on screen.")
	print("You type a response and press Enter.")
	print()
	
	--[[ These 2 lines are no longer required:
		io.write("Type your name_") 	
		name = io.read()
		Use the brand new input() function instead
	]]
	
	name = input("Type your name")	-- does the same job as the lines 16+17 above, but can be re-used
	age = input("Type your age")
	
	print("Hello " .. name)
	print("You are ".. age .. " years old")
end

main()