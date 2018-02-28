# Creates a new markdown meeting note.
function mknote() {
  # ask for meeting information
  vared -p 'Meeting Title: ' -c title
  vared -p 'Meeting Participants: ' -c participants

  # for the filename, convert meeting title to lower case and replace
  # whitespaces by dashes
  filename=${title:l}
  filename=${filename// /-}

  # prepend date and append file extension
  filename="`date +%y%m%d`-${filename}.md"

  # make sure file does not already exist
  if [[ -f $filename ]]; then
    echo "ERROR: file '${filename}' already exists!"
    return
  fi

  # create file and insert initial content
  cat << EOF > $filename
# ${title}
* Date: `date "+%b %d %Y"`
* Participants: ${participants}

## Notes

EOF

  # open the file with cursor positioned in last line
  vim $filename +
}
