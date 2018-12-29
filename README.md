# Arch Install:

## teclado em portugues
loadkeys br-abnt2

## criar partições
cfdisk /dev/sda

## formatar partições
mkfs.ext4 /dev/sda1

## ligar swap
mkswap /dev/sda2
swapon /dev/sda2

## se tiver conexao com wifi pode usar o
iwconfig # para visualizar os wifi
wifi-menu nomedawifi

## setar o systemclock
timedatectl set-ntp true


## pontos de montagem
mount /dev/sda1 /mntgen
mkdir /mnt/home
mount /dev/sda3 /mnt/home

## pronto para instalar a base do sistema / base-devel

pacstrap /mnt base base-devel

## configurar fstab # substitua os .. por maior, maior. ( youtube não deixa colocar o sinal de maior ou menor na descrição)
genfstab -U  /mnt >> /mnt/etc/fstab

## Chroot
arch-chroot /mnt /bin/bash

## Defina o fuso horário:
ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc

## LOCALE

Tire o comentario # de  pt_BR.UTF-8 UTF-8 e qualquer outra localização em /etc/locale.gen, e gere-as com:

# Defina a variável LANG em locale.conf(5) adequadamente, por exemplo:

nano /etc/locale.conf
LANG=pt_BR.UTF-8

locale-gen

# Se você definir o layout do teclado, torne as alterações persistentes em vconsole.conf(5):

nano /etc/vconsole.conf
KEYMAP=br-abnt2

# Crie o arquivo hostname:

/etc/hostname

notebook

# Adicione entradas correspondentes ao hosts(5):

/etc/hosts
127.0.0.1 localhost
::1  localhost
127.0.1.1 notebook.localdomain notebook

# gerar scripts
mkinitcpio -p linux


# ferramentas para wifi
pacman -S vim zsh wireless_tools wpa_supplicant wpa_actiond dialog

# senha de root
passwd

# atualizar sistema
pacman -Syyu

# Instalar grub
pacman -S grub

# Se tiver dual boot tem q instalar o:
pacman -S os-prober

grub-install /dev/sda

grub-mkconfig -o /boot/grub/grub.cfg



exit
umount -R /mnt

reboot

