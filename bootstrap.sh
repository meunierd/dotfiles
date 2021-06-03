sudo apt-get install -y \
	fzf \
	mycli \
	neovim \
	nodejs \
	ripgrep \
	exuberant-ctags

ln -f -s ~/dotfiles/.config/nvim ~/.config/nvim 
ln -f -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -f -s ~/dotfiles/.zshrc ~/.zshrc
ln -f -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -f -s ~/dotfiles/.pryrc ~/.pryrc

nvim --headless +PlugInstall +qa
tmux source ~/.tmux.conf
