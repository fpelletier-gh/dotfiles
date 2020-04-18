DOTFILES=${HOME}/.dotfiles

# Arguments to pass to make
linux: linuxrepo debian neovim tmuxTmp googleChrome

googleChrome:
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome-stable_current_amd64.deb

linuxfzf:
	sudo mkdir -p /usr/local/opt
	sudo chown -R $$(whoami) /usr/local/opt
	sudo chmod -R 775 /usr/local/opt
	git clone --depth 1 https://github.com/junegunn/fzf.git /usr/local/opt/fzf
	/usr/local/opt/fzf/install

neovim:
	python3 -m pip install --upgrade pynvim

tmuxTpm:
    git clone https://github.com/tmux-plugins/tpm ~/.dotfiles/.tmux.symlink/plugins/tpm

linuxrepo:
    sudo add-apt-repository ppa:neovim-ppa/unstable
	sudo add-apt-repository ppa:lazygit-team/release
	sudo apt-get update

debian:
	sudo apt install \
		ack \
		bat \
		cabextract \
		cmake \
		exuberant-ctags \
        fzf \
		gcc \
		gnupg \
		grep \
		highlight \
		htop \
		hub \
		kitty \
		lazygit \
		mono-devel \
		neofetch \
		neovim \
		ngrep \
		python-dev \
		python-pip \
		python3-dev \
		python3-pip \
		ripgrep \
		ruby2.5 \
		ruby2.5-dev \
		silversearcher-ag \
		calibre \
		tmux \
		vim \
		xclip \
		zsh

nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | sh
