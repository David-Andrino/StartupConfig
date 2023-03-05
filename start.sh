#!/bin/bash

# Initial Declarations
install_packages="build-essential wget zsh neovim gh tmux alacritty npm"
ubuntu_nf_url="https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/UbuntuMono.zip"

# Enforce root
if [[ "$UID" > 0 ]]
then
  echo "Must be root to run this script."
  exit $E_NOTROOT
fi  

# Install add-apt-repository, curl, git
sudo apt update && sudo apt upgrade -y
sudo apt install software-properties-common curl git

# Install gh cli
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

# Add neovim, alacritty ppa
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo add-apt-repository ppa:aslatter/ppa -y

# Update, upgrade and install packages
sudo apt update && sudo apt upgrade -y
sudo apt install -y $install_packages

# Clone repo into /tmp
cd /tmp
git clone https://github.com/soraspades/startupconfig /tmp/startupconfig

# Install Ubuntu NF
wget $ubuntu_nf_url -P /tmp
unzip /tmp/UbuntuMono.zip -d /tmp
rm -rf ~/.local/share/fonts/UbuntuMono
mkdir -p ~/.local/share/fonts/UbuntuMono
mv /tmp/*.ttf ~/.local/share/fonts/UbuntuMono

# Configure nvim
rm -rf ~/.config/nvim
mkdir -p ~/.config/nvim
cp -rf /tmp/startupconfig/nvim ~/.config/

# Configure alacritty
rm -rf ~/.config/alacritty
mkdir -p ~/.config/alacritty
cp -rf /tmp/startupconfig/alacritty ~/.config/

# Install oh-my-zsh and plugins
rm -rf "${ZSH_CUSTOM:-$HOME}/.oh-my-zsh/"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
rm -rf ~/.fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all

# Change line beggining with ZSH_THEME to ZSH_THEME="powerlevel10k/powerlevel10k" in ~/.zshrc
sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc

# Set current user default terminal to zsh
chsh -s $(which zsh)

# Clean /tmp
rm -rf /tmp/* 2> /dev/null