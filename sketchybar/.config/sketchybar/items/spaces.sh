#!/bin/bash

# AeroSpace workspace items
SPACE_SIDS=(1 2 3 4 5)

for sid in "${SPACE_SIDS[@]}"
do
  sketchybar --add item space.$sid left                                 \
             --subscribe space.$sid aerospace_workspace_change          \
             --set space.$sid icon=$sid                                  \
                              label=""                                   \
                              label.font="sketchybar-app-font:Regular:16.0" \
                              label.padding_right=10                     \
                              label.padding_left=0                       \
                              label.y_offset=-1                          \
                              icon.padding_right=6                       \
                              icon.padding_left=6                        \
                              click_script="aerospace workspace $sid"    \
                              script="$PLUGIN_DIR/aerospace.sh $sid"
done

sketchybar --add item space_separator left                             \
           --set space_separator icon="􀆊"                                \
                                 icon.color=$ACCENT_COLOR \
                                 icon.padding_left=4                   \
                                 label.drawing=off                     \
                                 background.drawing=off
