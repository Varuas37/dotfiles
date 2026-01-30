#!/usr/bin/env bash

source "$CONFIG_DIR/colors.sh"

SID="$1"

if [ "$SID" = "$FOCUSED_WORKSPACE" ]; then
    # Get unique app icons for the focused workspace
    icon_strip=""
    seen_apps=""

    while IFS='|' read -r _ app _; do
        app=$(echo "$app" | xargs)  # trim whitespace
        # Check if app already seen
        if [ -n "$app" ] && [[ "$seen_apps" != *"|$app|"* ]]; then
            seen_apps+="|$app|"
            icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
        fi
    done < <(aerospace list-windows --workspace "$SID" 2>/dev/null)

    sketchybar --set $NAME background.drawing=on \
                           background.color=$ACCENT_COLOR \
                           label="$icon_strip" \
                           label.color=$BAR_COLOR \
                           icon.color=$BAR_COLOR
else
    sketchybar --set $NAME background.drawing=off \
                           label="" \
                           label.color=$ACCENT_COLOR \
                           icon.color=$ACCENT_COLOR
fi
