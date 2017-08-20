# configure zsh
export ZSH=~/.oh-my-zsh
ZSH_THEME="bira"
plugins=(git osx)
source $ZSH/oh-my-zsh.sh
setopt globdots

# source aliases
source ~/repos/dotfiles/zsh/aliases

# set SSH_AUTH_SOCK to gpg agent only if we are not connected via ssh
# otherwise use standard ssh agent. this enables ssh agent forwarding
if [ -z "$SSH_CLIENT" ]; then
  export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
fi

# export some paths
export GOPATH=~/dev/go
export PATH=$PATH:$HOME/bin:$GOPATH/bin

# setup gpg
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye > /dev/null
