if ! command -v rg &> /dev/null; then
		sudo apt-get install -y ripgrep
fi

if ! command -v nvim &> /dev/null; then
		sudo apt-get install -y neovim
fi

cp -r ~/dotfiles/.config/nvim ~/.config
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
