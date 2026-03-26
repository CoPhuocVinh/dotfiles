# ==================== PATH / Env ====================
export EDITOR="nvim"
export VISUAL="nvim"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# fnm (brew handles PATH, just need eval)
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# zoxide
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# Java (managed by jenv)
if command -v jenv >/dev/null 2>&1; then
  export PATH="$HOME/.jenv/bin:$PATH"
  eval "$(jenv init -)"
fi

# Secrets
if [ -f "$HOME/.dotfiles/zsh/private/secrets.zsh" ]; then
  source "$HOME/.dotfiles/zsh/private/secrets.zsh"
fi

# pyenv
if command -v pyenv >/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init - zsh)"
fi