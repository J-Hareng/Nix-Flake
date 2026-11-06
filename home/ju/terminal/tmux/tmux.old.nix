{pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    prefix = "C-s";
    mouse = true;
    escapeTime = 10;
    focusEvents = true;

    plugins = with pkgs.tmuxPlugins; [
      sensible
      {
        plugin = tokyo-night-tmux;
        extraConfig = ''
          set -g @tokyo-night-tmux_theme night
          set -g @tokyo-night-tmux_transparent 1
          set -g @tokyo-night-tmux_show_music 1
        '';
      }
    ];

    extraConfig = ''
      set-option -g status-position top
      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R
    '';
  };

  home.packages = with pkgs; [
    bc
    jq
    gawk
    playerctl
  ];
}
