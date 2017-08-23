if [[ $UID -eq 0 ]]; then
  promptcolor=red
else
  if [[ ! -n "${promptcolor+1}" ]]; then
    promptcolor=white
  fi
fi

PROMPT='%{$fg[$promptcolor]%}%M%{$reset_color%} :: $(git_prompt_info)%~ %b»%b '
RPROMPT='[%*]'

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$(parse_git_dirty)($(current_branch))%{$reset_color%} "
}

ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
