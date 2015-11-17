# Install Spotify
# You need libgcrypt11
wget http://security.debian.org/debian-security/pool/updates/main/libg/libgcrypt11/libgcrypt11_1.5.0-5+deb7u3_amd64.deb
dpkg -i libgcrypt11_1.5.0-5+deb7u3_amd64.deb
rm "libgcrypt11_1.5.0-5+deb7u3_amd64.deb"

# And Spotify
add-apt-repository "deb http://repository.spotify.com stable non-free"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59
apt-get update
apt-get install -y spotify-client spotify-client-gnome-support # Gnome support included as I use Gnome
