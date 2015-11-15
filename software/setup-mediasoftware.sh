# Media server (comment out for laptop)

# Plex server
wget "https://downloads.plex.tv/plex-media-server/0.9.9.14.531-7eef8c6/plexmediaserver_0.9.9.14.531-7eef8c6_amd64.deb"
dbkg -i plexmediaserver*.deb

# SickBeard
apt-get install python-cheetah
cd
git clone git://github.com/midgetspy/Sick-Beard.git .sickbeard
cd .sickbeard
cp -a autoProcessTV/autoProcessTV.cfg.sample autoProcessTV/autoProcessTV.cfg

# Sabnzbd
add-apt-repository ppa:jcfp/ppa
apt-get update
apt-get install sabnzbdplus
echo "Start with command sabnzbdplus \n" 