## 📌 Topics Covered
- Working with files (cp, mv, rm, stat)
- Permissions (chmod, chown, umask)
- find with -exec and -print0 | xargs -0
- Archiving & compression (tar, gzip, zip)
- Background jobs (&), jobs, fg, bg, kill
- Signals & traps (trap 'cleanup' EXIT)


## Working with Files

### Copy, Move, Remove, and Inspect Files

- **cp**: Copy files or directories.
    ```bash
    cp source.txt destination.txt
    cp -r dir1/ dir2/
    ```
    *Example*: Backing up a config file before editing:
    ```bash
    cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
    ```

- **mv**: Move or rename files/directories.
    ```bash
    mv oldname.txt newname.txt
    mv file.txt /tmp/
    ```
    *Example*: Organizing downloads:
    ```bash
    mv ~/Downloads/*.pdf ~/Documents/PDFs/
    ```

- **rm**: Remove files or directories.
    ```bash
    rm file.txt
    rm -r folder/
    rm -rf folder/  # force delete, use with caution!
    ```
    *Example*: Cleaning up temporary files:
    ```bash
    rm -rf /tmp/myapp/
    ```

- **stat**: Display detailed file information.
    ```bash
    stat file.txt
    ```
    *Example*: Checking last modification time:
    ```bash
    stat -c %y report.docx
    ```

---

## Permissions

### chmod, chown, umask

- **chmod**: Change file permissions.
    ```bash
    chmod 644 file.txt      # rw-r--r--
    chmod +x script.sh      # add execute permission
    chmod -R 755 mydir/     # recursive
    ```
    *Example*: Making a script executable:
    ```bash
    chmod +x deploy.sh
    ```

- **chown**: Change file owner/group.
    ```bash
    chown user:group file.txt
    chown -R www-data:www-data /var/www/html/
    ```
    *Example*: Fixing web server permissions:
    ```bash
    sudo chown -R www-data:www-data /var/www/html/
    ```

- **umask**: Set default permissions for new files.
    ```bash
    umask 022   # new files: 644, new dirs: 755
    ```
    *Example*: Ensuring group write access:
    ```bash
    umask 002   # new files: 664, new dirs: 775
    ```

---

## Finding Files

### find with -exec and -print0 | xargs -0

- **find**: Search for files/directories.
    ```bash
    find /path -name "*.log"
    ```

- **-exec**: Run a command on each result.
    ```bash
    find . -type f -name "*.tmp" -exec rm {} \;
    ```
    *Example*: Remove all `.tmp` files in a project.

- **-print0 | xargs -0**: Handle filenames with spaces.
    ```bash
    find . -name "*.jpg" -print0 | xargs -0 cp -t /backup/photos/
    ```
    *Example*: Copy all images to a backup folder.

---

## Archiving & Compression

### tar, gzip, zip

- **tar**: Archive files/directories.
    ```bash
    tar -cvf archive.tar folder/
    tar -xvf archive.tar
    ```

- **gzip**: Compress files.
    ```bash
    gzip file.txt
    gunzip file.txt.gz
    ```

- **zip/unzip**: Create/extract zip archives.
    ```bash
    zip archive.zip file1 file2
    unzip archive.zip
    ```
    *Example*: Backing up a website:
    ```bash
    tar -czvf website-backup.tar.gz /var/www/html/
    ```

---

## Background Jobs & Process Management

### &, jobs, fg, bg, kill

- **&**: Run a command in the background.
    ```bash
    long_running_task.sh &
    ```

- **jobs**: List background jobs.
    ```bash
    jobs
    ```

- **fg**: Bring a job to the foreground.
    ```bash
    fg %1
    ```

- **bg**: Resume a stopped job in the background.
    ```bash
    bg %1
    ```

- **kill**: Terminate a process.
    ```bash
    kill 1234         # by PID
    kill -9 1234      # force kill
    ```
    *Example*: Stopping a stuck process:
    ```bash
    kill -9 $(pgrep myapp)
    ```

---

## Signals & Traps

### trap 'cleanup' EXIT

- **Signals**: Notifications sent to processes (e.g., SIGINT, SIGTERM).
- **trap**: Run commands when receiving signals.

    ```bash
    trap 'echo Cleaning up...; rm -f /tmp/myfile' EXIT
    ```

    *Example*: Ensure temporary files are deleted when a script exits:
    ```bash
    #!/bin/bash
    trap 'rm -f /tmp/tempfile' EXIT
    touch /tmp/tempfile
    echo "Doing work..."
    # When script ends, tempfile is removed
    ```

---

These commands and concepts are essential for managing files, permissions, searching, archiving, and controlling processes in Linux. Practice each with real files and scripts to build confidence!