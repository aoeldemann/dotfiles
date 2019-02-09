function email {
  if [[ -z $EMAIL_DOMAIN ]]; then
    echo "ERROR: no domain set"
    return
  fi

  if [[ -z $1 ]]; then
    echo -n "ID (optional): "
    read id
  else
    id=$1
  fi

  prefix=`LC_ALL=C tr -dc 'a-f0-9' < /dev/urandom | head -c 8`

  if [[ -z $id ]]; then
    addr=${prefix}@${EMAIL_DOMAIN}
  else
    addr=${prefix}-${id}@${EMAIL_DOMAIN}
  fi

  echo $addr
  echo `date +"%y/%m/%d %H:%M"` $addr >> ~/.email_history
}
