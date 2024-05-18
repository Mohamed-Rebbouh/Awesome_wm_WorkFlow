#! /bin/sh


# Define options for the power menu
options="Power Off\nRestart\nLock\nLogout"

# Get the user's choice using Rofi
choice=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")

# Perform actions based on the user's choice
case "$choice" in
    "Power Off")
        systemctl poweroff
        ;;
    "Restart")
        systemctl reboot
        ;;
    "Lock")
       i3lock -c 000000
        ;;
    "Logout")
        awesome-client "awesome.quit()"
        ;;
    *)
        echo "Invalid option"
        ;;
esac
