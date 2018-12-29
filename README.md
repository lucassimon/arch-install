# Arch Install:

## teclado em portugues
```shell
# loadkeys br-abnt2
```

## criar partições

Particionar o `HOME`, `CURSOS` e o `WORKSPACES`

| Device    | Boot | Size | Id | Type                 |
|-----------|------|------|----|----------------------|
| /dev/sda1 | *    | 70G  | 83 | Linux                |
| /dev/sda2 |      | 391G | 5  | Extended             |
| /dev/sda5 |      | 8G   | 82 | Linux swap / Solaris |
| /dev/sda6 |      | 160G | 83 | Linux                |
| /dev/sda7 |      | 111G | 83 | Linux                |
| /dev/sda8 |      | 112G | 83 | Linux                |


```shell
cfdisk /dev/sda
```

## formatar partições

Não formatar as partições `CURSOS` e `WORKSPACES`

```shell
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda6
```

## ligar swap

```shell
mkswap /dev/sda5 && swapon /dev/sda5
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

Montar todas as partições em um respectivo diretório do `/mnt`

```shell
mount /dev/sda1 /mnt/arch
mkdir -p /mnt/arch/{home, courses, workspaces}
mount /dev/sda6 /mnt/arch/home
mount /dev/sda7 /mnt/arch/courses
mount /dev/sda8 /mnt/arch/workspaces
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

Tire o comentario # de  pt_BR.UTF-8 UTF-8 e qualquer outra localização em `/etc/locale.gen`

Defina a variável LANG em locale.conf(5) adequadamente, por exemplo:

```shell
nano /etc/locale.conf
```
```ini
LANG=pt_BR.UTF-8
```
E gere-as com:

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
```

## Instalar grub

```shell
pacman -S grub
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
```

## Finalizando

```shell
exit
umount -R /mnt
reboot
```
