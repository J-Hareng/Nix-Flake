{pkgs,inputs,...}:

{

  xdg.configFile."hypr"={
      source = ./hypr;
      recursive = true;
    };

    services.hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "pidof hyprlock || ${pkgs.hyprlock}/bin/hyprlock";
          unlock_cmd = "pkill hyprlock";
          before_sleep_cmd = "loginctl lock-session";
          after_sleep_cmd = "hyprctl dispatch 'hl.dsp.dpms({ action = \"on\" })'";
        };
      };
  };
}

