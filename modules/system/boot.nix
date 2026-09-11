{ inputs, config, pkgs, lib, ... }:
{

  # environment.systemPackages = [ pkgs.sddm ];

services.displayManager.defaultSession = "hyprland";

boot.loader.systemd-boot.enable = false;
boot.loader.efi.canTouchEfiVariables = true;
boot.loader.grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        theme = inputs.nixos-grub-themes.packages.${pkgs.system}.big-sur;
    };

  boot.kernelPackages = pkgs.linuxPackages_latest;
  # boot.kernelParams = [ "amdgpu.abmlevel=0" ];
  boot.initrd.kernelModules = ["amdgpu"];
  hardware.graphics.enable = true;
  hardware.graphics.enable32Bit = true;
}
