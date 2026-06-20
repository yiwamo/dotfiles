# ===========================================================================
# Version managers / tool init
# ===========================================================================

# Node
eval "$(fnm env --use-on-cd --shell zsh)"

# Python / direnv (導入済みのときだけ有効化)
command -v pyenv  >/dev/null && eval "$(pyenv init -)"
command -v direnv >/dev/null && eval "$(direnv hook zsh)"

# ===========================================================================
# PATH
# ===========================================================================

export PATH="$HOME/.local/bin:$PATH"

# ===========================================================================
# Completion
# ===========================================================================

autoload -Uz compinit
compinit

# ===========================================================================
# Aliases
# ===========================================================================

# ls => eza
alias ls='eza -la --icons'
alias ll='eza -la --icons'
alias la='eza -a --icons'
alias lt='eza -la --icons --tree --level=2'

# .. => cd ..
alias ..='cd ..'

# ===========================================================================
# Functions
# ===========================================================================

# tmux IDE レイアウト（左下に lazygit）
ide() {
  tmux split-window -v -p 30
  tmux split-window -h -p 66
  tmux split-window -h -p 50
  tmux select-pane -t 0
  tmux split-window -h -p 30
  tmux send-keys -t {bottom-left} 'lazygit' C-m
  tmux select-pane -t {top-left}
}

ide-kill() { tmux kill-window; }

# git リポジトリのルートへ移動
z() { cd "$(git rev-parse --show-toplevel 2>/dev/null)" || return; }

# ===========================================================================
# macOS: SSH 接続時に login keychain を自動アンロック
# ===========================================================================

if [ -n "$SSH_CONNECTION" ]; then
  keychain_status=$(security show-keychain-info ~/Library/Keychains/login.keychain-db 2>&1)
  if echo "$keychain_status" | grep -q "User interaction is not allowed"; then
    security unlock-keychain ~/Library/Keychains/login.keychain-db
  fi
fi