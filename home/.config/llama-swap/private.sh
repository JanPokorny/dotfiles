#!/usr/bin/env bash
# Decrypts this directory's *.age files with the age key kept in 1Password:
#   private.sh env   -> prints the private variables (KEY=value lines)
#   private.sh peers -> prints the private llama-swap peers (YAML)
# Edit one: private.sh edit env|peers. Without the vault the gateway serves only public peers.
set -euo pipefail
dir=$(cd "$(dirname "$(readlink -f "$0")")" && pwd)
key() { op read --account ibm.ent.1password.com 'op://rsjz2rywqgfp4o3wmwks7qizea/fxulkjkopyluicq7ecnz7hc37q/credential'; }
file() { case "$1" in env) echo "$dir/private.env.age" ;; peers) echo "$dir/private-peers.yaml.age" ;; *) echo "usage: $0 [edit] env|peers" >&2; exit 2 ;; esac; }
decrypt() { age -d -i <(key) "$(file "$1")"; }
if [ "${1:-}" = edit ]; then
	f=$(file "${2:-}")
	tmp=$(mktemp -d)
	trap 'rm -rf "$tmp"' EXIT
	decrypt "$2" > "$tmp/plain"
	"${EDITOR:-vi}" "$tmp/plain"
	age -e -R "$dir/recipients.txt" -o "$f" "$tmp/plain"
else
	decrypt "${1:-}"
fi
