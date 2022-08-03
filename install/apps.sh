#!/usr/bin/env bash

echo -e "\\n\\nUpdating and Upgrading"
sudo apt update && sudo apt upgrade -y

echo -e "\\n\\nAdding neovim nightly PPA"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

echo -e "\\n\\nAdding Github cli"
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update

echo -e "\\n\\nInstalling application"

sudo apt install ack -y
sudo apt install bat -y
sudo apt install cargo -y
sudo apt install cmake -y
sudo apt install curl -y
sudo apt install exuberant-ctags -y
sudo apt install fzf -y
sudo apt install gh -y
sudo apt install grep -y
sudo apt install highlight -y
sudo apt install htop -y
sudo apt install neofetch -y
sudo apt install neovim -y
sudo apt install ngrep -y
sudo apt install python3 -y
sudo apt install python3-pip -y
sudo apt install python3-venv -y
sudo apt install ripgrep -y
sudo apt install silversearcher-ag -y
sudo apt install tmux -y
sudo apt install unzip -y
sudo apt install vim -y
sudo apt install wget -y
sudo apt install zsh -y

echo -e "\\n\\nInstalling Z"
git clone https://github.com/rupa/z.git ~/z
touch ~/.z

echo -e "\\n\\nInstalling python for neovim"
python3 -m pip install --upgrade pynvim

echo -e "\\n\\nInstalling nodejs with nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | sh &&
nvm install --lts

echo -e "\\n\\nInstalling tmux plugins manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo -e "\\n\\nInstalling Win32yank"
cp ./win32yank.exe /home/francis/.local/bin

echo -e "\\n\\nInstalling Fonts"
sudo fc-cache -f -v

echo -e "\\n\\nInstalling Stylua"
cargo install stylua

# echo -e "\\n\\nInstalling virtualenvwrapper"
# pip3 install virtualenvwrapper
# export WORKON_HOME=~/Envs
# mkdir -p $WORKON_HOME
# source /home/francis/.local/bin/virtualenvwrapper.sh
