local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local grid = require "mjolnir.bg.grid"

grid.GRIDHEIGHT = 1
grid.GRIDWIDTH = 6 
grid.MARGINX = 10
grid.MARGINY = 10
grid.HALFWIDTH = grid.GRIDWIDTH / 2

local modifiers = {"cmd", "ctrl"}

function snap (direction, cell)
	hotkey.bind(modifiers, direction, function ()
		local win = window.focusedwindow()
		grid.set(win, cell, win:screen())
	end)
end

snap("left", {x=0, y=0, w=grid.HALFWIDTH, h=grid.GRIDHEIGHT})
snap("right", {x=grid.HALFWIDTH, y=0, w=grid.HALFWIDTH, h=grid.GRIDHEIGHT})
snap("up", {x=0, y=0, w=grid.GRIDWIDTH, h=grid.GRIDHEIGHT})

hotkey.bind(modifiers, "l", function()
	os.execute("open '/System/Library/Frameworks/ScreenSaver.framework/Versions/A/Resources/ScreenSaverEngine.app'")
end)
