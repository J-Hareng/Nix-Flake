{ pkgs, ... }:
{
  # Enable networking
  # networking.networkmanager.enable = true;
  networking.wireless.iwd = {
    enable = true;
    settings = {
      DriverQuirks = {
        PowerSaveDisable = "";
      };
      General = {
        EnableNetworkConfiguration = true; # iwd does DHCP itself
      };
      Network = {
        NameResolvingService = "systemd"; # hand DNS to resolved
        EnableIPv6 = true;
      };
    };
  };

  environment.etc."iwd/eduroam-hka-ca.pem".source = ./eduroam-hka-ca.pem;

  services.resolved.enable = true;

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    1420
  ]; # 1420 Tauri
  # networking.firewall.allowedUDPPorts = [ ... ];

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  networking.hostName = "juga"; # Define your hostname.

  services.tailscale = {
    # Enable tailscale at startup
    enable = true;

    # If you would like to use a preauthorized key, set
    # authKeyFile = "/run/secrets/tailscale_key";
    # Note: maximum expire time is 90 days
  };
  environment.systemPackages = with pkgs; [
    impala
    iw
    tailscale
  ];
}
