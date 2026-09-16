hl.config({
	input = {
		kb_layout = "de",
		kb_options = "ctrl:nocaps",
	},
})

require("config.motions")
require("config.keybindings")
require("config.options")
require("config.roules")
require("config.animations")
require("config.monitors")

-- HyprMod managed settings
require("~/.config/hyprmod/hyprland-gui.lua")
