#!/bin/bash

# Icon mapping for applications

case $1 in
"Finder")
    echo "󰀶"
    ;;
"Safari" | "Google Chrome" | "Chromium" | "Arc" | "Firefox" | "Dia")
    echo "󰖟"
    ;;
"Terminal" | "iTerm2" | "Alacritty" | "Kitty")
    echo "󰆍"
    ;;
"Code" | "Visual Studio Code" | "VSCode")
    echo "󰨞"
    ;;
"Xcode")
    echo "󰛢"
    ;;
"Slack")
    echo "󰒱"
    ;;
"Discord")
    echo "󰙯"
    ;;
"Spotify")
    echo "󰓇"
    ;;
"Mail")
    echo "󰇮"
    ;;
"Calendar")
    echo "󰃭"
    ;;
"Notes")
    echo "󰠮"
    ;;
"System Preferences" | "System Settings")
    echo "󰒓"
    ;;
*)
    echo "󰘔"
    ;;
esac
