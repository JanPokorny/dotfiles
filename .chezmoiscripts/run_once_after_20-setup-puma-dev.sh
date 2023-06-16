#!/bin/bash

echo
echo "### SETUP PUMA-DEV ###"

# Run puma-dev to make it generate the certificate
/home/linuxbrew/.linuxbrew/bin/puma-dev &
sleep 10
kill %1

# Trust the cert in the OS
sudo mkdir -p /usr/local/share/ca-certificates
sudo cp ~/.puma-dev-ssl/cert.pem /usr/local/share/ca-certificates/puma-dev-pem.crt
sudo update-ca-certificates

# Enable binding to low-number ports
sudo setcap CAP\_NET\_BIND\_SERVICE=+eip $(realpath /home/linuxbrew/.linuxbrew/bin/puma-dev)
