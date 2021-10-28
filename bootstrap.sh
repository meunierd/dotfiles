sudo apt-get install -y \
	fzf \
	mycli \
	neovim \
	nodejs \
	ripgrep \
	zsh-syntax-hightlighting \
	exuberant-ctags

ln -f -s ~/dotfiles/.config/nvim ~/.config/nvim 
ln -f -s ~/dotfiles/.zshrc ~/.zshrc
ln -f -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -f -s ~/dotfiles/.pryrc ~/.pryrc

sudo -u spin nvim --headless +PlugInstall +qa
