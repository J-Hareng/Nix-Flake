{pkgs,...}:
{
  home.packages = [ pkgs.fish ];

  xdg.configFile."fish" = {
      source = ./fish;
      recursive = true;
  };
}
