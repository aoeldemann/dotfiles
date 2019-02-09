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

# set up golang
export GOPATH=~/dev/go
export PATH=$PATH:$HOME/bin:$GOPATH/bin

# set up ruby
export GEM_HOME=~/.gem/ruby/2.3.0/gems
export PATH=$PATH:~/.gem/ruby/2.3.0/bin

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

# enable syntax highlighting plugin
source ~/repos/dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
