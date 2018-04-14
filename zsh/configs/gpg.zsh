# use gpg as ssh agent (if not connected to this machine via ssh)
if [[ (-z "$SSH_CLIENT") && (-S ~/.gnupg/S.gpg-agent.ssh) ]]; then
  export SSH_AUTH_SOCK=~/.gnupg/S.gpg-agent.ssh
fi
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye > /dev/null

if [ $(uname) = "Linux" ]; then
  alias gpg='gpg2'
fi
