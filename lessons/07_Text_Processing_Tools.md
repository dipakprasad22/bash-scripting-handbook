# cat, head, tail, wc, cut, sort, uniq
# grep, egrep, regex basics
# awk (field extraction, simple reports)
# sed (find/replace, text edits)
# tr, xargs, paste, join

## 1. cat, head, tail, wc, cut, sort, uniq

### `cat`
Concatenates and displays file contents.
```bash
cat notes.txt
```
*Use case:* Quickly view a file or combine multiple files:
```bash
cat part1.txt part2.txt > combined.txt
```

### `head` and `tail`
Show the first or last lines of a file.
```bash
head -n 5 log.txt    # First 5 lines
tail -n 10 log.txt   # Last 10 lines
```
*Use case:* Check recent log entries:
```bash
tail -f /var/log/syslog
```

### `wc`
Counts lines, words, and characters.
```bash
wc -l report.txt     # Line count
wc -w report.txt     # Word count
```
*Use case:* Find number of files in a directory:
```bash
ls | wc -l
```

### `cut`
Extracts columns from text.
```bash
cut -d',' -f2 users.csv   # Second column from CSV
```
*Use case:* Get usernames from `/etc/passwd`:
```bash
cut -d: -f1 /etc/passwd
```

### `sort` and `uniq`
Sorts lines and removes duplicates.
```bash
sort names.txt | uniq
```
*Use case:* Find unique IPs from a log:
```bash
cut -d' ' -f1 access.log | sort | uniq
```

---

## 2. grep, egrep, regex basics

### `grep`
Searches for patterns in files.
```bash
grep "error" server.log
```
*Use case:* Find lines with "ERROR" (case-insensitive):
```bash
grep -i "error" server.log
```

### `egrep`
Extended grep, supports advanced regex.
```bash
egrep "fail|error" server.log
```
*Use case:* Find lines with "fail" or "error".

### Regex basics
- `^` — Start of line
- `$` — End of line
- `.` — Any character
- `*` — Zero or more
- `[abc]` — a, b, or c

*Example:* Find lines starting with "WARN":
```bash
grep "^WARN" app.log
```

---

## 3. awk (field extraction, simple reports)

### `awk`
Processes and analyzes text files, especially columns.
```bash
awk '{print $2}' data.txt   # Print second column
```
*Use case:* Sum values in a column:
```bash
awk '{sum += $3} END {print sum}' sales.txt
```
*Real-life:* Generate a report of usernames and login counts:
```bash
awk -F: '{print $1,$3}' /etc/passwd
```

---

## 4. sed (find/replace, text edits)

### `sed`
Stream editor for find/replace and text manipulation.
```bash
sed 's/foo/bar/g' file.txt   # Replace "foo" with "bar"
```
*Use case:* Delete blank lines:
```bash
sed '/^$/d' notes.txt
```
*Real-life:* Update config values in-place:
```bash
sed -i 's/oldvalue/newvalue/' config.cfg
```

---

## 5. tr, xargs, paste, join

### `tr`
Translates or deletes characters.
```bash
tr 'a-z' 'A-Z' < names.txt   # Uppercase conversion
```
*Use case:* Remove spaces:
```bash
echo "hello world" | tr -d ' '
```

### `xargs`
Builds and executes command lines from input.
```bash
cat files.txt | xargs rm
```
*Use case:* Find and delete files:
```bash
find . -name "*.tmp" | xargs rm
```

### `paste`
Merges lines from files side by side.
```bash
paste names.txt scores.txt
```
*Use case:* Combine columns from two files.

### `join`
Joins lines from two files on a common field.
```bash
join -1 1 -2 1 users.txt scores.txt
```
*Use case:* Merge user info with scores by username.

---

## Summary

These text processing tools are essential for automating data extraction, reporting, and file manipulation in Linux. Mastering them enables efficient handling of logs, CSVs, configs, and more in real-world scripting tasks.