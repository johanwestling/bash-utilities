#!/bin/bash
source "${bash_root:-.}/utilities/output.sh"
source "${bash_root:-.}/utilities/input.sh"

select_value=$(bash_select "Select label:" \
  $(ls -d "${bash_root:-.}/utilities/"*))

echo ""
echo "Select value: $select_value"