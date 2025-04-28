#!/bin/bash

# Neovim-inspired Hyprland startup script

# Display a startup message
echo "Starting Neovim-inspired Hyprland environment..."

# Set necessary environment variables
export _JAVA_AWT_WM_NONREPARENTING=1
export XCURSOR_SIZE=24
export LIBVA_DRIVER_NAME=iHD  # For Intel graphics
export WLR_DRM_NO_ATOMIC=1    # Might help with Intel GPU
export MOZ_ENABLE_WAYLAND=1   # For Firefox
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_DESKTOP=Hyprland

# Kill any existing instances of relevant processes
killall -9 waybar mako wl-paste >/dev/null 2>&1

# Set up a simple log
mkdir -p ~/.local/logs
LOG=~/.local/logs/hyprland-$(date +%Y-%m-%d-%H-%M-%S).log

# Wait for files to be released
sleep 0.5

# Save previous session information
if [ -f ~/.cache/hyprland-session ]; then
    mv ~/.cache/hyprland-session ~/.cache/hyprland-session.old
fi

# Start Hyprland with logging
echo "Starting Hyprland at $(date)" > $LOG
echo "-----------------------------------" >> $LOG
exec Hyprland > >(tee -a $LOG) 2> >(tee -a $LOG >&2)