#!/bin/bash
set -euo pipefail

# Volta, Node, Java, VS Code, and Claude Code

echo "Installing Volta..."
curl https://get.volta.sh | bash
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

echo "Installing Node via Volta..."
volta install node

echo "Installing Java (OpenJDK 21 LTS)..."
sudo apt install -y openjdk-21-jdk

echo "Installing VS Code..."
sudo snap install code --classic

echo "Installing Claude Code..."
curl -fsSL https://claude.ai/install.sh | bash
