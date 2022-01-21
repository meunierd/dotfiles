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

ln -f -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -f -s ~/dotfiles/.zshrc ~/.zshrc
ln -f -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -f -s ~/dotfiles/.pryrc ~/.pryrc

sudo -u spin nvim --headless +PlugInstall +qa

sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

