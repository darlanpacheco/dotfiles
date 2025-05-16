#!/bin/bash

USERNAME="x"

pacman -S base-devel efibootmgr grub networkmanager

grub-install
grub-mkconfig -o /boot/grub/grub.cfg

passwd
useradd -mG wheel -s /bin/bash "$USERNAME"
passwd "$USERNAME"

systemctl enable NetworkManager

nvim /etc/sudoers
nvim /etc/pacman.conf
