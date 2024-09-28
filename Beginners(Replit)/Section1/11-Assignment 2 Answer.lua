--	Use the template below to create an output that looks like this:
--[[
utf8 box characters stored here for easy copy/paste:
 
┌ ┬ ┐ ─ ╔ ╦ ╗ ═
 
├ ┼ ┤ │ ╠ ╬ ╣ ║
 
└ ┴ ┘   ╚ ╩ ╝
┌───────────────────────────────────────┐
│	Personal Data Collection App		│
└───────────────────────────────────────┘
Please type your first name_
How old are you?_
What month is your birthday?_

┌───────────────────────────────────────┐
│Thank you for sharing your data.       │
│It will now be sold to scam websites.  │
│This is what we know about you:        │
└───────────────────────────────────────┘
	Name: 
	Age:
	Birth Month:
]]


-- create 3 variables called name, age, month to store the data
-- use print(), io.write(), input()
-- complete the output to include this data eg:

--[[
	Name: John
	Age: 10
	Birth Month: April
]]


function input(prompt)
	io.write(prompt .. "_") 		-- io.write() does NOT move to the next line
	return io.read()				-- io.read() sends what you typed in to where it was called
end

function main()
	-- your code starts here
	local top = "┌───────────────────────────────────────┐"
	local bottom = "└───────────────────────────────────────┘"
	-- 
	print(top)
	print("|    Personal Data Collection App       |")
	print(bottom)
	print()
	
	local name = input("Please type your first name")
	local age = input("How old are you?")
	local month = input("What month is your birthday?")
	
	print()
	print(top)
	print("│Thank you for sharing your data.       │")
	print("│It will now be sold to scam websites.  │")
	print("│This is what we know about you:        │")
	print(bottom)
	print()
	print("\tName:        "..name)
	print("\tAge:         "..age)
	print("\tBirth Month: "..month)
end

main()								-- program starts here