{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.llama-cpp
    pkgs.ollama
  ];
}
