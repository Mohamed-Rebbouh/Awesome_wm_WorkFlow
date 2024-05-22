#!/bin/bash

# Get the name of the connected WiFi network
connected_wifi=$(iwgetid -r)

# Get the list of available WiFi networks
wifi_list=$(nmcli --fields "SECURITY,SSID" device wifi list | sed 1d | sed 's/  */ /g' | sed -E "s/WPA*.?\S/ /g" | sed "s/^--/ /g" | sed "s/  //g" | sed "/--/d")

# Filter out the connected WiFi network
filtered_wifi_list=$(echo "$wifi_list" | grep -v "$connected_wifi")

echo "$filtered_wifi_list"
