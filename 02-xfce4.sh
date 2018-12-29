#!/bin/bash
set -e

sudo pacman -Syyu --noconfirm


# Install Yay if not installed previously
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si

sudo pacman -S vim xorg-server xf86-input-mouse xf86-input-keyboard xf86-video-vesa xorg-xinit awesome-terminal-fonts terminus-font ttf-dejavu xterm git lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings bash-completion --noconfirm

sudo pacman -S xfce4 xfce4-goodies --noconfirm --needed

sudo systemctl enable lightdm.service -f
sudo systemctl set-default graphical.target

sudo pacman -R xfce4-artwork --noconfirm

#Sound
sudo pacman -S pulseaudio --noconfirm --needed
sudo pacman -S pulseaudio-alsa --noconfirm --needed
sudo pacman -S pavucontrol  --noconfirm --needed
sudo pacman -S alsa-utils alsa-plugins alsa-lib alsa-firmware --noconfirm --needed
sudo pacman -S gstreamer --noconfirm --needed
sudo pacman -S gst-plugins-good gst-plugins-bad gst-plugins-base gst-plugins-ugly --noconfirm --needed
sudo pacman -S volumeicon --noconfirm --needed
sudo pacman -S playerctl --noconfirm --needed

echo "reboot"
