source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

HOST_NAME=$(ipconfig getsummary en0 | awk -F ' SSID : ' '/ SSID : / {print $2}')

sketchybar --set $NAME \
  icon=$ICON_WIFI \
  label="$HOST_NAME" \
  click_script="osascript -e 'tell application \"System Events\" to tell process \"Control Center\" to perform action \"AXPress\" of menu bar item 3 of menu bar 1'"
