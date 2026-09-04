#!/usr/bin/env bash
set -euo pipefail

workspace="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
pi_home="${PI_CODING_AGENT_DIR:-${HOME}/.pi/agent}"

# Docker creates a named volume as root. Hand only Pi's state directory to the
# unprivileged devcontainer user.
sudo install -d -o "$(id -u)" -g "$(id -g)" "${pi_home}"

link_config() {
  local source="$1"
  local target="$2"

  if [[ -L "${target}" || ! -e "${target}" ]]; then
    ln -sfn "${source}" "${target}"
  else
    echo "Keeping existing Pi config: ${target}" >&2
  fi
}

link_config "${workspace}/.devcontainer/pi/models.json" "${pi_home}/models.json"
link_config "${workspace}/.devcontainer/pi/settings.json" "${pi_home}/settings.json"

# This repository is the only pre-trusted path. Pi can therefore discover the
# project-local skills described by Lepisma without an initial trust prompt.
if [[ ! -e "${pi_home}/trust.json" ]]; then
  printf '{\n  "%s": true\n}\n' "${workspace}" > "${pi_home}/trust.json"
fi
