#!/usr/bin/env bash
ensure_dir() { mkdir -p "$1"; }
rotate_keep() { ls -1t "$1" | tail -n +$(( $2 + 1 )) | xargs -r rm -f; }
