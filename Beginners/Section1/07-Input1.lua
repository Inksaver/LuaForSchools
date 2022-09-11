-- introducing variables and io.read() used properly
-- string concatenation (nerd word meaning join) using .. <-2 dots

function main()
	print("Hello. We are going to talk to each other...") -- Spooky!!!
	print("I will ask you a question on screen.")
	print("You type a response and press Enter.")
	print() 						-- Print a blank line
	
	io.write("Type your name_") 	-- io.write() does NOT move to the next line
	name = io.read()				-- io.read() stores what you type when you press Enter
	io.write("Type your age_")
	age = io.read()
	
	--[[You can see we are using the 2 lines
		io.write(Some text here)
		var = io.read() -- var is any variable such as name, age, height etc
	]]
	print("Hello "..name)
	print("You are ".. age .. " years old")			-- the .. dots join words (strings) together
end

main()

print("Press Enter to quit")
io.read()
