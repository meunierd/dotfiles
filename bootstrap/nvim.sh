#!/bin/sh

ln -f -s ~/dotfiles/.config/astronvim ~/.config/astronvim
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

# bootstrap astronvim
sudo -u spin nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
# user plugins
sudo -u spin nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
