#!/usr/bin/env bash
set -euo pipefail
(out=$(mktemp); (ip a; ip r; (iptables -S || true); (nft list ruleset || true)) > "$out"; cat "$out") | tee "/root/net-snapshot-$(date +%F).txt"
