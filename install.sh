#!/bin/bash

apt update && apt upgrade -y

# Install nodejs
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
apt-get install -y nodejs

# Install neovim and move init.vim to folder
apt install -y neovim clangd
mkdir -p ~/.config/nvim
mv ./init.vim ~/.config/nvim/init.vim

# Install Plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
nvim +'PlugInstall' +qall
