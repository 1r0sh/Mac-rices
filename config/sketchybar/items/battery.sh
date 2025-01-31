#!/bin/env/bash

source "$HOME/.config/colors.sh"

POPUP_OFF='sketchybar --set battery popup.drawing=off'
PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(pmset -g batt | grep 'AC Power')
STATUS=$(system_profiler SPPowerDataType | grep "Maximum Capacity:" | sed -e 's/^[ \t]*//')
CYCLE=$(system_profiler SPPowerDataType | grep "Cycle Count:" | sed -e 's/^[ \t]*//')

battery=(
  "${menu_defaults[@]}"
  icon.color=$WHITE_BRIGHT
  icon.padding_left=6
  icon.padding_right=2
  icon.font="JetBrainsMonoNL Nerd Font:Regular:14.0"
  label.font="JetBrainsMonoNL Nerd Font:Regular:12.0"
  update_freq=5
  popup.align=center
  popup.y_offset=3
  popup.background.color=$BLACK
  script="$PLUGIN_DIR/battery.sh"
  click_script="sketchybar --set battery popup.drawing=toggle"
  updates=when_shown
  --subscribe battery power_source_change
  mouse.clicked
  mouse.exited
  mouse.exited.global
)

battery_state=(
  "${menu_item_defaults[@]}"
  label=$STATUS
  label.color=$WHITE_BRIGHT
  label.font="JetBrainsMonoNL Nerd Font:Regular:12.0"
  label.padding_left=0
  label.padding_right=0
  click_script="$POPUP_OFF"
  "${separator[@]}"
)

battery_cycle=(
  "${menu_item_defaults[@]}"
  label="Your $CYCLE"
  label.color=$WHITE_BRIGHT
  label.font="JetBrainsMonoNL Nerd Font:Regular:12.0"
  label.padding_left=0
  label.padding_right=0
  click_script="$POPUP_OFF"
  "${separator[@]}"
)

sketchybar \
  --add item battery right \
  --set battery "${battery[@]}" \
  \
  --add item battery_state popup.battery \
  --set battery_state "${battery_state[@]}" \
  \
  --add item battery_cycle popup.battery \
  --set battery_cycle "${battery_cycle[@]}"
