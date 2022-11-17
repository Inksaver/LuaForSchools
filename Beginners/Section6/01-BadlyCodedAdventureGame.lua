print("Welcome to an epic adventure game")
print("Coded by Inksaver\n")
io.write("Give your player a name_")
playerName = io.read()
print("Give your player a character")
print("\t1. Fighter")
print("\t2. Ninja")
print("\t3. Wizard")
print("\t4. Priest")
io.write("Type the number of your choice_")
choice = io.read()
playerStrength = 50
playerHealth = 50
playerInventory = {}
if choice == "1" then
	playerCharacter = "Fighter"
	playerStrength = 60
	playerHealth = 55
elseif choice == "2" then
	playerCharacter = "Ninja"
	playerStrength = 45
	playerHealth = 53
elseif choice == "3" then
	playerCharacter = "Wizard"
	playerStrength = 40
	playerHealth = 52
else
	playerCharacter = "Priest"
end
print("\n\nPlayer Properties")
print("\tName:        "..playerName)
print("\tCharacter:   "..playerCharacter)
print("\tStrength:    "..playerStrength)
print("\tHealth:      "..playerHealth)
keycardLocation = "hotel room"
swordLocation = "corridoor"

choice = 1
while choice ~= 4 do
	print("\nYou are in a hotel room, smelling of stale cigarettes (the room, not you..)")
	if keycardLocation == "hotel room" then
		print("There is a key card in this area")
	end
	print("What do you want to do?")
	print("\t1. Open you Inventory")
	if keycardLocation == "hotel room" then
		print("\t2. Examine the key card")
		print("\t3. Take the key card")
		print("\t4. Go East -> Corridoor")
	else
		print("\t2. Go East -> Corridoor")
	end
	io.write("Type the number of your choice_")
	choice = tonumber(io.read())
	if choice == 1 then
		if #playerInventory > 0 then
			local inventory = ""
			for _, item in ipairs(playerInventory) do
				inventory = inventory ..item.. ", "
			end
			print("\nIn your inventory is: ".. inventory)
		else
			print("\nYour inventory is empty")
		end
	elseif choice == 2 then
		if keycardLocation == "hotel room" then
			print("a magnetic strip key card: Property of Premier Inns")
		else -- go east
			choice = 4
		end
	elseif choice == 3 then
		if keycardLocation == "hotel room" then
			print("You take the keycard and put it in your backpack")
			keycardLocation = "player"
		else -- go east
			choice = 4
		end
	else
		choice = 4
	end
end

choice = 1
while choice < 4 do
	print("\nYou are in a corridoor, a dimly lit passage with a stained carpet")
	if swordLocation == "corridoor" then
		print("There is a sword in this area")
	end
	print("What do you want to do?")
	print("\t1. Open you Inventory")
	if swordLocation == "corridoor" then
		print("\t2. Examine the sword")
		print("\t3. Take the sword")
		print("\t4. Go East -> Lift")
		print("\t5. Go West -> Hotel room")
		print("\t6. Go North -> Reception")
	else
		print("\t2. Go East -> Lift")
		print("\t3. Go West -> Hotel room")
		print("\t4. Go North -> Reception")
	end
	io.write("Type the number of your choice_")
	choice = tonumber(io.read())
	if choice == 1 then
		if #playerInventory > 0 then
			local inventory = ""
			for _, item in ipairs(playerInventory) do
				inventory = inventory ..item.. ", "
			end
			print("\nIn your inventory is: ".. inventory)
		else
			print("\nYour inventory is empty")
		end
	elseif choice == 2 then
		if swordLocation == "corridoor" then
			print("a plastic sword. The dog has chewed the handle (Yuk!)")
		else
			choice = 4
		end
	elseif choice == 3 then
		if swordLocation == "corridoor" then
			print("You take the sword and put it in your backpack")
			swordLocation = "player"
		else -- go west
			choice = 5
		end
	else
		choice = 6
	end
end
if choice == 4 then
	
elseif choice == 5 then

else

end