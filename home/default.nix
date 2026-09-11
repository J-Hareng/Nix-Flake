{ pkgs, inputs, ... }:

{
  imports = [
    ./packages.nix
    ./programm-languages.nix

    ./terminal/cli-config.nix
      
    ./nvim/nvim.nix
    ./hyprland/default.nix
    ./quickshell/quickshell.nix
  ];
  qt = {
    enable = true;
    platformTheme.name = "gtk3";
  };
  home.username = "ju";
  home.homeDirectory = "/home/ju";
  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
