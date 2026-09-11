#!/bin/bash

$Path_to_Layouts = ~/.config/hypr/monitor_layout/

options="Home_Layout\nBalanced (Auto)\nPower Saver (Battery)"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Profile" -theme ~/.local/share/rofi/themes/simple-tokyonight.rasi)

case $chosen in
"Home_Layout")
  sudo mv ~/.config/hypr/monitors.conf ~/.config/hypr/monitors.conf.bak
  sudo cp ~/.config/hypr/monitorsHOME.conf ~/.config/hypr/

  notify-send "Screen_Layout" "Switched to Home Layout"
  ;;
"Reload Backup Layout")
  sudo tlp start
  notify-send "Power Profile" "Switched to Auto mode"
  ;;
"Power Saver (Battery)")
  sudo tlp bat
  notify-send "Power Profile" "Switched to Power Saver mode"
  ;;
esac
