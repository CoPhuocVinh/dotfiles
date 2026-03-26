# Load all zsh config parts
for f in "$HOME/.dotfiles/zsh/zshrc.d/"*.zsh; do
  [ -r "$f" ] && source "$f"
done
# Added by Antigravity
export PATH="/Users/vinhcp/.antigravity/antigravity/bin:$PATH"
