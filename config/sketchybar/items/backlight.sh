source "$HOME/.config/icons.sh"
source "$HOME/.config/colors.sh"

sketchybar --add item backlight right \
  background.corner_radius=18 \
  --set backlight script="$PLUGIN_DIR/backlight.sh" \
  padding_left=10 \
  padding_right=4 \
  icon.color=$COLOR_WHITE \
  icon.highlight=off

icon.font="CaskaydiaCove Nerd Font:Regular:16.0"--subscribe backlight
