#!/usr/bin/env bash
# Starts llama-swap with the private peers merged in and every key in its env.
# One 1Password approval covers the age key and all op:// references.
set -euo pipefail
dir=$(cd "$(dirname "$(readlink -f "$0")")" && pwd)
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
args=()
if private=$("$dir/private.sh" env) && "$dir/private.sh" peers > "$tmp/private-peers.yaml"; then
	eval "$(sed -n 's/^\([A-Z_]*\)=\(.*\)$/export \1="\2"/p' <<<"$private")"
	export CB_LITELLM_API_KEY="$CB_LITELLM_OP_REF"
	args=(--config-dir "$tmp")
else
	echo "private config unavailable, serving public peers only" >&2
fi
export ETE_LITELLM_API_KEY=op://rsjz2rywqgfp4o3wmwks7qizea/gf5pvk7rveqittwbpwj3sfhccq/credential
op run --account ibm.ent.1password.com -- llama-swap --config "$dir/config.yaml" "${args[@]}" --listen 127.0.0.1:47900 --watch-config
