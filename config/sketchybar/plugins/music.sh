#!/bin/bash
source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

PLAYER_STATE="$(echo "$INFO" | jq -r '.state')"
CURRENT_ARTIST="$(echo "$INFO" | jq -r '.artist')"
CURRENT_SONG="$(echo "$INFO" | jq -r '.title')"

if [ "$PLAYER_STATE" = "playing" ]; then
  sketchybar --set $NAME drawing=on icon=$ICON_MUSIC label="$CURRENT_SONG"
else
  sketchybar --set $NAME drawing=on icon=$ICON_MUSIC label="Nothing Playing yet."
fi

# Mus() {
#   if [[ "$PLAYER_STATE" != "playing" ]]; then
#     sketchybar --set $NAME drawing =off
#   fi
# }
