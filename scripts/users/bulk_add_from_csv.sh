#!/usr/bin/env bash
set -euo pipefail
# CSV format: user,group
while IFS=, read -r u g; do
  id -u "$u" >/dev/null 2>&1 || useradd -m -G "$g" "$u"
done < "${1:-users.csv}"
