# ==================== Plugins ====================

# History Substring Search
if [ -f "$HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
  source "$HOME/.zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh"
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# fzf-tab
if [ -f "$HOME/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh" ]; then
  source "$HOME/.zsh/plugins/fzf-tab/fzf-tab.plugin.zsh"
  zstyle ':fzf-tab:*' switch-group ',' '.'
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls -la $realpath'
fi

# autosuggestions
if [ -f "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$HOME/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# autopair
if [ -f "$HOME/.zsh/plugins/zsh-autopair/autopair.zsh" ]; then
  source "$HOME/.zsh/plugins/zsh-autopair/autopair.zsh"
  autopair-init
fi

# you-should-use
if [ -f "$HOME/.zsh/plugins/you-should-use/you-should-use.plugin.zsh" ]; then
  source "$HOME/.zsh/plugins/you-should-use/you-should-use.plugin.zsh"
fi