{pkgs, ...}:
{
  home.packages = [
    pkgs.quickshell
    pkgs.kdePackages.qtdeclarative   # provides qmlls, qmllint, qmlformat (Qt6)
  ];

  xdg.configFile."quickshell".source = ./quickshell;
}

