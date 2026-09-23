{ pkgs, inputs, ... }:

{
  imports = [
    ./fish-config/fish.nix
    ./starship/starship.nix
    ./tmux/tmux.nix
    ./ghostty/ghostty.nix
  ];
}
