#!/bin/bash
set -e

_site="https://gitlab.com/terminalroot"
repo="arch/raw/master"


[[ ! "$(which wget)" ]] && echo "Need install wget." && exit 1
	wget "$_site/$repo/mirror-br" -O /etc/pacman.d/mirrorlist 2>/dev/null

pacman -S vim zsh wireless_tools wpa_supplicant wpa_actiond dialog autoconf automake binutils make git networkmanager

useradd -m -g users -G storage,network,power,wheel,audio,video -s /bin/zsh "lucas"
passwd "lucas"

# Install Yay if not installed previously
git clone https://aur.archlinux.org/yay.git
cd yay && makepkg -si

echo "add user on sudoers"

echo "reboot"
