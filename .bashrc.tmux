if [[ ! $TERM =~ screen ]]; then
  tmux has-session -t default &> /dev/null
  if [ $? == 0 ]; then
    if [ `tmux list-clients -t default | wc -l` == 0 ]; then
      tmux attach -t default
    fi
    exit
  else
    exec tmux new-session -s default
  fi
fi
