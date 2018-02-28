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

  if [[ `uname` == "Darwin" ]]; then
    open ${1:r}.html
  else
    firefox ${1:r}.html
  fi

  sleep 0.5
  rm ${1:r}.html
}
