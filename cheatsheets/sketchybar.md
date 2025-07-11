# 📊 Sketchybar Cheatsheet

Sketchybar is a highly customizable status bar for macOS.

## 🚀 Quick Start
| Command | Action |
|---------|--------|
| `brew services start sketchybar` | Start Sketchybar |
| `brew services stop sketchybar` | Stop Sketchybar |
| `sketchybar --reload` | Reload configuration |

## 📁 Configuration Structure
```
~/.config/sketchybar/
├── sketchybarrc           # Main configuration file
└── plugins/               # Plugin scripts
    ├── aerospace.sh       # Aerospace workspace indicator
    ├── battery.sh         # Battery status
    ├── clock.sh          # Date and time
    ├── cpu.sh            # CPU usage
    ├── front_app.sh      # Current application
    ├── icon_map.sh       # Application icons
    ├── memory.sh         # Memory usage
    └── volume.sh         # Volume control
```

## 🎨 Current Bar Layout
Your Sketchybar displays (left to right):
1. **Aerospace Workspaces** - Current workspace indicator
2. **Front App** - Currently focused application
3. **CPU Usage** - System CPU percentage
4. **Memory Usage** - RAM usage
5. **Battery** - Battery percentage and status
6. **Volume** - Audio volume level
7. **Clock** - Date and time

## 🔧 Configuration Commands
| Command | Action |
|---------|--------|
| `sketchybar --reload` | Reload configuration |
| `sketchybar --update` | Update all items |
| `sketchybar --query` | Query current configuration |
| `sketchybar --remove` | Remove items |
| `sketchybar --add` | Add new items |

## 🎯 Plugin System
Each plugin is a shell script that outputs formatted data:

### Plugin Structure
```bash
#!/bin/bash
# Plugin script template

# Get data (CPU, memory, etc.)
DATA=$(get_system_info)

# Format and output
sketchybar --set $NAME label="$DATA"
```

### Plugin Triggers
- **Periodic**: Updates every N seconds
- **Event-based**: Triggered by system events
- **Manual**: Called by user actions

## 🔧 Customization Examples

### Adding a New Item
```bash
sketchybar --add item my_item right \
           --set my_item label="Hello" \
                        icon="🚀" \
                        update_freq=5 \
                        script="~/.config/sketchybar/plugins/my_plugin.sh"
```

### Styling Items
```bash
sketchybar --set item_name \
           background.color=0xff1e1e2e \
           background.corner_radius=5 \
           background.height=24 \
           label.color=0xffcdd6f4 \
           icon.color=0xfff38ba8
```

## 🎨 Color Scheme
Your configuration uses a modern color palette:
- **Background**: Dark theme
- **Text**: Light colors for readability
- **Accents**: Colorful highlights for different data types
- **Icons**: Emoji and symbols for visual appeal

## 📊 Current Plugins

### 🚀 Aerospace Plugin
- Shows current workspace number
- Updates when switching workspaces
- Integrates with Aerospace window manager

### 🖥️ Front App Plugin
- Displays currently focused application
- Shows app icon and name
- Updates when switching applications

### ⚡ CPU Plugin
- Shows CPU usage percentage
- Color changes based on load
- Updates every 2 seconds

### 🧠 Memory Plugin
- Displays RAM usage
- Shows used/total memory
- Updates every 5 seconds

### 🔋 Battery Plugin
- Battery percentage
- Charging status indicator
- Power adapter connection status

### 🔊 Volume Plugin
- Current volume level
- Mute status indicator
- Click to toggle mute

### 🕐 Clock Plugin
- Current date and time
- Customizable format
- Updates every second

## 🔧 Configuration File Breakdown

### Main Configuration (`sketchybarrc`)
```bash
#!/bin/bash

# Global settings
sketchybar --bar height=32 \
                 blur_radius=30 \
                 position=top \
                 sticky=off \
                 padding_left=10 \
                 padding_right=10

# Add items
sketchybar --add item aerospace left
sketchybar --add item front_app left
sketchybar --add item cpu right
sketchybar --add item memory right
sketchybar --add item battery right
sketchybar --add item volume right
sketchybar --add item clock right

# Configure items
source ~/.config/sketchybar/plugins/aerospace.sh
source ~/.config/sketchybar/plugins/front_app.sh
# ... etc
```

## 🎯 Advanced Features

### Event System
```bash
# Listen for events
sketchybar --add event my_event

# Trigger events
sketchybar --trigger my_event
```

### Aliases
```bash
# Create aliases for complex items
sketchybar --add alias "Control Center,WiFi" right
```

### Spaces Integration
```bash
# Add space indicators
for i in {1..9}; do
  sketchybar --add space space.$i left \
             --set space.$i associated_space=$i
done
```

## 🔧 Troubleshooting
| Issue | Solution |
|-------|----------|
| **Bar not showing** | Check if Sketchybar is running |
| **Plugins not updating** | Verify script permissions |
| **Wrong colors** | Check color format (0xAARRGGBB) |
| **Items overlapping** | Adjust padding and spacing |

## 💡 Pro Tips
- Use `--reload` after configuration changes
- Test plugins individually before adding to bar
- Use consistent color schemes for visual harmony
- Keep plugin scripts lightweight for performance
- Use events for efficient updates

## 🎨 Customization Ideas
- **Weather widget** - Show current weather
- **Network usage** - Upload/download speeds
- **Calendar events** - Upcoming appointments
- **System temperature** - CPU/GPU temps
- **Spotify integration** - Currently playing track
- **Git status** - Repository information

## 🔄 Updating Configuration
1. Edit files in `~/.config/sketchybar/`
2. Run `sketchybar --reload`
3. Changes apply immediately
4. No restart required

## 📚 Resources
- [Official Documentation](https://felixkratz.github.io/SketchyBar/)
- [Configuration Examples](https://github.com/FelixKratz/SketchyBar/tree/master/examples)
- [Community Configs](https://github.com/topics/sketchybar)

Your Sketchybar is configured for optimal integration with your Aerospace and overall system setup!
