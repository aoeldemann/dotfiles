ch() {
  local dir
  dir=$(fd . ${1:-~} --type directory 2> /dev/null | fzf +m) &&
  cd "$dir"
}

cf() {
  local file
  local dir
  file=$(fd . ${1:-~} --type file 2> /dev/null | fzf +m) &&
  dir=$(dirname "$file") &&
  cd "$dir"
}
