-- demonstrates print(), io.write()
-- with \n newline and \t Tab

function main()
	print("Hello:")
	print("\tWorld ")
	io.write("\tVersion 5")
end

main()

io.write("\n\nPress Enter to quit>") -- note 2 newlines
io.read()
