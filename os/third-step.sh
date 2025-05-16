#!/bin/bash

sudo pacman -Suy --needed papirus-icon-theme adw-gtk-theme breeze5 ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji
sudo pacman -Suy --needed pipewire-pulse jack2 vulkan-radeon lib32-vulkan-radeon wine wine-mono libappimage unzip gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly libretro-bsnes libretro-mgba
sudo pacman -Suy --needed xdg-desktop-portal-hyprland xdg-desktop-portal-gtk wayland flatpak gammastep slurp grim ollama ranger wl-clipboard openssh ufw fastfetch nodejs dotnet-sdk go npm yarn docker docker-compose hyprpicker
sudo pacman -Suy --needed hyprland waybar gnome-software gnome-disk-utility gnome-system-monitor alacritty nautilus rofi-wayland pavucontrol godot-mono krita blender lmms chromium mangohud steam retroarch

flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub net.lutris.Lutris org.vinegarhq.Sober -y
flatpak install flathub org.gnome.baobab org.gnome.font-viewer org.gnome.Characters org.gnome.Calculator org.gnome.TextEditor org.gnome.Boxes org.gnome.Totem org.gnome.Loupe org.gnome.Decibels org.gnome.clocks de.haeckerfelix.Fragments -y
flatpak install flathub org.libreoffice.LibreOffice org.gimp.GIMP org.inkscape.Inkscape com.obsproject.Studio org.mozilla.firefox -y

sudo systemctl enable --now ufw sshd docker ollama
sudo usermod -aG docker $USER

mkdir -p ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Projects ~/Videos ~/Retro

sudo ufw allow http
sudo ufw allow https
sudo ufw limit ssh
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

git config --global user.name "Darlan Pacheco"
git config --global user.email "darlanpacheco@proton.me"

ssh-keygen -t ed25519 -C "darlanpacheco@proton.me"

cp -r ../.* ~/
cp -r /usr/share/themes ~/.themes
flatpak override --user --env=GTK_THEME=adw-gtk3-dark
flatpak override --user --filesystem=$HOME/.themes
rm -rf ~/.git
git clone https://github.com/darlanpacheco/neovim.git ~/.config/nvim

ollama pull llama3.2
ollama pull codellama
