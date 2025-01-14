source "$HOME/.config/icons.sh"
source "$HOME/.config/colors.sh"

sketchybar --set $NAME \
  icon=$ICON_BACKLIGHTFULL \
  click_script="osascript -e 'tell application \"System Events\" to tell process \"Control Center\" to perform action \"AXPress\" of menu bar item 5 of menu bar 1'"
