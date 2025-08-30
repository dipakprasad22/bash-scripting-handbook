## 📌 Topics Covered
- What is a shell?  
- Difference between Bash and POSIX `sh`  
- Interactive vs Non-interactive shell  
- Login vs Non-login shell  
- Environment variables (`PATH`, `HOME`, etc.)  
- How commands are executed (search path, builtins vs binaries)  


## What is a Shell? What is Bash vs POSIX sh?

A **shell** is a program that lets you interact with your operating system by typing commands. It acts as an interface between you and the computer, interpreting what you type and running programs for you.

- **Bash** (Bourne Again SHell) is one of the most popular Unix/Linux shells. It adds many features and improvements over older shells.
- **POSIX sh** refers to the standard shell defined by the POSIX specification. It's simpler and more portable, but lacks some advanced features found in Bash.

**Example:**  
If you open a terminal and type `ls`, the shell runs the `ls` command to list files.

| Shell Type | Example Usage | Features |
|------------|--------------|----------|
| POSIX sh   | `/bin/sh`    | Basic scripting, portable |
| Bash       | `/bin/bash`  | Advanced scripting, command history, tab completion |

---

## Interactive vs Non-interactive Shell

- **Interactive Shell:** You type commands and get immediate feedback. Used when you open a terminal.
- **Non-interactive Shell:** Runs scripts or commands automatically, without user input. Used when running shell scripts.

**Example:**  
- Interactive: You open Terminal and type `echo Hello`.
- Non-interactive: You run a script: `bash myscript.sh`.

---

## Login vs Non-login Shell

- **Login Shell:** Started when you log in to your system (via SSH or console). Reads configuration files like `.profile` or `.bash_profile`.
- **Non-login Shell:** Started when you open a new terminal window or run a script. Reads `.bashrc` for Bash.

**Example:**  
- SSH into a server: starts a login shell.
- Open a new terminal tab: starts a non-login shell.

---

## Environment Variables (PATH, HOME, etc.)

Environment variables are key-value pairs that affect how processes run.

- `PATH`: List of directories to search for commands.
- `HOME`: Your home directory.
- `USER`: Your username.

**Example:**  
```bash
echo $PATH
echo $HOME
```
If you type `ls`, the shell looks for `ls` in directories listed in `PATH`.

---

## How Commands Are Executed (Search Path, Builtins vs Binaries)

When you type a command:

1. The shell checks if it's a **builtin** (like `cd`, `echo`).
2. If not, it searches for a binary in the directories listed in `PATH`.

**Example:**  
- `cd` is a builtin: the shell handles it directly.
- `ls` is a binary: the shell finds `/bin/ls` and runs it.

**Real Life Example:**  
If you type `python`, the shell searches each directory in `PATH` for an executable named `python`. If you type `export`, the shell knows it's a builtin and handles it itself.

---

**Summary Table:**

| Concept                | Real Life Example                |
|------------------------|----------------------------------|
| Shell                  | Typing commands in Terminal      |
| Bash vs POSIX sh       | Bash for advanced scripts        |
| Interactive Shell      | Typing `ls` in Terminal          |
| Non-interactive Shell  | Running `bash script.sh`         |
| Login Shell            | SSH into server                  |
| Non-login Shell        | Opening new terminal tab         |
| Environment Variables  | `echo $PATH`                     |
| Builtin vs Binary      | `cd` (builtin), `ls` (binary)    |
