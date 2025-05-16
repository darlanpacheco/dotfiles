#!/bin/bash

sudo pacman -Suy --needed papirus-icon-theme adw-gtk-theme breeze5 ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji
sudo pacman -Suy --needed gcc mingw-w64-gcc pipewire-pulse jack2 vulkan-radeon lib32-vulkan-radeon wine wine-mono libappimage unzip gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly libretro-bsnes libretro-mgba
sudo pacman -Suy --needed xdg-desktop-portal-hyprland xdg-desktop-portal-gtk wayland flatpak gammastep slurp grim ollama ranger wl-clipboard openssh ufw fastfetch docker docker-compose hyprpicker
sudo pacman -Suy --needed hyprland waybar gnome-software gnome-disk-utility gnome-system-monitor alacritty nautilus rofi-wayland pavucontrol krita blender lmms chromium mangohud steam retroarch

sudo pacman -Suy --needed clang nodejs npm rust-analyzer shfmt lua-language-server stylua
sudo npm install -g prettier typescript typescript-language-server vscode-langservers-extracted bash-language-server sql-language-server @tailwindcss/language-server

flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub net.lutris.Lutris org.vinegarhq.Sober -y
flatpak install flathub org.gnome.baobab org.gnome.font-viewer org.gnome.Characters org.gnome.Calculator org.gnome.TextEditor org.gnome.Boxes org.gnome.Totem org.gnome.Loupe org.gnome.Decibels org.gnome.clocks de.haeckerfelix.Fragments -y
flatpak install flathub org.libreoffice.LibreOffice org.gimp.GIMP org.inkscape.Inkscape com.obsproject.Studio io.gitlab.librewolf-community org.localsend.localsend_app -y

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
rm -rf ~/.git

cp -r /usr/share/themes ~/.themes
flatpak override --user --env=GTK_THEME=adw-gtk3-dark
flatpak override --user --filesystem=$HOME/.themes

ollama pull llama3.2
ollama pull codellama
