#!/bin/bash

# Neovim-inspired screenshot tool
# Mimics Neovim's yank functionality for visual selections

SCREENSHOTS_DIR="$HOME/Pictures/Screenshots"
mkdir -p "$SCREENSHOTS_DIR"

TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
FILENAME="$SCREENSHOTS_DIR/screenshot-$TIMESTAMP.png"

# Notification function
notify() {
    notify-send -i "$FILENAME" "$1" "$2" -t 3000
}

# Screenshot functions
screenshot_area() {
    # Switch to visual mode first
    ~/.config/hypr/neovim-mode.sh VISUAL
    
    # Take screenshot
    grim -g "$(slurp)" "$FILENAME"
    
    # Copy to clipboard
    wl-copy < "$FILENAME"
    
    # Switch back to normal mode
    ~/.config/hypr/neovim-mode.sh NORMAL
    
    # Notify
    notify "Area screenshot yanked" "Saved to $FILENAME and clipboard"
}

screenshot_window() {
    # Get active window
    WINDOW=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
    
    # Take screenshot of window
    grim -g "$WINDOW" "$FILENAME"
    
    # Copy to clipboard
    wl-copy < "$FILENAME"
    
    # Notify
    notify "Window screenshot yanked" "Saved to $FILENAME and clipboard"
}

screenshot_screen() {
    # Take screenshot of entire screen
    grim "$FILENAME"
    
    # Copy to clipboard
    wl-copy < "$FILENAME"
    
    # Notify
    notify "Screen screenshot yanked" "Saved to $FILENAME and clipboard"
}

# Parse arguments
case "$1" in
    "area")
        screenshot_area
        ;;
    "window")
        screenshot_window
        ;;
    "screen")
        screenshot_screen
        ;;
    *)
        screenshot_area
        ;;
esac
