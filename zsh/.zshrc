# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$(npm config get prefix)/bin:$PATH"

autoload -Uz compinit && compinit

# Prompt
eval "$(starship init zsh)"

# Fzf search
eval "$(fzf --zsh)"

# Plugins
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Syntax highlighting config
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

# Word movement
bindkey "^[[1;9C" forward-word      # Option+Right
bindkey "^[[1;9D" backward-word     # Option+Left
bindkey "^[[1;3C" forward-word      # Alt+Right
bindkey "^[[1;3D" backward-word     # Alt+Left

# History prefix search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search    # Up arrow
bindkey "^[[B" down-line-or-beginning-search  # Down arrow

# Neovim configs
alias nvim-kick='NVIM_APPNAME=nvim-kick nvim'

# eza aliases
alias ls='eza --icons'
alias ll='eza -la --icons --git'
alias tree='eza --tree --icons'

ulimit -n 4096

# Startup
fastfetch
