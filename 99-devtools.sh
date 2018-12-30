#!/bin/bash
set -e

echo "sublime"
# https://www.sublimetext.com/docs/3/linux_repositories.html
# curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
# echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
# echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/dev/x86_64" | sudo tee -a /etc/pacman.conf

yay -S --noconfirm sublime-text-dev

echo "vscode"

yay -S visual-studio-code-bin --noconfirm

# yay -S --noconfirm visual-studio-code


echo "PYTHON"
#sudo pacman -S python-virtualenv

# pacman -S python-virtualenvwrapper
# export WORKON_HOME=~/.virtualenvs
# source /usr/bin/virtualenvwrapper.sh

echo "GOLANG"

# Install Yay if not installed previously
# git clone https://aur.archlinux.org/yay.git
# cd yay
# makepkg -si


echo "NODEJS"
#Install via Yay
#yay -S nvm
#Nao esquecça de executar o nvm-init no .zshrc
yay -S --noconfirm nvm
echo "Nao esquecça de executar o nvm-init no .zshrc"

echo "ELIXIR"
sudo pacman -S elixir --noconfirm

echo "DOCKER"

sudo pacman -S docker --noconfirm

sudo usermod -aG docker lucas

sudo systemctl start docker

sudo systemctl enable docker

yay -S docker-compose --noconfirm

echo "INSOMINA"

yay -S insomnia --noconfirm 

echo "ROBOT3T"

yay -S robo3t-bin --noconfirm

echo "Redis Desktop web"

# yay -S redis-desktop-manager --noconfirm

echo "PGWEB"

# yay -S pgweb-bin --noconfirm

