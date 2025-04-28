#!/bin/bash

# Generate a Neovim-inspired wallpaper
# This script creates a simple gradient background similar to Neovim's default colorscheme

OUTPUT_FILE=~/.config/hypr/wallpaper.png
RESOLUTION=$(hyprctl monitors -j | jq -r '.[0].width, "x", .[0].height' | tr -d '\n')

if [ -z "$RESOLUTION" ]; then
    # Default resolution if hyprctl fails
    RESOLUTION="1920x1080"
fi

echo "Creating Neovim-inspired wallpaper at $RESOLUTION..."

# Use ImageMagick if available
if command -v convert >/dev/null 2>&1; then
    convert -size $RESOLUTION gradient:"#1a1b26-#24283b" -gravity center "$OUTPUT_FILE"
    echo "Wallpaper created at $OUTPUT_FILE"
else
    echo "ImageMagick not found. Installing..."
    sudo dnf install -y ImageMagick
    convert -size $RESOLUTION gradient:"#1a1b26-#24283b" -gravity center "$OUTPUT_FILE"
    echo "Wallpaper created at $OUTPUT_FILE"
fi

# Set the wallpaper
if command -v swaybg >/dev/null 2>&1; then
    killall swaybg 2>/dev/null
    swaybg -i "$OUTPUT_FILE" -m fill &
    echo "Wallpaper applied"
else
    echo "swaybg not found, wallpaper not applied"
fi
