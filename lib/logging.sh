#!/usr/bin/env bash
set -o pipefail

LOG_TS() { date -Is; }
log()  { printf '%s [INFO] %s\n'  "$(LOG_TS)" "$*"; }
warn() { printf '%s [WARN] %s\n'  "$(LOG_TS)" "$*" >&2; }
err()  { printf '%s [ERROR] %s\n' "$(LOG_TS)" "$*" >&2; }
