## 📌 Topics Covered
- Reading input (read, read -p, read -s)
- Writing output (echo, printf)
- Redirection (>, >>, 2>, &>)
- Here-documents (<<EOF) and here-strings (<<<)


## Reading Input

### `read`
The `read` command is used to take input from the user. By default, it reads a line from standard input and assigns it to a variable.

**Example:**
```bash
echo "Enter your name:"
read name
echo "Hello, $name!"
```
This script prompts the user for their name and greets them.

### `read -p`
The `-p` option lets you display a prompt directly with `read`.

**Example:**
```bash
read -p "Enter your age: " age
echo "You are $age years old."
```
This is more concise and user-friendly.

### `read -s`
The `-s` option hides the input (useful for passwords).

**Example:**
```bash
read -sp "Enter your password: " password
echo
echo "Password received."
```
The password is not shown as the user types.

---

## Writing Output

### `echo`
`echo` prints text to the terminal.

**Example:**
```bash
echo "Welcome to Bash scripting!"
```

### `printf`
`printf` offers more control over formatting.

**Example:**
```bash
printf "Name: %s\nAge: %d\n" "$name" "$age"
```
This prints the name and age with specific formatting.

---

## Redirection

### `>`
Redirects output to a file, overwriting it.

**Example:**
```bash
echo "Log entry" > logfile.txt
```

### `>>`
Appends output to a file.

**Example:**
```bash
echo "Another entry" >> logfile.txt
```

### `2>`
Redirects error messages (stderr) to a file.

**Example:**
```bash
ls /notfound 2> errors.txt
```

### `&>`
Redirects both stdout and stderr to a file.

**Example:**
```bash
./myscript.sh &> output.log
```

---

## Here-Documents and Here-Strings

### Here-Document (`<<EOF`)
Allows you to provide multiline input to a command.

**Example:**
```bash
cat <<EOF
This is line 1
This is line 2
EOF
```
Everything between `<<EOF` and `EOF` is sent to `cat`.

### Here-String (`<<<`)
Sends a single string as input.

**Example:**
```bash
grep "hello" <<< "hello world"
```
This searches for "hello" in the provided string.

---

These input/output techniques are essential for interactive scripts, logging, error handling, and automating tasks in real-world Bash scripting.