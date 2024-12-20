#!/bin/sh

source "$HOME/.config/icons.sh"

case "$1" in
"Terminal" | "Warp" | "iTerm2")
  RESULT=$ICON_TERM
	if grep -q "btop" <<< $2;
  then
	 RESULT=$ICON_CHART
	fi
	if grep -q "brew" <<< $2;
  then
	 RESULT=$ICON_PACKAGE
	fi
	if grep -q "nvim" <<< $2;
  then
	 RESULT=$ICON_DEV
	fi
	if grep -q "ranger" <<< $2;
  then
	 RESULT=$ICON_FILE
	fi
	if grep -q "lazygit" <<< $2;
  then
	 RESULT=$ICON_GIT
	fi
	if grep -q "taskwarrior-tui" <<< $2;
  then
	 RESULT=$ICON_LIST
	fi
	if grep -q "unimatrix\|pipes.sh" <<< $2;
  then
	 RESULT=$ICON_SCREENSAVOR
	fi
	if grep -q "bat" <<< $2;
  then
	 RESULT=$ICON_NOTE
	fi
	if grep -q "tty-clock" <<< $2;
  then
	 RESULT=$ICON_CLOCK
	fi
	;;
"Finder")
	RESULT=$ICON_FILE
	;;
"Weather")
	RESULT=$ICON_WEATHER
	;;
"Clock")
	RESULT=$ICON_CLOCK
	;;
"Mail" | "Microsoft Outlook")
  
	RESULT=$ICON_MAIL
	;;
"Calendar")
	RESULT=$ICON_CALENDAR
	;;
"Calculator" | "Numi")
	RESULT=$ICON_CALC
	;;
"Maps" | "Find My")
	RESULT=$ICON_MAP
	;;
"Voice Memos")
	RESULT=$ICON_MICROPHONE
	;;
"Messages" | "Slack" | "Microsoft Teams" | "Discord" | "Telegram")
	RESULT=$ICON_TELEGRAM
	;;
"FaceTime" | "zoom.us" | "Webex")
	RESULT=$ICON_VIDEOCHAT
	;;
"Notes" | "TextEdit" | "Stickies" | "Microsoft Word")
	RESULT=$ICON_NOTE
	;;
"Reminders" | "Microsoft OneNote")
	RESULT=$ICON_LIST
	;;
"Photo Booth")
	RESULT=$ICON_CAMERA
	;;
"Safari")
	RESULT=$ICON_SAFARI
	;;
"System Settings" | "System Information" | "TinkerTool")
	RESULT=$ICON_COG
	;;
"HOME")
	RESULT=$ICON_HOMEAUTOMATION
	;;
"Music" | "Spotify" | "Elmedia Player")
	RESULT=$ICON_MUSIC
	;;
"LocalSend")
	RESULT=$ICON_PODCAST
	;;
"TV" | "QuickTime Player")
	RESULT=$ICON_PLAY
	;;
"SF Symbols")
	RESULT=$ICON_ICON
	;;
"Xcode" | "Code" | "Neovide" | "IntelliJ IDEA")
	RESULT=$ICON_DEV
	;;
"Font Book" | "Dictionary")
	RESULT=$ICON_BOOKINFO
	;;
"Activity Monitor")
	RESULT=$ICON_CHART
	;;
"Disk Utility")
	RESULT=$ICON_DISK
	;;
"Screenshot" | "Preview")
	RESULT=$ICON_PREVIEW
	;;
"Passwords")
	RESULT=$ICON_PASSKEY
	;;
"oblivion-desktop" | "Geph" | "Clash for Windows")
	RESULT=$ICON_VPN
	;;
"Progressive Downloaded" | "Transmission")
	RESULT=$ICON_DOWNLOAD
	;;
"VLC")
	RESULT=$ICON_VLC
	;;
"Photos")
	RESULT=$ICON_PHOTOS
	;;
"Adobe Photoshop 2025")
	RESULT=$ICON_PHOTOSHOP
	;;
"Folx" | "Free Download Manager")
	RESULT=$ICON_DOWNLOAD
	;;
"Firefox")
	RESULT=$ICON_FIREFOX
	;;
"Microsoft Remote Desktop" | "VMware Fusion" | "UTM")
	RESULT=$ICON_REMOTEDESKTOP
	;;
"Zen Browser")
  RESULT=$ICON_WEB
  ;;
*)
	RESULT=$ICON_APP
	;;
esac

echo $RESULT
