#!/bin/bash
notify-send DoubleTap
active_window=$(hyprctl activewindow -j | jq -r '.class')

if [[ "$active_window" == "Xournalpp" ]]; then
  ydotool key 29:1 44:1 44:0 29:0 # Ctrl+Z
fi
