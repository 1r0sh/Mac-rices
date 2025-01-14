source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

POPUP_OFF='sketchybar --set wifi popup.drawing=off'
HOST_NAME=$(ipconfig getsummary en0 | awk -F ' SSID : ' '/ SSID : / {print $2}')

wifi=(
  "${menu_defaults[@]}"
  script="$PLUGIN_DIR/wifi.sh"
  icon=$ICON_WIFI
  icon.font="CaskaydiaCove Nerd Font:Regular:16.0"
  icon.color=$COLOR_WHITE
  label=$HOST_NAME
  label.color=$COLOR_WHITE
  label.drawing=on
  popup.align=center
  popup.y_offset=3
  popup.background.color=$COLOR_BLACK
  padding_left=10
  update_freq=3
  click_script="sketchybar --set wifi popup.drawing=toggle"
  --subscribe wifi mouse.exited
  mouse.exited.global
)

wifi_on=(
  "${menu_item_defaults[@]}"
  icon=󰖩
  icon.color=$COLOR_GREEN
  icon.padding_left=4
  label.padding_left=8
  label="Enable Network"
  label.color=$COLOR_WHITE
  click_script="$POPUP_OFF; networksetup -setnetworkserviceenabled Wi-Fi on"
  "${separator[@]}"
)

wifi_off=(
  "${menu_item_defaults[@]}"
  icon=󰖪
  icon.color=$COLOR_RED
  icon.padding_left=4
  label.padding_left=8
  label="Disable Network"
  label.color=$COLOR_WHITE
  click_script="$POPUP_OFF; networksetup -setnetworkserviceenabled Wi-Fi off"
  "${separator[@]}"
)

sketchybar \
  --add item wifi right \
  --set wifi "${wifi[@]}" \
  \
  --add item wifi.on popup.wifi \
  --set wifi.on "${wifi_on[@]}" \
  \
  --add item wifi.off popup.wifi \
  --set wifi.off "${wifi_off[@]}"

# sketchybar --add item wifi right \
#   --set wifi script="$PLUGIN_DIR/wifi.sh" \
#   update_freq=5 \
#   padding_left=10 \
#   padding_right=4 \
#   background.border_width=0 \
#   background.corner_radius=18 \
#   background.height=24 \
#   label.highlight=off \
#   icon.color=$COLOR_MAGENTA \
#   icon.highlight=off
# #background.color=$COLOR_YELLOW
#
# icon.font="CaskaydiaCove Nerd Font:Regular:16.0"--subscribe wifi wifi_change
