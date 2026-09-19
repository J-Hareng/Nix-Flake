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
      nautilus

      steam
      vesktop
      discord
      slack

      vscode

      rofi

      gimp

      firefox

      libreoffice

      fastfetch
      brightnessctl
      lsd
      cbonsai

      material-symbols
    ]
    ++ [
      inputs.hyprmod.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
