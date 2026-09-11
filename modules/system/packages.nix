{ pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    git
    wget
    htop
    vim
  
    (pkgs.btop.override { rocmSupport = true; })

    wl-clipboard
    hyprland
    kitty 

    libnotify   

    python3
    rustup
    gcc

    bluez
    bluetui
    
    nh
  ] ++ [
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    inputs.home-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
