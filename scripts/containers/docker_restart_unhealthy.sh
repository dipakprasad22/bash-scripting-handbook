#!/usr/bin/env bash
set -euo pipefail
for c in $(docker ps --filter health=unhealthy -q); do
  docker logs --tail 200 "$c" | logger -t docker-health
  docker restart "$c"
done
