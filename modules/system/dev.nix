{ pkgs, inputs, ... }:
let
  home = "/home/ju";
in
{
  # for Mason.nvim
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    stdenv.cc.cc
    zlib
    openssl
    curl
    libxml2
    icu
  ];

  environment.systemPackages = with pkgs; [
    # rustup
    cargo
    rustc
    rustfmt
    clippy
    rust-analyzer

    gcc

    sops

    python3
    jdk21
  ];

  environment.variables.EDITOR = "nvim";

  sops = {
    # defaultSopsFile = ../../secrets/secrets.yaml;
    defaultSopsFormat = "yaml";

    age.keyFile = "${home}/.config/sops/age/keys.txt";
  };

}
