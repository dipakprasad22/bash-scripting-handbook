# Declaring variables (local, global, readonly)
# Special variables ($?, $$, $@, $*, $#, $!)
# Quoting: single ', double ", backticks `, $()
# Command substitution & arithmetic expansion $(( ))
# Arrays & associative arrays (Bash-only)

## Declaring Variables in Bash

Variables in Bash are used to store data for later use. You can declare variables as local (within functions), global (available throughout the script), or readonly (cannot be changed after assignment).

### Global Variables

```bash
name="Alice"
echo "Hello, $name"
```
*Global variables* are accessible anywhere in the script.

### Local Variables

Local variables are declared inside functions using the `local` keyword.

```bash
greet() {
    local name="Bob"
    echo "Hello, $name"
}
greet
```
*Local variables* exist only within the function.

### Readonly Variables

Readonly variables cannot be modified after assignment.

```bash
readonly pi=3.14159
pi=3   # Error: cannot assign to readonly variable
```

---

## Special Variables

Bash provides several special variables for scripting:

- `$?` — Exit status of the last command.
- `$$` — PID of the current shell.
- `$@` — All script arguments, as separate words.
- `$*` — All script arguments, as a single word.
- `$#` — Number of script arguments.
- `$!` — PID of the last background command.

**Example:**

```bash
echo "Script name: $0"
echo "First arg: $1"
echo "All args: $@"
echo "Arg count: $#"
ls /notfound
echo "Exit status: $?"
sleep 10 &
echo "Background PID: $!"
```

---

## Quoting in Bash

Quoting controls how Bash interprets special characters.

- **Single quotes `'...'`**: Everything is literal.
- **Double quotes `"..."`**: Expands variables and commands.
- **Backticks `` `...` ``**: Command substitution (deprecated).
- **Dollar-parentheses `$()`**: Modern command substitution.

**Examples:**

```bash
echo 'User is $USER'      # Prints: User is $USER
echo "User is $USER"      # Prints: User is alice (if USER=alice)
echo "Date: $(date)"      # Prints: Date: <current date>
```

---

## Command Substitution & Arithmetic Expansion

- **Command substitution**: Replace with output of a command.
    - `result=$(ls -l)`
- **Arithmetic expansion**: Evaluate math expressions.
    - `sum=$((2 + 3))`

**Example:**

```bash
files=$(ls *.txt)
count=$((2 * 5))
echo "Files: $files"
echo "Count: $count"
```

---

## Arrays & Associative Arrays (Bash-only)

Arrays store multiple values in one variable.

### Indexed Arrays

```bash
fruits=("apple" "banana" "cherry")
echo "${fruits[1]}"      # banana
echo "${fruits[@]}"      # apple banana cherry
```

### Associative Arrays

Associative arrays use named keys (Bash 4+).

```bash
declare -A capitals
capitals[France]="Paris"
capitals[Japan]="Tokyo"
echo "${capitals[France]}"   # Paris
```

---

## Real-Life Examples

**1. Processing Arguments**

```bash
echo "You passed $# arguments: $@"
for arg in "$@"; do
    echo "Processing $arg"
done
```

**2. Summing Numbers**

```bash
sum=0
for num in "$@"; do
    sum=$((sum + num))
done
echo "Total: $sum"
```

**3. Using Arrays for File Lists**

```bash
files=($(ls *.log))
for file in "${files[@]}"; do
    echo "Archiving $file"
done
```

**4. Associative Array for User Roles**

```bash
declare -A roles
roles[alice]="admin"
roles[bob]="user"
for user in "${!roles[@]}"; do
    echo "$user is a ${roles[$user]}"
done
```

---

These concepts are essential for writing robust, maintainable Bash scripts. Practice using variables, quoting, and arrays to automate tasks and handle data efficiently.