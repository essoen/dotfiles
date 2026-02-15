# Media server software

echo "Installing Plex, SickBeard, CouchPotato and SABnzbd+ \n"

# Plex server
wget "https://downloads.plex.tv/plex-media-server/0.9.16.6.1993-5089475/plexmediaserver_0.9.16.6.1993-5089475_amd64.deb"
sudo dbkg -i plexmediaserver*.deb

# Make Plex have access to mounted drives
sudo chmod -R a+x /media/$USER

# SickBeard
git clone git://github.com/midgetspy/Sick-Beard.git ~/.sickbeard
cd ~/.sickbeard
cp -a autoProcessTV/autoProcessTV.cfg.sample autoProcessTV/autoProcessTV.cfg

# Make it a service and make it start on boot
sudo cp ~/.sickbeard/init.ubuntu /etc/init.d/sickbeard
sudo chmod +x /etc/init.d/sickbeard

SB_SETTINGS_FILE = "/etc/default/sickbeard"

# Remove settings if it's there
sudo rm $SB_SETTINGS_FILE

# Append settings 
sudo echo "SB_HOME=/home/$USER/.sickbeard/" >> $SB_SETTINGS_FILE
sudo echo "SB_DATA=/home/$USER/.sickbeard/" >> $SB_SETTINGS_FILE
sudo echo "SB_USER=$USER" >>  $SB_SETTINGS_FILE

#Update boot sequence
sudo update-rc.d sickbeard defaults

# Start it
sudo service sickbeard start

echo "SickBeard started, and will start on boot in the future. \n"

# Get CouchPotato
git clone https://github.com/CouchPotato/CouchPotatoServer.git ~/.couchpotato
# Make it start on boot
echo "Update the init-file with correct settings \n "
nano ~/.couchpotato/init/ubuntu.default
sudo cp ~/.couchpotato/init/ubuntu.default /etc/default/couchpotato
sudo chmod +x /etc/default/couchpotato
sudo update-rc.d couchpotato defaults
sudo /etc/init.d/couchpotato start

echo "Installed and started CouchPotato and made it start on boot \n"

# Sabnzbd

sudo add-apt-repository ppa:jcfp/ppa
sudo apt-get update
sudo apt-get install sabnzbdplus

echo "Update the init-file with correct settings"
sudo nano /etc/default/sabnzbdplus


sudo /etc/init.d/sabnzbdplus restart


echo "Installed Plex (port 32400), SickBeard (port 8081), CouchPotato (port 5050) and SABnzbd+ (port 8080) \n"
echo "Start manually now, or reboot to have everything loaded. \n"
echo "Remember that setup cannot be done automatically, so you have to visit each service for setup."
