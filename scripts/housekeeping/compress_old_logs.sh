#!/usr/bin/env bash
set -euo pipefail
DIR=${1:-/var/log/myapp}
find "$DIR" -type f -name '*.log' -mtime +1 -exec gzip -9 {} \;
