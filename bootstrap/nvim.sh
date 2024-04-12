#!/bin/sh

ln -s ~/dotfiles/.config/nvim ~/.config/nvim
nvim --headless -c 'qall'
