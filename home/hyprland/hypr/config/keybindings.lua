local terminal = "ghostty"
local fileManager = "nautilus"
local menu = "rofi -show drun"
local browser = "zen-browser"
local mainMod = "SUPER"

-- ── App / Session binds ──────────────────────────────────────
hl.bind(mainMod .. " + ALT + R", hl.dsp.exec_cmd("~/.config/hypr/scripts/restartSwaync.sh"))
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.exec_cmd("~/.config/waybar/scripts/start.sh"))

hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())

hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("qs ipc call dropdown toggle"))
-- hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + ALT + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd(browser))

-- ── Focus movement ───────────────────────────────────────────
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "d" }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- ── Switch workspaces ────────────────────────────────────────
-- ── Move active window to workspace ─────────────────────────
for i = 1, 10 do
	hl.bind(mainMod .. " + " .. i % 10, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. i % 10, hl.dsp.window.move({ workspace = i }))
end

-- ── Special workspace (scratchpad) ───────────────────────────
hl.bind("SUPER + W", hl.dsp.workspace.toggle_special())
hl.bind("SUPER + SHIFT + W", hl.dsp.window.move({ workspace = "special" }))

-- ── Scroll through workspaces with mouse wheel ───────────────
-- hl.bind(mainMod .. " + mouse_down", hl.dsp.workspace.change("e+1"))
-- hl.bind(mainMod .. " + mouse_up", hl.dsp.workspace.change("e-1"))

-- ── Move / resize windows with mouse drag ───────────────────
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- ── Volume & brightness (locked = works on lockscreen, repeating = hold) ──
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ locked = true, repeating = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ locked = true, repeating = true }
)

hl.bind("XF86MonBrightnessUp", function()
	hl.dsp.exec_cmd("brightnessctl set +10%")
end, { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", function()
	hl.dsp.exec_cmd("brightnessctl set 10%-")
end, { locked = true, repeating = true })

-- ── Media keys (locked only) ─────────────────────────────────
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- ── Screenshots ───────────────────────────────────────────────

hl.unbind("SUPER + S")
hl.unbind("SUPER + SHIFT + S")
hl.unbind("SUPER + P")

hl.bind(
	"SUPER + SHIFT + S",
	hl.dsp.exec_cmd([[
      wayfreeze --hide-cursor --after-freeze-cmd 'grim -g "$(slurp -b "#00000000" -c "#7ad9a8FF" -w 2)" - | satty --filename - --copy-command wl-copy --early-exit; pkill -x wayfreeze' --after-freeze-timeout 100
    ]])
)

-- ── Tablet mode (Lenovo Yoga lid switch) ─────────────────────
hl.bind(
	"switch:on:Lenovo Yoga Tablet Mode Control switch",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/tablet-mode.sh on"),
	{ locked = true }
)
hl.bind(
	"switch:off:Lenovo Yoga Tablet Mode Control switch",
	hl.dsp.exec_cmd("~/.config/hypr/scripts/tablet-mode.sh off"),
	{ locked = true }
)

hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("hyprlock"), { locked = true })
