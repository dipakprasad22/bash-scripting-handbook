#!/usr/bin/env bash
set -euo pipefail
FILE=${1:?file required}
BUCKET=${2:?s3://bucket/path}
aws s3 cp "$FILE" "$BUCKET" --sse AES256
