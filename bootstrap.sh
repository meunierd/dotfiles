sudo add-apt-repository ppa:neovim-ppa/unstable --yes
sudo add-apt-repository ppa:jgmath2000/et --yes
sudo apt-get update
sudo apt-get install -y \
	et \
	fzf \
	mycli \
	neovim \
	nodejs \
	ripgrep \
	zsh-syntax-highlighting \
	exuberant-ctags

sudo systemctl enable --now et.service

sudo npm install -g gtop

# zsh stuff
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
ln -f -s ~/dotfiles/.zshrc ~/.zshrc
ln -f -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -f -s ~/dotfiles/.pryrc ~/.pryrc

wget 'https://github.com/dandavison/delta/releases/download/0.13.0/git-delta_0.13.0_amd64.deb'
sudo dpkg -i 'git-delta_0.13.0_amd64.deb'
rm 'git-delta_0.13.0_amd64.deb'

# plugins
sudo -u spin nvim --headless +PackerSync +qa
zsh -c 'source ~/.zshrc && zplug install'
echo "Done"
