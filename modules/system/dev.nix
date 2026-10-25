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
  
  environment.pkgs = with pkgs; [
      # rustup
      cargo
      rustc
      rustfmt
      clippy
      rust-analyzer

      gcc

      python3
      jdk21
  ];


  environment.variables.EDITOR = "nvim";
 }
