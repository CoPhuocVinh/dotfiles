# ==================== Aliases ====================
alias c="clear"
alias v="~/Downloads/nvim.appimage"

alias cz="cd ~/Workplace/Karhdo/dotfiles/zsh && v .zshrc"
alias cv="cd ~/Workplace/Karhdo/dotfiles/nvim && v init.lua"

alias zv="cd ~/Workplace/Karhdo/dotfiles/nvim"
alias zz="cd ~/Workplace/Karhdo/dotfiles/zsh"
alias zw="cd ~/Workplace"
alias zy="cd ~/Workplace/YouNet_Media"

alias zbuild='cat "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.dotfiles/zsh/zshrc.d/"*.zsh > "$HOME/.dotfiles/zsh/.zshrc.full"'

alias zreset='source ~/.zshrc'


alias anti="antigravity"

# eza aliases (if installed)
if command -v eza >/dev/null 2>&1; then
  alias ls="eza -l --icons"
  alias la="eza -la --icons"
fi

# alias for xinchao
alias hi='xinchao'
alias hello='xinchao'

# alias for gemini
alias gp='gemini -p'
alias gpj='gemini -p --output-format json'
alias gi='gemini'

# alias for cursor
alias cursor="$HOME/.local/bin/cursor.appimage --no-sandbox"
alias cu="cursor"

