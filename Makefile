SHELL := /usr/bin/env bash

.PHONY: lint fmt test ci precommit

lint:
	@echo "→ ShellCheck" && shellcheck -S style $(shell git ls-files '*.sh')

fmt:
	@echo "→ shfmt" && shfmt -w -i 2 -ci -sr $(shell git ls-files '*.sh')

test:
	@echo "→ bats" && bats -r tests

precommit: fmt lint test

ci: lint test
