#!/usr/bin/env bash
set -euo pipefail
SRC=${1:?local path}; DEST=${2:?gs://bucket/path}
gsutil -m rsync -r "$SRC" "$DEST"
