#!/bin/bash

STATE_FILE="/tmp/tmux-timezone-state"

# Toggle the state
if [ -f "$STATE_FILE" ]; then
    current=$(cat "$STATE_FILE")
    if [ "$current" = "PST" ]; then
        echo "UTC" > "$STATE_FILE"
    else
        echo "PST" > "$STATE_FILE"
    fi
else
    # Default to UTC after first toggle
    echo "UTC" > "$STATE_FILE"
fi

# Refresh tmux status bar
tmux refresh-client -S
