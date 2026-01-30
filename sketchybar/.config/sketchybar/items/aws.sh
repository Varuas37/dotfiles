#!/bin/bash

sketchybar --add item aws right \
           --set aws  update_freq=10 \
                      icon=󰸏  \
                      script="$PLUGIN_DIR/aws.sh"
