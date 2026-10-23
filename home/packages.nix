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

      gcolor3
      gnome-calculator

      beeper
      beeper-bridge-manager

      # TUI goofing around
      chess-tui
      cbonsai
      wiremix
    

      jetbrains.datagrip
      # dbeaver-bin

      virtualbox
      cdrkit

      postgresql # provides `psql`, required by vim-dadbod
      sqlfluff # SQL formatter/linter (used by conform.nvim)
      pgcli # optional: nice autocompleting Postgres CLI
    ]
    ++ [
      inputs.hyprmod.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
