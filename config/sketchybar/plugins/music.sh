#!/bin/bash
source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

PLAYER_STATE="$(echo "$INFO" | jq -r '.state')"
CURRENT_ARTIST="$(echo "$INFO" | jq -r '.artist')"
CURRENT_SONG="$(echo "$INFO" | jq -r '.title')"

if [ "$PLAYER_STATE" = "playing" ]; then
  sketchybar --set $NAME drawing=on icon=$ICON_MUSIC icon.color=$COLOR_WHITE label="$CURRENT_SONG"
else
  sketchybar --set $NAME drawing=on icon=$ICON_MUSIC icon.color=$COLOR_WHITE label="No media is available"
fi

# Mus() {
#   if [[ "$PLAYER_STATE" != "playing" ]]; then
#     sketchybar --set $NAME drawing =off
#   fi
# }
