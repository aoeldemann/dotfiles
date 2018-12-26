# configure oh-my-zsh path
export ZSH=~/.oh-my-zsh

# leave theme empty. will configure pure theme later
ZSH_THEME=""

# set up general stuff ...
plugins=(git osx jump systemd)
source $ZSH/oh-my-zsh.sh

# set language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# export some paths
export GOPATH=~/dev/go
export PATH=$PATH:$HOME/bin:$GOPATH/bin

# if an additional, custom zshrc file exists, source it
if [ -f ~/.zshrc.custom ]; then
  source ~/.zshrc.custom
fi

# source aliases
source ~/repos/dotfiles/zsh/aliases

# source configs
for config in ~/repos/dotfiles/zsh/configs/*.zsh; do
  source $config
done

# source functions
for func in ~/repos/dotfiles/zsh/functions/*.zsh; do
  source $func
done
