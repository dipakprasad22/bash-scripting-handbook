#!/usr/bin/env bash
set -euo pipefail
count=$(journalctl -u nginx --since -5m | awk '$9 ~ /^5../ {c++} END{print c+0}')
if (( count > ${THRESHOLD:-100} )); then
  printf 'High 5xx on %s: %d\n' "$(hostname)" "$count" | mail -s "Nginx alert" ops@example.com
fi
