hl.config({
	general = {
		border_size = 1,
		resize_on_border = true,
		gaps_out = 5,
		-- gaps_out_top = 0,
		gaps_in = 3,
		col = {
			active_border = "0xfff5e2c5",
			inactive_border = "0xff1d3631",
		},
	},

	decoration = {
		rounding = 5,
		rounding_power = 2,

		active_opacity = 1.0,
		inactive_opacity = 0.7,

		blur = {
			enabled = true,
			size = 10,
			passes = 3,
			vibrancy = 0.15,
		},
	},
	misc = {
		force_default_wallpaper = 0,
		disable_hyprland_logo = true,
	},
	xwayland = {
		force_zero_scaling = true,
	},
})

hl.env("AMD_DEBUG", "nodcc")

hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)

--tookit backend.
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("CLUTTER_BACKEND", "wayland")

--XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")

--qt
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1.8")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

-- config
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

hl.env("QS_ICON_THEME", "Adwaita")

hl.on("hyprland.start", function()
	hl.exec_cmd("uwsm finalize")
	hl.exec_cmd("awww-daemon -q & sunsetr & qs &")

	hl.exec_cmd("xwaylandvideobridge")

	-- hl.exec_cmd("/home/ju/.config/hypr/scripts/auto-rotate.sh")
	hl.exec_cmd("wl-paste --type text --watch cliphist store &")
	hl.exec_cmd("wl-paste --type image --watch cliphist store &")
end)
