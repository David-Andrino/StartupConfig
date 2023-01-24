#!/bin/bash
apt update && apt upgrade -y
apt install -y git neovim clangd wget openjdk-19-jdk code unzip

# Install nodejs
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
apt-get install -y nodejs

# Install Plug
if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
		   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
nvim +'PlugInstall' +qall

# Install Git config 
cd /tmp/
git clone https://github.com/soraspades/startupconfig
cd StartupConfig
cp -r nvim/* ~/.config/nvim/
