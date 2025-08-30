#!/usr/bin/env bash
set -euo pipefail
USER=${1:?username required}
KEY=${2:?public key file required}
install -d -m 700 -o "$USER" -g "$USER" "/home/$USER/.ssh"
install -m 600 -o "$USER" -g "$USER" "$KEY" "/home/$USER/.ssh/authorized_keys"
