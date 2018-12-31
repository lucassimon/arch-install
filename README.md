# Arch Install:

## Set keyboard portugues
```shell
# loadkeys br-abnt2
```

## Gparted partitions

Particionar o `HOME`, `CURSOS` e o `WORKSPACES`

| Device    | Boot | Size | Id | Type                 |
|-----------|------|------|----|----------------------|
| /dev/sda1 | *    | 70G  | 83 | Linux                |
| /dev/sda2 |      | 391G | 5  | Extended             |
| /dev/sda5 |      | 8G   | 82 | Linux swap / Solaris |
| /dev/sda6 |      | 160G | 83 | Linux (Home)         |
| /dev/sda7 |      | 111G | 83 | Linux (Workspaces)   |
| /dev/sda8 |      | 112G | 83 | Linux (Courses)      |


```shell
cfdisk /dev/sda
```

## Format sda[x]

Não formatar as partições `CURSOS` e `WORKSPACES`

```shell
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda6
```

## Swapon

```shell
mkswap /dev/sda5 && swapon /dev/sda5
```

## If you have wifi
```shell
iwconfig # para visualizar os wifi
wifi-menu nomedawifi
```

## Set o systemclock

```shell
timedatectl set-ntp true
```


## Mount the sda[x]

Montar todas as partições em um respectivo diretório do `/mnt`

```shell
mount /dev/sda1 /mnt/arch
mkdir -p /mnt/arch/{home, courses, workspaces}
mount /dev/sda6 /mnt/arch/home
mount /dev/sda7 /mnt/arch/courses
mount /dev/sda8 /mnt/arch/workspaces
```

## Install base and base-devel

```shell
pacstrap /mnt base base-devel
```

## Gen fstab

```shell
genfstab -U  /mnt >> /mnt/etc/fstab
```

## Chroot

```shell
arch-chroot /mnt /bin/bash
```

## Set date time

```shell
rm -rf /etc/localtime
ln -s /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
hwclock --systohc
```

## Set LOCALE

Tire o comentario # de  pt_BR.UTF-8 UTF-8 e qualquer outra localização em `/etc/locale.gen`

Defina a variável LANG em locale.conf(5) adequadamente, por exemplo:

```shell
echo LANG=pt_BR.UTF-8 > /etc/locale.conf
```

E gere-as com:

```shell
locale-gen
```

## Set keyboar layout in vconsole.conf(5):

```shell
echo KEYMAP=br-abnt2 > /etc/vconsole.conf
```

## Set hostname:

```shell
echo notebook > /etc/hostname
```

## Adds  hosts(5):

```shell
vim /etc/hosts
```

```ini
127.0.0.1 localhost
::1  localhost
127.0.1.1 notebook
```

## Gen scripts

```shell
mkinitcpio -p linux
```

## net tools and wifi

```shell

# pacman -S wget
# mirror-br out of date do not run it 
# wget "https://gitlab.com/terminalroot/arch/raw/master/mirror-br" -O /etc/pacman.d/mirrorlist 2>/dev/null
#

pacman -Syyu

pacman -S autoconf automake binutils make git openssh vim zsh net-tools wireless_tools wpa_supplicant wpa_actiond dialog

systemclt enable dhcpd.service
```

## root password

```shell
passwd
```

## Upgrade the system

```shell
pacman -Syyu
```

## If you have dual boot

```shell
pacman -S os-prober
```

## Install grub

```shell
pacman -S grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```

## Finish

```shell
exit
umount -R /mnt
reboot
```
