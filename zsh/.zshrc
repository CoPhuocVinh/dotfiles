# Load all zsh config parts
for f in "$HOME/.dotfiles/zsh/zshrc.d/"*.zsh; do
  [ -r "$f" ] && source "$f"
done

# fnm (brew)
if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd --shell zsh)"
fi