export FZF_DEFAULT_COMMAND='fd --type file'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--preview '[[ \$(file --mime {}) =~ binary ]] && \
                                      echo {} is a binary file || \
                                      (bat --style=numbers --color=always {} \
                                      || cat {}) 2> /dev/null | head -500'"
