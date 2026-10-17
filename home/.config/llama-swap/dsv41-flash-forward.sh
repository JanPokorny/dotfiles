#!/usr/bin/env bash
# Port-forwards dam-dev's DeepSeek to 127.0.0.1:47917; cluster details are private.
set -euo pipefail
dir=$(cd "$(dirname "$(readlink -f "$0")")" && pwd)
eval "$("$dir/private.sh" env | sed -n 's/^\([A-Z0-9_]*\)=\(.*\)$/\1="\2"/p')"
exec kubectl --context "$DSV41_KUBE_CONTEXT" -n "$DSV41_NAMESPACE" port-forward "svc/$DSV41_SERVICE" 47917:8000
