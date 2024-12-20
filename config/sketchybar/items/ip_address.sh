source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

sketchybar --add item ip_address right \
	--set ip_address script="$PLUGIN_DIR/ip_address.sh" \
	update_freq=5 \
	padding_left=2 \
	padding_right=0 \
	background.border_width=0 \
	background.corner_radius=18 \
	background.height=24
