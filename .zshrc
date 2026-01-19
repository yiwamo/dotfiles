eval "$(pyenv init -)"
eval "$(direnv hook zsh)"

# ls => eza

alias ls='eza -la --icons'
alias ll='eza -la --icons'
alias la='eza -a --icons'
alias lt='eza -la --icons --tree --level=2'

# custom command

ide(){
  # 上下分割（下25%）
  tmux split-window -v -p 25
  
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
