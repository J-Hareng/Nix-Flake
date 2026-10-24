{ ... }:
{

  imports = [
    # programs
    ./themp-packages.nix
    ./system/packages.nix

    # System programs
    # ./system/ai.nix
    ./system/sddm.nix
    ./system/password_manager.nix

    # Hardware Thingis
    ./hardware/magic-mouse.nix

    # System
    ./system/boot.nix

    ./system/networking/networking.nix
    ./system/bluetooth.nix
    ./system/powermanagement.nix

    ./system/fonts.nix

    ./system/samba.nix
    
    ./system/desktop.nix
    ./system/dev.nix
    ./system/local.nix
    ./system/nix.nix
    ./system/users.nix
    ./system/virtualisation.nix

  ];

}
