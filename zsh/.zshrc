# set language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# configure oh-my-zsh path
export ZSH=~/.oh-my-zsh

# leave oh-my-zsh theme empty. will configure pure theme later
ZSH_THEME=""

# load oh-my-zsh
plugins=(git osx jump systemd)
source $ZSH/oh-my-zsh.sh

# add ~/bin to path
export PATH=$PATH:~/bin

# source custom config (if present)
[ -f ~/.zshrc.custom ] && source ~/.zshrc.custom

# source configs
for config in ~/repos/dotfiles/zsh/configs/*.zsh; do
  source $config
done

# source functions
for func in ~/repos/dotfiles/zsh/functions/*.zsh; do
  source $func
done

# source fzf config (if present)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
