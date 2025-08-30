# Argument parsing with getopts
# Usage/help functions
# Subcommands (like git add, git commit)
# Exit codes & error messages

## Argument Parsing with `getopts`

`getopts` is a built-in Bash utility for parsing short command-line options (like `-h`, `-f filename`). It helps scripts handle user input in a standardized way.

**Example:**

```bash
#!/bin/bash

while getopts "f:v" opt; do
    case $opt in
        f) FILE="$OPTARG" ;;
        v) VERBOSE=true ;;
        \?) echo "Invalid option: -$OPTARG" >&2; exit 1 ;;
    esac
done

echo "File: $FILE"
if [ "$VERBOSE" = true ]; then
    echo "Verbose mode enabled"
fi
```

**Explanation:**  
- `getopts "f:v"` means `-f` expects an argument, `-v` does not.
- `$OPTARG` holds the value for options that require arguments.
- The `case` statement handles each option.

---

## Usage/Help Functions

Scripts should provide clear usage instructions when run with `-h` or with incorrect arguments.

**Example:**

```bash
usage() {
    echo "Usage: $0 [-f filename] [-v]"
    echo "  -f filename   Specify input file"
    echo "  -v            Enable verbose mode"
    exit 1
}

while getopts "f:v" opt; do
    case $opt in
        h) usage ;;
        # ... other options ...
    esac
done
```

**Explanation:**  
- The `usage` function prints help and exits.
- Add a `-h` option to trigger help.

---

## Subcommands (like `git add`, `git commit`)

Many CLI tools use subcommands to organize functionality. In Bash, this is often done by checking the first argument.

**Example:**

```bash
#!/bin/bash

case "$1" in
    add)
        echo "Adding item..."
        # add logic here
        ;;
    remove)
        echo "Removing item..."
        # remove logic here
        ;;
    *)
        echo "Unknown subcommand: $1"
        echo "Usage: $0 {add|remove}"
        exit 1
        ;;
esac
```

**Explanation:**  
- `$1` is the first argument (the subcommand).
- Each subcommand triggers different logic.

---

## Exit Codes & Error Messages

Scripts should exit with meaningful codes:  
- `0` for success  
- Non-zero for errors

**Example:**

```bash
if [ ! -f "$FILE" ]; then
    echo "Error: File not found: $FILE" >&2
    exit 2
fi

# Success
exit 0
```

**Explanation:**  
- `exit 2` signals a specific error (file not found).
- Error messages go to `stderr` (`>&2`).

---

**Summary:**  
- Use `getopts` for option parsing.
- Provide a usage/help function.
- Organize logic with subcommands.
- Use exit codes and error messages for robust scripts.

These patterns make your Bash scripts professional, user-friendly, and maintainable.