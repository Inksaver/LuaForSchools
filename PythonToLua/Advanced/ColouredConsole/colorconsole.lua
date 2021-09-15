UI = require "ui"

local function utf8length(str)
	--[[ # or .len counts the bytes of a string, so gives incorrect length of UTF8 chars
		 use: local length = text:utf8len() 
	]]
	local asciiLength = 0
	local utf8length = 0
	for i = 1, #str do
		if string.byte(str:sub(i,i)) < 128 then
			asciiLength = asciiLength + 1
		else
			utf8length = utf8length + 1
		end
	end
	if utf8length > 0 then -- only 3 byte chars used in this script
		utf8length = utf8length / 3
	end
	
	return asciiLength + utf8length
end
string.utf8len = utf8length
local function lpad(text, length, char)
	--[[Pads str to length len with char from right
		test = test:lpad(8, ' ') or test = string.lpad(test, 8, ' ')]]
	if char == nil then char = ' ' end
	local padding = ''
	local textlength = text:utf8len()
	for i = 1, length - textlength do
		padding = padding..char
	end
	return text..padding
end
string.lpad = lpad -- adds additional function to the string library
string.PadRight = lpad
local function rpad(text, length, char)
	--[[Pads str to length len with char from left]]
	if char == nil then char = ' ' end
	local padding = ''
	local textlength = text:utf8len()
	for i = 1, length - textlength do
		padding = padding..char
	end
	return padding..text
end
string.rpad = rpad -- adds additional function to the string library
string.PadLeft = rpad

local function BoxDemo()
	local numLines = 0
	UI.Clear()
	numLines = numLines + UI.DrawBoxOutline("d", "top", "yellow", "black")
	--DrawBoxBody(style, text, boxAlign, foreColor, backColor,
	--textColor = "WHITE", string textBackColor = "BLACKBG", string textAlign = "left", int width = 0)
	numLines = numLines + UI.DrawBoxBody("d","This is ~blue~blue and ~green~green text in a ~yellow~yellow box!","centre","yellow", "black", "white", "black", "centre")
	numLines = numLines + UI.DrawBoxOutline("d", "mid", "yellow", "black")
	numLines = numLines + UI.DrawBoxBody("d", "", "centre", "yellow", "black")
	numLines = numLines + UI.DrawBoxBody("d", "", "centre", "yellow", "black")
	numLines = numLines + UI.DrawBoxBody("d", "", "centre", "yellow", "black")
	numLines = numLines + UI.DrawBoxBody("d", "", "centre", "yellow", "black")
	numLines = numLines + UI.DrawBoxBody("d", "", "centre", "yellow", "black")
	numLines = numLines + UI.DrawBoxOutline("d", "bottom", "yellow", "black")
	UI.AddLines(5, numLines)
	UI.DrawLine("d", "WHITE", "black")
	UI.DisplayMessage("", true, false)
end

local function DemoWithUI()
	UI.Clear()
	numLines = UI.ColorPrint('~WHITE~'.."WHITE..This line is white on black.")
	numLines = numLines + UI.ColorPrint('~GREY~'.."GREY..This line is grey on black.")
	numLines = numLines + UI.ColorPrint('~DGREY~'.."DGREY..This line is dark grey on black.")
	numLines = numLines + UI.ColorPrint('~BLUE~'.."BLUE..This line is blue on black.")
	numLines = numLines + UI.ColorPrint('~GREEN~'.."GREEN..This line is green on black.")
	numLines = numLines + UI.ColorPrint('~CYAN~'.."CYAN..This line is cyan on black.")
	numLines = numLines + UI.ColorPrint('~RED~'.."RED..This line is red on black.")
	numLines = numLines + UI.ColorPrint('~MAGENTA~'.."MAGENTA..This line is magenta on black.")
	numLines = numLines + UI.ColorPrint('~YELLOW~'.."YELLOW..This line is yellow on black.")
	numLines = numLines + UI.ColorPrint('~DBLUE~'.."DBLUE..This line is dark blue on black.")
	numLines = numLines + UI.ColorPrint('~DGREEN~'.."DGREEN..This line is dark green on black")
	numLines = numLines + UI.ColorPrint('~DCYAN~'.."DCYAN..This line is dark cyan on black.")
	numLines = numLines + UI.ColorPrint('~DRED~'.."DRED..This line is dark red on black.")
	numLines = numLines + UI.ColorPrint('~DMAGENTA~'.."DMAGENTA..This line is dark magenta on black.")
	numLines = numLines + UI.ColorPrint('~DYELLOW~'.."DYELLOW..This line is dark yellow on black.")
	numLines = numLines + UI.ColorPrint('~BLACK~'..'~WHITEBG~'.."BLACK..WHITEBG..This line is black on white.")
	numLines = numLines + UI.ColorPrint('~WHITE~'.."WHITE..This line is white, and now "..'~RED~'.."..RED..red on black.")
	numLines = numLines + UI.ColorPrint('~GREEN~'..'~REDBG~'.."GREEN..REDBG..This line is green "..'~RED~'..'~GREENBG~'.."RED..GREENBG.. on red.")
	numLines = numLines + UI.ColorPrint('~RED~'..'~GREENBG~'.."RED..GREENBG..This line is red"..'~GREEN~'..'~REDBG~'.."..GREEN..REDBG.. on green.")
	numLines = numLines + UI.AddLines(5, 19)
	numLines = numLines + UI.DrawLine("d", "WHITE", "BLACKBG")
	UI.DisplayMessage("Press Enter to continue...", true, false)
end

local function DemoWithoutUI()
	--[[ Demonstrate all colors and backgrounds without using UI class]]
	-- get os
	local cpath = package.cpath
	local OS = ""
	if cpath:find('\\') == nil then
		OS = 'posix'
	else
		OS = 'nt'
	end
	-- set console size
	if OS == 'nt' then
		os.execute("mode ".. 80 ..",".. 33)
	else
		local cmd = "'\\e[8;".. 80 ..";".. 33 .."t'"
		os.execute("echo -e "..cmd)
	end
	-- clear screen
	if OS == 'nt' then
		os.execute("cls")
	else
		os.execute("clear")
	end
	local spaces = '                                                      '
	io.write(string.char(27).."[0m") --reset
	print(string.char(27).."[100mstring.char(27)..'[100m'  "..spaces)
	print(string.char(27).."[101mstring.char(27)..'[101m'  "..spaces)
	print(string.char(27).."[102mstring.char(27)..'[102m'  "..spaces)
	print(string.char(27).."[103mstring.char(27)..'[103m'  "..spaces)
	print(string.char(27).."[104mstring.char(27)..'[104m'  "..spaces)
	print(string.char(27).."[105mstring.char(27)..'[105m'  "..spaces)
	print(string.char(27).."[106mstring.char(27)..'[106m'  "..spaces)
	print(string.char(27).."[107mstring.char(27)..'[107m'  "..spaces)
	print(string.char(27).."[40mstring.char(27)..'[40m'   "..spaces)
	print(string.char(27).."[41mstring.char(27)..'[41m'  "..spaces)
	print(string.char(27).."[42mstring.char(27)..'[42m'  "..spaces)
	print(string.char(27).."[43mstring.char(27)..'[43m'  "..spaces)
	print(string.char(27).."[44mstring.char(27)..'[44m'  "..spaces)
	print(string.char(27).."[45mstring.char(27)..'[45m'  "..spaces)
	print(string.char(27).."[46mstring.char(27)..'[46m'  "..spaces)
	print(string.char(27).."[47mstring.char(27)..'[47m'   "..spaces)
	io.write(string.char(27).."[0m") --reset
	print(string.char(27).."[30mstring.char(27)..'[30m'  "..spaces)
	print(string.char(27).."[31mstring.char(27)..'[31m'  "..spaces)
	print(string.char(27).."[32mstring.char(27)..'[32m'  "..spaces)
	print(string.char(27).."[33mstring.char(27)..'[33m'  "..spaces)
	print(string.char(27).."[34mstring.char(27)..'[34m'  "..spaces)
	print(string.char(27).."[35mstring.char(27)..'[35m'  "..spaces)
	print(string.char(27).."[36mstring.char(27)..'[36m'  "..spaces)
	print(string.char(27).."[37mstring.char(27)..'[37m'  "..spaces)
	print(string.char(27).."[90mstring.char(27)..'[90m'   "..spaces)
	print(string.char(27).."[91mstring.char(27)..'[91m'  "..spaces)
	print(string.char(27).."[92mstring.char(27)..'[92m'  "..spaces)
	print(string.char(27).."[93mstring.char(27)..'[93m'  "..spaces)
	print(string.char(27).."[94mstring.char(27)..'[94m'  "..spaces)
	print(string.char(27).."[95mstring.char(27)..'[95m'  "..spaces)
	print(string.char(27).."[96mstring.char(27)..'[96m'  "..spaces)
	print(string.char(27).."[97mstring.char(27)..'[97m'   "..spaces)

	io.write(string.char(27).."[0mPress Enter to continue...")
	io.read()
	if OS == 'nt' then
		os.execute("mode ".. 80 ..","..25)
	else
		local cmd = "'\\e[8;".. 80 ..";".. 25 .."t'"
		os.execute("echo -e "..cmd)
	end
end

local function DisplayMessageDemo()
	UI.Clear()
	UI.DisplayMessage("This shows a message, timed for 2 secs", false, true, "cyan", "dgrey")
	UI.DisplayMessage("Same method, but requiring Enter to continue", true, false, "green","black")
end

local function InputBoxDemo()
	UI.Clear()
	--[[InputBox(style, returnType, title, boxMessage, inputPrompt, promptChar, foreColor, backColor, width, minReturnLen, maxReturnLen, withTitle)]]
	local userInput = UI.InputBox("s", "string", "Input Box Demo", "~white~What is your opinion of this Input Box demonstration?", "Type your comment",
									">_", "red","black", 60, 1, 50, false)
	UI.ColorPrint("Your opinion was:\n"..userInput)
	UI.DisplayMessage("", true, false)
end

local function GridDemo()
	UI.Clear()
	local columns = { 10, 30, 20, 20 }
	local alignments = { "left", "centre", "centre", "centre" }
	--[[ DrawGridBody(style, part, columns, boxColor, boxBackColor, textColor, textBackColor, textLines, alignments)]]
	UI.DrawBoxOutline("s", "top", "yellow", "black") -- draw top of single box and title
	--[[ DrawBoxBody(style, text, boxAlign, foreColor, backColor, textColor, textBackColor, textAlign, width]]
	UI.DrawBoxBody("s", "This is ~magenta~Dos~red~Excel!", "centre", "yellow", "black", "white", "black","centre")
	-- draw column headers
	local textLines = { "", "~green~Column A", "~green~Column B", "~green~Column C" }
	--DrawGridOutline(style, part, columns, foreColor, backColor, midMargin
	UI.DrawGridOutline("s", "top", columns, "yellow", "black", true)
	UI.DrawGridBody("s", "body", columns, "yellow", "black", "green", "black", textLines, alignments)
	-- draw main columns
	UI.DrawGridOutline("s", "mid", columns, "yellow", "black")
	alignments = { "right", "left", "centre", "right" }
	textLines = { "~green~Row 1: ", "~white~Cell(1,1)", "~white~Cell(1,2)", "~white~Cell(1,3)" }
	UI.DrawGridBody("s", "body", columns, "yellow", "black", "green", "black", textLines, alignments);
	UI.DrawGridOutline("s", "mid", columns, "yellow", "black")
	textLines = { "~green~Row 2: ", "~grey~Cell(2,1)", "~grey~Cell(2,2)", "~grey~Cell(2,3)" }
	UI.DrawGridBody("s", "body", columns, "yellow", "black", "green", "black", textLines, alignments);
	UI.DrawGridOutline("s", "mid", columns, "yellow", "black")
	textLines =  { "~green~Row 3: ", "~dgrey~Cell(3,1)", "~dgrey~Cell(3,2)", "~dgrey~Cell(3,3)" }
	UI.DrawGridBody("s", "body", columns, "yellow", "black", "green", "black", textLines, alignments);
	UI.DrawGridOutline("s", "mid", columns, "yellow", "black")
	textLines = { "~green~Row 4: ", "~dgrey~align='left='", "~dgrey~align='centre'", "~dgrey~align='right'" }
	UI.DrawGridBody("s", "body", columns, "yellow", "black", "green", "black", textLines, alignments)
	UI.DrawGridOutline("s", "bottom", columns, "yellow", "black")
	UI.AddLines(5, 13)
	UI.DrawLine("d", "white", "black")
	UI.DisplayMessage("", true, false)
end

local function GuessTheNumber()
	--[[ use demonstration methods in the UI class ]]
	local description = "\n\n~yellow~Welcome to the most incredible\n\n"..
						 "~red~'Guess The Number Game'\n\n"..
						 "~green~You have ever seen!\n\n"
	local intro = "This is really annoying, but students like it..."
	--UI.GameShowIntro(description, intro)
	UI.Clear()
	local numLines = UI.DrawMultiLineBox("s", description, "yellow", "black", "white", "black", "centre", "center", 60)
	numLines = numLines + UI.AddLines(2)
	intro = intro:PadLeft(((windowWidth - #intro) / 2) + #intro)
	intro = intro:PadRight(windowWidth)
	numLines = numLines + UI.Teletype(intro, .02, 'WHITE', 'REDBG')
	UI.AddLines(5, numLines)
	UI.DrawLine("d", "white", "black")
	UI.DisplayMessage("", true, false)
	
	math.randomseed(os.time())
	local secretNumber = math.random(1, 100)
	local guess = 0
	local attempts = 0
	while guess ~= secretNumber do
		attempts = attempts + 1
		UI.Clear()
		local userInput = UI.InputBox("s", "int", "~magenta~Guess The Number", "~cyan~See if you can guess the number",
								"Type your guess for the secret number,(1 to 100)", ">_", "green", "black", 60, 1, 100);
		guess = tonumber(userInput)
		if guess > secretNumber then
			UI.DisplayMessage("Sorry, your guess "..guess.." was too high", false, true, "magenta", "black", 3)
		elseif guess < secretNumber then
			UI.DisplayMessage("Sorry, your guess "..guess.." was too low", false, true, "cyan", "black", 3)
		end
	end

	--local attempts = UI.GamePlayGame(secretNumber)
	local ending = "\n\n~red~Well done! Player of the year!\n\n"..
					"~green~You smashed it!\n\n"..
					"~yellow~You guessed the secret number: "..secretNumber.."\n\n"..
					"~magenta~with just "..attempts.." attempts!\n\n"
	--UI.GameShowEnding(ending)
	UI.Clear()
	local numLines = UI.DrawMultiLineBox("s", ending, "yellow", "black", "white", "black", "centre", "centre")
	numLines = numLines + UI.AddLines(2)
	UI.AddLines(5, numLines)
	UI.DrawLine("d", "white", "black")
	UI.DisplayMessage("", true, false)
end

local function LineDemo()
	local numLines = 0
	UI.Clear()
	--DrawLine(string style, string foreColor, string backColor, int width = 0, string align = "left")
	numLines = numLines + UI.DrawLine("s", "red", "blackbg", 5)
	numLines = numLines + UI.DrawLine("s", "red", "blackbg", 10)
	numLines = numLines + UI.DrawLine("s", "red", "black", 20)
	numLines = numLines + UI.DrawLine("s", "red", "black", 40)
	numLines = numLines + UI.DrawLine("s", "red", "black", 60)
	numLines = numLines + UI.DrawLine("s", "red", "black")
	numLines = numLines + UI.DrawLine("s", "red", "black", 60, "right")
	numLines = numLines + UI.DrawLine("s", "red", "black", 40, "right")
	numLines = numLines + UI.DrawLine("s", "red", "black", 20, "right")
	numLines = numLines + UI.DrawLine("s", "red", "black", 10, "right")
	numLines = numLines + UI.DrawLine("s", "red", "black", 5, "right")
	numLines = numLines + UI.DrawLine("d", "white", "black")
	numLines = numLines + UI.DrawLine("d", "grey", "black")
	numLines = numLines + UI.DrawLine("d", "dgrey", "black")
	numLines = numLines + UI.DrawLine("d", "green", "black")
	numLines = numLines + UI.DrawLine("d", "black", "green")
	numLines = numLines + UI.DrawLine("d", "red", "white")
	numLines = numLines + UI.DrawLine("d", "blue", "black", 40, "centre")
	numLines = numLines + UI.DrawLine("d", "cyan", "black", 50, "centre")
	UI.AddLines(5, numLines)
	UI.DrawLine("d", "white", "black")
	UI.DisplayMessage("", true, false)
end

local function MultiBoxDemo()
	UI.Clear()
	local styles 		= {"d","s","d" }
	local boxSizes 		= { 15, 40, 25 }
	local foreColors 	= { "red", "green", "blue" }
	local backColors 	= { "black", "black", "grey" }
	local textLines 	= { "~blue~blue 14 chars", "~red~red text 40 chars", "~dyellow~dark yellow 25 chars" }
	local emptyLines 	= {"","","" }
	local alignments 	= { "left", "centre", "right" }
	local padding 		= 0
	UI.DrawMultiBoxOutline(styles, "top", boxSizes , foreColors, backColors, padding)
	UI.DrawMultiBoxBody(styles, boxSizes, foreColors, backColors, textLines, alignments, padding)
	UI.DrawMultiBoxOutline(styles, "mid", boxSizes, foreColors, backColors, padding)
	UI.DrawMultiBoxBody(styles, boxSizes, foreColors, backColors, emptyLines, alignments, padding)
	UI.DrawMultiBoxBody(styles, boxSizes, foreColors, backColors, emptyLines, alignments, padding)
	textLines = { "~yellow~align='left'", "~yellow~align='centre'", "~red~align='right'" }
	UI.DrawMultiBoxBody(styles, boxSizes, foreColors, backColors, textLines, alignments, padding)
	UI.DrawMultiBoxBody(styles, boxSizes, foreColors, backColors, emptyLines, alignments, padding)
	UI.DrawMultiBoxBody(styles, boxSizes, foreColors, backColors, emptyLines, alignments, padding)
	UI.DrawMultiBoxOutline(styles, "bottom", boxSizes, foreColors, backColors, padding)
	UI.AddLines(5, 9)
	UI.DrawLine("d", "white", "black")
	UI.DisplayMessage("", true, false)
end

local function PrintDemo()
	UI.Clear()
	UI.ColorPrint("1. UI.Clear();")
	UI.ColorPrint("2. UI.ColorPrint('~yellow~~blackbg~This demo uses 6 lines of code')")
	UI.ColorPrint("3. UI.ColorPrint('~green~~blackbg~This line is green on black')")
	UI.ColorPrint("4. UI.AddLines(5, 7)")
	UI.ColorPrint("5. UI.DrawLine('d', 'white', 'black')")
	UI.ColorPrint("6. UI.DisplayMessage('', true, false)")
	UI.AddLines(5, 7)
	UI.DrawLine("d", "white", "black")
	UI.DisplayMessage("", true, false)
end

local function PrintWithoutUI()
	-- 37 lines of code compared with 10 in PrintDemo
	--[[
		local windows =
	{
		black = '0', blue = '1', green = '2', aqua = '3',
		red = '4', purple = '5', yellow = '6',  white = '7',
		grey = '8', lightblue = '9', lightgreen = 'A', lightaqua = 'B',
		lightred = 'C', lightpurple = 'D', lightyellow = 'E', brightwhite = 'F'
	}
	-- Linux termial colour codes
	local linuxFg =
	{
		black = '30', red = '31',  green = '32', yellow = '33',
		blue = '34', magenta = '35',  cyan = '36',  white = '37',
	}
	local linuxBg =
	{
		black = '40', red = '41',  green = '42', yellow = '43',
		blue = '44', magenta = '45',  cyan = '46',  white = '47'
	}
	]]
	local cpath = package.cpath
	local OS = "nt"
	if cpath:find('\\') == nil then OS = 'posix' end
	if OS == 'nt' then
		os.execute("color "..'0'..'E') -- back, fore 0E = yellow on black hard coded
	else
		local bc = "'\\e["..'40'.."m'" -- back, fore 40, 33 = yellow on black hard coded
		os.execute("echo -e "..bc)
		local fc = "'\\e[93m'"
		os.execute("echo -e "..fc)
		--fc = "'\\e["93"m'"
		--os.execute("echo -e "..fc)
	end
	-- clear screen
	if OS == 'nt' then os.execute("cls")
	else os.execute("clear") end
	print("1. local cpath = package.cpath")
	print("2. local OS = 'nt'")
	print("3. if cpath:find('\\') == nil then OS = 'posix' end")
	print("4. if OS == 'nt' then os.execute('color '..'0'..'E')")
	print("5. else")
	print("6. local bc = ''\\e['..'40'..'m''")
	print("7. os.execute('echo -e '..bc)")
	print("8. local fc = ''\\e['..'1'..'m''")
	print("9. os.execute('echo -e '..fc)")
	print("10. fc = ''\\e['..'93'..'m''")
	print("11. os.execute('echo -e '..fc)")
	print("12. end")
	print("13. if OS == 'nt' then os.execute('cls')")
	print("14. else os.execute('clear') end")
	print("15. print("..string.char(27).."[92m"..string.char(27).."[40mThis line is green on black)"..string.char(27).."[0m")
	print("16. for i = 1, 2 do print() end")
	print("17. print(''.PadRight(80, '═'))")
	print("18. io.write('Press Enter to continue...'")
	print("19. io.read()")
	for i = 1, 2 do print() end
	print((""):PadRight(80, '═'))
	io.write("Press Enter to continue...")
	io.read()
end

local function GetInput(demoType, description)
	local userInput = ''
	UI.Clear()
	local numLines = UI.DrawMultiLineBox("s", description, "yellow", "black", "white", "black", "left")
	numLines = numLines + UI.AddLines(5, numLines) -- pad Console to leave 5 empty lines
	numLines = numLines + UI.DrawLine("d", "white", "black") -- now leaves 4 empty lines
	if demoType == "string" then
		-- GetString(prompt, promptChar, textColor, backColor, withTitle, min, max)
		userInput = UI.GetString(numLines, "UI.GetString: Type your name (1-10 chars)", ">_", "green", "black", true, 1, 10)
	elseif demoType == "int"  then
		userInput = UI.GetInteger(numLines, "UI.GetInteger: Type your age (5-100)", ">_", "cyan", "black", 5, 100)
	elseif demoType == "real" then
		userInput = UI.GetRealNumber(numLines, "UI.GetRealNumber: Type your height in metres (0.5 to 2.0)", ">_", "magenta", "black", 0.5, 2)
	elseif demoType == "bool" then
		userInput = UI.GetBoolean(numLines, "UI.GetBoolean: Is this library useful (y/n)?", ">_", "blue", "black")
	end
	return userInput
end	

local function InputDemo()
	local description = "The user input methods are:\n\n"..
						"~green~UI.GetString ~white~to get a string typed by the user. "..
						"There is an option to set minimum and maximum length,"..
						" and to convert to TitleCase.\n\n"..
						"~cyan~UI.GetInteger ~white~to get an integer value. Minimum and max values can be specified.\n\n"..
						"~magenta~UI.GetRealNumber ~white~similar to UI.GetInteger, allows for real numbers to be entered.\n\n"..
						"~blue~UI.GetBoolean ~white~requires the user to type 'y' or 'n' and returns a boolean value.\n\n"..
						"~green~Test ~white~each one out with ~blue~Enter ~white~only, or wrong numbers, too many characters etc.\n\n"..
						"~red~Try and break it!"
						
	--local retValue = UI.GetInputDemo("string", description)
	local retValue = GetInput("string", description)
	UI.DisplayMessage("You entered "..retValue,false, true)
	retValue = GetInput("int", description)
	UI.DisplayMessage("You entered "..retValue, false, true)
	retValue = GetInput("real", description)
	UI.DisplayMessage("You entered "..retValue, false, true)
	retValue = GetInput("bool", description)
	UI.DisplayMessage("You entered "..tostring(retValue)..". Enter to continue", true, false)
end

local function main()
	windowWidth = 80 		-- not 'local' therefore global scope, even though declared inside a function
	windowHeight = 25 		-- this is unique to Lua
	UI.SetConsole(windowWidth, windowHeight, "white", "black", false) --set to default size 80 x 25, white text on black bg
	UI.Clear()
	local quit = false
	while not quit do --present a menu of possible choices, which redraws after input errors and completing a task
		local title = "This is a demo of 'UI.Menu': Choose another demo from the following"
		local options = {}
		table.insert(options, "~green~Show a mix of different colours")
		table.insert(options, "~dgreen~Show colour mix NOT using UI (DemoWithoutUI())")
		table.insert(options, "~green~Show 'UI.Print' method")
		table.insert(options, "~dgreen~Show 'Print' NOT using UI (PrintWithoutUI())")
		table.insert(options, "~green~Show 'UI.DrawLine' method")
		table.insert(options, "~green~Show 'UI.DrawBox..' methods")
		table.insert(options, "~green~Show 'UI.MultiBox..' methods")
		table.insert(options, "~green~Show 'UI.Grid..' methods")
		table.insert(options, "~green~Show 'UI.InputBox' method")
		table.insert(options, "~green~Show 'UI.DisplayMessage' method")
		table.insert(options, "~green~Show 'UI.User Input' methods")
		table.insert(options, "~red~Play the awesome 'Guess The Number' Game!")
		table.insert(options, "~magenta~Quit")
		--[[Menu( string style,  string title, string promptChar,
				List<string> textLines, string foreColor = "WHITE",
				string backColor = "BLACKBG",
				string align = "left", int width = 0)]]
		local choice, _ = UI.Menu("d", title, ">_", options)
		if choice == 1 then
			DemoWithUI()
        elseif choice == 2 then
			DemoWithoutUI()
        elseif choice == 3 then
			PrintDemo()
        elseif choice == 4 then
			PrintWithoutUI()
        elseif choice == 5 then
			LineDemo()
		elseif choice == 6 then
			BoxDemo()
        elseif choice == 7 then
			MultiBoxDemo()
        elseif choice == 8 then
			GridDemo()
        elseif choice == 9 then
			InputBoxDemo()
        elseif choice == 10 then
			DisplayMessageDemo()
		elseif choice == 11 then
			InputDemo()
        elseif choice == 12 then
			GuessTheNumber()
        elseif choice == 13 then
			quit = true
		end
		UI.Quit(false) -- exit without pressing a key
	end
end
main()