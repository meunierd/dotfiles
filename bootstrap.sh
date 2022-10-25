sudo add-apt-repository ppa:jgmath2000/et --yes
sudo apt-get update
sudo apt-get install -y \
	et \
	fzf \
	mycli \
	nodejs \
	ripgrep \
	zsh-syntax-highlighting \
	exuberant-ctags

sudo systemctl enable --now et.service

sudo npm install -g gtop

# zsh stuff
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

sudo curl 'https://github.com/neovim/neovim/releases/download/v0.8.0/nvim.appimage' -o /usr/local/bin/nvim
chmod +x /usr/local/bin/nvim

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
ln -f -s ~/dotfiles/.zshrc ~/.zshrc
ln -f -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -f -s ~/dotfiles/.pryrc ~/.pryrc

wget 'https://github.com/dandavison/delta/releases/download/0.13.0/git-delta_0.13.0_amd64.deb'
sudo dpkg -i 'git-delta_0.13.0_amd64.deb'
rm 'git-delta_0.13.0_amd64.deb'

# plugins
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' -c 'qa'
zsh -c 'source ~/.zshrc && zplug install'
echo "Done"
