#!/bin/bash

options="Performance (AC)\nBalanced (Auto)\nPower Saver (Battery)"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Profile" -theme ~/.local/share/rofi/themes/simple-tokyonight.rasi)

case $chosen in
"Performance (AC)")
  sudo tlp ac
  notify-send "Power Profile" "Switched to Performance mode"
  ;;
"Balanced (Auto)")
  sudo tlp start
  notify-send "Power Profile" "Switched to Auto mode"
  ;;
"Power Saver (Battery)")
  sudo tlp bat
  notify-send "Power Profile" "Switched to Power Saver mode"
  ;;
esac
