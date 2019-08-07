#!/bin/bash
source "${bash_root:-.}/utilities/output.sh"
source "${bash_root:-.}/utilities/input.sh"

# select_options=$(ls -d "${bash_root:-.}/utilities/"*)
# select_value=$(bash_select "Select label:" ${select_options})
# echo "select_value=${select_value}"

input_value=$(bash_input "Input label:")
echo "input_value=${input_value}"