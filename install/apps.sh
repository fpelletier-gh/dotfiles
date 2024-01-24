#!/usr/bin/env bash

echo -e "\\n\\nUpdating and Upgrading\\n"
sudo apt update -y && sudo apt upgrade -y

echo -e "\\n\\nAdding neovim nightly PPA\\n"
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt update

echo -e "\\n\\nAdding Github cli\\n"
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update

echo -e "\\n\\nInstalling application\\n"

declare -a apt_list=(
"ack"
"bat"
"cargo"
"cat"
"cmake"
"curl"
"fd-find"
"fzf"
"gh"
"grep"
"highlight"
"htop"
"neofetch"
"neovim"
"ngrep"
"python3"
"python3-pip"
"python3-venv"
"ripgrep"
"silversearcher-ag"
"tmux"
"unzip"
"vim"
"wget"
"wslu"
"zsh"
)

for apt in "${apt_list[@]}"
do
   echo -e "\\n\\nInstalling $apt\\n"
   sudo apt install $apt -y
done

echo -e "\\n\\nInstalling Z\\n"
git clone https://github.com/rupa/z.git ~/z
touch ~/.z

echo -e "\\n\\nAuthenticating to github\\n"
gh auth login

echo -e "\\n\\nInstalling Docker engine\\n"
# https://docs.docker.com/engine/install/ubuntu/
sudo apt install -y ca-certificates curl gnupg lsb-release
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update -y
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo service docker start
sudo docker run hello-world

echo -e "\\n\\nInstalling python for neovim\\n"
python3 -m pip install --upgrade pynvim

echo -e "\\n\\nInstalling nodejs with nvm\\n"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
source ~/.bashrc
nvm install node
npm install -g prettier

echo -e "\\n\\nInstalling tmux plugins manager\\n"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo -e "\\n\\nInstalling Win32yank\\n"
cp ./win32yank.exe /home/francis/.local/bin

if ! [[ $(uname -r) =~ WSL ]]; then
  echo -e "\\n\\nInstalling Fonts\\n"
  sudo fc-cache -f -v
fi

echo -e "\\n\\nInstalling Stylua\\n"
cargo install stylua
