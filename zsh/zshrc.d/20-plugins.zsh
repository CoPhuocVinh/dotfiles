# ==================== Plugins ====================

# History Substring Search (↑ ↓ theo chuỗi đang gõ)
if [ -f "$HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
  source "$HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# fzf-tab (completion UI with fzf)
if [ -f "${ZSH_CUSTOM:-$HOME/.zsh}/plugins/fzf-tab/fzf-tab.plugin.zsh" ]; then
  source "${ZSH_CUSTOM:-$HOME/.zsh}/plugins/fzf-tab/fzf-tab.plugin.zsh"
  zstyle ':fzf-tab:*' switch-group ',' '.'
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -la $realpath'
fi

# autosuggestions
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# autopair
if [ -f "${ZSH_CUSTOM:-$HOME/.zsh}/plugins/zsh-autopair/autopair.zsh" ]; then
  source "${ZSH_CUSTOM:-$HOME/.zsh}/plugins/zsh-autopair/autopair.zsh"
  autopair-init
fi

# you-should-use (suggest alias usage)
if [ -f "${ZSH_CUSTOM:-$HOME/.zsh}/plugins/you-should-use/you-should-use.plugin.zsh" ]; then
  source "${ZSH_CUSTOM:-$HOME/.zsh}/plugins/you-should-use/you-should-use.plugin.zsh"
fi
