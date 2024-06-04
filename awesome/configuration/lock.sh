#!/bin/bash

# Set the screenshot file name and path
screenshot="/tmp/screen_lock.png"

# Take a screenshot
scrot "$screenshot"

# Apply blur effect using ImageMagick
convert "$screenshot" -blur 0x8 "$screenshot"

# Lock the screen with i3lock using the blurred screenshot as the background
i3lock -i "$screenshot"

# Wait for i3lock to exit (i.e., the screen is unlocked)
wait

# Remove the screenshot
rm "$screenshot"
