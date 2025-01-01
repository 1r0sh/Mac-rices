source "$HOME/.config/icons.sh"
source "$HOME/.config/colors.sh"

STATE=$(system_profiler SPBluetoothDataType | awk -F ' State: ' '/ State: / {print $2}')

if [[ $STATE == "On" ]]; then
  ICON=$ICON_BLUETOOTH
  LABEL="on"
else
  ICON=$ICON_BLUETOOTH_OFF
  LABEL="off"
fi

sketchybar --set bluetooth \
  icon=$ICON \
  label=$LABEL \
  update_freq=3
