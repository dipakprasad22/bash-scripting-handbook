#!/usr/bin/env bats
@test "math_eval outputs 3 decimals" {
  run bash -c 'echo "5/2" | scripts/examples/math_eval_bc.sh'
  [ "$status" -eq 0 ]
  [[ "${output}" =~ ^[0-9]+\.[0-9]{3}$ ]]
}
