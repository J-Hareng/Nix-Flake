{ lib, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
      hyprland
      hyprlock
  ];

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
