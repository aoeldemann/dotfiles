# unlock encrypted computer via SSH
function unlock {
  if [ -z $1 ] || [ -z $2 ]; then
    echo "Usage: $0 <hostname> <keyfile>"
    return
  fi

  hostname=$1
  keyfile=$2

  if [ ! -f ${keyfile} ]; then
    echo "ERROR: key file ${keyfile} not found"
    return
  fi

  gpg --decrypt ${keyfile} | \
    ssh -4 -p 4746 -o BatchMode=yes \
    -o UserKnownHostsFile=~/.ssh/known_hosts.initramfs \
    root@${hostname} "cat > /lib/cryptsetup/passfifo"
}
