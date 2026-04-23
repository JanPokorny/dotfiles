#!/bin/bash
set -euxo pipefail

command -v fc-cache || exit 0

echo "### UPDATE FONT CACHE ###"
fc-cache -v -f "$HOME/.local/share/fonts"
