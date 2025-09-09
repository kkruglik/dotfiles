# Dotfiles

Minimal, fast zsh setup for macOS development.

## Features

- 🚀 **Starship prompt** - Fast, customizable
- ✨ **Syntax highlighting** - Commands highlighted as you type  
- 💡 **Auto suggestions** - History-based command suggestions
- ⌨️ **Smart navigation** - Word jumping, prefix history search
- 🖥️ **WezTerm config** - GPU-accelerated terminal with splitting

## Quick Install

```bash
git clone https://github.com/yourusername/dotfiles.git ~/dotfiles
cd ~/dotfiles
chmod +x install.sh
./install.sh
```

## Manual Install

1. Install dependencies:

   ```bash
   brew install starship zsh-syntax-highlighting zsh-autosuggestions wezterm
   ```

2. Link configs:

   ```bash
   ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
   ln -sf ~/dotfiles/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
   ```

3. Restart terminal

## Key Bindings

- `Option + Arrow` - Jump by words
- `Up/Down + prefix` - Search history by prefix (type `git` then ↑)
- `Cmd + D` - Split terminal horizontally
- `Cmd + Shift + D` - Split terminal vertically

## Philosophy

Minimal setup, maximum productivity. No Oh-My-Zsh bloat, just essential features using native zsh capabilities.

