echo "Installing and setting up Docker and Docker Compose"
# Install Docker and Docker Compose
curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker ${USER}

sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

