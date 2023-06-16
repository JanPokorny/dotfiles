#!/bin/bash

echo
echo "### INSTALL ASDF PLUGINS ###"

echo "# Ruby"
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby
/home/linuxbrew/.linuxbrew/bin/fish -c 'set -Ux RUBY_CONFIGURE_OPTS "--with-openssl-dir=$(brew --prefix openssl@3)"'

echo "# NodeJS"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
