# docker aliases
alias d='docker'
alias drm='docker rm $(docker ps -a -q)'
alias ubuntu='docker run -it --rm -v `pwd`:/data aoeldemann/ubuntu /bin/bash'

# vagrant
alias v='vagrant'

# time aliases
alias now='date +%y%m%d%H%M'
alias day='date +%y%m%d'

# ssh
alias sshp='ssh -o "UserKnownHostsFile /dev/null" -o "StrictHostKeyChecking no"'

# other stuff
alias ll='ls -alh'
alias tmux='tmux -2'
alias mm='~/dev/projects/maskedmail/maskedmail.py alias'
