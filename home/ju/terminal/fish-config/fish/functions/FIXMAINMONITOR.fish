function FIXMAINMONITOR --wraps='hyprctl keyword monitor HDMI-A-1,colorManagementPreset,native && hyprctl keyword monitor HDMI-A-1,sdrSaturation,1.2' --wraps='hyprctl keyword monitor HDMI-A-1,2560x1440@59.95,1440x609,1.0,sdrsaturation,1.2 && hyprctl reload' --description 'alias FIXMAINMONITOR hyprctl keyword monitor HDMI-A-1,2560x1440@59.95,1440x609,1.0,sdrsaturation,1.2 && hyprctl reload'
    hyprctl keyword monitor HDMI-A-1,2560x1440@59.95,1440x609,1.0,sdrsaturation,1.2 && hyprctl reload $argv
end
