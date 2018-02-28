# configure oh-my-zsh paths, theme, plugins, prompt color...
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
export LC_ALL=en_US.UTF-8

# export some paths
export GOPATH=~/dev/go
export PATH=$PATH:$HOME/bin:$GOPATH/bin

# use gpg as ssh agent (if not connected to this machine via ssh)
if [[ (-z "$SSH_CLIENT") && (-S ~/.gnupg/S.gpg-agent.ssh) ]]; then
  export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye > /dev/null

# if an additional, custom zshrc file exists, source it
if [ -f ~/.zshrc.custom ]; then
  source ~/.zshrc.custom
fi

# source aliases
source ~/repos/dotfiles/zsh/aliases

# source functions
for func in ~/repos/dotfiles/zsh/functions/*.zsh; do
  source $func
done
