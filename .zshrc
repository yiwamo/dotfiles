eval "$(pyenv init -)"
eval "$(direnv hook zsh)"

# alias
alias ls="ls -la"
alias ll="ls -la"
alias la="ls -a"


# custom command

ide(){
  tmux split-window -v -p 25
  tmux split-window -h -p 50
  tmux send-keys -t {bottom-left} 'lazygit' C-m
}


