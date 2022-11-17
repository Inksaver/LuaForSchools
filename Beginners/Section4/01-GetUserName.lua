local function getInput(prompt)
	io.write(prompt.. " >_")
	strInput = io.read()

	return strInput
end

local function quit()
	io.write("Enter to quit")
	io.read()
end

--Lua does not have a built in .title() function, so create one
function title(text)
	local buffer = {}
	local inWord = false

	for i = 1, #text do
		local c = string.sub(text, i, i)
		if inWord then
			table.insert(buffer, string.lower(c))
			if string.find(c, '%s') then
				inWord = false
			end
		else
			table.insert(buffer, string.upper(c))
			inWord = true
		end
	end

	return table.concat(buffer)
end

-- It is good coding practice to use a main() function
function main()
	-- assume user is too lazy to use a capital letter
	-- use .title() to sort the capital letters out on all words
	print("\nYour name (in Caps) is: " .. string.upper(getInput("What is your Name?")) .. "\n")
	print("\nYour name (in Title Case) is: " .. title(getInput("Both names please (in lower case)?")))
	quit()
end

-- Script runs from here: everything above is ignored until called
main() -- call the function main()
