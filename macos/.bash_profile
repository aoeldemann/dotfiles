# set some helpful aliases
alias ls='ls -G'
alias ll='ls -al'

# make tmux start with each session
. ~/repos/dotfiles/.bashrc.tmux

# load some global settings
. ~/repos/dotfiles/.bashrc

# setup gpg agent
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye > /dev/null

# load aws cli bash completer
.  /usr/local/etc/bash_completion.d/aws_bash_completer
