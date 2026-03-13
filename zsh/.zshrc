# Load all zsh config parts
for f in "$HOME/.dotfiles/zsh/zshrc.d/"*.zsh; do
  [ -r "$f" ] && source "$f"
done

# fnm
FNM_PATH="/home/vinhcp/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "`fnm env`"
fi
