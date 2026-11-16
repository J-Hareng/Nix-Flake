{ pkgs, pkgs-stable, ... }:
{
  environment.systemPackages = [
    pkgs.llama-cpp
    pkgs.ollama

    pkgs-stable.oterm

    pkgs.uv
  ];

  services.ollama = {
    enable = true;
    package = pkgs.ollama-vulkan;
    host = "0.0.0.0";


    environmentVariables = {
      # OLLAMA_VULKAN = "1";
      OLLAMA_IGPU_ENABLE = "1";
      OLLAMA_KEEP_ALIVE = "30m";
    };
  };

  networking.firewall.interfaces."tailscale0".allowedTCPPorts = [ 11434 ];

  boot.kernelParams = [ "ttm.pages_limit=5242880" ];
}
