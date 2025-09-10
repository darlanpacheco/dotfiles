#!/bin/bash

mkdir -p ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Projects ~/Videos ~/Retro

sudo ufw allow http
sudo ufw allow https
sudo ufw limit ssh
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

ssh-keygen -t ed25519 -C "darlanpacheco@proton.me"

cd
git clone https://github.com/darlanpacheco/dotfiles.git
cp -r dotfiles/.* ~/
rm -rf ~/.git

cp -r /usr/share/themes $HOME/.themes
flatpak override --user --env=GTK_THEME=adw-gtk3-dark
flatpak override --user --filesystem=$HOME/.themes

systemctl start ollama
systemctl enable --now ufw sshd docker
systemctl enable --now NetworkManager

ollama pull llama3.2
ollama pull codellama
