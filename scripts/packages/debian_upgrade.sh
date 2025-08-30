#!/usr/bin/env bash
set -euo pipefail
apt-get update && apt-get -y upgrade >> /var/log/patch-$(date +%F).log 2>&1
