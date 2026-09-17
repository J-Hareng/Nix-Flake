{ pkgs, ... }:

{
  qt = {
    enable = true;
    platformTheme.name = "qtct";
    qt6ctSettings = {
      Appearance = {
        custom_palette = true;
        color_scheme_path = toString ./qt/ariadne.conf;
        icon_theme = "Tela-black";
        style = "Fusion";
      };
    };
  };

  qt.qt5ctSettings = {
    Appearance = {
      custom_palette = true;
      color_scheme_path = toString ./qt/ariadne.conf;
      icon_theme = "Tela-black";
      style = "Fusion";
    };
  };

  home.packages = with pkgs; [
    qt6Packages.qt6ct
  ];
}
