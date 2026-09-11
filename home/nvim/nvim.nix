{pkgs,...}:
{
  home.packages = with pkgs; [
    neovim

    lazygit


    lua5_1


    clang
    fzf
    ripgrep
    unzip
    fd
  

    #treesitter
    tree-sitter 
    imagemagick
  ];
    # programs.nix-ld.enable = true;
    # programs.nix-ld.libraries = with pkgs; [
    #   tree-sitter 
    #   # Add any missing dynamic libraries for unpackaged programs
    #   # here, NOT in environment.systemPackages
    # ];
  xdg.configFile."nvim".source = ./nvim;
}
