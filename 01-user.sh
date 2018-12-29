#!/bin/bash
set -e

useradd -m -g users -G storage,network,power,wheel,audio,video -s /bin/zsh "lucas"
passwd "lucas"

echo "add user on sudoers"

systemctl start NetworkManager
systemctl enable NetworkManager

echo "reboot"
