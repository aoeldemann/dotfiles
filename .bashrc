docker_ps1() {
  if [ -z $dockerenv ]; then
    echo ''
  else
    echo '(docker) '
  fi
  return 0
}

PS1='\[\033[0;34m\]\u\[\033[0m\]@\[\033[0;31m\]\h\[\033[0m\]:\w \[\033[0;36m\]$(docker_ps1)\[\033[0m\]$ '

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
