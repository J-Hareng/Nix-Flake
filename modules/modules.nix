{ ... }:
{

  imports = [
    # programs
    ./themp-packages.nix
    ./system/packages.nix

    # System programs
    ./system/ai.nix
    ./system/hyprland.nix
    ./system/sddm.nix

    # Hardware Thingis
    ./hardware/magic-mouse.nix

    # System
    ./system/boot.nix

    ./system/networking.nix
    ./system/bluetooth.nix
    ./system/powermanagement.nix

    ./system/fonts.nix

  ];
}
