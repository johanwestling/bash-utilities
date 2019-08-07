#!/bin/bash
source "bash-utilities.sh"

bash_title "Bash-utilities examples"

# A select input
select_options=$(ls -d "${bash_root:-.}/utilities/"*)
select_value=$(bash_select "Select label:" ${select_options})

# A text input
input_value=$(bash_input "Input label:")

# Collected values from above input
bash_label "Collected values:"
echo "select_value=${select_value}" | bash_indent
echo "input_value=${input_value}" | bash_indent

# State indicators
bash_label "State indicators:"
bash_skip | bash_indent
bash_done | bash_indent
bash_fail | bash_indent

bash_newline