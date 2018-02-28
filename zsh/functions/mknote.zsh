# Creates a new markdown meeting note.
function mknote() {
  # ask for meeting information
  vared -p "Meeting Title: " -c meeting_title
  vared -p "Meeting Participants: " -c meeting_participants
  vared -p "Meeting Location: " -c meeting_location

  # for the filename, convert meeting title to lower case and replace
  # whitespaces by dashes
  filename=${meeting_title:l}
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
# ${meeting_title}
* Date: `date "+%b %d %Y"`
* Participants: ${meeting_participants}
* Location: ${meeting_location}

## Notes


## Next Steps

EOF

  # unset variables
  unset meeting_title
  unset meeting_participants
  unset meeting_location

  # open the file with cursor positioned in first note line
  vim $filename +7
}
