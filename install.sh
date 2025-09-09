#!/bin/bash

# Minimal dotfiles installer
echo "🚀 Installing dotfiles..."

# Create directories
mkdir -p ~/.config/wezterm
mkdir -p ~/.config/starship

# Install dependencies
echo "📦 Installing dependencies..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 2>/dev/null || echo "Homebrew already installed"

brew install starship zsh-syntax-highlighting zsh-autosuggestions wezterm

# Link configs
echo "🔗 Linking configurations..."
ln -sf $(pwd)/zsh/.zshrc ~/.zshrc
ln -sf $(pwd)/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
ln -sf $(pwd)/starship/starship.toml ~/.config/starship.toml
ln -sf $(pwd)/git/.gitconfig ~/.gitconfig

# Set zsh as default shell
if [[ "$SHELL" != "/opt/homebrew/bin/zsh" ]]; then
  echo "🐚 Setting zsh as default shell..."
  sudo chsh -s /opt/homebrew/bin/zsh $(whoami)
fi

echo "✅ Done! Restart your terminal or run: source ~/.zshrc"
