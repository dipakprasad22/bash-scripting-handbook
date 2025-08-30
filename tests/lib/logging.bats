#!/usr/bin/env bats
@test "logging functions exist" {
  run bash -c '. lib/logging.sh; type -t log'
  [ "$status" -eq 0 ]
}
