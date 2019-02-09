function email {
  if [[ -z $EMAIL_DOMAIN ]]; then
    echo "ERROR: no domain set"
    return
  fi
  prefix=`LC_ALL=C tr -dc 'a-f0-9' < /dev/urandom | head -c 16`
  echo "${prefix}@${EMAIL_DOMAIN}"
}
