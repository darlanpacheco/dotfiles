#!/bin/bash

read -p "username: " USERNAME
USERHOME="/home/${USERNAME}"
LOCKFILE=${USERHOME}/.boot_done
DIR=$(pwd)

useradd -mG wheel -s /bin/bash "${USERNAME}"
passwd "${USERNAME}"
echo "root password:"
passwd

cat <<EOF >>/etc/sudoers
${USERNAME} ALL=(ALL:ALL) ALL
EOF
cat <<EOF >>/etc/pacman.conf
[multilib]
Include = /etc/pacman.d/mirrorlist
EOF

pacman -Syu --needed papirus-icon-theme adw-gtk-theme breeze5 ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts noto-fonts-cjk noto-fonts-emoji
pacman -Syu --needed efibootmgr grub networkmanager pipewire-pulse jack2 vulkan-radeon lib32-vulkan-radeon wine wine-mono libappimage unzip gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad gst-plugins-ugly
pacman -Syu --needed xdg-desktop-portal-hyprland xdg-desktop-portal-gtk wayland flatpak gammastep slurp grim chafa ollama ranger wl-clipboard openssh ufw fastfetch docker docker-compose hyprpicker
pacman -Syu --needed hyprland waybar gnome-disk-utility gnome-system-monitor alacritty nautilus rofi pavucontrol krita chromium mangohud
pacman -Syu --needed neovim git gcc mingw-w64-gcc clang zig zls rust-analyzer shfmt nodejs npm lua-language-server stylua python python-virtualenv python-black

grub-install
grub-mkconfig -o /boot/grub/grub.cfg

sudo -u "${USERNAME}" bash <<EOF
git clone https://github.com/darlanpacheco/dotfiles.git ${USERHOME}/dotfiles
cp -r ${USERHOME}/dotfiles/.[!.]* ${USERHOME}/
cp -r ${USERHOME}/dotfiles/* ${USERHOME}/
rm -rf ${USERHOME}/.git

cp -r /usr/share/themes ${USERHOME}/.themes
flatpak override --user --env=GTK_THEME=adw-gtk3-dark
flatpak override --user --filesystem=${USERHOME}/.themes
EOF

cat <<EOF >${USERHOME}/alacritty.sh
#!/bin/bash

mkdir -p ${USERHOME}/Desktop ${USERHOME}/Documents ${USERHOME}/Downloads ${USERHOME}/Music ${USERHOME}/Projects ${USERHOME}/Videos
mkdir -p ${USERHOME}/.local/npm

sudo systemctl enable --now NetworkManager ufw sshd
sudo systemctl start ollama

flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub net.lutris.Lutris com.valvesoftware.Steam com.heroicgameslauncher.hgl org.vinegarhq.Sober -y
flatpak install flathub org.gnome.baobab org.gnome.font-viewer org.gnome.Totem org.gnome.Loupe org.gnome.Decibels org.gnome.Boxes de.haeckerfelix.Fragments -y
flatpak install flathub org.mozilla.firefox org.vinegarhq.Vinegar org.libreoffice.LibreOffice org.inkscape.Inkscape org.gimp.GIMP com.github.libresprite.LibreSprite org.blender.Blender io.lmms.LMMS com.obsproject.Studio org.localsend.localsend_app -y

npm config set prefix ${USERHOME}/.local/npm
npm install -g bash-language-server typescript typescript-language-server vscode-langservers-extracted @tailwindcss/language-server prettier pyright

ollama pull llama3.2
ollama pull codellama

sudo ufw allow http
sudo ufw allow https
sudo ufw limit ssh
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

ssh-keygen -t ed25519 -C "darlanpacheco@proton.me"

exec ${SHELL}
EOF
cat <<EOF >${USERHOME}/boot.sh
#!/bin/bash

if [ -f "${LOCKFILE}" ]; then
  firefox
else
  touch "${LOCKFILE}"
  alacritty -e ${USERHOME}/alacritty.sh
fi
EOF

chmod +x ${USERHOME}/alacritty.sh
chmod +x ${USERHOME}/boot.sh
