#!/usr/bin/env bash
set -euo pipefail
for h in "$@"; do
  if ! timeout 3 bash -c "cat < /dev/null > /dev/tcp/${h}/443" 2>/dev/null; then
    echo "Cannot reach $h:443" | logger -t netcheck
  fi
done
