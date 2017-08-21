if [[ $UID -eq 0 ]]; then
  promptcolor=red
else
  if [[ ! -n "${promptcolor+1}" ]]; then
    promptcolor=white
  fi
fi
prompt='%{$fg[$promptcolor]%}%M%{$reset_color%} :: %~ %b»%b '
