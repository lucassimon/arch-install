#!/bin/bash
set -e

echo "sublime"
# https://www.sublimetext.com/docs/3/linux_repositories.html
yay -S --noconfirm sublime-text-dev

echo "vscode"
#yay -S visual-studio-code-bin
yay -S --noconfirm visual-studio-code


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

yay -S redis-desktop-manager --noconfirm

echo "PGWEB"

yay -S pgweb-bin --noconfirm

