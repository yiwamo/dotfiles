eval "$(pyenv init -)"
eval "$(direnv hook zsh)"

# ls => eza

alias ls='eza -la --icons'
alias ll='eza -la --icons'
alias la='eza -a --icons'
alias lt='eza -la --icons --tree --level=2'

# custom command

ide(){
  tmux split-window -v -p 25
  tmux split-window -h -p 50
  tmux send-keys -t {bottom-left} 'lazygit' C-m
}


