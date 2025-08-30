#!/usr/bin/env bash
set -euo pipefail
FILE=${1:?file required}
DEST=${2:?s3://bucket/path}
aws s3 cp "$FILE" "$DEST" --sse AES256
