# Install Spotify
add-apt-repository "deb http://repository.spotify.com stable non-free"
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59
apt-get update
apt-get install spotify-client
