#!/bin/sh

ln -f -s ~/dotfiles/.config/astronvim ~/.config/astronvim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
nvim --headless -c 'qall'
