{ pkgs, ... }:

{
  home.packages = with pkgs; [
    rbw
    rofi
    rofi-rbw
    pinentry-rofi
  ];

  xdg.configFile."rofi-rbw.rc".source = ./rofi-rbw.rc;

  xdg.configFile."rofi" = {
    source = ./rofi;
    recursive = true;
  };

  programs.rbw = {
    enable = true;
    settings = {
      email = "jblbermuda@web.de";
      base_url = "https://vault.hakira.de";
      pinentry = pkgs.pinentry-rofi;
      lock_timeout = 3600;
    };
  };

  programs.rofi = {
    enable = true;
  };
}
