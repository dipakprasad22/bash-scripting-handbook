# Exit codes & truthiness (0 = success)
# if, elif, else
# [ ] vs [[ ]] vs (( ))
# case statements
# String, numeric, and file tests (-f, -d, -z, etc.)

## Exit Codes & Truthiness (0 = Success)

In Bash, every command returns an **exit code** (also called a return status). By convention:
- `0` means **success** (true).
- Any non-zero value means **failure** (false).

You can check the exit code of the last command using `$?`:
```bash
ls /tmp
echo $?  # Prints 0 if ls succeeded
ls /notfound
echo $?  # Prints non-zero if ls failed
```
**Why does this matter?**  
Conditional statements (`if`, `while`, etc.) use exit codes to determine truthiness.

---

## if, elif, else

Conditional logic lets you run code only if certain conditions are met.

**Basic syntax:**
```bash
if command; then
    # runs if command succeeds (exit code 0)
elif other_command; then
    # runs if other_command succeeds
else
    # runs if none of the above succeed
fi
```

**Example:**
```bash
if [ -f "/etc/passwd" ]; then
    echo "File exists!"
elif [ -d "/etc/passwd" ]; then
    echo "It's a directory!"
else
    echo "No such file or directory."
fi
```

---

## [ ] vs [[ ]] vs (( ))

Bash supports several ways to test conditions:

- `[ ... ]` — POSIX test command. Works in all shells.
- `[[ ... ]]` — Bash/Korn shell extended test. Supports more features (like regex, pattern matching).
- `(( ... ))` — Arithmetic evaluation. Used for numeric comparisons.

**Examples:**
```bash
# String comparison
if [ "$name" = "Alice" ]; then echo "Hi Alice!"; fi

# Extended test (pattern matching)
if [[ "$file" == *.txt ]]; then echo "Text file"; fi

# Numeric comparison
if (( count > 10 )); then echo "Count is greater than 10"; fi
```

---

## case Statements

`case` is used for multi-way branching, similar to switch statements in other languages.

**Syntax:**
```bash
case "$variable" in
    pattern1)
        # commands
        ;;
    pattern2)
        # commands
        ;;
    *)
        # default
        ;;
esac
```

**Example:**
```bash
read -p "Enter a fruit: " fruit
case "$fruit" in
    apple|Apple)
        echo "You chose apple."
        ;;
    banana|Banana)
        echo "Banana is great!"
        ;;
    *)
        echo "Unknown fruit."
        ;;
esac
```

---

## String, Numeric, and File Tests (`-f`, `-d`, `-z`, etc.)

Bash provides many **test operators** for different types of checks:

### File Tests
- `-f FILE` — True if FILE exists and is a regular file.
- `-d DIR` — True if DIR exists and is a directory.
- `-e FILE` — True if FILE exists (any type).

**Example:**
```bash
if [ -f "/etc/hosts" ]; then echo "Hosts file exists."; fi
if [ -d "/var/log" ]; then echo "Log directory exists."; fi
```

### String Tests
- `-z STRING` — True if STRING is empty.
- `-n STRING` — True if STRING is not empty.
- `"$a" = "$b"` — True if strings are equal.

**Example:**
```bash
if [ -z "$username" ]; then echo "Username is empty."; fi
if [ "$password" = "secret" ]; then echo "Access granted."; fi
```

### Numeric Tests
- `-eq`, `-ne`, `-gt`, `-lt`, `-ge`, `-le` — Equal, not equal, greater than, less than, etc.

**Example:**
```bash
if [ "$age" -ge 18 ]; then echo "Adult"; else echo "Minor"; fi
```

---

**Real Life Example: File Backup Script**

```bash
#!/bin/bash
backup="/tmp/backup.tar.gz"
if [ -f "$backup" ]; then
    echo "Backup already exists."
else
    tar czf "$backup" /home/user
    if [ $? -eq 0 ]; then
        echo "Backup created successfully."
    else
        echo "Backup failed!"
    fi
fi
```

This script checks if a backup file exists, creates it if not, and reports success or failure using exit codes and file tests.
