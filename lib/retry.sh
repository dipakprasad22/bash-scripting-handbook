#!/usr/bin/env bash
retry() { # usage: retry <n> <delay> <cmd...>
  local n=$1 d=$2; shift 2
  for ((i=1; i<=n; i++)); do
    "$@" && return 0
    sleep "$d"
  done
  return 1
}
