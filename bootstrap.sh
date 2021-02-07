sudo apt-get install -y nodejs ripgrep neovim fzf

ln -f -s ~/dotfiles/.config/nvim ~/.config
ln -f -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -f -s ~/dotfiles/.zshrc ~/.zshrc

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim --headless +PlugInstall +qa
tmux source ~/.tmux.conf
