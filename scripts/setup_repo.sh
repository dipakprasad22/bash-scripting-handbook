#!/usr/bin/env bash
set -euo pipefail
NEW_OWNER=${1:?Usage: setup_repo.sh <github-username-or-org>}
gsed -i "s|YOUR_GITHUB_USERNAME|${NEW_OWNER}|g" README.md
echo "Badges updated to owner=${NEW_OWNER}"
