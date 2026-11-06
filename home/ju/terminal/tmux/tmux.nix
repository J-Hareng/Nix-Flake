{pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-s";
    mouse = true;
    escapeTime = 10;
    focusEvents = true;
    terminal = "tmux-256color";
    plugins = with pkgs.tmuxPlugins; [
      sensible
    ];
    extraConfig = ''
      set-option -g status-position top

      bind-key h select-pane -L
      bind-key j select-pane -D
      bind-key k select-pane -U
      bind-key l select-pane -R

      # --- Ariadne theme ---
      # True color support. Ghostty reports itself as "xterm-ghostty"
      # outside tmux, so RGB is declared specifically for that.
      set -as terminal-features ",xterm-ghostty:RGB"
      set -as terminal-overrides ",xterm-ghostty:Tc"

      # Status bar
      set -g status-style "bg=#0a1816,fg=#f5e2c5"
      set -g status-interval 5
      set -g status-justify left

      # Left: session name badge
      set -g status-left-length 40
      set -g status-left "#[bg=#3dd1b0,fg=#040e0d,bold] #S #[bg=#0a1816,fg=#3dd1b0,nobold]"

      # Right: time + hostname
      set -g status-right-length 60
      set -g status-right "#[fg=#152a26,bg=#0a1816]#[bg=#152a26,fg=#c4b09a] %H:%M #[fg=#5a4d3e]│#[fg=#c4b09a] #h "

      # Window status (tabs)
      set -g window-status-style "fg=#5a4d3e,bg=#0a1816"
      set -g window-status-format " #I:#W "

      set -g window-status-current-style "fg=#040e0d,bg=#3dd1b0,bold"
      set -g window-status-current-format " #I:#W "

      set -g window-status-separator ""
      set -g window-status-activity-style "fg=#ff6048,bg=#0a1816"
      set -g window-status-bell-style "fg=#ffa478,bg=#0a1816,bold"

      # Panes
      set -g pane-border-style "fg=#1d3631"
      set -g pane-active-border-style "fg=#3dd1b0"

      set -g display-panes-colour "#5a4d3e"
      set -g display-panes-active-colour "#ffa478"

      # Messages / command prompt (prefix + :)
      set -g message-style "bg=#0f211f,fg=#f5cd5b,bold"
      set -g message-command-style "bg=#0f211f,fg=#f5cd5b"

      # Copy mode selection
      set -g mode-style "bg=#152a26,fg=#f5e2c5"

      # Clock mode (prefix + t)
      set -g clock-mode-colour "#3dd1b0"
      set -g clock-mode-style 24
    '';

  };
  # home.packages = with pkgs; [
  #   bc
  #   jq
  #   gawk
  #   playerctl
  # ];
}
