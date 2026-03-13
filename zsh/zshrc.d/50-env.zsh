# ==================== PATH / Env ====================
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# fnm setup (portable)
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ] && command -v fnm >/dev/null 2>&1; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

# zoxide setup
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH="$JAVA_HOME/bin:$PATH"

# Secrets (private)
if [ -f "$HOME/.dotfiles/zsh/private/secrets.zsh" ]; then
  source "$HOME/.dotfiles/zsh/private/secrets.zsh"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

