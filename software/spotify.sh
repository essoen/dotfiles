# Install Spotify
# You need libgcrypt11
#wget http://security.debian.org/debian-security/pool/updates/main/libg/libgcrypt11/libgcrypt11_1.5.0-5+deb7u3_amd64.deb
#dpkg -i libgcrypt11_1.5.0-5+deb7u3_amd64.deb
#rm "libgcrypt11_1.5.0-5+deb7u3_amd64.deb"


# 1. Add the Spotify repository signing key to be able to verify downloaded packages
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886

# 2. Add the Spotify repository
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# 3. Update list of available packages
sudo apt-get update

# 4. Install Spotify
sudo apt-get install -y spotify-client spotify-client-gnome-support
