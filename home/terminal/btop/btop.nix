{pkgs,...}:
{
  xdg.configFile."btop"= {
    source = ./btop;
    recursive = true;
  };
}
