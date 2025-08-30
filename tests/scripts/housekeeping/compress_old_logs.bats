#!/usr/bin/env bats
setup() { TMPDIR=$(mktemp -d); touch "$TMPDIR/a.log"; }
teardown() { rm -rf "$TMPDIR"; }
@test "compresses .log files" {
  run bash scripts/housekeeping/compress_old_logs.sh "$TMPDIR"
  [ "$status" -eq 0 ]
  [ -e "$TMPDIR/a.log.gz" ]
}
