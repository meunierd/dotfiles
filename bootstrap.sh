#!/bin/sh

ln -f -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -f -s ~/dotfiles/.pryrc ~/.pryrc

sh ~/dotfiles/bootstrap/apt.sh
sh ~/dotfiles/bootstrap/zsh.sh
sh ~/dotfiles/bootstrap/nvim.sh
sh ~/dotfiles/bootstrap/tmux.sh
sh ~/dotfiles/bootstrap/lazygit.sh
