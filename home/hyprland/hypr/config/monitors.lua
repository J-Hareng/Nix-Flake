-- monitor = DP-1, 2560x1440@59.95Hz, -1220x-540, 1, transform, 1, cm, srgb
-- monitor = HDMI-A-1, 2560x1440@60.00Hz, 220x280, 1, cm, srgb
-- monitor = eDP-1, 2880x1800@120.00Hz, 2780x660, 1.8, cm, srgb

-- hl.config({ render = { cm_sdr_eotf = 3 } })
hl.monitor({
	output = "desc:iiyama Corporation PL2792Q 1152101203578",
	disabled = false,
	mode = "2560x1440@59.95Hz",
	position = "240x-210",
	scale = 1,
	transform = 1,
	cm = "srgb",
})

hl.monitor({
	output = "desc:Acer Technologies RX321QU 5135001013900",
	disabled = false,
	mode = "2560x1440@60.00Hz",
	position = "1680x660",
	scale = 1,
	bitdepth = 10,
	cm = "hdr",
	sdrbrightness = 0.8,
	sdr_min_luminance = 0.09,
	sdr_max_luminance = 704,
	min_luminance = 0.13,
	max_luminance = 476,
	max_avg_luminance = 409,
})
hl.monitor({
	output = "eDP-1",
	disabled = false,
	-- mode = "2880x1800@120.00Hz",
	-- position = "4260x930",
	scale = 1.8,
	bitdepth = 8,
	cm = "srgb",
	-- sdrbrightness = 0.5,
	-- sdr_min_luminance = 0,
	-- sdr_max_luminance = 1107,
	-- min_luminance = 0,
	-- max_luminance = 1107,
	-- max_avg_luminance = 497,
})
