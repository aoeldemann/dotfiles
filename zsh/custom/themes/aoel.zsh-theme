# based on 'evan' oh-my-zsh theme
if [[ $UID -eq 0 ]]; then
  color=red
else
  color=blue
fi
prompt='%{$fg[$color]%}%M%{$reset_color%} :: %2~ %b»%b '
