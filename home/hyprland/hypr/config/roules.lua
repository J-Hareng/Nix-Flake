-- ============================================================
-- 1. GLOBAL / CATCH‑ALL RULES
-- ============================================================
hl.window_rule({
	match = { class = ".*" },
	suppress_event = "maximize",
})

hl.window_rule({
	match = { class = "com.mitchellh.ghostty" },
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

-- ============================================================
-- 2. APPLICATION‑SPECIFIC FLOATING & SIZING
-- ============================================================
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
	match = { class = "bitwarden" },
	float = true,
	size = { 600, 400 },
})

hl.window_rule({
	match = { class = "org.gnome.Calculator" },
	float = true,
	size = { 500, 750 },
})

hl.window_rule({
	match = { class = "Beeper" },
	float = true,
	size = { 800, 950 },
	move = "monitor_w-805 34",
})

hl.window_rule({
	name = "color",
	float = true,
	match = { class = "^gcolor3$" },
	size = { 800, 330 },
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
	match = { class = "xwaylandvideobridge" },
	no_initial_focus = true,
	no_focus = true,
	no_anim = true,
	no_blur = true,
	opacity = 0.0,
})

-- ============================================================
-- 3. WORKSPACE ASSIGNMENTS
-- ============================================================
local workspace_rules = {
	{ class = "discord", workspace = 5 },
	{ class = "vesktop", workspace = 5 },
	{ class = "Slack", workspace = 5 },
	{ class = "firefox", workspace = 3, opacity = 1.0 },
	-- { class = "zen", workspace = 3, opacity = 1.0 }, -- Disabled to prevent conflict
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

-- ============================================================
-- 4. BAR / PANEL / ON‑SCREEN KEYBOARD
-- ============================================================
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

hl.window_rule({
	match = { title = "nwg-drawer" },
	stay_focused = true,
	pin = true,
	float = true,
	monitor = "eDP-1",
})

-- ============================================================
-- 5. DYNAMIC EVENT LISTENERS
-- ============================================================
-- Float the Bitwarden browser extension when its title changes.
hl.on("window.open", function(w)
	-- Only care about Zen Browser windows
	if w.class ~= "zen" then
		return
	end
	-- The main browser window has initial_title "Zen Browser"
	if w.initial_title ~= "Zen Browser" then
		return
	end

	-- Check if there is already another Zen window open.
	-- If there is, this new one is likely the extension popup.
	local zen_windows = hl.get_windows({ class = "zen" })
	if #zen_windows <= 1 then
		return
	end

	-- Float the popup immediately as it opens.
	-- This is the key step that the static rule was missing.
	hl.dispatch(hl.dsp.window.float({ action = "set", window = w }))
	hl.dispatch(hl.dsp.window.center({ window = w }))

	-- Now, listen for the title change to refine its appearance
	local sub
	sub = hl.on("window.title", function(tw)
		-- Ensure we are only acting on the window we opened
		if tw.address ~= w.address then
			return
		end

		-- Wait for the final title
		if not tw.title:match("Bitwarden Password Manager") then
			return
		end

		-- Stop listening once we have a match
		sub:remove()

		-- Apply the final size and re-center
		hl.dispatch(hl.dsp.window.resize({ x = 500, y = 700, window = tw }))
		hl.dispatch(hl.dsp.window.center({ window = tw }))
		hl.dispatch(hl.dsp.focus({ window = tw }))
	end)
end)
