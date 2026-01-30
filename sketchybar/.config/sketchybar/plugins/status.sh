#!/bin/bash

# Status indicator plugin
# Uses pixel art icons to show system/service status
# Purple = OK, Yellow = Warning, Red = Down

ASSETS_DIR="$CONFIG_DIR/assets"

# Function to set status based on a condition
# You can customize this to check whatever service/status you want
get_status() {
    # Example: Check if a service is running, ping a server, etc.
    # For demo, we'll rotate through statuses or you can add your own logic

    # Example checks you could add:
    # - Check if a website responds: curl -s -o /dev/null -w "%{http_code}" https://example.com
    # - Check if a process is running: pgrep -x "processname"
    # - Check network connectivity: ping -c 1 -W 1 8.8.8.8

    # Demo: cycle based on minute for testing
    # minute=$(($(date +%M) % 3))
    # case $minute in
    #     0) echo "ok" ;;
    #     1) echo "warning" ;;
    #     2) echo "down" ;;
    # esac

    # Default: show OK status
    echo "ok"
}

STATUS=$(get_status)

case $STATUS in
    "ok")
        sketchybar --set $NAME \
            background.image="$ASSETS_DIR/status_ok.png" \
            background.image.scale=0.8
        ;;
    "warning")
        sketchybar --set $NAME \
            background.image="$ASSETS_DIR/status_warning.png" \
            background.image.scale=0.8
        ;;
    "down")
        sketchybar --set $NAME \
            background.image="$ASSETS_DIR/status_down.png" \
            background.image.scale=0.8
        ;;
esac