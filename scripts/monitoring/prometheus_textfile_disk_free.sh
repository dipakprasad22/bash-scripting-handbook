#!/usr/bin/env bash
set -euo pipefail
OUT=${1:-/var/lib/node_exporter/textfile/disk.prom}
mkdir -p "$(dirname "$OUT")"
echo "disk_free_bytes $(df --output=avail -B1 / | tail -1)" > "$OUT"
