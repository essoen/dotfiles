#!/bin/bash
set -euo pipefail

# Slack and Qobuz

echo "Installing Slack..."
sudo snap install slack

echo "Installing Qobuz..."
sudo snap install qobuz-linux
