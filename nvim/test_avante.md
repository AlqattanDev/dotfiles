# Avante.nvim with Copilot Test

This is a test file to verify that avante.nvim is working with the Copilot provider.

## Key Features Configured:

1. **Provider**: Copilot (GitHub Copilot)
2. **Model**: gpt-4o-2024-08-06
3. **MCP Integration**: Custom slash commands for AWS tools
4. **Custom Keybindings**: Available in mappings.lua

## Available Slash Commands:

- `/cost` - AWS Cost Analysis using MCP
- `/security` - AWS Security Check using MCP  
- `/arch` - AWS Architecture Review using MCP
- `/mcp` - List available MCP tools

## Keybindings:

- `<leader>aa` - Avante Ask
- `<leader>ar` - Avante Refresh
- `<leader>ae` - Avante Edit
- `<leader>at` - Avante Toggle
- `<leader>ac` - Avante Clear

## Next Steps:

1. Open Neovim
2. Run `:Copilot setup` if not already authenticated
3. Test avante.nvim with `<leader>aa`
4. Try the custom slash commands

## Test Code Block:

```javascript
function testAvante() {
  console.log("Testing avante.nvim with Copilot provider");
  return "Configuration successful!";
}
```
