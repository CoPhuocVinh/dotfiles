# ==================== Aliases ====================
alias c="clear"
alias v="nvim"

alias cz="cd ~/.dotfiles/zsh && v .zshrc"
alias cv="cd ~/.dotfiles/nvim && v init.lua"

alias zv="cd ~/.dotfiles/nvim"
alias zz="cd ~/.dotfiles/zsh"
alias zw="cd ~/Workplace"

alias zbuild='cat "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.dotfiles/zsh/zshrc.d/"*.zsh > "$HOME/.dotfiles/zsh/.zshrc.full"'
alias zreset='source ~/.zshrc'

alias anti="antigravity"

# eza
if command -v eza >/dev/null 2>&1; then
  alias ls="eza -l --icons"
  alias la="eza -la --icons"
fi

# xinchao
alias hi='xinchao'
alias hello='xinchao'

# gemini
alias gp='gemini -p'
alias gpj='gemini -p --output-format json'
alias gi='gemini'