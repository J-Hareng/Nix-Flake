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
    environmentVariables = {
      # OLLAMA_VULKAN = "1";
      OLLAMA_IGPU_ENABLE = "1";
      OLLAMA_KEEP_ALIVE = "30m";
    };
  };

  boot.kernelParams = [ "ttm.pages_limit=5242880" ];
}
