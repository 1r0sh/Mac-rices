#!/bin/bash

source "$HOME/.config/colors.sh"
TMP="/tmp/drawing_state.txt"

render_item() {
  PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)
  CHARGING=$(pmset -g batt | grep 'AC Power')
  #COLOR=$COLOR_YELLOW
  local DRAWING=$(get_label_state)

  if [ $PERCENTAGE = "" ]; then
    exit 0
  fi

  case ${PERCENTAGE} in
  9[0-9] | 100)
    ICON="􀛨"
    COLOR=$COLOR_GREEN
    LABEL=$COLOR_GREEN
    ;;
  [7-8][0-9])
    ICON="􀺸"
    COLOR=$COLOR_GREEN
    LABEL=$COLOR_WHITE_BRIGHT
    ;;
  [3-6][0-9])
    ICON="􀺶"
    COLOR=$COLOR_YELLOW
    LABEL=$COLOR_WHITE_BRIGHT
    ;;
  2[0-9])
    ICON="􀛩"
    COLOR=$COLOR_YELLOW
    LABEL=$COLOR_WHITE_BRIGHT
    DRAWING="on"
    ;;
  1[0-9])
    ICON="􀛩"
    COLOR=$COLOR_RED
    LABEL=$COLOR_RED
    DRAWING="on"
    ;;
  *)
    ICON="􀛪"
    COLOR=$COLOR_RED
    LABEL=$COLOR_RED
    DRAWING="on"
    ;;
  esac

  if [[ $CHARGING != "" ]]; then
    ICON="􀢋"
  fi

  sketchybar --set $NAME icon=$ICON icon.color=$COLOR_GREEN label=$PERCENTAGE% label.color=$COLOR_WHITE_BRIGHT label.drawing=$DRAWING
}

save_label_state() {
  echo "$(sketchybar --query $NAME | jq -r '.label.drawing')" >"$TMP"
}

get_label_state() {
  if [ -e "$TMP" ]; then
    cat "$TMP"
  else
    echo "off" >"$TMP"
  fi
}

label_toggle() {
  if [[ $(get_label_state) == "on" ]]; then
    DRAWING="off"
  else
    DRAWING="on"
  fi

  sketchybar --set $NAME label.drawing=$DRAWING
  save_label_state
}

case "$SENDER" in
"mouse.clicked")
  label_toggle
  ;;
"routine" | "forced" | "power_source_change")
  render_item
  ;;
esac
