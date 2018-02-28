# Connects to the gpg-agent
function gpgconnect() {
  gpg-connect-agent updatestartuptty /bye > /dev/null
}
