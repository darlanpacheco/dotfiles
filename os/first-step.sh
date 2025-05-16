#!/bin/bash

read -p "device: " DEVICE

if [[ "${DEVICE}" =~ [0-9]$ ]]; then
  PART_PREFIX="p"
else
  PART_PREFIX=""
fi

BOOT_PARTITION="/dev/${DEVICE}${PART_PREFIX}1"
SWAP_PARTITION="/dev/${DEVICE}${PART_PREFIX}2"
ROOT_PARTITION="/dev/${DEVICE}${PART_PREFIX}3"

cfdisk "/dev/${DEVICE}"

mkfs.vfat "${BOOT_PARTITION}"
mkfs.ext4 "${ROOT_PARTITION}"
mkswap "${SWAP_PARTITION}"

mount "${ROOT_PARTITION}" /mnt
mkdir -p /mnt/boot/efi
mount "${BOOT_PARTITION}" /mnt/boot/efi
swapon "${SWAP_PARTITION}"

pacstrap -K /mnt base base-devel linux linux-lts linux-firmware

genfstab -U /mnt >>/mnt/etc/fstab

cp -r second-step.sh /mnt/root/
chmod +x /mnt/root/second-step.sh
arch-chroot /mnt /root/second-step.sh
