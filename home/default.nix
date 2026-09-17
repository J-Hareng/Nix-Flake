{ pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./screenshots.nix
    ./programm-languages.nix
    ./terminal/cli-config.nix
    ./qt/qt.nix
    ./nvim/nvim.nix
    ./samba.nix
    ./hyprland/default.nix
    ./quickshell/quickshell.nix
  ];

  home.username = "ju";
  home.homeDirectory = "/home/ju";
  home.stateVersion = "24.11";

  services.udiskie = {
    enable = true;
    settings = {
      program_options = {
        file_manager = "${pkgs.nautilus}/bin/nautilus";
      };
    };
  };

  programs.home-manager.enable = true;
}
