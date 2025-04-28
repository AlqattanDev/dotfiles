#!/bin/bash

# Neovim-inspired lockscreen
# This mimics Neovim's buffer saving/locking

# Notify locking
notify-send "Locking screen" "Saving session..." -t 1000 -u low

# Switch to a Neovim-inspired mode before locking
~/.config/hypr/neovim-mode.sh COMMAND

# Small delay
sleep 0.5

# Lock screen
swaylock

# Return to normal mode after unlocking
~/.config/hypr/neovim-mode.sh NORMAL
