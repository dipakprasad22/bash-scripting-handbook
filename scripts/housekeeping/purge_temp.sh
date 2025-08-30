#!/usr/bin/env bash
set -euo pipefail
find /var/tmp -type f -mtime +3 -delete
