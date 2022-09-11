-- demonstrates repeat loop and math.random
function input(prompt)
	io.write(prompt .. "_")
	return io.read()
end

function main()
	repeat 
		-- get an input from the user but do absolutely nothing with it except check for quit!
		question = input("Ask the magic 8 ball a question: (q to quit)")
		answer = math.random(1, 8)  --returns a random whole number between 1 and 8
		if answer == 1 then
			print("It is certain")

		elseif answer == 2 then
			print ("Outlook good")

		elseif answer == 3 then
			print ("You may rely on it")

		elseif answer == 4 then
			print ("Ask again later")

		elseif answer == 5 then
			print ("Concentrate and ask again")

		elseif answer == 6 then
			print ("Reply hazy, try again")

		elseif answer == 7 then
			print ("My reply is no")

		elseif answer == 8 then
			print ("My sources say no")
		end
	until question == "q"
end

main()
input("Press Enter to quit")
