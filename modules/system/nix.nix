{ pkgs, inputs, ... }:
{

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config = {
    allowUnfree = true;
    problems.handlers = {
      fastmcp-slim.broken = "warn";
    };
  };
  environment.systemPackages = with pkgs; [
    nh
  ] ++ [

      inputs.nix-software-center.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  programs.nh = {
    enable = true;
    flake = "/home/ju/nix-config";
    clean.enable = true;
    clean.extraArgs = "--keep 5 --keep-since 7d";
  };

}
