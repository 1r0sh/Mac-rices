#!/bin/sh

source "$HOME/.config/colors.sh"
source "$HOME/.config/icons.sh"

#HOST_NAME=$(ipconfig getsummary en0 | awk -F ' SSID : ' '/ SSID : / {print $2}')
IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')

if [[ $IS_VPN != "" ]]; then
	COLOR=$COLOR_BLUE
	ICON=$ICON_VPN
	LABEL="VPN"
elif [[ $IP_ADDRESS != "" ]]; then
	COLOR=$COLOR_BLUE
	ICON=$ICON_WIFI
	LABEL=$IP_ADDRESS
else
	COLOR=$COLOR_RED
	ICON=$ICON_WIFI_OFF
	LABEL="Not Connected"
fi

sketchybar --set $NAME \
	label="$IP_ADDRESS"
