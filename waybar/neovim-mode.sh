#!/bin/bash

# Script to show current Neovim-like mode in Waybar

MODES_FILE=~/.cache/hypr_mode

# Default to NORMAL mode if file doesn't exist
if [ ! -f "$MODES_FILE" ]; then
    echo "NORMAL" > "$MODES_FILE"
fi

CURRENT_MODE=$(cat "$MODES_FILE")

# Return formatted JSON for Waybar
case "$CURRENT_MODE" in
    "NORMAL")
        echo "{\"class\": \"mode-normal\", \"text\": \"NORMAL\"}"
        ;;
    "INSERT")
        echo "{\"class\": \"mode-insert\", \"text\": \"INSERT\"}"
        ;;
    "VISUAL")
        echo "{\"class\": \"mode-visual\", \"text\": \"VISUAL\"}"
        ;;
    "COMMAND")
        echo "{\"class\": \"mode-command\", \"text\": \"COMMAND\"}"
        ;;
    *)
        echo "{\"class\": \"mode-normal\", \"text\": \"NORMAL\"}"
        ;;
esac
