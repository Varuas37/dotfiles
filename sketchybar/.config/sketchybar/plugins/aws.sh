#!/bin/bash

IDENTITY=$(aws sts get-caller-identity 2>/dev/null)

if [ -n "$IDENTITY" ]; then
  ACCOUNT=$(echo "$IDENTITY" | grep -o '"Account": "[^"]*"' | cut -d'"' -f4)
  ARN=$(echo "$IDENTITY" | grep -o '"Arn": "[^"]*"' | cut -d'"' -f4)

  # Extract role name from assumed-role ARN
  ROLE=$(echo "$ARN" | sed -n 's/.*assumed-role\/\([^/]*\).*/\1/p')
  [ -z "$ROLE" ] && ROLE=$(echo "$ARN" | awk -F'/' '{print $NF}')

  sketchybar --set $NAME label="${ACCOUNT}:${ROLE}" drawing=on
else
  sketchybar --set $NAME drawing=off
fi