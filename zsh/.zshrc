# configure zsh
export ZSH=~/.oh-my-zsh
export ZSH_CUSTOM=~/repos/dotfiles/zsh/custom
ZSH_THEME="aoel"
plugins=(git osx jump systemd)
if [ -f ~/repos/dotfiles/zsh/.promptcolor ]; then
  source ~/repos/dotfiles/zsh/.promptcolor
else
  unset promptcolor
fi
source $ZSH/oh-my-zsh.sh
setopt globdots

# set language
export LANG=en_US.UTF-8

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

# mac specific gpg setup
if [ $(uname) = "Darwin" ]; then
  gpg-connect-agent updatestartuptty /bye > /dev/null
fi

# if an additional, custom zshrc file exists, source it
if [ -f ~/.zshrc.custom ]; then
  source ~/.zshrc.custom
fi

# source pushover.net auth tokens
if [ -f ~/.pushover ]; then
  source ~/.pushover
fi

# pushover.net 'push' cmd
function push {
  if [[ -z $1 ]]; then
    echo "ERROR: no push message specified!"
    return
  fi
  if [[ ! -v PUSHOVER_TOKEN || ! -v PUSHOVER_USER ]]; then
    echo "ERROR: pushover.net auth keys not set (~/.pushover)!"
    return
  fi
  curl -s -F "token=${PUSHOVER_TOKEN}" -F "user=${PUSHOVER_USER}" \
    -F "message=$(hostname): $1" \
    https://api.pushover.net/1/messages.json > /dev/null
  if (( $? != 0 )); then
    echo "ERROR: interaction with pushover.net failed!"
  fi
}
