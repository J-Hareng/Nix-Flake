{ pkgs, ... }:
{

  home.packages = [ pkgs.yazi ];

  # xdg.configFile."".source = ./starship.toml;

}
