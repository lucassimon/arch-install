# Arch Install:

## teclado em portugues
```shell
# loadkeys br-abnt2
```

## criar partições
```shell
cfdisk /dev/sda
```

## formatar partições
```shell
mkfs.ext4 /dev/sda1
```

## ligar swap

```shell
mkswap /dev/sda2 && swapon /dev/sda2
```

## se tiver conexao com wifi pode usar o
```shell
iwconfig # para visualizar os wifi
wifi-menu nomedawifi
```

## setar o systemclock

```shell
timedatectl set-ntp true
```


## pontos de montagem

```shell
mount /dev/sda1 /mntgen
mkdir /mnt/home
mount /dev/sda3 /mnt/home
```

## pronto para instalar a base do sistema / base-devel

```shell
pacstrap /mnt base base-devel
```

## Gerar fstab

```shell
genfstab -U  /mnt >> /mnt/etc/fstab
```

## Chroot

```shell
arch-chroot /mnt /bin/bash
```

## Defina o fuso horário:

```shell
ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
```

## LOCALE

Tire o comentario # de  pt_BR.UTF-8 UTF-8 e qualquer outra localização em /etc/locale.gen, e gere-as com:

## Defina a variável LANG em locale.conf(5) adequadamente, por exemplo:

```shell
nano /etc/locale.conf
```
```ini
LANG=pt_BR.UTF-8
```
```shell
locale-gen
```

## Se você definir o layout do teclado, torne as alterações persistentes em vconsole.conf(5):

```shell
nano /etc/vconsole.conf
```

```ini
KEYMAP=br-abnt2
```

## Crie o arquivo hostname:

```shell
vim /etc/hostname
```

notebook

## Adicione entradas correspondentes ao hosts(5):

```shell
vim /etc/hosts
```

```ini
127.0.0.1 localhost
::1  localhost
127.0.1.1 notebook.localdomain notebook
```

## gerar scripts

```shell
mkinitcpio -p linux
```

## ferramentas para wifi
```shell
pacman -S vim zsh wireless_tools wpa_supplicant wpa_actiond dialog
```

## senha de root

```shell
passwd
```

## atualizar sistema

```shell
pacman -Syyu
```

## Se tiver dual boot tem q instalar o:

```shell
pacman -S os-prober

grub-install /dev/sda
```

## Instalar grub

```shell
pacman -S grub
grub-mkconfig -o /boot/grub/grub.cfg
```

## Finalizando

```shell
exit
umount -R /mnt
reboot
```
