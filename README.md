# dotfiles

My personal dotfiles for macOS, managed with symlinks.

## Structure

```
dotfiles/
├── zsh/
│   ├── .zshrc                  # Entry point — sources all zshrc.d/*.zsh
│   ├── .zshrc.full             # Auto-generated merged config (zbuild)
│   ├── check_install           # Verify all tools & plugins are installed
│   ├── private/
│   │   └── secrets.zsh         # API keys, tokens (git-ignored)
│   └── zshrc.d/
│       ├── 00-history.zsh      # History settings
│       ├── 10-completion.zsh   # Zsh completion engine + zsh-completions
│       ├── 20-plugins.zsh      # Plugin loading
│       ├── 30-aliases.zsh      # Aliases
│       ├── 40-functions.zsh    # Custom functions (ide, xinchao)
│       ├── 50-env.zsh          # PATH, version managers, env vars
│       ├── 90-prompt.zsh       # Starship prompt
│       └── 99-highlighting.zsh # Syntax highlighting (must be last)
└── README.md
```

---

## CLI Tools (Homebrew Formulae)

### git — Version control

Quản lý lịch sử thay đổi source code, làm việc nhóm qua branch/merge.

```bash
git status                # Xem file nào đã thay đổi
git add .                 # Thêm tất cả thay đổi vào staging
git commit -m "message"   # Lưu thay đổi với mô tả
git push                  # Đẩy code lên remote (GitHub, GitLab...)
git pull                  # Kéo code mới từ remote về
git log --oneline         # Xem lịch sử commit ngắn gọn
git checkout -b new-feat  # Tạo branch mới và chuyển sang
```

### fzf — Fuzzy finder

Tìm kiếm mờ (fuzzy) cực nhanh — gõ vài ký tự là lọc được file, history, process...

```bash
# Tìm file trong thư mục hiện tại
fzf

# Tìm file rồi mở bằng nvim
v $(fzf)

# Tìm trong history
history | fzf

# Tìm process đang chạy
ps aux | fzf

# Dùng với Ctrl+R trong terminal → tìm lệnh cũ đã gõ
# (fzf tự tích hợp keybinding Ctrl+R khi cài)
```

### eza — Thay thế `ls` hiện đại

Liệt kê file/folder với icon, màu sắc, git status. Đã được alias sẵn.

```bash
ls                 # (alias) = eza -l --icons — liệt kê dạng bảng có icon
la                 # (alias) = eza -la --icons — bao gồm cả file ẩn (dotfiles)

# Các lệnh gốc hữu ích
eza --tree         # Hiện dạng cây thư mục
eza --tree -L 2    # Cây thư mục, sâu tối đa 2 cấp
eza -l --git       # Hiện git status từng file
```

### zoxide — Thay thế `cd` thông minh

Ghi nhớ các thư mục bạn hay vào, chỉ cần gõ vài chữ là nhảy đến đúng nơi.

```bash
z work             # Nhảy đến thư mục có chứa "work" (VD: ~/Workplace)
z dot              # Nhảy đến ~/.dotfiles
z proj my          # Nhảy đến thư mục match "proj" + "my"
zi                 # Interactive mode — hiện danh sách để chọn (dùng fzf)

# zoxide tự học — càng dùng cd vào thư mục nào nhiều, z sẽ ưu tiên thư mục đó
```

### starship — Prompt đẹp, nhanh

Hiện thông tin hữu ích trên dòng lệnh: branch git, ngôn ngữ, version, thời gian chạy lệnh...

```bash
# Starship tự động chạy, không cần gõ lệnh
# Cấu hình tại ~/.config/starship.toml

# Ví dụ tạo/sửa config:
mkdir -p ~/.config && nvim ~/.config/starship.toml
```

### fnm — Node.js version manager

Cài và chuyển đổi giữa nhiều phiên bản Node.js. Nhanh hơn nvm rất nhiều.

```bash
fnm list-remote          # Xem tất cả phiên bản Node.js có thể cài
fnm install 20           # Cài Node.js v20 (latest v20.x)
fnm install --lts        # Cài phiên bản LTS mới nhất
fnm list                 # Xem các phiên bản đã cài
fnm use 20               # Chuyển sang dùng Node.js v20
fnm default 20           # Đặt v20 làm mặc định

# Tự động chuyển version khi cd vào folder có file .node-version hoặc .nvmrc
# (đã bật --use-on-cd trong config)
```

### neovim — Text editor

Editor mạnh mẽ chạy trong terminal, mở rộng bằng Lua. Đã alias `v` = `nvim`.

```bash
v                        # (alias) Mở Neovim
v file.txt               # Mở file cụ thể
v .                      # Mở file explorer tại thư mục hiện tại

# Trong Neovim:
# i          → vào Insert mode (gõ text)
# Esc        → về Normal mode
# :w         → lưu file
# :q         → thoát
# :wq        → lưu và thoát
# /keyword   → tìm kiếm
```

### tmux — Terminal multiplexer

Chia terminal thành nhiều panel/tab, giữ session khi disconnect SSH.

```bash
tmux                     # Tạo session mới
tmux ls                  # Liệt kê sessions đang chạy
tmux attach              # Quay lại session gần nhất
tmux attach -t 0         # Quay lại session số 0

# Trong tmux (prefix = Ctrl+b):
# Ctrl+b "     → chia ngang (split horizontal)
# Ctrl+b %     → chia dọc (split vertical)
# Ctrl+b ←↑→↓  → di chuyển giữa các pane
# Ctrl+b c     → tạo window mới (tab)
# Ctrl+b n     → chuyển window tiếp
# Ctrl+b d     → detach (thoát tmux, session vẫn chạy)

# Custom function: gõ `ide` để tạo layout 3 pane sẵn
ide
```

### pyenv — Python version manager

Cài và quản lý nhiều phiên bản Python song song.

```bash
pyenv install --list     # Xem tất cả version có thể cài
pyenv install 3.12.0     # Cài Python 3.12.0
pyenv versions           # Xem các version đã cài
pyenv global 3.12.0      # Đặt version mặc định toàn hệ thống
pyenv local 3.11.0       # Đặt version cho thư mục hiện tại (tạo file .python-version)
python --version         # Kiểm tra version đang dùng
```

### jenv — Java version manager

Chuyển đổi giữa nhiều phiên bản Java (JDK). Hệ thống đã cài sẵn OpenJDK 11 và 17.

```bash
jenv versions            # Xem các JDK đã đăng ký
jenv add /path/to/jdk    # Thêm JDK mới (brew thường ở /opt/homebrew/opt/openjdk@XX)
jenv global 17           # Đặt Java 17 làm mặc định
jenv local 11            # Đặt Java 11 cho thư mục hiện tại (tạo file .java-version)
java -version            # Kiểm tra version đang dùng

# Thêm JDK từ brew:
jenv add /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home
jenv add /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
```

---

## GUI Apps (Homebrew Casks)

| App | Công dụng |
|-----|-----------|
| [Cursor](https://cursor.sh/) | Code editor tích hợp AI, gợi ý và viết code thông minh |
| [Visual Studio Code](https://code.visualstudio.com/) | Code editor phổ biến, nhiều extension |
| [WezTerm](https://wezfurlong.org/wezterm/) | Terminal emulator nhanh, cấu hình bằng Lua, hỗ trợ Nerd Font |
| [Docker Desktop](https://www.docker.com/products/docker-desktop/) | Chạy container (đóng gói app + môi trường) trên máy local |
| [DBeaver Community](https://dbeaver.io/) | Giao diện quản lý database (MySQL, PostgreSQL, MongoDB...) |
| [JetBrains Toolbox](https://www.jetbrains.com/toolbox-app/) | Quản lý cài đặt/cập nhật IntelliJ IDEA, WebStorm, GoLand... |
| [Postman](https://www.postman.com/) | Gửi HTTP request để test API (GET, POST, PUT, DELETE...) |
| [Rectangle](https://rectangleapp.com/) | Sắp xếp cửa sổ bằng phím tắt (nửa trái, nửa phải, maximize...) |
| [The Unarchiver](https://theunarchiver.com/) | Giải nén mọi định dạng file nén (zip, rar, 7z, tar...) |
| [Antigravity](https://github.com/nicknisi/antigravity) | Tiện ích brew cask |

### Rectangle — phím tắt thường dùng

```
Ctrl+Option+←       Nửa trái màn hình
Ctrl+Option+→       Nửa phải màn hình
Ctrl+Option+↑       Nửa trên màn hình
Ctrl+Option+↓       Nửa dưới màn hình
Ctrl+Option+Enter   Maximize (full màn hình)
Ctrl+Option+C       Căn giữa cửa sổ
```

### Fonts

- **Fira Code Nerd Font** — font monospace có ligatures + icon cho terminal/editor
- **JetBrains Mono Nerd Font** — font monospace sắc nét + icon

> Nerd Font bổ sung hàng ngàn icon (devicons, powerline...) để hiện trong terminal, eza, starship...
> Cần chọn font này trong settings của WezTerm / Cursor / VS Code.

---

## Zsh Plugins

Tất cả plugin được git clone vào `~/.zsh/plugins/`.

### zsh-completions — Bổ sung completion

Thêm completion cho hàng trăm command (docker, brew, cargo, npm...). Khi gõ lệnh rồi bấm `Tab`, sẽ hiện gợi ý đầy đủ hơn.

```bash
docker <Tab>       # Hiện tất cả subcommands của docker
brew install <Tab> # Hiện danh sách formulae
```

### zsh-history-substring-search — Tìm history thông minh

Gõ một phần lệnh rồi bấm mũi tên lên/xuống để tìm lệnh cũ chứa đúng chuỗi đó.

```bash
git<↑>             # Tìm tất cả lệnh cũ bắt đầu bằng "git"
docker<↑>          # Tìm tất cả lệnh cũ bắt đầu bằng "docker"
```

### fzf-tab — Completion menu bằng fzf

Thay menu Tab mặc định bằng giao diện fzf — lọc nhanh bằng fuzzy search, có preview.

```bash
cd <Tab>           # Hiện danh sách thư mục với preview (ls -la)
kill <Tab>         # Hiện danh sách process để chọn
ssh <Tab>          # Hiện danh sách host
# Dùng , và . để chuyển group trong menu
```

### zsh-autosuggestions — Gợi ý lệnh

Khi gõ, hiện chữ mờ gợi ý lệnh từ history. Bấm `→` (mũi tên phải) để chấp nhận.

```bash
git c              # Hiện gợi ý mờ: git commit -m "..."
→                  # Bấm mũi tên phải → chấp nhận toàn bộ gợi ý
```

### zsh-autopair — Tự đóng ngoặc

Tự động thêm ký tự đóng khi gõ ký tự mở:

```
(  →  ()       Ngoặc tròn
[  →  []       Ngoặc vuông
{  →  {}       Ngoặc nhọn
"  →  ""       Ngoặc kép
'  →  ''       Ngoặc đơn
```

### you-should-use — Nhắc dùng alias

Khi gõ lệnh đầy đủ mà đã có alias, plugin sẽ nhắc bạn.

```bash
$ clear
# → "Hey! You should use: c"

$ nvim file.txt
# → "Hey! You should use: v"
```

### zsh-syntax-highlighting — Highlight cú pháp

Tô màu lệnh ngay khi gõ: lệnh hợp lệ = xanh lá, lệnh sai = đỏ, string = vàng...

```
ls           → xanh lá (lệnh tồn tại)
lx           → đỏ (lệnh không tồn tại)
"hello"      → vàng (string)
```

---

## Aliases

### Chung

| Alias | Lệnh thực tế | Công dụng |
|-------|---------------|-----------|
| `c` | `clear` | Xoá màn hình terminal |
| `v` | `nvim` | Mở Neovim editor |
| `ls` | `eza -l --icons` | Liệt kê file dạng bảng + icon |
| `la` | `eza -la --icons` | Liệt kê tất cả file (cả ẩn) + icon |

### Dotfiles

| Alias | Lệnh thực tế | Công dụng |
|-------|---------------|-----------|
| `cz` | `cd ~/.dotfiles/zsh && v .zshrc` | Mở sửa config zsh |
| `cv` | `cd ~/.dotfiles/nvim && v init.lua` | Mở sửa config nvim |
| `zv` | `cd ~/.dotfiles/nvim` | Nhảy đến thư mục config nvim |
| `zz` | `cd ~/.dotfiles/zsh` | Nhảy đến thư mục config zsh |
| `zw` | `cd ~/Workplace` | Nhảy đến thư mục làm việc |
| `zbuild` | merge zshrc.d → .zshrc.full | Gộp tất cả file config thành 1 file |
| `zreset` | `source ~/.zshrc` | Reload lại config zsh (sau khi sửa) |

### Gemini CLI

| Alias | Lệnh thực tế | Công dụng |
|-------|---------------|-----------|
| `gp` | `gemini -p` | Hỏi Gemini AI một câu nhanh |
| `gpj` | `gemini -p --output-format json` | Hỏi Gemini, trả về JSON |
| `gi` | `gemini` | Mở Gemini interactive (chat nhiều lượt) |

```bash
gp "giải thích Docker là gì"       # Hỏi 1 câu
gpj "list 5 JS frameworks"         # Nhận JSON
gi                                  # Chat interactive
```

### Khác

| Alias | Lệnh thực tế | Công dụng |
|-------|---------------|-----------|
| `hi` / `hello` | `xinchao` | In lời chào: "Xin chào, ngày mới tốt lành ạ!" |
| `anti` | `antigravity` | Mở Antigravity app |

---

## Custom Functions

### `ide` — Tạo layout IDE trong tmux

Tự động chia tmux thành 3 pane: 1 pane lớn ở trên, 2 pane nhỏ ở dưới.

```
┌──────────────────────────┐
│                          │
│      Main (code)         │
│                          │
├─────────────┬────────────┤
│   Terminal  │  Terminal  │
└─────────────┴────────────┘
```

```bash
ide          # Gõ trong terminal để tạo layout
```

### `xinchao` — Lời chào

```bash
hi                  # → "Xin chào, ngày mới tốt lành ạ Vinhcp!"
xinchao "Bạn"       # → "Xin chào, ngày mới tốt lành ạ Bạn!"
```

---

## Setup

### 1. Cài Homebrew (nếu chưa có)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Clone dotfiles

```bash
git clone <repo-url> ~/.dotfiles
```

### 3. Symlink .zshrc

```bash
ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc
```

### 4. Cài CLI tools

```bash
brew install git fzf eza zoxide starship fnm neovim tmux pyenv jenv openjdk@11 openjdk@17
```

### 5. Cài GUI apps

```bash
brew install --cask cursor visual-studio-code wezterm docker-desktop \
  dbeaver-community jetbrains-toolbox postman rectangle the-unarchiver \
  antigravity font-fira-code-nerd-font font-jetbrains-mono-nerd-font
```

### 6. Cài zsh plugins

```bash
mkdir -p ~/.zsh/plugins && cd ~/.zsh/plugins
git clone https://github.com/zsh-users/zsh-completions
git clone https://github.com/zsh-users/zsh-history-substring-search
git clone https://github.com/Aloxaf/fzf-tab
git clone https://github.com/zsh-users/zsh-autosuggestions
git clone https://github.com/hlissner/zsh-autopair
git clone https://github.com/MichaelAquilina/zsh-you-should-use you-should-use
git clone https://github.com/zsh-users/zsh-syntax-highlighting
```

### 7. Đăng ký JDK cho jenv

```bash
jenv add /opt/homebrew/opt/openjdk@11/libexec/openjdk.jdk/Contents/Home
jenv add /opt/homebrew/opt/openjdk@17/libexec/openjdk.jdk/Contents/Home
jenv global 17
```

### 8. Reload và kiểm tra

```bash
source ~/.zshrc
bash ~/.dotfiles/zsh/check_install
```

> Kết quả mong đợi: tất cả dòng đều hiện `OK`.
