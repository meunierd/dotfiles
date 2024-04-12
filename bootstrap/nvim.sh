#!/bin/sh

ln -s ~/src/dotfiles/.config/nvim ~/.config/nvim
nvim --headless -c 'qall'
