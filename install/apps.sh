#!/usr/bin/env bash

echo -e "\\n\\nUpdating and Upgrading"
sudo apt update && sudo apt upgrade -y

echo -e "\\n\\nAdding PPA"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update

echo -e "\\n\\nInstalling application"

apt install ack -y
apt install bat -y
apt install cmake -y
apt install curl -y
apt install exuberant-ctags -y
apt install grep -y
apt install highlight -y
apt install htop -y
apt install hub -y
apt install kitty -y
apt install neofetch -y
apt install neovim -y
apt install ngrep -y
apt install python3 -y
apt install python3-pip -y
apt install ripgrep -y
apt install silversearcher-ag -y
apt install tmux -y
apt install vim -y
apt install wget -y
apt install xclip -y
apt install zsh -y

echo -e "\\n\\nInstalling FZF"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

echo -e "\\n\\nInstalling python for neovim"
python3 -m pip install --upgrade pynvim

echo -e "\\n\\nInstalling nodejs with nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | sh

echo "Installing tmux plugins manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux

echo "Installing Fonts"
sudo fc-cache -f -v

