# ==================== Zsh Options ====================

# Gõ tên thư mục không cần cd
# VD: gõ "dotfiles" thay vì "cd dotfiles"
setopt AUTO_CD

# cd tự push vào stack, dùng "cd -" hoặc "cd -2" để quay lại
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS    # không push thư mục trùng
setopt PUSHD_SILENT          # không in stack khi pushd

# Sửa lỗi gõ sai tên lệnh
# VD: gõ "gti" -> "zsh: correct 'gti' to 'git'? [nyae]"
setopt CORRECT

# Globbing mạnh hơn
setopt EXTENDED_GLOB         # pattern nâng cao: ^, ~, # trong glob
setopt GLOB_DOTS             # include dotfiles khi glob

# Không beep
setopt NO_BEEP

# Cho phép comment trong interactive shell
setopt INTERACTIVE_COMMENTS  # gõ "ls # test" không bị lỗi
