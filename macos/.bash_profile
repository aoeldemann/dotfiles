alias ls='ls -G'
alias ll='ls -al'
. ~/repos/dotfiles/.bashrc.tmux
. ~/repos/dotfiles/.bashrc

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye > /dev/null

.  /usr/local/etc/bash_completion.d/aws_bash_completer
