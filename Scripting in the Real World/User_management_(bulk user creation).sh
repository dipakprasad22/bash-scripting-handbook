#!/bin/bash
# ---------------------------------------------------------------
# User Management Script: Bulk User Creation & SSH Key Rotation
# This script demonstrates how to create multiple users and rotate their SSH keys.
# ---------------------------------------------------------------

# 1. Define a list of usernames to create.
usernames=("alice" "bob" "carol")

# 2. Loop through each username in the list.
for username in "${usernames[@]}"; do
    # 3. Check if the user already exists.
    if id "$username" &>/dev/null; then
        echo "User $username already exists. Skipping creation."
    else
        # 4. Create the user with a home directory.
        sudo useradd -m "$username"
        echo "User $username created."
    fi

    # 5. Set up SSH directory for the user.
    ssh_dir="/home/$username/.ssh"
    sudo mkdir -p "$ssh_dir"
    sudo chown "$username":"$username" "$ssh_dir"
    sudo chmod 700 "$ssh_dir"

    # 6. Generate a new SSH key pair for the user.
    # The key is created without a passphrase for automation.
    sudo -u "$username" ssh-keygen -t rsa -b 2048 -f "$ssh_dir/id_rsa" -N ""
    echo "SSH key pair generated for $username."

    # 7. Set permissions for the private and public keys.
    sudo chmod 600 "$ssh_dir/id_rsa"
    sudo chmod 644 "$ssh_dir/id_rsa.pub"

    # 8. Add the public key to authorized_keys for SSH login.
    sudo cp "$ssh_dir/id_rsa.pub" "$ssh_dir/authorized_keys"
    sudo chown "$username":"$username" "$ssh_dir/authorized_keys"
    sudo chmod 600 "$ssh_dir/authorized_keys"
    echo "Public key added to authorized_keys for $username."
done

# 9. Print completion message.
echo "Bulk user creation and SSH key rotation complete."