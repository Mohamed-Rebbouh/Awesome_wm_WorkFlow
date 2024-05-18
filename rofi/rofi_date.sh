#!/usr/bin/env bash

# Function to get current date and time with the current day highlighted
get_highlighted_date_time() {
    # Get current date and time
    current_datetime=$(date +"%A, %B %d, %Y %H:%M:%S")

    # Highlight the current day
    highlighted_datetime=$(echo "$current_datetime" | sed -E "s/$(date +%d)/<b>\0<\/b>/")

    echo "$highlighted_datetime"
}

# Function to get battery status
get_battery_status() {
    # Get battery status using acpi command
    battery_status=$(acpi -b)

    echo "$battery_status"
}

# Get current date and time
current_datetime=$(get_highlighted_date_time)

# Get battery status
battery_status=$(get_battery_status)

# Use rofi to display the current date and time and battery status
echo -e "$current_datetime\n\n$battery_status" | rofi -dmenu -markup-rows -p "Date & Time and Battery Status: "
