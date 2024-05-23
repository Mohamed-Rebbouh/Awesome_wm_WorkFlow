#!/bin/bash
light=$(light)
if pgrep -x "rofi" > /dev/null
then
    # If Rofi is running, kill it
    pkill -x rofi
fi
echo "<span font='FontAwesome' size='xx-large'>󰃞</span> <span font='5x-large'>  $light</span>" | rofi -dmenu -markup-rows -p "volums: " -config ~/.config/rofi/volum.rasi  & 
sleep 0.6
pkill -x rofi 
