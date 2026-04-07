#!/bin/bash
set -euxo pipefail

echo ""
echo "### INSTALL BREW ###"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
