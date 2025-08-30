#!/usr/bin/env bash
set -euo pipefail
SRC=${1:-/data}
DST=${2:-/backups}
KEY=${BACKUP_KEY:?BACKUP_KEY required}
ts=$(date +%F_%H%M)
mkdir -p "$DST"
archive="$DST/data-$ts.tgz"
tar -C "$SRC" -czf "$archive" .
openssl enc -aes-256-cbc -salt -in "$archive" -out "$archive.enc" -k "$KEY"
rm -f "$archive"
ls -1t "$DST"/*.enc | tail -n +8 | xargs -r rm --
