#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Starting installation"
echo "Installing tools like git, curl,  vim, nano, ftp, ssh xclip and tar."
# Install applications
sudo apt-get install -y terminator curl git vim nano ftp ssh xclip tar
echo "Installing and activating firewall"
sudo apt-get install ufw
sudo ufw enable 

echo "Installing devtools"
echo "First we install Python 2 and 3, along with pip. Then OpenJDK 7 and 8 + Vagrant"
# Dev
sudo apt-get install -y python python3 python-pip -python3-pip #Python and Pip
sudo apt-get install -y openjdk-7-jre openjdk-7-jdk  openjdk-8-jre openjdk-8-jdk  # Java
sudo apt-get install -y vagrant


echo "Installing and setting up Docker and Docker Compose"
# Install Docker and Docker Compose
curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker ${USER}
curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

echo "Installing NVM and Node"
#NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
source ~/.bashrc
# Node 
nvm install latest

echo "Installing Meteor" 
# Meteor
curl https://install.meteor.com/ | sh

echo "Setting up git "
git config --global user.name "Stein-Otto Svorstøl"
git config --global user.email "steinotto.svorstol@gmail.com"
echo "Setup SSH for git"
echo "Remeber to use empty passphrase and standard location"
ssh-keygen -t rsa -C "steinotto.svorstol@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub

echo "Now paste your clipboard as a new key on GitHub."

echo "Installing Google Drive"
sh $DIR/drive.sh

echo "Installing idea-software, Atom, and Nuvola Player 3" 
sh $DIR/idea-software.sh
sh $DIR/nuvolaplayer.sh
sh $DIR/slack.sh
sh $DIR/atom.sh

