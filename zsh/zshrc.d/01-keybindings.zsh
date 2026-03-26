# ==================== Keybindings ====================

# Emacs keybindings (Ctrl+A đầu dòng, Ctrl+E cuối dòng, etc.)
bindkey -e

# Home / End / Delete (fix cho một số terminal)
bindkey '^[[H'  beginning-of-line      # Home
bindkey '^[[F'  end-of-line            # End
bindkey '^[[3~' delete-char            # Delete

# Alt+Left/Right: nhảy giữa các từ
bindkey '^[[1;3C' forward-word         # Alt+Right
bindkey '^[[1;3D' backward-word        # Alt+Left
