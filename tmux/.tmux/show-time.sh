#!/bin/bash

STATE_FILE="/tmp/tmux-timezone-state"

# Default to PST if no state file exists
if [ -f "$STATE_FILE" ]; then
    timezone=$(cat "$STATE_FILE")
else
    timezone="PST"
fi

if [ "$timezone" = "UTC" ]; then
    TZ='UTC' date '+%Y-%m-%d 󰅐 %H:%M UTC'
else
    TZ='America/Los_Angeles' date '+%Y-%m-%d 󰅐 %H:%M PST'
fi
