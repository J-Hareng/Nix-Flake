{ config, pkgs, ... }:

  let
    sddm-theme = pkgs.sddm-astronaut.override {
      embeddedTheme = "astronaut";  # closest visual match to Sugar Candy; try "black_hole" or "cyberpunk" too
      themeConfig = {
        ScreenWidth="2880";
        ScreenHeight="1800";
        Background="${../../hosts/juga/sddm_wallpaper.jpg}";
        BackgroundColor = "#040e0d";
        FormBackgroundColor = "#0f211f";
        HeaderTextColor = "#f5e2c5";
        DateTextColor = "#f5e2c5";
        TimeTextColor = "#f5e2c5";
        LoginButtonBackgroundColor = "#e89aa8";
        LoginButtonTextColor = "#0a1816";
        HighlightBackgroundColor = "#e89aa8";
        HighlightTextColor = "#0a1816";
        PartialBlur = "true";
        FormPosition = "right";
      };
    };
  in
  {

    environment.systemPackages = [ sddm-theme ];

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${sddm-theme}/share/sddm/themes/sddm-astronaut-theme";
      extraPackages = [ sddm-theme ];
    };
  }
