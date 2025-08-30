#!/usr/bin/env bash
# -------------------------------------------------------------
# Bulk Add Users from CSV Script
# This script reads a CSV file with usernames and groups, and creates users accordingly.
# -------------------------------------------------------------
set -euo pipefail # Strict error handling   
# CSV format: user,group
while IFS=, read -r u g; do # Read user and group from CSV
  id -u "$u" >/dev/null 2>&1 || useradd -m -G "$g" "$u" # Add user if not exists
done < "${1:-users.csv}" # Input CSV file (default: users.csv)
