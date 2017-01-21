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

alias ubuntu='docker run -it --rm -v `pwd`:/data ubuntu /bin/bash'

export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
export PATH=$PATH:$HOME/bin
