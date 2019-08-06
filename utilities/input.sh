#!/bin/bash
source "${bash_root:-.}/utilities/output.sh"

bash_select(){
  local value=""
  local index=0
  local selected=0
  local options=()

  while [ $# -gt 0 ]; do
    if [ $index -eq 0 ]; then
      bash_label "${1}" >&2
      bash_hint "Use UP/DOWN and ENTER to make your selection. (CTRL + C to cancel)" >&2
      bash_newline >&2
    else
      options+=("${1}")
    fi

    index=$(( $index + 1 ))
    shift
  done

  bash_select_options
  bash_select_keyboard_events
  bash_newline
}

bash_select_options(){
  local index=0

  for option in "${options[@]}"; do
    if [ $index -eq $selected ]; then
      bash_select_option "${option}" true | bash_indent >&2
    else
      bash_select_option "${option}" | bash_indent >&2
    fi

    index=$(( $index + 1 ))
  done
}

bash_select_options_clear(){
  for option in "${options[@]}"; do
    tput el >&2
    tput cuu1 >&2
  done

  tput el >&2
}

bash_select_keyboard_events(){
  while [ "${value}" = "" ]; do
    IFS=
    read -r -sn 1 key

    case $key in
      A)
        # Up arrow key
        selected=$(( $selected - 1))
        if [ $selected -lt 0 ]; then
          selected=0
        fi

        bash_select_options_clear
        bash_select_options
        ;;

      B)
        # Down arrow key
        selected=$(( $selected + 1))
        if [ $selected -gt $(( $index - 2)) ]; then
          selected=$(( $index - 2))
        fi

        bash_select_options_clear
        bash_select_options
        ;;

      "")
        # Enter arrow key
        value="${options[$selected]}"

        bash_newline >&2
        bash_hint "Selected: ${value}" >&2

        echo "${value}"
        ;;
    esac
  done
}