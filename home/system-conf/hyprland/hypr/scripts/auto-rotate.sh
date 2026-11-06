#!/bin/bash

# Change eDP-1 to your actual monitor name (check with: hyprctl monitors)
MONITOR="eDP-1"

monitor-sensor | while read -r line; do
  case "$line" in
  *"normal"*)
    hyprctl keyword monitor "$MONITOR,transform,0"
    ;;
  *"bottom-up"*)
    hyprctl keyword monitor "$MONITOR,transform,2"
    ;;
  *"right-up"*)
    hyprctl keyword monitor "$MONITOR,transform,3"
    ;;
  *"left-up"*)
    hyprctl keyword monitor "$MONITOR,transform,1"
    ;;
  esac
done
