{pkgs, ...}: 
{
  # Enable networking
  # networking.networkmanager.enable = true;
  networking.wireless.iwd = {
    enable = true; 
    settings = {
      DriverQuirks = {
        PowerSaveDisable = "";
      };
    };
  };

  networking.firewall.enable = true;
  # networking.firewall.allowedTCPPorts = [ 22 ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
 


  networking.hostName = "juga"; # Define your hostname.

  environment.systemPackages = with pkgs; [
    impala
    iw 
  ];
}

