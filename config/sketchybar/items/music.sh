#!/bin/env/bash
PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

music=(
  #"${bracket_defaults[@]}"
  script="$PLUGIN_DIR/music.sh"
  padding_left=4
  label.padding_right=20
  label.padding_left=5
  icon.padding_left=10
  padding_right=4
  label="Loading…"
  background.corner_radius=9
  background.color=$COLOR_BLACK
  label.color=$COLOR_WHITE
  label.max_chars=25
  click_script="open -a Spotube"
  updates=on
  --subscribe music media_change
)

sketchybar \
  --add item music left \
  --set music "${music[@]}"
