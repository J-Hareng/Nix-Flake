{pkgs,...}:
{

  nix.settings.experimental-features = [
    "nix-command"
      "flakes"
  ];

  nixpkgs.config.allowUnfree = true;


  environment.systemPackages = with pkgs; [
    nh
  ];
  programs.nh = {
    enable = true;
    flake = "/home/ju/nix-config";
    clean.enable = true;
    clean.extraArgs = "--keep 5 --keep-since 7d";
  };

}
