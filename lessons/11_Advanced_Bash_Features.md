## 📌 Topics Covered
- Brace expansion ({a,b}, {1..10})
- Parameter expansion (${var:-default}, ${var}, ${var%%.*})
- String manipulation & substring operations
- Arithmetic & floating-point (with bc)
- Associative arrays (declare -A)


## Brace Expansion

Brace expansion is a powerful Bash feature for generating arbitrary strings. It helps create sequences or lists efficiently.

**Examples:**

```bash
echo file_{a,b,c}.txt
# Output: file_a.txt file_b.txt file_c.txt

echo {1..5}
# Output: 1 2 3 4 5

mkdir dir_{01..03}
# Creates directories: dir_01, dir_02, dir_03
```

**Use Case:**  
Automate repetitive tasks, like creating multiple files or directories.

---

## Parameter Expansion

Parameter expansion lets you manipulate variable values and set defaults.

**Examples:**

```bash
name="Alice"
echo ${name:-"Unknown"}
# Output: Alice

unset name
echo ${name:-"Unknown"}
# Output: Unknown

greeting="Hello World"
echo ${#greeting}
# Output: 11 (length of the string)

filename="report.txt"
echo ${filename%%.*}
# Output: report (removes everything after the first dot)
```

**Use Case:**  
Set default values, get string lengths, or extract parts of variables.

---

## String Manipulation & Substring Operations

Bash provides tools for extracting and modifying strings.

**Examples:**

```bash
text="abcdef"
echo ${text:2:3}
# Output: cde (substring from index 2, length 3)

file="archive.tar.gz"
echo ${file%.gz}
# Output: archive.tar (removes .gz from end)

echo ${file#*.}
# Output: tar.gz (removes up to first dot)
```

**Use Case:**  
Extract file extensions, get substrings, or remove prefixes/suffixes.

---

## Arithmetic & Floating-Point (with `bc`)

Bash supports integer arithmetic natively, but for floating-point, use `bc`.

**Examples:**

```bash
# Integer arithmetic
a=5
b=3
echo $((a + b))
# Output: 8

# Floating-point arithmetic
x=5.5
y=2.3
result=$(echo "$x + $y" | bc)
echo $result
# Output: 7.8
```

**Use Case:**  
Perform calculations in scripts, especially when dealing with decimals.

---

## Associative Arrays

Associative arrays allow you to use strings as keys (like dictionaries in Python).

**Examples:**

```bash
declare -A capitals
capitals[France]="Paris"
capitals[Germany]="Berlin"
capitals[Japan]="Tokyo"

echo ${capitals[Germany]}
# Output: Berlin

# Loop through keys
for country in "${!capitals[@]}"; do
    echo "$country: ${capitals[$country]}"
done
```

**Use Case:**  
Store and retrieve related data, such as configuration settings or mappings.

---

These advanced Bash features make scripts more powerful, efficient, and easier to maintain. Practice each with real tasks to master their usage.