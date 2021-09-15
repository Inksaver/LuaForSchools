--[[--
  Use this file to specify **System** preferences.
  Review [examples](\ZeroBraneStudio\App\cfg\user-sample.lua) or check [online documentation](http://studio.zerobrane.com/documentation.html) for details.
--]]--
activateoutput = true -- activate Output or Console window on new content added.
path.love2d = 'love2D/love.exe'
-- to change font size to 12
editor.fontsize = 18 -- this is mapped to ide.config.editor.fontsize
editor.fontname = "Consolas"
filetree.fontsize = 12 --set font size (the default size is 11 on macOS).
filehistorylength = 20 -- this is mapped to ide.config.filehistorylength
-- to have 4 spaces when TAB is used in the editor
editor.tabwidth = 4
-- to have TABs stored in the file (to allow mixing tabs and spaces)
editor.usetabs  = true
-- to disable wrapping of long lines in the editor
editor.usewrap = false
-- to turn dynamic words on and to start suggestions after 4 characters
acandtip.nodynwords = false
acandtip.startat = 4

-- to turn off checking for mixed end-of-line encodings in loaded files
editor.checkeol = false

-- to force execution to continue immediately after starting debugging;
-- set to `false` to disable (the interpreter will stop on the first line or
-- when debugging starts); some interpreters may use `true` or `false`
-- by default, but can be still reconfigured with this setting.
debugger.runonstart = true

-- to set compact fold that doesn't include empty lines after a block
editor.foldcompact = true

console.fontname = "Consolas" --set font name.
console.fontsize = 14 --set font size (the default value is 11 on macOS).
console.nomousezoom = false --disable zoom with mouse wheel in the Console window as it may be too sensitive.
output.fontname = "Consolas" -- set font name.
output.fontsize = 14 -- set font size (the default value is 11 on macOS).
-- to change the default color scheme; check tomorrow.lua for the list
-- of supported schemes or use cfg/scheme-picker.lua to pick a scheme.
--styles = loadfile('cfg/tomorrow.lua')('Notepad++')
--styles = loadfile('cfg/tomorrow.lua')('TomorrowNightBlue')
styles = loadfile('cfg/tomorrow.lua')('Molokai')

stylesoutshell = styles -- apply the same scheme to Output/Console windows
styles.auxwindow = styles.text -- apply text colors to auxiliary windows
styles.calltip = styles.text -- apply text colors to tooltips
styles.indicator = {} -- to disable indicators (underlining)
singleinstance=false