#!/bin/bash

echo
echo "### INSTALL ASDF RUBY PLUGIN ###"
asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby
/home/linuxbrew/.linuxbrew/bin/fish -c 'set -Ux RUBY_CONFIGURE_OPTS "--with-openssl-dir=$(brew --prefix openssl@3)"'
