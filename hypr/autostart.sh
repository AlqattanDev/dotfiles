#!/bin/bash

# Neovim-inspired autostart for Hyprland

# Function to start program if not running
start_if_not_running() {
    if ! pgrep -f "$1" > /dev/null; then
        echo "Starting $1..."
        "$@" &
    else
        echo "$1 is already running."
    fi
}

# Kill existing processes to ensure clean startup
killall -q waybar mako

# Wait for processes to die
sleep 0.5

# Start waybar (status line like Neovim)
start_if_not_running waybar

# Start notification daemon (like Neovim messages)
start_if_not_running mako

# Start clipboard manager (like Neovim registers)
start_if_not_running wl-paste --type text --watch cliphist store

# Generate and set wallpaper (like Neovim theme)
~/.config/hypr/generate-wallpaper.sh &

# Start policy kit agent
if command -v /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 >/dev/null 2>&1; then
    start_if_not_running /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
fi

# Start network manager applet if available
if command -v nm-applet >/dev/null 2>&1; then
    start_if_not_running nm-applet --indicator
fi

# Add idle management
if command -v swayidle >/dev/null 2>&1; then
    start_if_not_running swayidle -w \
        timeout 300 'swaylock -f -c 1a1b26' \
        timeout 600 'hyprctl dispatch dpms off' \
        resume 'hyprctl dispatch dpms on' \
        before-sleep 'swaylock -f -c 1a1b26'
fi

# Print message like Neovim welcome
echo "Hyprland Neovim-inspired environment initialized successfully."
