#!/bin/bash

DEVICE="/dev/x"
BOOT_PARTITION="${DEVICE}1"
SWAP_PARTITION="${DEVICE}2"
ROOT_PARTITION="${DEVICE}3"

cfdisk "$DEVICE"

mkfs.vfat "$BOOT_PARTITION"
mkfs.ext4 "$ROOT_PARTITION"
mkswap "$SWAP_PARTITION"

mount "$ROOT_PARTITION" /mnt
mkdir -p /mnt/boot/efi
mount "$BOOT_PARTITION" /mnt/boot/efi
swapon "$SWAP_PARTITION"

pacstrap -K /mnt base linux linux-lts linux-firmware

genfstab -U /mnt >>/mnt/etc/fstab

arch-chroot /mnt
