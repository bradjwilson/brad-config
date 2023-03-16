#!/bin/bash

# Check if argument is an integer (including signed integers)
if [[ "$1" =~ ^[-+]?[0-9]+$ ]]; then
  CURRENT_V=$(amixer -D pulse get Master | awk -F 'Left:|[][]' 'BEGIN {RS=""}{ print $3 }')
  CURRENT_V=${CURRENT_V::-1}
  sum=$(( $1 + CURRENT_V ))
  if ((sum < 0)); then
    sum=0
  fi
  if ((sum > 100)); then
    sum=100
  fi
  pactl set-sink-volume @DEFAULT_SINK@ $sum%
elif [[ "$1" == "audio-mute" ]]; then
  pactl set-sink-mute @DEFAULT_SINK@ toggle
elif [[ "$1" == "mic-mute" ]]; then
  pactl set-source-mute @DEFAULT_SOURCE@ toggle
elif [[ "$1" == "play-pause" ]]; then
  playerctl play-pause
elif [[ "$1" == "next" ]]; then
  playerctl next
elif [[ "$1" == "previous" ]]; then
  playerctl previous 
fi

# Print the argument
echo "The argument is: $1"
