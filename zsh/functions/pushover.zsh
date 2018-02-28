# source pushover.net auth tokens
if [ -f ~/.pushover ]; then
  source ~/.pushover
fi

# Pushes a message to a mobile device.
function push {
  # make sure message was specified
  if [[ -z $1 ]]; then
    echo "ERROR: no push message specified!"
    return
  fi

  # make sure auth tokens are loaded
  if (( ! ${+PUSHOVER_TOKEN} || ! ${+PUSHOVER_USER} )); then
    echo "ERROR: pushover.net auth keys not set (~/.pushover)!"
    return
  fi

  # push message
  curl -s -F "token=${PUSHOVER_TOKEN}" -F "user=${PUSHOVER_USER}" \
    -F "message=$(hostname): $1" \
    https://api.pushover.net/1/messages.json > /dev/null

  # make sure no error occured
  if (( $? != 0 )); then
    echo "ERROR: interaction with pushover.net failed!"
  fi
}

