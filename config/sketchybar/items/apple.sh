#!/bin/bash

# Load global styles, colors and icons
source "$HOME/.config/colors.sh"

POPUP_OFF='sketchybar --set logo popup.drawing=off'

logo=(
  "${menu_defaults[@]}"
  icon=󰮯
  icon.font="CaskaydiaCove Nerd Font:Regular:16.0"
  icon.color=$COLOR_WHITE
  label.drawing=off
  popup.align=left
  popup.y_offset=3
  popup.background.color=$COLOR_BLACK
  click_script="sketchybar --set logo popup.drawing=toggle"
  --subscribe logo mouse.exited
  mouse.exited.global
)

logo_about=(
  "${menu_item_defaults[@]}"
  icon=􀅴
  label="About This Mac"
  label.color=$COLOR_WHITE
  click_script="open x-apple.systempreferences:com.apple.SystemProfiler.AboutExtension; $POPUP_OFF"
  "${separator[@]}"
)

logo_settings=(
  "${menu_item_defaults[@]}"
  icon=􀍟
  label="System Settings"
  label.color=$COLOR_WHITE
  click_script="open -a 'System Settings'; $POPUP_OFF"
)

logo_sleep=(
  "${menu_item_defaults[@]}"
  icon=􀜚
  label="Sleep"
  label.color=$COLOR_WHITE
  click_script="pmset sleepnow; $POPUP_OFF"
)

logo_restart=(
  "${menu_item_defaults[@]}"
  icon=􀣨
  label="Restart…"
  label.color=$COLOR_WHITE
  click_script="osascript -e 'tell app \"loginwindow\" to «event aevtrrst»'; $POPUP_OFF"
)

logo_shutdown=(
  "${menu_item_defaults[@]}"
  icon=􀷃
  label="Shut Down…"
  label.color=$COLOR_WHITE
  click_script="osascript -e 'tell app \"loginwindow\" to «event aevtrsdn»'; $POPUP_OFF"
)

logo_lockscreen=(
  "${menu_item_defaults[@]}"
  icon=􀼑
  label="Lock Screen    􀆍􀆔Q"
  label.color=$COLOR_WHITE
  click_script="osascript -e 'tell application \"System Events\" to keystroke \"q\" using {command down,control down}'; $POPUP_OFF"
)

logo_logout=(
  "${menu_item_defaults[@]}"
  icon=􀉭
  label="Log Out ${USER}… 􀆝􀆔Q"
  label.color=$COLOR_WHITE
  click_script="osascript -e 'tell app \"System Events\" to log out'; $POPUP_OFF"
  "${separator[@]}"
)

logo_refresh=(
  "${menu_item_defaults[@]}"
  icon=􀅈
  label="Refresh Sketchybar"
  label.color=$COLOR_WHITE
  click_script="$POPUP_OFF; sketchybar --update"
)

sketchybar \
  --add item logo left \
  --set logo "${logo[@]}" \
  \
  --add item logo.about popup.logo \
  --set logo.about "${logo_about[@]}" \
  \
  --add item logo.settings popup.logo \
  --set logo.settings "${logo_settings[@]}" \
  \
  --add item logo.sleep popup.logo \
  --set logo.sleep "${logo_sleep[@]}" \
  \
  --add item logo.restart popup.logo \
  --set logo.restart "${logo_restart[@]}" \
  \
  --add item logo.shut_down popup.logo \
  --set logo.shut_down "${logo_shutdown[@]}" \
  \
  --add item logo.lock_screen popup.logo \
  --set logo.lock_screen "${logo_lockscreen[@]}" \
  \
  --add item logo.logout popup.logo \
  --set logo.logout "${logo_logout[@]}" \
  \
  --add item logo.refresh popup.logo \
  --set logo.refresh "${logo_refresh[@]}"
