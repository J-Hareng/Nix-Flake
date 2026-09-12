{nixpkgs, config, pkgs, environment, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];
 
  nix.settings.experimental-features = ["nix-command" "flakes"];

  services.upower.enable = true;
  powerManagement.enable = true;

  services.tlp = {
        enable = true;
        settings = {
        
          CPU_SCALING_GOVERNOR_ON_AC = "performance";
          CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

          CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
          CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

          CPU_MIN_PERF_ON_AC = 0;
          CPU_MAX_PERF_ON_AC = 100;
          CPU_MIN_PERF_ON_BAT = 0;
          CPU_MAX_PERF_ON_BAT = 20;
        };
  };
services.tlp.pd.enable = true;

  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "de";
    variant = "";
  };

  # Configure console keymap
  console.keyMap = "de";


  programs.nh = {
    enable = true;
    flake = "/home/ju/nix-config";
    clean.enable = true;
    clean.extraArgs = "--keep 5 --keep-since 7d";
  };

  security.pam.services.hyprlock = {};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users."ju" = {
    isNormalUser = true;
    description = "juga";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  services.logind.lidSwitch = "ignore";

  programs.fish.enable = true;

  programs.hyprland.enable = true;
  programs.hyprland.withUWSM = true;
 

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "26.05"; # Did you read the comment?

}
