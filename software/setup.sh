# Install applications
sudo apt-get install -y gnome terminator curl git vim nano ftp ssh xclip tar
sudo apt-get install ufw
sudo ufw enable 
# Dev
sudo apt-get install -y python python3 python-pip -python3-pip #Python and Pip
sudo apt-get install -y openjdk-7-jre openjdk-7-jdk  openjdk-8-jre openjdk-8-jdk  # Java
sudo apt-get install -y vagrant


# Install Docker and Docker Compose
curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker ${USER}
curl -L https://github.com/docker/compose/releases/download/1.7.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
$ chmod +x /usr/local/bin/docker-compose

#NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
source ~/.bashrc
# Node 
nvm install latest

# Meteor
curl https://install.meteor.com/ | sh

echo "Config git"
git config --global user.name "Stein-Otto Svorstøl"
git config --global user.email "steinotto.svorstol@gmail.com"
echo "Setup SSH for git"
echo "Remeber to use empty passphrase and standard location"
ssh-keygen -t rsa -C "steinotto.svorstol@gmail.com"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
xclip -sel clip < ~/.ssh/id_rsa.pub

echo "Now paste your clipboard as a new key on GitHub."

# sudo sh idea-software.sh
sh spotify.sh
sh slack.sh

