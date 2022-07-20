#!/bin/zsh 
# ZSH FUNCTIONS

# mkdir && cd
function mkcd {
  last=$(eval "echo \$$#")
  if [ ! -n "$last" ]
  then
    echo "Enter a directory name"
  elif [ -d $last ]
  then
    echo "\`$last' already exists"
  else
    mkdir $@ && cd $last
  fi
}

# exit-code prompt
function check_last_exit_code() {
  local LAST_EXIT_CODE=$?
  if [[ $LAST_EXIT_CODE -ne 0 ]]
  then
    local EXIT_CODE_PROMPT=' '
    EXIT_CODE_PROMPT+="%{$fg_bold[red]%}$LAST_EXIT_CODE ●%{$reset_color%}"
  # unccomment for success indicator
  # else
  #   local EXIT_CODE_PROMPT=' '
  #   EXIT_CODE_PROMPT+="%{$fg_bold[green]%}﬽%{$reset_color%}"
  fi
  echo $EXIT_CODE_PROMPT
}

# create backup file
function bak() {
  for file in "$@"
  do
    cp ${file} "${file}.bak"
  done
}

