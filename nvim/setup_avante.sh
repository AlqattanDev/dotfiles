#!/bin/bash

echo "🚀 Setting up Avante.nvim with Copilot..."

# Check if Neovim is installed
if ! command -v nvim &> /dev/null; then
    echo "❌ Neovim is not installed. Please install Neovim first."
    exit 1
fi

# Check if Node.js is installed (required for Copilot)
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js first."
    exit 1
fi

# Check if make is available (required for avante.nvim build)
if ! command -v make &> /dev/null; then
    echo "❌ make is not installed. Please install build tools first."
    exit 1
fi

echo "✅ Prerequisites check passed"

# Start Neovim to trigger plugin installation
echo "📦 Installing plugins..."
nvim --headless -c "Lazy sync" -c "qa"

echo "🔧 Configuration complete!"
echo ""
echo "Next steps:"
echo "1. Open Neovim: nvim"
echo "2. Authenticate with Copilot: :Copilot setup"
echo "3. Test avante.nvim: <leader>aa (Space + aa)"
echo "4. Try slash commands like /cost, /security, /arch"
echo ""
echo "📖 Open test_avante.md for more information"
