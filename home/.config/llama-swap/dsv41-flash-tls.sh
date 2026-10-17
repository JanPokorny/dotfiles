#!/usr/bin/env bash
# Fetches the vLLM key and the cluster's service CA, then serves the Caddy hop.
set -euo pipefail
dir=$(cd "$(dirname "$(readlink -f "$0")")" && pwd)
eval "$("$dir/private.sh" env | sed -n 's/^\([A-Z0-9_]*\)=\(.*\)$/\1="\2"/p')"
tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT
k() { kubectl --context "$DSV41_KUBE_CONTEXT" -n "$DSV41_NAMESPACE" "$@"; }
k get configmap openshift-service-ca.crt -o jsonpath='{.data.service-ca\.crt}' > "$tmp/service-ca.crt"
DSV41_KEY=$(k get secret "$DSV41_SERVICE-api-key" -o jsonpath='{.data.key}' | base64 -d)
export DSV41_KEY DSV41_CA="$tmp/service-ca.crt" DSV41_TLS_NAME
caddy run --config "$dir/Caddyfile" --adapter caddyfile
