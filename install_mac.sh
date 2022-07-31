#! /bin/bash

git submodule update --init

# Latest neovim
curl -LO https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-macos.tar.gz
tar xzvf nvim-macos.tar.gz

pip3 install pynvim

# Copy over tmux config
cp .tmux.conf ~/.tmux.conf

# Apply my patch to public repo 
cd nvim-basic-ide/
git apply ../nvim-basic.patch
cd ..

# Copy over nvim config
mkdir ~/.config/nvim
cp -R nvim-basic-ide/. ~/.config/nvim

exit(0)

# Download nerd font
mkdir -p ~/.local/share/fonts
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Ubuntu.zip
unzip Ubuntu.zip -d ~/.local/share/fonts/
fc-cache -fv

# Source the fonts for current and all sessions
wget https://raw.githubusercontent.com/ryanoasis/nerd-fonts/master/bin/scripts/lib/i_linux.sh
mv i_linux.sh ~/.local/share/fonts/i_linux.sh
source ~/.local/share/fonts/i_linux.sh

# TODO check if already in bachrc
echo "source ~/.local/share/fonts/i_linux.sh" >> ~/.bashrc



