#!/bin/bash
# Enables running setup.sh correctly from dotfiles root directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/software"

echo "Starting installation"
echo "Installing tools like git, curl,  vim, nano, ftp, ssh xclip and tar."
# Install applications
sudo apt-get install -y terminator curl git vim nano ftp ssh xclip xsel tar
echo "Installing and activating firewall"
sudo apt-get install ufw
sudo ufw enable
sudo ufw allow ssh
echo "Installing Postgres and pgAdmin"
sudo apt install -y postgresql postgresql-contrib pgadmin3
echo "Install Samba-client for printers"
sudo apt install -y samba-client
echo "Set dotfiles-repo to use SSH"
git remote set-url origin git@github.com:essoen/dotfiles.git

echo "We're done!"
