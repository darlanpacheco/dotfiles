mkdir -p ~/Desktop ~/Documents ~/Downloads ~/Music ~/Pictures ~/Projects ~/Videos

sudo ufw allow http
sudo ufw allow https
sudo ufw limit ssh
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw enable

sudo systemctl enable ufw sshd docker
sudo usermod -aG docker $USER

git config --global user.name "Darlan Pacheco"
git config --global user.email "darlanpacheco@proton.me"

ssh-keygen -t ed25519 -C "darlanpacheco@proton.me"

cp -r ../.* ~/
rm -rf ~/.git
git clone https://github.com/darlanpacheco/neovim.git ~/.config/nvim

sudo systemctl enable --now ollama

ollama pull llama3.2
ollama pull codellama
