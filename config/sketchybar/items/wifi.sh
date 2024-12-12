source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

sketchybar --add item wifi right \
  --set wifi script="$PLUGIN_DIR/wifi.sh" \
  update_freq=5 \
  padding_left=10 \
  padding_right=4 \
  background.border_width=0 \
  background.corner_radius=18 \
  background.height=24 \
  label.highlight=off \
  icon.highlight=off
#background.color=$COLOR_YELLOW

icon.font="CaskaydiaCove Nerd Font:Regular:16.0"--subscribe wifi wifi_change
