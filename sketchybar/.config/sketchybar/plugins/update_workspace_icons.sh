#!/bin/bash

CONFIG_DIR="$HOME/.config/sketchybar"

update_space_icons() {
    local sid=$1
    local apps=$(aerospace list-windows --workspace "$sid" 2>/dev/null | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

    if [ -n "$apps" ]; then
        icon_strip=""
        while read -r app; do
            [ -n "$app" ] && icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
        done <<< "$apps"
        sketchybar --set space.$sid label="$icon_strip"
    else
        sketchybar --set space.$sid label=""
    fi
}

# Update all workspaces across all monitors
for sid in $(aerospace list-workspaces --all 2>/dev/null); do
    update_space_icons "$sid"
done
