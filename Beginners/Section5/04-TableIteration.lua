 -- table iteration
function input(prompt)
	--[[ get input from user ]]
	io.write(prompt .. "_")
	return io.read()
end

function main()
    local found = false
    local myFriends = {"Fred", "Alice", "Jim", "Karen"}
    local userName = input("Please type your first name")
    for key, value in ipairs(myFriends) do
		print("Checking key: "..key.." value: "..value..": found = "..tostring(found))
        if userName:lower() == myFriends[key]:lower() then
            found = true
        end
    end
    if found then
        print("Hello friend")
    else
        print("I do not know you")
    end
	input("Press Enter to quit")
end

main()