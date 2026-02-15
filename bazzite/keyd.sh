#!/bin/bash
set -euo pipefail

echo "Layering keyd (requires reboot)..."
rpm-ostree install -y keyd

echo "Copying keyd config..."
sudo cp ~/dotfiles/keyd/default.conf /etc/keyd/default.conf

echo "Enabling keyd service..."
sudo systemctl enable keyd

echo "Reboot required for keyd to activate"
