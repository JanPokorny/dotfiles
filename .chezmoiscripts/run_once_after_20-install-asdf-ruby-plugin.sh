#!/bin/bash

echo
echo "### INSTALL ASDF PLUGINS ###"

echo "# Ruby"
/home/linuxbrew/.linuxbrew/bin/asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby || true
/home/linuxbrew/.linuxbrew/bin/fish -c 'set -Ux RUBY_CONFIGURE_OPTS "--with-openssl-dir=$(brew --prefix openssl@3)"'

echo "# NodeJS"
/home/linuxbrew/.linuxbrew/bin/asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git || true
