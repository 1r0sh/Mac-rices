# E V E N T S
sketchybar -m --add event window_focus \
  --add event title_change

# W I N D O W  T I T L E
title=(
  script="$PLUGIN_DIR/window_title.sh"
  padding_left=4
  label.padding_right=65
  label.padding_left=65
  label.font="JetBrainsMonoNL Nerd Font:Bold:16.0"
  padding_right=4
  label.color=$WHITE_BRIGHT
  label.max_chars=35
  updates=on
  click_script="open -a Finder"
  update_freq=1
  --subscribe title window_focus front_app_switched space_change title_change
)

sketchybar -m --add item title center \
  --set title "${title[@]}"
