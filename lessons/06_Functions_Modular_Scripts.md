# Defining and calling functions
# Returning values (return vs echo)
# Local vs global variables
# Organizing reusable functions into libraries (source file.sh)

## Defining and Calling Functions

In Bash, functions allow you to group commands and reuse code. You define a function using the following syntax:

```bash
my_function() {
    echo "Hello from my_function!"
}
```

To call the function, simply use its name:

```bash
my_function
```

**Example:**  
Suppose you want to greet users by name:

```bash
greet_user() {
    echo "Welcome, $1!"
}

greet_user "Alice"
greet_user "Bob"
```

Here, `$1` refers to the first argument passed to the function.

---

## Returning Values (return vs echo)

Bash functions can "return" values in two ways:

1. **Using `return`**:  
     The `return` statement sets the function's exit status (an integer between 0 and 255), not a string value.

     ```bash
     is_even() {
         if (( $1 % 2 == 0 )); then
             return 0
         else
             return 1
         fi
     }

     is_even 4
     if [ $? -eq 0 ]; then
         echo "Number is even"
     else
         echo "Number is odd"
     fi
     ```

2. **Using `echo`**:  
     To get string or numeric output, use `echo` and command substitution.

     ```bash
     add() {
         echo $(($1 + $2))
     }

     result=$(add 5 7)
     echo "Sum is $result"
     ```

---

## Local vs Global Variables

By default, variables in Bash are global. To limit a variable's scope to a function, use `local`.

**Global variable example:**

```bash
name="GlobalName"

change_name() {
    name="LocalName"
}

change_name
echo $name  # Output: LocalName
```

**Local variable example:**

```bash
name="GlobalName"

change_name() {
    local name="LocalName"
    echo $name  # Output: LocalName
}

change_name
echo $name  # Output: GlobalName
```

Using `local` prevents accidental modification of variables outside the function.

---

## Organizing Reusable Functions into Libraries (`source file.sh`)

For larger scripts, it's best to organize functions into separate files (libraries). You can then include them using `source` or `.`.

**Example:**

Create a file called `math_utils.sh`:

```bash
add() {
    echo $(($1 + $2))
}

multiply() {
    echo $(($1 * $2))
}
```

In your main script:

```bash
source math_utils.sh

sum=$(add 3 4)
product=$(multiply 3 4)
echo "Sum: $sum, Product: $product"
```

This approach keeps your scripts modular and easier to maintain.

---

**Real-life Example:**  
Suppose you have a deployment script that needs to log messages and check server status. You can create a `utils.sh` library:

```bash
# utils.sh
log_info() {
    echo "[INFO] $1"
}

check_server() {
    ping -c 1 $1 &>/dev/null
    if [ $? -eq 0 ]; then
        echo "up"
    else
        echo "down"
    fi
}
```

In your main script:

```bash
source utils.sh

log_info "Starting deployment"
status=$(check_server "example.com")
log_info "Server status: $status"
```

This makes your scripts cleaner and encourages code reuse.