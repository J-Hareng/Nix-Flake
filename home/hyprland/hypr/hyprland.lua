hl.config({
	input = {
		kb_layout = "de",
		kb_options = "ctrl:nocaps",
	},
})

-- HyprMod managed settings
require("hyprland-gui")

require("config.keybindings")
require("config.options")
require("config.roules")
require("config.animations")
require("config.monitors")
