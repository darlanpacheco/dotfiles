loadkeys br-abnt2

fdisk -l
cfdisk /dev/device

mkfs.vfat /dev/bootpartition
mkfs.ext4 /dev/rootpartition

fdisk -l
mount /dev/rootpartition /mnt

mkdir -p /mnt/boot/efi

mount /dev/bootpartition /mnt/boot/efi

pacstrap -K /mnt base base-devel linux linux-firwmare efibootmgr grub networkmanager wayland git neovim

genfstab -U /mnt >>/mnt/etc/fstab

arch-chroot /mnt

passwd

grub-install
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager

useradd -mG wheel -s /bin/bash username
passwd username

nvim /etc/sudoers
