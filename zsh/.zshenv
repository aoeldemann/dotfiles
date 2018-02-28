# markdown preview
function markdown {
  if [[ -z $1 ]]; then
    echo "ERROR: no input file specified!"
    return
  fi
  if [[ ! -f $1 ]]; then
    echo "ERROR: input file not found!"
    return
  fi
  if [[ ${1:e} != "md" ]]; then
    echo "ERROR: invalid input file extension!"
    return
  fi
  grip $1 --export ${1:r}.html
  firefox ${1:r}.html
  sleep 1
  rm ${1:r}.html
}
