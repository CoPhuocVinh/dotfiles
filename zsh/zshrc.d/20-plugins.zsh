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
  zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -la --icons --color=always $realpath 2>/dev/null || ls -la $realpath'
  zstyle ':fzf-tab:complete:*:*' fzf-preview \
    'if [ -d $realpath ]; then eza -la --icons --color=always $realpath 2>/dev/null || ls -la $realpath; elif [ -f $realpath ]; then head -50 $realpath 2>/dev/null; fi'
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

# fzf keybindings & completion
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# Colored man pages
export LESS_TERMCAP_mb=$'\e[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\e[1;36m'     # begin cyan bold (headings)
export LESS_TERMCAP_me=$'\e[0m'        # end mode
export LESS_TERMCAP_so=$'\e[1;44;33m'  # begin status line (search highlight)
export LESS_TERMCAP_se=$'\e[0m'        # end status line
export LESS_TERMCAP_us=$'\e[1;32m'     # begin underline (green)
export LESS_TERMCAP_ue=$'\e[0m'        # end underline