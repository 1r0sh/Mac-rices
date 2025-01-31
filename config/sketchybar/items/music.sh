#!/bin/env/bash
PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

music=(
  #"${bracket_defaults[@]}"
  script="$PLUGIN_DIR/music.sh"
  padding_left=4
  label.padding_right=20
  label.font="JetBrainsMonoNL Nerd Font:Regular:13.0"
  label.padding_left=5
  icon.padding_left=10
  icon.color=$RED_MAT
  padding_right=4
  label="Loading…"
  label.color=$WHITE_BRIGHT
  label.max_chars=25
  click_script="open -a'Elmedia Player'"
  update=on
  --subscribe music media_change
)

sketchybar \
  --add item music left \
  --set music "${music[@]}"
