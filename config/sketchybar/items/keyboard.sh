#!/bin/bash

source "$HOME/.config/icons.sh"
source "$HOME/.config/colors.sh"

POPUP_OFF='sketchybar --set keyboard popup.drawing=off'

keyboard=(
  "${menu_defaults[@]}"
  popup.align=center
  popup.y_offset=3
  popup.background.color=$BLACK
  icon.drawing=off
  label.font="JetBrainsMonoNL Nerd Font:Regular:14.0"
  label.color=$WHITE_BRIGHT
  click_script="sketchybar --set keyboard popup.drawing=toggle"
  script="$PLUGIN_DIR/keyboard.sh"
)

key_en=(
  "${menu_item_defaults[@]}"
  icon=󰖩
  icon.color=$GREEN_MAT
  icon.padding_left=4
  label.padding_left=8
  label="English"
  label.font="JetBrainsMonoNL Nerd Font:Regular:14.0"
  label.color=$WHITE_BRIGHT
  click_script="$POPUP_OFF; xkbswitch -se 'US'"
  "${separator[@]}"
)

key_fa=(
  "${menu_item_defaults[@]}"
  icon=󰖪
  icon.color=$RED_MAT
  icon.padding_left=4
  label.padding_left=8
  label="Farsi"
  label.font="JetBrainsMonoNL Nerd Font:Regular:14.0"
  label.color=$WHITE_BRIGHT
  click_script="$POPUP_OFF; xkbswitch -se 'Persian-ISIRI2901'"
  "${separator[@]}"
)

sketchybar \
  --add item keyboard right \
  --set keyboard "${keyboard[@]}" \
  --add event keyboard_change "AppleSelectedInputSourcesChangedNotification" \
  --subscribe keyboard keyboard_change \
  \
  --add item key.en popup.keyboard \
  --set key.en "${key_en[@]}" \
  \
  --add item key.fa popup.keyboard \
  --set key.fa "${key_fa[@]}"
