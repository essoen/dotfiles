#!/bin/sh
codename=`lsb_release --codename | cut -f2`

sudo add-apt-repository "deb https://tiliado.eu/nuvolaplayer/repository/deb/ $codename stable"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 40554B8FA5FE6F6A
sudo apt-get update
sudo apt-get install -y nuvolaplayer3
