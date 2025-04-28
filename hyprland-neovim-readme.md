# Hyprland Neovim-Inspired Setup

This is a comprehensive Neovim-inspired configuration for Hyprland on Fedora, specifically tailored for a Lenovo Yoga 7i Pro with Intel graphics. The setup is designed to mimic Neovim's modes, keybindings, and aesthetics for a familiar and efficient workflow.

## Getting Started

To start using your new Hyprland setup:

1. Log out of your current desktop environment
2. At the login screen, select "Hyprland (Neovim-themed)" from the desktop session options
3. Log in with your credentials

## Neovim-Inspired Modes

The configuration implements Neovim-like modes with distinct visual indicators:

### Mode Switching
- **Super + i**: Enter INSERT mode
- **Super + v**: Enter VISUAL mode
- **Super + colon**: Enter COMMAND mode
- **Escape**: Return to NORMAL mode

Each mode changes the active border colors, shadows, and cursor behavior to provide visual feedback similar to Neovim.

## Key Bindings

### Window Navigation (Neovim's hjkl)
- **Super + h**: Focus left window
- **Super + j**: Focus down window
- **Super + k**: Focus up window
- **Super + l**: Focus right window

### Window Movement (Neovim's Shift + hjkl)
- **Super + Shift + h**: Move window left
- **Super + Shift + j**: Move window down
- **Super + Shift + k**: Move window up
- **Super + Shift + l**: Move window right

### Window Resizing (like Neovim with Alt)
- **Super + Alt + h**: Resize window smaller horizontally
- **Super + Alt + j**: Resize window larger vertically
- **Super + Alt + k**: Resize window smaller vertically
- **Super + Alt + l**: Resize window larger horizontally
- **Super + r**: Enter resize mode (then use hjkl to resize, Escape to exit)

### Neovim-Like Operations
- **Super + Return**: Open terminal (ghostty)
- **Super + q**: Close active window (like :q)
- **Super + Space**: Launch application menu (like Space leader)
- **Super + Shift + v**: Toggle floating mode (like Shift+v in Neovim)
- **Super + f**: Toggle fullscreen (like f for find)
- **Super + e**: Open file manager (like :e)
- **Super + slash**: Run command (like / for search)
- **Super + w**: Lock screen (like :w to save)
- **Super + Shift + x**: Kill focused client (like :x)
- **Super + Shift + e**: Exit Hyprland (like :wq!)

### Screenshot (like Neovim's yank)
- **Super + y**: Take area screenshot
- **Print**: Take area screenshot
- **Shift + Print**: Take window screenshot
- **Ctrl + Print**: Take full screen screenshot

### Workspaces (like Neovim buffers)
- **Super + [1-9]**: Switch to workspace 1-9
- **Super + Shift + [1-9]**: Move active window to workspace 1-9

## Configuration Files

### Main Configuration Files
- **Hyprland**: `~/.config/hypr/hyprland.conf` - Main window manager configuration
- **Waybar**: `~/.config/waybar/config` and `~/.config/waybar/style.css` - Status bar like Neovim's status line
- **Ghostty**: `~/.config/ghostty/config` - Terminal with Neovim-inspired aesthetics
- **Wofi**: `~/.config/wofi/style.css` - App launcher styled like Neovim's command palette
- **Mako**: `~/.config/mako/config` - Notifications styled like Neovim messages
- **Swaylock**: `~/.config/swaylock/config` - Lock screen with Neovim-inspired visuals

### Scripts
- **~/.config/hypr/start-hyprland.sh**: Main startup script
- **~/.config/hypr/autostart.sh**: Manages startup applications
- **~/.config/hypr/neovim-mode.sh**: Handles Neovim-like modes
- **~/.config/hypr/generate-wallpaper.sh**: Creates a Neovim-inspired wallpaper
- **~/.config/hypr/screenshot.sh**: Screenshot tool mimicking Neovim's yank
- **~/.config/hypr/lock.sh**: Lock screen script mimicking Neovim's save

## Neovim Visual Elements

### Tokyo Night Color Scheme
The configuration uses a Neovim-inspired Tokyo Night color scheme:
- **Background**: #1a1b26 (dark background)
- **Secondary background**: #24283b (lighter background)
- **Foreground**: #c0caf5 (text color)
- **Accent blue**: #7aa2f7 (primary accent)
- **Green**: #9ece6a (success/normal mode)
- **Red**: #f7768e (errors/warnings)
- **Purple**: #bb9af7 (visual mode)
- **Yellow**: #e0af68 (command mode)
- **Cyan**: #7dcfff (highlights)

### Visual Indicators
- **Window borders**: Change color based on active mode
- **Waybar mode indicator**: Shows current mode (NORMAL, INSERT, VISUAL, COMMAND)
- **Animations**: Smooth transitions inspired by Neovim plugins
- **Wofi launcher**: Styled like Neovim's command palette
- **Notifications**: Styled like Neovim's message area

### Terminal Integration
- Ghostty is configured with Neovim-inspired settings
- JetBrains Mono Nerd Font for consistent typography
- Cursor styles change based on the current mode

## Customization

Feel free to adjust any of the configuration files to better suit your preferences! All configuration files are extensively commented to make customization easier.

### Tips for Further Customization
- Edit colors in each component's configuration file
- Adjust animations and transitions in hyprland.conf
- Add more keybindings to match your Neovim workflow
- Install additional components like dunst, rofi, or eww for more advanced UI options
