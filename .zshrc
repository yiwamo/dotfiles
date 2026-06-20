# ===========================================================================
# PATH
# ===========================================================================
export PATH="$HOME/.local/bin:$PATH"

# ===========================================================================
# Completion
#   compdef を使う補完(uv 等)より前に compinit を済ませておく
# ===========================================================================
autoload -Uz compinit
compinit

# ===========================================================================
# Tool init
# ===========================================================================
# Node (fnm)
eval "$(fnm env --use-on-cd --shell zsh)"

# Python は uv に一本化。
# uv はシェル初期化不要なので、補完だけ有効化(入っているときのみ)
command -v uv >/dev/null && eval "$(uv generate-shell-completion zsh)"

# direnv (入っているときのみ)
command -v direnv >/dev/null && eval "$(direnv hook zsh)"


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

# uv shortcuts (お好みで。不要なら消してOK)
alias uvr='uv run'
alias uvs='uv sync'

# ===========================================================================
# Functions
# ===========================================================================
# tmux IDE レイアウト(左下に lazygit)
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

# ===========================================================================
# マシン固有設定 (git 管理外。あれば読み込む)
# ===========================================================================
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

