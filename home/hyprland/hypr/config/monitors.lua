-- monitor = DP-1, 2560x1440@59.95Hz, -1220x-540, 1, transform, 1, cm, srgb
-- monitor = HDMI-A-1, 2560x1440@60.00Hz, 220x280, 1, cm, srgb
-- monitor = eDP-1, 2880x1800@120.00Hz, 2780x660, 1.8, cm, srgb

-- hl.config({ render = { cm_sdr_eotf = 3 } })

hl.monitor({
	output = "eDP-1",
	-- mode = "2880x1800@60",
	mode = "2880x1800@120",
	position = "2780x660",
	scale = 1.8,
})

hl.monitor({
	output = "desc:Iiyama North America PL2792Q 1152101203578",
	mode = "2560x1440@60",
	position = "-1220x-540",
	transform = 1,
	scale = 1.0,
	-- cm = "auto",
})

hl.monitor({
	output = "desc:Acer Technologies RX321QU 5135001013900",
	mode = "2560x1440@60.00Hz",
	position = "220x280",
	scale = 1,

})
--
