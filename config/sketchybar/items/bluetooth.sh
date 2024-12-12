source "$HOME/.config/icons.sh"
source "$HOME/.config/colors.sh"

sketchybar --add item bluetooth right \
  --set bluetooth script="$PLUGIN_DIR/bluetooth.sh" \
  update_freq=5 \
  padding_left=10 \
  icon.color=$COLOR_WHITE_BRIGHT \
  padding_right=4

icon.font="CaskaydiaCove Nerd Font:Regular:16.0"--subscribe bluetooth
