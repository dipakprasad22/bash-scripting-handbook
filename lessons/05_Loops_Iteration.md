## 📌 Topics Covered
- for loops (for i in list)
- C-style loops (for ((i=0;i<10;i++)))
- while and until loops
- break, continue


## for loops (`for i in list`)

The `for` loop is commonly used to iterate over a list of items. In Bash, this syntax is simple and powerful:

```bash
for fruit in apple banana cherry
do
    echo "I like $fruit"
done
```

**Explanation:**  
- The variable `fruit` takes each value from the list (`apple`, `banana`, `cherry`) one by one.
- The loop body (`echo "I like $fruit"`) runs for each item.

**Real-life example:**  
Suppose you want to process all `.txt` files in a directory:

```bash
for file in *.txt
do
    echo "Processing $file"
    # Add your processing commands here
done
```

---

## C-style loops (`for ((i=0;i<10;i++))`)

Bash supports C-style loops, which are useful for numeric iteration:

```bash
for ((i=0; i<5; i++))
do
    echo "Number: $i"
done
```

**Explanation:**  
- `i=0` initializes the counter.
- `i<5` is the condition to continue looping.
- `i++` increments the counter after each iteration.

**Real-life example:**  
Print even numbers from 0 to 10:

```bash
for ((i=0; i<=10; i+=2))
do
    echo "Even number: $i"
done
```

---

## while and until loops

### while loop

A `while` loop repeats as long as its condition is true:

```bash
count=1
while [ $count -le 5 ]
do
    echo "Count is $count"
    ((count++))
done
```

**Explanation:**  
- The loop runs while `count` is less than or equal to 5.
- The counter is incremented each time.

**Real-life example:**  
Read lines from a file until the end:

```bash
while read line
do
    echo "Line: $line"
done < myfile.txt
```

### until loop

An `until` loop repeats until its condition becomes true:

```bash
num=1
until [ $num -gt 5 ]
do
    echo "Number is $num"
    ((num++))
done
```

**Explanation:**  
- The loop runs until `num` is greater than 5.

---

## break and continue

### break

`break` exits the loop immediately:

```bash
for i in {1..10}
do
    if [ $i -eq 5 ]; then
        echo "Reached 5, stopping loop."
        break
    fi
    echo "Number: $i"
done
```

**Real-life example:**  
Stop processing files if a specific file is found:

```bash
for file in *.log
do
    if [[ $file == "error.log" ]]; then
        echo "Error log found, stopping."
        break
    fi
    echo "Processing $file"
done
```

### continue

`continue` skips the current iteration and moves to the next:

```bash
for i in {1..5}
do
    if [ $i -eq 3 ]; then
        echo "Skipping 3"
        continue
    fi
    echo "Number: $i"
done
```

**Real-life example:**  
Skip empty lines when reading a file:

```bash
while read line
do
    if [ -z "$line" ]; then
        continue
    fi
    echo "Line: $line"
done < myfile.txt
```

---

These loop constructs are essential for automating repetitive tasks in Bash scripts. Practice using them with real files and data to master their usage.