# ==================== History ====================
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt SHARE_HISTORY          # chia sẻ history giữa các session
setopt HIST_IGNORE_ALL_DUPS   # xóa lệnh trùng cũ khi thêm mới
setopt HIST_IGNORE_SPACE      # lệnh bắt đầu bằng space = không lưu (gõ mật khẩu)
setopt HIST_VERIFY            # !! hiện lệnh trước để xem, không chạy ngay
setopt INC_APPEND_HISTORY     # ghi history ngay lập tức, không đợi thoát shell
setopt HIST_EXPIRE_DUPS_FIRST # khi history đầy, xóa lệnh trùng trước
setopt HIST_FIND_NO_DUPS      # tìm history không hiện kết quả trùng
setopt HIST_REDUCE_BLANKS     # xóa khoảng trắng thừa trong lệnh

# Emacs keybindings
bindkey -e

# Home / End / Delete (fix cho một số terminal)
bindkey '^[[H'  beginning-of-line      # Home
bindkey '^[[F'  end-of-line            # End
bindkey '^[[3~' delete-char            # Delete
bindkey '^[[1;3C' forward-word         # Alt+Right: nhảy sang từ tiếp
bindkey '^[[1;3D' backward-word        # Alt+Left: nhảy về từ trước
