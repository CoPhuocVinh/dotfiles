# ==================== Functions ====================

# Tạo thư mục và cd vào luôn (oh-my-zsh gọi là "take")
mkcd() {
  mkdir -p "$1" && cd "$1"
}

function ide() {
  if [ -z "$TMUX" ]; then
    tmux new-session \; \
      split-window -v -l 22%\; \
      split-window -h -l 50%\; \
      select-pane -t 0
  else
    tmux split-window -v -l 22%\; \
      split-window -h -l 50%\; \
      select-pane -t 0
  fi
}

# Double Esc = thêm sudo vào đầu lệnh (hoặc lệnh trước)
sudo-command-line() {
  [[ -z $BUFFER ]] && zle up-history
  if [[ $BUFFER == sudo\ * ]]; then
    LBUFFER="${LBUFFER#sudo }"
  else
    LBUFFER="sudo $LBUFFER"
  fi
}
zle -N sudo-command-line
bindkey '\e\e' sudo-command-line

# Copy đường dẫn thư mục hiện tại vào clipboard
copypath() {
  pwd | tr -d '\n' | pbcopy
  echo "Copied: $(pwd)"
}

# Đặt tên mặc định
MY_NAME="Vinhcp"

# In ra "Xin chào"
xinchao() {
  local name="${1:-$MY_NAME}"
  print -P "%F{green}Xin chào, ngày mới tốt lành ạ $name!%f"
}
