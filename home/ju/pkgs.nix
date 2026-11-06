{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    #Apps
    #----HKA
    slack
    vscode
    element-desktop
    jetbrains.datagrip

    wireshark
    obsidian
    xournalpp

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
