#!/bin/bash
set -e

echo "Installing category Accessories"

#sudo pacman -S --noconfirm --needed

echo "Installing category Education"

echo "Installing category Games"

echo "Installing category Internet"

sudo pacman -S --noconfirm --needed chromium

sudo pacman -S --noconfirm --needed firefox

# sudo pacman -S --noconfirm --needed transmission-cli
sudo pacman -S --noconfirm --needed transmission-gtk
#sudo pacman -S --noconfirm --needed

echo "Installing category Multimedia"

sudo pacman -S --noconfirm --needed simplescreenrecorder

sudo pacman -S --noconfirm --needed vlc

echo "Installing category System"

sudo pacman -S --noconfirm --needed curl ffmpegthumbnailer git gvfs gvfs-mtp htop

sudo pacman -S --noconfirm --needed hardinfo htop lm_sensors lsb-release mlocate net-tools numlockx

# sudo  pacman -S --noconfirm --needed rxvt-unicode

echo "installation of zippers and unzippers"

sudo pacman -S --noconfirm --needed unace unrar zip unzip sharutils  uudeview  arj cabextract file-roller


# yay -S --noconfirm foxitreader

yay -S --noconfirm peek

yay -S --noconfirm skypeforlinux-stable-bin

yay -S --noconfirm slack-desktop

yay -S --noconfirm telegram-desktop-bin

yay -S --noconfirm vivaldi vivaldi-codecs-ffmpeg-extra-bin vivaldi-snapshot

yay -S --noconfirm whatsapp-web-desktop


echo "Installing Fonts"

echo "Installing fonts from Arch Linux repo"

sudo pacman -S adobe-source-sans-pro-fonts --noconfirm --needed
sudo pacman -S cantarell-fonts --noconfirm --needed
sudo pacman -S noto-fonts --noconfirm --needed
sudo pacman -S terminus-font --noconfirm --needed
sudo pacman -S ttf-bitstream-vera --noconfirm --needed
sudo pacman -S ttf-dejavu --noconfirm --needed
sudo pacman -S ttf-droid --noconfirm --needed
sudo pacman -S ttf-inconsolata --noconfirm --needed
sudo pacman -S ttf-liberation --noconfirm --needed
sudo pacman -S ttf-roboto --noconfirm --needed
sudo pacman -S ttf-ubuntu-font-family --noconfirm --needed
sudo pacman -S tamsyn-font --noconfirm --needed

[ -d $HOME"/.fonts" ] || mkdir -p $HOME"/.fonts"

echo "Building new fonts into the cache files";
echo "Depending on the number of fonts, this may take a while..."
fc-cache -fv ~/.fonts

echo "################################################################"
echo "#### Software from standard Arch Linux Repo installed  #########"
echo "################################################################"


