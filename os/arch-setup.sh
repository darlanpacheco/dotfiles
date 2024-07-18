mkdir -p ~/Desktop ~/Documents ~/Downloads ~/Music ~/Paths ~/Pictures ~/Projects ~/Science ~/Videos ~/.themes

sudo nvim /etc/pacman.conf

<<COMMENT
  sudo pacman -Suy --needed --noconfirm papirus-icon-theme ttf-ubuntu-font-family ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji
  sudo pacman -Suy --needed --noconfirm cmake vulkan-radeon lib32-vulkan-radeon libappimage gstreamer gst-plugins-ugly gst-plugins-bad gst-plugins-base gst-plugins-good gst-libav
  sudo pacman -Suy --needed --noconfirm starship exa bat ripgrep xxd wget curl ollama openssh docker docker-compose ufw fastfetch
  sudo pacman -Suy --needed --noconfirm hyprland waybar swaybg gammastep flameshot grim xwaylandvideobridge xdg-desktop-portal-hyprland tmux alacritty wl-clipboard gnome-console gnome-boxes gnome-tweaks nautilus loupe totem xfce4-appfinder pavucontrol
  sudo pacman -Suy --needed --noconfirm firefox-developer-edition gimp obs-studio kdenlive
COMMENT

<<COMMENT
  sudo pacman -Suy --needed --noconfirm flatpak
  sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
  sudo flatpak install flathub org.upscayl.Upscayl -y
COMMENT

# Git configurations
git config --global user.name "Darlan Pacheco"
git config --global user.email "143919135+darlanpacheco@users.noreply.github.com"
git config --global core.editor "nvim"

# Firewall configurations
sudo ufw allow http
sudo ufw allow https
sudo ufw limit ssh
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

# Setting up OS
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
cp -r ../.bashrc ~/
cp -r ../.tmux.conf ~/
cp -r ../.config/ ~/
sudo rm -rf /usr/share/hyprland/

# Setting up init system
sudo systemctl enable NetworkManager ufw ollama sshd docker
sudo usermod -aG docker $USER
