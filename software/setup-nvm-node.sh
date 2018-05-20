#!/bin/bash
echo "Installing NVM and Node"
#NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
source ~/.bashrc
nvm install stable

