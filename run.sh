#!/usr/bin/env bash
set -euo pipefail

workspace="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "${workspace}"

if ! command -v pi >/dev/null 2>&1; then
  echo "pi is not installed. Reopen this repository in its devcontainer first." >&2
  exit 127
fi

exec pi --approve "$@"
