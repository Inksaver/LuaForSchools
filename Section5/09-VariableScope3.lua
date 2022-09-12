-- creating a local variable inside main() and passing it out
local function input(prompt)
    --[[ get input from user ]]
    io.write(prompt .. "_")
    return io.read()
end

local function main()
    local myString = "Hello" -- this variable is local to main() only

    print("The variable myString contains: "..myString)
    print()

    myString = myString.." Goodbye"
    print("The variable 'myString' contains: "..myString)
    return myString --note passing the value of myString out
end

local myString = main() -- this variable is different from the one created inside main()
print("The variable 'myString' contains: ".. myString) 
input("Enter to quit")