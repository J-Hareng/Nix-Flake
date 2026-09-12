{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
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
    
    nh
  ] ++ [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
