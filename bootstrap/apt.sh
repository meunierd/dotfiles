sudo add-apt-repository ppa:jgmath2000/et --yes
sudo apt-get update
sudo apt-get install -y \
	et \
	fzf \
	mycli \
	nodejs \
	ripgrep \
	zsh-syntax-highlighting \
	exuberant-ctags
systemctl enable et
systemctl start et

