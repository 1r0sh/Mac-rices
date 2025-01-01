source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

HOST_NAME=$(ipconfig getsummary en0 | awk -F ' SSID : ' '/ SSID : / {print $2}')
STATE=$(networksetup -getairportpower en0)

if [[ $STATE == "Wi-Fi Power (en0): On" ]]; then
  ICON=$ICON_WIFI
  LABEL=$HOST_NAME
else
  ICON=$ICON_WIFI_OFF
  LABEL="Disabled"
fi

sketchybar --set $NAME \
  icon=$ICON \
  label=$LABEL
#click_script="osascript -e 'tell application \"System Events\" to tell process \"Control Center\" to perform action \"AXPress\" of menu bar item 3 of menu bar 1'"
