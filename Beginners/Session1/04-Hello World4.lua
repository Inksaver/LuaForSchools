-- demonstrates io.write() with \n newline character

function main()
	io.write("Hello ")
	io.write("World \n") -- note \n
	io.write("Version 4")
end

main()

-- output is a bit messy here. How can it be improved?
io.write("Press Enter to quit>")
io.read()