{ pkgs, ... }:

{
  home.packages = with pkgs; [
    #TESTER THEMP DUMPER
    gnome-themes-extra
    amdgpu_top

    #Screenshots
    grim
    slurp
    satty
    wayfreeze
  ];

}
