#!/bin/sh

ln -f -s ~/dotfiles/.config/astronvim ~/.config/astronvim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim

nvim  --headless -c 'autocmd User LazyDone quitall'

