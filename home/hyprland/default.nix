{pkgs,inputs,...}:

{
  environment.systemPackages = with pkgs; [
      hyprland
      hyprlock
      hypridle
  ]

  xdg.configFile."hypr"={
      source = ./hypr;
      recursive = true;
    };
}

