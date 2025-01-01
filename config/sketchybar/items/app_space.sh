sketchybar --add event window_change

COLORS_SPACE=($COLOR_YELLOW_BRIGHT $COLOR_CYAN_BRIGHT $COLOR_MAGENTA_BRIGHT $COLOR_RED_BRIGHT $COLOR_BLUE_BRIGHT $COLOR_RED_BRIGHT $COLOR_WHITE_BRIGHT)
LENGTH=${#ICONS_SPACE[@]}

for i in "${!ICONS_SPACE[@]}"; do
  sid=$(($i + 1))
  PAD_LEFT=0
  PAD_RIGHT=0
  if [[ $i == 0 ]]; then
    PAD_LEFT=0
  elif [[ $i == $(($LENGTH - 1)) ]]; then
    PAD_RIGHT=0
  fi
  sketchybar --add space space.$sid left \
    --set space.$sid script="$PLUGIN_DIR/app_space.sh" \
    associated_space=$sid \
    padding_left=$PAD_LEFT \
    padding_right=$PAD_RIGHT \
    background.color=${COLORS_SPACE[i]} \
    background.border_width=0 \
    background.corner_radius=20 \
    background.height=24 \
    icon=${ICONS_SPACE[i]} \
    icon.color=${COLORS_SPACE[i]} \
    label.color=${COLORS_SPACE[i]} \
    --subscribe space.$sid front_app_switched window_change window_focus space_change title_change
done

# sketchybar --add item seperator.l2 left \
#   --set seperator.l2 padding_left=0 \
#   padding_right=0 \
#   background.drawing=off \
#   label.drawing=off
