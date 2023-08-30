#! /bin/bash

# Install dependencies
sudo apt install -y curl ripgrep xsel wl-clipboard tmux dconf-editor git npm python3-venv

pip3 install pynvim

# Install nodejs
sudo npm install -g neovim

# Clone neovim
../
git clone https://github.com/neovim/neovim.git

# checkout commit with solid symantic highlighting 
git checkout 09b6a68c3700aa5d8ae26a62896b091572ae0a8d

# Build neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo

# Install neovim
sudo make install
