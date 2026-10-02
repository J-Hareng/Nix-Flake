{ pkgs, ... }:
{

  home.packages = [ pkgs.yazi ];

  xdg.configFile."yazi" = {
    source = ./yazi;
    recursive = true;
  };

}
