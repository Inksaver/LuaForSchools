import os, time, random, sys
#import local files
import ui
import colorama
colorama.init()

def box_demo():
	num_lines = 0
	ui.clear()
	num_lines = num_lines + ui.draw_box_outline("d", "top", "yellow", "black")
	num_lines = num_lines + ui.draw_box_body("d","This is ~blue~blue and ~green~green text in a ~yellow~yellow box!","centre","yellow", "black", "white", "black", "centre")
	num_lines = num_lines + ui.draw_box_outline("d", "mid", "yellow", "black")
	num_lines = num_lines + ui.draw_box_body("d", "", "centre", "yellow", "black")
	num_lines = num_lines + ui.draw_box_body("d", "", "centre", "yellow", "black")
	num_lines = num_lines + ui.draw_box_body("d", "", "centre", "yellow", "black")
	num_lines = num_lines + ui.draw_box_body("d", "", "centre", "yellow", "black")
	num_lines = num_lines + ui.draw_box_body("d", "", "centre", "yellow", "black")
	num_lines = num_lines + ui.draw_box_outline("d", "bottom", "yellow", "black")
	num_lines = num_lines + ui.add_lines(5, num_lines)
	num_lines = num_lines + ui.draw_line("d", "white", "black")
	ui.display_message("", True, False)

def color_print_demo():
	ui.clear()
	ui.colorprint(ui.WHITE + "WHITE + This line is white on black.")
	ui.colorprint(ui.GREY + "GREY + This line is grey on black.")
	ui.colorprint(ui.DGREY + "DGREY + This line is dark grey on black.")
	ui.colorprint(ui.BLUE + "BLUE + This line is blue on black.")
	ui.colorprint(ui.GREEN + "GREEN + This line is green on black.")
	ui.colorprint(ui.CYAN + "CYAN + This line is cyan on black.")
	ui.colorprint(ui.RED + "RED + This line is red on black.")
	ui.colorprint(ui.MAGENTA + "MAGENTA + This line is magenta on black.")
	ui.colorprint(ui.YELLOW + "YELLOW + This line is yellow on black.")
	ui.colorprint(ui.DBLUE + "DBLUE + This line is dark blue on black.")
	ui.colorprint(ui.DGREEN + "DGREEN + This line is dark green on black")
	ui.colorprint(ui.DCYAN + "DCYAN + This line is dark cyan on black.")
	ui.colorprint(ui.DRED + "DRED + This line is dark red on black.")
	ui.colorprint(ui.DMAGENTA + "DMAGENTA + This line is dark magenta on black.")
	ui.colorprint(ui.DYELLOW + "DYELLOW + This line is dark yellow on black.")
	ui.colorprint(ui.BLACK + ui.WHITEBG + "BLACK + WHITEBG + This line is black on white.")
	ui.colorprint(ui.WHITE + "WHITE + This line is white, and now " + ui.RED + " + RED + red on black.")
	ui.colorprint(ui.GREEN + ui.REDBG + "GREEN + REDBG + This line is green " + ui.RED + ui.GREENBG + "RED + GREENBG +  on red.")
	ui.colorprint(ui.RED + ui.GREENBG + "RED + GREENBG + This line is red" + ui.GREEN + ui.REDBG + " + GREEN + REDBG +  on green.")
	ui.add_lines(5, 19)
	ui.draw_line("d", 'white', 'blackbg')
	ui.display_message("Press Enter to continue...", True, False)

def demo_without_ui():
	''' Demonstrate all colors and backgrounds without using UI class '''
	# get os
	OS = os.name
	window_width = 80
	window_height = 25
	# set console size
	if OS == 'nt':
		os.system(f'mode {window_width},{33}')
	else:    
		cmd = f"'\\e[8;{33};{window_width}t'"
		os.system("echo -e " + cmd) 
	# clear screen
	if OS == 'nt':
		os.system('cls')
	else:
		os.system('clear')
	spaces = '{spaces}            '
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.LIGHTWHITE_EX}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.LIGHTWHITE_EX  }}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.WHITE}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.WHITE          }}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.LIGHTBLACK_EX}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.LIGHTBLACK_EX  }}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.LIGHTBLUE_EX}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.LIGHTBLUE_EX   }}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.LIGHTGREEN_EX}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.LIGHTGREEN_EX  }}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.LIGHTCYAN_EX}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.LIGHTCYAN_EX   }}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.LIGHTRED_EX}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.LIGHTRED_EX    }}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.LIGHTMAGENTA_EX}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.LIGHTMAGENTA_EX}}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.LIGHTYELLOW_EX}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.LIGHTYELLOW_EX }}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.BLUE}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.BLUE           }}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.GREEN}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.GREEN          }}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.CYAN}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.CYAN           }}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.RED}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.RED            }}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.MAGENTA}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.MAGENTA        }}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.YELLOW}{{colorama.Fore.LIGHTWHITE_EX}}{{colorama.Back.YELLOW         }}{spaces}')
	print(f'{colorama.Fore.LIGHTWHITE_EX}{colorama.Back.BLACK + colorama.Style.BRIGHT}{{colorama.Fore.LIGHTWHITE_EX}}')
	
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.WHITE + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.WHITE + colorama.Style.NORMAL}}')
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.LIGHTBLACK_EX + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.LIGHTBLACK_EX + colorama.Style.NORMAL}}')	
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.LIGHTBLUE_EX + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.LIGHTBLUE_EX + colorama.Style.NORMAL}}')
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.LIGHTGREEN_EX + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.LIGHTGREEN_EX + colorama.Style.NORMAL}}')	
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.LIGHTCYAN_EX + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.LIGHTCYAN_EX + colorama.Style.NORMAL}}')
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.LIGHTRED_EX + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.LIGHTRED_EX + colorama.Style.NORMAL}}')
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.LIGHTMAGENTA_EX + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.LIGHTMAGENTA_EX + colorama.Style.NORMAL}}')
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.LIGHTYELLOW_EX + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.LIGHTYELLOW_EX + colorama.Style.NORMAL}}')
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.BLUE + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.BLUE + colorama.Style.NORMAL}}')
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.GREEN + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.GREEN + colorama.Style.NORMAL}}')	
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.CYAN + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.CYAN + colorama.Style.NORMAL}}')
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.RED + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.RED + colorama.Style.NORMAL}}')
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.MAGENTA + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.MAGENTA + colorama.Style.NORMAL}}')
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.YELLOW + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.YELLOW + colorama.Style.NORMAL}}')	
	print(f'{colorama.Style.RESET_ALL}{colorama.Fore.BLACK + colorama.Style.NORMAL}{colorama.Back.BLACK}'
		  f'{{colorama.Fore.BLACK}}{colorama.Style.RESET_ALL}')		


	input("Press Enter to continue...")
	if OS == 'nt':
		os.system(f'mode {window_width},{window_height}')
	else:    
		cmd = f"'\\e[8;{window_height};{window_width}t'"
		os.system("echo -e " + cmd)

def display_message_demo():
	ui.clear()
	ui.display_message("This shows a message, timed for 2 secs", False, True, "cyan", "dgrey")
	ui.display_message("Same method, but requiring Enter to continue", True, False, "green","black")

def game_play_game(secretNumber):
	guess = 0
	attempts = 0
	while guess != secretNumber:
		attempts = attempts + 1
		ui.clear()
		user_input = ui.input_box("s", "int", "~magenta~Guess The Number", "~cyan~See if you can guess the number",
			"Type your guess for the secret number,(1 to 100)", ">_", "white", "black", 60, 1, 100)
		guess = int(user_input)
		if guess > secretNumber:
			ui.display_message(f"Sorry, your guess {guess} was too high", False, True, "magenta", "black", 3)
		elif guess < secretNumber:
			ui.display_message(f"Sorry, your guess {guess} was too low", False, True, "cyan", "black", 3)

	return attempts

def game_show_ending(description):
	ui.clear()
	numLines = ui.draw_multi_line_box("s", description, "yellow", "black", "white", "black", "centre", "centre")
	numLines = numLines + ui.add_lines(2)
	ui.add_lines(5, numLines)
	ui.draw_line("d", "white", "black")
	ui.display_message("", True, False)

def game_show_intro(description, intro):
	ui.clear()
	numLines = ui.draw_multi_line_box("s", description, "yellow", "black", "white", "black", "centre", "center", 60)
	numLines = numLines + ui.add_lines(2)
	intro = intro.rjust(((ui.window_width - len(intro)) // 2) + len(intro))
	intro = intro.ljust(ui.window_width)
	numLines = numLines + ui.teletype(intro, .02, 'white', 'redbg')
	ui.add_lines(5, numLines)
	ui.draw_line("d", "white", "black")
	ui.display_message("", True, False)


def get_input_demo(demo_type, description):
	'''	Most UI operations should be done within this UI class
	Try to keep all I/O operations out of other classes
	This will make transfer of code to a GUI much easier    '''
	user_input = ''
	ui.clear()
	num_lines = ui.draw_multi_line_box("s", description, "yellow", "black", "white", "black", "left")
	num_lines = num_lines + ui.add_lines(5, num_lines) # pad Console to leave 5 empty lines
	num_lines = num_lines + ui.draw_line("d", "white", "black") # now leaves 4 empty lines
	if demo_type == "string":
		# GetString(prompt, promptChar, textColor, backColor, withTitle, min, max)
		user_input = ui.get_string(num_lines, "get_string: Type your name (1-10 chars)", ">_", "green", "black", True, 1, 10)
	elif demo_type == "int" :
		user_input = ui.get_integer(num_lines, "get_integer: Type your age (5-100)", ">_", "cyan", "black", 5, 100)
	elif demo_type == "real":
		user_input= ui.get_real_number(num_lines, "get_real_number: Type your height in metres (0.5 to 2.0)", ">_", "magenta", "black", 0.5, 2)
	elif demo_type == "bool":
		user_input = ui.get_boolean(num_lines, "get_boolean: Is this library useful (y/n)?", ">_", "blue", "black")

	return user_input

def grid_demo():
	ui.clear()
	columns = [ 10, 30, 20, 20 ]
	alignments = [ "left", "centre", "centre", "centre" ]
	ui.draw_box_outline("s", "top", "yellow", "black") # draw top of single box and title
	ui.draw_box_body("s", "This is ~magenta~Dos~red~Excel!", "centre", "yellow", "black", "white", "black","centre")
	# draw column headers
	text_lines = [ "", "~green~Column A", "~green~Column B", "~green~Column C" ]
	#draw_grid_outline(style, part, columns, foreColor, backColor, midMargin
	ui.draw_grid_outline("s", "top", columns, "yellow", "black", True)
	ui.draw_grid_body("s", "body", columns, "yellow", "black", "green", "black", text_lines, alignments)
	# draw main columns
	ui.draw_grid_outline("s", "mid", columns, "yellow", "black")
	alignments = [ "right", "left", "centre", "right" ]
	text_lines = [ "~green~Row 1: ", "~white~Cell(1,1)", "~white~Cell(1,2)", "~white~Cell(1,3)" ]
	ui.draw_grid_body("s", "body", columns, "yellow", "black", "green", "black", text_lines, alignments);
	ui.draw_grid_outline("s", "mid", columns, "yellow", "black")
	text_lines = [ "~green~Row 2: ", "~grey~Cell(2,1)", "~grey~Cell(2,2)", "~grey~Cell(2,3)" ]
	ui.draw_grid_body("s", "body", columns, "yellow", "black", "green", "black", text_lines, alignments);
	ui.draw_grid_outline("s", "mid", columns, "yellow", "black")
	text_lines =  [ "~green~Row 3: ", "~dgrey~Cell(3,1)", "~dgrey~Cell(3,2)", "~dgrey~Cell(3,3)" ]
	ui.draw_grid_body("s", "body", columns, "yellow", "black", "green", "black", text_lines, alignments);
	ui.draw_grid_outline("s", "mid", columns, "yellow", "black")
	text_lines = [ "~green~Row 4: ", "~dgrey~align='left='", "~dgrey~align='centre'", "~dgrey~align='right'" ]
	ui.draw_grid_body("s", "body", columns, "yellow", "black", "green", "black", text_lines, alignments)
	ui.draw_grid_outline("s", "bottom", columns, "yellow", "black")
	ui.add_lines(5, 13)
	ui.draw_line("d", "white", "black")
	ui.display_message("", True, False)
	
def guess_the_number():
	''' use demonstration methods in the UI class '''
	description = ("\n\n~yellow~Welcome to the most incredible\n\n"
						 "~red~'Guess The Number Game'\n\n"
						 "~green~You have ever seen!\n\n")
	intro = "This is really annoying, but students like it..."
	game_show_intro(description, intro)
	secret_number = random.randint(1, 100)
	attempts = game_play_game(secret_number)
	ending = (f"\n\n~red~Well done! Player of the year!\n\n"
					"~green~You smashed it!\n\n"
					f"~yellow~You guessed the secret number: {secret_number}\n\n"
					f"~magenta~with just {attempts} attempts!\n\n")
	game_show_ending(ending)

def input_box_demo():
	ui.clear()
	user_input = ui.input_box("s", "string", "Input Box Demo", "~white~What is your opinion of this Input Box demonstration?", "Type your comment",
									">_", "red","black", 60, 1, 50, False)
	print("Your opinion was:\n" + user_input)
	ui.display_message("", True, False)

def input_demo():
	description = ("The user input methods are:\n\n"  
				   "~green~ui.get_string ~white~to get a string typed by the user. " 
				   "There is an option to set minimum and maximum length," 
				   " and to convert to TitleCase.\n\n" 
				   "~cyan~ui.get_integer ~white~to get an integer value. Minimum and max values can be specified.\n\n" 
				   "~magenta~ui.get_real_number ~white~similar to ui.GetInteger, allows for real numbers to be entered.\n\n" 
				   "~blue~ui.get_boolean ~white~requires the user to type 'y' or 'n' and returns a boolean value.\n\n" 
				   "~green~Test ~white~each one out with ~blue~Enter ~white~only, or wrong numbers, too many characters etc.\n\n" 
				   "~red~Try and break it!")
	ret_value = get_input_demo("string", description)
	ui.display_message(f"You entered {ret_value}", False, True)
	ret_value = get_input_demo("int", description)
	ui.display_message(f"You entered {ret_value}", False, True)
	ret_value = get_input_demo("real", description)
	ui.display_message(f"You entered {ret_value}", False, True)
	ret_value = get_input_demo("bool", description)
	ui.display_message(f"You entered {ret_value}. Enter to continue", True, False)

def line_demo():
	num_lines = 0
	ui.clear()
	#draw_line(style, fore_color, back_color, width = 0, align = 'left')
	num_lines = num_lines + ui.draw_line("s", "red", "blackbg", 5)
	num_lines = num_lines + ui.draw_line("s", "red", "blackbg", 10)
	num_lines = num_lines + ui.draw_line("s", "red", "black", 20)
	num_lines = num_lines + ui.draw_line("s", "red", "black", 40)
	num_lines = num_lines + ui.draw_line("s", "red", "black", 60)
	num_lines = num_lines + ui.draw_line("s", "red", "black")
	num_lines = num_lines + ui.draw_line("s", "red", "black", 60, "right")
	num_lines = num_lines + ui.draw_line("s", "red", "black", 40, "right")
	num_lines = num_lines + ui.draw_line("s", "red", "black", 20, "right")
	num_lines = num_lines + ui.draw_line("s", "red", "black", 10, "right")
	num_lines = num_lines + ui.draw_line("s", "red", "black", 5, "right")
	num_lines = num_lines + ui.draw_line("d", "white", "black")
	num_lines = num_lines + ui.draw_line("d", "grey", "black")
	num_lines = num_lines + ui.draw_line("d", "dgrey", "black")
	num_lines = num_lines + ui.draw_line("d", "green", "black")
	num_lines = num_lines + ui.draw_line("d", "black", "green")
	num_lines = num_lines + ui.draw_line("d", "red", "white")
	num_lines = num_lines + ui.draw_line("d", "blue", "black", 40, "centre")
	num_lines = num_lines + ui.draw_line("d", "cyan", "black", 50, "centre")
	ui.add_lines(5, num_lines)
	ui.draw_line("d", "white", "black")
	ui.display_message("", True, False)

def print_demo():
	ui.clear()
	ui.colorprint("1. ui.clear();")
	ui.colorprint("2. ui.colorprint('~yellow~~blackbg~This demo uses 6 lines of code')")
	ui.colorprint("3. ui.colorprint('~green~~blackbg~This line is green on black")
	ui.colorprint("4. ui.add_lines(5, 7)")
	ui.colorprint('5. ui.draw_line("d", "white", "black")')
	ui.colorprint("6. ui.display_message("", True, False)")
	ui.add_lines(5, 7)
	ui.draw_line("d", "white", "black")
	ui.display_message("", True, False)
	
def print_without_ui():
	'''
	windows = {
        'black':'0', 'red':'4',  'green':'2', 'yellow':'6',
        'blue':'1', 'magenta':'5',  'cyan':'3',  'white':'7',
		'grey' : '8', 'lightblue' : '9', 'lightgreen' : 'A', 'lightaqua' : 'B',
		'lightred' : 'C', 'lightpurple' : 'D', 'lightyellow' : 'E', 'brightwhite' : 'F'		
    }
	linux_fg = {
        'black':'30', 'red':'31',  'green':'32', 'yellow':'33',
        'blue':'34', 'magenta':'35',  'cyan':'36',  'white':'37'
    }
	linux_bg = {
        'black':'40', 'red':'41',  'green':'42', 'yellow':'43',
        'blue':'44', 'magenta':'45',  'cyan':'46',  'white':'47'
    }    
	'''
	if os.name == 'nt': # Windows 
		os.system(f'color {0}E') # light yellow on black
	else: # Linux / Mac
		#send ansi codes directly to terminal
		fc = f"'\\e[{93}m'"
		bc = f"'\\e[1{40}m'" # 1 = set bold. 22 = set normal        
		os.system("echo -e " + bc)
		os.system("echo -e " + fc)
		#reset()	
	#clear screen
	if os.name == 'nt':
		os.system('cls')
	else:
		os.system('clear')
		
	print(f"1.  if os.name == 'nt':")
	print(f"2.      os.system(f'color {0}E')")
	print(f"3.  else:")
	print(f"4.      fc = f"'\\e[{93}m'"")
	print(f"5.      bc = f"'\\e[1{40}m'"")
	print(f"6.      os.system('echo -e ' + bc)")
	print(f"7.      os.system('echo -e ' + fc)")
	print(f"8.  local fc = ''\\e['..'1'..'m''")
	print(f"9.  if os.name == 'nt':")
	print(f"10.     os.system('cls')")
	print(f"11. else:")
	print(f"12.     os.system('clear')")
	print(f'13. {colorama.Fore.LIGHTGREEN_EX}{colorama.Back.BLACK + colorama.Style.BRIGHT}{{colorama.Fore.LIGHTGREEN_EX}}This line is green on black')
	print(f"{colorama.Style.RESET_ALL}{{14. colorama.Style.RESET_ALL}}")
	print(f"15. for i in range(3):")
	print(f"16.     print(()")
	print(f"17. print(("").ljust(80, '═'))")
	print(f"18. input('Press Enter to continue...')")
	for i in range(3):
		print()
	print(("").ljust(80, '═'))
	input("Press Enter to continue...")	
	
def multi_box_demo():
	ui.clear()
	styles 		= ["d","s","d" ]
	box_sizes 	= [ 15, 40, 25 ]
	fore_colors = [ "red", "green", "blue" ]
	back_colors = [ "black", "black", "grey" ]
	text_lines 	= [ "~blue~blue 14 chars", "~red~red text 40 chars", "~dyellow~dark yellow 25 chars" ]
	empty_lines = ["","","" ]
	alignments 	= [ "left", "centre", "right" ]
	padding 	= 0
	ui.draw_multi_box_outline(styles, "top", box_sizes , fore_colors, back_colors, padding)
	ui.draw_multi_box_body(styles, box_sizes, fore_colors, back_colors, text_lines, alignments, padding)
	ui.draw_multi_box_outline(styles, "mid", box_sizes, fore_colors, back_colors, padding)
	ui.draw_multi_box_body(styles, box_sizes, fore_colors, back_colors, empty_lines, alignments, padding)
	ui.draw_multi_box_body(styles, box_sizes, fore_colors, back_colors, empty_lines, alignments, padding)
	text_lines = [ "~yellow~align='left'", "~yellow~align='centre'", "~red~align='right'" ]
	ui.draw_multi_box_body(styles, box_sizes, fore_colors, back_colors, text_lines, alignments, padding)
	ui.draw_multi_box_body(styles, box_sizes, fore_colors, back_colors, empty_lines, alignments, padding)
	ui.draw_multi_box_body(styles, box_sizes, fore_colors, back_colors, empty_lines, alignments, padding)
	ui.draw_multi_box_outline(styles, "bottom", box_sizes, fore_colors, back_colors, padding)
	ui.add_lines(5, 9)
	ui.draw_line("d", "white", "black")
	ui.display_message("", True, False)
	
def main():
	ui.set_console(80, 25, "white", "black", False) #set to default size 80 x 25, white text on black bg 
	quit = False
	while not quit: #present a menu of possible choices, which redraws after input errors and completing a task
		title = "This is a demo of 'ui.menu': Choose another demo from the following"
		options = []
		options.append( "~green~Show a mix of different colours")
		options.append( "~dgreen~Show colour mix NOT using ui (DemoWithoutUI())")
		options.append( "~green~Show 'ui.Print' method")
		options.append( "~dgreen~Show 'Print' NOT using ui (PrintWithoutUI())")
		options.append( "~green~Show 'ui.DrawLine' method")
		options.append( "~green~Show 'ui.DrawBox..' methods")
		options.append( "~green~Show 'ui.MultiBox..' methods")
		options.append( "~green~Show 'ui.Grid..' methods")
		options.append( "~green~Show 'ui.InputBox' method")
		options.append( "~green~Show 'ui.DisplayMessage' method")
		options.append( "~green~Show 'ui.User Input' methods")
		options.append( "~red~Play the awesome 'Guess The Number' Game!")
		options.append( "~magenta~Quit")
		choice, _ = ui.menu("d", title, ">_", options)
		if choice == 0:
			color_print_demo()
		elif choice == 1:
			demo_without_ui()
		elif choice == 2:
			print_demo()
		elif choice == 3:
			print_without_ui()
		elif choice == 4:
			line_demo()
		elif choice == 5:
			box_demo()
		elif choice == 6:
			multi_box_demo()
		elif choice == 7:
			grid_demo()
		elif choice == 8:
			input_box_demo()
		elif choice == 9:
			display_message_demo()
		elif choice == 10:
			input_demo()
		elif choice == 11:
			guess_the_number()
		elif choice == 12:
			quit = True

		ui.quit(False) # exit without pressing a key

main()