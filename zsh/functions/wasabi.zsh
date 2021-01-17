# load awscli and encrypted credentials
function wasabi {
  unset AWS_ACCESS_KEY_ID
  unset AWS_SECRET_ACCESS_KEY
  unset AWS_PROFILE

  if [[ "$1" == "lock" ]]; then
    deactivate
    return
  fi

  source ~/awscli/bin/activate

  AUTHFILE=$HOME/.aws/credentials.asc

  if [ ! -e $AUTHFILE ]; then
    echo "ERROR: ~/.aws/credentials.asc does not exist"
    return
  fi

  AUTH=$(cat $AUTHFILE | gpg --decrypt 2> /dev/null)

  if [ $? -ne 0 ]; then
    echo "ERROR: could not decrypt credentials"
    return
  fi

  export AWS_ACCESS_KEY_ID=$(echo $AUTH | head -n 1)
  export AWS_SECRET_ACCESS_KEY=$(echo $AUTH | tail -n 1)
  export AWS_PROFILE=wasabi
}
