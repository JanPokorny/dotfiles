#!/usr/bin/env bash
# Starts llama-swap with the private peers merged in. Runs under `fnox exec -P gateway`: the keys are in env,
# PRIVATE_PEERS_YAML is a 0600 temp file fnox deletes on exit.
set -euo pipefail
dir=$(cd "$(dirname "$(readlink -f "$0")")" && pwd)
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
ln -s "$PRIVATE_PEERS_YAML" "$tmp/private-peers.yaml"
llama-swap --config "$dir/config.yaml" --config-dir "$tmp" --listen 127.0.0.1:47900 --watch-config
