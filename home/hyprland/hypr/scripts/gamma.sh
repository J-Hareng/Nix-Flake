#!/bin/bash

current_gamma=$(sunsetr get static_gamma)

if [[ "$1" = "+" ]]; then
  if [[ $((current_gamma + 10)) -ge 100 ]]; then
    $current_gamma = 100
  else
    current_gamma=$((current_gamma + 10))
  fi

elif [[ "$1" = "-" ]]; then
  if [[ $((current_gamma - 10)) -le 10 ]]; then
    current_gamma=$((10))
  else
    current_gamma=$((current_gamma - 10))

  fi

fi

sunsetr set static_gamma=$(($current_gamma))
exit 0
