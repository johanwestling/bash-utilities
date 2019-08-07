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
    ```bash
    # Input
    bash_input "Input label:"

    # Input with a hint
    bash_input "Input label:" "Input hint"

    # How to collect the input
    variable_name=$(bash_input "Input label:")
    ```
* bash_select
    ```bash
    # Select
    bash_select "Select label:" "Option 1" "Option 2"

    # Select with options from other command (eg. list of files)
    select_options=$(ls -d "path/to/list/files/from/"*)
    bash_select "Select label:" ${select_options}

    # How to collect the selected option:
    variable_name=$(bash_select "Select label:" "Option 1" "Option 2")
    ```

### Output

* bash_title
    ```bash
    bash_title "Title"
    ```
* bash_label
    ```bash
    bash_label "Text that describe what is about to happen"
    ```

### State

* bash_notice
    ```bash
    bash_notice "Text that describe what just happened"
    ```
* bash_skip
    ```bash
    bash_skip

    # With custom text
    bash_skip "Already done"
    ```
* bash_done
    ```bash
    bash_done

    # With custom text
    bash_done "Well done!"
    ```
* bash_fail
    ```bash
    bash_fail

    # With custom text
    bash_fail "Darn..."
    ```

### Formatting

* bash_newline
    ```bash
    bash_newline
    ```
* bash_indent
    ```bash
    echo "Some text to indent" | bash_indent
    ```