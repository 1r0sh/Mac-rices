#!/bin/env/bash

source "$HOME/.config/colors.sh"

battery=(
  icon.color=$COLOR_GREEN
  icon.font.size=16
  icon.padding_left=10
  icon.padding_right=2
  icon.font.style="Light"
  update_freq=10
  popup.align=right
  script="$PLUGIN_DIR/battery.sh"
  updates=when_shown
)

sketchybar \
  --add item battery right \
  --set battery "${battery[@]}" \
  --subscribe battery power_source_change \
  mouse.clicked
