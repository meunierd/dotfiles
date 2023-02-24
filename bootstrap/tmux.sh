#!/bin/sh

ln -f -s ~/dotfiles/.tmux.conf ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
sudo -u spin ~/.tmux/plugins/tpm/bin/install_plugins
