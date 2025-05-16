loadkeys br-abnt2

fdisk -l
cfdisk /dev/device

mkfs.vfat /dev/bootpartition
mkfs.ext4 /dev/rootpartition
mkswap /dev/swappartition

mount /dev/rootpartition /mnt
mkdir -p /mnt/boot/efi
mount /dev/bootpartition /mnt/boot/efi
swapon /dev/swappartition

pacstrap -K /mnt base base-devel linux linux-firwmare efibootmgr grub networkmanager git neovim

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
