{ config, pkgs, ... }:

{
  # Link your custom Kvantum theme folder
  xdg.configFile."Kvantum" = {
    source = ./Kvantum;
    recursive = true;
  };

  # Ensure Kvantum and qt6ct are set to use it
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";
    style.name = "kvantum"; # This sets the style to Kvantum
    # You might not need to set the theme name in the config directly;
    # it can be chosen in the Kvantum Manager GUI after linking.
    # However, for a fully declarative setup, you can create the Kvantum config file as well:
    # xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    #   [General]
    #   theme=MyAquaTheme
    # '';
  };

  home.packages = with pkgs; [
    qt6Packages.qt6ct
    qt6Packages.qtstyleplugin-kvantum
    gruvbox-kvantum
    # Add any Kvantum themes you want, e.g.:
    # catppuccin-qt5ct
  ];

  home.sessionVariables = {
    QT_QPA_PLATFORMTHEME = "qt6ct";
    # Do NOT set QT_STYLE_OVERRIDE here.
  };
}
