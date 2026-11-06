{ pkgs, inputs, ... }:

{
  home.packages =
    with pkgs;
    [
      amdgpu_top

      nautilus
      thunderbird
      firefox
      gimp
      gcolor3
      gnome-calculator
      libreoffice
      hunspellDicts.de-de
      hunspellDicts.en-us

      gnome-themes-extra

      procps
      nwg-look

      lsd
      wiremix

      #Screenshots
      grim
      slurp
      satty
      wayfreeze

      waypaper
      awww

      material-symbols

      fastfetch

      brightnessctl
      sunsetr
    ]
    ++ [
      inputs.hyprmod.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
