source "$HOME/.config/icons.sh"
source "$HOME/.config/colors.sh"

STATE=$(system_profiler SPBluetoothDataType | awk -F ' State: ' '/ State: / {print $2}')

if [[ $STATE == "On" ]]; then
  ICON=$ICON_BLUETOOTH

else
  ICON=$ICON_BLUETOOTH_OFF

fi

sketchybar --set bluetooth \
  icon=$ICON \
  click_script="blueutil -p 1"
