sudo add-apt-repository ppa:neovim-ppa/unstable --yes
sudo apt-get update
sudo apt-get install -y \
	fzf \
	mycli \
	neovim \
	nodejs \
	ripgrep \
	zsh-syntax-highlighting \
	exuberant-ctags

sudo npm install -g gtop

gpgconf --launch dirmngr
gpg --keyserver keys.openpgp.org --recv 2D5F226F27773C462DDB865254E6FDFBDBBF2970

ln -f -s ~/dotfiles/.config/nvim ~/.config/nvim
ln -f -s ~/dotfiles/.zshrc ~/.zshrc
ln -f -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -f -s ~/dotfiles/.pryrc ~/.pryrc

sudo -u spin nvim --headless +PlugInstall +qa

sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes

