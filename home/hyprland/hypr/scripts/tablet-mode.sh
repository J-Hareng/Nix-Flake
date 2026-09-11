#!/bin/bash
TOUCHSCREEN_DEVICE=$(libinput list-devices | grep -A 1 "WACF2200:00 056A:53FD Touchscreen" | grep "Kernel:" | awk '{print $2}' | head -n1)
if [ "$1" = "on" ]; then
  # Tablet mode - disable physical keyboard and touchpad
  hyprctl keyword device:at-translated-set-2-keyboard:enabled false
  hyprctl keyword device:elan06fa:00-04f3:327e-touchpad:enabled false

  # Kill existing
  pkill lisgd
  pkill wvkbd
  pkill nwg-drawer

  # Start wvkbd hidden
  wvkbd-deskintl &

  nwg-drawer -r -is 96 -c 4 -spacing 30 -wm hyprland -ovl -closebtn right -o eDP-1 &
  sleep 0.5
  pkill -SIGUSR1 wvkbd # Hide it initially

  # Start lisgd in background
  /usr/bin/lisgd -d "$TOUCHSCREEN_DEVICE" \
    -g "1,LR,*,M,R,hyprctl dispatch workspace e-1" \
    -g "1,RL,*,M,R,hyprctl dispatch workspace e+1" \
    -g "1,DU,*,L,R,hyprctl dispatch fullscreen" \
    -g "1,UD,T,L,R,hyprctl dispatch killactive" \
    -g "1,DU,B,S,R, pkill -USR1 nwg-drawer" \
    -g "1,RL,R,S,R, ~/.local/bin/NightBube" \
    -g "1,UD,B,S,R,pkill -SIGRTMIN wvkbd" \
    -t 125 -r 30 &
else
  # Laptop mode - enable everything
  killall lisgd
  pkill wvkbd
  pkill nwg-drawer

  sleep 0.5

  /usr/bin/lisgd -d "$TOUCHSCREEN_DEVICE" \
    -g "1,RL,R,S,R, ~/.local/bin/NightBube" \
    -t 125 -r 30 &

  hyprctl keyword device:at-translated-set-2-keyboard:enabled true
  hyprctl keyword device:elan06fa:00-04f3:327e-touchpad:enabled true
fi
