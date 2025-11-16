#!/usr/bin/env bash

# Get the active window's class
ACTIVE_CLASS=$(hyprctl -j activewindow | jq -r '."class"')

# Check if the class is "gamescope"
if [[ "$ACTIVE_CLASS" == "gamescope" ]]; then

    # Use tofi for a confirmation dialog
    CONFIRM=$(echo -e "No\nYes" | tofi --prompt-text "Close this game?")
    
    # If "Yes" is selected, close the window
    if [[ "$CONFIRM" == "Yes" ]]; then
        hyprctl dispatch killactive
    fi

else
    # If it's not a gamescope window, close it immediately
    hyprctl dispatch killactive
fi
