# LuaForSchools
Simple Lua code for total beginners and Python coders who want to learn Lua

This repository is designed to support learners, usually at primary or secondary schools to get started with text-based coding.
For those already familiar with Python, there are examples showing how to translate code between the two languages.

Why Lua?

Python seems to be the language of choice for schools, but it is not the easiest when coding for the first time.
There is often confusion with the syntax when typing your first lines, especially if using the built in Idle IDE.
As soon as you run it, you are reminded to save it (annoying: it should auto-save), then you get a bunch of incomprehensible error messages because you forgot/did not understand the idea of code blocks being delineated with whitespace.

Python Example:

    if condition == True:

        print("Success!")  # This code has to be 4 spaces or 1 tab from the margin, otherwise it errors
  
Lua Example:

if condition == true then

    print("Success!") -- This code indented for human readability
    
end                 -- end keyword used to delineate all code blocks, including functions

This also works without error:

if condition == true then print("Success!") end

Try that in Python!

The best Lua IDE ZeroBrane from https://studio.zerobrane.com has intellisense and syntax checking, making your first steps easy.
