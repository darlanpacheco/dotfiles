#!/bin/bash

read -p "username: " USERNAME
DIR=$(pwd)

echo "root password:"
passwd
useradd -mG wheel -s /bin/bash "$USERNAME"
echo "user ${USERNAME} password:"
passwd "${USERNAME}"

pacman -Syu --needed neovim
nvim /etc/sudoers
nvim /etc/pacman.conf

pacman -Syu --needed papirus-icon-theme adw-gtk-theme breeze5 ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji
pacman -Syu --needed networkmanager pipewire-pulse jack2 vulkan-radeon lib32-vulkan-radeon wine wine-mono libappimage unzip gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly libretro-bsnes libretro-mgba
pacman -Syu --needed xdg-desktop-portal-hyprland xdg-desktop-portal-gtk wayland flatpak gammastep slurp grim ollama ranger wl-clipboard openssh ufw fastfetch docker docker-compose hyprpicker
pacman -Syu --needed hyprland waybar gnome-software gnome-disk-utility gnome-system-monitor alacritty nautilus rofi pavucontrol krita blender lmms chromium mangohud steam retroarch
pacman -Syu --needed git gcc mingw-w64-gcc clang zig zls rust-analyzer shfmt nodejs npm lua-language-server stylua python python-virtualenv python-black

flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub net.lutris.Lutris org.vinegarhq.Sober -y
flatpak install flathub org.gnome.baobab org.gnome.font-viewer org.gnome.Characters org.gnome.Calculator org.gnome.TextEditor org.gnome.Boxes org.gnome.Totem org.gnome.Loupe org.gnome.Decibels org.gnome.clocks de.haeckerfelix.Fragments -y
flatpak install flathub org.libreoffice.LibreOffice org.gimp.GIMP org.inkscape.Inkscape com.obsproject.Studio io.gitlab.librewolf-community org.localsend.localsend_app -y

sudo -u "${USERNAME}" bash <<EOF
mkdir -p ~/.local/npm
npm config set prefix ~/.local/npm
npm install -g bash-language-server typescript typescript-language-server vscode-langservers-extracted @tailwindcss/language-server prettier pyright
EOF

grub-install
grub-mkconfig -o /boot/grub/grub.cfg

usermod -aG docker "${USERNAME}"

cp -r third-step.service /etc/systemd/system/
cp -r third-step.sh /usr/local/bin/
chmod +x /usr/local/bin/third-step.sh
systemctl enable third-step.service
