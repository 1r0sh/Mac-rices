#!/bin/bash

# W I N D O W  T I T L E
WINDOW_TITLE=$(/opt/homebrew/bin/yabai -m query --windows --window | jq -r '.title')

if [[ $WINDOW_TITLE = "" ]]; then
  #WINDOW_TITLE=$(/opt/homebrew/bin/yabai -m query --windows --window | jq -r '.app')
  sketchybar --set title label=""
fi

if [[ ${#WINDOW_TITLE} -gt 50 ]]; then
  WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-50)
  sketchybar --set title label="$WINDOW_TITLE"…
  exit 0
fi

#sketchybar -m --set title label="$WINDOW_TITLE"
