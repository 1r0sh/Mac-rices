#!/bin/bash
source "$HOME/.config/colors.sh"
volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  label.drawing=off
  icon.drawing=off
  slider.highlight_color=$COLOR_WHITE
  slider.background.height=8
  slider.background.corner_radius=16
  slider.background.color=$COLOR_BLACK
  padding_left=0
  padding_right=5
)

volume_icon=(
  icon.padding_left=2
  icon=$VOLUME_100
  icon.color=$COLOR_WHITE
  icon.font="CaskaydiaCove Nerd Font:Regular:16.0"
  label.drawing=off
  label.color=$COLOR_BLACK
)

sketchybar --add slider volume right \
  --set volume "${volume_slider[@]}" \
  --subscribe volume volume_change \
  mouse.clicked \
  mouse.entered \
  mouse.exited \
  mouse.exited.global \
  \
  --add item volume_icon right \
  --set volume_icon "${volume_icon[@]}"
