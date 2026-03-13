# ==================== Functions ====================
function ide() {
  if [ -z "$TMUX" ]; then
    tmux new-session \; \
      split-window -v -l 22%\; \
      split-window -h -l 50%\; \
      select-pane -t 0
  else
    tmux split-window -v -l 22%\; \
      split-window -h -l 22%\; \
      select-pane -t 0
  fi
}

# Đặt tên mặc định
MY_NAME="Vinhcp"

# In ra "Xin chào"
xinchao() {
  local name="${1:-$MY_NAME}"
  print -P "%F{green}Xin chào, ngày mới tốt lành ạ $name!%f"
}
