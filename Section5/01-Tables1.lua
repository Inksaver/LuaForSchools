-- introduction to tables

function input(prompt)
	--[[ get input from user ]]
	io.write(prompt .. "_")
	return io.read()
end

function main()
	-- your code here
	-- Python has a list dataType. Lua has a table instead

	colours = {"red", "green", "blue"} --create a table of colours
	
	print("print(colours): \t\t\t"..tostring(colours)) 			-- table: 0x00698170 Yuk!
	print("print(colours[1]): \t\t\t"..colours[1])				-- 'red'
	print("print(colours[2]): \t\t\t"..colours[2])				-- 'green'
	print("print(colours[3]): \t\t\t"..colours[3])				-- 'blue'
	print("print(table.concat(colours, ',')): \t"..table.concat(colours, ",")) -- 'red,green,blue'
	input("Press Enter to quit")
end

main() -- program starts here