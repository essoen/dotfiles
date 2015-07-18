# Setup git
apt-get install git xclip
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

