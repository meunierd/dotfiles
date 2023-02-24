#!/bin/sh
ln -f -s ~/dotfiles/.zshrc ~/.zshrc
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --yes
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
zsh -c 'source ~/.zshrc && zplug install'
