#!/bin/bash
source "${bash_root:-.}/utilities/output.sh"
source "${bash_root:-.}/utilities/input.sh"

bash_select "Select label:" \
  $(ls -d "${bash_root:-.}/utilities/"*)