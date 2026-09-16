{
  pkgs,
  inputs,
  lib,
  ...
}:

{
  environment.systemPackages =
    with pkgs;
    [
      git
      wget
      htop
      vim

      (pkgs.btop.override { rocmSupport = true; })

      wl-clipboard

      kitty

      libnotify

      python3

      # rustup
      cargo
      rustc
      rustfmt
      clippy
      rust-analyzer

      gcc

      bluez
      bluetui

      tidal
      adwaita-icon-theme
      nh
    ]
    ++ [
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "tidal"
    ];
  nixpkgs.config.allowUnsupportedSystem = true;
}
