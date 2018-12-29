#!/bin/bash
set -e

echo "Install tlp for battery life - laptops"

sudo pacman -S --noconfirm --needed tlp
sudo systemctl enable tlp.service
sudo systemctl start tlp-sleep.service

echo "################################################################"
echo "####               tlp  software installed              ########"
echo "################################################################"
