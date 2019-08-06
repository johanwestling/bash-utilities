#!/bin/bash
source "${bash_root:-.}/utilities/output.sh"

bash_select(){
  local index=0
  local selected=1

  while [ $# -gt 0 ]; do
    if [ $index -eq 0 ]; then
      bash_label "${1}"
      bash_hint "Use UP/DOWN and ENTER to make your selection."
      bash_newline
    else
      if [ $index -eq $selected ]; then
        bash_select_option "${1}" true | bash_indent
      else
        bash_select_option "${1}" | bash_indent
      fi
    fi
    index=$(( $index + 1 ))
    shift
  done
  bash_newline
}