{ pkgs, inputs, ... }:

{
  home.packages = [ pkgs.gcr_3 ];

  services.gnome-keyring.enable = true;
  xdg.configFile."hypr" = {
    source = ./hypr;
    recursive = true;
  };
}
