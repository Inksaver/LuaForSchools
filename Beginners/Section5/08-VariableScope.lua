--[[this file will cause an error
    07-VariableScope.lua:21: attempt to concatenate global 'myString' (a nil value)
]]
local function input(prompt)
	--[[ get input from user ]]
	io.write(prompt .. "_")
	return io.read()
end

local function main()
	local myString = "Hello"

	print("The variable myString contains: "..myString)
	print()

	myString = myString.." Goodbye"
	print("The variable 'myString' contains: "..myString)
end

main()
print("The variable 'myString' contains: ".. myString) -- error!
input("Enter to quit")
