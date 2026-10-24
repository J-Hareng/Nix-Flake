{pkgs, ... }:

{
  users.users."ju" = {
    isNormalUser = true;
    description = "juga";
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxuser"
    ];
    shell = pkgs.fish;
  };
  programs.fish.enable = true;
}
