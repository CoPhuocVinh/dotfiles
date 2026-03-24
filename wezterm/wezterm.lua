local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- Font: JetBrains Mono Nerd Font (cài qua brew)
-- Nerd Font hỗ trợ icon cho starship (, , ...) và eza
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14.0

-- Theme: One Dark (giống VS Code / Atom)
-- Đổi theme: thay string, WezTerm tự reload
-- Gợi ý: "Catppuccin Mocha", "Tokyo Night", "Dracula", "Gruvbox Dark"
config.color_scheme = "One Dark (Gogh)"

-- Window: có 3 nút (đỏ/vàng/xanh) nhưng không có title bar
-- "RESIZE" = không nút, không title bar
-- "TITLE | RESIZE" = có nút + title bar
-- "INTEGRATED_BUTTONS | RESIZE" = có nút, không title bar (modern)
config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"

-- Padding: khoảng cách giữa text và mép cửa sổ (pixel)
config.window_padding = {
  left = 20,
  right = 20,
  top = 16,
  bottom = 16,
}

-- Độ trong suốt: 1.0 = không trong suốt, 0.8 = khá trong suốt
config.window_background_opacity = 1.0

-- Tab bar: ẩn khi chỉ có 1 tab, hiện ở dưới (giống tmux)
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true

-- Cursor: nhấp nháy dạng | (giống VS Code / Cursor IDE)
-- Các kiểu khác: "BlinkingBlock", "SteadyBar", "SteadyBlock"
config.default_cursor_style = "BlinkingBar"

-- Scrollback: số dòng output có thể scroll lại xem (mặc định 3500)
config.scrollback_lines = 10000

-- Tắt tiếng beep khi tab completion không tìm thấy
config.audible_bell = "Disabled"

-- Keybindings
config.keys = {
  -- Chia pane (dùng khi không ở trong tmux)
  -- Cmd+D: chia ngang (trái/phải)
  -- Cmd+Shift+D: chia dọc (trên/dưới)
  -- Cmd+W: đóng pane hiện tại
  { key = "d", mods = "CMD",       action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "d", mods = "CMD|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "w", mods = "CMD",       action = wezterm.action.CloseCurrentPane({ confirm = true }) },

  -- Di chuyển giữa các pane: Cmd+Alt+Mũi tên
  { key = "LeftArrow",  mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection("Left") },
  { key = "RightArrow", mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection("Right") },
  { key = "UpArrow",    mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection("Up") },
  { key = "DownArrow",  mods = "CMD|ALT", action = wezterm.action.ActivatePaneDirection("Down") },

  -- Zoom font: Cmd+= tăng, Cmd+- giảm, Cmd+0 reset
  { key = "=", mods = "CMD", action = wezterm.action.IncreaseFontSize },
  { key = "-", mods = "CMD", action = wezterm.action.DecreaseFontSize },
  { key = "0", mods = "CMD", action = wezterm.action.ResetFontSize },
}

return config