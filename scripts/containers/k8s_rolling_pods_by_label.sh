#!/usr/bin/env bash
set -euo pipefail
label=${1:?label selector e.g. app=api}
for p in $(kubectl get po -l "$label" -o name); do
  kubectl delete "$p"
done
