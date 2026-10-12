{ pkgs, ... }:

{
  imports = [
    ./packages.nix
    ./bitwarden.nix
    ./screenshots.nix
    ./programm-languages.nix
    ./qt/qt.nix

    ./terminal/cli-config.nix
    ./nvim/nvim.nix
    ./hyprland/default.nix
    ./quickshell/quickshell.nix
    ./mailspring/mailspring.nix
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
