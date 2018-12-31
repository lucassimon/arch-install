#!/bin/bash
set -e

sudo pacman -Syyu --noconfirm

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Install Yay if not installed previously
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si

sudo pacman -S vim xorg-server xorg-server-utils xorg-twm xf86-input-mouse xf86-input-keyboard xf86-video-vesa xorg-xinit awesome-terminal-fonts terminus-font ttf-dejavu xterm git lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings bash-completion --noconfirm

sudo pacman -S budgie-desktop tilix budgie-extra plank --noconfirm --needed

sudo systemctl enable lightdm.service -f
sudo systemctl set-default graphical.target

#Sound
sudo pacman -S pulseaudio --noconfirm --needed
sudo pacman -S pulseaudio-alsa --noconfirm --needed
sudo pacman -S pavucontrol  --noconfirm --needed
sudo pacman -S alsa-utils alsa-plugins alsa-lib alsa-firmware --noconfirm --needed
sudo pacman -S gstreamer --noconfirm --needed
sudo pacman -S gst-plugins-good gst-plugins-bad gst-plugins-base gst-plugins-ugly --noconfirm --needed

# sudo pacman -S volumeicon --noconfirm --needed
# sudo pacman -S playerctl --noconfirm --needed

echo "reboot"
