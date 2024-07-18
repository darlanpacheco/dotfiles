loadkeys br-abnt2

fdisk -l
cfdisk /dev/device

mkfs.vfat /dev/bootpartition
mkfs.ext4 /dev/rootpartition

mount /dev/rootpartition /mnt
mkdir -p /mnt/boot/efi
mount /dev/bootpartition /mnt/boot/efi

pacstrap -K /mnt base base-devel linux linux-firwmare efibootmgr grub networkmanager wayland git neovim

genfstab -U /mnt >>/mnt/etc/fstab

arch-chroot /mnt

grub-install
grub-mkconfig -o /boot/grub/grub.cfg

passwd
useradd -mG wheel -s /bin/bash username
passwd username

systemctl enable NetworkManager

nvim /etc/sudoers
nvim /etc/pacman.conf
