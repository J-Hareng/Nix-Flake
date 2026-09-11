{pkgs, ...}:
{
  home.packages = with pkgs; [
  
    nodejs_26

    luarocks

    clang

    go

    sunsetr
  ];
}
