-- Github defaults to 1 tab = 8 spaces so layout looks a bit weird. Use 4 spaces in your IDE/Text editor
--	Use the template below to create an output that looks like this:
--[[

-----------------------------------------
|    Personal Data Collection App       |
-----------------------------------------
Please type your first name_
How old are you?_
What month is your birthday?_

-----------------------------------------

Thank you for sharing your data.
It will now be sold to scam websites.
This is what we know about you:

++++++++++++++++++++++++++++++++++++++++++
	Name: 
	Age:
	Birth Month:
++++++++++++++++++++++++++++++++++++++++++


]]


-- create 3 variables called name, age, month to store the data
-- use print(), io.write(), input()
-- complete the output to include this data eg:

--[[

++++++++++++++++++++++++++++++++++++++++++
	Name: John
	Age: 10
	Birth Month: April
++++++++++++++++++++++++++++++++++++++++++

]]


function input(prompt)
	io.write(prompt .. "_") 		-- io.write() does NOT move to the next line
	return io.read()				-- io.read() sends what you typed in to where it was called
end

function main()
	-- your code starts here
end

main()								-- program starts here

input("Press Enter to quit>")
