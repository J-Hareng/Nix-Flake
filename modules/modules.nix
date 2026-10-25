{ ... }:
{

  imports = [
    ./themp-packages.nix

    # programs
    ./system/programs/ai.nix
    ./system/programs/password_manager.nix
    ./system/programs/packages.nix
    ./system/programs/samba.nix

    # Hardware Thingis
    ./hardware/magic-mouse.nix

    ./system/networking/networking.nix
    # System
    ./system/bluetooth.nix
    ./system/boot.nix
    ./system/dev.nix
    ./system/desktop.nix
    ./system/fonts.nix
    ./system/local.nix
    ./system/nix.nix
    ./system/powermanagement.nix
    ./system/users.nix
    ./system/virtualisation.nix

  ];

}
