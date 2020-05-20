#!/usr/bin/env bash

echo -e "\\n\\nUpdating and Upgrading"
sudo apt update && sudo apt upgrade -y

echo -e "\\n\\nAdding PPA"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update

echo -e "\\n\\nInstalling application"

sudo apt install ack -y
sudo apt install bat -y
sudo apt install cmake -y
sudo apt install curl -y
sudo apt install exuberant-ctags -y
sudo apt install grep -y
sudo apt install highlight -y
sudo apt install htop -y
sudo apt install hub -y
sudo apt install kitty -y
sudo apt install neofetch -y
sudo apt install neovim -y
sudo apt install ngrep -y
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt install ripgrep -y
sudo apt install silversearcher-ag -y
sudo apt install tmux -y
sudo apt install vim -y
sudo apt install wget -y
sudo apt install xclip -y
sudo apt install zsh -y

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

