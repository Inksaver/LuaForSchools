-- using a module scope variable
local myString -- declared here but not given a value

local function input(prompt)
    --[[ get input from user ]]
    io.write(prompt .. "_")
    return io.read()
end

local function main()
    myString = "Hello" -- module scope variable given a value

    print("The variable myString contains: "..myString)
    print()

    myString = myString.." Goodbye" -- module scope variable given a modified value
    print("The variable 'myString' contains: "..myString)
end

main()
print("The variable 'myString' contains: ".. myString) -- no error as using module scope variable.
input("Enter to quit")