#!/bin/bash
set -e


echo "Network Discovery"

sudo pacman -S --noconfirm --needed avahi
sudo systemctl enable avahi-daemon.service
sudo systemctl start avahi-daemon.service

#shares on a mac
# sudo pacman -S --noconfirm --needed nss-mdns

#shares on a linux
sudo pacman -S --noconfirm --needed gvfs-smb

echo "################################################################"
echo "####       network discovery  software installed        ########"
echo "################################################################"
