#!/bin/bash

STATE_FILE="/tmp/sketchybar_calendar_utc"

# Toggle state on click
if [ "$1" = "click" ]; then
  if [ -f "$STATE_FILE" ]; then
    rm "$STATE_FILE"
  else
    touch "$STATE_FILE"
  fi
fi

# Display time based on state
if [ -f "$STATE_FILE" ]; then
  sketchybar --set $NAME label="$(TZ=UTC date +'%a %d %b %H:%M UTC')"
else
  sketchybar --set $NAME label="$(date +'%a %d %b %H:%M')"
fi
