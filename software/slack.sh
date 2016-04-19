PACKAGE="slack-desktop-2.0.3-amd64.deb"
wget "https://downloads.slack-edge.com/linux_releases/$PACKAGE"
sudo dpkg -i $PACKAGE
rm $PACKAGE
