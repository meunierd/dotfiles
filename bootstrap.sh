sudo apt-get install -y \
	nodejs \
	ripgrep \
	neovim \
	fzf \
	exuberant-ctags

ln -f -s ~/dotfiles/.config/nvim ~/.config/nvim 
ln -f -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -f -s ~/dotfiles/.zshrc ~/.zshrc

nvim --headless +PlugInstall +qa
tmux source ~/.tmux.conf
