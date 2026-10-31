{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.llama-cpp
    pkgs.ollama
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

  # services.open-webui = {
  #   enable = true;
  #   environment = {
  #     OLLAMA_API_BASE_URL = "http://127.0.0.1:11434";
  #     WEBUI_AUTH = "False";
  #     OFFLINE_MODE = "true";
  #   };
  # };

  boot.kernelParams = [ "ttm.pages_limit=5242880" ];
}
