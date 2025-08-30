# Bash Scripting Handbook: Basic → Advanced

Learn Bash by building real-world automations used by sysadmins and DevOps. This repo is production-friendly: strict-mode templates, libraries, tests, and CI.

[![ShellCheck](https://github.com/dipakprasad22/bash-scripting-handbook/actions/workflows/shellcheck.yml/badge.svg?branch=main)](https://github.com/dipakprasad22/bash-scripting-handbook/actions/workflows/shellcheck.yml)
[![shfmt](https://github.com/dipakprasad22/bash-scripting-handbook/actions/workflows/shfmt.yml/badge.svg?branch=main)](https://github.com/dipakprasad22/bash-scripting-handbook/actions/workflows/shfmt.yml)
[![bats](https://github.com/dipakprasad22/bash-scripting-handbook/actions/workflows/bats.yml/badge.svg?branch=main)](https://github.com/dipakprasad22/bash-scripting-handbook/actions/workflows/bats.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](CONTRIBUTING.md)

> Replace `dipakprasad22` in the badges above after you publish the repo, or run `scripts/setup_repo.sh yourusername`.

## Quick start

```bash
# Clone
git clone https://github.com/dipakprasad22/bash-scripting-handbook.git
cd bash-scripting-handbook

# Install tooling (Debian/Ubuntu)
sudo apt-get update && sudo apt-get install -y shellcheck shfmt bats

# Lint & format
make lint
make fmt

# Run tests
make test
```

## Learn by topic
See [`lessons/`](lessons/) for structured guides and [`scripts/`](scripts/) for runnable examples.

## Who is this for?
- New engineers learning Bash fundamentals
- SysAdmins/DevOps needing robust, shareable automation

## Contributing
See [CONTRIBUTING.md](CONTRIBUTING.md). Please run `make precommit` before pushing.

## License
MIT — see [LICENSE](LICENSE).
