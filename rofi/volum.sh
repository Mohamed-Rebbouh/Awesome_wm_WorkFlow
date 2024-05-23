#!/bin/bash
volum=$(pactl list sinks | grep -A 10 '^[[:space:]]Volume:' | grep -oE '[0-9]{1,3}%' | head -n 1)
# Check if Rofi is running
if pgrep -x "rofi" > /dev/null
then
    # If Rofi is running, kill it
    pkill -x rofi
fi
echo "<span font='FontAwesome' size='xx-large'></span> <span font='5x-large'>  $volum</span>" | rofi -dmenu -markup-rows -p "volums: " -config ~/.config/rofi/volum.rasi  & 
sleep 0.6
pkill -x rofi 
