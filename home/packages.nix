{ pkgs, inputs, ... }:

{
  home.packages =
    with pkgs;
    [
      #TESTER THEMP DUMPER
      gnome-themes-extra
      amdgpu_top

      #Screenshots
      grim
      slurp
      satty

      gcolor3
      gnome-calculator


      #Apps
      #----HKA
      slack
      vscode
      element-desktop
      jetbrains.datagrip
      # postgresql # provides `psql`, required by vim-dadbod
      # sqlfluff # SQL formatter/linter (used by conform.nvim)
      # pgcli # optional: nice autocompleting Postgres CLI
      obsidian
      xournalpp


      #----privat
      #---------Unreplacable
      nautilus
      thunderbird
      gimp
      firefox
      libreoffice

      material-symbols
      
      steam

      vesktop
      discord
      beeper
      beeper-bridge-manager

      speedtest-cli

      lsd
      fastfetch
      brightnessctl
      waypaper
      awww

      procps
      nwg-look

      # TUI goofing around
      chess-tui
      cbonsai
      wiremix
    ]
    ++ [
      inputs.hyprmod.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
