{ lib, pkgs, ... }:
let
  sddm-theme = pkgs.sddm-astronaut.override {
    embeddedTheme = "astronaut";
    themeConfig = {
      ScreenWidth = "2880";
      ScreenHeight = "1800";
      Background = "${../../hosts/juga/sddm_wallpaper.jpg}";
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
  environment.systemPackages = with pkgs; [
    sddm-theme
    hyprland

    hyprlock
    kitty
  ];

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${sddm-theme}/share/sddm/themes/sddm-astronaut-theme";
    extraPackages = [ sddm-theme ];
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  security.polkit.enable = true;

  services.gvfs = {
    enable = true;
    package = lib.mkForce pkgs.gnome.gvfs;
  };

  services.udisks2.enable = true;

  security.pam.services.hyprlock = { };
  security.pam.services.hyprland.enableGnomeKeyring = true;
}
