#NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash
source ~/.bashrc
nvm install stable
nvm use stable
npm install -g yo gulp grunt-cli bower

# Meteor
curl https://install.meteor.com/ | sh

