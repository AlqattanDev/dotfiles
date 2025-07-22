# AGENTS.md - Neovim Configuration

## Build/Test Commands
- **Run Neovim**: `nix run` (uses flake.nix configuration)
- **Test config**: `nvim --clean -u init.lua` (test without existing config)
- **Check health**: `:checkhealth` (within Neovim)
- **LSP info**: `:LspInfo` (custom command)
- **LSP logs**: `:LspLog` (custom command)

## Code Style Guidelines
- **Language**: Lua for all configuration files
- **Indentation**: 2 spaces (no tabs)
- **Quotes**: Double quotes for strings
- **Comments**: Use `--` for single line, descriptive comments
- **Naming**: snake_case for variables/functions, PascalCase for modules
- **Imports**: Use `require()` at top of files, group by type (core, plugins, local)
- **Tables**: Trailing commas for multi-line tables
- **LSP**: Configure via `vim.lsp.config.*` pattern
- **Plugins**: Use lazy.nvim spec format in `lua/plugins/`
- **Globals**: Declare vim globals in `.luarc.json`

## Project Structure
- `init.lua` - Entry point, loads opts and lazy
- `lua/` - All Lua modules
- `lua/plugins/` - Plugin configurations
- `flake.nix` - Nix development environment with LSPs