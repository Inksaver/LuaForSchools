--[[
https://pastebin.com/qxxS26r3
utf8 box characters stored here for easy copy/paste:
 
┌ ┬ ┐ ─ ╔ ╦ ╗ ═
 
├ ┼ ┤ │ ╠ ╬ ╣ ║
 
└ ┴ ┘   ╚ ╩ ╝
Use the template below to create an output that looks like this:
Ignore the [ and ]. They just allow multi-line comments!
]]
 
--[[                                         
╔═══════════════════════════════════════╗
║Welcome to Lua programming!            ║
║      This line is in the middle       ║
║            This one is right-justified║
╚═══════════════════════════════════════╝
]]
    
-- Use either print() or io.write()
-- use spaces to pad the text
-- (remember io.write() does NOT move to a new line


	
-- Use either print() or io.write()
-- (remember io.write() does NOT move to a new line
-- Also use \t to line up the text
-- The comment above is 5 x 8 TAB spaces wide... (41 characters)

function main()
	-- your code goes here
	-- method 1 using print statements
	print("╔═══════════════════════════════════════╗")
	print("║Welcome to Lua Programming!            ║")
	print("║      This line is in the middle       ║")
	print("║            This one is right-justified║")
	print("╚═══════════════════════════════════════╝")
	
	-- method 2 using io.write
	io.write("╔═══════════════════════════════════════╗\n")
	io.write("║Welcome to Lua Programming!            ║\n")
	io.write("║      This line is in the middle       ║\n")
	io.write("║            This one is right-justified║\n")
	io.write("╚═══════════════════════════════════════╝\n")

	-- method 3 printing a text block. Similar to a multi-line comment without the -- start
local output = [[
╔═══════════════════════════════════════╗
║Welcome to Lua programming!            ║
║      This line is in the middle       ║
║            This one is right-justified║
╚═══════════════════════════════════════╝
]]
	print(output)
end

main()