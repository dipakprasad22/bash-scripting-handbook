#!/usr/bin/env bash
# Sort TSV by 2nd column numeric descending (e.g., temperatures in January)
LC_ALL=C sort -t"$(printf '\t')" -k2,2nr
