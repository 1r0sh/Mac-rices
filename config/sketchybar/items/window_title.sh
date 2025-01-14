# E V E N T S
sketchybar -m --add event window_focus \
  --add event title_change

# W I N D O W  T I T L E
title=(
  script="$PLUGIN_DIR/window_title.sh"
  padding_left=4
  label.padding_right=65
  label.padding_left=65
  label.font="CaskaydiaCove Nerd Font:Regular:14.0"
  #label.highlight=on
  padding_right=4
  #background.corner_radius=16
  #background.color=$COLOR_WHITE_BRIGHT
  label.max_chars=35
  updates=on
  update_freq=1
  --subscribe title window_focus front_app_switched space_change title_change
)

sketchybar -m --add item title center \
  --set title "${title[@]}"
