{pkgs, ...}:
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

  environment.variables.EDITOR = "nvim";
 }
