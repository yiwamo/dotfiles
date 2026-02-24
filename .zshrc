eval "$(pyenv init -)"
eval "$(direnv hook zsh)"

# ls => eza

alias ls='eza -la --icons'
alias ll='eza -la --icons'
alias la='eza -a --icons'
alias lt='eza -la --icons --tree --level=2'

# .. => cd ..

alias ..='cd ..'

# custom command

ide(){
  # 上下分割（下25%）
  tmux split-window -v -p 30
  
  # 下のペインを3等分
  tmux split-window -h -p 66   # 左33%, 右66%
  tmux split-window -h -p 50   # 右を半分 → 各33%
  
  # 上のペインに戻って7:3分割
  tmux select-pane -t 0
  tmux split-window -h -p 30   # 右に30%
  
  # 左下にlazygit
  tmux send-keys -t {bottom-left} 'lazygit' C-m
  
  # メインペイン（左上）にフォーカス
  tmux select-pane -t {top-left}
}

ide-kill(){
  tmux kill-window
}

z() {
  cd "$(git rev-parse --show-toplevel 2>/dev/null)" || return
}

# KeyChainのUnlock(SSH)
if [ -n "$SSH_CONNECTION" ]; then
  keychain_status=$(security show-keychain-info ~/Library/Keychains/login.keychain-db 2>&1)
  if echo "$keychain_status" | grep -q "User interaction is not allowed"; then
    security unlock-keychain ~/Library/Keychains/login.keychain-db
  fi
fi

export PATH="$HOME/.local/bin:$PATH"

# OpenClaw Completion
source "/Users/yiwamo-ms/.openclaw/completions/openclaw.zsh"
