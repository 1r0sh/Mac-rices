sketchybar --add item front_app center \
  --set front_app script="$PLUGIN_DIR/window_title.sh" \
  label.font="CaskaydiaCove Nerd Font:Regular:14.0" \
  padding_left=100 \
  padding_right=100 \
  --subscribe front_app front_app_switched
