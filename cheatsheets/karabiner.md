# ⌨️ Karabiner-Elements Cheatsheet

Karabiner-Elements is a powerful keyboard customizer for macOS.

## 🔧 Current Configuration
Your Karabiner is currently set to a **clean state** with no custom modifications to avoid conflicts with Aerospace.

## 📁 Configuration Location
- **Main Config**: `~/.config/karabiner/karabiner.json`
- **Assets**: `~/.config/karabiner/assets/`
- **Backups**: `~/.config/karabiner/automatic_backups/`

## 🎯 Current Profile
**Profile Name**: Default
**Status**: Clean configuration with no custom rules

## 🔧 Common Modifications (Not Currently Active)
Here are popular Karabiner modifications you could add:

### Caps Lock Modifications
```json
{
  "description": "Change caps_lock to control if pressed with other keys, to escape if pressed alone.",
  "manipulators": [
    {
      "from": {
        "key_code": "caps_lock",
        "modifiers": { "optional": ["any"] }
      },
      "to": [{ "key_code": "left_control" }],
      "to_if_alone": [{ "key_code": "escape" }],
      "type": "basic"
    }
  ]
}
```

### Vim Navigation
```json
{
  "description": "Vim Navigation Mode (Hold Caps Lock + hjkl)",
  "manipulators": [
    {
      "from": {
        "key_code": "h",
        "modifiers": { "mandatory": ["caps_lock"] }
      },
      "to": [{ "key_code": "left_arrow" }],
      "type": "basic"
    }
    // ... similar for j, k, l
  ]
}
```

## 🚀 Managing Karabiner
| Command | Action |
|---------|--------|
| `open -a "Karabiner-Elements"` | Open Karabiner GUI |
| `launchctl kickstart -k gui/$(id -u)/org.pqrs.karabiner.karabiner_console_user_server` | Restart Karabiner |

## 🔧 Configuration Management
```bash
# View current configuration
cat ~/.config/karabiner/karabiner.json

# Backup current configuration
cp ~/.config/karabiner/karabiner.json ~/.config/karabiner/karabiner.json.backup

# Restore from backup
cp ~/.config/karabiner/karabiner.json.backup ~/.config/karabiner/karabiner.json
```

## 📋 JSON Structure
```json
{
  "profiles": [
    {
      "complex_modifications": {
        "rules": [
          // Your custom rules go here
        ]
      },
      "name": "Default",
      "selected": true,
      "virtual_hid_keyboard": {
        "country_code": 0,
        "keyboard_type_v2": "ansi"
      }
    }
  ]
}
```

## 🎯 Why Clean Configuration?
Your Karabiner is intentionally kept clean because:
- **Aerospace Compatibility**: Prevents conflicts with Alt+hjkl navigation
- **System Stability**: Reduces potential keyboard issues
- **Performance**: Minimal overhead
- **Debugging**: Easier to troubleshoot issues

## 🔧 Adding Custom Rules
If you want to add custom keyboard modifications:

1. **Open Karabiner-Elements app**
2. **Go to Complex Modifications tab**
3. **Click "Add rule"**
4. **Import from internet or create custom**

### Popular Rule Sources
- [Karabiner-Elements complex modifications](https://ke-complex-modifications.pqrs.org/)
- Community-contributed rules
- Custom JSON configurations

## ⚠️ Important Notes
- **Backup before changes**: Always backup your configuration
- **Test carefully**: New rules can interfere with system shortcuts
- **Aerospace conflicts**: Be careful with Alt key modifications
- **System shortcuts**: Check for conflicts with macOS shortcuts

## 🔄 Restoring Clean State
If you need to restore the clean configuration:
```bash
cd ~/dotfiles
cp karabiner/karabiner.json ~/.config/karabiner/karabiner.json
```

## 🎨 GUI Features
The Karabiner-Elements app provides:
- **Simple Modifications**: Basic key remapping
- **Complex Modifications**: Advanced rules
- **Function Keys**: F1-F12 behavior
- **Devices**: Per-device settings
- **Profiles**: Multiple configuration profiles
- **Log**: Event viewer for debugging

## 💡 Pro Tips
- Start with simple modifications before complex ones
- Use the event viewer to debug key issues
- Test new rules in a separate profile first
- Keep a backup of working configurations
- Check for conflicts with other apps

## 🔧 Troubleshooting
| Issue | Solution |
|-------|----------|
| **Keys not working** | Check if Karabiner has Input Monitoring permission |
| **Conflicts with apps** | Disable rules temporarily to isolate |
| **Configuration not loading** | Restart Karabiner service |
| **JSON syntax errors** | Validate JSON format |

## 🛡️ Permissions Required
Karabiner needs these macOS permissions:
- **Input Monitoring**: To capture keystrokes
- **Accessibility**: For some advanced features

Grant permissions in:
**System Preferences → Security & Privacy → Privacy**

## 🔄 Current Status
```
✅ Karabiner-Elements installed and running
✅ Clean configuration (no custom rules)
✅ No conflicts with Aerospace
✅ Ready for custom modifications if needed
```

## 📚 Learning Resources
- [Official Documentation](https://karabiner-elements.pqrs.org/docs/)
- [Complex Modifications Gallery](https://ke-complex-modifications.pqrs.org/)
- [JSON Configuration Reference](https://karabiner-elements.pqrs.org/docs/json/)

Your Karabiner is currently optimized for compatibility with your Aerospace window manager setup!
