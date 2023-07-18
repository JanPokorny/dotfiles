#!/bin/bash

echo
echo "### INSTALL APT DEPENDENCIES ###"

# AppImage Launcher
sudo apt install software-properties-common
sudo add-apt-repository ppa:appimagelauncher-team/stable
sudo apt update
sudo apt install appimagelauncher

# Simple X HotKey Deamon
sudo apt install sxhkd
