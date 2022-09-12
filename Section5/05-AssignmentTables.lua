 --[[
    tables assignment:
	Complete the skeleton code below to do the following:
	1. Add 3 names to the empty table myFriends
	2. Ask the user to select a name to be deleted from the table
	]]
 
local myFriends = {}    -- table created here so is available to all functions
 
local function input(prompt) 
	--[[ get input from user ]]
	io.write(prompt .. "_")
	return io.read()
end

local function addToTable()
	--[[ Add a new friend to the table myFriends ]]
	local newName = input("Type the name of a new friend")
	local added = true	-- assume new name will be added to the table
	for key,value in ipairs(myFriends) do
		-- check if newName is already in the table
		-- set value of added as appropriate
	end
	if added then
		-- insert newName into table
	else
		-- tell user that name already exists
	end
	return added    -- true/false
end

local function displayTable()
	--[[ Display the contents of the table myFriends ]]
	for key,value in ipairs(myFriends) do
		-- display each key/value pair
	end
end

local function deleteFromTable()
	--[[ Delete a friend from the table myFriends ]]
	local oldName = input("Type the name of an ex-friend to delete")
	local deleted = false
	local index = 0
	for key,value in ipairs(myFriends) do
		-- check if oldName is in the table
		-- set deleted and index as appropriate
	end
	if deleted then
		-- remove the value at index
	else
		-- tell user that name not found
	end
	return deleted    -- true/false
end

local function main()
    --[[ Add 3 names to empty table and delete 1 ]]
    local count = 0
	-- do not use a for loop. Why not?
    repeat
        if addToTable() then -- true = name added, false = entered name exists
            count = count + 1
        end
    until count == 3
    displayTable()
    -- remove 1 name
    while not deleteFromTable() do end -- return value of function deleteFromTable() is true/false
	displayTable()
	input("Press Enter to quit")
end

main()