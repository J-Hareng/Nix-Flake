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

      gimp

      libnotify

      bluez
      bluetui

      man
      mandoc
      man-db
      gnumake

      dig

      lxqt.lxqt-policykit

      tela-icon-theme
      papirus-icon-theme

      trayscale
      sshfs
    ]
    ++ [
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
      inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

  # nixpkgs.config.allowUnfreePredicate =
  #   pkg:
  #   builtins.elem (lib.getName pkg) [
  #     "tidal"
  #   ];
  # nixpkgs.config.allowUnsupportedSystem = true;
}
