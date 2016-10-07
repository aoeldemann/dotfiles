if [[ ! $TERM =~ screen ]]; then
  tmux has-session -t default &> /dev/null
  if [ $? == 0 ]; then
    if [ `tmux list-clients -t default | wc -l` == 0 ]; then
      tmux attach -t default
    fi
    exit
  else
    exec tmux new-session -s default
  fi
fi

PS1='\[\033[0;34m\]\u\[\033[0m\]@\[\033[0;31m\]\h\[\033[0m\]:\w $ '

alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

alias d='docker'
alias v='vagrant'
alias vs='vagrant ssh'
alias vu='vagrant up'

alias dol='doctl compute droplet list'
alias doc='doctl compute droplet create'
alias dod='doctl compute droplet delete'
alias dos='doctl compute ssh --ssh-key-path ~/.ssh/andreas --ssh-user andreas --ssh-port 4747'

alias ubuntu='docker run -it --rm -v `pwd`:/data ubuntu /bin/bash'
