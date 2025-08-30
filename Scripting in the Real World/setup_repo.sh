#!/usr/bin/env bash
set -euo pipefail # Strict error handling
NEW_OWNER=${1:?Usage: setup_repo.sh <github-username-or-org>} # New GitHub username or organization
# Update git remote URL to use the new owner
gsed -i "s|YOUR_GITHUB_USERNAME|${NEW_OWNER}|g" README.md  # Update README.md
echo "Badges updated to owner=${NEW_OWNER}" # Notify user
