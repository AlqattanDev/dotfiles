#!/bin/bash

# Neovim modes for Hyprland
# This script simulates Neovim modes by updating the waybar mode indicator
# and changing the cursor shape/color

MODES_FILE=~/.cache/hypr_mode
MODE=${1:-"toggle"}

# Default to NORMAL mode if file doesn't exist
if [ ! -f "$MODES_FILE" ]; then
    echo "NORMAL" > "$MODES_FILE"
fi

CURRENT_MODE=$(cat "$MODES_FILE")

# Function to set mode
set_mode() {
    echo "$1" > "$MODES_FILE"
    case "$1" in
        "NORMAL")
            # Green cursor, block shape
            hyprctl keyword decoration:col.shadow "rgba(1a1b26ee)"
            hyprctl keyword general:col.active_border "rgba(7aa2f7ee) rgba(bb9af7ee) 45deg"
            # Update waybar mode display
            pkill -RTMIN+1 waybar
            ;;
        "INSERT")
            # Blue cursor, beam shape
            hyprctl keyword decoration:col.shadow "rgba(24283bee)"
            hyprctl keyword general:col.active_border "rgba(7aa2f7ee) rgba(7aa2f7ee) 45deg"
            # Update waybar mode display
            pkill -RTMIN+1 waybar
            ;;
        "VISUAL")
            # Purple cursor, underline shape
            hyprctl keyword decoration:col.shadow "rgba(2e3c64ee)"
            hyprctl keyword general:col.active_border "rgba(bb9af7ee) rgba(f7768eee) 45deg"
            # Update waybar mode display
            pkill -RTMIN+1 waybar
            ;;
        "COMMAND")
            # Yellow cursor, block shape
            hyprctl keyword decoration:col.shadow "rgba(2e3c64ee)"
            hyprctl keyword general:col.active_border "rgba(e0af68ee) rgba(e0af68ee) 45deg"
            # Update waybar mode display
            pkill -RTMIN+1 waybar
            ;;
    esac
    
    # Notify about mode change
    notify-send "Mode: $1" -t 1000 -h string:x-canonical-private-synchronous:neovim-mode
}

# Handle mode switching
if [ "$MODE" = "toggle" ]; then
    # Toggle between modes
    case "$CURRENT_MODE" in
        "NORMAL") set_mode "INSERT" ;;
        "INSERT") set_mode "NORMAL" ;;
        "VISUAL") set_mode "NORMAL" ;;
        "COMMAND") set_mode "NORMAL" ;;
        *) set_mode "NORMAL" ;;
    esac
else
    # Set specific mode
    set_mode "$MODE"
fi
