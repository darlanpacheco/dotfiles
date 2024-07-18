mkdir -p ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Projects ~/Videos ~/.themes

<<COMMENT
  sudo pacman -Suy --needed --noconfirm papirus-icon-theme ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji
  sudo pacman -Suy --needed --noconfirm vulkan-radeon pipewire-pulse libappimage gstreamer gst-plugins-ugly gst-plugins-bad gst-plugins-base gst-plugins-good gst-libav
  sudo pacman -Suy --needed --noconfirm godot raylib wget curl openssh docker docker-compose ollama ufw fastfetch
  sudo pacman -Suy --needed --noconfirm hyprland waybar bashtop swaybg gammastep slurp grim xwaylandvideobridge xdg-desktop-portal-hyprland tmux alacritty wl-clipboard ranger gnome-boxes gnome-tweaks fragments loupe totem rofi-wayland pavucontrol
  sudo pacman -Suy --needed --noconfirm firefox chromium gimp obs-studio kdenlive lmms libreoffice
  sudo pacman -Suy --needed --noconfirm retroarch retroarch-assets-glui retroarch-assets-ozone libretro-bsnes libretro-mgba
COMMENT

<<COMMENT
  sudo pacman -Suy --needed --noconfirm flatpak
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  sudo flatpak install flathub com.github.tchx84.Flatseal com.usebottles.bottles org.upscayl.Upscayl com.valvesoftware.Steam com.heroicgameslauncher.hgl -y
COMMENT

# Git configurations
git config --global user.name "Darlan Pacheco"
git config --global user.email "darlanpacheco@proton.me"

# Firewall configurations
sudo ufw allow http
sudo ufw allow https
sudo ufw limit ssh
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# Setting up OS
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
git clone https://github.com/flutter/flutter.git ~/Documents/flutter
cp -r ../.* ~/
sudo rm -rf /usr/share/hyprland/

# Setting up init system
sudo systemctl enable NetworkManager ufw sshd docker ollama
sudo usermod -aG docker $USER
