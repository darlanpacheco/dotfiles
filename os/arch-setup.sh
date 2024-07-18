mkdir -p ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Projects ~/Videos ~/Documents/code ~/Documents/godot ~/.themes

<<COMMENT
  sudo pacman -Suy --needed --noconfirm papirus-icon-theme ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji
  sudo pacman -Suy --needed --noconfirm vulkan-radeon pipewire-pulse libappimage unzip less gstreamer gst-plugins-ugly gst-plugins-bad gst-plugins-base gst-plugins-good gst-libav
  sudo pacman -Suy --needed --noconfirm neovim clang ninja cmake dotnet-sdk wget curl openssh docker docker-compose ufw fastfetch
  sudo pacman -Suy --needed --noconfirm hyprland waybar ranger bashtop gammastep slurp grim xwaylandvideobridge xdg-desktop-portal-hyprland wl-clipboard alacritty nautilus gnome-boxes gnome-tweaks fragments loupe totem rofi-wayland pavucontrol
  sudo pacman -Suy --needed --noconfirm firefox chromium gimp obs-studio kdenlive lmms libreoffice
COMMENT

<<COMMENT
  sudo pacman -Suy --needed --noconfirm flatpak
  flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  flatpak install flathub org.upscayl.Upscayl com.valvesoftware.Steam com.heroicgameslauncher.hgl com.usebottles.bottles -y
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

# Setting up init system
sudo systemctl enable NetworkManager ufw sshd docker
sudo usermod -aG docker $USER

<<COMMENT
  code --install-extension asvetliakov.vscode-neovim
  code --install-extension eamodio.gitlens
  code --install-extension github.github-vscode-theme
  code --install-extension ms-vscode.vscode-typescript-next
  code --install-extension bradlc.vscode-tailwindcss
  code --install-extension dart-code.flutter
  code --install-extension ms-dotnettools.csdevkit
  code --install-extension ms-vscode.cpptools
  code --install-extension ms-vsliveshare.vsliveshare
  code --install-extension esbenp.prettier-vscode
  code --install-extension foxundermoon.shell-format
  code --install-extension sumneko.lua
  code --install-extension lkrms.inifmt
  code --install-extension visualstudioexptteam.vscodeintellicode
  code --install-extension ms-dotnettools.vscodeintellicode-csharp
COMMENT
