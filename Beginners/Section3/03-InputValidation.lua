function input(prompt, dataType) 	-- get input from user
	dataType = dataType or "string" -- if not supplied then give default value
	while true do					-- break not required as return used instead
		io.write(prompt .. "_")
		local userInput = io.read()
		if dataType == "string" then
			return userInput
		elseif dataType == "int" or dataType == "float" then
			if tonumber(userInput) ~= nil then
				return tonumber(userInput)
			else
				print("Enter a number ".. userInput .. " does not work")
			end
		elseif dataType == "bool" then
			if userInput == "y" or userInput == "yes" then
				return true
			elseif userInput == "n" or userInput == "no" then
				return false
			else
				print("Enter y or n ".. userInput .. " does not work")
			end
		end
	end
end

function main()
	name = input("what is your name?")
	age = input("How old are you?", "int")
	likesLua = input("Do you like Lua? (y/n)", "bool")
	
	print("User "..name.." is "..age.. " years old")
	print("Next year you will be ".. age + 1 .. " years old")
	if likesLua then
		print(name.." likes Lua")
	else
		print(name.." does not like Lua")
	end
end

main() -- program starts here
input("Press Enter to quit")