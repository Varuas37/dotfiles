#!/bin/bash

# Only show battery on devices that have one (skip Mac Mini, Mac Studio, Mac Pro)
if pmset -g batt | grep -q "InternalBattery"; then
  sketchybar --add item battery right \
             --set battery update_freq=120 \
                           script="$PLUGIN_DIR/battery.sh" \
             --subscribe battery system_woke power_source_change
fi
