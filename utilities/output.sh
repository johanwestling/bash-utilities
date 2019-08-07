#!/bin/bash

# Settings
bash_output_wrap=${bash_line_length:-80}

# Styles
bash_output_strong="\033[1m"
bash_output_light="\033[2m"
bash_output_underline="\033[4m"

# Colors
bash_output_color_default="\033[39m"
bash_output_color_black="\033[30m"
bash_output_color_red="\033[31m"
bash_output_color_green="\033[32m"
bash_output_color_yellow="\033[33m"
bash_output_color_blue="\033[34m"
bash_output_color_magenta="\033[35m"
bash_output_color_cyan="\033[36m"
bash_output_color_gray="\033[90m"

# Backgrounds
bash_output_background_default="\033[49m"
bash_output_background_black="\033[40m"
bash_output_background_red="\033[41m"
bash_output_background_green="\033[42m"
bash_output_background_yellow="\033[43m"
bash_output_background_blue="\033[44m"
bash_output_background_magenta="\033[45m"
bash_output_background_cyan="\033[46m"

# Resets
bash_output_reset_all="\033[0m"
bash_output_reset_strong="\033[21m"
bash_output_reset_light="\033[22m"
bash_output_reset_underline="\033[24m"

bash_newline(){
  echo -e ""
}

bash_indent() {
  sed -e 's/^/  /'
}

bash_label(){
  local label_text="${1}"
  local label_wrap=$(( $bash_output_wrap - 2 ))
  local label=$(echo -e "${label_text}" | fold -sw $label_wrap)

  bash_newline
  echo -e "${bash_output_strong}${bash_output_color_green}→${bash_output_color_default} ${label}${bash_output_reset_all}"
}

bash_notice(){
  local label_text="${1}"
  local label_wrap=$(( $bash_output_wrap - 2 ))
  local label=$(echo -e "${label_text}" | fold -sw $label_wrap)

  echo -e "${bash_output_color_yellow}●${bash_output_color_gray} ${label}${bash_output_reset_all}"
}

bash_skip(){
  local label_text="${1:-Skipped}"
  local label_wrap=$(( $bash_output_wrap - 2 ))
  local label=$(echo -e "${label_text}" | fold -sw $label_wrap)

  echo -e "${bash_output_color_green}↓${bash_output_reset_all} ${label}"
}

bash_done(){
  local label_text="${1:-Done}"
  local label_wrap=$(( $bash_output_wrap - 2 ))
  local label=$(echo -e "${label_text}" | fold -sw $label_wrap)

  echo -e "${bash_output_color_green}●${bash_output_reset_all} ${label}"
}

bash_fail(){
  local label_text="${1:-Failed}"
  local label_wrap=$(( $bash_output_wrap - 2 ))
  local label=$(echo -e "${label_text}" | fold -sw $label_wrap)

  echo -e "${bash_output_color_red}●${bash_output_reset_all} ${label}"
}

bash_hint(){
  local label_text="${1}"
  local label_wrap=$(( $bash_output_wrap - 2 ))
  local label=$(echo -e "${label_text}" | fold -sw $label_wrap)

  echo -e "  ${bash_output_color_gray}${label}${bash_output_reset_all}"
}

bash_select_option(){
  local label_text="${1}"
  local label_wrap=$(( $bash_output_wrap - 4 ))
  local label=$(echo -e "${label_text}" | fold -sw $label_wrap)
  local selected="${2}"

  if [ -n "${selected}" ]; then
    echo -e "${bash_output_strong}${bash_output_color_yellow}→${bash_output_color_default}${bash_output_reset_all} ${label}"
  else
    echo -e "  ${label}"
  fi
}