{ pkgs, ... }:

{
  imports = [
    ./ju
    ./system-conf
    ./dev.nix
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
