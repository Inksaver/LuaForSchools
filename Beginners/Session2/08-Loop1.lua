-- demonstrates use of the while..do..end loop
--[[
 In the previous script, it only runs once. If you type in the
 words "your name" you get a brownie point. Otherwise you are wrong.
 But you can only do it once, then you have to re-start.
 Use a loop to allow another chance:
]]--
function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function main()
	while true do -- true is always True, so this is an infinite loop
		userInput = input('Type "your name"')
		if userInput == "your name" then	-- user typed in 'your name' as instructed!
			print("That is correct!")
			break 							-- break out of the loop
		else								-- user typed in their real name
			print(string.upper("Unfortunately, that is wrong! Try again...\n")) -- shout at the user! (UPPER CASE)
		end
	end

	input("Press Enter to quit")
end

main()
