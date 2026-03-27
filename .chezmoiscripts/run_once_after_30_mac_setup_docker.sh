#!/bin/bash
set -euo pipefail

echo
echo "### SETUP DOCKER ###"

mkdir -p ~/.docker
test -f ~/.docker/config.json || echo '{}' > ~/.docker/config.json
jq \
  --arg dir "/opt/homebrew/lib/docker/cli-plugins" \
  '.cliPluginsExtraDirs = ([.cliPluginsExtraDirs // [] | .[] | select(. != $dir)] + [$dir])' \
  ~/.docker/config.json >~/.docker/config.json.tmp
mv ~/.docker/config.json.tmp ~/.docker/config.json
