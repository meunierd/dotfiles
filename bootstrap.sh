sudo apt-get install -y nodejs ripgrep neovim fzf

cp -r ~/dotfiles/.config/nvim ~/.config
cp ~/dotfiles/.tmux.conf ~
cp ~/dotfiles/.zshrc ~/.zshrc

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

nvim --headless +PlugInstall +qa
tmux source ~/.tmux.conf
