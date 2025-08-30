# set -e, set -u, set -o pipefail
# Defensive coding (: "${VAR:?error}")
# Traps for cleanup (trap 'rm -f /tmp/file' EXIT)
# Logging & debugging (set -x, PS4)

## set -e, set -u, set -o pipefail

These Bash options help make scripts safer and more predictable:

- `set -e`: Exit immediately if any command exits with a non-zero status.  
    **Example:**  
    ```bash
    set -e
    cp file1.txt /tmp/
    rm file2.txt   # If this fails, the script stops here.
    echo "Done"    # Only runs if all previous commands succeed.
    ```
    *Use case:* Prevents scripts from continuing after errors, which could cause data loss or inconsistent state.

- `set -u`: Treat unset variables as errors and exit immediately.  
    **Example:**  
    ```bash
    set -u
    echo "User: $USERNAME"  # If USERNAME is not set, script exits with error.
    ```
    *Use case:* Avoids bugs from typos or missing environment variables.

- `set -o pipefail`: Causes a pipeline to return the exit status of the last command to exit with a non-zero status.  
    **Example:**  
    ```bash
    set -o pipefail
    grep "pattern" file.txt | sort | head -n 1
    ```
    If `grep` fails (e.g., file not found), the whole pipeline fails.

## Defensive Coding (: "${VAR:?error}")

This pattern checks if a variable is set and non-empty before using it:

```bash
: "${DB_HOST:?DB_HOST is required but not set}"
```
If `DB_HOST` is unset or empty, the script exits with an error message.

**Real-life example:**  
```bash
#!/bin/bash
: "${INPUT_FILE:?Missing input file}"
cat "$INPUT_FILE"
```
*Use case:* Ensures required variables are provided, preventing accidental mistakes.

## Traps for Cleanup (trap 'rm -f /tmp/file' EXIT)

Traps let you run commands when the script exits or receives signals. Useful for cleanup:

```bash
trap 'rm -f /tmp/mytempfile' EXIT
touch /tmp/mytempfile
# ... script logic ...
```
When the script ends (normally or due to error), `/tmp/mytempfile` is deleted.

**Real-life example:**  
```bash
#!/bin/bash
trap 'echo "Cleaning up..."; rm -f /tmp/session.lock' EXIT
touch /tmp/session.lock
# ... do work ...
```
*Use case:* Prevents leftover files, releases locks, or other cleanup tasks.

## Logging & Debugging (set -x, PS4)

- `set -x`: Prints each command before executing it, useful for debugging.
- `PS4`: Customizes the debug prompt.

**Example:**
```bash
export PS4='+ $BASH_SOURCE:$LINENO:${FUNCNAME[0]}: '
set -x
do_something() {
    echo "Working..."
}
do_something
set +x
```
Output shows each command with file, line, and function info.

*Use case:* Trace script execution, diagnose issues, and understand flow.

---

**Summary:**  
Using these techniques, you can write Bash scripts that are robust, safe, and easier to debug. Always validate inputs, handle errors, clean up resources, and use logging to track what your script is doing.