#!/bin/bash

# Load global styles, colors and icons
source "$HOME/.config/colors.sh"

POPUP_OFF='sketchybar --set logo popup.drawing=off'

mu=(
	"${menu_defaults[@]}"
	icon=􀣺
	icon.font="CaskaydiaCove Nerd Font:Regular:16.0"
	icon.color=$COLOR_WHITE
	label.drawing=off
	popup.align=left
	popup.y_offset=3
	popup.background.color=$COLOR_BLACK
	click_script="sketchybar --set logo popup.drawing=toggle"
	--subscribe logo mouse.exited
	mouse.exited.global
)

sketchybar \
	--add item mu cenetr \
	--set mu "${mu[@]}"
