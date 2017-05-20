PS1='\[\033[0;34m\]\u\[\033[0m\]@\[\033[0;31m\]\h\[\033[0m\]:\w $ '

alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

alias d='docker'

alias v='vagrant'

alias tl='tmux list-session'
alias ta='tmux attach'

alias ubuntu='docker run -it --rm -v `pwd`:/data aoeldemann/ubuntu /bin/bash'

alias gpg='gpg2'

# set SSH_AUTH_SOCK to gpg agent only if we are not connected via ssh
# otherwise use standard ssh agent. this enables ssh agent forwarding
if [ -z "$SSH_CLIENT" ]; then
  export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
fi

export PATH=$PATH:$HOME/bin

export GOPATH=~/dev/go
