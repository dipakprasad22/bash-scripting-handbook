#!/usr/bin/env bash
set -euo pipefail
yum -y update || dnf -y upgrade
