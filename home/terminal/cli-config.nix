
{ pkgs, inputs, ... }:

{
  imports = [
    ./btop/btop.nix
    ./fish-config/fish.nix
    ./starship/starship.nix
    ./tmux/tmux.nix
    ./ghostty/ghostty.nix
  ];
}
