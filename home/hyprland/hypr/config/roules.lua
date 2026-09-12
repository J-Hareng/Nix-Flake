-- Ignore maximize requests from apps
hl.window_rule({
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
	match = { class = "com.mitchellh.ghostty" },
	opacity = 0.8,
})
hl.window_rule({
	match = { fullscreen = true },
	opacity = 1,
})

hl.window_rule({
	name = "Wayland_Floating",
	no_focus = true,
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},
})


-- satty
hl.window_rule({
	match = { class = "com.gabm.satty" },
	float = true,
	size = { 1000, 600 },
})

hl.window_rule({
	match = { class = "waypaper" },
	float = true,
	size = { 500, 750 },
})

hl.window_rule({
	match = { class = "org.gnome.Calculator" },
	float = true,
	size = { 500, 750 },
})

-- gcolor3
hl.window_rule({
	name = "color",
	float = true,
	match = { class = "^gcolor3$" },
	size = { 800, 330 },
})

-- Workspace assignments
local workspace_rules = {
	-- { class = "org.gnome.Nautilus", workspace = 1 },
	{ class = "discord", workspace = 5 },
	{ class = "vesktop", workspace = 5 },
	{ class = "Slack", workspace = 5 },
	{ class = "firefox", workspace = 3, opacity = 1.0 },
	{ class = "zen", workspace = 3, opacity = 1.0 },
	{ class = "steam", workspace = 6 },
	{ class = "spotify", workspace = 9 },
	{ class = "youtubeMusic", workspace = 9 },
}

for _, r in ipairs(workspace_rules) do
	hl.window_rule({
		match = { class = r.class },
		workspace = r.workspace,
		opacity = r.opacity,
	})
end

-- wvkbd (on-screen keyboard)
hl.window_rule({
	match = { class = "wvkbd" },
	no_focus = true,
	float = true,
	pin = true,
	no_anim = true,
	monitor = "eDP-1",
	size = { "100%", "40%" },
	move = { 0, "60%" },
})

-- nwg-drawer
hl.window_rule({
	match = { title = "nwg-drawer" },
	stay_focused = true,
	pin = true,
	float = true,
	monitor = "eDP-1",
})

hl.window_rule({
	match = {
		class = "zen",
	},
	opacity = 1,
})

hl.window_rule({
    name = "quickshell-wifi-popup",
    match = { class = "quickshell.wifipopup" },
    float = true,
    size = "750 550",
    move = "monitor_w-760 34",

	  opacity = 0.8,
    rounding = 12,
})

hl.window_rule({
	name = "xwayland-video-bridge-fixes",
	match = {
		class = "xwaylandvideobridge",
	},
	no_initial_focus = true,
	no_focus = true,
	no_anim = true,
	no_blur = true,
	opacity = 0.0,
})
-- hl.layer_rule({
--     match = { namespace = "quickshell:volume-osd" },
--     no_anim = true,
-- })
