sudo add-apt-repository ppa:neovim-ppa/unstable
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

ln -f -s ~/dotfiles/.config/nvim ~/.config/nvim 
ln -f -s ~/dotfiles/.zshrc ~/.zshrc
ln -f -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -f -s ~/dotfiles/.pryrc ~/.pryrc

sudo -u spin nvim --headless +PlugInstall +qa
