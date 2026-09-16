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
      hyprpicker

      vscode

      procps
      lsd

      thunderbird
      nautilus

      brightnessctl

      steam
      vesktop

      material-symbols

      rofi
      fastfetch

      krita
      gimp
      discord

      firefox

      libreoffice

      cbonsai
      nwg-look

      waypaper
      awww
    ]
    ++ [
      inputs.hyprmod.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
