#!/bin/bash
sudo xbps-install -Su
sudo xbps-install feh i3 xorg firefox python3-pip python3-devel vlc adwaita-icon-theme pcmanfm wget slim terminology libsensors-devel lm_sensors
sudo pip3 install colour psutil netifaces git+https://github.com/bastienleonard/pysensors.git git+https://github.com/enkore/i3pystatus.git
sudo ln -sf /etc/sv/consolekit /var/service/
sudo ln -sf /etc/sv/slim /var/service/
ln -sf /data/{AUR,GitHub,Documents,OBS,Pictures,Videos,"VirtualBox VMs",.VirtualBox} $HOME/
ln -sf /data/GitHub/mine/config/i3-configs/.i3 ~/GitHub/mine/scripts/common-scripts/.i3
ln -sf /data/Github/mine/config/i3-configs/.x* ~/
sudo ln -sf /data/GitHub/mine/config/i3-configs/usr/local/bin/* /usr/local/bin/
mkdir -p $HOME/.local/share/wallpapers && cd $HOME/.local/share/wallpapers && \
sudo wget -c https://voidlinuxforum.s3-eu-west-1.amazonaws.com/original/1X/84f191cf3684346e1d7216e1997f1c6dc3de298b.jpg 
