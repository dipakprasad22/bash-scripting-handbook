#!/usr/bin/env bash
set -euo pipefail
host=${1:-localhost}; port=${2:-80}
if ! timeout 3 bash -c "cat < /dev/null > /dev/tcp/${host}/${port}" 2>/dev/null; then
  echo "Port ${host}:${port} not listening" | logger -t port-health
  exit 1
fi
