#!/bin/bash
set -euo pipefail

echo "Installing keyd..."
sudo apt install -y keyd

echo "Copying keyd config..."
sudo cp ~/dotfiles/keyd/default.conf /etc/keyd/default.conf

echo "Enabling keyd service..."
sudo systemctl enable --now keyd

echo "keyd is active — macOS-like keyboard remapping enabled"
