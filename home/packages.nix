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

      waypaper
      awww
      procps

      man
      mandoc
      man-db

      nwg-look

      thunderbird
      obsidian
      nautilus

      steam
      vesktop
      discord
      slack

      vscode
      gimp

      firefox
      speedtest-cli
      libreoffice

      fastfetch
      brightnessctl
      lsd

      element-desktop

      xournalpp
      material-symbols

      beeper
      beeper-bridge-manager

      # TUI goofing around
      chess-tui
      cbonsai
      wiremix
    ]
    ++ [
      inputs.hyprmod.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
