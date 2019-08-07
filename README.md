# Bash utilities

Various utilitiy functions for developing bash scripts.

<br id="usage">

## Usage

1. Create a bash script file.
1. Include the bash-utilities.sh file:
    ```bash
    source "./path/to/bash-utilities.sh"
    ```
1. Use some of the bash-utilities functions:
    ```bash
    source "./path/to/bash-utilities.sh"

    bash_title "Script title"

    # A text input
    input_value=$(bash_input "What's your name?")

    # A select input
    select_value=$(bash_select "Do you like bash?" "Yes" "No")

    echo ""
    if [[ "${select_value}" = "Yes" ]]; then
      echo "Hi ${input_value} who likes bash!"
    else
      echo "Hi ${input_value} who hates bash..."
    fi
    ```

<br id="available-utilties">

## Available utilities

### User input

* bash_input
* bash_select

### Output

* bash_title
* bash_label

### State

* bash_notice
* bash_skip
* bash_done
* bash_fail

### Formatting

* bash_newline
* bash_indent