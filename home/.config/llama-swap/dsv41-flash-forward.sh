#!/usr/bin/env bash
# Port-forwards dam-dev's DeepSeek to 127.0.0.1:47917; cluster details are private.
set -euo pipefail
# Reconnects in-process, so a dropped pod stream needs no daemon restart.
# kubectl can also outlive a lost stream, hence the probe through the tunnel.
# Only 3 failed probes in a row count: one slow probe under load is no reason to drop every request.
while :; do
	kubectl --context "$DSV41_KUBE_CONTEXT" -n "$DSV41_NAMESPACE" port-forward "svc/$DSV41_SERVICE" 47917:8000 &
	fails=0
	while kill -0 $! 2>/dev/null && [ $fails -lt 3 ]; do
		sleep 10
		if curl -skf --max-time 15 -o /dev/null https://127.0.0.1:47917/health; then fails=0; else fails=$((fails + 1)); fi
	done
	kill $! 2>/dev/null || true
	wait $! || true
	sleep 1
done
