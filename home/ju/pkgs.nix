{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    #Apps
    #----HKA
    slack
    vscode
    element-desktop
    jetbrains.datagrip
    jetbrains.clion

    wireshark
    obsidian
    xournalpp
    cdrkit

    # -- Tools
    bruno

    # -- Privat
    steam
    tidal-hifi

    vesktop
    discord
    beeper
    beeper-bridge-manager
    speedtest-cli

    # TUI goofing around
    chess-tui
    cbonsai

  ];
}
