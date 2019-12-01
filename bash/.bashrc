if [[ $- =~ "i" ]]; then
  # only execute zsh when in interactive terminal. otherwise applications
  # such as scp fail
  exec /bin/zsh
fi
