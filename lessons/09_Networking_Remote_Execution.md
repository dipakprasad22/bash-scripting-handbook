## 📌 Topics Covered
- curl / wget basics
- nc / ss for port checks
- ssh and scp automation
- Remote command execution (ssh user@host "cmd")


## curl / wget Basics

`curl` and `wget` are command-line tools for transferring data over network protocols like HTTP, HTTPS, and FTP.

- **curl**: Flexible, supports many protocols, can send custom headers, POST data, and more.
    - Example: Download a web page
        ```bash
        curl https://example.com
        ```
    - Example: Save output to a file
        ```bash
        curl -o page.html https://example.com
        ```
    - Example: Send POST data
        ```bash
        curl -X POST -d "name=John" https://httpbin.org/post
        ```

- **wget**: Focused on downloading files, supports recursive downloads.
    - Example: Download a file
        ```bash
        wget https://example.com/file.zip
        ```
    - Example: Download an entire website (recursively)
        ```bash
        wget --recursive --no-parent https://example.com/
        ```

## nc / ss for Port Checks

Checking if a network port is open is useful for troubleshooting connectivity.

- **nc (netcat)**: Reads/writes data across network connections.
    - Example: Check if port 80 is open on a host
        ```bash
        nc -zv example.com 80
        ```
        Output will indicate if the port is open or closed.

- **ss**: Displays socket statistics, useful for checking local ports.
    - Example: List all listening TCP ports
        ```bash
        ss -tuln
        ```
    - Example: Check if a specific port is listening
        ```bash
        ss -tuln | grep 22
        ```

## ssh and scp Automation

`ssh` is used for secure remote login, and `scp` for secure file transfer.

- **ssh**: Connect to remote servers securely.
    - Example: Login to a remote server
        ```bash
        ssh user@remote_host
        ```
    - Example: Run a command remotely
        ```bash
        ssh user@remote_host "uptime"
        ```

- **scp**: Copy files between local and remote machines.
    - Example: Copy a file to a remote server
        ```bash
        scp localfile.txt user@remote_host:/home/user/
        ```
    - Example: Copy a file from a remote server
        ```bash
        scp user@remote_host:/home/user/remotefile.txt ./
        ```

- **Automation Tips**:
    - Use SSH keys for passwordless authentication:
        ```bash
        ssh-keygen -t rsa -b 4096
        ssh-copy-id user@remote_host
        ```
    - Automate multiple commands with scripts:
        ```bash
        ssh user@remote_host << EOF
        sudo apt update
        sudo apt install nginx -y
        EOF
        ```

## Remote Command Execution (ssh user@host "cmd")

You can execute commands on remote machines directly from your local shell.

- **Single command execution**:
    ```bash
    ssh user@remote_host "ls -l /var/www"
    ```
    This runs `ls -l /var/www` on the remote host and prints the output locally.

- **Multiple commands**:
    ```bash
    ssh user@remote_host "cd /var/www && git pull"
    ```

- **Using in scripts**:
    Automate server updates across multiple hosts:
    ```bash
    for host in server1 server2 server3; do
        ssh user@$host "sudo apt update && sudo apt upgrade -y"
    done
    ```

**Real-life Example**:  
A DevOps engineer needs to deploy code to several web servers. They use `scp` to copy files and `ssh` to restart services:
```bash
scp app.tar.gz user@web1:/var/www/
ssh user@web1 "tar -xzf /var/www/app.tar.gz && systemctl restart nginx"
```

These tools are essential for network troubleshooting, automation, and remote management in professional environments.