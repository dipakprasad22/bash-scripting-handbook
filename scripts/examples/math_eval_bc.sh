#!/usr/bin/env bash
read -r expr
printf '%.3f\n' "$(echo "scale=10; $expr" | bc -l)"
