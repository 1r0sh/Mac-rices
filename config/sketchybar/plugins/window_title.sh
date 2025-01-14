#!/bin/bash

# W I N D O W  T I T L E
WINDOW_TITLE=$(/opt/homebrew/bin/yabai -m query --windows --window | jq -r '.title')

if [[ $WINDOW_TITLE = "" ]]; then
  WINDOW_TITLE="Desktop"
fi

if [[ ${#WINDOW_TITLE} -gt 40 ]]; then
  WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-40)
  sketchybar --set title label="$WINDOW_TITLE"…
  exit 0
fi

sketchybar -m --set title label="$WINDOW_TITLE"
