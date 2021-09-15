-- does exacly the same as 07-Input1.lua
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
	]]
	
	name = input("Type your name")	-- does the same job as the lines above, but can be re-used
	
	print("Hello " .. name)
end

main()

input("Press Enter to quit") -- this is now using the new input() function