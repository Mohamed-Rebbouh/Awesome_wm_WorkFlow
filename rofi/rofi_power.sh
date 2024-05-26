#!/bin/bash

options="󰐥 Power Off\n󰜉 Restart\n Lock\n Logout"  # Icons can be Unicode characters or other symbols
 
# Get the user's choice using Rofi
choice=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu" -config ~/.config/rofi/powe.rasi -a 20)

# Perform actions based on the user's choice
case "$choice" in
    "󰐥 Power Off")
        systemctl poweroff
        ;;
    "󰜉 Restart")
        systemctl restart
        ;;
    " Lock")
       i3lock -i ~/.config/rofi/lock.png
        ;;
    " Logout")
        awesome-client "awesome.quit()"
        ;;
    *)
        echo "Invalid option"
        ;;
esac
