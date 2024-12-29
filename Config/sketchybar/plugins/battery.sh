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
    COLOR=$COLOR_WHITE
    LABEL=$COLOR_WHITE
    ;;
  [7-8][0-9])
    ICON="􀺸"
    COLOR=$COLOR_WHITE
    LABEL=$COLOR_WHITE
    ;;
  [3-6][0-9])
    ICON="􀺶"
    COLOR=$COLOR_WHITE
    LABEL=$COLOR_WHITE
    ;;
  2[0-9])
    ICON="􀛩"
    COLOR=$COLOR_WHITE
    LABEL=$COLOR_WHITE
    DRAWING="on"
    ;;
  1[0-9])
    ICON="􀛩"
    COLOR=$COLOR_WHITE
    LABEL=$COLOR_WHITE
    DRAWING="on"
    ;;
  *)
    ICON="􀛪"
    COLOR=$COLOR_WHITE
    LABEL=$COLOR_WHITE
    DRAWING="on"
    ;;
  esac

  if [[ $CHARGING != "" ]]; then
    ICON="􀢋"
  fi

  sketchybar --set $NAME icon=$ICON icon.color=$COLOR_WHITE label=$PERCENTAGE% label.color=$COLOR_WHITE label.drawing=$DRAWING
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